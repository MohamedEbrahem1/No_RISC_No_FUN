`timescale 1ns / 1ps
`include "../src/cu.v"
module ControlUnit_tb;

    reg [6:0] opcode;
    reg [2:0] funct3;
    reg [6:0] funct7;

    wire RegWrite, MemRead, MemWrite, ALUSrc;
    wire [2:0] ALUOp;
    wire Branch, Jump, MemToReg;
    wire [1:0] RegDst;

    // Instantiate the ControlUnit module
    ControlUnit uut (
        .opcode(opcode),
        .funct3(funct3),
        .funct7(funct7),
        .RegWrite(RegWrite),
        .MemRead(MemRead),
        .MemWrite(MemWrite),
        .ALUSrc(ALUSrc),
        .ALUOp(ALUOp),
        .Branch(Branch),
        .Jump(Jump),
        .MemToReg(MemToReg),
        .RegDst(RegDst)
    );

    // Initial values
    initial begin
        $dumpfile("control_unit_tb.vcd");
        $dumpvars(0, ControlUnit_tb);

        // Test case 1: R-Type ADD instruction
        opcode = 7'b0110011;
        funct3 = 3'b000;
        funct7 = 7'b0000000;
        #10 $display("Control Signals for R-Type ADD: RegWrite=%b, MemRead=%b, MemWrite=%b, ALUSrc=%b, ALUOp=%b, Branch=%b, Jump=%b, MemToReg=%b, RegDst=%b",
                    RegWrite, MemRead, MemWrite, ALUSrc, ALUOp, Branch, Jump, MemToReg, RegDst);

        // Test case 2: I-Type ORI instruction
        opcode = 7'b0010011;
        funct3 = 3'b111;
        funct7 = 7'b0000000;
        #10 $display("Control Signals for I-Type ORI: RegWrite=%b, MemRead=%b, MemWrite=%b, ALUSrc=%b, ALUOp=%b, Branch=%b, Jump=%b, MemToReg=%b, RegDst=%b",
                    RegWrite, MemRead, MemWrite, ALUSrc, ALUOp, Branch, Jump, MemToReg, RegDst);

        // Add more test cases as needed

        #10 $finish;
    end

endmodule
