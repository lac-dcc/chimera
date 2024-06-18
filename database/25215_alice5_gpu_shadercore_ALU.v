// This program was cloned from: https://github.com/bradgrantham/alice5
// License: Apache License 2.0

// ALU
module ALU
    #(parameter WORD_WIDTH=32) 
(
    input wire clock,
    input wire [WORD_WIDTH-1:0] operand1,
    input wire [WORD_WIDTH-1:0] operand2,
    input wire [3:0] operator,
    output reg [WORD_WIDTH-1:0] result
);

    localparam ALU_OP_ADD = 4'd1;
    localparam ALU_OP_SUB = 4'd2;
    localparam ALU_OP_SLL = 4'd3;
    localparam ALU_OP_SRL = 4'd4;
    localparam ALU_OP_SRA = 4'd5;
    localparam ALU_OP_XOR = 4'd6;
    localparam ALU_OP_AND = 4'd7;
    localparam ALU_OP_OR = 4'd8;
    localparam ALU_OP_SLT = 4'd9;
    localparam ALU_OP_SLTU = 4'd10;
    localparam ALU_OP_NONE = 4'd11;

    always @(posedge clock) begin

        case(operator)
           ALU_OP_ADD: begin
               result <= $signed(operand1) + $signed(operand2);
           end
           ALU_OP_SUB: begin
               result <= $signed(operand1) - $signed(operand2);
           end
           ALU_OP_SLL: begin
               result <= operand1 << operand2;
           end
           ALU_OP_SRL: begin
               result <= operand1 >> operand2;
           end
           ALU_OP_SRA: begin
               result <= $signed(operand1) >>> operand2;
           end
           ALU_OP_XOR: begin
               result <= operand1 ^ operand2;
           end
           ALU_OP_AND: begin
               result <= operand1 & operand2;
           end
           ALU_OP_OR: begin
               result <= operand1 | operand2;
           end
           ALU_OP_SLT: begin
               result <= ($signed(operand1) < $signed(operand2)) ? 1 : 0;
           end
           ALU_OP_SLTU: begin
               result <= (operand1 < operand2) ? 1 : 0;
           end
           ALU_OP_NONE: begin
           end
           default: begin
               result <= 32'hdeafca75;
           end
        endcase

    end

endmodule

