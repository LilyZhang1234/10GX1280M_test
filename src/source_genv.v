//module for source_gen with mux selector
//mux 4to1, push buttons(PB1(MSB) and PB0(LSB)) as selector and led (D22(MSB) and D19(LSB)) as indicator 

module source_gen(
		input clk1280,
		input [15:0] ch1,	//counter
		input [15:0] ch2,	//prbs
		input [15:0] ch3,	//const
		input [15:0] ch4,	//const_bar
		input	[1:0]	sel,	//selector from push button
		
		output reg [1:0] indic,//indicators to led's
		output reg [15:0] source_out  //to FMCA
);


always @ (posedge clk1280) begin
	
	
	case (sel)
		2'b00: source_out <= ch1;
		2'b01: source_out <= ch2;
		2'b10: source_out <= ch3;
		2'b11: source_out <= ch4;
	endcase
	
	case (sel)
		2'b00: indic <= 2'b00;
		2'b01: indic <= 2'b01;
		2'b10: indic <= 2'b10;
		2'b11: indic <= 2'b11;
	endcase
	
	end


endmodule

