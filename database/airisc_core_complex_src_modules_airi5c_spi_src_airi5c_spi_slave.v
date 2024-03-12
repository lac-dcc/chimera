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

module airi5c_spi_slave
#(
    parameter                   DATA_WIDTH = 8
)
(
    input                       clk,
    input                       n_reset,
    input                       enable,

    input                       mosi,
    output                      miso,
    input                       sclk,
    input                       ss,

    input                       clk_polarity,
    input                       clk_phase,

    input                       tx_ena,
    input                       rx_ena,

    input                       tx_empty,

    output                      tx_rclk,
    output  reg                 pop,
    input   [DATA_WIDTH-1:0]    data_in,

    output                      rx_wclk,
    output  reg                 push,
    output  [DATA_WIDTH-1:0]    data_out,

    output                      busy
);

    wire                        clk_int         = sclk ^ clk_polarity ^ clk_phase;

    reg     [DATA_WIDTH-1:0]    tx_buffer;
    wire    [DATA_WIDTH-1:0]    tx_buffer_din;
    reg     [4:0]               tx_bit_counter;
    reg                         tx_busy;

    reg     [DATA_WIDTH-1:0]    rx_buffer;
    reg     [4:0]               rx_bit_counter;
    reg                         rx_busy;

    reg     [1:0]               tx_ena_sclk;
    reg     [1:0]               rx_ena_sclk;
    reg     [1:0]               busy_clk;

    wire                        tx_valid        = tx_ena_sclk[1] && !tx_empty;

    // last bit needs bypass, otherwise there would be no clock edge to push the data
    // first bit needs bypass when phase = 0, because master samples on same clock edge as tx buffer is loaded
    assign                      tx_buffer_din   = tx_valid ? data_in : 0;
    assign                      data_out        = push ? {rx_buffer[DATA_WIDTH-2:0], mosi} : rx_buffer;
    assign                      miso            = clk_phase || tx_busy ? tx_buffer[DATA_WIDTH-1] : tx_buffer_din[DATA_WIDTH-1];
    assign                      tx_rclk         = !clk_int;
    assign                      rx_wclk         = clk_int;
    assign                      busy            = busy_clk[1];

    // tx_ena signal is set in clk domain and needs to be crossed into sclk domain
    always @(posedge tx_rclk, negedge n_reset) begin
        if (!n_reset)
            tx_ena_sclk     <= 2'b11;

        else
            tx_ena_sclk     <= {tx_ena_sclk[0], tx_ena};
    end

    // rx_ena signal is set in clk domain and needs to be crossed into sclk domain
    always @(posedge rx_wclk, negedge n_reset) begin
        if (!n_reset)
            rx_ena_sclk     <= 2'b11;

        else
            rx_ena_sclk     <= {rx_ena_sclk[0], rx_ena};
    end

    // busy signals are set in sclk domain and need to be crossed into clk domain
    always @(posedge clk, negedge n_reset) begin
        if (!n_reset)
            busy_clk        <= 2'b00;

        else
            busy_clk        <= {busy_clk[0], tx_busy || rx_busy};
    end

    // posedge
    always @(posedge clk_int, negedge n_reset) begin
        if (!n_reset) begin
            rx_buffer       <= 0;
            rx_bit_counter  <= 5'h00;
            rx_busy         <= 1'b0;
            push            <= 1'b0;
        end

        else if (!enable || ss) begin
            rx_buffer       <= 0;
            rx_bit_counter  <= 5'h00;
            rx_busy         <= 1'b0;
            push            <= 1'b0;
        end

        else begin
            rx_buffer       <= {rx_buffer[DATA_WIDTH-2:0], mosi};
            push            <= (rx_bit_counter == DATA_WIDTH - 2) && rx_ena_sclk[1];

            if (!rx_busy) begin
                rx_bit_counter  <= 5'd1;
                rx_busy         <= 1'b1;
            end

            else begin
                if (rx_bit_counter == DATA_WIDTH - 1) begin
                    rx_bit_counter  <= 5'd0;
                    rx_busy         <= 1'b0;
                end

                else
                    rx_bit_counter  <= rx_bit_counter + 5'd1;
            end
        end
    end

    // negedge
    always @(negedge clk_int, negedge n_reset) begin
        if (!n_reset) begin
            tx_buffer       <= 0;
            tx_bit_counter  <= 5'h00;
            tx_busy         <= 1'b0;
            pop             <= 1'b0;
        end

        else if (!enable || ss) begin
            tx_buffer       <= 0;
            tx_bit_counter  <= 5'h00;
            tx_busy         <= 1'b0;
            pop             <= 1'b0;
        end

        else begin
            if (!tx_busy) begin
                tx_buffer       <= tx_buffer_din << !clk_phase;
                tx_bit_counter  <= 5'd1;
                tx_busy         <= 1'b1;
                pop             <= tx_valid;
            end

            else begin
                tx_buffer       <= tx_buffer << 1;
                pop             <= 1'b0;

                if (tx_bit_counter == DATA_WIDTH - 1) begin
                    tx_bit_counter  <= 5'd0;
                    tx_busy         <= 1'b0;
                end

                else
                    tx_bit_counter  <= tx_bit_counter + 5'd1;
            end
        end
    end

endmodule