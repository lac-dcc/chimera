// This program was cloned from: https://github.com/ustb-owl/Uranus
// License: GNU General Public License v3.0

`timescale 1ns / 1ps

module Divider16t(
    input clk,
    input rst,
    input en,
    input [31:0] divident,
    input [31:0] divisor,
    output [31:0] quotient,
    output [31:0] remainder,
    output reg div0,
    output done
);

    parameter kDivFree = 2'b00, kDivByZero = 2'b01,
              kDivOn = 2'b10, kDivEnd = 2'b11;

    reg[64:0] reg_result;    // reg for result {remainder, 1'b0, quotient}
    reg[64:0] reg_d;         // divisor * 1
    reg[5:0] i;
    reg[1:0] state;

    wire[64:0] mind;         // divisor * 0.5
    wire[64:0] maxd;         // divisor * 1.5

    reg[31:0] last_divident, last_divisor;
    wire start_flag = {last_divident, last_divisor} != {divident, divisor};

    assign mind = reg_d >> 1;
    assign maxd = reg_d + mind;
    assign quotient = reg_result[31:0];
    assign remainder = reg_result[64:33];
    assign done = state == kDivFree;

    always @(posedge clk) begin
        if (!rst) begin
            state <= kDivFree;
            div0 <= 0;
            reg_result <= 0;
            last_divident <= 0;
            last_divisor <= 0;
        end
        else begin
            case (state)
                kDivFree: begin
                    if (en && start_flag) begin
                        last_divident <= divident;
                        last_divisor <= divisor;
                        if (!divisor) begin
                            state <= kDivByZero;
                        end
                        else begin
                            state <= kDivOn;
                            reg_result <= {32'b0, divident, 1'b0};
                            reg_d <= {1'b0, divisor, 32'b0};
                            i <= 6'b0;
                        end
                    end
                    else begin
                        state <= kDivFree;
                    end
                end
                kDivByZero: begin
                    div0 <= 1;
                    state <= kDivEnd;
                end
                kDivOn: begin
                    i <= i + 1;
                    div0 <= 0;
                    if (reg_result >= maxd) begin
                        reg_result <= ((reg_result - maxd) << 2) + 2'b11;
                    end
                    else if (reg_result < maxd && reg_result >= reg_d) begin
                        reg_result <= ((reg_result - reg_d) << 2) + 2'b10;
                    end
                    else if (reg_result < reg_d && reg_result >= mind) begin
                        reg_result <= ((reg_result - mind) << 2) + 2'b01;
                    end
                    else begin
                        reg_result <= reg_result << 2;
                    end
                    if (i == 15) begin
                        i <= 0;
                        state <= kDivEnd;
                    end
                end
                kDivEnd: begin
                    div0 <= 0;
                    state <= kDivFree;
                end
                default:;
            endcase
        end
    end

endmodule
