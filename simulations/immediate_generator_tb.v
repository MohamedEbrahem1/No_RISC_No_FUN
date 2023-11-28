`timescale 1ns / 1ps
`include "../src/immediate_generator.v"
module ImmGen_tb;

  reg [31:0] inst;

  wire [31:0] gen_out;

  ImmGen uut (
    .inst(inst),
    .gen_out(gen_out)
  );

  initial begin
    inst = 32'b00000000001001010000010100010011;
    #10;
      $display("Test case result: %b", gen_out);

    inst = 32'b00000001111101011010010110010011;
    #10;
      $display("Test case result: %b", gen_out);

    inst = 32'b00000000101001111100011000010011;
    #10;
      $display("Test case result: %b", gen_out);

    inst = 32'b00000000101001111111011100010011;
    #10;
    if (gen_out !== 32'b00000000000011101111)
      $display("Test case result: %b", gen_out);

    $finish;
  end

endmodule
