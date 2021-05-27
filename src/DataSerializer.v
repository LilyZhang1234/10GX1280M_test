`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: dengbw
// 
// Create Date: 2020/11/08 16:50:00
// Design Name: 
// Module Name: DataSerializer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DataSerializer(
    input clk1280,
    input [31:0] frame,
    output DataTx
    );
reg Tx=0;
reg [4:0] cnt=5'b0;

reg [31:0] framebuf;
always @(posedge clk1280)
begin
    cnt<=cnt+1'b1;
    if (cnt== 31) begin
     cnt<=5'b0;
     framebuf<=frame;
     end
    
    Tx<=framebuf[31-cnt];//MSB    
end
assign DataTx=Tx;
endmodule
