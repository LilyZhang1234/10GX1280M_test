module source_sel (
		input  wire        clk,                //       clk.clk
		input  wire        reset,              // clk_reset.reset
		input  wire [0:0]  src_in_credit,      //       src.credit
		input  wire        src_in_update,      //          .update
		output wire        src_out_ret_credit, //          .returnCredit
		output wire [1:0]  src_out_channel,    //          .channel
		output wire [63:0] src_out_data,       //          .data
		output wire        src_out_valid,      //          .valid
		input  wire        sink0_valid,        //     sink0.valid
		input  wire [63:0] sink0_data,         //          .data
		output wire [0:0]  sink0_credit,       //          .credit
		output wire        sink0_update,       //          .update
		input  wire        sink0_ret_credit,   //          .returnCredit
		input  wire        sink1_valid,        //     sink1.valid
		input  wire [63:0] sink1_data,         //          .data
		output wire [0:0]  sink1_credit,       //          .credit
		output wire        sink1_update,       //          .update
		input  wire        sink1_ret_credit,   //          .returnCredit
		input  wire        sink2_valid,        //     sink2.valid
		input  wire [63:0] sink2_data,         //          .data
		output wire [0:0]  sink2_credit,       //          .credit
		output wire        sink2_update,       //          .update
		input  wire        sink2_ret_credit,   //          .returnCredit
		input  wire        sink3_valid,        //     sink3.valid
		input  wire [63:0] sink3_data,         //          .data
		output wire [0:0]  sink3_credit,       //          .credit
		output wire        sink3_update,       //          .update
		input  wire        sink3_ret_credit    //          .returnCredit
	);
endmodule

