// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

`timescale 1ns/1ns
module ddr2_ctrl(
sys_rst_n,

ddr2_clk,
local_init_done,
local_ready,
local_address,
local_read_req,
local_write_req,
local_wdata,
local_be,
local_size,
local_rdata,
local_rdata_valid,
local_burstbegin,

um2ddr_wrclk,
um2ddr_wrreq,
um2ddr_data,
um2ddr_ready,
um2ddr_command_wrreq,
um2ddr_command,

ddr2um_rdclk,
ddr2um_rdreq,
ddr2um_rdata,
ddr2um_valid_rdreq,
ddr2um_valid_rdata,
ddr2um_valid_empty
);
input          sys_rst_n;
input          ddr2_clk;
input		      local_ready;
input	[31:0]	local_rdata;
input		      local_rdata_valid;
input		      local_init_done;
		
output[25:0]	local_address;
output		   local_write_req;
output		   local_read_req;
output		   local_burstbegin;
output[31:0]	local_wdata;
output[3:0]   local_be;
output[3:0]	   local_size;

input          um2ddr_wrclk;
input          um2ddr_wrreq;
input	[127:0]  um2ddr_data; 
output         um2ddr_ready;
input          um2ddr_command_wrreq;
input	[33:0]   um2ddr_command;

input          ddr2um_rdclk;
input          ddr2um_rdreq;
output[127:0]  ddr2um_rdata;
input          ddr2um_valid_rdreq;
output[6:0]    ddr2um_valid_rdata;
output         ddr2um_valid_empty;
ddr2_ctrl_input ddr2_ctrl_input(
.sys_rst_n(sys_rst_n),
.ddr2_clk(ddr2_clk),
.local_init_done(local_init_done),
.local_ready(local_ready),
.local_address(local_address),
.local_read_req(local_read_req),
.local_write_req(local_write_req),
.local_wdata(local_wdata),
.local_be(local_be),
.local_size(local_size),
.local_burstbegin(local_burstbegin),
.um2ddr_wrclk(um2ddr_wrclk),
.um2ddr_wrreq(um2ddr_wrreq),
.um2ddr_data(um2ddr_data),
.um2ddr_ready(um2ddr_ready),
.um2ddr_command_wrreq(um2ddr_command_wrreq),
.um2ddr_command(um2ddr_command),

.rd_ddr2_size(rd_ddr2_size),
.rd_ddr2_size_wrreq(rd_ddr2_size_wrreq),
.read_permit(read_permit)
);
wire[6:0]     rd_ddr2_size;
wire          rd_ddr2_size_wrreq;
wire          read_permit;
ddr2_ctrl_output ddr2_ctrl_output(
.sys_rst_n(sys_rst_n),

.ddr2_clk(ddr2_clk),

.local_rdata(local_rdata),
.local_rdata_valid(local_rdata_valid),

.ddr2um_rdclk(ddr2um_rdclk),
.ddr2um_rdreq(ddr2um_rdreq),
.ddr2um_rdata(ddr2um_rdata),
.ddr2um_valid_rdreq(ddr2um_valid_rdreq),
.ddr2um_valid_rdata(ddr2um_valid_rdata),
.ddr2um_valid_empty(ddr2um_valid_empty),

.rd_ddr2_size(rd_ddr2_size),
.rd_ddr2_size_wrreq(rd_ddr2_size_wrreq),
.read_permit(read_permit)
);
endmodule

