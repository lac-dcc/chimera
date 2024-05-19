// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

`include "../../define/bus.v"
`include "../../define/funct.v"

module MultDiv(
    input clk,
    input rst,
    input flush,
    input [`FUNCT_BUS] funct,
    input [`DATA_BUS] operand_1,
    input [`DATA_BUS] operand_2,
    input [`DATA_BUS] hi,
    input [`DATA_BUS] lo,
    output done,
    output reg[`DOUBLE_DATA_BUS] result
);

    parameter kDivCycle = 17, kMultCycle = 1;

    reg[kDivCycle - 1:0] cycle_counter;
    reg[`FUNCT_BUS] last_funct;
    reg[`DOUBLE_DATA_BUS] mult_result;
    reg done_flag;

    wire signed_flag, result_neg_flag, remainder_neg_flag;
    wire div_div0, div_done;
    wire[`DATA_BUS] op_1, op_2;
    wire[`DATA_BUS] quotient, remainder;

    assign signed_flag = funct == `FUNCT_MULT || funct == `FUNCT_DIV   || 
                         funct == `FUNCT2_MUL || funct == `FUNCT2_MADD ||
                         funct == `FUNCT2_MSUB;
    assign result_neg_flag = signed_flag && (operand_1[31] ^ operand_2[31]);
    assign remainder_neg_flag = signed_flag && (operand_1[31] ^ remainder[31]);
    assign op_1 = (signed_flag && operand_1[31]) ? -operand_1 : operand_1;
    assign op_2 = (signed_flag && operand_2[31]) ? -operand_2 : operand_2;
    assign done = cycle_counter[0] | done_flag;

    // divider
    Divider16t divider(
        clk, rst, funct == `FUNCT_DIV || funct == `FUNCT_DIVU,
        op_1, op_2, quotient, remainder,
        div_div0, div_done
    );

    always @(posedge clk) begin
        mult_result <= op_1 * op_2;
    end

    always @(*) begin
        case (funct)
            `FUNCT_MULT, `FUNCT_MULTU,
            `FUNCT2_MUL: begin
                result <= result_neg_flag ? -mult_result : mult_result;
            end
            `FUNCT2_MADD, `FUNCT2_MADDU:    begin
                result <= result_neg_flag ? -mult_result + {hi, lo} : mult_result + {hi, lo};
            end
            `FUNCT2_MSUB, `FUNCT2_MSUBU: begin
                result <= result_neg_flag ? mult_result + {hi, lo} : -mult_result + {hi, lo};
            end
            `FUNCT_DIV, `FUNCT_DIVU: begin
                result <= {
                    remainder_neg_flag ? -remainder : remainder,
                    result_neg_flag ? -quotient : quotient
                };
            end
            default: result <= 0;
        endcase
    end

    always @(posedge clk) begin
        if (!rst || flush) begin
            cycle_counter <= 0;
        end
        else if (cycle_counter) begin
            cycle_counter <= cycle_counter >> 1;
        end
        else begin
            case (funct)
                `FUNCT_MULT, `FUNCT_MULTU,
                `FUNCT2_MUL, `FUNCT2_MADD, `FUNCT2_MADDU,
                `FUNCT2_MSUB, `FUNCT2_MSUBU: begin
                    cycle_counter <= 1'b1 << (kMultCycle - 1);
                end
                `FUNCT_DIV, `FUNCT_DIVU: begin
                    cycle_counter <= 1'b1 << (kDivCycle - 1);
                end
                default: begin
                    cycle_counter <= 0;
                end
            endcase
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            last_funct <= 0;
        end
        else begin
            last_funct <= funct;
        end
    end

    always @(posedge clk) begin
        if (!rst) begin
            done_flag <= 0;
        end
        else if (last_funct != funct) begin
            done_flag <= 0;
        end
        else if (cycle_counter) begin
            done_flag <= cycle_counter[0];
        end
    end

endmodule // MultDiv
