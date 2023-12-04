`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 11:06:29 PM
// Design Name: 
// Module Name: ImmGen
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps

module ImmGen (
  input [31:0] inst,
  output reg [31:0] gen_out
);
assign opcode = inst[6:0];
  always @* begin
    if (inst[31]) begin
      // Sign extension for negative immediate values
      gen_out = 32'b11111111111111111111111111111111;
    end
    else begin
      gen_out = 0;
    end

    if (inst[6:0] == 7'b1100011 ) begin
      // B-type instruction
      gen_out[10] = inst[7];
      gen_out[3:0] = inst[11:8];
      gen_out[9:4] = inst[30:25];
      gen_out[11]  = inst[31];
    end
    else begin
      if (opcode == 7'b0100011) begin
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