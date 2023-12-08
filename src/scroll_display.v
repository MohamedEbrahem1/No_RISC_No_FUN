`timescale 1ns / 1ps

module scrollDisplay(
    input clk, 
    input rst,  
    input btn_right, 
    input btn_left, 
    input [31:0] num, 
    output [3:0] Anode,  
    output [6:0] seg
);

    reg [5:0] scroll_index = 6'b0;
    wire out1, out2;

    SMASH_buttondetector R (.clk_in(clk_in), .rst(rst), .in(btn_right), .out(out1));
    SMASH_buttondetector L (.clk_in(clk_in), .rst(rst), .in(btn_left), .out(out2));


  wire [1:0] out_cat = {out1, out2};

    SevenSegDis display (
        .clk_in(clk),
        .num({4'b0, num[scroll_index +: 4]}),
        .rst(rst),
        .Anode(Anode),
        .seg(seg)
    );

    always @(posedge clk) begin
        if (rst) begin
            scroll_index <= 6'b0;
        end else begin
            if (out_cat == 2'b10) begin
                if (scroll_index < 28)
                    scroll_index <= scroll_index + 1;
            end 
		else if (out_cat == 2'b01) begin
                if (scroll_index > 0)
                   scroll_index <= scroll_index - 1;
            end
		else scroll_index <= scroll_index;
        end

    end

endmodule
