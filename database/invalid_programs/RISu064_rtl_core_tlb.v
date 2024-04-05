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
`include "options.vh"

module tlb(
    input  wire         clk,
    input  wire         rst,
    input  wire [38:0]  va,
    input  wire [15:0]  asid,
    input  wire         rreq,
    output reg  [63:0]  pa,
    output reg          hit, // Found a matching TLB entry
    output reg          pte_valid,
    output reg          pte_read,
    output reg          pte_write,
    output reg          pte_execute,
    output reg          pte_user,
    output reg          pte_global,
    output reg          pte_dirty,
    input  wire         new_pte_req,
    input  wire [26:0]  new_tag,
    input  wire [63:0]  new_pte,
    input  wire         invalidate_req
);
    reg [43:0] tlb_tag [0:`TLB_ENTRIES-1];
    reg [53:0] tlb_entry [0:`TLB_ENTRIES-1];
    reg [`TLB_ABITS-1:0] tlb_hit_index;

    integer i;
    always @(*) begin
        pa = 64'bx;
        hit = 1'b0;
        pte_valid = 1'bx;
        pte_read = 1'bx;
        pte_write = 1'bx;
        pte_execute = 1'bx;
        pte_user = 1'bx;
        pte_global = 1'bx;
        pte_dirty = 1'bx;
        tlb_hit_index = 0;
        for (i = 0; i < `TLB_ENTRIES; i = i + 1) begin
            if (rreq) begin
                if ((tlb_tag[i][43] == 1'b1) &&
                        (tlb_tag[i][42:27] == asid) &&
                        (tlb_tag[i][26:0] == va[38:12])) begin
                    hit = 1'b1;
                    pa = {8'b0, tlb_entry[i][53:10], va[11:0]};
                    pte_valid = tlb_entry[i][`PTE_VALID];
                    pte_read = tlb_entry[i][`PTE_READ];
                    pte_write = tlb_entry[i][`PTE_WRITE];
                    pte_execute = tlb_entry[i][`PTE_EXECUTE];
                    pte_user = tlb_entry[i][`PTE_USER];
                    pte_global = tlb_entry[i][`PTE_GLOBAL];
                    pte_dirty = tlb_entry[i][`PTE_DIRTY];
                    tlb_hit_index = i;
                end
            end
        end
    end

    // PLRU
    // For now this is fixed, only works with TLB_ENTRIES = 4
    //   [2]
    // [1] [0]
    // 0 1 2 3
    reg [2:0] plru_tree;
    always @(posedge clk) begin
        if (rreq && hit) begin
            // when 0 hit, set 2 to 1, set 1 to 1
            // when 1 hit, set 2 to 1, set 1 to 0
            // when 2 hit, set 2 to 0, set 0 to 1
            // when 3 hit, set 2 to 0, set 0 to 0
            if (tlb_hit_index[1]) begin
                plru_tree[2] <= 1'b0;
                if (tlb_hit_index[0])
                    plru_tree[0] <= 1'b1;
                else
                    plru_tree[0] <= 1'b0;
            end
            else begin
                plru_tree[2] <= 1'b1;
                if (tlb_hit_index[0])
                    plru_tree[1] <= 1'b1;
                else
                    plru_tree[1] <= 1'b0;
            end
        end
    end

    wire [`TLB_ABITS-1:0] plru_victim =
        (plru_tree[2]) ? {1'b1, plru_tree[0]} : {1'b0, plru_tree[1]};
    
    always @(posedge clk) begin
        if (invalidate_req) begin
            for (i = 0; i < `TLB_ENTRIES; i = i + 1) begin
                tlb_tag[i][43] <= 1'b0;
            end
        end
        else if (new_pte_req) begin
            if (hit) begin
                tlb_entry[tlb_hit_index] <= new_pte[53:0];
                tlb_tag[tlb_hit_index] <= {1'b1, asid, new_tag};
            end
            else begin
                tlb_entry[plru_victim] <= new_pte[53:0];
                tlb_tag[plru_victim] <= {1'b1, asid, new_tag};
            end
        end
    end

endmodule
