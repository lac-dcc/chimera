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

`include "airi5c_uart_constants.vh"

module airi5c_uart_tx
#(
    parameter   STACK_ADDR_WIDTH = 5
)
(
    input                             clk,
    input                             n_reset,
    input                             clear,

    output  reg                       tx,
    input                             cts,

    input       [31:0]                ctrl_reg,

    input                             push,
    input       [8:0]                 data_in,
    output      [STACK_ADDR_WIDTH:0]  size,
    output                            empty,
    output                            full
);

    wire    [2:0]   data_bits = ctrl_reg[31:29];
    wire    [1:0]   parity    = ctrl_reg[28:27];
    wire    [1:0]   stop_bits = ctrl_reg[26:25];
    wire            flow_ctrl = ctrl_reg[24];
    wire    [23:0]  baud_reg  = ctrl_reg[23:0];

    reg             cts_metastable;
    reg             cts_stable;

    reg     [4:0]   state;
    reg     [24:0]  counter;
    reg     [3:0]   bit_idx;

    reg             pop;
    wire    [8:0]   data;

    localparam      IDLE      = 5'b00001,
                    START     = 5'b00010,
                    DATA      = 5'b00100,
                    PARITY    = 5'b01000,
                    STOP      = 5'b10000;
                    
    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            cts_metastable  <= 1'b1;
            cts_stable      <= 1'b1;
        end
        
        else begin
            cts_metastable  <= cts;
            cts_stable      <= cts_metastable;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            tx      <= 1'b1;
            state   <= IDLE;
            counter <= 25'h0000000;
            bit_idx <= 4'h0;
            pop     <= 1'b0;
        end

        else case (state)
        IDLE:     begin
                      counter <= 25'd1;
                      bit_idx <= 4'h0;

                      if (!empty) begin
                          // beginn transmission in IDLE state to compensate delay
                          if ((flow_ctrl == `UART_FLOW_CTRL_ON && !cts_stable) ||
                              (flow_ctrl == `UART_FLOW_CTRL_OFF)) begin
                              tx      <= 1'b0;
                              state   <= START;
                          end
                      end

                      else
                          tx      <= 1'b1;
                  end
        START:    begin
                      // wait until start bit is finished
                      if (counter == baud_reg - 24'd1) begin
                          counter <= 25'd0;
                          state   <= DATA;
                      end

                      else
                          counter <= counter + 25'd1;
                  end
        DATA:     begin
                      if (counter == baud_reg - 24'd1) begin
                          counter <= 25'd0;

                          if (bit_idx == data_bits + 3'd4) begin
                              if (parity != `UART_PARITY_NONE)
                                  state <= PARITY;
                              else
                                  state <= STOP;
                          end

                          else
                              bit_idx <= bit_idx + 4'd1;
                      end

                      else begin
                          tx      <= data[bit_idx];
                          counter <= counter + 25'd1;
                      end
                  end
        PARITY:   begin
                      if (counter == baud_reg - 24'd1) begin
                          counter <= 25'd0;
                          state   <= STOP;
                      end

                      else begin
                          if (parity == `UART_PARITY_EVEN)
                              tx  <= ^data;
                          else if (parity == `UART_PARITY_ODD)
                              tx  <= ~^data;

                          counter <= counter + 25'd1;
                      end
                  end
        STOP:     begin
                      if (pop) begin
                          pop     <= 1'b0;
                          state   <= IDLE;
                      end

                      else begin
                          if ((stop_bits == `UART_STOP_BITS_1   && counter == baud_reg - 24'd2) ||
                              (stop_bits == `UART_STOP_BITS_15  && counter == baud_reg + (baud_reg >> 1) - 24'd2) ||
                              (stop_bits == `UART_STOP_BITS_2   && counter == (baud_reg << 1) - 24'd2))
                              pop <= 1'b1;

                          tx      <= 1'b1;
                          counter <= counter + 25'd1;
                      end
                  end
        default:  state <= IDLE;
        endcase
    end

    airi5c_uart_fifo #(STACK_ADDR_WIDTH, 9) tx_fifo
    (
        .n_reset(n_reset),
        .clear(clear),
        .clk(clk),

        // write port
        .push(push),
        .data_in(data_in),

        // read port
        .pop(pop),
        .data_out(data),

        .size(size),
        .empty(empty),
        .full(full)
    );

endmodule
