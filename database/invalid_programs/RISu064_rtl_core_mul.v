`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
// This is based on lowRISC's muntjac multiplier design.
`include "defines.vh"

module mul(
    input  wire         clk,
    input  wire         rst,
    input  wire [63:0]  operand1,
    input  wire [63:0]  operand2,
    input  wire [2:0]   mul_op,
    input  wire         req_valid,
    output wire         req_ready,
    output reg  [63:0]  resp_result,
    output reg          resp_valid,
    input  wire         resp_ready
);
    // TODO: Currently it registers its output before WB. This is probably
    // unnecessary (as it won't be the critical path). Provide an option for
    // combinationally output the result to WB.
    reg [64:0] mul_a;
    reg [64:0] mul_b;
    reg mul_high;
    reg mul_word;
    reg mul_lowf; // 64-bit operation but only 32-bit low values are valid

    wire mac_a_sel = state[1];
    wire mac_b_sel = state[0];

    reg [65:0] acc;
    wire [32:0] mac_a = mac_a_sel ? (mul_a[64:32]) : ({1'b0, mul_a[31:0]});
    wire [32:0] mac_b = mac_b_sel ? (mul_b[64:32]) : ({1'b0, mul_b[31:0]});
    wire [65:0] prod = acc + mac_a * mac_b;

    assign req_ready = (state == ST_IDLE) &&
            (!resp_valid || (resp_valid && resp_ready));

    localparam ST_IDLE = 3'd5;
    localparam ST_LL = 3'd0;
    localparam ST_HL = 3'd2;
    localparam ST_LH = 3'd1;
    localparam ST_HH = 3'd3;
    reg [2:0] state;
    always @(posedge clk) begin
        case (state)
        ST_IDLE: begin
            if (resp_valid && resp_ready)
                resp_valid <= 1'b0;
            if (req_ready && req_valid) begin
                mul_a <= {(mul_op == `MO_MULHU) ?
                        operand1[63] : 1'b0, operand1};
                mul_b <= {((mul_op == `MO_MULHSU) || (mul_op == `MO_MULHU)) ?
                        operand2[63] : 1'b0, operand2};
                mul_word <= mul_op == `MO_MULW;
                mul_high <= (mul_op == `MO_MULH) || (mul_op == `MO_MULHSU) ||
                        (mul_op == `MO_MULHU);
                if ((operand1[63:32] == 32'b0) && (operand2[63:32] == 32'b0) &&
                        (mul_op != `MO_MULW))
                    mul_lowf <= 1;
                acc <= 66'd0;
                state <= ST_LL;
            end
        end
        ST_LL: begin
            resp_result[31:0] <= prod[31:0];
            if (mul_word) begin
                resp_result[63:32] <= {32{prod[31]}};
                resp_valid <= 1'b1;
                state <= ST_IDLE;
            end
            else if (mul_lowf) begin
                resp_result[63:32] <= prod[63:32];
                resp_valid <= 1'b1;
                state <= ST_IDLE;
            end
            else begin
                acc <= {{32{prod[65]}}, prod[65:32]};
                state <= ST_HL;
            end
        end
        ST_HL: begin
            acc <= prod;
            state <= ST_LH;
        end
        ST_LH: begin
            resp_result[63:32] <= prod[31:0];
            if (!mul_high) begin
                resp_valid <= 1'b1;
                state <= ST_IDLE;
            end
            else begin
                acc <= {{32{prod[65]}}, prod[65:32]};
                state <= ST_HH;
            end
        end
        ST_HH: begin
            resp_result <= prod[63:0];
            resp_valid <= 1'b1;
            state <= ST_IDLE;
        end
        default: begin
            $display("ERROR: Multiplier entered invalid state");
            state <= ST_IDLE;
        end
        endcase

        if (rst) begin
            resp_valid <= 1'b0;
            state <= ST_IDLE;
        end
    end

endmodule
