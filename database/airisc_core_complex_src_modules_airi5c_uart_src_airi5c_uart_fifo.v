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

module airi5c_uart_fifo
#(
    parameter       ADDR_WIDTH  = 4,
    parameter       DATA_WIDTH  = 8
)
(
    input                       n_reset,
    input                       clear,
    input                       clk,

    // write port
    input                       push,
    input   [DATA_WIDTH-1:0]    data_in,

    // read port
    input                       pop,
    output  [DATA_WIDTH-1:0]    data_out,

    output  [ADDR_WIDTH:0]      size,
    output  reg                 empty,
    output  reg                 full
);

    reg     [DATA_WIDTH-1:0]    fifo[2**ADDR_WIDTH-1:0];

    reg     [ADDR_WIDTH-1:0]    read_ptr;
    wire    [ADDR_WIDTH-1:0]    read_ptr_next;
    reg     [ADDR_WIDTH-1:0]    write_ptr;
    wire    [ADDR_WIDTH-1:0]    write_ptr_next;

    assign                      read_ptr_next   = read_ptr + 1;
    assign                      write_ptr_next  = write_ptr + 1;

    assign                      data_out        = push && pop && empty ? data_in : fifo[read_ptr];
    assign                      size            = {full, write_ptr - read_ptr};

    integer i;

    always @(posedge clk, negedge n_reset) begin
        if (!n_reset) begin
            for (i = 0; i < 2**ADDR_WIDTH; i = i+1)
                fifo[i] <= 0;

            read_ptr        <= 0;
            write_ptr       <= 0;
            empty           <= 1'b1;
            full            <= 1'b0;
        end

        else if (clear) begin
            for (i = 0; i < 2**ADDR_WIDTH; i = i+1)
                fifo[i] <= 0;

            read_ptr        <= 0;
            write_ptr       <= 0;
            empty           <= 1'b1;
            full            <= 1'b0;
        end

        else if (push && pop) begin
            fifo[write_ptr] <= data_in;
            fifo[read_ptr]  <= 0;
            write_ptr       <= write_ptr_next;
            read_ptr        <= read_ptr_next;
        end

        else if (push && !full) begin
            fifo[write_ptr] <= data_in;
            write_ptr       <= write_ptr_next;
            empty           <= 1'b0;

            if (write_ptr_next == read_ptr)
                full <= 1'b1;
        end

        else if (pop && !empty) begin
            fifo[read_ptr]  <= 0;
            read_ptr        <= read_ptr_next;
            full            <= 1'b0;

            if (read_ptr_next == write_ptr)
                empty <= 1'b1;
        end
    end

endmodule