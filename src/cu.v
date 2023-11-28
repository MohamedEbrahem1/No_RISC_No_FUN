module ControlUnit (
  input [6:2] opcode,
  output reg Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite,
  output reg [1:0] ALUOp
);

  // Default assignments
  always @* begin
    Branch   = 0;
    MemRead  = 0;
    MemtoReg = 0;
    MemWrite = 0;
    ALUSrc   = 0;
    RegWrite = 0;
    ALUOp    = 2'b00;

    // Decode opcode
    case (opcode)
      5'b01100: begin
        RegWrite = 1;
        ALUOp    = 2'b10;
      end

      5'b00000: begin
        MemRead  = 1;
        MemtoReg = 1;
        ALUSrc   = 1;
        RegWrite = 1;
        ALUOp    = 2'b00;
      end

      5'b01000: begin
        MemWrite = 1;
        ALUSrc   = 1;
        ALUOp    = 2'b00;
      end

      5'b11000: begin
        Branch = 1;
        ALUOp  = 2'b01;
      end
    endcase
  end

endmodule
