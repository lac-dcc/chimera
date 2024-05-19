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

// KLink arbiter with 2 uplink port and 1 downlink port
module kl_arbiter_2by1(
    input  wire         clk,
    input  wire         rst,
    // Uplink
    input  wire [31:0]  up0_req_addr,
    input  wire         up0_req_wen,
    input  wire [63:0]  up0_req_wdata,
    input  wire [7:0]   up0_req_wmask,
    input  wire [2:0]   up0_req_size,
    input  wire         up0_req_valid,
    output reg          up0_req_ready,
    output reg  [63:0]  up0_resp_rdata,
    output reg          up0_resp_valid,
    input  wire         up0_resp_ready,
    input  wire [31:0]  up1_req_addr,
    input  wire         up1_req_wen,
    input  wire [63:0]  up1_req_wdata,
    input  wire [7:0]   up1_req_wmask,
    input  wire [2:0]   up1_req_size,
    input  wire         up1_req_valid,
    output reg          up1_req_ready,
    output reg  [63:0]  up1_resp_rdata,
    output reg          up1_resp_valid,
    input  wire         up1_resp_ready,
    // Downlink
    output reg  [31:0]  dn_req_addr,
    output reg          dn_req_wen,
    output reg  [63:0]  dn_req_wdata,
    output reg  [7:0]   dn_req_wmask,
    output reg  [2:0]   dn_req_size,
    output reg  [4:0]   dn_req_srcid,
    output reg          dn_req_valid,
    input  wire         dn_req_ready,
    input  wire [63:0]  dn_resp_rdata,
    input  wire [2:0]   dn_resp_size,
    input  wire [4:0]   dn_resp_dstid,
    input  wire         dn_resp_valid,
    output reg          dn_resp_ready
);
    parameter UP0_SRC_ID = 5'd0;
    parameter UP1_SRC_ID = 5'd1;
    parameter MAX_BURST_WIDTH = 4; // Up to 2^4=16 cycle burst

    localparam ARB_UP0 = 2'd0;
    localparam ARB_UP1 = 2'd1;
    localparam ARB_NONE = 2'd2;

    // Request channel arbitor
    reg [1:0] arb_req_conn_reg;
    wire arb_req_enable = (arb_req_conn_reg == ARB_NONE);
    wire [1:0] arb_req_valid = {up1_req_valid, up0_req_valid};
    wire [1:0] arb_req_grant;
    wire [1:0] arb_req_grant_id = arb_req_grant[1] ? ARB_UP1 :
            (arb_req_grant[0] ? ARB_UP0 : ARB_NONE);
    wire [1:0] arb_req_conn = (arb_req_enable) ? arb_req_grant_id :
            arb_req_conn_reg;

    round_robin_arbiter #(.WIDTH(2)) req_arbiter (
        .clk(clk),
        .rstn(!rst),
        .enable(arb_req_enable),
        .request(arb_req_valid),
        .grant(arb_req_grant)
    );

    localparam ARB_WAIT_FOR_CMD = 1'd0;
    localparam ARB_WAIT_FOR_BURST = 1'd1;
    reg [0:0] arb_req_state;
    reg [MAX_BURST_WIDTH-1:0] req_burst_counter;
    wire [MAX_BURST_WIDTH-1:0] req_burst_counter_dec = req_burst_counter - 1;
    wire [MAX_BURST_WIDTH-1:0] req_burst_size = (1 << dn_req_size) / 8;

    wire up_req_ready = dn_req_ready && (arb_req_state == ARB_WAIT_FOR_CMD);

    always @(posedge clk) begin
        case (arb_req_state)
        ARB_WAIT_FOR_CMD: begin
            // Process request
            if (dn_req_valid) begin
                arb_req_conn_reg <= arb_req_grant_id;
                if (dn_req_ready) begin
                    req_burst_counter <= req_burst_size;
                    if (dn_req_wen && (req_burst_size > 1)) begin
                        arb_req_state <= ARB_WAIT_FOR_BURST;
                        arb_req_conn_reg <= arb_req_grant_id;
                    end
                    else begin
                        arb_req_conn_reg <= ARB_NONE;
                        arb_req_state <= ARB_WAIT_FOR_CMD;
                    end
                end
            end
        end
        ARB_WAIT_FOR_BURST: begin
            if (dn_req_ready && dn_req_valid) begin
                if (req_burst_counter_dec == 0) begin
                    arb_req_conn_reg <= ARB_NONE;
                    arb_req_state <= ARB_WAIT_FOR_CMD;
                end
                req_burst_counter <= req_burst_counter_dec;
            end
        end
        endcase

        if (rst) begin
            arb_req_conn_reg <= ARB_NONE;
            arb_req_state <= ARB_WAIT_FOR_CMD;
        end
    end

    // Response channel arbiter
    reg [1:0] arb_resp_conn_reg;
    wire [1:0] arb_resp_grant_id = (dn_resp_dstid == UP0_SRC_ID) ? ARB_UP0 :
                    ((dn_resp_dstid == UP1_SRC_ID) ? ARB_UP1 : ARB_NONE);
    wire [1:0] arb_resp_conn = (arb_resp_conn_reg == ARB_NONE) ?
            ((dn_resp_valid) ? arb_resp_grant_id : ARB_NONE) : arb_resp_conn_reg;
    reg [0:0] arb_resp_state;
    reg [MAX_BURST_WIDTH-1:0] resp_burst_counter;
    wire [MAX_BURST_WIDTH-1:0] resp_burst_counter_dec = resp_burst_counter - 1;
    wire [MAX_BURST_WIDTH-1:0] resp_burst_size = (1 << dn_resp_size) / 8;
    
    always @(posedge clk) begin
        case (arb_resp_state)
        ARB_WAIT_FOR_CMD: begin
            // Process request
            if (dn_resp_ready && dn_resp_valid) begin
                resp_burst_counter <= resp_burst_size - 1;
                if (resp_burst_size > 1) begin
                    arb_resp_conn_reg <= arb_resp_grant_id;
                    arb_resp_state <= ARB_WAIT_FOR_BURST;
                end
                else begin
                    arb_resp_conn_reg <= ARB_NONE;
                    arb_resp_state <= ARB_WAIT_FOR_CMD;
                end
            end
        end
        ARB_WAIT_FOR_BURST: begin
            if (dn_resp_ready && dn_resp_valid) begin
                if (resp_burst_counter_dec == 0) begin
                    arb_resp_conn_reg <= ARB_NONE;
                    arb_resp_state <= ARB_WAIT_FOR_CMD;
                end
                resp_burst_counter <= resp_burst_counter_dec;
            end
        end
        endcase

        if (rst) begin
            arb_resp_conn_reg <= ARB_NONE;
            arb_resp_state <= ARB_WAIT_FOR_CMD;
        end
    end

    always @(*) begin
        // Default disconnect connections
        up0_req_ready = 1'b0;
        up0_resp_rdata = 64'bx;
        up0_resp_valid = 1'b0;
        up1_req_ready = 1'b0;
        up1_resp_rdata = 64'bx;
        up1_resp_valid = 1'b0;
        dn_req_addr = 32'bx;
        dn_req_wen = 1'bx;
        dn_req_wdata = 64'bx;
        dn_req_wmask = 8'bx;
        dn_req_size = 3'bx;
        dn_req_srcid = 5'bx;
        dn_req_valid = 1'b0;
        dn_resp_ready = 1'b0;

        if (arb_req_conn == ARB_UP0) begin
            dn_req_addr = up0_req_addr;
            dn_req_wen = up0_req_wen;
            dn_req_wdata = up0_req_wdata;
            dn_req_wmask = up0_req_wmask;
            dn_req_size = up0_req_size;
            dn_req_srcid = UP0_SRC_ID;
            dn_req_valid = up0_req_valid;
            up0_req_ready = up_req_ready;
        end
        else if (arb_req_conn == ARB_UP1) begin
            dn_req_addr = up1_req_addr;
            dn_req_wen = up1_req_wen;
            dn_req_wdata = up1_req_wdata;
            dn_req_wmask = up1_req_wmask;
            dn_req_srcid = UP1_SRC_ID;
            dn_req_size = up1_req_size;
            dn_req_valid = up1_req_valid;
            up1_req_ready = up_req_ready;
        end

        if (arb_resp_conn == ARB_UP0) begin
            dn_resp_ready = up0_resp_ready;
            up0_resp_rdata = dn_resp_rdata;
            up0_resp_valid = dn_resp_valid;
        end
        else if (arb_resp_conn == ARB_UP1) begin
            dn_resp_ready = up1_resp_ready;
            up1_resp_rdata = dn_resp_rdata;
            up1_resp_valid = dn_resp_valid;
        end
    end

endmodule
