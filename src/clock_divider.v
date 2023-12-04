`timescale 1ns / 1ps



module clk_divider #(parameter DIVIDE_BY = 50000000)(
    input wire clk_in,
    input wire reset,    
    output reg clk_out  
);

wire [31:0] count;
modulo_counter #(.x(32),.n(DIVIDE_BY)) counterMod
(.clk(clk_in), .reset(reset), .enable(1), .count(count));
always @ (posedge clk_in, posedge reset) begin
if (reset)
clk_out <= 0;
else if (count == DIVIDE_BY-1)
clk_out <= ~ clk_out;  

end


endmodule
