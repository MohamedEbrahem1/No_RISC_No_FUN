`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/24/2023 06:15:53 PM
// Design Name: 
// Module Name: procedural_decoder
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


module SevenSegDecWithEn(
//input en,
 input [0:1] en,
input [3:0] num,
output reg [6:0] seg,
output reg [3:0] anode_active);
always @ (*) begin
 case(num)
            0 : seg = 7'b0000001;
            1 : seg = 7'b1001111;
            2 : seg = 7'b0010010;
            3 : seg = 7'b0000110;
            4 : seg = 7'b1001100;
            5 : seg = 7'b0100100;
            6 : seg = 7'b0100000;
            7 : seg = 7'b0001111;
            8 : seg = 7'b0000000;
            9 : seg = 7'b0000100;
            10 : seg = 7'b0001000;
            11 : seg = 7'b1100000;
            12 : seg = 7'b0110001;
            13 : seg = 7'b1000010;
            14 : seg = 7'b0110000;
            15 : seg = 7'b0111000;

endcase

if (en == 2'b00)
anode_active = 4'b1110;
 else if( en == 2'b01 )
anode_active = 4'b1101;
 else if( en == 2'b10 )
anode_active = 4'b1011;
 else if( en == 2'b11 )
anode_active = 4'b0111;
 else anode_active = 4'b0;
end
endmodule

