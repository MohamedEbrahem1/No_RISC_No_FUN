`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/09/2023 01:04:27 PM
// Design Name: 
// Module Name: scrollDisplay
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


`timescale 1ns / 1ps

module scrollDisplay(
    input clk, 
    input rst,  
    input btn_right, 
    input btn_left,
    input btn_center, 
    input [31:0] num, 
    output [3:0] Anode,  
    output [6:0] seg,
    output [0:31] instruction
);

    reg [5:0] scroll_index = 6'b0;
    wire out1, out2, out3;

    SMASH_buttondetector R (.clk_in(clk), .rst(rst), .in(btn_right), .out(out1));
    SMASH_buttondetector L (.clk_in(clk), .rst(rst), .in(btn_left), .out(out2));
    SMASH_buttondetector C (.clk_in(clk), .rst(rst), .in(btn_center), .out(out3));

    SevenSegDis display (
        .clk_in(clk),
        .num({4'b0, num[scroll_index +: 4]}),
        .rst(rst),
        .Anode(Anode),
        .seg(seg)
    );

    reg reload = 0;
    instruction_memory Load(
        .address(scroll_index),
        .instruction(instruction),
        .reload(reload)
    );

    always @(posedge clk) begin
        if (rst) begin
            scroll_index <= 6'b0;
            reload <= 0;
        end else begin
            if (out1) begin 
                if (scroll_index < 28)
                    scroll_index <= scroll_index + 1;
            end else if (out2) begin 
                if (scroll_index > 0)
                    scroll_index <= scroll_index - 1;
            end
            if (out3) begin
                reload <= 1;
            end else begin
                reload <= 0;
            end
        end
    end
endmodule

