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
module ram_1024_64(
        input wire clk,
        input wire rst,
        // Read port
        input wire [9:0] raddr,
        output wire [63:0] rd,
        // Write port
        input wire [9:0] waddr,
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

    wire [63:0] bank0_rd;
    wire [63:0] bank1_rd;
    wire bank0_wcs = !waddr[9] & we;
    wire bank1_wcs = waddr[9] & we;
    wire bank0_rcs = !waddr[9];
    wire bank1_rcs = waddr[9];

    sky130_sram_2kbyte_1rw1r_32x512_8 bank0_lo_mem(
        .clk0(clk),
        .csb0(!bank0_wcs),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[31:0]),
        .dout0(),
        .clk1(clk),
        .csb1(!bank0_rcs),
        .addr1(raddr[8:0]),
        .dout1(bank0_rd[31:0])
    );

    sky130_sram_2kbyte_1rw1r_32x512_8 bank0_hi_mem(
        .clk0(clk),
        .csb0(!bank0_wcs),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[63:32]),
        .dout0(),
        .clk1(clk),
        .csb1(!bank0_rcs),
        .addr1(raddr[8:0]),
        .dout1(bank0_rd[63:32])
    );

    sky130_sram_2kbyte_1rw1r_32x512_8 bank1_lo_mem(
        .clk0(clk),
        .csb0(!bank1_wcs),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[31:0]),
        .dout0(),
        .clk1(clk),
        .csb1(!bank1_rcs),
        .addr1(raddr[8:0]),
        .dout1(bank1_rd[31:0])
    );

    sky130_sram_2kbyte_1rw1r_32x512_8 bank1_hi_mem(
        .clk0(clk),
        .csb0(!bank1_wcs),
        .web0(!we),
        .wmask0(4'hF),
        .addr0(waddr[8:0]),
        .din0(wr[63:32]),
        .dout0(),
        .clk1(clk),
        .csb1(!bank1_rcs),
        .addr1(raddr[8:0]),
        .dout1(bank1_rd[63:32])
    );

    assign rd = (rd_bypass_en) ? (rd_bypass) :
            (bank0_rcs) ? (bank0_rd) : (bank1_rd);
`else
    reg [63:0] mem [0:1023];
    reg [63:0] rd_reg;

    always @(posedge clk) begin
        if (!rst) begin
            if ((raddr == waddr) && we) begin
                rd_reg <= wr;
            end
            else begin
                rd_reg <= mem[raddr];
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
