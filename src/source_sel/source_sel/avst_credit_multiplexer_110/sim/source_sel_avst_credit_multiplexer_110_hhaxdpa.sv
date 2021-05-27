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

// ------------------------------------------
// Generation parameters:
//    output_name    :  source_sel_avst_credit_multiplexer_110_hhaxdpa
//    NUM_INPUTS     :  2
//    SRC_DATA_W     :  64
//    SRC_CREDIT_W   :  1
//    SRC_CHANNEL_W  :  1
// ------------------------------------------
module source_sel_avst_credit_multiplexer_110_hhaxdpa #(
   parameter SRC_MAX_CREDIT           = 1,
   parameter SRC_CRD_W                = 1,
   parameter SRC_SYMBOLS_PER_BEAT     = 4,
   parameter SRC_DATA_BITS_PER_SYMBOL = 16,
   parameter SRC_DATA_W               = 64,
   parameter SRC_CHANNEL_W            = 1,
   parameter SRC_ERROR_W              = 1,
   parameter SRC_EMPTY_W              = 1,
   parameter USE_ENCODING             = 0,
   parameter USE_INIT_HS              = 0,
   parameter USE_PACKETS              = 0,
   parameter USE_EMPTY                = 0,
   parameter USE_ERROR                = 0,
   parameter NUM_INPUTS               = 2,

   parameter SINK_USE_CHANNEL         = 0,
   parameter SINK_CHANNEL_W           = 2
) (

   // Source interface
   input [1-1:0]     src_in_credit,
   input                         src_in_update,

   output                        src_out_valid,
   output     [64-1:0]  src_out_data,
   output                        src_out_sop,
   output                        src_out_eop,
   output     [((USE_EMPTY && SRC_EMPTY_W>0)? 2-1:0):0] src_out_empty,
   output     [1-1:0]    src_out_channel,
   output     [((USE_ERROR)? 1-1:0):0]   src_out_error,

   input                         src_in_init,
   output                        src_out_init_ack,

   output                        src_out_ret_credit,
   
   input                      sink0_valid,
   input [64-1 : 0]  sink0_data,
   output [1-1:0] sink0_credit,
   output                     sink0_update,
   input                      sink0_ret_credit,
   input                      sink1_valid,
   input [64-1 : 0]  sink1_data,
   output [1-1:0] sink1_credit,
   output                     sink1_update,
   input                      sink1_ret_credit,

   
   
   
   

   input             clk,
   input             reset

);


   reg [1-1:0] src_append_ch;

   localparam PAYLOAD_W = 64;
   localparam USER_W = 0;
   localparam NUM_SINK = 2;

   reg internal_sclr;
   always @ (posedge clk) begin
      internal_sclr <= reset;
   end

   wire [64 - 1 : 0] credit_mgr_sink_data[2-1:0];
   wire [2 - 1: 0]    credit_mgr_sink_channel[2-1:0];
   wire [2-1:0]       credit_mgr_sink_sop;
   wire [2-1:0]       credit_mgr_sink_eop;
   wire [2-1:0]       credit_mgr_sink_valid;
   wire [2-1:0]       credit_mgr_sink_ret_credit;

   wire [1-1:0]   credit_mgr_sink_credit[2-1:0];
   wire [2-1:0]       credit_mgr_sink_update;
   reg  [2-1:0]       credit_mgr_data_fifo_read;
   reg  [2-1:0]       credit_mgr_data_fifo_read_q;
   reg  [2-1:0]       credit_mgr_data_fifo_almost_empty;
   wire [2-1:0]       credit_mgr_ctrl_fifo_read;
   wire [2-1:0]       credit_mgr_ctrl_fifo_valid;
   wire [2-1:0]       credit_mgr_ctrl_fifo_eop;  

   wire [2-1:0]       credit_mgr_src_ready;
   wire [2-1:0]       credit_mgr_src_valid;
   wire [2-1:0]       credit_mgr_src_endofpacket;
   
   wire [64-1:0]      credit_mgr_sink_payload[2-1:0];
   wire [64-1:0]      credit_mgr_src_payload[2-1:0];
   reg  [64-1:0]      src_out_payload;

   reg mux_in_ready;

   wire reset_sync;

   assign sink0_update = credit_mgr_sink_update[0];
   assign sink0_credit = credit_mgr_sink_credit[0];
   assign credit_mgr_sink_valid  [0] = sink0_valid;
   assign credit_mgr_sink_ret_credit[0] = sink0_ret_credit;

   // MSB of payload is eop: for ease in use
   assign credit_mgr_sink_payload[0] = {
      sink0_data
   };

   assign sink1_update = credit_mgr_sink_update[1];
   assign sink1_credit = credit_mgr_sink_credit[1];
   assign credit_mgr_sink_valid  [1] = sink1_valid;
   assign credit_mgr_sink_ret_credit[1] = sink1_ret_credit;

   // MSB of payload is eop: for ease in use
   assign credit_mgr_sink_payload[1] = {
      sink1_data
   };


   assign credit_mgr_data_fifo_read = credit_mgr_src_ready & credit_mgr_src_valid;
   assign src_out_valid = |credit_mgr_data_fifo_read;

   genvar i;

   generate
   for(i = 0; i < NUM_SINK; i = i + 1) begin : credit_mgr_inst
      credit_manager # (
         .ST_MAX_CREDIT (1),
         .ST_DATA_W     (64),
         .ST_CREDIT_W   (1),
         .FIFO_DEPTH    (16)
      ) credit_mgr_inst (
         .clk                 (clk),
         .reset               (reset_sync), 

         .sink_update         (credit_mgr_sink_update[i]),        //output
         .sink_credit         (credit_mgr_sink_credit[i]),        //output

         .sink_valid          (credit_mgr_sink_valid[i]),         //input
         .sink_data           (credit_mgr_sink_payload[i]),          

         .src_valid           (credit_mgr_src_valid[i]),          //output
         .src_data            (credit_mgr_src_payload[i]),

         .data_fifo_read      (credit_mgr_data_fifo_read[i]),
         .sink_return_credit  (credit_mgr_sink_ret_credit[i]) 

      );
   end
   endgenerate

   assign credit_mgr_src_endofpacket = {2{1'b1}};

   source_sel_avst_credit_multiplexer_altera_merlin_multiplexer_110_enhq6oy mux_2_to_1 (
      .sink0_ready         (credit_mgr_src_ready[0]),
      .sink0_valid         (credit_mgr_src_valid[0]),
      .sink0_data          (64'b0),  
      .sink0_channel       (2'b0),  // Value only for testing- otherwise channel not required
      .sink0_startofpacket (1'b0),  // This violates the protocol but only eop needed for unlock
      .sink0_endofpacket   (credit_mgr_src_endofpacket[0]),
      .sink1_ready         (credit_mgr_src_ready[1]),
      .sink1_valid         (credit_mgr_src_valid[1]),
      .sink1_data          (64'b0),  
      .sink1_channel       (2'b0),  // Value only for testing- otherwise channel not required
      .sink1_startofpacket (1'b0),  // This violates the protocol but only eop needed for unlock
      .sink1_endofpacket   (credit_mgr_src_endofpacket[1]),

      .src_ready           (mux_in_ready),
      .src_data            (         ),  
      .src_valid           (         ),  
      .src_channel         (         ),  
      .src_startofpacket   (         ),  
      .src_endofpacket     (         ),

      .clk (clk),
      .reset (reset_sync)
   );


   always @ (*) begin
      unique case (1) 
         credit_mgr_data_fifo_read[0] : begin
            src_append_ch            = 1'd0;
            src_out_payload          = credit_mgr_src_payload[0];
         end


         default : begin
            src_append_ch            = 1'd1;
            src_out_payload          = credit_mgr_src_payload[1];
         end

      endcase
   end

   assign src_out_ret_credit = 1'b0;
   assign src_out_init_ack = 1'b0;

   assign src_out_eop = 1'b0;
   assign src_out_sop = 1'b0;
   assign src_out_empty = '0;
   assign src_out_error = '0;
   assign src_out_channel = src_append_ch;
   assign {
      src_out_data
   } = src_out_payload;

   credit2ready #(
      .ST_CREDIT_W(1)
   ) ready_gen (
      .clk        (clk),
      .reset      (reset_sync),

      .src_update (src_in_update),
      .src_credit (src_in_credit),

      .sink_valid (src_out_valid ),     // sink_valid can go high only if src_ready = 1
      .src_ready  (mux_in_ready)
   );


////////////////////////////////////////////////////////////////////////////
//avst credit reset sync (2 cycle sync)

source_sel_avst_credit_multiplexer_altera_reset_controller_110_mpjuyrq # (
.NUM_RESET_INPUTS          (1),
.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
.SYNC_DEPTH                (2),
.RESET_REQUEST_PRESENT     (0),
.RESET_REQ_WAIT_TIME       (1),
.MIN_RST_ASSERTION_TIME    (3),
.RESET_REQ_EARLY_DSRT_TIME (1),
.USE_RESET_REQUEST_IN0     (0),
.USE_RESET_REQUEST_IN1     (0),
.USE_RESET_REQUEST_IN2     (0),
.USE_RESET_REQUEST_IN3     (0),
.USE_RESET_REQUEST_IN4     (0),
.USE_RESET_REQUEST_IN5     (0),
.USE_RESET_REQUEST_IN6     (0),
.USE_RESET_REQUEST_IN7     (0),
.USE_RESET_REQUEST_IN8     (0),
.USE_RESET_REQUEST_IN9     (0),
.USE_RESET_REQUEST_IN10    (0),
.USE_RESET_REQUEST_IN11    (0),
.USE_RESET_REQUEST_IN12    (0),
.USE_RESET_REQUEST_IN13    (0),
.USE_RESET_REQUEST_IN14    (0),
.USE_RESET_REQUEST_IN15    (0),
.ADAPT_RESET_REQUEST       (0)
) reset_controller_0 (
	.reset_in0      (reset), //   input,  width = 1, reset_in0.reset
	.clk            (clk),       //   input,  width = 1,       clk.clk
	.reset_out      (reset_sync), //  output,  width = 1, reset_out.reset                                             
	.reset_in1      (1'b0),      // (terminated),                                             
	.reset_in2      (1'b0),      // (terminated),                                              
	.reset_in3      (1'b0),      // (terminated),                                              
	.reset_in4      (1'b0),      // (terminated),                                              
	.reset_in5      (1'b0)      // (terminated),                              
);

////////////////////////////////////////////////////////////////////////////

endmodule
`default_nettype none

