`timescale 1ns / 1ps
`default_nettype none
//
// RISu64
// Copyright 2022 Wenting Zhang
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
module ram_512_64(
    input wire clk,
    input wire rst,
    // Read port
    input wire [8:0] raddr,
    output wire [63:0] rd,
    input wire re,
    // Write port
    input wire [8:0] waddr,
    input wire [63:0] wr,
    input wire we
);

`ifdef SKY130
    reg rd_bypass_en;
    reg [63:0] rd_bypass;
    always @(posedge clk) begin
        rd_bypass <= wr;
        rd_bypass_en <= (raddr == waddr) && we;
    end

    wire [63:0] ram_rd;
    wire ram_re = (raddr != waddr) && re;

    sky130_sram_2kbyte_1rw1r_32x512_8 lo_mem(
        .clk0(clk),
        .csb0(!we),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[31:0]),
        .dout0(),
        .clk1(clk),
        .csb1(!ram_re),
        .addr1(raddr[8:0]),
        .dout1(ram_rd[31:0])
    );

    sky130_sram_2kbyte_1rw1r_32x512_8 hi_mem(
        .clk0(clk),
        .csb0(!we),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[63:32]),
        .dout0(),
        .clk1(clk),
        .csb1(!ram_re),
        .addr1(raddr[8:0]),
        .dout1(ram_rd[63:32])
    );

    /*sky130_sram_4kbyte_1r1w_64x512 mem(
        .clk0(clk),
        .csb0(!we),
        .addr0(waddr),
        .din0(wr),
        .clk1(clk),
        .csb1(!ram_re),
        .addr1(raddr),
        .dout1(ram_rd)
    );*/

    assign rd = rd_bypass_en ? rd_bypass : ram_rd;
`else
    reg [63:0] mem [0:511];
    reg [63:0] rd_reg;

    always @(posedge clk) begin
        if (!rst) begin
            if (re) begin
                if ((raddr == waddr) && we) begin
                    rd_reg <= wr;
                end
                else begin
                    rd_reg <= mem[raddr];
                end
            end
            // W
            if (we) begin
                mem[waddr] <= wr;
            end
        end
    end

    assign rd = rd_reg;
`endif

endmodule
