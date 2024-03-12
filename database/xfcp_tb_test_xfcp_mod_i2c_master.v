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
 * Testbench for xfcp_mod_i2c_master
 */
module test_xfcp_mod_i2c_master;

// Parameters
parameter XFCP_ID_TYPE = 16'h2C00;
parameter XFCP_ID_STR = "I2C Master";
parameter XFCP_EXT_ID = 0;
parameter XFCP_EXT_ID_STR = "";
parameter DEFAULT_PRESCALE = 1;

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg [7:0] up_xfcp_in_tdata = 0;
reg up_xfcp_in_tvalid = 0;
reg up_xfcp_in_tlast = 0;
reg up_xfcp_in_tuser = 0;
reg up_xfcp_out_tready = 0;
reg i2c_scl_i = 1;
reg i2c_sda_i = 1;

// Outputs
wire up_xfcp_in_tready;
wire [7:0] up_xfcp_out_tdata;
wire up_xfcp_out_tvalid;
wire up_xfcp_out_tlast;
wire up_xfcp_out_tuser;
wire i2c_scl_o;
wire i2c_scl_t;
wire i2c_sda_o;
wire i2c_sda_t;

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
        i2c_scl_i,
        i2c_sda_i
    );
    $to_myhdl(
        up_xfcp_in_tready,
        up_xfcp_out_tdata,
        up_xfcp_out_tvalid,
        up_xfcp_out_tlast,
        up_xfcp_out_tuser,
        i2c_scl_o,
        i2c_scl_t,
        i2c_sda_o,
        i2c_sda_t
    );

    // dump file
    $dumpfile("test_xfcp_mod_i2c_master.lxt");
    $dumpvars(0, test_xfcp_mod_i2c_master);
end

xfcp_mod_i2c_master #(
    .XFCP_ID_TYPE(XFCP_ID_TYPE),
    .XFCP_ID_STR(XFCP_ID_STR),
    .XFCP_EXT_ID(XFCP_EXT_ID),
    .XFCP_EXT_ID_STR(XFCP_EXT_ID_STR),
    .DEFAULT_PRESCALE(DEFAULT_PRESCALE)
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
    .i2c_scl_i(i2c_scl_i),
    .i2c_scl_o(i2c_scl_o),
    .i2c_scl_t(i2c_scl_t),
    .i2c_sda_i(i2c_sda_i),
    .i2c_sda_o(i2c_sda_o),
    .i2c_sda_t(i2c_sda_t)
);

endmodule
