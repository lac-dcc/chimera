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

`include "airi5c_hasti_constants.vh"

module airi5c_spi
#(
    /*
     * RESET_CONF
     *  0: spi is in slave mode after reset
     *  1: spi is in master mode after reset
     *
     * FIXED_CONF:
     *  0: spi can be swtitched between master and slave mode at runtime using master_slave_sw in ctrl_reg
     *  1: spi always uses the RESET_CONF, therefore the master_slave_sw is ignored and the mode isn't switchable at runtime
     *
     * ADDR_WIDTH:
     *  defines the FIFO capacity which is 2^ADDR_WIDTH
     *
     * DATA_WIDTH:
     *  defines the width of FIFO and shift registers and therefore the minimal transaction width (the length of any
     *  transaction is a multiple of this value)
     */
    parameter   BASE_ADDR       = 'h00000000,
    parameter   RESET_CONF      = 1'b1,
    parameter   FIXED_CONF      = 1'b0,
    parameter   ADDR_WIDTH      = 3,
    parameter   DATA_WIDTH      = 8
)
(
    input                                   n_reset,
    input                                   clk,

    output                                  mosi_out,
    input                                   mosi_in,
    output                                  mosi_oe,

    output                                  miso_out,
    input                                   miso_in,
    output                                  miso_oe,

    output                                  sclk_out,
    input                                   sclk_in,
    output                                  sclk_oe,

    output      [3:0]                       ss_out,
    input                                   ss_in,
    output                                  ss_oe,

    output                                  Int,

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

    assign                                  hready                  = 1'b1;
    assign                                  hresp                   = `HASTI_RESP_OKAY;

    // control signals
    reg         [3:0]                       clk_divider;  // = 2^(x+1)  // 0: 2, 1: 4, ...
    reg                                     clk_phase;                  // 0: no delay, 1: delay
    reg                                     clk_polarity;               // 0: non inverted, 1: inverted
    reg                                     master_slave_sw;            // 0: slave, 1: master (ignored if FIXED_CONF == 1)
    reg         [1:0]                       active_ss;                  // select slsave 0, 1, 2, or 3
    reg                                     software_ss;
    reg                                     software_ss_ena;            // ss is driven by 0: hardware 1: software
    reg                                     ss_pulse_mode_ena;          // ss gets deasserted 0: when the fifo is empty 1: after each frame
    reg                                     output_ena;                 // IO's are 0: tristate, 1: input or output according to configuration

    wire        [31:0]                      ctrl_reg                =
                                            {   // signal               // bit  // access
                                                // byte 3
                                                7'b00000000,
                                                output_ena,             // 24   // rw
                                                // byte 2
                                                2'b00,
                                                FIXED_CONF,             // 21   // r
                                                RESET_CONF,             // 20   // r
                                                3'b000,
                                                master_slave_sw,        // 16   // rw
                                                // byte 1
                                                1'b0,
                                                ss_pulse_mode_ena,      // 14   // rw
                                                software_ss_ena,        // 13   // rw
                                                software_ss,            // 12   // rw
                                                2'b00,
                                                active_ss,              // 9-8  // rw
                                                // byte 0
                                                2'b00,
                                                clk_polarity,           // 5    // rw
                                                clk_phase,              // 4    // rw
                                                clk_divider             // 3-0  // rw
                                            };

    // tx status signals
    wire        [ADDR_WIDTH:0]              tx_size;
    reg         [ADDR_WIDTH:0]              tx_watermark;
    wire                                    tx_full;
    wire                                    tx_empty;
    wire                                    tx_watermark_reached    = tx_size <= tx_watermark;
    reg                                     tx_overflow_error;
    wire                                    tx_ready;
    reg                                     tx_empty_IE;
    reg                                     tx_watermark_reached_IE;
    reg                                     tx_overflow_error_IE;
    reg                                     tx_ready_IE;
    reg                                     tx_ena;

    wire        [31:0]                      tx_stat_reg             =
                                            {   // signal               // bit  // access
                                                // byte 3
                                                tx_ena,                 // 31   // rw
                                                3'b000,
                                                tx_ready_IE,            // 27   // rw
                                                tx_overflow_error_IE,   // 26   // rw
                                                tx_watermark_reached_IE,// 25   // rw
                                                tx_empty_IE,            // 24   // rw
                                                // byte 2
                                                3'b000,
                                                tx_ready,               // 20   // r
                                                tx_overflow_error,      // 19   // rw
                                                tx_watermark_reached,   // 18   // r
                                                tx_empty,               // 17   // r
                                                tx_full,                // 16   // r
                                                // byte 1
                                                {(7-ADDR_WIDTH){1'b0}},
                                                tx_watermark,           // 15-8 // rw
                                                // byte 0
                                                {(7-ADDR_WIDTH){1'b0}},
                                                tx_size                 // 7-0  // r
                                            };

    // rx status signals
    wire        [ADDR_WIDTH:0]              rx_size;
    reg         [ADDR_WIDTH:0]              rx_watermark;
    wire                                    rx_full;
    wire                                    rx_empty;
    wire                                    rx_watermark_reached    = rx_size >= rx_watermark;
    reg                                     rx_overflow_error;
    reg                                     rx_underflow_error;
    reg                                     rx_full_IE;
    reg                                     rx_watermark_reached_IE;
    reg                                     rx_overflow_error_IE;
    reg                                     rx_underflow_error_IE;
    reg                                     rx_ena;

    wire        [31:0]                      rx_stat_reg             =
                                            {   // signal               // bit  // access
                                                // byte 3
                                                rx_ena,                 // 31   // rw
                                                3'b000,
                                                rx_underflow_error_IE,  // 27   // rw
                                                rx_overflow_error_IE,   // 26   // rw
                                                rx_watermark_reached_IE,// 25   // rw
                                                rx_full_IE,             // 24   // rw
                                                // byte 2
                                                3'b000,
                                                rx_underflow_error,     // 20   // rw
                                                rx_overflow_error,      // 19   // rw
                                                rx_watermark_reached,   // 18   // r
                                                rx_empty,               // 17   // r
                                                rx_full,                // 16   // r
                                                // byte 1
                                                {(7-ADDR_WIDTH){1'b0}},
                                                rx_watermark,           // 15-8 // rw
                                                // byte 0
                                                {(7-ADDR_WIDTH){1'b0}},
                                                rx_size                 // 7-0  // r
                                            };

    wire                                    is_master               = FIXED_CONF ? RESET_CONF : master_slave_sw;

    wire                                    m_push;
    wire        [DATA_WIDTH-1:0]            m_dout;
    wire                                    m_pop;
    wire                                    m_ss;
    wire                                    m_busy;

    wire                                    s_push;
    wire        [DATA_WIDTH-1:0]            s_dout;
    wire                                    s_pop;
    wire                                    s_tx_rclk;
    wire                                    s_rx_wclk;
    wire                                    s_busy;
                                                                    // (htrans_reg[1]) is equal to (htrans_reg != `HASTI_TRANS_IDLE && htrans_reg != `HASTI_TRANS_BUSY)
    wire                                    tx_push                 = hwrite_reg && haddr_reg == `DATA_ADDR && htrans_reg[1];
    wire        [DATA_WIDTH-1:0]            tx_din                  = hwdata[DATA_WIDTH-1:0];
    wire                                    tx_pop                  = is_master ? m_pop : s_pop;
    wire        [DATA_WIDTH-1:0]            tx_dout;
    wire                                    tx_rempty;

    wire                                    rx_push                 = is_master ? m_push : s_push;
    wire        [DATA_WIDTH-1:0]            rx_din                  = is_master ? m_dout : s_dout;
    wire                                    rx_pop                  = !hwrite_reg && haddr_reg == `DATA_ADDR && htrans_reg[1];
    wire        [DATA_WIDTH-1:0]            rx_dout;                // read value in first clock cycle, pop vaue in second clock cycle
    wire                                    rx_wfull;

    wire                                    m_rx_ov_err             = (rx_push && rx_wfull);

    // in slave mode the rx overflow signal needs to be crossed from sclk into clk domain
    // when the signal is set in clk domain, an acknowledgment signal is crossed back into
    // sclk domain, where the flag resets
    reg         [1:0]                       s_rx_ov_err;
    reg                                     s_rx_ov_err_sclk;
    wire                                    s_rx_ov_err_ack         = rx_overflow_error;
    reg         [1:0]                       s_rx_ov_err_ack_sclk;

    wire                                    ss                      = software_ss_ena ? software_ss : m_ss;

    assign                                  tx_ready                = is_master ? !m_busy : (!s_busy && tx_empty);

    assign                                  mosi_oe                 = is_master && output_ena;
    assign                                  miso_oe                 = !is_master && output_ena;
    assign                                  sclk_oe                 = is_master && output_ena;
    assign                                  ss_oe                   = is_master && output_ena;

    assign                                  ss_out                  = ss_oe ? ~(!ss << active_ss) : 4'b1111;

    assign                                  Int                     =
                                                (tx_empty              && tx_empty_IE)              ||
                                                (tx_watermark_reached  && tx_watermark_reached_IE)  ||
                                                (tx_overflow_error     && tx_overflow_error_IE)     ||
                                                (tx_ready              && tx_ready_IE)              ||
                                                (rx_full               && rx_full_IE)               ||
                                                (rx_watermark_reached  && rx_watermark_reached_IE)  ||
                                                (rx_overflow_error     && rx_overflow_error_IE)     ||
                                                (rx_underflow_error    && rx_underflow_error_IE);

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
            // default SPI settings
            output_ena              <= 1'b0;
            master_slave_sw         <= RESET_CONF;
            ss_pulse_mode_ena       <= 1'b0;
            software_ss_ena         <= 1'b0;
            software_ss             <= 1'b1;
            active_ss               <= 2'd0;
            clk_polarity            <= 1'b0;
            clk_phase               <= 1'b0;
            clk_divider             <= 4'd1;  // 2^(x+1) = 4

            // default status and interrupt settings
            tx_watermark            <= 0;
            rx_watermark            <= 1;

            tx_ena                  <= 1'b1;
            tx_ready_IE             <= 1'b0;
            tx_overflow_error_IE    <= 1'b0;
            tx_watermark_reached_IE <= 1'b0;
            tx_empty_IE             <= 1'b0;

            rx_ena                  <= 1'b1;
            rx_underflow_error_IE   <= 1'b0;
            rx_overflow_error_IE    <= 1'b0;
            rx_watermark_reached_IE <= 1'b0;
            rx_full_IE              <= 1'b0;

            // error signals
            tx_overflow_error       <= 1'b0;
            rx_underflow_error      <= 1'b0;
            rx_overflow_error       <= 1'b0;
        end

        else begin
            // cross overflow error from sclk into clk domain (only used in slave mode)
            s_rx_ov_err             <= {s_rx_ov_err[0], s_rx_ov_err_sclk};
            // refresh status signals
            tx_overflow_error       <= tx_overflow_error || (tx_push && tx_full);
            rx_overflow_error       <= rx_overflow_error || (is_master ? m_rx_ov_err : s_rx_ov_err[1]);
            // write access
            if (hwrite_reg) begin
                case (haddr_reg)
                `CTRL_REG_ADDR:     begin
                                        output_ena              <= hwdata[24];
                                        master_slave_sw         <= hwdata[16];
                                        ss_pulse_mode_ena       <= hwdata[14];
                                        software_ss_ena         <= hwdata[13];
                                        software_ss             <= hwdata[12];
                                        active_ss               <= hwdata[9:8];
                                        clk_polarity            <= hwdata[5];
                                        clk_phase               <= hwdata[4];
                                        clk_divider             <= hwdata[3:0];
                                    end
                `CTRL_SET_ADDR:     begin
                                        output_ena              <= hwdata[24]  || output_ena;
                                        master_slave_sw         <= hwdata[16]  || master_slave_sw;
                                        ss_pulse_mode_ena       <= hwdata[14]  || ss_pulse_mode_ena;
                                        software_ss_ena         <= hwdata[13]  || software_ss_ena;
                                        software_ss             <= hwdata[12]  || software_ss;
                                        active_ss               <= hwdata[9:8] |  active_ss;
                                        clk_polarity            <= hwdata[5]   || clk_polarity;
                                        clk_phase               <= hwdata[4]   || clk_phase;
                                        clk_divider             <= hwdata[3:0] |  clk_divider;
                                    end
                `CTRL_CLR_ADDR:     begin
                                        output_ena              <= !hwdata[24]  && output_ena;
                                        master_slave_sw         <= !hwdata[16]  && master_slave_sw;
                                        ss_pulse_mode_ena       <= !hwdata[14]  && ss_pulse_mode_ena;
                                        software_ss_ena         <= !hwdata[13]  && software_ss_ena;
                                        software_ss             <= !hwdata[12]  && software_ss;
                                        active_ss               <= ~hwdata[9:8] &  active_ss;
                                        clk_polarity            <= !hwdata[5]   && clk_polarity;
                                        clk_phase               <= !hwdata[4]   && clk_phase;
                                        clk_divider             <= ~hwdata[3:0] &  clk_divider;
                                    end
                `TX_STAT_REG_ADDR:  begin
                                        tx_ena                  <= hwdata[31];
                                        tx_ready_IE             <= hwdata[27];
                                        tx_overflow_error_IE    <= hwdata[26];
                                        tx_watermark_reached_IE <= hwdata[25];
                                        tx_empty_IE             <= hwdata[24];
                                        tx_overflow_error       <= hwdata[19];
                                        tx_watermark            <= hwdata[15:8];
                                    end
                `TX_STAT_SET_ADDR:  begin
                                        tx_ena                  <= hwdata[31]   || tx_ena;
                                        tx_ready_IE             <= hwdata[27]   || tx_ready_IE;
                                        tx_overflow_error_IE    <= hwdata[26]   || tx_overflow_error_IE;
                                        tx_watermark_reached_IE <= hwdata[25]   || tx_watermark_reached_IE;
                                        tx_empty_IE             <= hwdata[24]   || tx_empty_IE;
                                        tx_overflow_error       <= hwdata[19]   || tx_overflow_error;
                                        tx_watermark            <= hwdata[15:8] |  tx_watermark;
                                    end
                `TX_STAT_CLR_ADDR:  begin
                                        tx_ena                  <= !hwdata[31]   && tx_ena;
                                        tx_ready_IE             <= !hwdata[27]   && tx_ready_IE;
                                        tx_overflow_error_IE    <= !hwdata[26]   && tx_overflow_error_IE;
                                        tx_watermark_reached_IE <= !hwdata[25]   && tx_watermark_reached_IE;
                                        tx_empty_IE             <= !hwdata[24]   && tx_empty_IE;
                                        tx_overflow_error       <= !hwdata[19]   && tx_overflow_error;
                                        tx_watermark            <= ~hwdata[15:8] &  tx_watermark;
                                    end
                `RX_STAT_REG_ADDR:  begin
                                        rx_ena                  <= hwdata[31];
                                        rx_underflow_error_IE   <= hwdata[27];
                                        rx_overflow_error_IE    <= hwdata[26];
                                        rx_watermark_reached_IE <= hwdata[25];
                                        rx_full_IE              <= hwdata[24];
                                        rx_underflow_error      <= hwdata[20];
                                        rx_overflow_error       <= hwdata[19];
                                        rx_watermark            <= hwdata[15:8];
                                    end
                `RX_STAT_SET_ADDR:  begin
                                        rx_ena                  <= hwdata[31]   || rx_ena;
                                        rx_underflow_error_IE   <= hwdata[27]   || rx_underflow_error_IE;
                                        rx_overflow_error_IE    <= hwdata[26]   || rx_overflow_error_IE;
                                        rx_watermark_reached_IE <= hwdata[25]   || rx_watermark_reached_IE;
                                        rx_full_IE              <= hwdata[24]   || rx_full_IE;
                                        rx_underflow_error      <= hwdata[20]   || rx_underflow_error;
                                        rx_overflow_error       <= hwdata[19]   || rx_overflow_error;
                                        rx_watermark            <= hwdata[15:8] |  rx_watermark;
                                    end
                `RX_STAT_CLR_ADDR:  begin
                                        rx_ena                  <= !hwdata[31]   && rx_ena;
                                        rx_underflow_error_IE   <= !hwdata[27]   && rx_underflow_error_IE;
                                        rx_overflow_error_IE    <= !hwdata[26]   && rx_overflow_error_IE;
                                        rx_watermark_reached_IE <= !hwdata[25]   && rx_watermark_reached_IE;
                                        rx_full_IE              <= !hwdata[24]   && rx_full_IE;
                                        rx_underflow_error      <= !hwdata[20]   && rx_underflow_error;
                                        rx_overflow_error       <= !hwdata[19]   && rx_overflow_error;
                                        rx_watermark            <= ~hwdata[15:8] &  rx_watermark;
                                    end
                endcase
            end
            // read access
            if (|htrans && !hwrite) begin
                case (haddr)
                `DATA_ADDR:         begin
                                        rx_underflow_error  <= rx_underflow_error || rx_empty;
                                        hrdata              <= {{(32-DATA_WIDTH){1'b0}}, rx_dout};
                                    end
                `CTRL_REG_ADDR:     hrdata <= ctrl_reg;
                `TX_STAT_REG_ADDR:  hrdata <= tx_stat_reg;
                `RX_STAT_REG_ADDR:  hrdata <= rx_stat_reg;
                default:            hrdata <= 32'h00000000;
                endcase
            end
        end
    end

    always @(posedge s_rx_wclk, negedge n_reset) begin
        if (!n_reset) begin
            s_rx_ov_err_sclk        <= 1'b0;
            s_rx_ov_err_ack_sclk    <= 2'b00;
        end

        else begin
            // cross rx overflow error set signal from clk into sclk domain
            s_rx_ov_err_ack_sclk    <= {s_rx_ov_err_ack_sclk[0], s_rx_ov_err_ack};
            // reset flag in sclk domain, when flag in clk domain is set
            if (s_rx_ov_err_ack_sclk[1])
                s_rx_ov_err_sclk    <= 1'b0;
            else
                s_rx_ov_err_sclk    <= s_rx_ov_err_sclk || (rx_push && rx_wfull);
        end
    end

    airi5c_spi_master #(DATA_WIDTH) spi_master_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .enable(is_master),

        .mosi(mosi_out),
        .miso(miso_in),
        .sclk(sclk_out),
        .ss(m_ss),

        .clk_divider(clk_divider),
        .clk_polarity(clk_polarity),
        .clk_phase(clk_phase),
        .ss_pm_ena(ss_pulse_mode_ena),

        .tx_ena(tx_ena),
        .rx_ena(rx_ena),

        .tx_empty(tx_rempty),

        .pop(m_pop),
        .data_in(tx_dout),

        .push(m_push),
        .data_out(m_dout),

        .busy(m_busy)
    );

    airi5c_spi_slave #(DATA_WIDTH) spi_slave_inst
    (
        .clk(clk),
        .n_reset(n_reset),
        .enable(!is_master),

        .mosi(mosi_in),
        .miso(miso_out),
        .sclk(sclk_in),
        .ss(ss_in),

        .clk_polarity(clk_polarity),
        .clk_phase(clk_phase),

        .tx_ena(tx_ena),
        .rx_ena(rx_ena),

        .tx_empty(tx_rempty),

        .tx_rclk(s_tx_rclk),
        .pop(s_pop),
        .data_in(tx_dout),

        .rx_wclk(s_rx_wclk),
        .push(s_push),
        .data_out(s_dout),

        .busy(s_busy)
    );

    airi5c_spi_async_fifo
    #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) tx_fifo
    (
        .n_reset(n_reset),

        // write clock domain
        .wclk(clk),
        .push(tx_push),
        .data_in(tx_din),
        .wfull(tx_full),
        .wempty(tx_empty),
        .wsize(tx_size),

        // read clock domain
        .rclk(is_master ? clk : s_tx_rclk),
        .pop(tx_pop),
        .data_out(tx_dout),
        .rfull(),
        .rempty(tx_rempty),
        .rsize()
    );

    airi5c_spi_async_fifo
    #(
        .ADDR_WIDTH(ADDR_WIDTH),
        .DATA_WIDTH(DATA_WIDTH)
    ) rx_fifo
    (
        .n_reset(n_reset),

        // write clock domain
        .wclk(is_master ? clk : s_rx_wclk),
        .push(rx_push),
        .data_in(rx_din),
        .wfull(rx_wfull),
        .wempty(),
        .wsize(),

        // read clock domain
        .rclk(clk),
        .pop(rx_pop),
        .data_out(rx_dout),
        .rfull(rx_full),
        .rempty(rx_empty),
        .rsize(rx_size)
    );

endmodule