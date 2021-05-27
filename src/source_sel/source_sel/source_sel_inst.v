	source_sel u0 (
		.clk                (_connected_to_clk_),                //   input,   width = 1,       clk.clk
		.reset              (_connected_to_reset_),              //   input,   width = 1, clk_reset.reset
		.src_in_credit      (_connected_to_src_in_credit_),      //   input,   width = 1,       src.credit
		.src_in_update      (_connected_to_src_in_update_),      //   input,   width = 1,          .update
		.src_out_ret_credit (_connected_to_src_out_ret_credit_), //  output,   width = 1,          .returnCredit
		.src_out_channel    (_connected_to_src_out_channel_),    //  output,   width = 2,          .channel
		.src_out_data       (_connected_to_src_out_data_),       //  output,  width = 64,          .data
		.src_out_valid      (_connected_to_src_out_valid_),      //  output,   width = 1,          .valid
		.sink0_valid        (_connected_to_sink0_valid_),        //   input,   width = 1,     sink0.valid
		.sink0_data         (_connected_to_sink0_data_),         //   input,  width = 64,          .data
		.sink0_credit       (_connected_to_sink0_credit_),       //  output,   width = 1,          .credit
		.sink0_update       (_connected_to_sink0_update_),       //  output,   width = 1,          .update
		.sink0_ret_credit   (_connected_to_sink0_ret_credit_),   //   input,   width = 1,          .returnCredit
		.sink1_valid        (_connected_to_sink1_valid_),        //   input,   width = 1,     sink1.valid
		.sink1_data         (_connected_to_sink1_data_),         //   input,  width = 64,          .data
		.sink1_credit       (_connected_to_sink1_credit_),       //  output,   width = 1,          .credit
		.sink1_update       (_connected_to_sink1_update_),       //  output,   width = 1,          .update
		.sink1_ret_credit   (_connected_to_sink1_ret_credit_),   //   input,   width = 1,          .returnCredit
		.sink2_valid        (_connected_to_sink2_valid_),        //   input,   width = 1,     sink2.valid
		.sink2_data         (_connected_to_sink2_data_),         //   input,  width = 64,          .data
		.sink2_credit       (_connected_to_sink2_credit_),       //  output,   width = 1,          .credit
		.sink2_update       (_connected_to_sink2_update_),       //  output,   width = 1,          .update
		.sink2_ret_credit   (_connected_to_sink2_ret_credit_),   //   input,   width = 1,          .returnCredit
		.sink3_valid        (_connected_to_sink3_valid_),        //   input,   width = 1,     sink3.valid
		.sink3_data         (_connected_to_sink3_data_),         //   input,  width = 64,          .data
		.sink3_credit       (_connected_to_sink3_credit_),       //  output,   width = 1,          .credit
		.sink3_update       (_connected_to_sink3_update_),       //  output,   width = 1,          .update
		.sink3_ret_credit   (_connected_to_sink3_ret_credit_)    //   input,   width = 1,          .returnCredit
	);

