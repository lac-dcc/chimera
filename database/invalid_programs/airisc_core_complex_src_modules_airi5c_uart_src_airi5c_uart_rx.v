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

module airi5c_uart_rx
#(
    parameter   STACK_ADDR_WIDTH = 5
)
(
    input                             clk,
    input                             n_reset,
    input                             clear,

    input                             rx,
    output                            rts,

    input       [31:0]                ctrl_reg,

    input                             pop,
    output      [8:0]                 data_out,
    output      [STACK_ADDR_WIDTH:0]  size,
    output                            empty,
    output                            full,

    output                            noise_error,
    output                            parity_error,
    output                            frame_error,
    output                            overflow_error
);

    wire    [2:0]   data_bits = ctrl_reg[31:29];
    wire    [1:0]   parity    = ctrl_reg[28:27];
    wire    [1:0]   stop_bits = ctrl_reg[26:25];
    wire            flow_ctrl = ctrl_reg[24];
    wire    [23:0]  baud_reg  = ctrl_reg[23:0];
    
    reg             rx_metastable;
    reg             rx_stable;

    reg     [4:0]   state;
    reg     [24:0]  counter;
    reg     [2:0]   samples;
    reg     [3:0]   bit_idx;
    reg             parity_received;
    reg             parity_computed;
    reg             abort;

    reg             push;
    reg     [8:0]   data;

    localparam      IDLE      = 5'b00001,
                    START     = 5'b00010,
                    DATA      = 5'b00100,
                    PARITY    = 5'b01000,
                    STOP      = 5'b10000;

    reg             noise_e_reg;
    reg             parity_e_reg;   
    
    assign          noise_error     = (noise_e_reg || !(samples == 3'b111 || samples == 3'b000)) 
                                       && (push || abort);
    assign          parity_error    = parity_e_reg && push;
    assign          frame_error     = ( !(&samples[2:1] || &samples[1:0] || 
                                       (samples[2] && samples[0]) ) ) && push;
    assign          overflow_error  = full && !pop && push;

    // to prevent data loss, rts is set some bytes before rx stack is full
    assign          rts       = flow_ctrl == 
                                     `UART_FLOW_CTRL_ON ? size > 2**STACK_ADDR_WIDTH - 4 : 1'b0;
    
    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            rx_metastable   <= 1'b1;
            rx_stable       <= 1'b1;
        end
        
        else begin
            rx_metastable   <= rx;
            rx_stable       <= rx_metastable;
        end
    end

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            noise_e_reg     <= 1'b0;
            parity_e_reg    <= 1'b0;
            state           <= IDLE;
            counter         <= 25'h0000000;
            samples         <= 3'b000;
            bit_idx         <= 4'h0;
            abort           <= 1'b0;
            push            <= 1'b0;
            data            <= 9'h000;
        end

        else case (state)
                    // start bit detected
        IDLE:       begin
                        noise_e_reg     <= 1'b0;
                        parity_e_reg    <= 1'b0;
                        counter         <= 25'd1;
                        samples         <= 3'b000;
                        bit_idx         <= 4'h0;
                        abort           <= 1'b0;
                        data            <= 9'h000;

                        if (!rx_stable)
                            state       <= START;
                    end
        START:      begin
                        // wait until start bit is finished
                        if (counter == baud_reg - 24'd1) begin
                            // major value of start bit should be 0
                            if ( !( &samples[2:1] || &samples[1:0] 
                                    || (samples[2] && samples[0]) ) ) begin
                                noise_e_reg <= |samples;
                                counter     <= 25'd0;
                                state       <= DATA;
                            end
                            // abort otherwise
                            else begin
                                noise_e_reg <= 1'b1;
                                abort       <= 1'b1;
                                state       <= IDLE;
                            end
                        end
                        // read 3 samples around the middle of the start Bit
                        else begin
                            // c_bit / 2 - c_bit / 16
                            if (counter == (baud_reg >> 1) - (baud_reg >> 4))
                                samples[0] <= rx_stable;
                            // c_bit / 2
                            if (counter == baud_reg >> 1)
                                samples[1] <= rx_stable;
                            // c_bit / 2 + c_bit / 16
                            if (counter == (baud_reg >> 1) + (baud_reg >> 4))
                                samples[2] <= rx_stable;

                            counter <= counter + 25'd1;
                        end
                    end
        DATA:       begin
                        // wait until data bit is finished
                        if (counter == baud_reg - 24'd1) begin
                            // shift in major value of all samples left (LSB is received first)
                            data          <= {&samples[2:1] || &samples[1:0] 
                                              || (samples[2] && samples[0]), data[8:1]};
                            noise_e_reg   <= noise_e_reg || !(samples == 3'b111 || samples == 3'b000);
                            counter       <= 25'd0;

                            // last data bit received
                            if (bit_idx == data_bits + 3'd4) begin
                                if (parity != `UART_PARITY_NONE)
                                    state <= PARITY;
                                else
                                    state <= STOP;
                            end
                            // receive next data bit
                            else
                                bit_idx   <= bit_idx + 3'd1;
                        end
                        // read 3 samples around the middle of each data bit
                        else begin
                            // c_bit / 2 - c_bit / 16
                            if (counter == (baud_reg >> 1) - (baud_reg >> 4))
                                samples[0] <= rx_stable;
                            // c_bit / 2
                            if (counter == baud_reg >> 1)
                                samples[1] <= rx_stable;
                            // c_bit / 2 + c_bit / 16
                            if (counter == (baud_reg >> 1) + (baud_reg >> 4))
                                samples[2] <= rx_stable;

                            counter <= counter + 25'd1;
                        end
                    end
        PARITY:     begin
                        // wait until parity bit is finished
                        if (counter == baud_reg - 24'd1) begin
                            parity_received = &samples[2:1] || &samples[1:0] 
                                              || (samples[2] && samples[0]);

                            if (parity == `UART_PARITY_EVEN)
                                parity_computed = ^data;
                            else
                                parity_computed = ~^data;

                            noise_e_reg   <= noise_e_reg || 
                                             !(samples == 3'b111 || samples == 3'b000);
                            parity_e_reg  <= parity_received != parity_computed;
                            counter       <= 25'd0;
                            state         <= STOP;
                        end
                        // read 3 samples around the middle of the parity bit
                        else begin
                            // c_bit / 2 - c_bit / 16
                            if (counter == (baud_reg >> 1) - (baud_reg >> 4))
                                samples[0] <= rx_stable;
                            // c_bit / 2
                            if (counter == baud_reg >> 1)
                                samples[1] <= rx_stable;
                            // c_bit / 2 + c_bit / 16
                            if (counter == (baud_reg >> 1) + (baud_reg >> 4))
                                samples[2] <= rx_stable;

                            counter <= counter + 25'd1;
                        end
                    end
        STOP:       begin
                        if (push) begin
                            push        <= 1'b0;
                            counter     <= 25'd0;
                            state       <= IDLE;
                        end

                        else begin
                            if ((stop_bits == `UART_STOP_BITS_1   && counter == baud_reg - 24'd2) ||
                                (stop_bits == `UART_STOP_BITS_15  && counter == baud_reg + 
                                                                         (baud_reg >> 1) - 24'd2) ||
                                (stop_bits == `UART_STOP_BITS_2   && counter == (baud_reg << 1) 
                                                                                     - 24'd2)) begin
                                // because LSB is received first, data has to be aligned
                                push       <= 1'b1;
                                data       <= data >> (3'd4 - data_bits);
                            end
                            // read 3 samples around the middle of the stop bit
                            // c_bit / 2 - c_bit / 16
                            // (c_bit + c_bit / 2) / 2 - (c_bit + c_bit / 2) / 16  = c_bit / 2 + 
                            //  c_bit / 4 - c_bit / 16 - c_bit / 32
                            // 2 * (c_bit / 2 - c_bit / 16) = c_bit - c_bit / 8
                            if ((stop_bits == `UART_STOP_BITS_1   && counter == (baud_reg >> 1) - 
                                                                                 (baud_reg >> 4)) ||
                                                                                 
                                (stop_bits == `UART_STOP_BITS_15  && counter == (baud_reg >> 1) + 
                                             (baud_reg >> 2) - (baud_reg >> 4) - (baud_reg >> 5)) ||
                                             
                                (stop_bits == `UART_STOP_BITS_2   && counter == baud_reg - 
                                                                                   (baud_reg >> 3)))
                                samples[0] <= rx_stable;

                            // c_bit / 2
                            // (c_bit + c_bit / 2) / 2 = c_bit / 2 + c_bit / 4
                            // 2 * (c_bit / 2) = c_bit
                            if ((stop_bits == `UART_STOP_BITS_1   && counter == baud_reg >> 1) ||
                            
                                (stop_bits == `UART_STOP_BITS_15  && counter == (baud_reg >> 1) + 
                                                                                 (baud_reg >> 2)) ||
                                                                                 
                                (stop_bits == `UART_STOP_BITS_2   && counter == baud_reg))
                                samples[1] <= rx_stable;

                            // c_bit / 2 + c_bit / 16
                            // (c_bit + c_bit / 2) / 2 + (c_bit + c_bit / 2) / 16  = c_bit / 2 +
                            //  c_bit / 4 + c_bit / 16 + c_bit / 32
                            // 2 * (c_bit / 2 + c_bit / 16) = c_bit + c_bit / 8
                            if ((stop_bits == `UART_STOP_BITS_1   && counter == (baud_reg >> 1) + 
                                                                                 (baud_reg >> 4)) ||
                                                                                 
                                (stop_bits == `UART_STOP_BITS_15  && counter == (baud_reg >> 1) + 
                                             (baud_reg >> 2) + (baud_reg >> 4) + (baud_reg >> 5)) ||
                                             
                                (stop_bits == `UART_STOP_BITS_2   && counter == baud_reg + 
                                                                                   (baud_reg >> 3)))
                                samples[2] <= rx_stable;

                            counter <= counter + 25'd1;
                        end
                    end
        default:    state    <= IDLE;
        endcase
    end

    airi5c_uart_fifo #(STACK_ADDR_WIDTH, 9) rx_fifo
    (
        .n_reset(n_reset),
        .clear(clear),
        .clk(clk),

        // write port
        .push(push),
        .data_in(data),

        // read port
        .pop(pop),
        .data_out(data_out),

        .size(size),
        .empty(empty),
        .full(full)
    );

endmodule
