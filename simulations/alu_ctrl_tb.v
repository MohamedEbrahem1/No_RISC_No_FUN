`timescale 1ns / 1ps
`include "../src/alu_ctrl.v"
module alu_ctrl_tb;

  // Inputs
  reg [1:0] alu_op;
  reg [2:0] func3;
  reg func7;

  // Outputs
  wire [3:0] alu_ctrl;

  // Instantiate the module under test
  alu_ctrl uut (
    .alu_op(alu_op),
    .func3(func3),
    .func7(func7),
    .alu_ctrl(alu_ctrl)
  );

  // Initial block for test stimulus
  initial begin
    // Test case 1: alu_op = 2'b00
    alu_op = 2'b00;
    func3 = 3'b000;
    func7 = 1'b0;
    #10;  // Wait for 10 time units
    $display("Test Case 1: alu_op = %b, func3 = %b, func7 = %b, alu_ctrl = %b (Expected: 0010)", alu_op, func3, func7, alu_ctrl);

    // Test case 2: alu_op = 2'b10, func7 = 4'b1000
    alu_op = 2'b10;
    func3 = 3'b000;
    func7 = 1'b1;
    #10;  // Wait for 10 time units
    $display("Test Case 2: alu_op = %b, func3 = %b, func7 = %b, alu_ctrl = %b (Expected: 0110)", alu_op, func3, func7, alu_ctrl);

    // Test case 3: alu_op = 2'b11, func7 = 4'b0100
    alu_op = 2'b11;
    func3 = 3'b010;
    func7 = 1'b0;
    #10;  // Wait for 10 time units
    $display("Test Case 3: alu_op = %b, func3 = %b, func7 = %b, alu_ctrl = %b (Expected: 0100)", alu_op, func3, func7, alu_ctrl);

    // Test case 4: alu_op = 2'b01, func3 = 3'b111
    alu_op = 2'b01;
    func3 = 3'b111;
    func7 = 1'b0;
    #10;  // Wait for 10 time units
    $display("Test Case 4: alu_op = %b, func3 = %b, func7 = %b, alu_ctrl = %b (Expected: 0110)", alu_op, func3, func7, alu_ctrl);

    // Test case 5: alu_op = 2'b11, func7 = 4'b1101
    alu_op = 2'b11;
    func3 = 3'b101;
    func7 = 1'b1;
    #10;  // Wait for 10 time units
    $display("Test Case 5: alu_op = %b, func3 = %b, func7 = %b, alu_ctrl = %b (Expected: 1010)", alu_op, func3, func7, alu_ctrl);

    $finish;  // Stop simulation
  end

endmodule
