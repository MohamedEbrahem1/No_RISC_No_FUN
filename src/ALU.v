`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 09:04:19 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 32) (
    input clk, 
    [n-1:0] rs1,  // how to make sure that it's the same n? 
    [n-1:0] rs2,  
    [31:0] inst,
    [3:0] alu_ctrl, 
    output reg [n-1:0] res, 
    output reg zf,
    output reg negative
    );
    wire [6:0] opcode = inst [6:0];
    wire [2:0] func3 = inst[14:12];
    reg [6:0] func7;
    reg [11:0] imm;
    wire [31:0] negrs2;    
        
    assign negrs2 = (~rs2);
//    assign res = (alu_ctrl[2])? (rs1+negrs2+1): (rs1+rs2);   
     always @(*) begin 
        case (alu_ctrl)     
             4'b0010 : res = (rs1 + rs2);
             4'b0110 : res = (rs1 + negrs2 + 1);
             4'b0000 : res = (rs1 & rs2);
             4'b0001 : res = (rs1 | rs2);
             4'b0011 : res = (rs1 << rs2);
             4'b0100 : res = (rs1 < rs2)? 1:0; // 
             4'b0101 : res = ((~rs1+1) < (~rs2+1));
             4'b0111 : res = (rs1 ^ rs2);
             4'b1000 : res = (rs1 >> rs2);
             4'b1010 : res = (rs1 >>> rs2);
             default: res = 32'd0;
        endcase 
         zf = (res==0)? 1: 0;
         negative = (res<0) ? 1 : 0;
     end 
        
endmodule
