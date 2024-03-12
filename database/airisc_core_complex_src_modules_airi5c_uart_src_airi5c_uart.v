//
// Copyright 2022 FRAUNHOFER INSTITUTE OF MICROELECTRONIC CIRCUITS AND SYSTEMS (IMS), DUISBURG, GERMANY.
// --- All rights reserved --- 
// SPDX-License-Identifier: Apache-2.0 WITH SHL-2.1
// Licensed under the Solderpad Hardware License v 2.1 (the "License");
// you may not use this file except in compliance with the License, or, at your option, the Apache License version 2.0.
// You may obtain a copy of the License at
// https://solderpad.org/licenses/SHL-2.1/
// Unless required by applicable law or agreed to in writing, any work distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and limitations under the License.
//

`include "modules/airi5c_uart/src/airi5c_uart_constants.vh"
`include "airi5c_hasti_constants.vh"

module airi5c_uart
#(
    parameter   BASE_ADDR     = 'hC0000200,
    parameter   TX_ADDR_WIDTH = 5,
    parameter   RX_ADDR_WIDTH = 5
)
(
    input                                   n_reset,
    input                                   clk,

    output                                  tx,
    input                                   rx,
    input                                   cts,
    output                                  rts,

    output                                  int_any,
    output                                  int_tx_empty,
    output                                  int_tx_watermark_reached,
    output                                  int_tx_overflow_error,
    output                                  int_rx_full,
    output                                  int_rx_watermark_reached,
    output                                  int_rx_overflow_error,
    output                                  int_rx_underflow_error,
    output                                  int_rx_noise_error,
    output                                  int_rx_parity_error,
    output                                  int_rx_frame_error,

    // AHB-Lite interface
    input       [`HASTI_ADDR_WIDTH-1:0]     haddr,      // address
    input                                   hwrite,     // write enable
//  input       [`HASTI_SIZE_WIDTH-1:0]     hsize,      // unused
//  input       [`HASTI_BURST_WIDTH-1:0]    hburst,     // unused
//  input                                   hmastlock,  // unused
//  input       [`HASTI_PROT_WIDTH-1:0]     hprot,      // unused
    input       [`HASTI_TRANS_WIDTH-1:0]    htrans,     // transfer type (IDLE or NONSEQUENTIAL)
    input       [`HASTI_BUS_WIDTH-1:0]      hwdata,     // data in
    output  reg [`HASTI_BUS_WIDTH-1:0]      hrdata,     // data out
    output                                  hready,     // transfer finished
    output      [`HASTI_RESP_WIDTH-1:0]     hresp       // transfer status (OKAY or ERROR)
);

    `define     DATA_ADDR                   BASE_ADDR + 0
    `define     CTRL_REG_ADDR               BASE_ADDR + 4
    `define     CTRL_SET_ADDR               BASE_ADDR + 8
    `define     CTRL_CLR_ADDR               BASE_ADDR + 12
    `define     TX_STAT_REG_ADDR            BASE_ADDR + 16
    `define     TX_STAT_SET_ADDR            BASE_ADDR + 20
    `define     TX_STAT_CLR_ADDR            BASE_ADDR + 24
    `define     RX_STAT_REG_ADDR            BASE_ADDR + 28
    `define     RX_STAT_SET_ADDR            BASE_ADDR + 32
    `define     RX_STAT_CLR_ADDR            BASE_ADDR + 36

    reg         [`HASTI_ADDR_WIDTH-1:0]     haddr_reg;
    reg                                     hwrite_reg;
    reg         [`HASTI_TRANS_WIDTH-1:0]    htrans_reg;

    assign                                  hready                      = 1'b1;
    assign                                  hresp                       = `HASTI_RESP_OKAY;

                                                                        // (htrans_reg[1]) is equal to (htrans_reg != `HASTI_TRANS_IDLE && htrans_reg != `HASTI_TRANS_BUSY)
    wire                                    push                        = hwrite_reg && haddr_reg == `DATA_ADDR && htrans_reg[1];
    reg         [8:0]                       data_in;                    // read value in first clock cycle, pop vaue in second clock cycle
    wire                                    pop                         = !hwrite_reg && haddr_reg == `DATA_ADDR && htrans_reg[1];
    wire        [8:0]                       data_out;

    // control signals
    reg         [2:0]                       data_bits;              // 5, 6, 7, 8, 9 (if parity is none)
    reg         [1:0]                       parity;                 // none, odd, even
    reg         [1:0]                       stop_bits;              // 1, 1.5, 2
    reg                                     flow_ctrl;              // off, on (RTS/CTS)
    reg         [23:0]                      baud_reg;               // = c_bit = clock_freq / baud rate (system clock cycles per bit)

    wire        [31:0]                      ctrl_reg                    =
                                            {   // signal               // bits   // access
                                                data_bits,              // 31-29  // rw
                                                parity,                 // 28-27  // rw
                                                stop_bits,              // 26-25  // rw
                                                flow_ctrl,              // 24     // rw
                                                baud_reg                // 23-0   // rw
                                            };

    // tx status signals
    wire        [TX_ADDR_WIDTH:0]           tx_size;
    reg         [TX_ADDR_WIDTH:0]           tx_watermark;
    wire                                    tx_full;
    wire                                    tx_empty;
    wire                                    tx_watermark_reached;
    reg                                     tx_overflow_error;
    reg                                     tx_empty_IE;
    reg                                     tx_watermark_reached_IE;
    reg                                     tx_overflow_error_IE;
    reg                                     tx_clear;

    wire        [31:0]                      tx_stat_reg                 =
                                            {   // signal               // bit    // access
                                                // byte 3
                                                tx_clear,               // 31     // rw
                                                4'b0000,
                                                tx_overflow_error_IE,   // 26     // rw
                                                tx_watermark_reached_IE,// 25     // rw
                                                tx_empty_IE,            // 24     // rw
                                                // byte 2
                                                4'b0000,
                                                tx_overflow_error,      // 19     // rw
                                                tx_watermark_reached,   // 18     // r
                                                tx_empty,               // 17     // r
                                                tx_full,                // 16     // r
                                                // byte 1
                                                {(7-TX_ADDR_WIDTH){1'b0}},
                                                tx_watermark,           // 15-8   // rw
                                                // byte 0
                                                {(7-TX_ADDR_WIDTH){1'b0}},
                                                tx_size                 // 7-0    // r
                                            };

    // rx status signals
    wire        [RX_ADDR_WIDTH:0]           rx_size;
    reg         [RX_ADDR_WIDTH:0]           rx_watermark;
    wire                                    rx_full;
    wire                                    rx_empty;
    wire                                    rx_watermark_reached;
    reg                                     rx_overflow_error;          wire overflow_error_w;
    reg                                     rx_underflow_error;
    reg                                     rx_noise_error;             wire noise_error_w;
    reg                                     rx_parity_error;            wire parity_error_w;
    reg                                     rx_frame_error;             wire frame_error_w;
    reg                                     rx_full_IE;
    reg                                     rx_watermark_reached_IE;
    reg                                     rx_overflow_error_IE;
    reg                                     rx_underflow_error_IE;
    reg                                     rx_noise_error_IE;
    reg                                     rx_parity_error_IE;
    reg                                     rx_frame_error_IE;
    reg                                     rx_clear;

    wire        [31:0]                      rx_stat_reg                 =
                                            {   // signal               // bit    // access
                                                // byte 3
                                                rx_clear,               // 31     // rw
                                                rx_frame_error_IE,      // 30     // rw
                                                rx_parity_error_IE,     // 29     // rw
                                                rx_noise_error_IE,      // 28     // rw
                                                rx_underflow_error_IE,  // 27     // rw
                                                rx_overflow_error_IE,   // 26     // rw
                                                rx_watermark_reached_IE,// 25     // rw
                                                rx_full_IE,             // 24     // rw
                                                // byte 2
                                                rx_frame_error,         // 23     // rw
                                                rx_parity_error,        // 22     // rw
                                                rx_noise_error,         // 21     // rw
                                                rx_underflow_error,     // 20     // rw
                                                rx_overflow_error,      // 19     // rw
                                                rx_watermark_reached,   // 18     // r
                                                rx_empty,               // 17     // r
                                                rx_full,                // 16     // r
                                                // byte 1
                                                {(7-RX_ADDR_WIDTH){1'b0}},
                                                rx_watermark,           // 15-8   // rw
                                                // byte 0
                                                {(7-RX_ADDR_WIDTH){1'b0}},
                                                rx_size                 // 7-0    // r
                                            };

    assign                                  tx_watermark_reached        = tx_size <= tx_watermark;
    assign                                  rx_watermark_reached        = rx_size >= rx_watermark;

    assign                                  int_tx_empty                = tx_empty              && tx_empty_IE;
    assign                                  int_tx_watermark_reached    = tx_watermark_reached  && tx_watermark_reached_IE;
    assign                                  int_tx_overflow_error       = tx_overflow_error     && tx_overflow_error_IE;
    assign                                  int_rx_full                 = rx_full               && rx_full_IE;
    assign                                  int_rx_watermark_reached    = rx_watermark_reached  && rx_watermark_reached_IE;
    assign                                  int_rx_overflow_error       = rx_overflow_error     && rx_overflow_error_IE;
    assign                                  int_rx_underflow_error      = rx_underflow_error    && rx_underflow_error_IE;
    assign                                  int_rx_noise_error          = rx_noise_error        && rx_noise_error_IE;
    assign                                  int_rx_parity_error         = rx_parity_error       && rx_parity_error_IE;
    assign                                  int_rx_frame_error          = rx_frame_error        && rx_frame_error_IE;

    assign                                  int_any                     =
                                                int_tx_empty           || int_tx_watermark_reached  || int_tx_overflow_error    ||
                                                int_rx_full            || int_rx_watermark_reached  || int_rx_overflow_error    ||
                                                int_rx_underflow_error || int_rx_noise_error        || int_rx_parity_error      ||
                                                int_rx_frame_error;

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            haddr_reg   <= `HASTI_ADDR_WIDTH'h0;
            hwrite_reg  <= 1'b0;
            htrans_reg  <= `HASTI_TRANS_WIDTH'h0;
        end

        else begin
            haddr_reg   <= haddr;
            hwrite_reg  <= hwrite;
            htrans_reg  <= htrans;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            hrdata                  <= `HASTI_BUS_WIDTH'h0;
            // default UART settings
            data_bits               <= `UART_DATA_BITS_8;
            parity                  <= `UART_PARITY_NONE;
            stop_bits               <= `UART_STOP_BITS_1;
            flow_ctrl               <= `UART_FLOW_CTRL_OFF;
            baud_reg                <= 24'd3333;  // cycles_per_bit = clock_freq / baud = 9600 / 32 MHz
            // default status and interrupt settings
            tx_watermark            <= 0;
            rx_watermark            <= 1;

            tx_clear                <= 1'b0;
            tx_overflow_error_IE    <= 1'b0;
            tx_watermark_reached_IE <= 1'b0;
            tx_empty_IE             <= 1'b0;

            rx_clear                <= 1'b0;
            rx_frame_error_IE       <= 1'b0;
            rx_parity_error_IE      <= 1'b0;
            rx_noise_error_IE       <= 1'b0;
            rx_underflow_error_IE   <= 1'b0;
            rx_overflow_error_IE    <= 1'b0;
            rx_watermark_reached_IE <= 1'b0;
            rx_full_IE              <= 1'b0;

            tx_overflow_error       <= 1'b0;
            rx_frame_error          <= 1'b0;
            rx_parity_error         <= 1'b0;
            rx_noise_error          <= 1'b0;
            rx_underflow_error      <= 1'b0;
            rx_overflow_error       <= 1'b0;
        end

        else begin
            // refresh status signals
            tx_overflow_error       <= tx_overflow_error  || push && tx_full;
            rx_frame_error          <= rx_frame_error     || frame_error_w;
            rx_parity_error         <= rx_parity_error    || parity_error_w;
            rx_noise_error          <= rx_noise_error     || noise_error_w;
            rx_overflow_error       <= rx_overflow_error  || overflow_error_w;
            tx_clear                <= 1'b0;
            rx_clear                <= 1'b0;
            // write access
            if (hwrite_reg) begin
                case (haddr_reg)
                `CTRL_REG_ADDR:     begin
                                        // invalid number of data bits
                                        if (hwdata[31:29] >= `UART_DATA_BITS_9) begin
                                            data_bits         <= `UART_DATA_BITS_9; // set data bits to max valid value instead
                                            parity            <= `UART_PARITY_NONE; // if 9 data bits are set, parity is set to none!
                                            stop_bits         <= `UART_STOP_BITS_1; // if 9 data bits are set, number of stop are set to 1!
                                        end
                                        else begin
                                            data_bits         <= hwdata[31:29];
                                            // only set parity if the value is valid
                                            if (~&hwdata[28:27])
                                                parity        <= hwdata[28:27];
                                            // only set number of stop bits if the value is valid
                                            if (~&hwdata[26:25])
                                                stop_bits     <= hwdata[26:25];
                                        end
                                        flow_ctrl             <= hwdata[24];
                                        baud_reg              <= hwdata[23:0];
                                    end
                `CTRL_SET_ADDR:     begin
                                        // set results in invalid number of data bits
                                        if ((hwdata[31:29] | data_bits) >= `UART_DATA_BITS_9) begin
                                            data_bits         <= `UART_DATA_BITS_9; // set data bits to max valid value instead
                                            parity            <= `UART_PARITY_NONE; // if 9 data bits are set, parity is set to none!
                                            stop_bits         <= `UART_STOP_BITS_1; // if 9 data bits are set, number of stop are set to 1!
                                        end
                                        else begin
                                            data_bits         <= hwdata[31:29] | data_bits;
                                            // only set parity if resulting value is valid
                                            if (~&(hwdata[28:27] | parity))
                                                parity        <= hwdata[28:27] | parity;
                                            // only set number of stop bits if resulting value is valid
                                            if (~&(hwdata[26:25] | stop_bits))
                                                stop_bits     <= hwdata[26:25] | stop_bits;
                                        end

                                        flow_ctrl             <= hwdata[24]   || flow_ctrl;
                                        baud_reg              <= hwdata[23:0] |  baud_reg;
                                    end
                `CTRL_CLR_ADDR:     begin
                                        // while clearing, the value of each field always decreases, thus no invalids here
                                        data_bits             <= ~hwdata[31:29] &  data_bits;
                                        parity                <= ~hwdata[28:27] &  parity;
                                        stop_bits             <= ~hwdata[26:25] &  stop_bits;
                                        flow_ctrl             <= !hwdata[24]    && flow_ctrl;
                                        baud_reg              <= ~hwdata[23:0]  &  baud_reg;
                                    end
                `TX_STAT_REG_ADDR:  begin
                                        tx_clear                <= hwdata[31];
                                        tx_overflow_error_IE    <= hwdata[26];
                                        tx_watermark_reached_IE <= hwdata[25];
                                        tx_empty_IE             <= hwdata[24];
                                        tx_overflow_error       <= hwdata[19];
                                        tx_watermark            <= hwdata[15:8];
                                    end
                `TX_STAT_SET_ADDR:  begin
                                        tx_clear                <= hwdata[31]   || tx_clear;
                                        tx_overflow_error_IE    <= hwdata[26]   || tx_overflow_error_IE;
                                        tx_watermark_reached_IE <= hwdata[25]   || tx_watermark_reached_IE;
                                        tx_empty_IE             <= hwdata[24]   || tx_empty_IE;
                                        tx_overflow_error       <= hwdata[19]   || tx_overflow_error;
                                        tx_watermark            <= hwdata[15:8] |  tx_watermark;
                                    end
                `TX_STAT_CLR_ADDR:  begin
                                        tx_clear                <= !hwdata[31]   && tx_clear;
                                        tx_overflow_error_IE    <= !hwdata[26]   && tx_overflow_error_IE;
                                        tx_watermark_reached_IE <= !hwdata[25]   && tx_watermark_reached_IE;
                                        tx_empty_IE             <= !hwdata[24]   && tx_empty_IE;
                                        tx_overflow_error       <= !hwdata[19]   && tx_overflow_error;
                                        tx_watermark            <= !hwdata[15:8] &  tx_watermark;
                                    end
                `RX_STAT_REG_ADDR:  begin
                                        rx_clear                <= hwdata[31];
                                        rx_frame_error_IE       <= hwdata[30];
                                        rx_parity_error_IE      <= hwdata[29];
                                        rx_noise_error_IE       <= hwdata[28];
                                        rx_underflow_error_IE   <= hwdata[27];
                                        rx_overflow_error_IE    <= hwdata[26];
                                        rx_watermark_reached_IE <= hwdata[25];
                                        rx_full_IE              <= hwdata[24];
                                        rx_frame_error          <= hwdata[23];
                                        rx_parity_error         <= hwdata[22];
                                        rx_noise_error          <= hwdata[21];
                                        rx_underflow_error      <= hwdata[20];
                                        rx_overflow_error       <= hwdata[19];
                                        rx_watermark            <= hwdata[15:8];
                                    end
                `RX_STAT_SET_ADDR:  begin
                                        rx_clear                <= hwdata[31]   || rx_clear;
                                        rx_frame_error_IE       <= hwdata[30]   || rx_parity_error_IE;
                                        rx_parity_error_IE      <= hwdata[29]   || rx_parity_error_IE;
                                        rx_noise_error_IE       <= hwdata[28]   || rx_noise_error_IE;
                                        rx_underflow_error_IE   <= hwdata[27]   || rx_underflow_error_IE;
                                        rx_overflow_error_IE    <= hwdata[26]   || rx_overflow_error_IE;
                                        rx_watermark_reached_IE <= hwdata[25]   || rx_watermark_reached_IE;
                                        rx_full_IE              <= hwdata[24]   || rx_full_IE;
                                        rx_frame_error          <= hwdata[23]   || rx_frame_error;
                                        rx_parity_error         <= hwdata[22]   || rx_parity_error;
                                        rx_noise_error          <= hwdata[21]   || rx_noise_error;
                                        rx_underflow_error      <= hwdata[20]   || rx_underflow_error;
                                        rx_overflow_error       <= hwdata[19]   || rx_overflow_error;
                                        rx_watermark            <= hwdata[15:8] |  rx_watermark;
                                    end
                `RX_STAT_CLR_ADDR:  begin
                                        rx_clear                <= !hwdata[31]   && rx_clear;
                                        rx_frame_error_IE       <= !hwdata[30]   && rx_parity_error_IE;
                                        rx_parity_error_IE      <= !hwdata[29]   && rx_parity_error_IE;
                                        rx_noise_error_IE       <= !hwdata[28]   && rx_noise_error_IE;
                                        rx_underflow_error_IE   <= !hwdata[27]   && rx_underflow_error_IE;
                                        rx_overflow_error_IE    <= !hwdata[26]   && rx_overflow_error_IE;
                                        rx_watermark_reached_IE <= !hwdata[25]   && rx_watermark_reached_IE;
                                        rx_full_IE              <= !hwdata[24]   && rx_full_IE;
                                        rx_frame_error          <= !hwdata[23]   && rx_frame_error;
                                        rx_parity_error         <= !hwdata[22]   && rx_parity_error;
                                        rx_noise_error          <= !hwdata[21]   && rx_noise_error;
                                        rx_underflow_error      <= !hwdata[20]   && rx_underflow_error;
                                        rx_overflow_error       <= !hwdata[19]   && rx_overflow_error;
                                        rx_watermark            <= !hwdata[15:8] &  rx_watermark;
                                    end
                endcase
            end
            // read access
            else if (|htrans && !hwrite) begin
                case (haddr)
                `DATA_ADDR:         begin
                                        rx_underflow_error  <= rx_underflow_error || rx_empty;
                                        hrdata              <= {23'h000000, data_out};
                                    end
                `CTRL_REG_ADDR:     hrdata <= ctrl_reg;
                `TX_STAT_REG_ADDR:  hrdata <= tx_stat_reg;
                `RX_STAT_REG_ADDR:  hrdata <= rx_stat_reg;
                default:            hrdata <= 32'h00000000;
                endcase
            end
        end
    end

    always @(*) begin
        case (data_bits)
        `UART_DATA_BITS_5:  data_in = {4'b0000,hwdata[4:0]};
        `UART_DATA_BITS_6:  data_in = {3'b000,hwdata[5:0]};
        `UART_DATA_BITS_7:  data_in = {2'b00,hwdata[6:0]};
        `UART_DATA_BITS_8:  data_in = {1'b0,hwdata[7:0]};
        default:            data_in = hwdata[8:0];
        endcase
    end

    airi5c_uart_tx #(TX_ADDR_WIDTH) transmitter
    (
        .clk(clk),
        .n_reset(n_reset),
        .clear(tx_clear),

        .tx(tx),
        .cts(cts),

        .ctrl_reg(ctrl_reg),

        .push(push),
        .data_in(data_in),
        .size(tx_size),
        .empty(tx_empty),
        .full(tx_full)
    );

    airi5c_uart_rx #(RX_ADDR_WIDTH) receiver
    (
        .clk(clk),
        .n_reset(n_reset),
        .clear(rx_clear),

        .rx(rx),
        .rts(rts),

        .ctrl_reg(ctrl_reg),

        .pop(pop),
        .data_out(data_out),
        .size(rx_size),
        .empty(rx_empty),
        .full(rx_full),

        .noise_error(noise_error_w),
        .parity_error(parity_error_w),
        .frame_error(frame_error_w),
        .overflow_error(overflow_error_w)
    );

endmodule
