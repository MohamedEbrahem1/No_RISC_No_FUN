module instruction_memory(
    input [3:0] address,
    output [0:31] instruction
);

    reg [31:0] instructions [0:13]; //14 is the number of instructions in instructions.txt

    initial 
	begin
        $readmemb("instructions.txt", instructions);
    end

    assign instruction = instructions[address];

endmodule
