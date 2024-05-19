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

module ptw(
    input  wire         clk,
    input  wire         rst,
    // From CSR
    input  wire [1:0]   mpp,
    input  wire [63:0]  satp,
    // From TLB
    input  wire [63:0]  req_addr,
    input  wire         req_valid,
    input  wire         req_is_execute,
    input  wire         req_is_store,
    output reg          req_ready,
    // To TLB
    output reg          tlb_new_pte_req,
    output wire [26:0]  tlb_new_tag,
    output reg  [63:0]  tlb_new_pte,
    // To DMEM
    output reg  [63:0]  dm_req_addr,
    output reg  [63:0]  dm_req_wdata,
    output wire [7:0]   dm_req_wmask,
    output reg          dm_req_wen,
    output reg          dm_req_valid,
    input  wire         dm_req_ready,
    input  wire [63:0]  dm_resp_rdata,
    input  wire         dm_resp_valid
);

    localparam ST_IDLE = 2'd0;
    localparam ST_LOAD = 2'd1;
    localparam ST_FILL = 2'd2;
    localparam ST_WB = 2'd3;

    reg [1:0] ptw_state;
    reg [1:0] ptw_level;
    
    // Sv39:
    // 1st level: addr[38:30]
    // 2nd level: addr[29:21]
    // 3rd level: addr[20:12]
    wire [63:0] pt_addr_next = (ptw_level == 2'd0) ?
            {8'b0, dm_resp_rdata[53:10], req_addr[29:21], 3'b0} :
            {8'b0, dm_resp_rdata[53:10], req_addr[20:12], 3'b0};

    always @(posedge clk) begin
        case (ptw_state)
        ST_IDLE: begin
            if (req_valid) begin
                dm_req_addr <= {8'b0, satp[43:0], req_addr[38:30], 3'b0};
                dm_req_wdata <= 64'bx;
                dm_req_wen <= 1'b0;
                dm_req_valid <= 1'b1;
                ptw_level <= 2'd0;
                ptw_state <= ST_LOAD;
            end
        end
        ST_LOAD: begin
            if (dm_req_ready)
                dm_req_valid <= 1'b0;
            if (dm_resp_valid) begin
                if ((!dm_resp_rdata[`PTE_VALID]) ||
                        // RWX permission check
                        (((!req_is_execute && !req_is_store && !dm_resp_rdata[`PTE_READ]) ||
                        (!req_is_execute && req_is_store && !dm_resp_rdata[`PTE_WRITE]) ||
                        (req_is_execute && !dm_resp_rdata[`PTE_EXECUTE])) && ptw_level == 2'd2) ||
                        // Priviledge level permission check
                        ((mpp == `MSTATUS_MPP_MACHINE) ||
                        ((mpp == `MSTATUS_MPP_SUPERVISOR) && !dm_resp_rdata[`PTE_USER]) ||
                        ((mpp == `MSTATUS_MPP_USER) && dm_resp_rdata[`PTE_USER]))) begin
                    // PTE invalid or priviledge check failed,
                    // store to TLB and finish.
                    tlb_new_pte_req <= 1'b1;
                    tlb_new_pte <= dm_resp_rdata;
                    ptw_state <= ST_FILL;
                end
                else if ((!dm_resp_rdata[`PTE_ACCESS]) ||
                        ((!dm_resp_rdata[`PTE_DIRTY]) && req_is_store)) begin
                    // Access bit not set, set the value first
                    ptw_state <= ST_WB;
                    // Write-back value, but set access bit to 1
                    dm_req_wdata <= dm_resp_rdata;
                    dm_req_wdata[`PTE_ACCESS] <= 1'b1;
                    if (req_is_store)
                        dm_req_wdata[`PTE_DIRTY] <= 1'b1;
                    dm_req_wen <= 1'b1;
                    dm_req_valid <= 1'b1;
                end
                else begin
                    // Result valid
                    if (ptw_level != 2'd2) begin
                        // Goto next level
                        dm_req_addr <= pt_addr_next;
                        dm_req_wdata <= 64'bx;
                        dm_req_wen <= 1'b0;
                        dm_req_valid <= 1'b1;
                        ptw_level <= ptw_level + 1;
                    end
                    else begin
                        // Reached last level
                        tlb_new_pte <= dm_resp_rdata;
                        tlb_new_pte_req <= 1'b1;
                        ptw_state <= ST_FILL;
                    end
                end
            end
        end
        ST_FILL: begin
            tlb_new_pte_req <= 1'b0;
            ptw_state <= ST_IDLE;
        end
        ST_WB: begin
            if (dm_req_ready)
                dm_req_valid <= 1'b0;
            if (dm_resp_valid) begin
                if (ptw_level != 2'd2) begin
                    // Goto next level
                    dm_req_addr <= pt_addr_next;
                    dm_req_wdata <= 64'bx;
                    dm_req_wen <= 1'b0;
                    dm_req_valid <= 1'b1;
                    ptw_level <= ptw_level + 1;
                    ptw_state <= ST_LOAD;
                end
                else begin
                    // Reached last level
                    tlb_new_pte <= dm_req_wdata;
                    tlb_new_pte_req <= 1'b1;
                    ptw_state <= ST_FILL;
                end
            end
        end
        endcase

        if (rst) begin
            ptw_state <= ST_IDLE;
            req_ready <= 1'b0;
        end
    end

    assign dm_req_wmask = 8'hff;
    assign tlb_new_tag = req_addr[38:12];

endmodule
