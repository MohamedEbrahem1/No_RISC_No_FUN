// ALU_tb.v
`timescale 1ns / 1ps
`include "../src/alu.v"
module ALU_tb;

   // Inputs
   reg [3:0] rs1;
   reg [3:0] rs2;
   reg [3:0] sel;

   // Outputs
   wire [3:0] result;
   wire zero_flag;

   // Instantiate the ALU
   ALU uut(.rs1(rs1),
           .rs2(rs2),
           .sel(sel),
           .result(result),
           .zero_flag(zero_flag));

   // Clock generation
   reg clk = 0;
   always #5 clk = ~clk;

   // Test stimulus
   initial begin
      $dumpfile("tb_alu.vcd");
      $dumpvars(0,ALU_tb);
      // Test case 1: Addition
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0000;
      #10 $display("Test Case 1: Addition - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 2: Subtraction
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0001;
      #10 $display("Test Case 2: Subtraction - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 3: AND
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0111;
      #10 $display("Test Case 3: AND - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 4: OR
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0110;
      #10 $display("Test Case 4: OR - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 5: XOR
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0100;
      #10 $display("Test Case 5: XOR - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 6: SLT
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0010;
      #10 $display("Test Case 6: SLT - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 7: SLTU
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b0011;
      #10 $display("Test Case 7: SLTU - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 8: SLLI
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b1010;
      #10 $display("Test Case 8: SLLI - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 9: SRLI
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b1101;
      #10 $display("Test Case 9: SRLI - Result: %b, Zero Flag: %b", result, zero_flag);

      // Test case 10: SRAI
      rs1 = 4'b1100;
      rs2 = 4'b0011;
      sel = 4'b1110;
      #10 $display("Test Case 10: SRAI - Result: %b, Zero Flag: %b", result, zero_flag);

      // Add more test cases as needed

      // End simulation
      #10 $finish;
   end

endmodule
