`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/20/2023 02:38:57 PM
// Design Name: 
// Module Name: Clockworks
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


module Clockworks #(parameter SLOW = 8)(
    input CLK,
    input RESET,
    output clk,
    output resetn
);

reg[SLOW:0] slow_CLK = 0;
always @(posedge CLK) begin
    slow_CLK <= slow_CLK + 1;
end
assign clk = slow_CLK[SLOW];
assign resetn = RESET;

endmodule
