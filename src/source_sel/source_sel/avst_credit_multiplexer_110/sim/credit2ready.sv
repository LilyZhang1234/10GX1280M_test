// (C) 2001-2021 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


`timescale 1 ns / 1 ns

module credit2ready
# (
   parameter ST_CREDIT_W = 9
)
(
   input                         clk,
   input                         reset,

   input                         src_update,
   input  [ST_CREDIT_W-1:0]      src_credit,

   input                         sink_valid,
   output reg                    src_ready
);

  // if CRD_W in < 3 fix it to 3 since max compare value is 5 (3 bits)
  localparam WIDTH_CMP          = (ST_CREDIT_W <3) ? 3 : ST_CREDIT_W;

   reg internal_sclr;
   always @ (posedge clk) begin
      internal_sclr <= reset;
   end


   logic [ST_CREDIT_W-1:0] credit_for_sink;
   logic [ST_CREDIT_W-1:0] inc_credit_sink;

   enum logic [2:0] {
      IDLE, CREDIT_AVAILABLE, WAIT_0, WAIT_1,WAIT_2,WAIT_3,WAIT_4, ALMOST_ZERO
   }  state, next_state;
   
   logic credit_of_4_delay1,credit_of_4_delay2,credit_of_nonzero,credit_of_1_delay2,credit_of_gt4_delay1;
   
   
   always @ (posedge clk)
       if (sink_valid & src_update)
           inc_credit_sink <= src_credit + {ST_CREDIT_W{1'b1}}; // inc_credit -1
       else if (src_update)
           inc_credit_sink <= src_credit; 
       else if (sink_valid) 
           inc_credit_sink <= {ST_CREDIT_W{1'b1}};  // -1
       else 
           inc_credit_sink <= {ST_CREDIT_W{1'b0}};
   
   
   // credit_for_sink has delay of 2 cycles compared to current value of credit
   // available for sink
   
   always @ (posedge clk)
       if (internal_sclr)
           credit_for_sink <= {ST_CREDIT_W{1'b0}};        
       else 
           credit_for_sink <= credit_for_sink + inc_credit_sink;

  // may need to pad zeros in case credit_for_src width < 3
  logic [WIDTH_CMP-1:0] credit_for_sink_cmp;
  generate 
      if (ST_CREDIT_W==1)
          assign credit_for_sink_cmp = {2'b0,credit_for_sink};
      else if (ST_CREDIT_W==2)
          assign credit_for_sink_cmp = {1'b0,credit_for_sink};
      else              
          assign credit_for_sink_cmp = credit_for_sink;
  endgenerate
   
   pipelined_compare_eq #(
       .WIDTH(WIDTH_CMP),
       .PIPE_STAGES(1)
   ) pipelined_compare_eq_4  (
       .clock     (clk),
       .data_a    (credit_for_sink_cmp),
       .data_b    (4),
       .equal     (credit_of_4_delay1),
       .not_equal ()    
   );
   
   pipelined_compare_eq #(
       .WIDTH(WIDTH_CMP),
       .PIPE_STAGES(1)
   ) pipelined_compare_gt4   (
       .clock     (clk),
       .data_a    (credit_for_sink_cmp),
       .data_b    (4),
       .a_gt_b    (credit_of_gt4_delay1),
       .not_equal ()    
   );
   
   pipelined_compare_eq #(
       .WIDTH(WIDTH_CMP),
       .PIPE_STAGES(1)
   ) pipelined_compare_eq_nonzero  (
       .clock     (clk),
       .data_a    (credit_for_sink_cmp),
       .data_b    (0),
       .equal     (),
       .not_equal (credit_of_nonzero)    
   );
   
   always @ (posedge clk)
       if (internal_sclr)
           state <= IDLE;
       else 
           state <= next_state;
   
   always_comb begin 
      case (state)
         IDLE : 
           next_state = WAIT_3;
         WAIT_3 :
            next_state = WAIT_2; 
         WAIT_2 :
            next_state = WAIT_1; 
         WAIT_1 :
            next_state = WAIT_0; 
         WAIT_0 :
            if (credit_of_gt4_delay1) 
               next_state = CREDIT_AVAILABLE;
            else if(credit_of_nonzero)
               next_state = ALMOST_ZERO;
            else
               next_state = IDLE;
         ALMOST_ZERO : 
            next_state = WAIT_3;
         CREDIT_AVAILABLE   : 
            if (credit_of_4_delay1)
               next_state = WAIT_3;
            else
               next_state = CREDIT_AVAILABLE;

          default : next_state = IDLE;
      endcase 
   end  
   
   always @ (posedge clk) begin
      src_ready <= (state == CREDIT_AVAILABLE) || (state == ALMOST_ZERO); 
   end   


endmodule

module pipelined_compare_eq #(
    parameter WIDTH = 8,
    parameter PIPE_STAGES = 2
) (
    input clock,
    input [WIDTH-1:0] data_a,
    input [WIDTH-1:0] data_b,
    output logic equal,
    output logic not_equal,   
    output logic a_gt_b    
);

   genvar i;
   generate 
       if (PIPE_STAGES ==0) begin
           assign equal = (data_a == data_b);     
           assign not_equal = (data_a ^ data_b);
           assign a_gt_b = (data_a > data_b);
       end 
       else if (PIPE_STAGES ==1) begin
           always @ (posedge clock) begin
               equal     <= (data_a == data_b);     
               not_equal <= (data_a != data_b);
               a_gt_b    <= (data_a > data_b);
           end    
       end 
       else begin
           logic [PIPE_STAGES-2:0] eq_part,neq_part;
           localparam DIV = WIDTH/(PIPE_STAGES-1);    
           for (i=0;i<=PIPE_STAGES-2;i=i+1) begin
               if (i==PIPE_STAGES-2) begin
                   always @ (posedge clock) begin
                       eq_part [i] <= (data_a[WIDTH-1:i*DIV] == data_b[WIDTH-1:i*DIV]);    
                       neq_part[i] <= (data_a[WIDTH-1:i*DIV] != data_b[WIDTH-1:i*DIV]);    
                   end    
               end
               else begin
                   always @ (posedge clock) begin
                       eq_part [i] <= (data_a[(i+1)*DIV-1:i*DIV] == data_b[(i+1)*DIV-1:i*DIV]);    
                       neq_part[i] <= (data_a[(i+1)*DIV-1:i*DIV] != data_b[(i+1)*DIV-1:i*DIV]);    
                   end    
               end

               always @ (posedge clock) begin
                   equal     <= &eq_part;
                   not_equal <= |neq_part;   
               end    
           end    
       end
   endgenerate

endmodule   

`default_nettype none
