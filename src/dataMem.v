`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2023 03:35:03 PM
// Design Name: 
// Module Name: dataMem
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


module dataMem
    (input clk,
     input MemRead,
     input MemWrite,
     input [5:0] addr, 
     input [31:0] data_in, 
     output reg [31:0] data_out
     );
     
     reg [31:0] mem [63:0];
     always@(*) begin
        if(MemRead) data_out = mem[addr];
     end
     always@(posedge clk)begin
        if(MemWrite) mem[addr] = data_in;
     end
     
     integer i;
     initial begin
          for (i = 63; i >= 0; i = i - 1) begin
                mem[63-i] = i;
        end
      end 
      
  
endmodule