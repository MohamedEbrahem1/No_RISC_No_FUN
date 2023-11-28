`timescale 1ns / 1ps
`include "../src/cu.v"
module ControlUnit_tb;

  reg [6:2] opcode;

  wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
  wire [1:0] ALUOp;

  ControlUnit uut (
    .opcode(opcode),
    .Branch(Branch),
    .MemRead(MemRead),
    .MemtoReg(MemtoReg),
    .MemWrite(MemWrite),
    .ALUSrc(ALUSrc),
    .RegWrite(RegWrite),
    .ALUOp(ALUOp)
  );

  initial begin
    // Test case 1
    opcode = 5'b01100;
    #10; 

    // Test case 2
    opcode = 5'b00000;
    #10;

    // Test case 3
    opcode = 5'b01000;
    #10;

    // Test case 4
    opcode = 5'b11000;
    #10;

    $finish;
  end

endmodule
