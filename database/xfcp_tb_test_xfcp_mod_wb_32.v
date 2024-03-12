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
 * Testbench for xfcp_mod_wb
 */
module test_xfcp_mod_wb_32;

// Parameters
parameter XFCP_ID_TYPE = 16'h0001;
parameter XFCP_ID_STR = "WB Master";
parameter XFCP_EXT_ID = 0;
parameter XFCP_EXT_ID_STR = "";
parameter COUNT_SIZE = 16;
parameter WB_DATA_WIDTH = 32;
parameter WB_ADDR_WIDTH = 32;
parameter WB_SELECT_WIDTH = (WB_DATA_WIDTH/8);

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg [7:0] up_xfcp_in_tdata = 0;
reg up_xfcp_in_tvalid = 0;
reg up_xfcp_in_tlast = 0;
reg up_xfcp_in_tuser = 0;
reg up_xfcp_out_tready = 0;
reg [WB_DATA_WIDTH-1:0] wb_dat_i = 0;
reg wb_ack_i = 0;
reg wb_err_i = 0;

// Outputs
wire up_xfcp_in_tready;
wire [7:0] up_xfcp_out_tdata;
wire up_xfcp_out_tvalid;
wire up_xfcp_out_tlast;
wire up_xfcp_out_tuser;
wire [WB_ADDR_WIDTH-1:0] wb_adr_o;
wire [WB_DATA_WIDTH-1:0] wb_dat_o;
wire wb_we_o;
wire [WB_SELECT_WIDTH-1:0] wb_sel_o;
wire wb_stb_o;
wire wb_cyc_o;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        up_xfcp_in_tdata,
        up_xfcp_in_tvalid,
        up_xfcp_in_tlast,
        up_xfcp_in_tuser,
        up_xfcp_out_tready,
        wb_dat_i,
        wb_ack_i,
        wb_err_i
    );
    $to_myhdl(
        up_xfcp_in_tready,
        up_xfcp_out_tdata,
        up_xfcp_out_tvalid,
        up_xfcp_out_tlast,
        up_xfcp_out_tuser,
        wb_adr_o,
        wb_dat_o,
        wb_we_o,
        wb_sel_o,
        wb_stb_o,
        wb_cyc_o
    );

    // dump file
    $dumpfile("test_xfcp_mod_wb_32.lxt");
    $dumpvars(0, test_xfcp_mod_wb_32);
end

xfcp_mod_wb #(
    .XFCP_ID_TYPE(XFCP_ID_TYPE),
    .XFCP_ID_STR(XFCP_ID_STR),
    .XFCP_EXT_ID(XFCP_EXT_ID),
    .XFCP_EXT_ID_STR(XFCP_EXT_ID_STR),
    .COUNT_SIZE(COUNT_SIZE),
    .WB_DATA_WIDTH(WB_DATA_WIDTH),
    .WB_ADDR_WIDTH(WB_ADDR_WIDTH),
    .WB_SELECT_WIDTH(WB_SELECT_WIDTH)
)
UUT (
    .clk(clk),
    .rst(rst),
    .up_xfcp_in_tdata(up_xfcp_in_tdata),
    .up_xfcp_in_tvalid(up_xfcp_in_tvalid),
    .up_xfcp_in_tready(up_xfcp_in_tready),
    .up_xfcp_in_tlast(up_xfcp_in_tlast),
    .up_xfcp_in_tuser(up_xfcp_in_tuser),
    .up_xfcp_out_tdata(up_xfcp_out_tdata),
    .up_xfcp_out_tvalid(up_xfcp_out_tvalid),
    .up_xfcp_out_tready(up_xfcp_out_tready),
    .up_xfcp_out_tlast(up_xfcp_out_tlast),
    .up_xfcp_out_tuser(up_xfcp_out_tuser),
    .wb_adr_o(wb_adr_o),
    .wb_dat_i(wb_dat_i),
    .wb_dat_o(wb_dat_o),
    .wb_we_o(wb_we_o),
    .wb_sel_o(wb_sel_o),
    .wb_stb_o(wb_stb_o),
    .wb_ack_i(wb_ack_i),
    .wb_err_i(wb_err_i),
    .wb_cyc_o(wb_cyc_o)
);

endmodule
