`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/11/08 17:08:34
// Design Name: dengbw
// Module Name: DataDeSerializer
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
module DataDeSerializer(
    input clk40,
    input clk1280,
    input Rx,
    output [31:0] Data
    );

reg [31:0] Databuf;

always @(posedge clk1280)
begin
    Databuf[31:0]<={Databuf[30:0],Rx};
end    
reg [31:0] DataR;
always @(posedge clk40)
begin
    DataR<=Databuf;
end

assign Data=DataR;

endmodule
