`timescale 1ns / 1ps
`include "../src/instruction_memory.v"

module InstructionMemory_tb;

    // Inputs
    reg clk;
    reg [31:0] pc;
    reg btn_reset;

    // Outputs
    wire [31:0] instruction;

    // Instantiate the module
    InstructionMemory uut (
        .clk(clk),
        .pc(pc),
        .btn_reset(btn_reset),
        .instruction(instruction)
    );

    // Clock generation
    reg [9:0] clock_counter = 0;
    initial begin
        clk = 0;
        forever #5 clk = ~clk; 
    end

    // Initial values
    initial begin
        $dumpfile("tb_instruction_memory.vcd");
        $dumpvars(0, InstructionMemory_tb);
        pc = 0;
        btn_reset = 0;

        #10 btn_reset = 1;
                #10 pc = 0;
        #10 $display("Instruction at PC = %0d is %h", pc, instruction);

        #10 pc = 4;
        #10 $display("Instruction at PC = %0d is %h", pc, instruction);
        #10 btn_reset = 0;

        #10 pc = 0;
        #10 $display("Instruction at PC = %0d is %h", pc, instruction);

        #10 pc = 4;
        #10 $display("Instruction at PC = %0d is %h", pc, instruction);

        #10 $finish; 
    end

endmodule
