//constant source for source_gen
//value for const: 0x3C5C; value for const_bar: 0xC3A3

module const_source(
		input clk1280,
		output reg [15:0] const,
		output reg [15:0] const_bar
);


always @ (posedge clk1280) begin
	const = 16'h3C5C;			//const
	const_bar = 16'hC3A3;	//const_bar
end 


endmodule