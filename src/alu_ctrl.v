module alu_ctrl (
    input [1:0] alu_op,
    input [5:0] instruction,
    output reg [3:0] alu_ctrl
);

    assign alu_ctrl = 4'b0000;

    always @* begin
        case (instruction)
            6'b000000: alu_ctrl = 4'b0000;
            6'b000001: alu_ctrl = 4'b0001;
            // Add more cases for different instruction values
            // ...
            default: alu_ctrl = 4'b0000;
        endcase
    end

endmodule
