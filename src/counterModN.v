`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 11:17:40 AM
// Design Name: 
// Module Name: counterModN
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

module bin_counter_nbits  #(parameter  x = 3, n = 6)
(input clk, reset, output reg [x-1:0]count, input en);
//reg [x-1:0] count;
always @(posedge clk & en == 1 , posedge reset) begin
 if (reset == 1)
 count <= 3'd0;
 else if (count == n-1)
 count <= 3'd0; // non-blocking assignment
 // initialize flip flop here
 else
 count <= count + 1; // non-blocking assignment
 // normal operation
end

endmodule
