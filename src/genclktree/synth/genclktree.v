// genclktree.v

// Generated using ACDS version 21.1 169

`timescale 1 ps / 1 ps
module genclktree (
		input  wire  rst,      //   reset.reset
		input  wire  refclk,   //  refclk.clk
		output wire  locked,   //  locked.export
		output wire  outclk_0, // outclk0.clk
		output wire  outclk_1  // outclk1.clk
	);

	genclktree_altera_iopll_1931_rsaixoa iopll_0 (
		.rst      (rst),      //   input,  width = 1,   reset.reset
		.refclk   (refclk),   //   input,  width = 1,  refclk.clk
		.locked   (locked),   //  output,  width = 1,  locked.export
		.outclk_0 (outclk_0), //  output,  width = 1, outclk0.clk
		.outclk_1 (outclk_1)  //  output,  width = 1, outclk1.clk
	);

endmodule
