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
module credit_manager
# (
   parameter ST_MAX_CREDIT = 256,
   parameter ST_DATA_W = 32,
   parameter ST_CREDIT_W = 9,
   parameter FIFO_DEPTH = 16
) 
(
   input                         clk,
   input                         reset,

   output reg                    sink_update,
   output reg [ST_CREDIT_W-1:0]  sink_credit,

   input [ST_DATA_W-1:0]         sink_data,
   input                         sink_valid,

   output                        src_valid,
   output [ST_DATA_W-1:0]        src_data,

   input                         data_fifo_read,
   input                         sink_return_credit
             
);

   localparam INITIAL_CREDIT = (ST_MAX_CREDIT >= FIFO_DEPTH) ? FIFO_DEPTH : ST_MAX_CREDIT;

   wire [ST_CREDIT_W-1:0] runtime_max_credit;

   generate 
      if(ST_CREDIT_W == 1) begin
         assign runtime_max_credit = 1'b1;
      end
      else begin
         assign runtime_max_credit = {{ST_CREDIT_W-2{1'b0}}, 2'h2};
      end
   endgenerate

   reg internal_sclr;
   always @ (posedge clk) begin
      internal_sclr <= reset;
   end

   reg [15:0] reset_cycle_counter;

   wire [ST_DATA_W - 1 : 0] fifo_out_payload;
   wire                        fifo_out_valid;
   wire                        int_fifo_read;

   hld_fifo        #(
       .WIDTH                        (ST_DATA_W        ),
       .DEPTH                        (FIFO_DEPTH       ),
       .ALMOST_EMPTY_CUTOFF          (1                ),
       .ALMOST_FULL_CUTOFF           (FIFO_DEPTH/2 +3  ),
       .INITIAL_OCCUPANCY            (0                ),
       .ASYNC_RESET                  (0                ),
       .SYNCHRONIZE_RESET            (0                ),
       .RESET_EVERYTHING             (0                ),
       .RESET_EXTERNALLY_HELD        (1                ),
       .STALL_IN_EARLINESS           (0                ), // test for timing
       .VALID_IN_EARLINESS           (0                ),
       .STALL_IN_OUTSIDE_REGS        (0                ),
       .VALID_IN_OUTSIDE_REGS        (0                ),
       .REGISTERED_DATA_OUT_COUNT    (0                ),
       .NEVER_OVERFLOWS              (1                ), 
       .MAX_SLICE_WIDTH              (0                ),
       .HOLD_DATA_OUT_WHEN_EMPTY     (0                ),
       .WRITE_AND_READ_DURING_FULL   (0                ),
       .USE_STALL_LATENCY_UPSTREAM   (0                ),
       .USE_STALL_LATENCY_DOWNSTREAM (0                ),
       .RAM_BLOCK_TYPE               ("FIFO_TO_CHOOSE" ),
       .STYLE                        ("hs"             ),
       .enable_ecc                   ("FALSE"          ) 
   ) hld_data_fifo_inst (
           
       .clock          (clk               ), 
       .resetn         (~reset            ), 
       .i_valid        (sink_valid        ),        // upstream has data, fifo IS ALLOWED to consume it                             | upstream has data, fifo MUST consume it or data will be lost   | N/A
       .i_data         (sink_data         ),         // data from upstream, synced with i_valid delayed by VALID_IN_EARLINESS clocks | <-- same behavior                                              | N/A
       .o_stall        (                  ),        // backpressure to upstream, fifo is full                                       | backpressure to upstream, fifo is almost full                  | 1
       .o_almost_full  (                  ),  // fifo is almost full, hint to upstream of potential future backpressure       | NOT USED, do not consume this output signal                    | 1
       .o_valid        (fifo_out_valid    ),        // fifo has data, downstream IS ALLOWED to consume it                           | fifo has data, downstream MUST consume it or data will be lost | 0
       .o_data         (fifo_out_payload  ),         // data to downstream, synced with o_valid                                      | <-- same behavior                                              | x
       .i_stall        (~int_fifo_read    ),        // backpressure from downstream STALL_IN_EARLINESS clocks ahead of time         | <-- same behavior                                              | N/A
       .o_almost_empty (                  ), // fifo is almost empty, hint to downstream of potential future fifo emptiness  | <-- same behavior                                              | 1
       .o_empty        (                  ),        // fifo is empty right now                                                      | <-- same behavior                                              | 1
       .ecc_err_status (                  )
   );

   altera_avalon_st_pipeline_base #(
      .SYMBOLS_PER_BEAT       (1),
      .BITS_PER_SYMBOL        (ST_DATA_W),
      .PIPELINE_READY         (1),
      .SYNC_RESET             (1)
   ) pipe_inst (
      .clk(clk),
      .reset(reset),

      .in_ready      (int_fifo_read),
      .in_valid      (fifo_out_valid),
      .in_data       (fifo_out_payload),

      .out_ready     (data_fifo_read),
      .out_valid     (src_valid),
      .out_data      (src_data)

   );

   always @ (posedge clk) begin
      if(internal_sclr) begin
         reset_cycle_counter <= 16'h1;
      end
      else begin
         reset_cycle_counter <= reset_cycle_counter << 1'b1;
      end
   end

   always @ (posedge clk) begin
      if(internal_sclr) begin
         sink_update <= 1'b0;
         sink_credit <= 'b0;
      end
      else begin
         if(reset_cycle_counter[15] == 1'b1) begin
            sink_update <= 1'b1;
            sink_credit <= INITIAL_CREDIT; 
         end
         else if(int_fifo_read && fifo_out_valid && sink_return_credit) begin
            sink_update <= 1'b1;
            sink_credit <= runtime_max_credit;
         end
         else if((int_fifo_read && fifo_out_valid) || sink_return_credit) begin
            sink_update <= 1'b1;
            sink_credit <= {{ST_CREDIT_W-1{1'b0}}, 1'b1};
         end
         else begin
            sink_update <= 1'b0;
            sink_credit <= {ST_CREDIT_W{1'b0}};
         end
      end
   end

endmodule
`default_nettype none
