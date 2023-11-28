module read_text (
  input wire clk,      // Clock signal
  input wire rst,      // Reset signal
  input wire switch,   // Switch signal
  output reg [31:0] inst_mem [0:31]
);

  always @(posedge clk or posedge rst) begin
    if (rst) begin
      // Reset the memory array when the reset signal is asserted
      inst_mem <= 32'h00000000;
    end else if (posedge switch) begin
      // Read instructions from the file on the positive edge of the switch
      $readmemb("instructions.txt", inst_mem);
      $display("instruction is %h", inst_mem[0]);
      $display("instruction is %h", inst_mem[31]);
      $display("instruction is %h", inst_mem[10]);
      $display("instruction is %h", inst_mem[5]);
    end
  end

endmodule
