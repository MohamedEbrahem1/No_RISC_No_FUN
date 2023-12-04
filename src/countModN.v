`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/12/2023 11:28:08 AM
// Design Name: 
// Module Name: countModN
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

`timescale 1ns / 1ps

module modulo_counter #(parameter x = 3, parameter n = 8) (
  input clk, reset, enable,
  output reg [x-1:0] count
);

  always @(posedge clk or posedge reset) begin
    if (reset == 1) begin
      count <= {x{1'b0}};  // Reset the counter
    end
    else if (enable == 1) begin
      if (count + 1 >= n)  // Check for overflow
        count <= count + 1 - n;
      else
        count <= count + 1;
    end
  end

endmodule