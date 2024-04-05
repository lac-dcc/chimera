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

module wb(
    input  wire         clk,
    input  wire         rst,
    // To register file
    output wire         rf_wen0,
    output wire [4:0]   rf_wdst0,
    output wire [63:0]  rf_wdata0,
    output wire         rf_wen1,
    output wire [4:0]   rf_wdst1,
    output wire [63:0]  rf_wdata1,
    // From integer pipe 0
    input  wire [4:0]   ip0_wb_dst,
    input  wire [63:0]  ip0_wb_result,
    /* verilator lint_off UNUSED */
    input  wire [63:0]  ip0_wb_pc,
    /* verilator lint_on UNUSED */
    input  wire         ip0_wb_wb_en,
    input  wire         ip0_wb_hipri,
    input  wire         ip0_wb_valid,
    output wire         ip0_wb_ready,
    // From integer pipe 1
    input  wire [4:0]   ip1_wb_dst,
    input  wire [63:0]  ip1_wb_result,
    /* verilator lint_off UNUSED */
    input  wire [63:0]  ip1_wb_pc,
    /* verilator lint_on UNUSED */
    input  wire         ip1_wb_wb_en,
    input  wire         ip1_wb_hipri,
    input  wire         ip1_wb_valid,
    output wire         ip1_wb_ready,
    // From load-store pipe
    input  wire [4:0]   lsp_wb_dst,
    input  wire [63:0]  lsp_wb_result,
    /* verilator lint_off UNUSED */
    input  wire [63:0]  lsp_wb_pc,
    /* verilator lint_on UNUSED */
    input  wire         lsp_wb_wb_en,
    input  wire         lsp_wb_valid,
    output wire         lsp_wb_ready,
    // From muldiv unit
    input  wire [4:0]   md_wb_dst,
    input  wire [63:0]  md_wb_result,
    /* verilator lint_off UNUSED */
    input  wire [63:0]  md_wb_pc,
    input  wire         md_wb_wb_en,
    /* verilator lint_on UNUSED */
    input  wire         md_wb_valid,
    output wire         md_wb_ready,
    // From trap unit
    input  wire [4:0]   trap_wb_dst,
    input  wire [63:0]  trap_wb_result,
    /* verilator lint_off UNUSED */
    input  wire [63:0]  trap_wb_pc,
    /* verilator lint_on UNUSED */
    input  wire         trap_wb_wb_en,
    input  wire         trap_wb_valid,
    output wire         trap_wb_ready,
    // To IX for forwarding
    output wire [63:0]  wb_ix_buf_value,
    output wire [4:0]   wb_ix_buf_dst,
    output wire         wb_ix_buf_valid,
    // To trap unit
    output wire [2:0]   wb_trap_instret
);

    // Buffer up to 1 wb request when collision is detected
    reg [63:0] wb_buf;
    reg [4:0] wb_buf_dst;
    reg wb_buf_valid;
    reg [63:0] wb_buf_pc;

    // Writeback
    wire ip0_wb_req = ip0_wb_valid && ip0_wb_wb_en;
    wire ip1_wb_req = ip1_wb_valid && ip1_wb_wb_en;
    wire lsp_wb_req = lsp_wb_valid && lsp_wb_wb_en;
    wire md_wb_req = md_wb_valid;
    wire trap_wb_req = trap_wb_valid && trap_wb_wb_en;
    // Retire without writeback
    wire ip0_rwowb_req = ip0_wb_valid && !ip0_wb_wb_en;
    wire ip1_rwowb_req = ip1_wb_valid && !ip1_wb_wb_en;
    wire lsp_rwowb_req = lsp_wb_valid && !lsp_wb_wb_en;
    wire trap_rwowb_req = trap_wb_valid && !trap_wb_wb_en;
    // Always prefer accepting memory request for now
    // Current priority: buf > lsp > md > ip0 > ip1 > trap.
    reg buf_wb_ac;
    reg lsp_wb_ac;
    reg md_wb_ac;
    reg ip0_wb_ac;
    reg ip1_wb_ac;
    reg trap_wb_ac;
    reg [2:0] wb0_src;
    reg [2:0] wb1_src;

    localparam WB_SRC_NONE = 3'd0;
    localparam WB_SRC_BUF = 3'd1;
    localparam WB_SRC_LSP = 3'd2;
    localparam WB_SRC_MD = 3'd3;
    localparam WB_SRC_IP0 = 3'd4;
    localparam WB_SRC_IP1 = 3'd5;
    localparam WB_SRC_TRAP = 3'd6;

    always @(*) begin
        buf_wb_ac = 1'b0;
        lsp_wb_ac = 1'b0;
        md_wb_ac = 1'b0;
        ip0_wb_ac = 1'b0;
        ip1_wb_ac = 1'b0;
        trap_wb_ac = 1'b0;
        wb0_src = WB_SRC_NONE;
        wb1_src = WB_SRC_NONE;
        // Currently two IPs shouldn't issue hipri in the same cycle
        if (ip0_wb_req && ip0_wb_hipri) begin
            wb0_src = WB_SRC_IP0;
            ip0_wb_ac = 1'b1;
        end
        else if (ip1_wb_req && ip1_wb_hipri) begin
            wb0_src = WB_SRC_IP1;
            ip1_wb_ac = 1'b1;
        end
        if (wb_buf_valid) begin
            wb1_src = WB_SRC_BUF;
            buf_wb_ac = 1'b1;
        end
        if (lsp_wb_req) begin
            if (wb0_src == WB_SRC_NONE) begin
                wb0_src = WB_SRC_LSP;
                lsp_wb_ac = 1'b1;
            end
            else if (wb1_src == WB_SRC_NONE) begin 
                wb1_src = WB_SRC_LSP;
                lsp_wb_ac = 1'b1;
            end
        end
        if (md_wb_req) begin
            if (wb0_src == WB_SRC_NONE) begin
                wb0_src = WB_SRC_MD;
                md_wb_ac = 1'b1;
            end
            else if (wb1_src == WB_SRC_NONE) begin 
                wb1_src = WB_SRC_MD;
                md_wb_ac = 1'b1;
            end
        end
        if (ip0_wb_req && !ip0_wb_hipri) begin
            if (wb0_src == WB_SRC_NONE) begin
                wb0_src = WB_SRC_IP0;
                ip0_wb_ac = 1'b1;
            end
            else if (wb1_src == WB_SRC_NONE) begin 
                wb1_src = WB_SRC_IP0;
                ip0_wb_ac = 1'b1;
            end
        end
        if (ip1_wb_req && !ip1_wb_hipri) begin
            if (wb0_src == WB_SRC_NONE) begin
                wb0_src = WB_SRC_IP1;
                ip1_wb_ac = 1'b1;
            end
            else if (wb1_src == WB_SRC_NONE) begin 
                wb1_src = WB_SRC_IP1;
                ip1_wb_ac = 1'b1;
            end
        end
        if (trap_wb_req) begin
            wb0_src = WB_SRC_TRAP;
            trap_wb_ac = 1'b1;
        end
    end

    // Allow write to buffer either its empty or the value will be used this
    // cycle
    wire wb_buf_wr_common = !wb_buf_valid || buf_wb_ac;
    wire wb_buf_src_lsp = lsp_wb_req && !lsp_wb_ac && wb_buf_wr_common;
    wire wb_buf_src_ip0 = ip0_wb_req && !wb_buf_src_lsp && !ip0_wb_ac &&
            wb_buf_wr_common;
    wire wb_buf_src_ip1 = ip1_wb_req && !wb_buf_src_lsp && !wb_buf_src_ip0 &&
            !ip1_wb_ac && wb_buf_wr_common;

    wire wb0_active = wb0_src != WB_SRC_NONE;
    wire [4:0] wb0_dst =
            (wb0_src == WB_SRC_TRAP) ? trap_wb_dst :
            (wb0_src == WB_SRC_LSP) ? lsp_wb_dst :
            (wb0_src == WB_SRC_MD) ? md_wb_dst :
            (wb0_src == WB_SRC_IP0) ? ip0_wb_dst :
            (wb0_src == WB_SRC_IP1) ? ip1_wb_dst : 5'bx;
    wire [63:0] wb0_value =
            (wb0_src == WB_SRC_TRAP) ? trap_wb_result :
            (wb0_src == WB_SRC_LSP) ? lsp_wb_result :
            (wb0_src == WB_SRC_MD) ? md_wb_result :
            (wb0_src == WB_SRC_IP0) ? ip0_wb_result :
            (wb0_src == WB_SRC_IP1) ? ip1_wb_result : 64'bx;

    wire wb1_active = (wb1_src != WB_SRC_NONE) &&
            // WB1 has eariler value, if it's overwritten, drop it
            ((wb1_src != WB_SRC_BUF) || (wb1_dst != wb0_dst));
    wire [4:0] wb1_dst =
            (wb1_src == WB_SRC_BUF) ? wb_buf_dst :
            (wb1_src == WB_SRC_LSP) ? lsp_wb_dst :
            (wb1_src == WB_SRC_MD) ? md_wb_dst :
            (wb1_src == WB_SRC_IP0) ? ip0_wb_dst :
            (wb1_src == WB_SRC_IP1) ? ip1_wb_dst : 5'bx;
    wire [63:0] wb1_value =
            (wb1_src == WB_SRC_BUF) ? wb_buf :
            (wb1_src == WB_SRC_LSP) ? lsp_wb_result :
            (wb1_src == WB_SRC_MD) ? md_wb_result :
            (wb1_src == WB_SRC_IP0) ? ip0_wb_result :
            (wb1_src == WB_SRC_IP1) ? ip1_wb_result : 64'bx;

    always @(posedge clk) begin
        if (buf_wb_ac) begin
            wb_buf_valid <= 1'b0;
        end
        if (wb_buf_src_lsp) begin
            wb_buf <= lsp_wb_result;
            wb_buf_dst <= lsp_wb_dst;
            wb_buf_valid <= 1'b1;
            wb_buf_pc <= lsp_wb_pc;
        end
        if (wb_buf_src_ip0) begin
            wb_buf <= ip0_wb_result;
            wb_buf_dst <= ip0_wb_dst;
            wb_buf_valid <= 1'b1;
            wb_buf_pc <= ip0_wb_pc;
        end
        if (wb_buf_src_ip1) begin
            wb_buf <= ip1_wb_result;
            wb_buf_dst <= ip1_wb_dst;
            wb_buf_valid <= 1'b1;
            wb_buf_pc <= ip1_wb_pc;
        end

        if (rst) begin
            wb_buf_valid <= 1'b0;
        end
    end

    assign wb_ix_buf_dst = wb_buf_dst;
    assign wb_ix_buf_value = wb_buf;
    assign wb_ix_buf_valid = wb_buf_valid;

    `ifdef VERBOSE
    wire [63:0] wb0_pc =
            (wb0_src == WB_SRC_TRAP) ? trap_wb_pc :
            (wb0_src == WB_SRC_LSP) ? lsp_wb_pc :
            (wb0_src == WB_SRC_MD) ? md_wb_pc :
            (wb0_src == WB_SRC_IP0) ? ip0_wb_pc :
            (wb0_src == WB_SRC_IP1) ? ip1_wb_pc : 64'bx;
    wire [63:0] wb1_pc =
            (wb1_src == WB_SRC_BUF) ? wb_buf_pc :
            (wb1_src == WB_SRC_LSP) ? lsp_wb_pc :
            (wb1_src == WB_SRC_MD) ? md_wb_pc :
            (wb1_src == WB_SRC_IP0) ? ip0_wb_pc :
            (wb1_src == WB_SRC_IP1) ? ip1_wb_pc : 64'bx;
    always @(posedge clk) begin
        begin
            $display("TIME: %0t", $time);
            if (!wb1_active && (wb1_src == WB_SRC_BUF) && (wb1_dst && wb0_dst)) begin
                $display("PC %016x WB [%d] <- %016x", wb1_pc, wb1_dst, wb1_value);
            end
            if (wb0_active) begin
                $display("PC %016x WB [%d] <- %016x", wb0_pc, wb0_dst, wb0_value);
            end
            if (wb1_active) begin
                $display("PC %016x WB [%d] <- %016x", wb1_pc, wb1_dst, wb1_value);
            end
            if (ip0_rwowb_req) begin
                $display("PC %016x RETIRE FROM IP0", ip0_wb_pc);
            end
            if (ip1_rwowb_req) begin
                $display("PC %016x RETIRE FROM IP1", ip0_wb_pc);
            end
            if (lsp_rwowb_req) begin
                $display("PC %016x RETIRE FROM LSP", lsp_wb_pc);
            end
            if (trap_rwowb_req) begin
                $display("PC %016x RETIRE FROM TRAP", trap_wb_pc);
            end
        end
    end
    `endif

    assign rf_wen0 = wb0_active;
    assign rf_wdst0 = wb0_dst;
    assign rf_wdata0 = wb0_value;

    assign rf_wen1 = wb1_active;
    assign rf_wdst1 = wb1_dst;
    assign rf_wdata1 = wb1_value;

    // Acknowledge accepted wb, always acknowledge retire without writeback
    assign ip0_wb_ready = !(ip0_wb_valid && (!ip0_wb_ac && !ip0_rwowb_req && !wb_buf_src_ip0));
    assign ip1_wb_ready = !(ip1_wb_valid && (!ip1_wb_ac && !ip1_rwowb_req && !wb_buf_src_ip1));
    assign lsp_wb_ready = !(lsp_wb_valid && (!lsp_wb_ac && !lsp_rwowb_req && !wb_buf_src_lsp));
    assign md_wb_ready = !(md_wb_valid && !md_wb_ac);
    assign trap_wb_ready = !(trap_wb_valid && (!trap_wb_ac && !trap_rwowb_req));

    // Instruction retire count
    reg ip0_retire;
    reg ip1_retire;
    reg lsp_retire;
    reg md_retire;
    reg trap_retire;
    always @(posedge clk) begin
        ip0_retire <= (ip0_wb_valid && ip0_wb_ready);
        ip1_retire <= (ip1_wb_valid && ip1_wb_ready);
        lsp_retire <= (lsp_wb_valid && lsp_wb_ready);
        md_retire <= md_wb_ac;
        trap_retire <= (trap_wb_valid && trap_wb_ready);
        if (rst) begin
            ip0_retire <= 1'b0;
            ip1_retire <= 1'b0;
            lsp_retire <= 1'b0;
            md_retire <= 1'b0;
            trap_retire <= 1'b0;
        end
    end
    assign wb_trap_instret = {2'b0, ip0_retire} + {2'b0, ip1_retire} +
            {2'b0, lsp_retire} + {2'b0, md_retire} + {2'b0, trap_retire};

endmodule
