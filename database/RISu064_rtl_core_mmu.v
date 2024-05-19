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

module mmu(
    input  wire         clk,
    input  wire         rst,
    // CSR settings
    input  wire [1:0]   mpp,
    input  wire [63:0]  satp,
    input  wire         tlb_invalidate_req,
    // Fault
    output wire         mmu_load_page_fault,
    output wire         mmu_store_page_fault,
    // Instruction memory interface
    input  wire [63:0]  if_req_addr,
    input  wire         if_req_valid,
    output wire         if_req_ready,
    output wire [63:0]  if_resp_rdata,
    output wire         if_resp_page_fault,
    output wire         if_resp_valid,
    output wire [63:0]  im_req_addr,
    output wire         im_req_valid,
    input  wire         im_req_ready,
    input  wire [63:0]  im_resp_rdata,
    input  wire         im_resp_valid,
    // Data memory interface
    input  wire [63:0]  lsp_req_addr,
    input  wire [63:0]  lsp_req_wdata,
    input  wire [7:0]   lsp_req_wmask,
    input  wire         lsp_req_wen,
    input  wire         lsp_req_valid,
    output wire         lsp_req_ready,
    output wire [63:0]  lsp_resp_rdata,
    output wire         lsp_resp_valid,
    output wire [63:0]  dm_req_addr,
    output wire [63:0]  dm_req_wdata,
    output wire [7:0]   dm_req_wmask,
    output wire         dm_req_wen,
    output wire         dm_req_valid,
    input  wire         dm_req_ready,
    input  wire [63:0]  dm_resp_rdata,
    input  wire         dm_resp_valid
);

