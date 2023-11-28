`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 08:03:40 PM
// Design Name: Register File
// Module Name: regFile
// Project Name: DD1 Project 2
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


module regFile #(parameter n = 32) (  // n-bit regfile 
        input clk,
        rst, 
        regWrite, // flag from CU
        input [4:0]readAddr1, // how many bits ? [4:0] ?
        input [4:0]readAddr2, //
        input [4:0]writeAddr, //
        input [n-1:0] writeData, // 32 bits  [n-1:0]
        output reg [n-1:0] rs1, //  [n-1:0]
        output reg [n-1:0] rs2
    );
    reg [n-1: 0] regFileArr [31:0]; // recheck logic
    integer i;
    initial begin // initialize the regfile with 0's // useless uf testbench starts with rst = 1
        for (i = 0; i < 32; i = i + 1) begin
            regFileArr[i] = 32'b0;
        end
    end 
    
    always @(posedge clk or posedge rst) begin // read operations
        if (rst) begin
          rs1 <= 0; // reset the output if rst
          rs2 <= 0;
        end else begin
          rs1 <= regFileArr[readAddr1];
          rs2 <= regFileArr[readAddr2];
        end
  end
  always @(posedge clk or posedge rst) begin // write operations 
    if (rst) begin
        for (i = 0; i < 32; i = i + 1) begin
            regFileArr[i] <= i; // reset all to zero 
        end
    end else begin
        regFileArr[writeAddr] <= writeData; // write the data unless the address overflows the register array
    end
  end 
     
    
endmodule
