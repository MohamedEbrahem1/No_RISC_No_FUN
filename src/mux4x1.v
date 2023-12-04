`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/14/2023 06:20:20 PM
// Design Name: 
// Module Name: mux4x1
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

module mux4x1(

 input [3:0] in0,
 input [3:0] in1,
 input [3:0] in2,
 input [3:0] in3,
 
 input [1:0] s, 
 output reg [3:0] out  );
    always @(*) begin
        case(s)
            0: out = in0;
            1: out = in1;
            2: out = in2;
            3: out = in3;
        endcase 
    end
endmodule