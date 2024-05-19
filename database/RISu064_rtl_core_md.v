// This program was cloned from: https://github.com/zephray/RISu064
// License: MIT License

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
`include "defines.vh"

module md(
    input  wire         clk,
    input  wire         rst,
    // To Issue
    input  wire [63:0]  ix_md_pc,
    input  wire [4:0]   ix_md_dst,
    input  wire [63:0]  ix_md_operand1,
    input  wire [63:0]  ix_md_operand2,
    input  wire [2:0]   ix_md_md_op,
    input  wire         ix_md_muldiv,
    input  wire         ix_md_speculate,
    input  wire         ix_md_valid,
    output wire         ix_md_ready,
    // Hazard detection
    output wire [4:0]   md_ix_dst,
    output wire         md_ix_active,
    // To writeback
    output wire [4:0]   md_wb_dst,
    output wire [63:0]  md_wb_result,
    output wire [63:0]  md_wb_pc,
    output wire         md_wb_wb_en,
    output wire         md_wb_valid,
    input  wire         md_wb_ready,
    // Pipeline flush
    input  wire         md_abort
);

    wire req_unit = ix_md_muldiv;
    reg active_unit;
    reg active;
    reg [63:0] pc;
    reg [4:0] dst;

    wire mul_req_ready;
    wire mul_resp_valid;
    wire [63:0] mul_resp_result;
    mul mul(
        .clk(clk),
        .rst(rst),
        .operand1(ix_md_operand1),
        .operand2(ix_md_operand2),
        .mul_op(ix_md_md_op),
        .req_valid(ix_md_valid && (ix_md_muldiv == `MD_MUL) && !md_abort),
        .req_ready(mul_req_ready),
        .resp_result(mul_resp_result),
        .resp_valid(mul_resp_valid),
        .resp_ready(md_wb_ready_int)
    );

    wire div_req_ready;
    wire div_resp_valid;
    wire [63:0] div_resp_result;
    div div(
        .clk(clk),
        .rst(rst),
        .operand1(ix_md_operand1),
        .operand2(ix_md_operand2),
        .div_op(ix_md_md_op),
        .req_valid(ix_md_valid && (ix_md_muldiv == `MD_DIV) && !md_abort),
        .req_ready(div_req_ready),
        .resp_result(div_resp_result),
        .resp_valid(div_resp_valid),
        .resp_ready(md_wb_ready_int)
    );

    assign ix_md_ready = !active;

    assign md_ix_dst = dst;
    assign md_ix_active = active;

    assign md_wb_dst = dst;
    assign md_wb_result = (active_unit == `MD_MUL) ?
            (mul_resp_result) : (div_resp_result);
    assign md_wb_pc = pc;
    wire md_wb_valid_int = (active_unit == `MD_MUL) ?
            (mul_resp_valid) : (div_resp_valid);
    assign md_wb_valid = md_wb_valid_int && !abort_requested;
    wire md_wb_ready_int = md_wb_ready || abort_requested;

    // Abortion is only valid the 0th and 1st cycle it started.
    reg abort_valid;
    reg abort_requested;

    always @(posedge clk) begin
        if (!active) begin
            if (ix_md_valid && ix_md_ready && !md_abort) begin
                active <= 1'b1;
                // Only speculated instructions can be cancelled
                abort_valid <= ix_md_speculate;
                active_unit <= req_unit;
                pc <= ix_md_pc;
                dst <= ix_md_dst;
            end
        end
        else begin
            if (md_abort && abort_valid) begin
                abort_requested <= 1'b1;
            end
            if (md_wb_valid_int && md_wb_ready_int) begin
                active <= 1'b0;
                abort_requested <= 1'b0;
            end
            abort_valid <= 1'b0;
        end

        if (rst) begin
            active <= 1'b0;
            abort_requested <= 1'b0;
        end
    end

    assign md_wb_wb_en = 1'b1;

endmodule
