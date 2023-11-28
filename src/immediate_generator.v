module ImmGen (
  input [31:0] inst,
  output reg [31:0] gen_out
);

  always @* begin
    if (inst[31]) begin
      // Sign extension for negative immediate values
      gen_out = 32'b11111111111111111111111111111111;
    end
    else begin
      gen_out = 0;
    end

    if (inst[6]) begin
      // I-type instruction
      gen_out[10] = inst[7];
      gen_out[3:0] = inst[11:8];
      gen_out[9:4] = inst[30:25];
      gen_out[11]  = inst[31];
    end
    else begin
      if (inst[5]) begin
        // S-type instruction
        gen_out[11:5] = inst[31:25];
        gen_out[4:0]  = inst[11:7];
      end
      else begin
        // I intructions
        gen_out[11:0] = inst[31:20];
      end
    end
  end

endmodule
