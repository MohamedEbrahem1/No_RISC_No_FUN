`timescale 1ns / 1ps

module SevenSegDis(input clk_in, input  [12:0] num,input rst,
 output  [3:0] Anode,
 output  [6:0] seg
 );
 
 clk_divider #(250000) clkd (
        .clk_in(clk_in), 
        .reset(rst),  
        .clk_out(clk_x) 
    );
    
    wire [1:0] count;
    bin_counter_nbits #(.x(2),.n(4))  cristiano2
  (.clk(clk_x), .reset(rst), .en(1'b1),
   .count(count));
   
    reg sign;
    reg [3:0] units ;
    reg[3:0] tens ;
    reg[3:0] hundreds ;
    reg[3:0] thousands ;
always@(*) begin
    sign <= num[12];
      units <= num % 10;
      tens <= (num %100)/10;
      hundreds <= (num % 1000)/100;
      thousands <= sign ? 10 : num/1000;
end
 wire [3:0] dec;
    mux4x1 cristiano4 (.in0(units ),.in1(tens ),.in2(hundreds ),.in3(thousands ),.s(count),.out(dec));
   
    SevenSegDecWithEn cristiano(
 .en(count),
.num(dec),
.seg(seg),
.anode_active(Anode));

 endmodule  