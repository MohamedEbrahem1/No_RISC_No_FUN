`timescale 1ns / 1ps


module instruction_memory(
    input [3:0] address,
    input reload,
    output [0:31] instruction
);

    reg [31:0] instructions [0:13];

    always @(posedge reload) begin
        $readmemb("instructions.txt", instructions);
    end

    assign instruction = instructions[address];

endmodule
