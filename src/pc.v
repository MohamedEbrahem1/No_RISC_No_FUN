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


module pc (
    input clk,
    input rst,
    input [31:0] immediate,
    input branch_sel,
    input [25:0] instruction_25,
    input jump,
    output reg [9:0] counter
);
    wire [31:0] immediate_shift;
    wire [31:0] if_branch;
    wire [31:0] if_jump;
    reg [1:0] shift_amount = 2'd1;
    assign immediate_shift = immediate * 2'd2;
    assign if_branch = counter + immediate_shift;
    always @(posedge clk or posedge rst) begin
        if (rst == 1) begin
            counter <= 0;
        end
        else if (counter < 64) begin
            if (branch_sel) begin
                counter <= if_branch;
            end
            else if (jump) begin
//                counter <= counter + ;
            end
            else begin
                counter <= counter + 10'd4;
            end
        end else begin
            counter <= 10'd128;
        end
    end
endmodule
