`timescale 1ns / 1ps
`include "../src/instMem.v"
`include "../src/ALU.v"
`include "../src/regFile.v"
`include "../src/cu.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 11:20:55 PM
// Design Name: 
// Module Name: driver
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


module driver(
    input clk,
    rst,
    regWrite,
    input [4:0] instAddr
);
    wire [31:0] rs1;
    wire [31:0] rs2;
    wire [31:0] res;
    wire [31:0] inst;
    wire zf;
    wire branch;
    wire MemRead;
    wire MemtoReg;
    wire MemWrite;
    wire ALUSrc;
    wire [0:1] ALUOp;
    ControlUnit cu (
    .opcode(inst[6:2]),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(regWrite),
    .ALUOp(ALUOp)
  );
    instMem insts(.addr(instAddr), .inst(inst));
    regFile reg1 (.clk(clk), .rst(rst), .regWrite(regWrite), .readAddr1(inst[19:15]), .readAddr2(inst[24:20]),.writeAddr(inst[11:7]), .writeData(res), .rs1(rs1), .rs2(rs2));   
    ALU alu1 ( .clk(clk), .rs1(rs1), .rs2(rs2), .inst(inst), .res(res), .zf(zf));
  
    
    
endmodule
