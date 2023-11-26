module InstructionMemory (
    input wire clk,
    input wire [31:0] pc, // Program counter as the read address
    input wire btn_reset, // Reset button
    output reg [31:0] instruction
);

    // Define the memory array for instructions
    reg [31:0] mem [0:255]; // Assuming 256 32-bit instructions

    // Initialize memory with example instructions (replace with your own)
    initial begin
        mem[0]  <= 32'h00100013; // addi x1, x0, 1
        mem[4]  <= 32'h00008067; // jalr x1, x0, 0
        // ... add more instructions as needed
    end

    // Always block to read instruction based on the PC
    always @(posedge clk or posedge btn_reset) begin
        if (btn_reset) begin
            instruction <= 32'h00000000; // Reset instruction to 0 on reset
        end else begin
            // Read instruction from memory based on PC
            instruction = mem[pc]; // Assuming byte-addressable memory
        end
    end

endmodule

