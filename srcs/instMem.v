`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 01:29:32 PM
// Design Name: 
// Module Name: instMem
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


module instMem (input [4:0] addr, output [31:0] inst);
reg [31:0] mem [31:0]; // 64 instructions of size 32 bits
 assign inst = mem[addr];
 
    initial begin
         mem[0]=32'b01000000000100011000000010110011 ; //sub x1, x3, x1           x1 = 2
         mem[1]=32'b0000000_00010_00011_000_00010_0110011 ; //add x2, x3, x2           x2 = 5 
         mem[2]=32'b00000000000100100001000110110011 ; //sll x3, x4, x1           x3 =16 // check logic 
         mem[3]=32'b00000000011000101010001000110011 ; //slt x4, x5, x6           x4 = 1
         mem[4]=32'b00000000010100110010001010110011; //slt x5, x6, x5            x5 = 0 // retest sltu
         mem[5]=32'b00000000100000111100001100110011 ; //xor x6, x7, x8           x6 = 15
         mem[6]=32'b00000000000100111101001110110011 ; //srl x7, x7, x1           x7 = 1  // retest sra 
         mem[7]=32'b00000000111101000110010000110011; //or x8, x8, x15            x8 = 15
         mem[8]=32'b00000000101001001111010010110011 ; //and x9, x9, x10          x9 = 8
         mem[9]=32'b00000000001001010000010100010011 ; //addi x10, x10, 2         x10 = 12
         mem[10]=32'b00000001111101011010010110010011 ; //slti x11, x11, 31       x11 = 1 // retest sltiu
         mem[11]=32'b00000000101001111100011000010011 ; //xori x12, x15, 10       x12 = 5
         mem[12]=32'b00000000101001111110011010010011 ; //ori x13, x15, 10        x13 = 15
         mem[13]=32'b00000000101001111111011100010011 ; //andi x14, x15, 10       x14 = 10
    end
 

 
endmodule