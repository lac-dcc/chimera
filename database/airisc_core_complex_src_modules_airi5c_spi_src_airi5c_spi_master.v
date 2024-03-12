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

module airi5c_spi_master
#(
    parameter                   DATA_WIDTH = 8
)
(
    input                       clk,
    input                       n_reset,
    input                       enable,

    output                      mosi,
    input                       miso,
    output                      sclk,
    output  reg                 ss,

    input   [3:0]               clk_divider,
    input                       clk_polarity,
    input                       clk_phase,
    input                       ss_pm_ena,

    input                       tx_ena,
    input                       rx_ena,

    input                       tx_empty,

    output  reg                 pop,
    input   [DATA_WIDTH-1:0]    data_in,

    output  reg                 push,
    output  [DATA_WIDTH-1:0]    data_out,

    output  reg                 busy
);

    reg     [15:0]              counter;
    reg                         clk_int;
    reg     [5:0]               bit_counter;
    reg     [DATA_WIDTH-1:0]    tx_buffer;
    reg     [DATA_WIDTH-1:0]    rx_buffer;
    wire                        tx_start    = tx_ena && !tx_empty;

    assign                      data_out    = rx_buffer;
    assign                      sclk        = (clk_int && !ss) ^ clk_polarity;
    assign                      mosi        = tx_buffer[DATA_WIDTH-1];

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            counter     <= 16'h0000;
            clk_int     <= 1'b0;
            bit_counter <= 6'h00;
            tx_buffer   <= 0;
            rx_buffer   <= 0;
            busy        <= 1'b0;
            ss          <= 1'b1;
            push        <= 1'b0;
            pop         <= 1'b0;
        end

        else if (!enable) begin
            counter     <= 16'h0000;
            clk_int     <= 1'b0;
            bit_counter <= 6'h00;
            tx_buffer   <= 0;
            rx_buffer   <= 0;
            busy        <= 1'b0;
            ss          <= 1'b1;
            push        <= 1'b0;
            pop         <= 1'b0;
        end

        else begin
            push        <= 1'b0;
            pop         <= 1'b0;

            if (busy) begin
                if (counter == (16'd1 << clk_divider) - 16'd1) begin
                    // posedge
                    if (!clk_int) begin
                        // phase = 0
                        if (!clk_phase) begin
                            if (bit_counter == DATA_WIDTH)
                                ss          <= 1'b1;

                            else begin
                                rx_buffer   <= {rx_buffer[DATA_WIDTH-2:0], miso};
                                push        <= (bit_counter == DATA_WIDTH - 1) && rx_ena;
                            end
                        end
                        // phase = 1
                        else begin
                            if (bit_counter == DATA_WIDTH) begin
                                if (tx_start && !ss_pm_ena) begin
                                    bit_counter <= 6'h01;
                                    tx_buffer   <= data_in;
                                    rx_buffer   <= 0;
                                    pop         <= 1'b1;
                                end
                                
                                else
                                    ss          <= 1'b1;
                            end
                            
                            else begin
                                tx_buffer   <= tx_buffer << (bit_counter != 6'd0);
                                bit_counter <= bit_counter + 6'd1;
                            end
                        end
                    end
                    // negedge
                    else begin
                        if (ss)
                            busy        <= 1'b0;
                        // phase = 0
                        else if (!clk_phase) begin
                            if (bit_counter == DATA_WIDTH - 1 && tx_start && !ss_pm_ena) begin
                                bit_counter <= 6'h00;
                                tx_buffer   <= data_in;
                                rx_buffer   <= 0;
                                pop         <= 1'b1;
                            end
                            
                            else begin
                                tx_buffer   <= tx_buffer << 1;
                                bit_counter <= bit_counter + 6'd1;
                            end
                        end
                        // phase = 1
                        else begin
                            rx_buffer   <= {rx_buffer[DATA_WIDTH-2:0], miso};
                            push        <= (bit_counter == DATA_WIDTH) && rx_ena;
                        end
                    end

                    counter <= 16'h0000;
                    clk_int <= !clk_int;
                end

                else
                    counter <= counter + 16'd1;
            end

            else if (tx_start) begin
                counter     <= 16'h0000;
                clk_int     <= 1'b0;
                bit_counter <= 6'h00;
                tx_buffer   <= data_in;
                rx_buffer   <= 0;
                busy        <= 1'b1;
                ss          <= 1'b0;
                pop         <= 1'b1;
            end
        end
    end

endmodule