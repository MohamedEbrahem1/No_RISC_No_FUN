`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/28/2023 08:03:08 PM
// Design Name: 
// Module Name: regfile_tb
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


module regfile_tb();

reg clk;
reg rst;
reg regWrite;
reg [4:0] readAddr1; 
reg [4:0] readAddr2; 
reg [4:0] writeAddr; 
reg [31:0] writeData;

wire [31:0] rs1; 
wire [31:0] rs2; 

regFile dut (
.clk(clk), 
.rst(rst), 
.regWrite(regWrite),
.readAddr1(readAddr1),
.readAddr2(readAddr2),
.writeAddr(writeAddr),
.writeData(writeData),
.rs1(rs1),
.rs2(rs2) );

always #5 clk = ~clk; 

initial begin 

    clk = 0; 
    readAddr1 = 0; 
    readAddr2 = 0; 
    writeAddr = 0; 
    writeData = 0; 
    rst = 1; 
    regWrite = 0; 
    
    #10 
    
    rst=0;
    writeAddr = 1; 
    writeData = 32'hbeeeeeef;
    regWrite = 1; 
    
    


end

endmodule