`ifdef ENABLE_MMU
    wire translation_enable = satp[63:60] == `SATP_MODE_SV39;
    wire [15:0] asid = satp[59:44];
    wire [43:0] ptppn = satp[43:0];

    // Extremely simple PIPT implementation, going to kill the Fmax
    localparam TS_IDLE = 2'd0;
    localparam TS_MISS = 2'd1;
    localparam TS_RETRY = 2'd2;

    // INSTRUCTION
    reg [1:0] itlb_state;
    reg instruction_page_fault;
    reg [63:0] itlb_retry_addr;
    wire itlb_retry_valid = itlb_state == TS_RETRY;
    wire im_req_comb_path = itlb_state == TS_IDLE;
    wire im_resp_comb_path = itlb_state == TS_IDLE; // maybe retry
    wire itlb_ready = itlb_state == TS_IDLE; // TODO

    wire [63:0] itlb_pa;
    wire itlb_hit;
    wire itlb_pte_valid;
    wire itlb_pte_read;
    wire itlb_pte_write;
    wire itlb_pte_execute;
    wire itlb_pte_user;
    wire itlb_pte_global;
    wire itlb_pte_dirty;

    // To PTW
    reg itlb_ptw_req_valid;
    wire itlb_ptw_req_ready; 
    wire [63:0] itlb_ptw_req_addr = itlb_retry_addr;
    // From PTW
    wire itlb_new_pte_req;
    wire [26:0] itlb_new_tag;
    wire [63:0] itlb_new_pte;

    tlb itlb(
        .clk(clk),
        .rst(rst),
        .va(im_req_comb_path ? if_req_addr : itlb_retry_addr),
        .asid(asid),
        .rreq(im_req_comb_path ? if_req_valid : itlb_retry_valid),
        .pa(itlb_pa),
        .hit(itlb_hit),
        .pte_valid(itlb_pte_valid),
        .pte_read(itlb_pte_read),
        .pte_write(itlb_pte_write),
        .pte_execute(itlb_pte_execute),
        .pte_user(itlb_pte_user),
        .pte_global(itlb_pte_global),
        .pte_dirty(itlb_pte_global),
        .new_pte_req(itlb_new_pte_req),
        .new_tag(itlb_new_tag),
        .new_pte(itlb_new_pte),
        .invalidate_req(tlb_invalidate_req)
    );

    always @(posedge clk) begin
        case (itlb_state)
        TS_IDLE: begin
            itlb_retry_addr <= if_req_addr;
            instruction_page_fault <= 1'b0;
            if (translation_enable && if_req_valid && !im_req_valid) begin
                if (!itlb_hit) begin
                    // TLB miss
                    itlb_ptw_req_valid <= 1'b1;
                    itlb_state <= TS_MISS;
                end
                else begin
                    // Priviledge check failed
                    instruction_page_fault <= 1'b1;
                end
            end
        end
        TS_MISS: begin
            if (itlb_ptw_req_ready) begin
                itlb_ptw_req_valid <= 1'b0;
                itlb_state <= TS_RETRY;
            end
        end
        TS_RETRY: begin
            itlb_state <= TS_IDLE;
        end
        endcase

        if (rst) begin
            itlb_state <= TS_IDLE;
        end
    end

    wire access_valid = itlb_hit && itlb_pte_valid &&
            ((mpp == `MSTATUS_MPP_MACHINE) ||
            ((mpp == `MSTATUS_MPP_SUPERVISOR) && !itlb_pte_user) ||
            ((mpp == `MSTATUS_MPP_USER) && itlb_pte_user)) &&
            (itlb_pte_execute);

    assign im_req_addr = translation_enable ? itlb_pa : if_req_addr;
    assign im_req_valid = translation_enable ? access_valid : if_req_valid;
    assign if_req_ready = im_req_comb_path ? im_req_ready : itlb_ready;
    assign if_resp_rdata = im_resp_rdata;
    assign if_resp_valid = im_resp_comb_path ? im_resp_valid : 1'b0;
    assign if_resp_page_fault = instruction_page_fault;

    // DATA
    wire [63:0] dtlb_pa;
    wire dtlb_hit;
    wire dtlb_pte_valid;
    wire dtlb_pte_read;
    wire dtlb_pte_write;
    wire dtlb_pte_execute;
    wire dtlb_pte_user;
    wire dtlb_pte_global;
    wire dtlb_pte_dirty;

    // To PTW
    reg [1:0] dtlb_state;
    reg [63:0] dtlb_retry_addr;
    wire dtlb_retry_valid = dtlb_state == TS_RETRY;
    wire dm_req_comb_path = dtlb_state == TS_IDLE;
    wire dm_resp_comb_path = dtlb_state == TS_IDLE;
    wire dtlb_ready = dtlb_state == TS_IDLE;

    reg dtlb_ptw_req_valid;
    reg dtlb_ptw_req_is_store;
    wire dtlb_ptw_req_ready;
    wire [63:0] dtlb_ptw_req_addr = dtlb_retry_addr;
    // From PTW
    wire dtlb_new_pte_req;
    wire [26:0] dtlb_new_tag;
    wire [63:0] dtlb_new_pte;

    tlb dtlb(
        .clk(clk),
        .rst(rst),
        .va(dm_req_comb_path ? lsp_req_addr : dtlb_retry_addr),
        .asid(asid),
        .rreq(dm_req_comb_path ? lsp_req_valid : dtlb_retry_valid),
        .pa(dtlb_pa),
        .hit(dtlb_hit),
        .pte_valid(dtlb_pte_valid),
        .pte_read(dtlb_pte_read),
        .pte_write(dtlb_pte_write),
        .pte_execute(dtlb_pte_execute),
        .pte_user(dtlb_pte_user),
        .pte_global(dtlb_pte_global),
        .pte_dirty(dtlb_pte_global),
        .new_pte_req(dtlb_new_pte_req),
        .new_tag(dtlb_new_tag),
        .new_pte(dtlb_new_pte),
        .invalidate_req(tlb_invalidate_req)
    );

    reg load_page_fault;
    reg store_page_fault;
    always @(posedge clk) begin
        case (dtlb_state)
        TS_IDLE: begin
            dtlb_retry_addr <= lsp_req_addr;
            load_page_fault <= 1'b0;
            store_page_fault <= 1'b0;
            if (translation_enable && lsp_req_valid && !dm_lsp_req_valid) begin
                if (!dtlb_hit) begin
                    // TLB miss
                    dtlb_ptw_req_valid <= 1'b1;
                    dtlb_ptw_req_is_store <= lsp_req_wen;
                    dtlb_state <= TS_MISS;
                end
                else begin
                    // Priviledge check failed
                    if (lsp_req_wen)
                        store_page_fault <= 1'b1;
                    else
                        load_page_fault <= 1'b1;
                end
            end
        end
        TS_MISS: begin
            if (dtlb_ptw_req_ready) begin
                dtlb_ptw_req_valid <= 1'b0;
                dtlb_state <= TS_RETRY;
            end
        end
        TS_RETRY: begin
            dtlb_state <= TS_IDLE;
        end
        endcase

        if (rst) begin
            dtlb_state <= TS_IDLE;
            load_page_fault <= 1'b0;
            store_page_fault <= 1'b0;
        end
    end
    assign mmu_load_page_fault = load_page_fault;
    assign mmu_store_page_fault = store_page_fault;

    wire access_valid = dtlb_hit && dtlb_pte_valid &&
            ((mpp == `MSTATUS_MPP_MACHINE) ||
            ((mpp == `MSTATUS_MPP_SUPERVISOR) && !dtlb_pte_user) ||
            ((mpp == `MSTATUS_MPP_USER) && dtlb_pte_user)) &&
            ((lsp_req_wen) ? dtlb_pte_write : dtlb_pte_read);

    wire [63:0] dm_lsp_req_addr;
    wire [63:0] dm_lsp_req_wdata;
    wire [7:0] dm_lsp_req_wmask;
    wire dm_lsp_req_wen;
    wire dm_lsp_req_valid;
    wire dm_lsp_req_ready;
    wire [63:0] dm_lsp_resp_rdata;
    wire dm_lsp_resp_valid;

    assign dm_lsp_req_addr = translation_enable ? dtlb_pa : lsp_req_addr;
    assign dm_lsp_req_wdata = lsp_req_wdata;
    assign dm_lsp_req_wmask = lsp_req_wmask;
    assign dm_lsp_req_wen = lsp_req_wen;
    assign dm_lsp_req_valid = translation_enable ? access_valid : lsp_req_valid;
    assign lsp_req_ready = dm_req_comb_path ? dm_lsp_req_ready : dtlb_ready;
    assign lsp_resp_rdata = dm_lsp_resp_rdata;
    assign lsp_resp_valid = dm_resp_comb_path ? dm_lsp_resp_valid : 1'b0;

    // PTW
    wire [63:0] ptw_req_addr;
    wire ptw_req_valid;
    wire ptw_req_is_execute;
    wire ptw_req_is_store;
    wire ptw_req_ready;
    wire tlb_new_pte_req;
    wire [26:0] tlb_new_tag;
    wire [63:0] tlb_new_pte;
    wire [63:0] dm_ptw_req_addr;
    wire [63:0] dm_ptw_req_wdata;
    wire [7:0] dm_ptw_req_wmask;
    wire dm_ptw_req_wen;
    wire dm_ptw_req_valid;
    wire dm_ptw_req_ready;
    wire [63:0] dm_ptw_resp_rdata;
    wire dm_ptw_resp_valid;

    ptw ptw (
        .clk(clk),
        .rst(rst),
        .mpp(mpp),
        .satp(satp),
        .req_addr(ptw_req_addr),
        .req_valid(ptw_req_valid),
        .req_is_execute(ptw_req_is_execute),
        .req_is_store(ptw_req_is_store),
        .req_ready(ptw_req_ready),
        .tlb_new_pte_req(tlb_new_pte_req),
        .tlb_new_tag(tlb_new_tag),
        .tlb_new_pte(tlb_new_pte),
        .dm_req_addr(dm_ptw_req_addr),
        .dm_req_wdata(dm_ptw_req_wdata),
        .dm_req_wmask(dm_ptw_req_wmask),
        .dm_req_wen(dm_ptw_req_wen),
        .dm_req_valid(dm_ptw_req_valid),
        .dm_req_ready(dm_ptw_req_ready),
        .dm_resp_rdata(dm_ptw_resp_rdata),
        .dm_resp_valid(dm_ptw_resp_valid)
    );

    // PTW request arbiter between ITLB and DTLB
    localparam ARB_I = 1'b0;
    localparam ARB_D = 1'b1;
    reg tlb_arb;

    assign ptw_req_addr = (tlb_arb == ARB_I) ? itlb_ptw_req_addr : dtlb_ptw_req_addr;
    assign ptw_req_valid = (tlb_arb == ARB_I) ? itlb_ptw_req_valid : dtlb_ptw_req_valid;
    assign ptw_req_is_execute = (tlb_arb == ARB_I) ? 1'b1 : 1'b0;
    assign ptw_req_is_store = (tlb_arb == ARB_I) ? 1'b0 : dtlb_ptw_req_is_store;

    assign itlb_ptw_req_ready = (tlb_arb == ARB_I) ? ptw_req_ready : 1'b0;;
    assign itlb_new_pte_req = (tlb_arb == ARB_I) ? tlb_new_pte_req : 1'b0;
    assign itlb_new_pte = tlb_new_pte;
    assign itlb_new_tag = tlb_new_tag;
    
    assign dtlb_ptw_req_ready = (tlb_arb == ARB_I) ? 1'b0 : ptw_req_ready;
    assign dtlb_new_pte_req = (tlb_arb == ARB_I) ? 1'b0 : tlb_new_pte_req;
    assign dtlb_new_pte = tlb_new_pte;
    assign dtlb_new_tag = tlb_new_tag;

    reg arb_busy;
    always @(posedge clk) begin
        if (!arb_busy) begin
            if (itlb_ptw_req_valid) begin
                tlb_arb <= ARB_I;
                arb_busy <= 1'b1;
            end
            else if (dtlb_ptw_req_valid) begin
                tlb_arb <= ARB_D;
                arb_busy <= 1'b1;
            end
        end
        else begin
            if (ptw_req_ready) begin
                arb_busy <= 1'b0;
            end
        end

        if (rst) begin
            tlb_arb <= ARB_I;
            arb_busy <= 1'b0;
        end
    end

    // DMEM arbiter
    kl_arbiter_2by1_lite dm_arbiter(
        .clk(clk),
        .rst(rst),
        .up0_req_addr(dm_lsp_req_addr),
        .up0_req_wen(dm_lsp_req_wen),
        .up0_req_wdata(dm_lsp_req_wdata),
        .up0_req_wmask(dm_lsp_req_wmask),
        .up0_req_valid(dm_lsp_req_valid),
        .up0_req_ready(dm_lsp_req_ready),
        .up0_resp_rdata(dm_lsp_resp_rdata),
        .up0_resp_valid(dm_lsp_resp_valid),
        .up0_resp_ready(1'b1),
        .up1_req_addr(dm_ptw_req_addr),
        .up1_req_wen(dm_ptw_req_wen),
        .up1_req_wdata(dm_ptw_req_wdata),
        .up1_req_wmask(dm_ptw_req_wmask),
        .up1_req_valid(dm_ptw_req_valid),
        .up1_req_ready(dm_ptw_req_ready),
        .up1_resp_rdata(dm_ptw_resp_rdata),
        .up1_resp_valid(dm_ptw_resp_valid),
        .up1_resp_ready(1'b1),
        .dn_req_addr(dm_req_addr),
        .dn_req_wen(dm_req_wen),
        .dn_req_wdata(dm_req_wdata),
        .dn_req_wmask(dm_req_wmask),
        .dn_req_valid(dm_req_valid),
        .dn_req_ready(dm_req_ready),
        .dn_resp_rdata(dm_resp_rdata),
        .dn_resp_valid(dm_resp_valid),
        .dn_resp_ready()
    );
`else
    // Pass through
    assign im_req_addr = if_req_addr;
    assign im_req_valid = if_req_valid;
    assign if_req_ready = im_req_ready;
    assign if_resp_rdata = im_resp_rdata;
    assign if_resp_valid = im_resp_valid;
    assign if_resp_page_fault = 1'b0;

    assign dm_req_addr = lsp_req_addr;
    assign dm_req_wdata = lsp_req_wdata;
    assign dm_req_wmask = lsp_req_wmask;
    assign dm_req_wen = lsp_req_wen;
    assign dm_req_valid = lsp_req_valid;
    assign lsp_req_ready = dm_req_ready;
    assign lsp_resp_rdata = dm_resp_rdata;
    assign lsp_resp_valid = dm_resp_valid;

    // Tie-off unused
    assign mmu_load_page_fault = 1'b0;
    assign mmu_store_page_fault = 1'b0;
`endif

endmodule
