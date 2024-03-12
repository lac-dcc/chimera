`include "src/uart_defs.v"

/*
 * Copyright (c) 2017, Toothless Consulting UG (haftungsbeschraenkt)
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * + Redistributions of source code must retain the above copyright notice,
 *   this list of conditions and the following disclaimer.
 * + Redistributions in binary form must reproduce the above copyright
 *   notice, this list of conditions and the following disclaimer in the
 *   documentation and/or other materials provided with the distribution.
 * + Neither the name arty-glitcher nor the names of its contributors may be
 *   used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE arty-glitcher PROJECT BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
 * SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
 * CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH
 * DAMAGE.
 *
 * Author: Dmitry Nedospasov <dmitry@toothless.co>
 *
 */
`default_nettype none

module  uart_tx (
    input wire       clk,
    input wire       rst,
    output reg       dout = 1'b1,
    input wire [7:0] data_in,
    input wire       en,
    output reg       rdy = 1'b1
);

parameter [1:0] UART_START  = 2'd0;
parameter [1:0] UART_DATA   = 2'd1;
parameter [1:0] UART_STOP   = 2'd2;
parameter [1:0] UART_IDLE   = 2'd3;

reg [7:0] data = 8'd0;
reg [1:0] state = UART_START;
reg [2:0] bit_cnt = 3'd0;
reg [9:0] etu_cnt = 10'd0;

wire etu_full;
assign etu_full = (etu_cnt == `UART_FULL_ETU);

always  @ (posedge clk)
begin
    if (rst)
    begin
        state <= UART_START;
        dout <= 1'b1;
        rdy <= 1'b1;
    end

    else
    begin
        // Default assignments
        etu_cnt <= (etu_cnt + 1'b1);
        dout <= dout;
        rdy <= rdy;
        data <= data;
        state <= state;
        bit_cnt <= bit_cnt;

        case(state)

            // Idle, waiting for enable
            UART_START:
            begin
                if(en)
                begin
                    // Start bit
                    dout <= 1'b0;
                    data <= data_in;
                    state <= UART_DATA;
                    etu_cnt <= 10'd0;
                    bit_cnt <= 3'd0;
                    rdy <= 1'b0;
                end
            end

            // Data Bits
            UART_DATA:
            if(etu_full)
            begin
                etu_cnt <= 10'd0;
                bit_cnt <= (bit_cnt + 1'b1);

                dout <= data[0];
                data <= {data[0], data[7:1]};

                if(bit_cnt == 3'd7)
                begin
                    state <= UART_STOP;
                end
            end

            // Stop Bit(s)
            UART_STOP:
            if(etu_full)
            begin
                etu_cnt <= 10'd0;
                dout <= 1'b1;
                state <= UART_IDLE;
            end

            // Idle time before restarting
            UART_IDLE:
            if(etu_full)
            begin
                rdy <= 1'b1;
                state <= UART_START;
            end

            // default:
            //     $display ("UART TX: Invalid state 0x%X", state);

        endcase
    end
end

endmodule
