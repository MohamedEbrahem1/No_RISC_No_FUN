module select_reg (
  input [4:0] switches,
  output reg [4:0] number
);

  always @(*)
  begin
    case (switches)
      5'b00000: number = 5'b00000;
      5'b00001: number = 5'b00001;
      5'b00010: number = 5'b00010;
      5'b00011: number = 5'b00011;
      5'b00100: number = 5'b00100;
      5'b00101: number = 5'b00101;
      5'b00110: number = 5'b00110;
      5'b00111: number = 5'b00111;
      5'b01000: number = 5'b01000;
      5'b01001: number = 5'b01001;
      5'b01010: number = 5'b01010;
      5'b01011: number = 5'b01011;
      5'b01100: number = 5'b01100;
      5'b01101: number = 5'b01101;
      5'b01110: number = 5'b01110;
      5'b01111: number = 5'b01111;
      5'b10000: number = 5'b10000;
      5'b10001: number = 5'b10001;
      5'b10010: number = 5'b10010;
      5'b10011: number = 5'b10011;
      5'b10100: number = 5'b10100;
      5'b10101: number = 5'b10101;
      5'b10110: number = 5'b10110;
      5'b10111: number = 5'b10111;
      5'b11000: number = 5'b11000;
      5'b11001: number = 5'b11001;
      5'b11010: number = 5'b11010;
      5'b11011: number = 5'b11011;
      5'b11100: number = 5'b11100;
      5'b11101: number = 5'b11101;
      5'b11110: number = 5'b11110;
      5'b11111: number = 5'b11111;
      default: number = 5'bXXXXX; // Output 'X' if none of the cases match
    endcase
  end

endmodule