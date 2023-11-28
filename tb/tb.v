`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 11:23:16 PM
// Design Name: 
// Module Name: tb
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


module tb();
    localparam period = 1000;
    reg clk, rst, regWrite;
    reg [4:0] instAddr;
    initial begin
        clk = 1'b0;
        forever begin
        #50 clk = ~clk;
        end 
    end
    driver driver2(.clk(clk), .rst(rst),.regWrite(regWrite), .instAddr(instAddr));

    initial begin
        rst =1; 
        regWrite = 0;
        #period
        rst=0;
        regWrite = 1;
        #period
        instAddr = 0; 
        #period
        instAddr = 1; 
        #period
        instAddr = 2; 
        #period
        instAddr = 3; 
        #period
        instAddr = 4; 
        #period
        instAddr = 5; 
        #period
        instAddr = 6; 
        #period
        instAddr = 7; 
        #period
        instAddr = 8; 
        #period
        instAddr = 9; 
        #period
        instAddr = 10; 
        #period
        instAddr = 11; 
        #period
        instAddr = 12; 
        #period
        instAddr = 13; 

    end
    
endmodule
