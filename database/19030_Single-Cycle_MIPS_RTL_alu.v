// This program was cloned from: https://github.com/ahmd-kamel/Single-Cycle_MIPS
// License: The Unlicense

module ALU #(
    parameter DATA_WIDTH = 32,
    parameter OP_WIDTH = 3
) (
    input wire [DATA_WIDTH - 1 : 0] operand_a, operand_b,
    input wire [OP_WIDTH - 1 : 0] alu_ctrl,
    output reg [DATA_WIDTH - 1 : 0] alu_output,
    output reg zero_flag
);

    localparam AND = 3'b000;
    localparam OR  = 3'b001;
    localparam ADD = 3'b010;
    localparam SUB = 3'b100;
    localparam MUL = 3'b101;
    localparam SLT  = 3'b110;

    always @(*) begin

        case (alu_ctrl)
            AND: alu_output = operand_a & operand_b;
            OR : alu_output = operand_a | operand_b;
            ADD: alu_output = operand_a + operand_b;
            SUB: alu_output = operand_a - operand_b;
            MUL: alu_output = operand_a * operand_b;
            SLT: alu_output = (operand_a < operand_b) ? 32'b1 : 32'b0;
            default : alu_output = 32'b0;
        endcase
        
        zero_flag = (alu_output == 0) ? 1'b1 : 1'b0;
    end

endmodule