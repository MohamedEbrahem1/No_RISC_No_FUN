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
    localparam period = 100;
    reg clk, rst;
//    reg [4:0] instAddr;
    initial begin
        clk = 1'b0;
        forever begin
        #50 clk = ~clk;
        end 
    end
    reg [4:0] switch;
    wire [0:6] seg;
    wire [1:0] anode;
    driver driver2(.clk_in(clk), .rst(rst), .switch(switch), .seg(seg), .anode(anode));

    initial begin
    switch = 5'b00011;
        rst =1; 
        #period
        rst=0;
        #period
        #period
        #period
        #period
        #period
        #period
        #period

   $finish;
    end
    
endmodule
