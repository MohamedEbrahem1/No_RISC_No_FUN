`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/04/2023 03:23:24 PM
// Design Name: 
// Module Name: pc
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


module pc(input clk, input rst, input [31:0] immediate, input branch_sel, input [25:0] instruction_25, input jump, output reg [9:0] counter
    );
        wire mux_jump;
        wire mux_branch;
        reg [31:0] immediate_shift;
        reg [27:0] instruction_shift;
        reg [31:0] if_branch;
    always@(posedge clk, posedge rst) begin
    if(rst == 1)
                counter <= 0;
            else if (counter <= 64) begin
                counter <= counter + 10'd4;
                immediate_shift <= immediate >> 2;
                instruction_shift <= instruction_25 >> 2;
                if_branch <= counter + immediate_shift;
                if(branch_sel) counter <= if_branch;
            end
    end
endmodule
