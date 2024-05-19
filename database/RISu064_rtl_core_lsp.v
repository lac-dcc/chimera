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

// Load store pipeline
// Pipeline latency = 2+ cycle
module lsp(
    input  wire         clk,
    input  wire         rst,
    // D-mem interface
    output wire [63:0]  lsp_dm_req_addr,
    output wire [63:0]  lsp_dm_req_wdata,
    output wire [7:0]   lsp_dm_req_wmask,
    output wire         lsp_dm_req_wen,
    output wire         lsp_dm_req_valid,
    input  wire         lsp_dm_req_ready,
    input  wire [63:0]  lsp_dm_resp_rdata,
    input  wire         lsp_dm_resp_valid,
    // From issue
    input  wire [63:0]  ix_lsp_pc,
    input  wire [4:0]   ix_lsp_dst,
    input  wire         ix_lsp_wb_en,
    input  wire [63:0]  ix_lsp_base,
    input  wire [11:0]  ix_lsp_offset,
    input  wire [63:0]  ix_lsp_source,
    input  wire         ix_lsp_mem_sign,
    input  wire [1:0]   ix_lsp_mem_width,
    input  wire         ix_lsp_speculate,
    input  wire         ix_lsp_valid,
    output wire         ix_lsp_ready,
    // To issue for hazard detection
    output reg          lsp_ix_mem_busy,
    output wire         lsp_ix_mem_wb_en,
    output wire [4:0]   lsp_ix_mem_dst,
    output wire         lsp_ix_mem_result_valid,
    output wire [63:0]  lsp_ix_mem_result,
    // To writeback
    output reg  [4:0]   lsp_wb_dst,
    output reg  [63:0]  lsp_wb_result,
    output reg  [63:0]  lsp_wb_pc,
    output reg          lsp_wb_wb_en,
    output reg          lsp_wb_valid,
    input  wire         lsp_wb_ready,
    // Abort the current AG stage request
    input  wire         ag_abort,
    // Exception
    output reg          lsp_unaligned_load,
    output reg          lsp_unaligned_store,
    output wire [63:0]  lsp_unaligned_epc
);
    // Warning: this unit doesn't have enough internal buffer to be stalled
    // for more than 1 cycle. The WB must ensure request from this unit
    // is never rejected for more than 1 cycle
    // AGU
    wire [63:0] agu_addr;
    assign agu_addr = ix_lsp_base + {{52{ix_lsp_offset[11]}}, ix_lsp_offset};

    reg [63:0] ag_m_pc;
    reg [4:0] ag_m_dst;
    reg ag_m_wb_en;
    reg [2:0] ag_m_byte_offset;
    reg ag_m_mem_sign;
    reg [1:0] ag_m_mem_width;
    reg ag_m_speculate;
    reg m_abort;

    // Mask and data generation
    wire handshaking = ix_lsp_valid && ix_lsp_ready;
    wire ualign_h = (ix_lsp_mem_width == `MW_HALF) && (agu_addr[0] != 1'b0);
    wire ualign_w = (ix_lsp_mem_width == `MW_WORD) && (agu_addr[1:0] != 2'b0);
    wire ualign_d = (ix_lsp_mem_width == `MW_DOUBLE) && (agu_addr[2:0] != 3'b0);
    wire ualign = ualign_h || ualign_w || ualign_d;

    wire [63:0] mem_wdata =
            (ix_lsp_mem_width == `MW_BYTE) ? {8{ix_lsp_source[7:0]}} :
            (ix_lsp_mem_width == `MW_HALF) ? {4{ix_lsp_source[15:0]}} :
            (ix_lsp_mem_width == `MW_WORD) ? {2{ix_lsp_source[31:0]}} :
            ix_lsp_source;
    wire [7:0] mem_wmask_byte;
    wire [7:0] mem_wmask_half;
    wire [7:0] mem_wmask_word;
    genvar i;
    generate
    for (i = 0; i < 8; i = i + 1) begin
        assign mem_wmask_byte[i] = (agu_addr[2:0] == i);
    end
    for (i = 0; i < 4; i = i + 1) begin
        assign mem_wmask_half[i*2+1:i*2] = {2{mem_wmask_byte[i*2]}};
    end
    for (i = 0; i < 2; i = i + 1) begin
        assign mem_wmask_word[i*4+3:i*4] = {4{mem_wmask_byte[i*4]}};
    end
    endgenerate
    wire [7:0] mem_wmask =
            (ix_lsp_mem_width == `MW_BYTE) ? mem_wmask_byte :
            (ix_lsp_mem_width == `MW_HALF) ? mem_wmask_half :
            (ix_lsp_mem_width == `MW_WORD) ? mem_wmask_word :
            8'hff;

    always @(posedge clk) begin
        // Memory stage
        if ((lsp_wb_valid && lsp_wb_ready) || (!lsp_wb_valid)) begin
            lsp_wb_result <= m_wb_result;
            lsp_wb_pc <= ag_m_pc;
            lsp_wb_dst <= ag_m_dst;
            lsp_wb_wb_en <= ag_m_wb_en;
            lsp_wb_valid <= lsp_dm_resp_valid &&
                    (!m_abort && !(ag_m_speculate && ag_abort));
            m_abort <= 1'b0;
        end

        // It should only stay high for one cycle
        ag_m_speculate <= 1'b0;
        if (ag_m_speculate && ag_abort)
            m_abort <= 1'b1;

        if (lsp_dm_resp_valid) begin
            m_abort <= 1'b0;
            lsp_ix_mem_busy <= 1'b0;
        end

        // AG stage
        if (handshaking) begin
            ag_m_pc <= ix_lsp_pc;
            ag_m_dst <= ix_lsp_dst;
            ag_m_wb_en <= ix_lsp_wb_en;
            ag_m_byte_offset <= agu_addr[2:0];
            ag_m_mem_sign <= ix_lsp_mem_sign;
            ag_m_mem_width <= ix_lsp_mem_width;
            ag_m_speculate <= ix_lsp_speculate;
            lsp_unaligned_load <= !ag_abort && ualign && !ix_lsp_wb_en;
            lsp_unaligned_store <= !ag_abort && ualign && ix_lsp_wb_en;
            lsp_ix_mem_busy <= !ag_abort && !ualign;
        end
        else begin
            lsp_unaligned_load <= 1'b0;
            lsp_unaligned_store <= 1'b0;
        end

        if (rst) begin
            lsp_unaligned_load <= 1'b0;
            lsp_unaligned_store <= 1'b0;
            lsp_wb_valid <= 1'b0;
            m_abort <= 1'b0;
        end
    end

    assign lsp_unaligned_epc = ag_m_pc;

    // Same stage...
    assign lsp_dm_req_addr = agu_addr;
    assign lsp_dm_req_wdata = mem_wdata;
    assign lsp_dm_req_wmask = mem_wmask;
    assign lsp_dm_req_wen = !ix_lsp_wb_en;
    wire [1:0] m_wb_mem_width = ag_m_mem_width;;

    assign lsp_dm_req_valid = ix_lsp_valid && !rst && !ag_abort && !ualign;
    assign ix_lsp_ready = lsp_dm_req_ready || ag_abort || ualign;

    // Memory stage
    wire [63:0] mem_rd = lsp_dm_resp_rdata;

    wire [1:0] ag_m_half_offset = ag_m_byte_offset[2:1];
    wire ag_m_word_offset = ag_m_byte_offset[2];

    wire [7:0] mem_rd_bl [0:7];
    wire [15:0] mem_rd_hl [0:3];
    wire [31:0] mem_rd_wl [0:1];
    generate
        for (i = 0; i < 8; i = i + 1) begin
            assign mem_rd_bl[i] = mem_rd[i*8+7:i*8];
        end
        for (i = 0; i < 4; i = i + 1) begin
            assign mem_rd_hl[i] = mem_rd[i*16+15:i*16];
        end
        for (i = 0; i < 2; i = i + 1) begin
            assign mem_rd_wl[i] = mem_rd[i*32+31:i*32];
        end
    endgenerate


    wire [7:0] mem_rd_b = mem_rd_bl[ag_m_byte_offset];
    wire [15:0] mem_rd_h = mem_rd_hl[ag_m_half_offset];
    wire [31:0] mem_rd_w = mem_rd_wl[ag_m_word_offset];

    wire [63:0] mem_rd_bu = {56'b0, mem_rd_b};
    wire [63:0] mem_rd_bs = {{56{mem_rd_b[7]}}, mem_rd_b};
    wire [63:0] mem_rd_hu = {48'b0, mem_rd_h};
    wire [63:0] mem_rd_hs = {{48{mem_rd_h[15]}}, mem_rd_h};
    wire [63:0] mem_rd_wu = {32'b0, mem_rd_w};
    wire [63:0] mem_rd_ws = {{32{mem_rd_w[31]}}, mem_rd_w};

    wire [63:0] m_wb_result = 
        (m_wb_mem_width == `MW_BYTE) ? (ag_m_mem_sign ? mem_rd_bu : mem_rd_bs) :
        (m_wb_mem_width == `MW_HALF) ? (ag_m_mem_sign ? mem_rd_hu : mem_rd_hs) :
        (m_wb_mem_width == `MW_WORD) ? (ag_m_mem_sign ? mem_rd_wu : mem_rd_ws) :
        (mem_rd);

    // For hazard detection or forwarding (if forwarding is enabled)
    assign lsp_ix_mem_wb_en = ag_m_wb_en && lsp_ix_mem_busy;
    assign lsp_ix_mem_dst = ag_m_dst;
    assign lsp_ix_mem_result = m_wb_result;
    assign lsp_ix_mem_result_valid = lsp_dm_resp_valid &&
            (!m_abort && !(ag_m_speculate && ag_abort));

endmodule
