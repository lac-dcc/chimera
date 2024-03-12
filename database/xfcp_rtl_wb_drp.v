/*

Copyright (c) 2017 Alex Forencich

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

*/

// Language: Verilog 2001

`timescale 1ns / 1ps

/*
 * Wishbone DRP shim
 */
module wb_drp #
(
    parameter ADDR_WIDTH = 16
)
(
    input  wire                    clk,
    input  wire                    rst,

    /*
     * Wishbone interface
     */
    input  wire [ADDR_WIDTH-1:0]   wb_adr_i,   // ADR_I() address
    input  wire [15:0]             wb_dat_i,   // DAT_I() data in
    output wire [15:0]             wb_dat_o,   // DAT_O() data out
    input  wire                    wb_we_i,    // WE_I write enable input
    input  wire                    wb_stb_i,   // STB_I strobe input
    output wire                    wb_ack_o,   // ACK_O acknowledge output
    input  wire                    wb_cyc_i,   // CYC_I cycle input

    /*
     * DRP interface
     */
    output wire [ADDR_WIDTH-1:0]   drp_addr,
    output wire [15:0]             drp_do,
    input  wire [15:0]             drp_di,
    output wire                    drp_en,
    output wire                    drp_we,
    input  wire                    drp_rdy
);

reg cycle = 1'b0;

assign drp_addr = wb_adr_i;
assign drp_do = wb_dat_i;
assign wb_dat_o = drp_di;
assign drp_en = wb_cyc_i & wb_stb_i & ~cycle;
assign drp_we = wb_cyc_i & wb_stb_i & wb_we_i & ~cycle;
assign wb_ack_o = drp_rdy;

always @(posedge clk) begin
    cycle <= wb_cyc_i & wb_stb_i & ~drp_rdy;

    if (rst) begin
        cycle <= 1'b0;
    end
end

endmodule
