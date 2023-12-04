`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/27/2023 11:20:55 PM
// Design Name: 
// Module Name: driver
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


module driver(
    input clk_in,
    rst,
//    [4:0] instAddr,
    [4:0] switch,
    output [3:0] anode,
    [0:6] seg
);
    wire Branch, MemRead, MemtoReg, MemWrite, ALUSrc, RegWrite;
    wire [1:0] ALUOp;
    wire [31:0] rs1;
    wire [31:0] rs2;
    wire [31:0] res;
    wire [31:0] inst;
    wire zf;
    wire [3:0]alu_ctrl;
    reg [31:0] instructions; 
    reg [9:0] PC =9'b0;
    wire [31:0] immgenOut;
    wire [31:0] muxout;
    
    
    
    clk_divider #(10) clkd (
        .clk_in(clk_in), 
        .reset(rst),  
        .clk_out(clk) 
    );
    
    always@(posedge clk)
        begin
        
        
            if(rst == 1)
                PC <= 0;
            else if (PC < 52)
                  PC <= PC + 4;
            
        end
    instMem insts(.addr(PC[9:2]), .inst(inst));

//    always @( posedge clk) begin 
//        instructions = inst; 
//    end 
    
    aluctrl aluctrl( 
        .alu_op(ALUOp),  
        .func7bit30(inst[30]),
 
        .func3(inst[14:12]),
 
        .alu_ctrl(alu_ctrl)
        );
        
    ControlUnit cu (
        .opcode(inst[6:2]),
        .Branch(Branch), 
        .MemRead(MemRead), 
        .MemtoReg(MemtoReg), 
        .MemWrite(MemWrite), 
        .ALUSrc(ALUSrc), 
        .RegWrite(RegWrite), 
        .ALUOp(ALUOp)
        );
            wire [0:12] reg_value;

    regFile reg1 (
    .clk(clk), 
    .rst(rst), 
    .regWrite(RegWrite), 
    .readAddr1(inst[19:15]), 
    .readAddr2(inst[24:20]),
    .writeAddr(inst[11:7]), 
    .writeData(res), 
    .rs1(rs1), 
    .rs2(rs2),
    .reg_address(switch),
    .reg_display(reg_value)
    );   

    ImmGen gen (
        .inst(inst),
        .gen_out(immgenOut)
        );
    mux2x1 alumux ( 
        .a(rs2),
        .b(immgenOut),
        .s(ALUSrc),
        .out(muxout)
    );
    ALU alu1 (
        .clk(clk), 
        .rs1(rs1), 
        .rs2(muxout), 
        .inst(inst),
        .alu_ctrl(alu_ctrl), 
        .res(res), 
        .zf(zf)
        );

    SevenSegDis show_reg_data (
  .clk_in(clk_in),
  .rst(rst),
  .num(reg_value),
  .Anode(anode),
  .seg(seg)
);


    
endmodule
