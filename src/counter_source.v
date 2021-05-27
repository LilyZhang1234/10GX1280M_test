//Example of simple 32-bit up counter
//Single clock input and 32-bit output port


module simple_counter (
	input clk1280,
	output reg [15:0] counter_out 
	);

	
always @ (posedge clk1280)
	begin
		counter_out <= counter_out + 1;
     end
		


endmodule
