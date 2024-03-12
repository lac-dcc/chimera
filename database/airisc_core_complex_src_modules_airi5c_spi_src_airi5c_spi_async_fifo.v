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

module airi5c_spi_async_fifo
#(
    parameter                       ADDR_WIDTH  = 3,
    parameter                       DATA_WIDTH  = 8
)
(
    input                           n_reset,

    // write clock domain
    input                           wclk,
    input                           push,
    input       [DATA_WIDTH-1:0]    data_in,
    output  reg                     wfull,
    output  reg                     wempty,
    output  reg [ADDR_WIDTH:0]      wsize,

    // read clock domain
    input                           rclk,
    input                           pop,
    output      [DATA_WIDTH-1:0]    data_out,
    output  reg                     rfull,
    output  reg                     rempty,
    output  reg [ADDR_WIDTH:0]      rsize
);

    // when delta = wptr - rptr = 0, the fifo size could be min (empty) or max (full), the full flag is evaluated to check which case occurred
    // when the fifo gets full, there will always be a carry to the most significant size bit and all other bits will be 0
    // therefore the full flag is used as the most significant size bit
    // due to metastability, the counters need to be gray encoded when crossing clock domains, so only one bit changes at a time
    // the couters also need an additional bit to detect address wrap around

    reg         [DATA_WIDTH-1:0]    data[2**ADDR_WIDTH-1:0];

    // write clock domain signals
    reg         [ADDR_WIDTH:0]      wcnt_bin;               // write counter
    reg         [ADDR_WIDTH:0]      wcnt_gray;              // write counter gray encoded
    reg         [ADDR_WIDTH:0]      w_rcnt_gray_metastable;
    reg         [ADDR_WIDTH:0]      w_rcnt_gray;            // read counter gray encoded (synchronized into write clock domain)
    wire        [ADDR_WIDTH:0]      w_rcnt_bin;             // read counter

    wire        [ADDR_WIDTH-1:0]    wptr                    = wcnt_bin[ADDR_WIDTH-1:0];
    wire        [ADDR_WIDTH-1:0]    w_rptr                  = w_rcnt_bin[ADDR_WIDTH-1:0];
    wire        [ADDR_WIDTH:0]      wcnt_bin_next           = wcnt_bin + (push && !wfull);
    wire        [ADDR_WIDTH:0]      wcnt_gray_next          = (wcnt_bin_next >> 1) ^ wcnt_bin_next; // convert binary to gray code
    wire        [ADDR_WIDTH-1:0]    wdelta                  = wcnt_bin_next[ADDR_WIDTH-1:0] - w_rptr;
    wire                            wfull_next              = wcnt_gray_next == {~w_rcnt_gray[ADDR_WIDTH:ADDR_WIDTH-1], w_rcnt_gray[ADDR_WIDTH-2:0]};
    wire                            wempty_next             = wdelta == 0 && !wfull_next;
    wire        [ADDR_WIDTH:0]      wsize_next              = {wfull_next, wdelta};

    // read clock domain signals
    reg         [ADDR_WIDTH:0]      rcnt_bin;               // read counter
    reg         [ADDR_WIDTH:0]      rcnt_gray;              // read counter gray encoded
    reg         [ADDR_WIDTH:0]      r_wcnt_gray_metastable;
    reg         [ADDR_WIDTH:0]      r_wcnt_gray;            // write counter gray encoded (synchronized into read clock domain)
    wire        [ADDR_WIDTH:0]      r_wcnt_bin;             // write counter

    wire        [ADDR_WIDTH-1:0]    rptr                    = rcnt_bin[ADDR_WIDTH-1:0];
    wire        [ADDR_WIDTH-1:0]    r_wptr                  = r_wcnt_bin[ADDR_WIDTH-1:0];
    wire        [ADDR_WIDTH:0]      rcnt_bin_next           = rcnt_bin + (pop && !rempty);
    wire        [ADDR_WIDTH:0]      rcnt_gray_next          = (rcnt_bin_next >> 1) ^ rcnt_bin_next; // convert binary to gray code
    wire        [ADDR_WIDTH-1:0]    rdelta                  = r_wptr - rcnt_bin_next[ADDR_WIDTH-1:0];
    wire                            rempty_next             = rcnt_gray_next == r_wcnt_gray;
    wire                            rfull_next              = rdelta == 0 && !rempty_next;
    wire        [ADDR_WIDTH:0]      rsize_next              = {rfull_next, rdelta};

    assign                          data_out                = data[rptr];

    integer                         i;
    genvar                          j;

    // convert gray code back to binary (needed to calculate size in the respective clock domain)
    assign                          w_rcnt_bin[ADDR_WIDTH]  = w_rcnt_gray[ADDR_WIDTH];
    assign                          r_wcnt_bin[ADDR_WIDTH]  = r_wcnt_gray[ADDR_WIDTH];

    generate
        for (j = ADDR_WIDTH-1; j >= 0 ; j = j-1) begin
            assign w_rcnt_bin[j] = w_rcnt_bin[j+1] ^ w_rcnt_gray[j];
            assign r_wcnt_bin[j] = r_wcnt_bin[j+1] ^ r_wcnt_gray[j];
        end
    endgenerate

    // write clock domain
    always @(posedge wclk, negedge n_reset) begin
        if (!n_reset) begin
            w_rcnt_gray_metastable  <= 1'b0;
            w_rcnt_gray             <= 1'b0;
            wcnt_bin                <= 1'b0;
            wcnt_gray               <= 1'b0;
            wfull                   <= 1'b0;
            wempty                  <= 1'b1;
            wsize                   <= 0;

            for (i = 0; i < 2**ADDR_WIDTH; i = i + 1)
                data[i]             <= 0;
        end

        else begin
             // cross clock domains
            w_rcnt_gray_metastable  <= rcnt_gray;
            w_rcnt_gray             <= w_rcnt_gray_metastable;
            wcnt_bin                <= wcnt_bin_next;
            wcnt_gray               <= wcnt_gray_next;
            wfull                   <= wfull_next;
            wempty                  <= wempty_next;
            wsize                   <= wsize_next;

            if (push && !wfull)
                data[wptr]          <= data_in;
        end
    end

    // read clock domain
    always @(posedge rclk, negedge n_reset) begin
        if (!n_reset) begin
            r_wcnt_gray_metastable  <= 1'b0;
            r_wcnt_gray             <= 1'b0;
            rcnt_bin                <= 1'b0;
            rcnt_gray               <= 1'b0;
            rempty                  <= 1'b1;
            rfull                   <= 1'b0;
            rsize                   <= 0;
        end

        else begin
            // cross clock domains
            r_wcnt_gray_metastable  <= wcnt_gray;
            r_wcnt_gray             <= r_wcnt_gray_metastable;
            rcnt_bin                <= rcnt_bin_next;
            rcnt_gray               <= rcnt_gray_next;
            rempty                  <= rempty_next;
            rfull                   <= rfull_next;
            rsize                   <= rsize_next;
        end
    end

endmodule