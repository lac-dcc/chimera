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

module airi5c_spi_tb();
    localparam      M_BASE_ADDR           = 'h00000000;
    localparam      S_BASE_ADDR           = 'h10000000;
    localparam      DATA_ADDR_OFF         = 0;
    localparam      CTRL_REG_ADDR_OFF     = 4;
    localparam      CTRL_SET_ADDR_OFF     = 8;
    localparam      CTRL_CLR_ADDR_OFF     = 12;
    localparam      TX_STAT_REG_ADDR_OFF  = 16;
    localparam      TX_STAT_SET_ADDR_OFF  = 20;
    localparam      TX_STAT_CLR_ADDR_OFF  = 24;
    localparam      RX_STAT_REG_ADDR_OFF  = 28;
    localparam      RX_STAT_SET_ADDR_OFF  = 32;
    localparam      RX_STAT_CLR_ADDR_OFF  = 36;

    reg             clk;
    reg             reset;

    wire            mosi;
    wire            miso;
    wire            sclk;
    wire            ss;

    reg   [31:0]    address;
    reg             write;
    reg   [31:0]    wdata;
    wire  [31:0]    m_rdata;
    wire  [31:0]    s_rdata;
    reg   [1:0]     trans;

    reg   [31:0]    spi_dout;

    reg   [6*8:1]   tx_msg      = "Hello!";
    reg   [3:0]     tx_msg_len  = 6;
    reg   [6*8:1]   rx_msg;
    reg   [3:0]     rx_msg_len;

    reg   [7:0]     rx_size;

    integer         errorcount;
    integer         i;

    task write_spi;
        input       [31:0] waddress;
        input       [31:0] data_in;

        begin
            // address phase
            @(posedge clk)
            address   <= waddress;
            write     <= 1'b1;
            wdata     <= 32'h00000000;
            trans     <= 2'd2;

            // data phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= data_in;
            trans     <= 2'd0;
        end
    endtask

    task read_spi;
        input       [31:0]  raddress;
        output  reg [31:0]  data_out;

        begin
            // Steuersignale anlegen
            @(posedge clk)
            address   <= raddress;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd2;

            // Steuersignale übernehmen
            // adress phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd0;

            // data phase
            @(posedge clk)
            address   <= 32'h00000000;
            write     <= 1'b0;
            wdata     <= 32'h00000000;
            trans     <= 2'd0;
            data_out  = raddress < S_BASE_ADDR ? m_rdata : s_rdata;
        end
    endtask

    task write_string;
        input [31:0]    baddress;
        input [8*8:1]   msg;
        input [3:0]     size;
        begin
            // write message to tx fifo stack
            for (i = 1; i <= size; i = i + 1)
                write_spi(baddress + DATA_ADDR_OFF, msg >> ((size-i)*8));
        end
    endtask

    task read_string;
        input       [31:0]    baddress;
        output  reg [8*8:1]   msg;
        output  reg [3:0]     size;
        begin
            msg = "";
            read_spi(baddress + RX_STAT_REG_ADDR_OFF, spi_dout);
            rx_size = spi_dout[7:0];

            for (i = 1; i <= 8 && spi_dout[7:0] > 0; i = i + 1) begin
                read_spi(baddress + DATA_ADDR_OFF, spi_dout);
                msg = {msg[8*8:1],  spi_dout[7:0]};
                read_spi(baddress + RX_STAT_REG_ADDR_OFF, spi_dout);
                rx_size = spi_dout[7:0];
            end
            size = i;
        end
    endtask

    initial begin
        clk         = 1'b0;
        reset       = 1'b1;
        address     = 32'h00000000;
        write       = 1'b0;
        wdata       = 32'h00000000;
        trans       = 2'd0;
        spi_dout    = 32'h00000000;
        errorcount  = 0;

        @(posedge clk);
        reset       = 1'b0;

        $write("\nSPI Test 1: transmit a simple message from master to slave ... ");
        @(posedge clk);
        write_spi(M_BASE_ADDR + CTRL_REG_ADDR_OFF, {7'd0, /*oe*/ 1'b1, 7'd0, /*m*/ 1'b1, 1'b0, /*pulse_ena*/ 1'b0, /*soft_ss_en*/ 1'b0, /*soft_ss*/ 1'b1, 2'd0, /*active_ss*/ 2'd0, 2'd0, /*pol*/ 1'b0, /*pha*/ 1'b0, /*div*/ 4'd2});
        write_spi(S_BASE_ADDR + CTRL_REG_ADDR_OFF, {7'd0, /*oe*/ 1'b1, 7'd0, /*m*/ 1'b0, 1'b0, /*pulse_ena*/ 1'b0, /*soft_ss_en*/ 1'b0, /*soft_ss*/ 1'b1, 2'd0, /*active_ss*/ 2'd0, 2'd0, /*pol*/ 1'b0, /*pha*/ 1'b0, /*div*/ 4'd2});

        write_string(M_BASE_ADDR, tx_msg, tx_msg_len);

        // wait until message is received
        read_spi(S_BASE_ADDR + RX_STAT_REG_ADDR_OFF, spi_dout);
        rx_size = spi_dout[7:0];
        while (rx_size < tx_msg_len) begin
            read_spi(S_BASE_ADDR + RX_STAT_REG_ADDR_OFF, spi_dout);
            rx_size = spi_dout[7:0];
        end

        // read message
        read_string(S_BASE_ADDR, rx_msg, rx_msg_len);
        if (tx_msg != rx_msg) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");

        reset       = 1'b1;
        @(posedge clk);
        reset       = 1'b0;

        $write("SPI Test 2: transmit a simple message from slave to master ... ");
        write_spi(M_BASE_ADDR + CTRL_REG_ADDR_OFF, {7'd0, /*oe*/ 1'b1, 7'd0, /*m*/ 1'b1, 1'b0, /*pulse_ena*/ 1'b0, /*soft_ss_en*/ 1'b0, /*soft_ss*/ 1'b1, 2'd0, /*active_ss*/ 2'd0, 2'd0, /*pol*/ 1'b0, /*pha*/ 1'b0, /*div*/ 4'd2});
        write_spi(S_BASE_ADDR + CTRL_REG_ADDR_OFF, {7'd0, /*oe*/ 1'b1, 7'd0, /*m*/ 1'b0, 1'b0, /*pulse_ena*/ 1'b0, /*soft_ss_en*/ 1'b0, /*soft_ss*/ 1'b1, 2'd0, /*active_ss*/ 2'd0, 2'd0, /*pol*/ 1'b0, /*pha*/ 1'b0, /*div*/ 4'd2});

        write_string(S_BASE_ADDR, tx_msg, tx_msg_len);

        // send dummy bytes to receive message
        for (i = 0; i < tx_msg_len + 1; i = i + 1)
            write_spi(M_BASE_ADDR + DATA_ADDR_OFF, 32'd0);

        // wait until message is received
        read_spi(M_BASE_ADDR + RX_STAT_REG_ADDR_OFF, spi_dout);
        rx_size = spi_dout[7:0];
        while (rx_size < tx_msg_len + 1) begin
            read_spi(S_BASE_ADDR + RX_STAT_REG_ADDR_OFF, spi_dout);
            rx_size = spi_dout[7:0];
        end

        // due to clock domain crossing, first byte received is always 0x00
        read_spi(M_BASE_ADDR + RX_STAT_REG_ADDR_OFF, spi_dout);

        // read message
        read_string(M_BASE_ADDR, rx_msg, rx_msg_len);
        if (tx_msg != rx_msg) begin
            $write("Fail!\n");
            errorcount = errorcount + 1;
        end

        else
            $write("Success!\n");

        if (errorcount == 0)
            $write("passed\n\n");
        else
            $write("failed\n\n");

        $finish();
    end

    always #10 clk = !clk;

    airi5c_spi #(M_BASE_ADDR, 1'b1, 1'b1, 3, 8) spi_master
    (
        .n_reset(!reset),
        .clk(clk),

        .mosi_out(mosi),
        .mosi_in(1'b0),
        .mosi_oe(),

        .miso_out(),
        .miso_in(miso),
        .miso_oe(),

        .sclk_out(sclk),
        .sclk_in(1'b0),
        .sclk_oe(),

        .ss_out(ss),
        .ss_in(1'b0),
        .ss_oe(),

        .haddr(address),
        .hwrite(write),
        .htrans(trans),
        .hwdata(wdata),
        .hrdata(m_rdata),
        .hready(),
        .hresp()
    );

    airi5c_spi #(S_BASE_ADDR, 1'b0, 1'b1, 3, 8) spi_slave
    (
        .n_reset(!reset),
        .clk(clk),

        .mosi_out(),
        .mosi_in(mosi),
        .mosi_oe(),

        .miso_out(miso),
        .miso_in(1'b0),
        .miso_oe(),

        .sclk_out(),
        .sclk_in(sclk),
        .sclk_oe(),

        .ss_out(),
        .ss_in(ss),
        .ss_oe(),

        .haddr(address),
        .hwrite(write),
        .htrans(trans),
        .hwdata(wdata),
        .hrdata(s_rdata),
        .hready(),
        .hresp()
    );

endmodule
