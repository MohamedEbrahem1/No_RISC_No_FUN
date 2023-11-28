`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 11:25:38 PM
// Design Name: 
// Module Name: mux2x1
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


module mux2x1 #(parameter n = 32)( 
    
    input [n-1: 0] a, 
    [n-1:0] b, 
    input s, 
    output reg [n-1:0] out
    );
    always @(*) begin 
        if (~s) begin 
           out = a;     
        end  else begin 
            out = b;
        end
    end 
    
endmodule
