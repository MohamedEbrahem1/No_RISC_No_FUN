`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 09:04:19 PM
// Design Name: 
// Module Name: ALU
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


module ALU #(parameter n = 32) (
    input clk, 
    input [n-1:0] rs1,  // how to make sure that it's the same n? 
    input [n-1:0] rs2,  
    input [31:0] inst,
    output reg [n-1:0] res, 
    output reg zf
    );
    wire [6:0] opcode = inst [6:0];
    wire [2:0] func3 = inst[14:12];
    reg [6:0] func7;
    reg [11:0] imm;
        
     always @(posedge clk) begin 
     
     
     
     
        if (opcode == 7'b0110011) begin 
             // R instructions 
             func7 = inst[31:25];
             if (func3 == 3'b000) begin // add and sub 
                    if (func7 == 7'b0) begin 
                        res = rs1 + rs2;
                    end
                    else if (func7 == 7'b0100000) begin 
                        res = rs1 - rs2;
                    end
             end
             if (func3 == 3'b001) begin // SLL
                        res = rs1 << rs2; // check the logic, 
             end
             if (func3 == 3'b010) begin // SLT
                if (rs1 < rs2) begin 
                        res = 1; 
                end 
                else begin
                    res = 0;
                end
             end
             if (func3 == 3'b011) begin // SLTU // recheck
                if ((!rs1 +1) < (!rs2+1)) begin 
                        res = 1; 
                end 
                else begin
                    res = 0;
                end
             end
             if (func3 == 3'b100) begin // XOR
                        res = rs1 ^ rs2; // 
             end
             
             if (func3 == 3'b101) begin // SR
                        if (func7 ==7'b0000000) begin // SRL
                            res = rs1 >> rs2; 
                        end 
                        else if (func7 == 7'b0100000) begin //SRA
                            res = rs1 >>> rs2; 
             end
             end
             if (func3 == 3'b110) begin // OR
                        res = rs1 | rs2; 
             end
             
             if (func3 == 3'b111) begin // AND
                        res = rs1 & rs2; 
             end
        end
        
        
       
        else if (opcode == 7'b0010011) begin
             imm = inst[31:20]; 
             if (func3 == 3'b000) begin // ADDI
                        res = rs1 + imm; 
             end
             
             if (func3 == 3'b010) begin // SLTI
                if (rs1 < imm) begin 
                        res = 1; 
                end 
                else begin
                    res = 0;
                end
             end
             
             if (func3 == 3'b010) begin // SLTIU
                if ((!rs1+1) < (!imm+1)) begin 
                        res = 1; 
                end 
                else begin
                    res = 0;
                end
             end
             
             if (func3 == 3'b100) begin // XORI
                        res = rs1 ^ imm; 
             end
             
             if (func3 == 3'b110) begin // ORI
                        res = rs1 | imm; 
             end
             
             if (func3 == 3'b111) begin // ANDI
                        res = rs1 & imm; 
             end
        end
        
        
         zf = (res==0)? 1: 0; // assign zf


end
    
endmodule
