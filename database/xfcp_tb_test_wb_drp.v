/*

Copyright (c) 2016 Alex Forencich

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
 * Testbench for wb_drp
 */
module test_wb_drp;

// Parameters
parameter ADDR_WIDTH = 16;

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg [ADDR_WIDTH-1:0] wb_adr_i = 0;
reg [15:0] wb_dat_i = 0;
reg wb_we_i = 0;
reg wb_stb_i = 0;
reg wb_cyc_i = 0;
reg [15:0] drp_di = 0;
reg drp_rdy = 0;

// Outputs
wire [15:0] wb_dat_o;
wire wb_ack_o;
wire [ADDR_WIDTH-1:0] drp_addr;
wire [15:0] drp_do;
wire drp_en;
wire drp_we;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        wb_adr_i,
        wb_dat_i,
        wb_we_i,
        wb_stb_i,
        wb_cyc_i,
        drp_di,
        drp_rdy
    );
    $to_myhdl(
        wb_dat_o,
        wb_ack_o,
        drp_addr,
        drp_do,
        drp_en,
        drp_we
    );

    // dump file
    $dumpfile("test_wb_drp.lxt");
    $dumpvars(0, test_wb_drp);
end

wb_drp #(
    .ADDR_WIDTH(ADDR_WIDTH)
)
UUT (
    .clk(clk),
    .rst(rst),
    .wb_adr_i(wb_adr_i),
    .wb_dat_i(wb_dat_i),
    .wb_dat_o(wb_dat_o),
    .wb_we_i(wb_we_i),
    .wb_stb_i(wb_stb_i),
    .wb_ack_o(wb_ack_o),
    .wb_cyc_i(wb_cyc_i),
    .drp_addr(drp_addr),
    .drp_do(drp_do),
    .drp_di(drp_di),
    .drp_en(drp_en),
    .drp_we(drp_we),
    .drp_rdy(drp_rdy)
);

endmodule
