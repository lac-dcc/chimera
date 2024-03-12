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
 * Testbench for xfcp_interface_udp
 */
module test_xfcp_interface_udp;

// Parameters

// Inputs
reg clk = 0;
reg rst = 0;
reg [7:0] current_test = 0;

reg [7:0] s_eth_axis_tdata = 0;
reg s_eth_axis_tvalid = 0;
reg s_eth_axis_tlast = 0;
reg s_eth_axis_tuser = 0;
reg m_eth_axis_tready = 0;
reg [7:0] down_xfcp_in_tdata = 0;
reg down_xfcp_in_tvalid = 0;
reg down_xfcp_in_tlast = 0;
reg down_xfcp_in_tuser = 0;
reg down_xfcp_out_tready = 0;
reg [47:0] local_mac = 0;
reg [31:0] local_ip = 0;
reg [15:0] local_port = 0;
reg [31:0] gateway_ip = 0;
reg [31:0] subnet_mask = 0;

// Outputs
wire s_eth_axis_tready;
wire [7:0] m_eth_axis_tdata;
wire m_eth_axis_tvalid;
wire m_eth_axis_tlast;
wire m_eth_axis_tuser;
wire down_xfcp_in_tready;
wire [7:0] down_xfcp_out_tdata;
wire down_xfcp_out_tvalid;
wire down_xfcp_out_tlast;
wire down_xfcp_out_tuser;

initial begin
    // myhdl integration
    $from_myhdl(
        clk,
        rst,
        current_test,
        s_eth_axis_tdata,
        s_eth_axis_tvalid,
        s_eth_axis_tlast,
        s_eth_axis_tuser,
        m_eth_axis_tready,
        down_xfcp_in_tdata,
        down_xfcp_in_tvalid,
        down_xfcp_in_tlast,
        down_xfcp_in_tuser,
        down_xfcp_out_tready,
        local_mac,
        local_ip,
        local_port,
        gateway_ip,
        subnet_mask
    );
    $to_myhdl(
        s_eth_axis_tready,
        m_eth_axis_tdata,
        m_eth_axis_tvalid,
        m_eth_axis_tlast,
        m_eth_axis_tuser,
        down_xfcp_in_tready,
        down_xfcp_out_tdata,
        down_xfcp_out_tvalid,
        down_xfcp_out_tlast,
        down_xfcp_out_tuser
    );

    // dump file
    $dumpfile("test_xfcp_interface_udp.lxt");
    $dumpvars(0, test_xfcp_interface_udp);
end

xfcp_interface_udp
UUT (
    .clk(clk),
    .rst(rst),
    .s_eth_axis_tdata(s_eth_axis_tdata),
    .s_eth_axis_tvalid(s_eth_axis_tvalid),
    .s_eth_axis_tready(s_eth_axis_tready),
    .s_eth_axis_tlast(s_eth_axis_tlast),
    .s_eth_axis_tuser(s_eth_axis_tuser),
    .m_eth_axis_tdata(m_eth_axis_tdata),
    .m_eth_axis_tvalid(m_eth_axis_tvalid),
    .m_eth_axis_tready(m_eth_axis_tready),
    .m_eth_axis_tlast(m_eth_axis_tlast),
    .m_eth_axis_tuser(m_eth_axis_tuser),
    .down_xfcp_in_tdata(down_xfcp_in_tdata),
    .down_xfcp_in_tvalid(down_xfcp_in_tvalid),
    .down_xfcp_in_tready(down_xfcp_in_tready),
    .down_xfcp_in_tlast(down_xfcp_in_tlast),
    .down_xfcp_in_tuser(down_xfcp_in_tuser),
    .down_xfcp_out_tdata(down_xfcp_out_tdata),
    .down_xfcp_out_tvalid(down_xfcp_out_tvalid),
    .down_xfcp_out_tready(down_xfcp_out_tready),
    .down_xfcp_out_tlast(down_xfcp_out_tlast),
    .down_xfcp_out_tuser(down_xfcp_out_tuser),
    .local_mac(local_mac),
    .local_ip(local_ip),
    .local_port(local_port),
    .gateway_ip(gateway_ip),
    .subnet_mask(subnet_mask)
);

endmodule
