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
        [4:0]readAddr1, // 
        [4:0]readAddr2, //
        [4:0]writeAddr, //
        [n-1:0] writeData, // 32 bits  [n-1:0]
        input [4:0] reg_address,
        output [n-1:0] rs1, //  [n-1:0]
        [n-1:0] rs2,
         output  [12:0] reg_display

    );
    reg [n-1: 0] regFileArr [31:0]; 
    integer i;
    initial begin // initialize the regfile with 0's 
        for (i = 0; i < 32; i = i + 1) begin
            regFileArr[i] = i;
        end
    end 

          assign rs1 = regFileArr[readAddr1];
          assign rs2 = regFileArr[readAddr2];
  
  always @ (posedge clk, posedge rst) begin
        
        if (rst) begin
            for (i = 0; i < 32; i = i + 1) begin
                regFileArr[i] <= i; // reset all to zero 
            end
        end else if(regWrite) 
        begin
            regFileArr[writeAddr] <= writeData;
        end
    // writing W_data to register number W_addr
  end
assign        reg_display = regFileArr[reg_address];

    
endmodule
