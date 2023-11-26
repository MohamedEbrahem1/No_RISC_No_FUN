module ALU (
    input [3:0] rs1,
    input [3:0] rs2,
    input [3:0] sel,
    output reg [3:0] result,
    output reg zero_flag
);

    always @*
    begin
        case(sel)
            // R-Type Instructions
            4'b0000: result = rs1 + rs2;    // ADD
            4'b0001: result = rs1 - rs2;    // SUB
            4'b0111: result = rs1 & rs2;    // AND
            4'b0110: result = rs1 | rs2;    // OR
            4'b0100: result = rs1 ^ rs2;    // XOR
            4'b0010: result = (rs1 < rs2) ? 1 : 0;    // SLT
            4'b0011: result = (rs1 < rs2) ? 1 : 0;    // SLTU

            // Shift Instructions
            4'b1010: result = rs1 << rs2;   // SLLI
            4'b1101: result = rs1 >> rs2;   // SRLI
            4'b1110: result = rs1 >>> rs2;    // SRAI

            default: result = 4'b0;    // Default to 0 for unrecognized instructions
        endcase

        // Set zero flag if the result is zero
        zero_flag = (result == 4'b0) ? 1 : 0;
    end

endmodule

