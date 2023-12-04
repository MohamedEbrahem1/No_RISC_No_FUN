`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 02:57:58 PM
// Design Name: 
// Module Name: branch_ctrl
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


module branch_ctrl(
input [2:0] branch_op,
input branch,
input zf,
input negative,
output reg branch_sel
    );
    
    
    always @(*)
    begin
        case (branch_op)
            3'b000: if(branch) branch_sel = zf;
            3'b001: if(branch) branch_sel = ~zf;
            3'b100: if(branch) branch_sel = negative;
            3'b101: if(branch) branch_sel = ~negative;
            3'b110: if(branch) branch_sel = negative;
            3'b111: if(branch) branch_sel = ~negative;
            default : branch_sel = 1'b0;
        endcase
    end
    
    
endmodule
