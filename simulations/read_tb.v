`timescale 1ns / 1ps

module instruction_memory_tb;

    reg [3:0] address;

    wire [0:31] instruction;

    instruction_memory uut (
        .address(address), 
        .instruction(instruction)
    );

    initial begin

        address = 4'b0;

        #100;

        $monitor("Time = %t, Address = %b, Instruction = %b", $time, address, instruction);


        address = 4'b0001; #10;  // Test Address 1
        address = 4'b0010; #10;  // Test Address 2
        address = 4'b0011; #10;  // Test Address 3
        address = 4'b0100; #10;  // Test Address 4
        address = 4'b0101; #10;  // Test Address 5
        address = 4'b0110; #10;  // Test Address 6
        address = 4'b0111; #10;  // Test Address 7
        address = 4'b1000; #10;  // Test Address 8
        address = 4'b1001; #10;  // Test Address 9
        address = 4'b1010; #10;  // Test Address 10
        address = 4'b1011; #10;  // Test Address 11
        address = 4'b1100; #10;  // Test Address 12
        address = 4'b1101; #10;  // Test Address 13
        address = 4'b1110; #10;  // Test Address 14
        address = 4'b1111; #10;  // Test Address 15


        #100;
        $finish;
    end
      
endmodule
