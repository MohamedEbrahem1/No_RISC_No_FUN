module ControlUnit (
    input [6:0] opcode,
    input [2:0] funct3,
    input [6:0] funct7,
    output reg RegWrite,
    output reg MemRead,
    output reg MemWrite,
    output reg ALUSrc,
    output reg [2:0] ALUOp,
    output reg Branch,
    output reg Jump,
    output reg MemToReg,
    output reg [1:0] RegDst
);

    always @* begin
        // Reset all control signals
        RegWrite = 0;
        MemRead = 0;
        MemWrite = 0;
        ALUSrc = 0;
        ALUOp = 3'b000;
        Branch = 0;
        Jump = 0;
        MemToReg = 0;
        RegDst = 2'b00;

        // Control signals based on opcode and funct fields
        case (opcode)
            // R-Type Instructions
            7'b0110011: begin
                RegWrite = 1;
                ALUSrc = 0;
                case (funct3)
                    3'b000: ALUOp = 3'b000; // ADD
                    3'b111: ALUOp = 3'b100; // AND
                    3'b110: ALUOp = 3'b010; // OR
                    3'b100: ALUOp = 3'b110; // XOR
                    3'b001: ALUOp = 3'b001; // SLL
                    3'b101: ALUOp = 3'b101; // SRL
                    3'b110: ALUOp = 3'b101; // SRA
                    3'b010: ALUOp = 3'b110; // SUB
                    3'b011: ALUOp = 3'b111; // SLT
                    3'b111: ALUOp = 3'b111; // SLTU
                    // Add more cases for other R-Type instructions
                    // ...
                endcase
            end

            // I-Type Instructions
            7'b0010011: begin
                RegWrite = 1;
                ALUSrc = 0;
                case (funct3)
                    3'b000: ALUOp = 3'b000; // ADDI
                    3'b111: ALUOp = 3'b100; // ANDI
                    3'b110: ALUOp = 3'b010; // ORI
                    3'b100: ALUOp = 3'b110; // XORI
                    3'b001: ALUOp = 3'b001; // SLLI
                    3'b101: ALUOp = 3'b101; // SRLI
                    3'b110: ALUOp = 3'b101; // SRAI
                    3'b010: ALUOp = 3'b000; // SLTI
                    3'b011: ALUOp = 3'b111; // SLTIU
                    // Add more cases for other I-Type instructions
                    // ...
                endcase
            end

            // S-Type Instructions
            7'b0100011: begin
                MemWrite = 1;
                ALUSrc = 0;
                ALUOp = 3'b000; // ADD (address calculation)
            end

            // B-Type Instructions
            7'b1100011: begin
                Branch = 1;
                ALUSrc = 0;
                case (funct3)
                    3'b000: ALUOp = 3'b001; // BEQ
                    3'b001: ALUOp = 3'b101; // BNE
                    3'b100: ALUOp = 3'b110; // BLT
                    3'b101: ALUOp = 3'b111; // BGE
                    3'b110: ALUOp = 3'b111; // BLTU
                    3'b111: ALUOp = 3'b110; // BGEU
                    // Add more cases for other B-Type instructions
                    // ...
                endcase
            end

            // U-Type Instructions
            7'b0110111: begin
                RegWrite = 1;
                ALUSrc = 1;
                ALUOp = 3'b000; // ADD (for LUI)
            end

            // J-Type Instructions
            7'b1101111: begin
                Jump = 1;
                RegWrite = 1;
            end

            // Load Instructions
            7'b0000011: begin
                RegWrite = 1;
                MemRead = 1;
                ALUSrc = 1;
                ALUOp = 3'b000; // ADD (for address calculation)
                MemToReg = 1;
                case (funct3)
                    3'b000: RegDst = 2'b00; // LB
                    3'b001: RegDst = 2'b00; // LH
                    3'b010: RegDst = 2'b00; // LW
                    3'b100: RegDst = 2'b00; // LBU
                    3'b101: RegDst = 2'b00; // LHU
                    // Add more cases for other Load instructions
                    // ...
                endcase
            end

            // Store Instructions
            7'b0100011: begin
                MemWrite = 1;
                ALUSrc = 1;
                ALUOp = 3'b000; // ADD (for address calculation)
            end

            // Default case
        endcase
    end
endmodule