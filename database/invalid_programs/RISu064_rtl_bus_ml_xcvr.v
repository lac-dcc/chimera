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
`include "mlink.vh"

// Generic MLink transceiver
module ml_xcvr(
    input  wire         clk,
    input  wire         rst,
    // KLink Generic TX
    input  wire [31:0]  kl_tx_addr,
    input  wire         kl_tx_den,
    input  wire [63:0]  kl_tx_data,
    input  wire [2:0]   kl_tx_size,
    input  wire [4:0]   kl_tx_id,
    input  wire         kl_tx_valid,
    output wire         kl_tx_ready,
    // KLink Generic RX
    output reg  [31:0]  kl_rx_addr,
    output wire [63:0]  kl_rx_data,
    output reg          kl_rx_den,
    output reg  [2:0]   kl_rx_size,
    output reg  [4:0]   kl_rx_id,
    output wire         kl_rx_valid,
    input  wire         kl_rx_ready,
    // MLink Generic
    output wire         ml_txbr,
    input  wire         ml_rxbr,
    output wire [21:0]  ml_data_o,
    input  wire [21:0]  ml_data_i,
    output reg          ml_data_oe,
    output reg          ml_data_ie
);
    parameter INITIAL_ROLE = 0;
    parameter MAX_BURST_WIDTH = 4; // Up to 2^4=16 64-bit cycle burst

    localparam ST_IDLE = 3'd0;
    localparam ST_TX_CLAMING_BUS = 3'd1;
    localparam ST_TX_INITDATA = 3'd2;
    localparam ST_TX_BURST = 3'd3;
    localparam ST_TX_FINALIZE= 3'd4;
    localparam ST_RX_HEADER = 3'd5;
    localparam ST_RX_HEADERWAIT = 3'd6;
    localparam ST_RX_BURST = 3'd7;
    
    reg ml_txbr_reg;

    reg [2:0] state;
    reg last_ba; // Previous bus arbitration: 0-other 1-self
    reg [MAX_BURST_WIDTH-1:0] burst_counter;
    wire [MAX_BURST_WIDTH-1:0] burst_counter_dec = burst_counter - 1;
    wire [MAX_BURST_WIDTH-1:0] tx_burst_size = (1 << tx_size) / 8;
    wire [MAX_BURST_WIDTH-1:0] rx_burst_size = (1 << rx_size) / 8;

    reg [1:0] tx_opcode;
    reg [2:0] tx_size;
    reg [4:0] tx_srcid;
    reg [31:0] tx_addr;
    wire [41:0] tx_header = {tx_opcode, tx_size, tx_srcid, tx_addr};
    reg [63:0] tx_wdata;
    reg kl_tx_ready_reg;

    reg tx_pending;

    wire [63:0] tx_dfifo_a_data =
            (state == ST_TX_CLAMING_BUS) ? ({22'b0, tx_header}) :
            (state == ST_TX_INITDATA) ? (tx_wdata) :
            (state == ST_TX_BURST) ? (kl_tx_data) : (64'bx);
    wire tx_dfifo_a_valid =
            (state == ST_TX_CLAMING_BUS) ? (1'b1) :
            (state == ST_TX_INITDATA) ? (1'b1) :
            (state == ST_TX_BURST) ? (kl_tx_valid) : (1'b0);
    wire tx_dfifo_a_short = (state == ST_TX_CLAMING_BUS);
    wire tx_dfifo_a_ready;
    wire [21:0] tx_dfifo_b_data;
    wire tx_dfifo_b_valid;
    wire tx_dfifo_b_ready = ml_rxbr;
    assign kl_tx_ready = 
            (state == ST_TX_BURST) ? (tx_dfifo_a_ready) : (kl_tx_ready_reg);
    assign ml_data_o = tx_dfifo_b_data;
    assign ml_txbr = ((state == ST_TX_INITDATA) ||
            (state == ST_TX_BURST) || (state == ST_TX_FINALIZE)) ?
            (tx_dfifo_b_valid) : (
            ((state == ST_RX_HEADER) || (state == ST_RX_BURST)) ?
            (rx_dfifo_a_ready) : (ml_txbr_reg));

    fifo_1d_64to22 tx_dfifo (
        .clk(clk),
        .rst(rst || tx_pending),
        .a_short(tx_dfifo_a_short),
        .a_data(tx_dfifo_a_data),
        .a_valid(tx_dfifo_a_valid),
        .a_ready(tx_dfifo_a_ready),
        .b_data(tx_dfifo_b_data),
        .b_valid(tx_dfifo_b_valid),
        .b_ready(tx_dfifo_b_ready)
    );

    reg kl_rx_valid_reg;
    wire [21:0] rx_dfifo_a_data = ml_data_i;
    wire rx_dfifo_a_valid = ((state == ST_RX_HEADER) || 
            (state == ST_RX_HEADERWAIT) || (state == ST_RX_BURST)) ? ml_rxbr :
            1'b0;
    wire rx_dfifo_a_ready;
    wire [63:0] rx_dfifo_b_data;
    wire rx_dfifo_b_valid;
    wire rx_dfifo_b_ready = (state == ST_RX_HEADER) ? 1'b1 :
            (state == ST_RX_BURST) ? kl_rx_ready : 1'b0;
    assign kl_rx_data = (state == ST_RX_BURST) ? (rx_dfifo_b_data) : 64'bx;
    assign kl_rx_valid = (state == ST_RX_BURST) ? (rx_dfifo_b_valid) :
            kl_rx_valid_reg;
    wire rx_dfifo_b_short = (state == ST_RX_HEADER);

    fifo_1d_22to64 rx_dfifo (
        .clk(clk),
        .rst(rst),
        .a_data(rx_dfifo_a_data),
        .a_valid(rx_dfifo_a_valid),
        .a_ready(rx_dfifo_a_ready),
        .b_short(rx_dfifo_b_short),
        .b_data(rx_dfifo_b_data),
        .b_valid(rx_dfifo_b_valid),
        .b_ready(rx_dfifo_b_ready)
    );
    
    /* verilator lint_off UNUSED */
    wire [41:0] rx_header = rx_dfifo_b_data[63:22];
    /* verilator lint_on UNUSED */
    wire [1:0] rx_opcode = rx_header[41:40];
    wire [2:0] rx_size = rx_header[39:37];
    wire [4:0] rx_dstid = rx_header[36:32];
    wire [31:0] rx_addr = rx_header[31:0];

    always @(posedge clk) begin
        case (state)
        ST_IDLE: begin
            kl_tx_ready_reg <= 1'b1;
            ml_txbr_reg <= 1'b0;
            tx_pending <= 1'b0;
            if (tx_pending) begin
                if (ml_rxbr) begin
                    // Other side has already claimed the bus, fail
                    // But state is still in IDLE, so this must be the first
                    // cycle otherside trying to claim the bus
                    state <= ST_RX_HEADER;
                    kl_tx_ready_reg <= 1'b0;
                    tx_pending <= 1'b1;
                    ml_data_ie <= 1'b1;
                    last_ba <= 1'b0;
                end
                else begin
                    state <= ST_TX_CLAMING_BUS;
                    ml_txbr_reg <= 1'b1;
                    kl_tx_ready_reg <= 1'b0;
                end
            end
            else if (kl_tx_ready && kl_tx_valid) begin
                // Accept the request
                kl_tx_ready_reg <= 1'b0;
                tx_opcode <= kl_tx_den ? `ML_OP_Data : `ML_OP_Dataless;
                tx_srcid <= kl_tx_id;
                tx_size <= kl_tx_size;
                tx_addr <= kl_tx_addr;
                tx_wdata <= kl_tx_data;
                // Try to acquire bus
                if (ml_rxbr) begin
                    // Other side has already claimed the bus, fail
                    // But state is still in IDLE, so this must be the first
                    // cycle otherside trying to claim the bus
                    state <= ST_RX_HEADER;
                    tx_pending <= 1'b1;
                    ml_data_ie <= 1'b1;
                    last_ba <= 1'b0;
                end
                else begin
                    state <= ST_TX_CLAMING_BUS;
                    ml_txbr_reg <= 1'b1;
                end
            end
            else if (ml_rxbr) begin
                // Other side is trying to claim the bus, nothing to send
                // Grant
                kl_tx_ready_reg <= 1'b0;
                state <= ST_RX_HEADER;
                ml_data_ie <= 1'b1;
                last_ba <= 1'b0;
            end
        end
        ST_TX_CLAMING_BUS: begin
            if ((!ml_rxbr) || (ml_rxbr && (last_ba == 0))) begin
                // Got right to bus, sent header, enable output
                if (tx_opcode == `ML_OP_Data)
                    state <= ST_TX_INITDATA;
                else
                    state <= ST_TX_FINALIZE;
                // FIFO should take the header
                ml_data_oe <= 1'b1;
                last_ba <= 1'b1;
            end
            else begin
                // Lose, however the header is probably already in TX FIFO, and
                // should be cleared
                state <= ST_RX_HEADER;
                ml_data_ie <= 1'b1;
                tx_pending <= 1'b1;
                last_ba <= 1'b0;
            end
        end
        ST_TX_INITDATA: begin
            if (tx_dfifo_a_ready) begin
                // DFIFO accepted the initial data, see if subsequent data is
                // needed
                if (tx_burst_size > 1) begin
                    burst_counter <= tx_burst_size - 1;
                    state <= ST_TX_BURST;
                end
                else begin
                    // Wait for finish
                    kl_tx_ready_reg <= 1'b0;
                    state <= ST_TX_FINALIZE;
                end
            end
        end
        ST_TX_BURST: begin
            if (tx_dfifo_a_ready && tx_dfifo_a_valid) begin
                if (burst_counter_dec == 0) begin
                    kl_tx_ready_reg <= 1'b0;
                    state <= ST_TX_FINALIZE;
                end
                burst_counter <= burst_counter_dec;
            end
        end
        ST_TX_FINALIZE: begin
            if (tx_dfifo_b_valid == 1'b0) begin
                state <= ST_IDLE;
                ml_data_oe <= 1'b0;
                ml_txbr_reg <= 1'b0;
                kl_tx_ready_reg <= 1'b1;
            end
        end
        ST_RX_HEADER: begin
            if (rx_dfifo_b_valid) begin
                // Send response from received header
                kl_rx_addr <= rx_addr;
                kl_rx_size <= rx_size;
                kl_rx_id <= rx_dstid;
                // If received message is write ack, there will be no data
                // Otherwise, holdoff until there is valid data
                if (rx_opcode == `ML_OP_Dataless) begin
                    kl_rx_den <= 1'b0;
                    kl_rx_valid_reg <= 1'b1;
                    ml_txbr_reg <= 1'b0;
                    state <= ST_RX_HEADERWAIT;
                end
                else if (rx_opcode == `ML_OP_Data) begin
                    kl_rx_den <= 1'b1;
                    kl_rx_valid_reg <= 1'b0;
                    state <= ST_RX_BURST;
                    burst_counter <= (rx_burst_size == 0) ? 1 : rx_burst_size;
                end
            end
        end
        ST_RX_HEADERWAIT: begin
            if (kl_rx_ready) begin
                // RX done
                ml_data_ie <= 1'b0;
                kl_rx_valid_reg <= 1'b0;
                kl_tx_ready_reg <= !tx_pending;
                state <= ST_IDLE;
            end
        end
        ST_RX_BURST: begin
            if (rx_dfifo_b_ready && rx_dfifo_b_valid) begin
                if (burst_counter_dec == 0) begin
                    ml_data_ie <= 1'b0;
                    ml_txbr_reg <= 1'b0;
                    kl_tx_ready_reg <= !tx_pending;
                    state <= ST_IDLE;
                end
                burst_counter <= burst_counter_dec;
            end
        end
        endcase

        if (rst) begin
            kl_rx_valid_reg <= 1'b0;
            kl_tx_ready_reg <= 1'b0;
            state <= ST_IDLE;
            last_ba <= INITIAL_ROLE;
            ml_data_oe <= 1'b0;
            ml_data_ie <= 1'b0;
            ml_txbr_reg <= 1'b0;
        end
    end

endmodule
