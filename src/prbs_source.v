//prbs source for source gen
//taken from the 10GX1280Mprbs project


module prbs_source(
	input clk1280,
	output reg [15:0] prbs_source
);


reg [126:0] prbs71=127'b1111_1110_1010_1001_1001_1101_1101_0010_1100_0110_111101101011011001001000111000010111110010101110011010001001111000101000011000001000000;// PRBS created from right to left, b0^b1==b7

reg [31:0] dframe;
always @(posedge clk1280)
begin
   
	   prbs71[126:0]<={ prbs71[31:0],prbs71[126:32]};
      dframe[31:0]<= prbs71[31:0];
		prbs_source[15:0] <= dframe[31:16];
end


endmodule