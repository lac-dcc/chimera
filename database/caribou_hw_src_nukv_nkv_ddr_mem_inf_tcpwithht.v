// This program was cloned from: https://github.com/fpgasystems/caribou
// License: GNU General Public License v3.0

//---------------------------------------------------------------------------
//--  Copyright 2015 - 2017 Systems Group, ETH Zurich
//-- 
//--  This hardware module is free software: you can redistribute it and/or
//--  modify it under the terms of the GNU General Public License as published
//--  by the Free Software Foundation, either version 3 of the License, or
//--  (at your option) any later version.
//-- 
//--  This program is distributed in the hope that it will be useful,
//--  but WITHOUT ANY WARRANTY; without even the implied warranty of
//--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//--  GNU General Public License for more details.
//-- 
//--  You should have received a copy of the GNU General Public License
//--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
//---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/11/2013 02:22:48 PM
// Design Name: 
// Module Name: mem_inf
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module nkv_ddr_mem_inf
(
input wire clk156_25,
//input reset233_n, //active low reset signal for 233MHz clock domain
input wire  reset156_25_n,
input wire  clk212,
input wire  clk200,
input wire  sys_rst,

//ddr3 pins
//SODIMM 0
// Inouts
inout wire  [63:0]                         c0_ddr3_dq,
inout wire  [7:0]                        c0_ddr3_dqs_n,
inout wire  [7:0]                        c0_ddr3_dqs_p,

// Outputs
output wire  [15:0]                     c0_ddr3_addr,
output wire  [2:0]                      c0_ddr3_ba,
output wire                             c0_ddr3_ras_n,
output wire                            c0_ddr3_cas_n,
output wire                            c0_ddr3_we_n,
output wire                            c0_ddr3_reset_n,
output wire                        c0_ddr3_ck_p,
output wire                        c0_ddr3_ck_n,
output wire                       c0_ddr3_cke,
output wire                       c0_ddr3_cs_n,
output wire[7:0]                  c0_ddr3_dm,
output wire                       c0_ddr3_odt,
output wire                       c0_ui_clk,
output wire                       c0_init_calib_complete,

//SODIMM 1
// Inouts
inout wire[63:0]                         c1_ddr3_dq,
inout wire[7:0]                        c1_ddr3_dqs_n,
inout wire[7:0]                        c1_ddr3_dqs_p,

// Outputs
output wire[15:0]                     c1_ddr3_addr,
output wire[2:0]                      c1_ddr3_ba,
output wire                           c1_ddr3_ras_n,
output  wire                          c1_ddr3_cas_n,
output wire                           c1_ddr3_we_n,
output wire                           c1_ddr3_reset_n,
output wire                       c1_ddr3_ck_p,
output wire                       c1_ddr3_ck_n,
output wire                       c1_ddr3_cke,
output wire                       c1_ddr3_cs_n,
output wire[7:0]                  c1_ddr3_dm,
output wire                       c1_ddr3_odt,

//ui outputs
output wire                       c1_ui_clk,
output wire                       c1_init_calib_complete,

//toe stream interface signals
input  wire         toeTX_s_axis_read_cmd_tvalid,
output wire         toeTX_s_axis_read_cmd_tready,
input wire[71:0]     toeTX_s_axis_read_cmd_tdata,
//read status
output wire         toeTX_m_axis_read_sts_tvalid,
input wire          toeTX_m_axis_read_sts_tready,
output wire[7:0]     toeTX_m_axis_read_sts_tdata,
//read stream
output wire[63:0]    toeTX_m_axis_read_tdata,
output wire[7:0]     toeTX_m_axis_read_tkeep,
output      wire    toeTX_m_axis_read_tlast,
output      wire    toeTX_m_axis_read_tvalid,
input      wire     toeTX_m_axis_read_tready,

//write commands
input  wire         toeTX_s_axis_write_cmd_tvalid,
output wire         toeTX_s_axis_write_cmd_tready,
input wire[71:0]     toeTX_s_axis_write_cmd_tdata,
//write status
output    wire      toeTX_m_axis_write_sts_tvalid,
input  wire         toeTX_m_axis_write_sts_tready,
output wire[31:0]     toeTX_m_axis_write_sts_tdata,
//write stream
input wire[63:0]     toeTX_s_axis_write_tdata,
input wire[7:0]      toeTX_s_axis_write_tkeep,
input wire          toeTX_s_axis_write_tlast,
input wire          toeTX_s_axis_write_tvalid,
output wire         toeTX_s_axis_write_tready,

	// HashTable DRAM Connection

	// ht_dramRdData:     Pull Input, 1536b
	output  wire [511:0] ht_dramRdData_data,
	output  wire          ht_dramRdData_empty,
	output  wire          ht_dramRdData_almost_empty,
	input wire          ht_dramRdData_read,

	// ht_cmd_dramRdData: Push Output, 10b
	input wire [63:0] ht_cmd_dramRdData_data,
	input wire       ht_cmd_dramRdData_valid,
	output  wire       ht_cmd_dramRdData_stall,

	// ht_dramWrData:     Push Output, 1536b
	input wire [511:0] ht_dramWrData_data,
	input wire          ht_dramWrData_valid,
	output  wire          ht_dramWrData_stall,

	// ht_cmd_dramWrData: Push Output, 10b
	input wire [63:0] ht_cmd_dramWrData_data,
	input wire       ht_cmd_dramWrData_valid,
	output  wire       ht_cmd_dramWrData_stall,
	
	// Update DRAM Connection

    // upd_dramRdData:     Pull Input, 1536b
    output  wire [511:0] upd_dramRdData_data,
    output  wire          upd_dramRdData_empty,
    output  wire          upd_dramRdData_almost_empty,
    input wire          upd_dramRdData_read,

    // upd_cmd_dramRdData: Push Output, 10b
    input wire [63:0] upd_cmd_dramRdData_data,
    input wire       upd_cmd_dramRdData_valid,
    output  wire       upd_cmd_dramRdData_stall,

    // upd_dramWrData:     Push Output, 1536b
    input wire [511:0] upd_dramWrData_data,
    input wire          upd_dramWrData_valid,
    output  wire          upd_dramWrData_stall,

    // upd_cmd_dramWrData: Push Output, 10b
    input wire [63:0] upd_cmd_dramWrData_data,
    input wire       upd_cmd_dramWrData_valid,
    output  wire       upd_cmd_dramWrData_stall,

	input wire [63:0] ptr_rdcmd_data,
	input wire         ptr_rdcmd_valid,
	output  wire         ptr_rdcmd_ready,

	output wire [512-1:0]  ptr_rd_data,
	output wire         ptr_rd_valid,
	input  wire         ptr_rd_ready,	

	input wire [512-1:0] ptr_wr_data,
	input wire         ptr_wr_valid,
	output  wire         ptr_wr_ready,

	input wire [63:0] ptr_wrcmd_data,
	input wire         ptr_wrcmd_valid,
	output  wire         ptr_wrcmd_ready,


	input wire [63:0] bmap_rdcmd_data,
	input wire         bmap_rdcmd_valid,
	output  wire         bmap_rdcmd_ready,

	output wire [512-1:0]  bmap_rd_data,
	output wire         bmap_rd_valid,
	input  wire         bmap_rd_ready,	

	input wire [512-1:0] bmap_wr_data,
	input wire         bmap_wr_valid,
	output  wire         bmap_wr_ready,

	input wire [63:0] bmap_wrcmd_data,
	input wire         bmap_wrcmd_valid,
	output  wire         bmap_wrcmd_ready


);




wire           ht_s_axis_read_cmd_tvalid;
wire          ht_s_axis_read_cmd_tready;
wire[71:0]     ht_s_axis_read_cmd_tdata;

//read status
wire          ht_m_axis_read_sts_tvalid;
wire           ht_m_axis_read_sts_tready;
wire[7:0]     ht_m_axis_read_sts_tdata;
//read stream
wire[511:0]    ht_m_axis_read_tdata;
wire[63:0]     ht_m_axis_read_tkeep;
wire          ht_m_axis_read_tlast;
wire          ht_m_axis_read_tvalid;
wire           ht_m_axis_read_tempty;
wire           ht_m_axis_read_tready;

//write commands
wire           ht_s_axis_write_cmd_tvalid;
wire          ht_s_axis_write_cmd_tready;
wire[71:0]     ht_s_axis_write_cmd_tdata;
//write status
wire          ht_m_axis_write_sts_tvalid;
wire           ht_m_axis_write_sts_tready;
wire[31:0]     ht_m_axis_write_sts_tdata;
//write stream
wire[511:0]     ht_s_axis_write_tdata;
wire[63:0]      ht_s_axis_write_tkeep;
wire           ht_s_axis_write_tlast;
wire           ht_s_axis_write_tvalid;
wire          ht_s_axis_write_tready;



wire           upd_s_axis_read_cmd_tvalid;
wire          upd_s_axis_read_cmd_tready;
wire[71:0]     upd_s_axis_read_cmd_tdata;
//read status
wire          upd_m_axis_read_sts_tvalid;
wire           upd_m_axis_read_sts_tready;
wire[7:0]     upd_m_axis_read_sts_tdata;
//read stream
wire[511:0]    upd_m_axis_read_tdata;
wire[63:0]     upd_m_axis_read_tkeep;
wire          upd_m_axis_read_tlast;
wire          upd_m_axis_read_tvalid;
wire           upd_m_axis_read_tempty;
wire           upd_m_axis_read_tready;

//write commands
wire           upd_s_axis_write_cmd_tvalid;
wire          upd_s_axis_write_cmd_tready;
wire[71:0]     upd_s_axis_write_cmd_tdata;
//write status
wire          upd_m_axis_write_sts_tvalid;
wire           upd_m_axis_write_sts_tready;
wire[31:0]     upd_m_axis_write_sts_tdata;
//write stream
wire[511:0]     upd_s_axis_write_tdata;
wire[63:0]      upd_s_axis_write_tkeep;
wire           upd_s_axis_write_tlast;
wire           upd_s_axis_write_tvalid;
wire          upd_s_axis_write_tready;  


wire ht_s_buf_write_cmd_tvalid;
wire ht_s_buf_write_cmd_tready;
wire[71:0] ht_s_buf_write_cmd_tdata;


wire        axis_toe_aux1_cc2dm_tvalid;
wire        axis_toe_aux1_cc2dm_tready;
wire[511:0]  axis_toe_aux1_cc2dm_tdata;
wire[63:0]   axis_toe_aux1_cc2dm_tkeep;
wire        axis_toe_aux1_cc2dm_tlast;
wire axis_toe_aux1_cc2dm_tfull;

wire        axis_toe_aux2_cc2dm_tvalid;
wire        axis_toe_aux2_cc2dm_tready;
wire[511:0]  axis_toe_aux2_cc2dm_tdata;
wire[63:0]   axis_toe_aux2_cc2dm_tkeep;
wire        axis_toe_aux2_cc2dm_tlast;
wire axis_toe_aux2_cc2dm_tfull;


wire toeTX_s_buf_read_cmd_tvalid;
wire toeTX_s_buf_read_cmd_tready;
wire[71:0] toeTX_s_buf_read_cmd_tdata;



wire ptr_s_buf_write_cmd_tvalid;
wire ptr_s_buf_write_cmd_tready;
wire[71:0] ptr_s_buf_write_cmd_tdata;



wire toeTX_s_buf_write_cmd_tvalid;
wire toeTX_s_buf_write_cmd_tready;
wire[71:0] toeTX_s_buf_write_cmd_tdata;


wire bmap_s_buf_write_cmd_tvalid;
wire bmap_s_buf_write_cmd_tready;
wire[71:0] bmap_s_buf_write_cmd_tdata;



wire ptr_s_buf_read_cmd_tvalid;
wire ptr_s_buf_read_cmd_tready;
wire[71:0] ptr_s_buf_read_cmd_tdata;

wire bmap_s_buf_read_cmd_tvalid;
wire bmap_s_buf_read_cmd_tready;
wire[71:0] bmap_s_buf_read_cmd_tdata;


wire ht_s_buf_read_cmd_tvalid;
wire ht_s_buf_read_cmd_tready;
wire[71:0] ht_s_buf_read_cmd_tdata;

wire upd_s_buf_read_cmd_tvalid;
wire upd_s_buf_read_cmd_tready;
wire[71:0] upd_s_buf_read_cmd_tdata;

wire upd_s_buf_write_cmd_tvalid;
wire upd_s_buf_write_cmd_tready;
wire[71:0] upd_s_buf_write_cmd_tdata;

//-----------------------------------------------------------------------------------------------------------
wire           bmap_s_axis_read_cmd_tvalid;
wire          bmap_s_axis_read_cmd_tready;
wire[71:0]     bmap_s_axis_read_cmd_tdata;

//read status
wire          bmap_m_axis_read_sts_tvalid;
wire           bmap_m_axis_read_sts_tready;
wire[7:0]     bmap_m_axis_read_sts_tdata;
//read stream
wire[511:0]    bmap_m_axis_read_tdata;
wire[63:0]     bmap_m_axis_read_tkeep;
wire          bmap_m_axis_read_tlast;
wire          bmap_m_axis_read_tvalid;
wire 		  bmap_m_axis_read_tready;

//write commands
wire           bmap_s_axis_write_cmd_tvalid;
wire          bmap_s_axis_write_cmd_tready;
wire[71:0]     bmap_s_axis_write_cmd_tdata;
//write status
wire          bmap_m_axis_write_sts_tvalid;
wire           bmap_m_axis_write_sts_tready;
wire[31:0]     bmap_m_axis_write_sts_tdata;
//write stream
wire[511:0]     bmap_s_axis_write_tdata;
wire[63:0]      bmap_s_axis_write_tkeep;
wire           bmap_s_axis_write_tlast;
wire           bmap_s_axis_write_tvalid;
wire          bmap_s_axis_write_tready;

wire           ptr_s_axis_read_cmd_tvalid;
wire          ptr_s_axis_read_cmd_tready;
wire[71:0]     ptr_s_axis_read_cmd_tdata;
//read status
wire          ptr_m_axis_read_sts_tvalid;
wire           ptr_m_axis_read_sts_tready;
wire[7:0]     ptr_m_axis_read_sts_tdata;
//read stream
wire[511:0]    ptr_m_axis_read_tdata;
wire[63:0]     ptr_m_axis_read_tkeep;
wire          ptr_m_axis_read_tlast;
wire          ptr_m_axis_read_tvalid;
wire           ptr_m_axis_read_tready;

//write commands
wire           ptr_s_axis_write_cmd_tvalid;
wire          ptr_s_axis_write_cmd_tready;
wire[71:0]     ptr_s_axis_write_cmd_tdata;
//write status
wire          ptr_m_axis_write_sts_tvalid;
wire           ptr_m_axis_write_sts_tready;
wire[31:0]     ptr_m_axis_write_sts_tdata;
//write stream
wire[511:0]     ptr_s_axis_write_tdata;
wire[63:0]      ptr_s_axis_write_tkeep;
wire           ptr_s_axis_write_tlast;
wire           ptr_s_axis_write_tvalid;
wire          ptr_s_axis_write_tready;  


////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////

assign ht_m_axis_write_sts_tready = 1;
assign ht_m_axis_read_sts_tready = 1;

assign ht_s_axis_read_cmd_tvalid = ht_cmd_dramRdData_valid;
assign ht_cmd_dramRdData_stall = ~ht_s_axis_read_cmd_tready;
assign ht_s_axis_read_cmd_tdata = {6'b000000,ht_cmd_dramRdData_data[27:0],6'b000000,2'b00,7'b0000001,9'b000000000,ht_cmd_dramRdData_data[39:32],6'b000000};

assign ht_dramRdData_data = ht_m_axis_read_tdata;
assign ht_dramRdData_empty = ht_m_axis_read_tempty;
assign ht_m_axis_read_tready = ht_dramRdData_read;

assign ht_s_axis_write_cmd_tvalid = ht_cmd_dramWrData_valid;
assign ht_cmd_dramWrData_stall = ~ht_s_axis_write_cmd_tready;
assign ht_s_axis_write_cmd_tdata = {6'b000000,ht_cmd_dramWrData_data[27:0],6'b000000,2'b00,7'b0000001,9'b000000000,ht_cmd_dramWrData_data[39:32],6'b000000};

assign ht_s_axis_write_tdata = ht_dramWrData_data;
assign ht_s_axis_write_tkeep = 64'hFFFFFFFFFFFFFFFF;
assign ht_s_axis_write_tvalid = ht_dramWrData_valid;
assign ht_s_axis_write_tlast = 0;
assign ht_dramWrData_stall = ~ht_s_axis_write_tready;


assign upd_m_axis_write_sts_tready = 1;
assign upd_m_axis_read_sts_tready = 1;

assign upd_s_axis_read_cmd_tvalid = upd_cmd_dramRdData_valid;
assign upd_cmd_dramRdData_stall = ~upd_s_axis_read_cmd_tready;
assign upd_s_axis_read_cmd_tdata = {6'b000000,upd_cmd_dramRdData_data[27:0],6'b000000,2'b00,7'b0000001,9'b000000000,upd_cmd_dramRdData_data[39:32],6'b000000};

assign upd_dramRdData_data = upd_m_axis_read_tdata;
assign upd_dramRdData_empty = upd_m_axis_read_tempty;
assign upd_m_axis_read_tready = upd_dramRdData_read;

assign upd_s_axis_write_cmd_tvalid = upd_cmd_dramWrData_valid;
assign upd_cmd_dramWrData_stall = ~upd_s_axis_write_cmd_tready;
assign upd_s_axis_write_cmd_tdata = {6'b000000,upd_cmd_dramWrData_data[27:0],6'b000000,2'b00,7'b0000001,9'b000000000,upd_cmd_dramWrData_data[39:32],6'b000000};

assign upd_s_axis_write_tdata = upd_dramWrData_data;
assign upd_s_axis_write_tkeep = 64'hFFFFFFFFFFFFFFFF;
assign upd_s_axis_write_tvalid = upd_dramWrData_valid;
assign upd_s_axis_write_tlast = 0;
assign upd_dramWrData_stall = ~upd_s_axis_write_tready;

assign bmap_m_axis_write_sts_tready = 1;
assign bmap_m_axis_read_sts_tready = 1;

assign bmap_s_axis_read_cmd_tvalid = bmap_rdcmd_valid;
assign bmap_rdcmd_ready = bmap_s_axis_read_cmd_tready;
assign bmap_s_axis_read_cmd_tdata = {10'b0000000000,bmap_rdcmd_data[23:0],6'b000000,2'b00,7'b0000001,9'b000000000,1'b0,bmap_rdcmd_data[32 +: 7],6'b000000};

assign bmap_rd_data = bmap_m_axis_read_tdata;
assign bmap_rd_valid = bmap_m_axis_read_tvalid;
assign bmap_m_axis_read_tready = bmap_rd_ready;

assign bmap_s_axis_write_cmd_tvalid = bmap_wrcmd_valid;
assign bmap_wrcmd_ready = bmap_s_axis_write_cmd_tready;
assign bmap_s_axis_write_cmd_tdata = {10'b0000000000,bmap_wrcmd_data[23:0],6'b000000,2'b00,7'b0000001,9'b000000000,1'b0,bmap_wrcmd_data[32 +: 7],6'b000000};

assign bmap_s_axis_write_tdata = bmap_wr_data;
assign bmap_s_axis_write_tkeep = 64'hFFFFFFFFFFFFFFFF;
assign bmap_s_axis_write_tvalid = bmap_wr_valid;
assign bmap_s_axis_write_tlast = 0;
assign bmap_wr_ready = bmap_s_axis_write_tready;

assign ptr_m_axis_write_sts_tready = 1;
assign ptr_m_axis_read_sts_tready = 1;

assign ptr_s_axis_read_cmd_tvalid = ptr_rdcmd_valid;
assign ptr_rdcmd_ready = ptr_s_axis_read_cmd_tready;
assign ptr_s_axis_read_cmd_tdata = {10'b0000000000,ptr_rdcmd_data[23:0],6'b000000,2'b00,7'b0000001,9'b000000000,8'h01,6'b000000};

assign ptr_rd_data = ptr_m_axis_read_tdata;
assign ptr_rd_valid = ptr_m_axis_read_tvalid;
assign ptr_m_axis_read_tready = ptr_rd_ready;

assign ptr_s_axis_write_cmd_tvalid = ptr_wrcmd_valid;
assign ptr_wrcmd_ready = ptr_s_axis_write_cmd_tready;
assign ptr_s_axis_write_cmd_tdata = {10'b0000000000,ptr_wrcmd_data[23:0],6'b000000,2'b00,7'b0000001,9'b000000000,8'h01,6'b000000};

assign ptr_s_axis_write_tdata = ptr_wr_data;
assign ptr_s_axis_write_tkeep = 64'hFFFFFFFFFFFFFFFF;
assign ptr_s_axis_write_tvalid = ptr_wr_valid;
assign ptr_s_axis_write_tlast = 0;
assign ptr_wr_ready = ptr_s_axis_write_tready;



 // user interface signals
wire                                       c0_ui_clk_sync_rst;
wire                                       c0_mmcm_locked;
      
reg                                        c0_aresetn_r;
   
// Slave Interface Write Address Ports
wire  [3:0]                                      c0_s_axi_awid;
wire  [31:0]                                c0_s_axi_awaddr;
wire  [7:0]                                 c0_s_axi_awlen;
wire  [2:0]                                 c0_s_axi_awsize;
wire  [1:0]                                 c0_s_axi_awburst;

wire                                        c0_s_axi_awvalid;
wire                                        c0_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]              c0_s_axi_wdata;
wire  [63:0]               c0_s_axi_wstrb;
wire                       c0_s_axi_wlast;
wire                       c0_s_axi_wvalid;
wire                       c0_s_axi_wready;
// Slave Interface Write Response Ports
wire                       c0_s_axi_bready;
wire [3:0]                      c0_s_axi_bid;
wire [1:0]                 c0_s_axi_bresp;
wire                       c0_s_axi_bvalid;
// Slave Interface Read Address Ports
wire  [3:0]                c0_s_axi_arid;
wire  [31:0]          c0_s_axi_araddr;
wire  [7:0]                                 c0_s_axi_arlen;
wire  [2:0]                                 c0_s_axi_arsize;
wire  [1:0]                                 c0_s_axi_arburst;
wire                                        c0_s_axi_arvalid;
wire                                       c0_s_axi_arready;
// Slave Interface Read Data Ports
wire                                        c0_s_axi_rready;
wire [3:0]                c0_s_axi_rid;
wire [511:0]              c0_s_axi_rdata;
wire [1:0]                                 c0_s_axi_rresp;
wire                                       c0_s_axi_rlast;
wire                                       c0_s_axi_rvalid;





 // Slave Interface Write Address Ports
wire                                       c0_s3_s_axi_awid;
wire  [31:0]                               c0_s3_s_axi_awaddr;
wire  [7:0]                                c0_s3_s_axi_awlen;
wire  [2:0]                                c0_s3_s_axi_awsize;
wire  [1:0]                                c0_s3_s_axi_awburst;

wire                                       c0_s3_s_axi_awvalid;
wire                                       c0_s3_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]                              c0_s3_s_axi_wdata;
wire  [63:0]                               c0_s3_s_axi_wstrb;
wire                                       c0_s3_s_axi_wlast;
wire                                       c0_s3_s_axi_wvalid;
wire                                       c0_s3_s_axi_wready;
// Slave Interface Write Response Ports
wire                                       c0_s3_s_axi_bready;
wire                                       c0_s3_s_axi_bid;
wire [1:0]                                 c0_s3_s_axi_bresp;
wire                                       c0_s3_s_axi_bvalid;
// Slave Interface Read Address Ports
wire                                      c0_s3_s_axi_arid;
wire  [31:0]                               c0_s3_s_axi_araddr;
wire  [7:0]                                c0_s3_s_axi_arlen;
wire  [2:0]                                c0_s3_s_axi_arsize;
wire  [1:0]                                c0_s3_s_axi_arburst;
wire                                       c0_s3_s_axi_arvalid;
wire                                       c0_s3_s_axi_arready;
// Slave Interface Read Data Ports
wire                                       c0_s3_s_axi_rready;
wire                                       c0_s3_s_axi_rid;
wire [511:0]                               c0_s3_s_axi_rdata;
wire [1:0]                                 c0_s3_s_axi_rresp;
wire                                       c0_s3_s_axi_rlast;
wire                                       c0_s3_s_axi_rvalid;



 // Slave Interface Write Address Ports
wire                                       c0_s4_s_axi_awid;
wire  [31:0]                               c0_s4_s_axi_awaddr;
wire  [7:0]                                c0_s4_s_axi_awlen;
wire  [2:0]                                c0_s4_s_axi_awsize;
wire  [1:0]                                c0_s4_s_axi_awburst;

wire                                       c0_s4_s_axi_awvalid;
wire                                       c0_s4_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]                              c0_s4_s_axi_wdata;
wire  [63:0]                               c0_s4_s_axi_wstrb;
wire                                       c0_s4_s_axi_wlast;
wire                                       c0_s4_s_axi_wvalid;
wire                                       c0_s4_s_axi_wready;
// Slave Interface Write Response Ports
wire                                       c0_s4_s_axi_bready;
wire                                       c0_s4_s_axi_bid;
wire [1:0]                                 c0_s4_s_axi_bresp;
wire                                       c0_s4_s_axi_bvalid;
// Slave Interface Read Address Ports
wire                                       c0_s4_s_axi_arid;
wire  [31:0]                               c0_s4_s_axi_araddr;
wire  [7:0]                                c0_s4_s_axi_arlen;
wire  [2:0]                                c0_s4_s_axi_arsize;
wire  [1:0]                                c0_s4_s_axi_arburst;
wire                                       c0_s4_s_axi_arvalid;
wire                                       c0_s4_s_axi_arready;
// Slave Interface Read Data Ports
wire                                       c0_s4_s_axi_rready;
wire                                       c0_s4_s_axi_rid;
wire [511:0]                               c0_s4_s_axi_rdata;
wire [1:0]                                 c0_s4_s_axi_rresp;
wire                                       c0_s4_s_axi_rlast;
wire                                       c0_s4_s_axi_rvalid;




 // Slave Interface Write Address Ports
wire  [3:0]                                c0_s5_s_axi_awid;
wire  [31:0]                               c0_s5_s_axi_awaddr;
wire  [7:0]                                c0_s5_s_axi_awlen;
wire  [2:0]                                c0_s5_s_axi_awsize;
wire  [1:0]                                c0_s5_s_axi_awburst;

wire                                       c0_s5_s_axi_awvalid;
wire                                       c0_s5_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]                              c0_s5_s_axi_wdata;
wire  [63:0]                               c0_s5_s_axi_wstrb;
wire                                       c0_s5_s_axi_wlast;
wire                                       c0_s5_s_axi_wvalid;
wire                                       c0_s5_s_axi_wready;
// Slave Interface Write Response Ports
wire                                       c0_s5_s_axi_bready;
wire                                       c0_s5_s_axi_bid;
wire [1:0]                                 c0_s5_s_axi_bresp;
wire                                       c0_s5_s_axi_bvalid;
// Slave Interface Read Address Ports
wire  [3:0]                                c0_s5_s_axi_arid;
wire  [31:0]                               c0_s5_s_axi_araddr;
wire  [7:0]                                c0_s5_s_axi_arlen;
wire  [2:0]                                c0_s5_s_axi_arsize;
wire  [1:0]                                c0_s5_s_axi_arburst;
wire                                       c0_s5_s_axi_arvalid;
wire                                       c0_s5_s_axi_arready;
// Slave Interface Read Data Ports
wire                                       c0_s5_s_axi_rready;
wire                                       c0_s5_s_axi_rid;
wire [511:0]                               c0_s5_s_axi_rdata;
wire [1:0]                                 c0_s5_s_axi_rresp;
wire                                       c0_s5_s_axi_rlast;
wire                                       c0_s5_s_axi_rvalid;




// user interface signals
wire                                       c1_ui_clk_sync_rst;
wire                                       c1_mmcm_locked;
      
reg                                        c1_aresetn_r;
   
// Slave Interface Write Address Ports
wire   [3:0]                                     c1_s_axi_awid;
wire  [31:0]                                c1_s_axi_awaddr;
wire  [7:0]                                 c1_s_axi_awlen;
wire  [2:0]                                 c1_s_axi_awsize;
wire  [1:0]                                 c1_s_axi_awburst;

wire                                        c1_s_axi_awvalid;
wire                                        c1_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]              c1_s_axi_wdata;
wire  [63:0]               c1_s_axi_wstrb;
wire                       c1_s_axi_wlast;
wire                       c1_s_axi_wvalid;
wire                       c1_s_axi_wready;
// Slave Interface Write Response Ports
wire                       c1_s_axi_bready;
wire                       c1_s_axi_bid;
wire [1:0]                 c1_s_axi_bresp;
wire                       c1_s_axi_bvalid;
// Slave Interface Read Address Ports
wire                  c1_s_axi_arid;
wire  [31:0]          c1_s_axi_araddr;
wire  [7:0]                                 c1_s_axi_arlen;
wire  [2:0]                                 c1_s_axi_arsize;
wire  [1:0]                                 c1_s_axi_arburst;
wire                                        c1_s_axi_arvalid;
wire                                       c1_s_axi_arready;
// Slave Interface Read Data Ports
wire                                        c1_s_axi_rready;
wire                 c1_s_axi_rid;
wire [511:0]              c1_s_axi_rdata;
wire [1:0]                                 c1_s_axi_rresp;
wire                                       c1_s_axi_rlast;
wire                                       c1_s_axi_rvalid;



// replica1
 // Slave Interface Write Address Ports
wire   [3:0]                                     c1_s1_s_axi_awid;
wire  [31:0]                                c1_s1_s_axi_awaddr;
wire  [7:0]                                 c1_s1_s_axi_awlen;
wire  [2:0]                                 c1_s1_s_axi_awsize;
wire  [1:0]                                 c1_s1_s_axi_awburst;

wire                                        c1_s1_s_axi_awvalid;
wire                                        c1_s1_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]              c1_s1_s_axi_wdata;
wire  [63:0]               c1_s1_s_axi_wstrb;
wire                       c1_s1_s_axi_wlast;
wire                       c1_s1_s_axi_wvalid;
wire                       c1_s1_s_axi_wready;
// Slave Interface Write Response Ports
wire                       c1_s1_s_axi_bready;
wire                       c1_s1_s_axi_bid;
wire [1:0]                 c1_s1_s_axi_bresp;
wire                       c1_s1_s_axi_bvalid;
// Slave Interface Read Address Ports
wire                  c1_s1_s_axi_arid;
wire  [31:0]          c1_s1_s_axi_araddr;
wire  [7:0]                                 c1_s1_s_axi_arlen;
wire  [2:0]                                 c1_s1_s_axi_arsize;
wire  [1:0]                                 c1_s1_s_axi_arburst;
wire                                        c1_s1_s_axi_arvalid;
wire                                       c1_s1_s_axi_arready;
// Slave Interface Read Data Ports
wire                                        c1_s1_s_axi_rready;
wire                 c1_s1_s_axi_rid;
wire [511:0]              c1_s1_s_axi_rdata;
wire [1:0]                                 c1_s1_s_axi_rresp;
wire                                       c1_s1_s_axi_rlast;
wire                                       c1_s1_s_axi_rvalid;

//replica2
 // Slave Interface Write Address Ports
wire  [3:0]                                      c1_s2_s_axi_awid;
wire  [31:0]                                c1_s2_s_axi_awaddr;
wire  [7:0]                                 c1_s2_s_axi_awlen;
wire  [2:0]                                 c1_s2_s_axi_awsize;
wire  [1:0]                                 c1_s2_s_axi_awburst;

wire                                        c1_s2_s_axi_awvalid;
wire                                        c1_s2_s_axi_awready;
// Slave Interface Write Data Ports
wire  [511:0]              c1_s2_s_axi_wdata;
wire  [63:0]               c1_s2_s_axi_wstrb;
wire                       c1_s2_s_axi_wlast;
wire                       c1_s2_s_axi_wvalid;
wire                       c1_s2_s_axi_wready;
// Slave Interface Write Response Ports
wire                       c1_s2_s_axi_bready;
wire                       c1_s2_s_axi_bid;
wire [1:0]                 c1_s2_s_axi_bresp;
wire                       c1_s2_s_axi_bvalid;
// Slave Interface Read Address Ports
wire                  c1_s2_s_axi_arid;
wire  [31:0]          c1_s2_s_axi_araddr;
wire  [7:0]                                 c1_s2_s_axi_arlen;
wire  [2:0]                                 c1_s2_s_axi_arsize;
wire  [1:0]                                 c1_s2_s_axi_arburst;
wire                                        c1_s2_s_axi_arvalid;
wire                                       c1_s2_s_axi_arready;
// Slave Interface Read Data Ports
wire                                        c1_s2_s_axi_rready;
wire                 c1_s2_s_axi_rid;
wire [511:0]              c1_s2_s_axi_rdata;
wire [1:0]                                 c1_s2_s_axi_rresp;
wire                                       c1_s2_s_axi_rlast;
wire                                       c1_s2_s_axi_rvalid;


   

   
// master Interface Write Address Ports
wire  [3:0]                                      c1_m_axi_awid;
wire  [31:0]                                c1_m_axi_awaddr;
wire  [7:0]                                 c1_m_axi_awlen;
wire  [2:0]                                 c1_m_axi_awsize;
wire  [1:0]                                 c1_m_axi_awburst;

wire                                        c1_m_axi_awvalid;
wire                                        c1_m_axi_awready;
// master Interface Write Data Ports
wire  [511:0]              c1_m_axi_wdata;
wire  [63:0]               c1_m_axi_wstrb;
wire                       c1_m_axi_wlast;
wire                       c1_m_axi_wvalid;
wire                       c1_m_axi_wready;
//master Interface Write Response Ports
wire                       c1_m_axi_bready;
wire                       c1_m_axi_bid;
wire [1:0]                 c1_m_axi_bresp;
wire                       c1_m_axi_bvalid;
//master Interface Read Address Ports
wire                  c1_m_axi_arid;
wire  [31:0]          c1_m_axi_araddr;
wire  [7:0]                                 c1_m_axi_arlen;
wire  [2:0]                                 c1_m_axi_arsize;
wire  [1:0]                                 c1_m_axi_arburst;
wire                                        c1_m_axi_arvalid;
wire                                       c1_m_axi_arready;
// master Interface Read Data Ports
wire                                        c1_m_axi_rready;
wire                 c1_m_axi_rid;
wire [511:0]              c1_m_axi_rdata;
wire [1:0]                                 c1_m_axi_rresp;
wire                                       c1_m_axi_rlast;
wire                                       c1_m_axi_rvalid;


wire        axis_s3_rxwrite_cc2dm_tvalid;
wire        axis_s3_rxwrite_cc2dm_tready;
wire[511:0]  axis_s3_rxwrite_cc2dm_tdata;
wire[63:0]   axis_s3_rxwrite_cc2dm_tkeep;
wire        axis_s3_rxwrite_cc2dm_tlast;

wire        axis_s3_rxread_cc2dm_tvalid;
wire        axis_s3_rxread_cc2dm_tready;
wire[511:0]  axis_s3_rxread_cc2dm_tdata;
wire[63:0]   axis_s3_rxread_cc2dm_tkeep;
wire        axis_s3_rxread_cc2dm_tlast;

wire        axis_s4_rxwrite_cc2dm_tvalid;
wire        axis_s4_rxwrite_cc2dm_tready;
wire[511:0]  axis_s4_rxwrite_cc2dm_tdata;
wire[63:0]   axis_s4_rxwrite_cc2dm_tkeep;
wire        axis_s4_rxwrite_cc2dm_tlast;

wire        axis_s4_rxread_cc2dm_tvalid;
wire        axis_s4_rxread_cc2dm_tready;
wire[511:0]  axis_s4_rxread_cc2dm_tdata;
wire[63:0]   axis_s4_rxread_cc2dm_tkeep;
wire        axis_s4_rxread_cc2dm_tlast;


wire        axis_s2_rxwrite_cc2dm_tvalid;
wire        axis_s2_rxwrite_cc2dm_tready;
wire[63:0]  axis_s2_rxwrite_cc2dm_tdata;
wire[7:0]   axis_s2_rxwrite_cc2dm_tkeep;
wire        axis_s2_rxwrite_cc2dm_tlast;

wire        axis_s2_rxread_cc2dm_tvalid;
wire        axis_s2_rxread_cc2dm_tready;
wire[63:0]  axis_s2_rxread_cc2dm_tdata;
wire[7:0]   axis_s2_rxread_cc2dm_tkeep;
wire        axis_s2_rxread_cc2dm_tlast;


wire        axis_s1_rxwrite_cc2dm_tvalid;
wire        axis_s1_rxwrite_cc2dm_tready;
wire[511:0]  axis_s1_rxwrite_cc2dm_tdata;
wire[63:0]   axis_s1_rxwrite_cc2dm_tkeep;
wire        axis_s1_rxwrite_cc2dm_tlast;

wire        axis_s1_rxread_cc2dm_tvalid;
wire        axis_s1_rxread_cc2dm_tready;
wire[511:0]  axis_s1_rxread_cc2dm_tdata;
wire[63:0]   axis_s1_rxread_cc2dm_tkeep;
wire        axis_s1_rxread_cc2dm_tlast;

wire        axis_s5_rxwrite_cc2dm_tvalid;
wire        axis_s5_rxwrite_cc2dm_tready;
wire[511:0]  axis_s5_rxwrite_cc2dm_tdata;
wire[63:0]   axis_s5_rxwrite_cc2dm_tkeep;
wire        axis_s5_rxwrite_cc2dm_tlast;

wire        axis_s5_rxread_cc2dm_tvalid;
wire        axis_s5_rxread_cc2dm_tready;
wire[511:0]  axis_s5_rxread_cc2dm_tdata;
wire[63:0]   axis_s5_rxread_cc2dm_tkeep;
wire        axis_s5_rxread_cc2dm_tlast;

/*
wire c0_ui_clk_i, c1_ui_clk_i;

BUFG c0_ui_clk_buf 
  (
      .I                              (c0_ui_clk_i),
      .O                              (c0_ui_clk) 
  );
  
BUFG c1_ui_clk_buf 
    (
        .I                              (c1_ui_clk_i),
        .O                              (c1_ui_clk) 
    );*/

ddr3_dual_inf ddr3_dual_inst
(
    .c0_ddr3_dq(c0_ddr3_dq),
    .c0_ddr3_dqs_n(c0_ddr3_dqs_n),
    .c0_ddr3_dqs_p(c0_ddr3_dqs_p),

    // Outputs
    .c0_ddr3_addr(c0_ddr3_addr),
    .c0_ddr3_ba(c0_ddr3_ba),
    .c0_ddr3_ras_n(c0_ddr3_ras_n),
    .c0_ddr3_cas_n(c0_ddr3_cas_n),
    .c0_ddr3_we_n(c0_ddr3_we_n),
    .c0_ddr3_reset_n(c0_ddr3_reset_n),
    .c0_ddr3_ck_p(c0_ddr3_ck_p),
    .c0_ddr3_ck_n(c0_ddr3_ck_n),
    .c0_ddr3_cke(c0_ddr3_cke),
    .c0_ddr3_cs_n(c0_ddr3_cs_n),
    .c0_ddr3_dm(c0_ddr3_dm),
    .c0_ddr3_odt(c0_ddr3_odt),

 // Inputs
  // Single-ended system clock
    .c0_sys_clk_i(clk212),
  // Single-ended iodelayctrl clk (reference clock)
    .clk_ref_i(clk200),
    .device_temp_i(12'd0),
     
  // Inouts
    .c1_ddr3_dq(c1_ddr3_dq),
    .c1_ddr3_dqs_n(c1_ddr3_dqs_n),
    .c1_ddr3_dqs_p(c1_ddr3_dqs_p),

  // Outputs
    .c1_ddr3_addr(c1_ddr3_addr),
    .c1_ddr3_ba(c1_ddr3_ba),
    .c1_ddr3_ras_n(c1_ddr3_ras_n),
    .c1_ddr3_cas_n(c1_ddr3_cas_n),
    .c1_ddr3_we_n(c1_ddr3_we_n),
    .c1_ddr3_reset_n(c1_ddr3_reset_n),
    .c1_ddr3_ck_p(c1_ddr3_ck_p),
    .c1_ddr3_ck_n(c1_ddr3_ck_n),
    .c1_ddr3_cke(c1_ddr3_cke),
    .c1_ddr3_cs_n(c1_ddr3_cs_n),
    .c1_ddr3_dm(c1_ddr3_dm),
    .c1_ddr3_odt(c1_ddr3_odt),

  // Inputs
  // Single-ended system clock
    .c1_sys_clk_i(clk212),
  // System reset - Default polarity of sys_rst pin is Active Low.
  // System reset polarity will change based on the option 
  // selected in GUI.
    .sys_rst(sys_rst),
  
  // user interface signals
    .c0_ui_clk(c0_ui_clk),
    .c0_ui_clk_sync_rst(c0_ui_clk_sync_rst),
     
    .c0_mmcm_locked(c0_mmcm_locked),
     
    .c0_aresetn(c0_aresetn_r),
  
  // Slave Interface Write Address Ports
    .c0_s_axi_awid(c0_s_axi_awid),
    .c0_s_axi_awaddr(c0_s_axi_awaddr),
    .c0_s_axi_awlen(c0_s_axi_awlen),
    .c0_s_axi_awsize(c0_s_axi_awsize),
    .c0_s_axi_awburst(c0_s_axi_awburst),
    .c0_s_axi_awlock(2'b0),//(c0_s_axi_awlock),
    .c0_s_axi_awcache(4'b0),//(c0_s_axi_awcache),
    .c0_s_axi_awprot(3'b0),//(c0_s_axi_awprot),
  //input  [3:0]                                 c0_s_axi_awqos,
    .c0_s_axi_awvalid(c0_s_axi_awvalid),
    .c0_s_axi_awready(c0_s_axi_awready),
  // Slave Interface Write Data Ports
    .c0_s_axi_wdata(c0_s_axi_wdata),
    .c0_s_axi_wstrb(c0_s_axi_wstrb),
    .c0_s_axi_wlast(c0_s_axi_wlast),
    .c0_s_axi_wvalid(c0_s_axi_wvalid),
    .c0_s_axi_wready(c0_s_axi_wready),
  // Slave Interface Write Response Ports
    .c0_s_axi_bready(c0_s_axi_bready),
    .c0_s_axi_bid(c0_s_axi_bid),
    .c0_s_axi_bresp(c0_s_axi_bresp),
    .c0_s_axi_bvalid(c0_s_axi_bvalid),
  // Slave Interface Read Address Ports
    .c0_s_axi_arid(c0_s_axi_arid),
    .c0_s_axi_araddr(c0_s_axi_araddr),
    .c0_s_axi_arlen(c0_s_axi_arlen),
    .c0_s_axi_arsize(c0_s_axi_arsize),
    .c0_s_axi_arburst(c0_s_axi_arburst),
    .c0_s_axi_arlock(2'b0),//(c0_s_axi_arlock),
    .c0_s_axi_arcache(4'b0),//(c0_s_axi_arcache),
    .c0_s_axi_arprot(3'b0),//(c0_s_axi_arprot),
    .c0_s_axi_arvalid(c0_s_axi_arvalid),
    .c0_s_axi_arready(c0_s_axi_arready),
  // Slave Interface Read Data Ports
    .c0_s_axi_rready(c0_s_axi_rready),
    .c0_s_axi_rid(c0_s_axi_rid),
    .c0_s_axi_rdata(c0_s_axi_rdata),
    .c0_s_axi_rresp(c0_s_axi_rresp),
    .c0_s_axi_rlast(c0_s_axi_rlast),
    .c0_s_axi_rvalid(c0_s_axi_rvalid),
    .c0_init_calib_complete(c0_init_calib_complete),
     
  // user interface signals
    .c1_ui_clk(c1_ui_clk),
    .c1_ui_clk_sync_rst(c1_ui_clk_sync_rst),
    .c1_mmcm_locked(c1_mmcm_locked),
    .c1_aresetn(c1_aresetn_r),
          
  // Slave Interface Write Address Ports
    .c1_s_axi_awid(c1_s_axi_awid),
    .c1_s_axi_awaddr(c1_s_axi_awaddr),
    .c1_s_axi_awlen(c1_s_axi_awlen),
    .c1_s_axi_awsize(c1_s_axi_awsize),
    .c1_s_axi_awburst(c1_s_axi_awburst),
    .c1_s_axi_awlock(2'b0),//(c1_s_axi_awlock),
    .c1_s_axi_awcache(4'b0), //(c1_s_axi_awcache),
    .c1_s_axi_awprot(3'b0), //(c1_s_axi_awprot),
    .c1_s_axi_awvalid(c1_s_axi_awvalid),
    .c1_s_axi_awready(c1_s_axi_awready),
  // Slave Interface Write Data Ports
    .c1_s_axi_wdata(c1_s_axi_wdata),
    .c1_s_axi_wstrb(c1_s_axi_wstrb),
    .c1_s_axi_wlast(c1_s_axi_wlast),
    .c1_s_axi_wvalid(c1_s_axi_wvalid),
    .c1_s_axi_wready(c1_s_axi_wready),
  // Slave Interface Write Response Ports
    .c1_s_axi_bready(c1_s_axi_bready),
    .c1_s_axi_bid(c1_s_axi_bid),
    .c1_s_axi_bresp(c1_s_axi_bresp),
    .c1_s_axi_bvalid(c1_s_axi_bvalid),
  // Slave Interface Read Address Ports
    .c1_s_axi_arid(c1_s_axi_arid),
    .c1_s_axi_araddr(c1_s_axi_araddr),
    .c1_s_axi_arlen(c1_s_axi_arlen),
    .c1_s_axi_arsize(c1_s_axi_arsize),
    .c1_s_axi_arburst(c1_s_axi_arburst),
    .c1_s_axi_arlock(2'b0), //(c1_s_axi_arlock),
    .c1_s_axi_arcache(4'b0), //(c1_s_axi_arcache),
    .c1_s_axi_arprot(3'b0), //(c1_s_axi_arprot),
    .c1_s_axi_arvalid(c1_s_axi_arvalid),
    .c1_s_axi_arready(c1_s_axi_arready),
  // Slave Interface Read Data Ports
    .c1_s_axi_rready(c1_s_axi_rready),
    .c1_s_axi_rid(c1_s_axi_rid),
    .c1_s_axi_rdata(c1_s_axi_rdata),
    .c1_s_axi_rresp(c1_s_axi_rresp),
    .c1_s_axi_rlast(c1_s_axi_rlast),
    .c1_s_axi_rvalid(c1_s_axi_rvalid),
    .c1_init_calib_complete(c1_init_calib_complete)
);

always @(posedge c0_ui_clk)
    c0_aresetn_r <= ~c0_ui_clk_sync_rst & c0_mmcm_locked;
    
always @(posedge c1_ui_clk)
    c1_aresetn_r <= ~c1_ui_clk_sync_rst & c1_mmcm_locked;
    
   





axis_data_fifo_kvs_to_dm_512 cc_rxwrite_1 (
  .s_axis_aresetn(reset156_25_n),  // input wire s_axis_aresetn
  .m_axis_aresetn(c1_aresetn_r),  // input wire m_axis_aresetn
  .s_axis_aclk(clk156_25),        // input wire s_axis_aclk
/*  
  .s_axis_tvalid(toeRX_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(toeRX_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(toeRX_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(toeRX_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(toeRX_s_axis_write_tlast),      // input wire s_axis_tlast
  */
  
  .s_axis_tvalid(ht_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(ht_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(ht_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(ht_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(ht_s_axis_write_tlast),      // input wire s_axis_tlast
  
  .m_axis_aclk(c1_ui_clk),        // input wire m_axis_aclk
  .m_axis_tvalid(axis_s1_rxwrite_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_s1_rxwrite_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_s1_rxwrite_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_s1_rxwrite_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_s1_rxwrite_cc2dm_tlast),      // output wire m_axis_tlast
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);

axis_data_fifo_kvs_to_dm_512 cc_rxwrite_2 (
  .s_axis_aresetn(reset156_25_n),  // input wire s_axis_aresetn
  .m_axis_aresetn(c1_aresetn_r),  // input wire m_axis_aresetn
  .s_axis_aclk(clk156_25),        // input wire s_axis_aclk
/*  
  .s_axis_tvalid(toeRX_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(toeRX_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(toeRX_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(toeRX_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(toeRX_s_axis_write_tlast),      // input wire s_axis_tlast
  */
  
  .s_axis_tvalid(upd_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(upd_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(upd_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(upd_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(upd_s_axis_write_tlast),      // input wire s_axis_tlast
  
  .m_axis_aclk(c0_ui_clk),        // input wire m_axis_aclk
  .m_axis_tvalid(axis_s5_rxwrite_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_s5_rxwrite_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_s5_rxwrite_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_s5_rxwrite_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_s5_rxwrite_cc2dm_tlast),      // output wire m_axis_tlast
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);


assign axis_toe_aux1_cc2dm_tready = ~axis_toe_aux1_cc2dm_tfull;


assign axis_toe_aux2_cc2dm_tready = ~axis_toe_aux2_cc2dm_tfull;

fifo_dm_to_kvs_s ht_read_fifo (
  .rst(~reset156_25_n),        // input wire rst
  .clk(clk156_25),  // input wire wr_clk
  .din(axis_toe_aux1_cc2dm_tdata),        // input wire [511 : 0] din
  .wr_en(axis_toe_aux1_cc2dm_tvalid),    // input wire wr_en
  .rd_en(ht_m_axis_read_tready),    // input wire rd_en
  .dout(ht_m_axis_read_tdata),      // output wire [511 : 0] dout
  .full(axis_toe_aux1_cc2dm_tfull),      // output wire full
  .empty(ht_m_axis_read_tempty)    // output wire empty
);

fifo_dm_to_kvs_s upd_read_fifo (
  .rst(~reset156_25_n),        // input wire rst
  .clk(clk156_25),  // input wire wr_clk  
  .din(axis_toe_aux2_cc2dm_tdata),        // input wire [511 : 0] din
  .wr_en(axis_toe_aux2_cc2dm_tvalid),    // input wire wr_en
  .rd_en(upd_m_axis_read_tready),    // input wire rd_en
  .dout(upd_m_axis_read_tdata),      // output wire [511 : 0] dout
  .full(axis_toe_aux2_cc2dm_tfull),      // output wire full
  .empty(upd_m_axis_read_tempty)    // output wire empty
);

axis_data_fifo_kvs_to_dm_512 cc_rxread_1 (
  .s_axis_aresetn(c1_aresetn_r),  // input wire s_axis_aresetn
  .m_axis_aresetn(reset156_25_n),  // input wire m_axis_aresetn
  .s_axis_aclk(c1_ui_clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_s1_rxread_cc2dm_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(axis_s1_rxread_cc2dm_tready),    // output wire s_axis_tready
  .s_axis_tdata(axis_s1_rxread_cc2dm_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_s1_rxread_cc2dm_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_s1_rxread_cc2dm_tlast),      // input wire s_axis_tlast
  .m_axis_aclk(clk156_25),        // input wire m_axis_aclk
  /*.m_axis_tvalid(toeRX_m_axis_read_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(toeRX_m_axis_read_tready),    // input wire m_axis_tready
  .m_axis_tdata(toeRX_m_axis_read_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(toeRX_m_axis_read_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(toeRX_m_axis_read_tlast),      // output wire m_axis_tlast
  */
  
  .m_axis_tvalid(axis_toe_aux1_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_toe_aux1_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_toe_aux1_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_toe_aux1_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_toe_aux1_cc2dm_tlast),      // output wire m_axis_tlast
  
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);


axis_data_fifo_kvs_to_dm_512 cc_rxread_2 (
  .s_axis_aresetn(c0_aresetn_r),  // input wire s_axis_aresetn
  .m_axis_aresetn(reset156_25_n),  // input wire m_axis_aresetn
  .s_axis_aclk(c0_ui_clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_s5_rxread_cc2dm_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(axis_s5_rxread_cc2dm_tready),    // output wire s_axis_tready
  .s_axis_tdata(axis_s5_rxread_cc2dm_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_s5_rxread_cc2dm_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_s5_rxread_cc2dm_tlast),      // input wire s_axis_tlast
  .m_axis_aclk(clk156_25),        // input wire m_axis_aclk
  /*.m_axis_tvalid(toeRX_m_axis_read_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(toeRX_m_axis_read_tready),    // input wire m_axis_tready
  .m_axis_tdata(toeRX_m_axis_read_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(toeRX_m_axis_read_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(toeRX_m_axis_read_tlast),      // output wire m_axis_tlast
  */
  
  .m_axis_tvalid(axis_toe_aux2_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_toe_aux2_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_toe_aux2_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_toe_aux2_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_toe_aux2_cc2dm_tlast),      // output wire m_axis_tlast
  
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);



nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	)
   rxread_1_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(ht_s_axis_read_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(ht_s_axis_read_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(ht_s_axis_read_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(ht_s_buf_read_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(ht_s_buf_read_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(ht_s_buf_read_cmd_tdata)
  );

axi_read_kvs_datamover rxread_1_datamover (
  .m_axi_mm2s_aclk(c1_ui_clk),                        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(c1_aresetn_r),                  // input wire m_axi_mm2s_aresetn
  .mm2s_err(),                                      // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk(clk156_25),        // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_mm2s_cmdsts_aresetn
/*  .s_axis_mm2s_cmd_tvalid(toeRX_s_axis_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
  .s_axis_mm2s_cmd_tready(toeRX_s_axis_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
  .s_axis_mm2s_cmd_tdata(toeRX_s_axis_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
  .m_axis_mm2s_sts_tvalid(toeRX_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready(toeRX_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata(toeRX_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata
*/

.s_axis_mm2s_cmd_tvalid(ht_s_buf_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
.s_axis_mm2s_cmd_tready(ht_s_buf_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
.s_axis_mm2s_cmd_tdata(ht_s_buf_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
.m_axis_mm2s_sts_tvalid(ht_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
.m_axis_mm2s_sts_tready(ht_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
.m_axis_mm2s_sts_tdata(ht_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata

   
  .m_axis_mm2s_sts_tkeep(),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(),            // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid(c1_s1_s_axi_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(c1_s1_s_axi_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(c1_s1_s_axi_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(c1_s1_s_axi_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(c1_s1_s_axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(),                    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(c1_s1_s_axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(c1_s1_s_axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(c1_s1_s_axi_rdata),                      // input wire [511 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(c1_s1_s_axi_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(c1_s1_s_axi_rlast),                      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(c1_s1_s_axi_rvalid),                    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(c1_s1_s_axi_rready),                    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(axis_s1_rxread_cc2dm_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(axis_s1_rxread_cc2dm_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(axis_s1_rxread_cc2dm_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(axis_s1_rxread_cc2dm_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(axis_s1_rxread_cc2dm_tready)                  // input wire m_axis_mm2s_tready
);



nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxread_2_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(upd_s_axis_read_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(upd_s_axis_read_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(upd_s_axis_read_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(upd_s_buf_read_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(upd_s_buf_read_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(upd_s_buf_read_cmd_tdata)
  );

axi_read_kvs_datamover rxread_2_datamover (
  .m_axi_mm2s_aclk(c0_ui_clk),                        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(c0_aresetn_r),                  // input wire m_axi_mm2s_aresetn
  .mm2s_err(),                                      // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk(clk156_25),        // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_mm2s_cmdsts_aresetn
/*  .s_axis_mm2s_cmd_tvalid(toeRX_s_axis_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
  .s_axis_mm2s_cmd_tready(toeRX_s_axis_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
  .s_axis_mm2s_cmd_tdata(toeRX_s_axis_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
  .m_axis_mm2s_sts_tvalid(toeRX_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
  .m_axis_mm2s_sts_tready(toeRX_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
  .m_axis_mm2s_sts_tdata(toeRX_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata
*/

.s_axis_mm2s_cmd_tvalid(upd_s_buf_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
.s_axis_mm2s_cmd_tready(upd_s_buf_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
.s_axis_mm2s_cmd_tdata(upd_s_buf_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
.m_axis_mm2s_sts_tvalid(upd_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
.m_axis_mm2s_sts_tready(upd_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
.m_axis_mm2s_sts_tdata(upd_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata

   
  .m_axis_mm2s_sts_tkeep(),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(),            // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid(c0_s5_s_axi_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(c0_s5_s_axi_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(c0_s5_s_axi_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(c0_s5_s_axi_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(c0_s5_s_axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(),                    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(c0_s5_s_axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(c0_s5_s_axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(c0_s5_s_axi_rdata),                      // input wire [511 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(c0_s5_s_axi_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(c0_s5_s_axi_rlast),                      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(c0_s5_s_axi_rvalid),                    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(c0_s5_s_axi_rready),                    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(axis_s5_rxread_cc2dm_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(axis_s5_rxread_cc2dm_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(axis_s5_rxread_cc2dm_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(axis_s5_rxread_cc2dm_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(axis_s5_rxread_cc2dm_tready)                  // input wire m_axis_mm2s_tready
);


nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxwrite_1_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(ht_s_axis_write_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(ht_s_axis_write_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(ht_s_axis_write_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(ht_s_buf_write_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(ht_s_buf_write_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(ht_s_buf_write_cmd_tdata)
  );

axi_write_kvs_datamover rxwrite_1_datamover (
  .m_axi_s2mm_aclk(c1_ui_clk),                        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(c1_aresetn_r),                  // input wire m_axi_s2mm_aresetn
  .s2mm_err(),                                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk(clk156_25),      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_s2mm_cmdsts_aresetn
/*  .s_axis_s2mm_cmd_tvalid(toeRX_s_axis_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
  .s_axis_s2mm_cmd_tready(toeRX_s_axis_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
  .s_axis_s2mm_cmd_tdata(toeRX_s_axis_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
  .m_axis_s2mm_sts_tvalid(toeRX_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready(toeRX_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata(toeRX_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
*/

 
 .s_axis_s2mm_cmd_tvalid(ht_s_buf_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
 .s_axis_s2mm_cmd_tready(ht_s_buf_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
 .s_axis_s2mm_cmd_tdata(ht_s_buf_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
 .m_axis_s2mm_sts_tvalid(ht_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
 .m_axis_s2mm_sts_tready(ht_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
 .m_axis_s2mm_sts_tdata(ht_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
   
  .m_axis_s2mm_sts_tkeep(),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(),            // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid(c1_s1_s_axi_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(c1_s1_s_axi_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(c1_s1_s_axi_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(c1_s1_s_axi_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(c1_s1_s_axi_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(),                    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(),                  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(),                    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(c1_s1_s_axi_awvalid),                  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(c1_s1_s_axi_awready),                  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(c1_s1_s_axi_wdata),                      // output wire [511 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(c1_s1_s_axi_wstrb),                      // output wire [63 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(c1_s1_s_axi_wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(c1_s1_s_axi_wvalid),                    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(c1_s1_s_axi_wready),                    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(c1_s1_s_axi_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(c1_s1_s_axi_bvalid),                    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(c1_s1_s_axi_bready),                    // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata(axis_s1_rxwrite_cc2dm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(axis_s1_rxwrite_cc2dm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(axis_s1_rxwrite_cc2dm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(axis_s1_rxwrite_cc2dm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(axis_s1_rxwrite_cc2dm_tready)                  // output wire s_axis_s2mm_tready
);




nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxwrite_2_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(upd_s_axis_write_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(upd_s_axis_write_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(upd_s_axis_write_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(upd_s_buf_write_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(upd_s_buf_write_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(upd_s_buf_write_cmd_tdata)
  );


axi_write_kvs_datamover rxwrite_2_datamover (
  .m_axi_s2mm_aclk(c0_ui_clk),                        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(c0_aresetn_r),                  // input wire m_axi_s2mm_aresetn
  .s2mm_err(),                                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk(clk156_25),      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_s2mm_cmdsts_aresetn
/*  .s_axis_s2mm_cmd_tvalid(toeRX_s_axis_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
  .s_axis_s2mm_cmd_tready(toeRX_s_axis_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
  .s_axis_s2mm_cmd_tdata(toeRX_s_axis_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
  .m_axis_s2mm_sts_tvalid(toeRX_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
  .m_axis_s2mm_sts_tready(toeRX_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
  .m_axis_s2mm_sts_tdata(toeRX_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
*/

 
 .s_axis_s2mm_cmd_tvalid(upd_s_buf_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
 .s_axis_s2mm_cmd_tready(upd_s_buf_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
 .s_axis_s2mm_cmd_tdata(upd_s_buf_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
 .m_axis_s2mm_sts_tvalid(upd_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
 .m_axis_s2mm_sts_tready(upd_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
 .m_axis_s2mm_sts_tdata(upd_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
   
  .m_axis_s2mm_sts_tkeep(),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(),            // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid(c0_s5_s_axi_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(c0_s5_s_axi_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(c0_s5_s_axi_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(c0_s5_s_axi_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(c0_s5_s_axi_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(),                    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(),                  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(),                    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(c0_s5_s_axi_awvalid),                  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(c0_s5_s_axi_awready),                  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(c0_s5_s_axi_wdata),                      // output wire [511 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(c0_s5_s_axi_wstrb),                      // output wire [63 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(c0_s5_s_axi_wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(c0_s5_s_axi_wvalid),                    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(c0_s5_s_axi_wready),                    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(c0_s5_s_axi_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(c0_s5_s_axi_bvalid),                    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(c0_s5_s_axi_bready),                    // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata(axis_s5_rxwrite_cc2dm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(axis_s5_rxwrite_cc2dm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(axis_s5_rxwrite_cc2dm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(axis_s5_rxwrite_cc2dm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(axis_s5_rxwrite_cc2dm_tready)                  // output wire s_axis_s2mm_tready
);


axi_kvs_mem_interconnect rx_multiplexer_12 (
  .INTERCONNECT_ACLK(c1_ui_clk),        // input wire INTERCONNECT_ACLK
  .INTERCONNECT_ARESETN(c1_aresetn_r),  // input wire INTERCONNECT_ARESETN
  .S00_AXI_ARESET_OUT_N(),  // output wire S00_AXI_ARESET_OUT_N
  .S00_AXI_ACLK(c1_ui_clk),                  // input wire S00_AXI_ACLK
  .S00_AXI_AWID(c1_s1_s_axi_awid),                  // input wire [0 : 0] S00_AXI_AWID
  .S00_AXI_AWADDR(c1_s1_s_axi_awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
  .S00_AXI_AWLEN(c1_s1_s_axi_awlen),                // input wire [7 : 0] S00_AXI_AWLEN
  .S00_AXI_AWSIZE(c1_s1_s_axi_awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
  .S00_AXI_AWBURST(c1_s1_s_axi_awburst),            // input wire [1 : 0] S00_AXI_AWBURST
  .S00_AXI_AWLOCK(0),              // input wire S00_AXI_AWLOCK
  .S00_AXI_AWCACHE(0),            // input wire [3 : 0] S00_AXI_AWCACHE
  .S00_AXI_AWPROT(0),              // input wire [2 : 0] S00_AXI_AWPROT
  .S00_AXI_AWQOS(0),                // input wire [3 : 0] S00_AXI_AWQOS
  .S00_AXI_AWVALID(c1_s1_s_axi_awvalid),            // input wire S00_AXI_AWVALID
  .S00_AXI_AWREADY(c1_s1_s_axi_awready),            // output wire S00_AXI_AWREADY
  .S00_AXI_WDATA(c1_s1_s_axi_wdata),                // input wire [511 : 0] S00_AXI_WDATA
  .S00_AXI_WSTRB(c1_s1_s_axi_wstrb),                // input wire [63 : 0] S00_AXI_WSTRB
  .S00_AXI_WLAST(c1_s1_s_axi_wlast),                // input wire S00_AXI_WLAST
  .S00_AXI_WVALID(c1_s1_s_axi_wvalid),              // input wire S00_AXI_WVALID
  .S00_AXI_WREADY(c1_s1_s_axi_wready),              // output wire S00_AXI_WREADY
  .S00_AXI_BID(),                    // output wire [0 : 0] S00_AXI_BID
  .S00_AXI_BRESP(c1_s1_s_axi_bresp),                // output wire [1 : 0] S00_AXI_BRESP
  .S00_AXI_BVALID(c1_s1_s_axi_bvalid),              // output wire S00_AXI_BVALID
  .S00_AXI_BREADY(c1_s1_s_axi_bready),              // input wire S00_AXI_BREADY
  .S00_AXI_ARID(c1_s1_s_axi_arid),                  // input wire [0 : 0] S00_AXI_ARID
  .S00_AXI_ARADDR(c1_s1_s_axi_araddr),              // input wire [31 : 0] S00_AXI_ARADDR
  .S00_AXI_ARLEN(c1_s1_s_axi_arlen),                // input wire [7 : 0] S00_AXI_ARLEN
  .S00_AXI_ARSIZE(c1_s1_s_axi_arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
  .S00_AXI_ARBURST(c1_s1_s_axi_arburst),            // input wire [1 : 0] S00_AXI_ARBURST
  .S00_AXI_ARLOCK(0),              // input wire S00_AXI_ARLOCK
  .S00_AXI_ARCACHE(0),            // input wire [3 : 0] S00_AXI_ARCACHE
  .S00_AXI_ARPROT(0),              // input wire [2 : 0] S00_AXI_ARPROT
  .S00_AXI_ARQOS(0),                // input wire [3 : 0] S00_AXI_ARQOS
  .S00_AXI_ARVALID(c1_s1_s_axi_arvalid),            // input wire S00_AXI_ARVALID
  .S00_AXI_ARREADY(c1_s1_s_axi_arready),            // output wire S00_AXI_ARREADY
  .S00_AXI_RID(c1_s1_s_axi_rid),                    // output wire [0 : 0] S00_AXI_RID
  .S00_AXI_RDATA(c1_s1_s_axi_rdata),                // output wire [511 : 0] S00_AXI_RDATA
  .S00_AXI_RRESP(c1_s1_s_axi_rresp),                // output wire [1 : 0] S00_AXI_RRESP
  .S00_AXI_RLAST(c1_s1_s_axi_rlast),                // output wire S00_AXI_RLAST
  .S00_AXI_RVALID(c1_s1_s_axi_rvalid),              // output wire S00_AXI_RVALID
  .S00_AXI_RREADY(c1_s1_s_axi_rready),              // input wire S00_AXI_RREADY
    .S01_AXI_ARESET_OUT_N(),  // output wire S00_AXI_ARESET_OUT_N
    .S01_AXI_ACLK(c1_ui_clk),                  // input wire S00_AXI_ACLK
    .S01_AXI_AWID(c1_s2_s_axi_awid),                  // input wire [0 : 0] S00_AXI_AWID
    .S01_AXI_AWADDR(c1_s2_s_axi_awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
    .S01_AXI_AWLEN(c1_s2_s_axi_awlen),                // input wire [7 : 0] S00_AXI_AWLEN
    .S01_AXI_AWSIZE(c1_s2_s_axi_awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
    .S01_AXI_AWBURST(c1_s2_s_axi_awburst),            // input wire [1 : 0] S00_AXI_AWBURST
    .S01_AXI_AWLOCK(0),              // input wire S00_AXI_AWLOCK
    .S01_AXI_AWCACHE(0),            // input wire [3 : 0] S00_AXI_AWCACHE
    .S01_AXI_AWPROT(0),              // input wire [2 : 0] S00_AXI_AWPROT
    .S01_AXI_AWQOS(0),                // input wire [3 : 0] S00_AXI_AWQOS
    .S01_AXI_AWVALID(c1_s2_s_axi_awvalid),            // input wire S00_AXI_AWVALID
    .S01_AXI_AWREADY(c1_s2_s_axi_awready),            // output wire S00_AXI_AWREADY
    .S01_AXI_WDATA(c1_s2_s_axi_wdata),                // input wire [511 : 0] S00_AXI_WDATA
    .S01_AXI_WSTRB(c1_s2_s_axi_wstrb),                // input wire [63 : 0] S00_AXI_WSTRB
    .S01_AXI_WLAST(c1_s2_s_axi_wlast),                // input wire S00_AXI_WLAST
    .S01_AXI_WVALID(c1_s2_s_axi_wvalid),              // input wire S00_AXI_WVALID
    .S01_AXI_WREADY(c1_s2_s_axi_wready),              // output wire S00_AXI_WREADY
    .S01_AXI_BID(),                    // output wire [0 : 0] S00_AXI_BID
    .S01_AXI_BRESP(c1_s2_s_axi_bresp),                // output wire [1 : 0] S00_AXI_BRESP
    .S01_AXI_BVALID(c1_s2_s_axi_bvalid),              // output wire S00_AXI_BVALID
    .S01_AXI_BREADY(c1_s2_s_axi_bready),              // input wire S00_AXI_BREADY
    .S01_AXI_ARID(c1_s2_s_axi_arid),                  // input wire [0 : 0] S00_AXI_ARID
    .S01_AXI_ARADDR(c1_s2_s_axi_araddr),              // input wire [31 : 0] S00_AXI_ARADDR
    .S01_AXI_ARLEN(c1_s2_s_axi_arlen),                // input wire [7 : 0] S00_AXI_ARLEN
    .S01_AXI_ARSIZE(c1_s2_s_axi_arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
    .S01_AXI_ARBURST(c1_s2_s_axi_arburst),            // input wire [1 : 0] S00_AXI_ARBURST
    .S01_AXI_ARLOCK(0),              // input wire S00_AXI_ARLOCK
    .S01_AXI_ARCACHE(0),            // input wire [3 : 0] S00_AXI_ARCACHE
    .S01_AXI_ARPROT(0),              // input wire [2 : 0] S00_AXI_ARPROT
    .S01_AXI_ARQOS(0),                // input wire [3 : 0] S00_AXI_ARQOS
    .S01_AXI_ARVALID(c1_s2_s_axi_arvalid),            // input wire S00_AXI_ARVALID
    .S01_AXI_ARREADY(c1_s2_s_axi_arready),            // output wire S00_AXI_ARREADY
    .S01_AXI_RID(c1_s2_s_axi_rid),                    // output wire [0 : 0] S00_AXI_RID
    .S01_AXI_RDATA(c1_s2_s_axi_rdata),                // output wire [511 : 0] S00_AXI_RDATA
    .S01_AXI_RRESP(c1_s2_s_axi_rresp),                // output wire [1 : 0] S00_AXI_RRESP
    .S01_AXI_RLAST(c1_s2_s_axi_rlast),                // output wire S00_AXI_RLAST
    .S01_AXI_RVALID(c1_s2_s_axi_rvalid),              // output wire S00_AXI_RVALID
    .S01_AXI_RREADY(c1_s2_s_axi_rready),              // input wire S00_AXI_RREADY
  .M00_AXI_ARESET_OUT_N(),  // output wire M00_AXI_ARESET_OUT_N
  .M00_AXI_ACLK(c1_ui_clk),                  // input wire M00_AXI_ACLK
  .M00_AXI_AWID(c1_s_axi_awid),                  // output wire [3 : 0] M00_AXI_AWID
  .M00_AXI_AWADDR(c1_s_axi_awaddr),              // output wire [31 : 0] M00_AXI_AWADDR
  .M00_AXI_AWLEN(c1_s_axi_awlen),                // output wire [7 : 0] M00_AXI_AWLEN
  .M00_AXI_AWSIZE(c1_s_axi_awsize),              // output wire [2 : 0] M00_AXI_AWSIZE
  .M00_AXI_AWBURST(c1_s_axi_awburst),            // output wire [1 : 0] M00_AXI_AWBURST
  .M00_AXI_AWLOCK(),              // output wire M00_AXI_AWLOCK
  .M00_AXI_AWCACHE(),            // output wire [3 : 0] M00_AXI_AWCACHE
  .M00_AXI_AWPROT(),              // output wire [2 : 0] M00_AXI_AWPROT
  .M00_AXI_AWQOS(),                // output wire [3 : 0] M00_AXI_AWQOS
  .M00_AXI_AWVALID(c1_s_axi_awvalid),            // output wire M00_AXI_AWVALID
  .M00_AXI_AWREADY(c1_s_axi_awready),            // input wire M00_AXI_AWREADY
  .M00_AXI_WDATA(c1_s_axi_wdata),                // output wire [511 : 0] M00_AXI_WDATA
  .M00_AXI_WSTRB(c1_s_axi_wstrb),                // output wire [63 : 0] M00_AXI_WSTRB
  .M00_AXI_WLAST(c1_s_axi_wlast),                // output wire M00_AXI_WLAST
  .M00_AXI_WVALID(c1_s_axi_wvalid),              // output wire M00_AXI_WVALID
  .M00_AXI_WREADY(c1_s_axi_wready),              // input wire M00_AXI_WREADY
  .M00_AXI_BID(c1_s_axi_bid),                    // input wire [3 : 0] M00_AXI_BID
  .M00_AXI_BRESP(c1_s_axi_bresp),                // input wire [1 : 0] M00_AXI_BRESP
  .M00_AXI_BVALID(c1_s_axi_bvalid),              // input wire M00_AXI_BVALID
  .M00_AXI_BREADY(c1_s_axi_bready),              // output wire M00_AXI_BREADY
  .M00_AXI_ARID(c1_s_axi_arid),                  // output wire [3 : 0] M00_AXI_ARID
  .M00_AXI_ARADDR(c1_s_axi_araddr),              // output wire [31 : 0] M00_AXI_ARADDR
  .M00_AXI_ARLEN(c1_s_axi_arlen),                // output wire [7 : 0] M00_AXI_ARLEN
  .M00_AXI_ARSIZE(c1_s_axi_arsize),              // output wire [2 : 0] M00_AXI_ARSIZE
  .M00_AXI_ARBURST(c1_s_axi_arburst),            // output wire [1 : 0] M00_AXI_ARBURST
  .M00_AXI_ARLOCK(),              // output wire M00_AXI_ARLOCK
  .M00_AXI_ARCACHE(),            // output wire [3 : 0] M00_AXI_ARCACHE
  .M00_AXI_ARPROT(),              // output wire [2 : 0] M00_AXI_ARPROT
  .M00_AXI_ARQOS(),                // output wire [3 : 0] M00_AXI_ARQOS
  .M00_AXI_ARVALID(c1_s_axi_arvalid),            // output wire M00_AXI_ARVALID
  .M00_AXI_ARREADY(c1_s_axi_arready),            // input wire M00_AXI_ARREADY
  .M00_AXI_RID(c1_s_axi_rid),                    // input wire [3 : 0] M00_AXI_RID
  .M00_AXI_RDATA(c1_s_axi_rdata),                // input wire [511 : 0] M00_AXI_RDATA
  .M00_AXI_RRESP(c1_s_axi_rresp),                // input wire [1 : 0] M00_AXI_RRESP
  .M00_AXI_RLAST(c1_s_axi_rlast),                // input wire M00_AXI_RLAST
  .M00_AXI_RVALID(c1_s_axi_rvalid),              // input wire M00_AXI_RVALID
  .M00_AXI_RREADY(c1_s_axi_rready)              // output wire M00_AXI_RREADY
);

//wire [3:0] c1_m_axi_arid_x;
//assign c1_m_axi_arid = c1_m_axi_arid_x[0];

//wire [3:0] c1_s_axi_arid_x;
//assign c1_s_axi_arid = c1_s_axi_arid_x[0];



axis_data_fifo_kvs_to_dm_512 bmap_rxwrite (
  .s_axis_aresetn(reset156_25_n),  // input wire s_axis_aresetn
  .m_axis_aresetn(c0_aresetn_r),  // input wire m_axis_aresetn
  .s_axis_aclk(clk156_25),        // input wire s_axis_aclk

  .s_axis_tvalid(bmap_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(bmap_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(bmap_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(bmap_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(bmap_s_axis_write_tlast),      // input wire s_axis_tlast
  
  .m_axis_aclk(c0_ui_clk),        // input wire m_axis_aclk
  .m_axis_tvalid(axis_s3_rxwrite_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_s3_rxwrite_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_s3_rxwrite_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_s3_rxwrite_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_s3_rxwrite_cc2dm_tlast),      // output wire m_axis_tlast
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);

axis_data_fifo_tcp_to_dm_64 toeTX_rxwrite (
  .s_axis_aresetn(reset156_25_n),  // input wire s_axis_aresetn
  .m_axis_aresetn(c1_aresetn_r),  // input wire m_axis_aresetn
  .s_axis_aclk(clk156_25),        // input wire s_axis_aclk

  .s_axis_tvalid(toeTX_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(toeTX_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(toeTX_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(toeTX_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(toeTX_s_axis_write_tlast),      // input wire s_axis_tlast
  
  .m_axis_aclk(c1_ui_clk),        // input wire m_axis_aclk
  .m_axis_tvalid(axis_s2_rxwrite_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_s2_rxwrite_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_s2_rxwrite_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_s2_rxwrite_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_s2_rxwrite_cc2dm_tlast),      // output wire m_axis_tlast
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);

axis_data_fifo_kvs_to_dm_512 ptr_rxwrite (
  .s_axis_aresetn(reset156_25_n),  // input wire s_axis_aresetn
  .m_axis_aresetn(c0_aresetn_r),  // input wire m_axis_aresetn
  .s_axis_aclk(clk156_25),        // input wire s_axis_aclk

  
  .s_axis_tvalid(ptr_s_axis_write_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(ptr_s_axis_write_tready),    // output wire s_axis_tready
  .s_axis_tdata(ptr_s_axis_write_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(ptr_s_axis_write_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(ptr_s_axis_write_tlast),      // input wire s_axis_tlast
  
  .m_axis_aclk(c0_ui_clk),        // input wire m_axis_aclk
  .m_axis_tvalid(axis_s4_rxwrite_cc2dm_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(axis_s4_rxwrite_cc2dm_tready),    // input wire m_axis_tready
  .m_axis_tdata(axis_s4_rxwrite_cc2dm_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(axis_s4_rxwrite_cc2dm_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(axis_s4_rxwrite_cc2dm_tlast),      // output wire m_axis_tlast
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);





axis_data_fifo_kvs_to_dm_512 bmap_rxread (
  .s_axis_aresetn(c0_aresetn_r),  // input wire s_axis_aresetn
  .m_axis_aresetn(reset156_25_n),  // input wire m_axis_aresetn
  .s_axis_aclk(c0_ui_clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_s3_rxread_cc2dm_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(axis_s3_rxread_cc2dm_tready),    // output wire s_axis_tready
  .s_axis_tdata(axis_s3_rxread_cc2dm_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_s3_rxread_cc2dm_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_s3_rxread_cc2dm_tlast),      // input wire s_axis_tlast
  .m_axis_aclk(clk156_25),        // input wire m_axis_aclk

  
  .m_axis_tvalid(bmap_m_axis_read_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(bmap_m_axis_read_tready),    // input wire m_axis_tready
  .m_axis_tdata(bmap_m_axis_read_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(bmap_m_axis_read_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(bmap_m_axis_read_tlast),      // output wire m_axis_tlast
  
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);


axis_data_fifo_tcp_to_dm_64 toeTX_rxread (
  .s_axis_aresetn(c1_aresetn_r),  // input wire s_axis_aresetn
  .m_axis_aresetn(reset156_25_n),  // input wire m_axis_aresetn
  .s_axis_aclk(c1_ui_clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_s2_rxread_cc2dm_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(axis_s2_rxread_cc2dm_tready),    // output wire s_axis_tready
  .s_axis_tdata(axis_s2_rxread_cc2dm_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_s2_rxread_cc2dm_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_s2_rxread_cc2dm_tlast),      // input wire s_axis_tlast
  .m_axis_aclk(clk156_25),        // input wire m_axis_aclk

  
  .m_axis_tvalid(toeTX_m_axis_read_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(toeTX_m_axis_read_tready),    // input wire m_axis_tready
  .m_axis_tdata(toeTX_m_axis_read_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(toeTX_m_axis_read_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(toeTX_m_axis_read_tlast),      // output wire m_axis_tlast
  
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);



axis_data_fifo_kvs_to_dm_512 ptr_rxread (
  .s_axis_aresetn(c0_aresetn_r),  // input wire s_axis_aresetn
  .m_axis_aresetn(reset156_25_n),  // input wire m_axis_aresetn
  .s_axis_aclk(c0_ui_clk),        // input wire s_axis_aclk
  .s_axis_tvalid(axis_s4_rxread_cc2dm_tvalid),    // input wire s_axis_tvalid
  .s_axis_tready(axis_s4_rxread_cc2dm_tready),    // output wire s_axis_tready
  .s_axis_tdata(axis_s4_rxread_cc2dm_tdata),      // input wire [63 : 0] s_axis_tdata
  .s_axis_tkeep(axis_s4_rxread_cc2dm_tkeep),      // input wire [7 : 0] s_axis_tkeep
  .s_axis_tlast(axis_s4_rxread_cc2dm_tlast),      // input wire s_axis_tlast
  .m_axis_aclk(clk156_25),        // input wire m_axis_aclk  
  
  .m_axis_tvalid(ptr_m_axis_read_tvalid),    // output wire m_axis_tvalid
  .m_axis_tready(ptr_m_axis_read_tready),    // input wire m_axis_tready
  .m_axis_tdata(ptr_m_axis_read_tdata),      // output wire [63 : 0] m_axis_tdata
  .m_axis_tkeep(ptr_m_axis_read_tkeep),      // output wire [7 : 0] m_axis_tkeep
  .m_axis_tlast(ptr_m_axis_read_tlast),      // output wire m_axis_tlast
  
  .axis_data_count(),        // output wire [31 : 0] axis_data_count
  .axis_wr_data_count(),  // output wire [31 : 0] axis_wr_data_count
  .axis_rd_data_count()  // output wire [31 : 0] axis_rd_data_count
);



nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxread_bmap_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(bmap_s_axis_read_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(bmap_s_axis_read_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(bmap_s_axis_read_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(bmap_s_buf_read_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(bmap_s_buf_read_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(bmap_s_buf_read_cmd_tdata)
  );

axi_read_kvs_datamover rxread_bmap_datamover (
  .m_axi_mm2s_aclk(c0_ui_clk),                        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(c0_aresetn_r),                  // input wire m_axi_mm2s_aresetn
  .mm2s_err(),                                      // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk(clk156_25),        // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_mm2s_cmdsts_aresetn

.s_axis_mm2s_cmd_tvalid(bmap_s_buf_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
.s_axis_mm2s_cmd_tready(bmap_s_buf_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
.s_axis_mm2s_cmd_tdata(bmap_s_buf_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
.m_axis_mm2s_sts_tvalid(bmap_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
.m_axis_mm2s_sts_tready(bmap_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
.m_axis_mm2s_sts_tdata(bmap_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata

   
  .m_axis_mm2s_sts_tkeep(),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(),            // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid(c0_s3_s_axi_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(c0_s3_s_axi_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(c0_s3_s_axi_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(c0_s3_s_axi_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(c0_s3_s_axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(),                    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(c0_s3_s_axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(c0_s3_s_axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(c0_s3_s_axi_rdata),                      // input wire [511 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(c0_s3_s_axi_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(c0_s3_s_axi_rlast),                      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(c0_s3_s_axi_rvalid),                    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(c0_s3_s_axi_rready),                    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(axis_s3_rxread_cc2dm_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(axis_s3_rxread_cc2dm_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(axis_s3_rxread_cc2dm_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(axis_s3_rxread_cc2dm_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(axis_s3_rxread_cc2dm_tready)                  // input wire m_axis_mm2s_tready
);

nukv_fifogen #(
.DATA_SIZE(72),
.ADDR_BITS(6)
) toe_readcmd_buf (
    .rst(~reset156_25_n),          // input wire s_axis_aresetn
  	.clk(clk156_25),                // input wire s_axis_aclk
	.s_axis_tvalid(toeTX_s_axis_read_cmd_tvalid),           
  	.s_axis_tready(toeTX_s_axis_read_cmd_tready),         
  	.s_axis_tdata(toeTX_s_axis_read_cmd_tdata),           
  	.m_axis_tvalid(toeTX_s_buf_read_cmd_tvalid),          
  	.m_axis_tready(toeTX_s_buf_read_cmd_tready),          
  	.m_axis_tdata(toeTX_s_buf_read_cmd_tdata)
    ); 

axi_read_tcp_datamover rxread_toeTX_datamover (
  .m_axi_mm2s_aclk(c1_ui_clk),                        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(c1_aresetn_r),                  // input wire m_axi_mm2s_aresetn
  .mm2s_err(),                                      // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk(clk156_25),        // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_mm2s_cmdsts_aresetn

.s_axis_mm2s_cmd_tvalid(toeTX_s_buf_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
.s_axis_mm2s_cmd_tready(toeTX_s_buf_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
.s_axis_mm2s_cmd_tdata(toeTX_s_buf_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
.m_axis_mm2s_sts_tvalid(toeTX_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
.m_axis_mm2s_sts_tready(toeTX_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
.m_axis_mm2s_sts_tdata(toeTX_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata

   
  .m_axis_mm2s_sts_tkeep(),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(),            // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid(c1_s2_s_axi_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(c1_s2_s_axi_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(c1_s2_s_axi_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(c1_s2_s_axi_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(c1_s2_s_axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(),                    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(c1_s2_s_axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(c1_s2_s_axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(c1_s2_s_axi_rdata),                      // input wire [511 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(c1_s2_s_axi_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(c1_s2_s_axi_rlast),                      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(c1_s2_s_axi_rvalid),                    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(c1_s2_s_axi_rready),                    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(axis_s2_rxread_cc2dm_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(axis_s2_rxread_cc2dm_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(axis_s2_rxread_cc2dm_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(axis_s2_rxread_cc2dm_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(axis_s2_rxread_cc2dm_tready)                  // input wire m_axis_mm2s_tready
);





nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxread_ptr_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(ptr_s_axis_read_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(ptr_s_axis_read_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(ptr_s_axis_read_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(ptr_s_buf_read_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(ptr_s_buf_read_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(ptr_s_buf_read_cmd_tdata)
  );

axi_read_kvs_datamover rxread_ptr_datamover (
  .m_axi_mm2s_aclk(c0_ui_clk),                        // input wire m_axi_mm2s_aclk
  .m_axi_mm2s_aresetn(c0_aresetn_r),                  // input wire m_axi_mm2s_aresetn
  .mm2s_err(),                                      // output wire mm2s_err
  .m_axis_mm2s_cmdsts_aclk(clk156_25),        // input wire m_axis_mm2s_cmdsts_aclk
  .m_axis_mm2s_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_mm2s_cmdsts_aresetn

.s_axis_mm2s_cmd_tvalid(ptr_s_buf_read_cmd_tvalid),          // input wire s_axis_mm2s_cmd_tvalid
.s_axis_mm2s_cmd_tready(ptr_s_buf_read_cmd_tready),          // output wire s_axis_mm2s_cmd_tready
.s_axis_mm2s_cmd_tdata(ptr_s_buf_read_cmd_tdata),            // input wire [71 : 0] s_axis_mm2s_cmd_tdata
.m_axis_mm2s_sts_tvalid(ptr_m_axis_read_sts_tvalid),          // output wire m_axis_mm2s_sts_tvalid
.m_axis_mm2s_sts_tready(ptr_m_axis_read_sts_tready),          // input wire m_axis_mm2s_sts_tready
.m_axis_mm2s_sts_tdata(ptr_m_axis_read_sts_tdata),            // output wire [7 : 0] m_axis_mm2s_sts_tdata

   
  .m_axis_mm2s_sts_tkeep(),            // output wire [0 : 0] m_axis_mm2s_sts_tkeep
  .m_axis_mm2s_sts_tlast(),            // output wire m_axis_mm2s_sts_tlast
  .m_axi_mm2s_arid(c0_s4_s_axi_arid),                        // output wire [3 : 0] m_axi_mm2s_arid
  .m_axi_mm2s_araddr(c0_s4_s_axi_araddr),                    // output wire [31 : 0] m_axi_mm2s_araddr
  .m_axi_mm2s_arlen(c0_s4_s_axi_arlen),                      // output wire [7 : 0] m_axi_mm2s_arlen
  .m_axi_mm2s_arsize(c0_s4_s_axi_arsize),                    // output wire [2 : 0] m_axi_mm2s_arsize
  .m_axi_mm2s_arburst(c0_s4_s_axi_arburst),                  // output wire [1 : 0] m_axi_mm2s_arburst
  .m_axi_mm2s_arprot(),                    // output wire [2 : 0] m_axi_mm2s_arprot
  .m_axi_mm2s_arcache(),                  // output wire [3 : 0] m_axi_mm2s_arcache
  .m_axi_mm2s_aruser(),                    // output wire [3 : 0] m_axi_mm2s_aruser
  .m_axi_mm2s_arvalid(c0_s4_s_axi_arvalid),                  // output wire m_axi_mm2s_arvalid
  .m_axi_mm2s_arready(c0_s4_s_axi_arready),                  // input wire m_axi_mm2s_arready
  .m_axi_mm2s_rdata(c0_s4_s_axi_rdata),                      // input wire [511 : 0] m_axi_mm2s_rdata
  .m_axi_mm2s_rresp(c0_s4_s_axi_rresp),                      // input wire [1 : 0] m_axi_mm2s_rresp
  .m_axi_mm2s_rlast(c0_s4_s_axi_rlast),                      // input wire m_axi_mm2s_rlast
  .m_axi_mm2s_rvalid(c0_s4_s_axi_rvalid),                    // input wire m_axi_mm2s_rvalid
  .m_axi_mm2s_rready(c0_s4_s_axi_rready),                    // output wire m_axi_mm2s_rready
  .m_axis_mm2s_tdata(axis_s4_rxread_cc2dm_tdata),                    // output wire [63 : 0] m_axis_mm2s_tdata
  .m_axis_mm2s_tkeep(axis_s4_rxread_cc2dm_tkeep),                    // output wire [7 : 0] m_axis_mm2s_tkeep
  .m_axis_mm2s_tlast(axis_s4_rxread_cc2dm_tlast),                    // output wire m_axis_mm2s_tlast
  .m_axis_mm2s_tvalid(axis_s4_rxread_cc2dm_tvalid),                  // output wire m_axis_mm2s_tvalid
  .m_axis_mm2s_tready(axis_s4_rxread_cc2dm_tready)                  // input wire m_axis_mm2s_tready
);



nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxwrite_bmap_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(bmap_s_axis_write_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(bmap_s_axis_write_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(bmap_s_axis_write_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(bmap_s_buf_write_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(bmap_s_buf_write_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(bmap_s_buf_write_cmd_tdata)
  );

axi_write_kvs_datamover rxwrite_bmap_datamover (
  .m_axi_s2mm_aclk(c0_ui_clk),                        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(c0_aresetn_r),                  // input wire m_axi_s2mm_aresetn
  .s2mm_err(),                                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk(clk156_25),      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_s2mm_cmdsts_aresetn
 
 .s_axis_s2mm_cmd_tvalid(bmap_s_buf_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
 .s_axis_s2mm_cmd_tready(bmap_s_buf_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
 .s_axis_s2mm_cmd_tdata(bmap_s_buf_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
 .m_axis_s2mm_sts_tvalid(bmap_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
 .m_axis_s2mm_sts_tready(bmap_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
 .m_axis_s2mm_sts_tdata(bmap_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
   
  .m_axis_s2mm_sts_tkeep(),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(),            // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid(c0_s3_s_axi_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(c0_s3_s_axi_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(c0_s3_s_axi_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(c0_s3_s_axi_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(c0_s3_s_axi_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(),                    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(),                  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(),                    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(c0_s3_s_axi_awvalid),                  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(c0_s3_s_axi_awready),                  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(c0_s3_s_axi_wdata),                      // output wire [511 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(c0_s3_s_axi_wstrb),                      // output wire [63 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(c0_s3_s_axi_wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(c0_s3_s_axi_wvalid),                    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(c0_s3_s_axi_wready),                    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(c0_s3_s_axi_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(c0_s3_s_axi_bvalid),                    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(c0_s3_s_axi_bready),                    // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata(axis_s3_rxwrite_cc2dm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(axis_s3_rxwrite_cc2dm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(axis_s3_rxwrite_cc2dm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(axis_s3_rxwrite_cc2dm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(axis_s3_rxwrite_cc2dm_tready)                  // output wire s_axis_s2mm_tready
);



nukv_fifogen #(
.DATA_SIZE(72),
.ADDR_BITS(6)
) toe_writecmd_buf (
    .rst(~reset156_25_n),          // input wire s_axis_aresetn
  	.clk(clk156_25),                // input wire s_axis_aclk
	.s_axis_tvalid(toeTX_s_axis_write_cmd_tvalid),           
  	.s_axis_tready(toeTX_s_axis_write_cmd_tready),         
  	.s_axis_tdata(toeTX_s_axis_write_cmd_tdata),           
  	.m_axis_tvalid(toeTX_s_buf_write_cmd_tvalid),          
  	.m_axis_tready(toeTX_s_buf_write_cmd_tready),          
  	.m_axis_tdata(toeTX_s_buf_write_cmd_tdata)
    ); 

axi_write_tcp_datamover txwrite_toeTX_datamover (
  .m_axi_s2mm_aclk(c1_ui_clk),                        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(c1_aresetn_r),                  // input wire m_axi_s2mm_aresetn
  .s2mm_err(),                                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk(clk156_25),      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_s2mm_cmdsts_aresetn
 
 .s_axis_s2mm_cmd_tvalid(toeTX_s_buf_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
 .s_axis_s2mm_cmd_tready(toeTX_s_buf_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
 .s_axis_s2mm_cmd_tdata(toeTX_s_buf_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
 .m_axis_s2mm_sts_tvalid(toeTX_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
 .m_axis_s2mm_sts_tready(toeTX_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
 .m_axis_s2mm_sts_tdata(toeTX_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
   
  .m_axis_s2mm_sts_tkeep(),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(),            // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid(c1_s2_s_axi_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(c1_s2_s_axi_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(c1_s2_s_axi_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(c1_s2_s_axi_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(c1_s2_s_axi_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(),                    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(),                  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(),                    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(c1_s2_s_axi_awvalid),                  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(c1_s2_s_axi_awready),                  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(c1_s2_s_axi_wdata),                      // output wire [511 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(c1_s2_s_axi_wstrb),                      // output wire [63 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(c1_s2_s_axi_wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(c1_s2_s_axi_wvalid),                    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(c1_s2_s_axi_wready),                    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(c1_s2_s_axi_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(c1_s2_s_axi_bvalid),                    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(c1_s2_s_axi_bready),                    // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata(axis_s2_rxwrite_cc2dm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(axis_s2_rxwrite_cc2dm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(axis_s2_rxwrite_cc2dm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(axis_s2_rxwrite_cc2dm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(axis_s2_rxwrite_cc2dm_tready)                  // output wire s_axis_s2mm_tready
);




nukv_fifogen #(
	.DATA_SIZE(72),
	.ADDR_BITS(6)
	) rxwrite_ptr_cmdbuf (
  .rst(~reset156_25_n),          // input wire s_axis_aresetn
  .clk(clk156_25),                // input wire s_axis_aclk
  .s_axis_tvalid(ptr_s_axis_write_cmd_tvalid),            // input wire s_axis_tvalid
  .s_axis_tready(ptr_s_axis_write_cmd_tready),            // output wire s_axis_tready
  .s_axis_tdata(ptr_s_axis_write_cmd_tdata),              // input wire [63 : 0] s_axis_tdata
  .m_axis_tvalid(ptr_s_buf_write_cmd_tvalid),            // output wire m_axis_tvalid
  .m_axis_tready(ptr_s_buf_write_cmd_tready),            // input wire m_axis_tready
  .m_axis_tdata(ptr_s_buf_write_cmd_tdata)
  );


axi_write_kvs_datamover rxwrite_ptr_datamover (
  .m_axi_s2mm_aclk(c0_ui_clk),                        // input wire m_axi_s2mm_aclk
  .m_axi_s2mm_aresetn(c0_aresetn_r),                  // input wire m_axi_s2mm_aresetn
  .s2mm_err(),                                      // output wire s2mm_err
  .m_axis_s2mm_cmdsts_awclk(clk156_25),      // input wire m_axis_s2mm_cmdsts_awclk
  .m_axis_s2mm_cmdsts_aresetn(reset156_25_n),  // input wire m_axis_s2mm_cmdsts_aresetn

 
 .s_axis_s2mm_cmd_tvalid(ptr_s_buf_write_cmd_tvalid),          // input wire s_axis_s2mm_cmd_tvalid
 .s_axis_s2mm_cmd_tready(ptr_s_buf_write_cmd_tready),          // output wire s_axis_s2mm_cmd_tready
 .s_axis_s2mm_cmd_tdata(ptr_s_buf_write_cmd_tdata),            // input wire [71 : 0] s_axis_s2mm_cmd_tdata
 .m_axis_s2mm_sts_tvalid(ptr_m_axis_write_sts_tvalid),          // output wire m_axis_s2mm_sts_tvalid
 .m_axis_s2mm_sts_tready(ptr_m_axis_write_sts_tready),          // input wire m_axis_s2mm_sts_tready
 .m_axis_s2mm_sts_tdata(ptr_m_axis_write_sts_tdata),            // output wire [7 : 0] m_axis_s2mm_sts_tdata
   
  .m_axis_s2mm_sts_tkeep(),            // output wire [0 : 0] m_axis_s2mm_sts_tkeep
  .m_axis_s2mm_sts_tlast(),            // output wire m_axis_s2mm_sts_tlast
  .m_axi_s2mm_awid(c0_s4_s_axi_awid),                        // output wire [3 : 0] m_axi_s2mm_awid
  .m_axi_s2mm_awaddr(c0_s4_s_axi_awaddr),                    // output wire [31 : 0] m_axi_s2mm_awaddr
  .m_axi_s2mm_awlen(c0_s4_s_axi_awlen),                      // output wire [7 : 0] m_axi_s2mm_awlen
  .m_axi_s2mm_awsize(c0_s4_s_axi_awsize),                    // output wire [2 : 0] m_axi_s2mm_awsize
  .m_axi_s2mm_awburst(c0_s4_s_axi_awburst),                  // output wire [1 : 0] m_axi_s2mm_awburst
  .m_axi_s2mm_awprot(),                    // output wire [2 : 0] m_axi_s2mm_awprot
  .m_axi_s2mm_awcache(),                  // output wire [3 : 0] m_axi_s2mm_awcache
  .m_axi_s2mm_awuser(),                    // output wire [3 : 0] m_axi_s2mm_awuser
  .m_axi_s2mm_awvalid(c0_s4_s_axi_awvalid),                  // output wire m_axi_s2mm_awvalid
  .m_axi_s2mm_awready(c0_s4_s_axi_awready),                  // input wire m_axi_s2mm_awready
  .m_axi_s2mm_wdata(c0_s4_s_axi_wdata),                      // output wire [511 : 0] m_axi_s2mm_wdata
  .m_axi_s2mm_wstrb(c0_s4_s_axi_wstrb),                      // output wire [63 : 0] m_axi_s2mm_wstrb
  .m_axi_s2mm_wlast(c0_s4_s_axi_wlast),                      // output wire m_axi_s2mm_wlast
  .m_axi_s2mm_wvalid(c0_s4_s_axi_wvalid),                    // output wire m_axi_s2mm_wvalid
  .m_axi_s2mm_wready(c0_s4_s_axi_wready),                    // input wire m_axi_s2mm_wready
  .m_axi_s2mm_bresp(c0_s4_s_axi_bresp),                      // input wire [1 : 0] m_axi_s2mm_bresp
  .m_axi_s2mm_bvalid(c0_s4_s_axi_bvalid),                    // input wire m_axi_s2mm_bvalid
  .m_axi_s2mm_bready(c0_s4_s_axi_bready),                    // output wire m_axi_s2mm_bready
  .s_axis_s2mm_tdata(axis_s4_rxwrite_cc2dm_tdata),                    // input wire [63 : 0] s_axis_s2mm_tdata
  .s_axis_s2mm_tkeep(axis_s4_rxwrite_cc2dm_tkeep),                    // input wire [7 : 0] s_axis_s2mm_tkeep
  .s_axis_s2mm_tlast(axis_s4_rxwrite_cc2dm_tlast),                    // input wire s_axis_s2mm_tlast
  .s_axis_s2mm_tvalid(axis_s4_rxwrite_cc2dm_tvalid),                  // input wire s_axis_s2mm_tvalid
  .s_axis_s2mm_tready(axis_s4_rxwrite_cc2dm_tready)                  // output wire s_axis_s2mm_tready
);


axi_kvs_mem_interconnect_3 rx_multiplexer_345 (
  .INTERCONNECT_ACLK(c0_ui_clk),        // input wire INTERCONNECT_ACLK
  .INTERCONNECT_ARESETN(c0_aresetn_r),  // input wire INTERCONNECT_ARESETN
  .S00_AXI_ARESET_OUT_N(),  // output wire S00_AXI_ARESET_OUT_N
  .S00_AXI_ACLK(c0_ui_clk),                  // input wire S00_AXI_ACLK
  .S00_AXI_AWID(c0_s3_s_axi_awid),                  // input wire [0 : 0] S00_AXI_AWID
  .S00_AXI_AWADDR(c0_s3_s_axi_awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
  .S00_AXI_AWLEN(c0_s3_s_axi_awlen),                // input wire [7 : 0] S00_AXI_AWLEN
  .S00_AXI_AWSIZE(c0_s3_s_axi_awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
  .S00_AXI_AWBURST(c0_s3_s_axi_awburst),            // input wire [1 : 0] S00_AXI_AWBURST
  .S00_AXI_AWLOCK(0),              // input wire S00_AXI_AWLOCK
  .S00_AXI_AWCACHE(0),            // input wire [3 : 0] S00_AXI_AWCACHE
  .S00_AXI_AWPROT(0),              // input wire [2 : 0] S00_AXI_AWPROT
  .S00_AXI_AWQOS(0),                // input wire [3 : 0] S00_AXI_AWQOS
  .S00_AXI_AWVALID(c0_s3_s_axi_awvalid),            // input wire S00_AXI_AWVALID
  .S00_AXI_AWREADY(c0_s3_s_axi_awready),            // output wire S00_AXI_AWREADY
  .S00_AXI_WDATA(c0_s3_s_axi_wdata),                // input wire [511 : 0] S00_AXI_WDATA
  .S00_AXI_WSTRB(c0_s3_s_axi_wstrb),                // input wire [63 : 0] S00_AXI_WSTRB
  .S00_AXI_WLAST(c0_s3_s_axi_wlast),                // input wire S00_AXI_WLAST
  .S00_AXI_WVALID(c0_s3_s_axi_wvalid),              // input wire S00_AXI_WVALID
  .S00_AXI_WREADY(c0_s3_s_axi_wready),              // output wire S00_AXI_WREADY
  .S00_AXI_BID(),                    // output wire [0 : 0] S00_AXI_BID
  .S00_AXI_BRESP(c0_s3_s_axi_bresp),                // output wire [1 : 0] S00_AXI_BRESP
  .S00_AXI_BVALID(c0_s3_s_axi_bvalid),              // output wire S00_AXI_BVALID
  .S00_AXI_BREADY(c0_s3_s_axi_bready),              // input wire S00_AXI_BREADY
  .S00_AXI_ARID(c0_s3_s_axi_arid),                  // input wire [0 : 0] S00_AXI_ARID
  .S00_AXI_ARADDR(c0_s3_s_axi_araddr),              // input wire [31 : 0] S00_AXI_ARADDR
  .S00_AXI_ARLEN(c0_s3_s_axi_arlen),                // input wire [7 : 0] S00_AXI_ARLEN
  .S00_AXI_ARSIZE(c0_s3_s_axi_arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
  .S00_AXI_ARBURST(c0_s3_s_axi_arburst),            // input wire [1 : 0] S00_AXI_ARBURST
  .S00_AXI_ARLOCK(0),              // input wire S00_AXI_ARLOCK
  .S00_AXI_ARCACHE(0),            // input wire [3 : 0] S00_AXI_ARCACHE
  .S00_AXI_ARPROT(0),              // input wire [2 : 0] S00_AXI_ARPROT
  .S00_AXI_ARQOS(0),                // input wire [3 : 0] S00_AXI_ARQOS
  .S00_AXI_ARVALID(c0_s3_s_axi_arvalid),            // input wire S00_AXI_ARVALID
  .S00_AXI_ARREADY(c0_s3_s_axi_arready),            // output wire S00_AXI_ARREADY
  .S00_AXI_RID(c0_s3_s_axi_rid),                    // output wire [0 : 0] S00_AXI_RID
  .S00_AXI_RDATA(c0_s3_s_axi_rdata),                // output wire [511 : 0] S00_AXI_RDATA
  .S00_AXI_RRESP(c0_s3_s_axi_rresp),                // output wire [1 : 0] S00_AXI_RRESP
  .S00_AXI_RLAST(c0_s3_s_axi_rlast),                // output wire S00_AXI_RLAST
  .S00_AXI_RVALID(c0_s3_s_axi_rvalid),              // output wire S00_AXI_RVALID
  .S00_AXI_RREADY(c0_s3_s_axi_rready),              // input wire S00_AXI_RREADY
    .S01_AXI_ARESET_OUT_N(),  // output wire S00_AXI_ARESET_OUT_N
    .S01_AXI_ACLK(c0_ui_clk),                  // input wire S00_AXI_ACLK
    .S01_AXI_AWID(c0_s4_s_axi_awid),                  // input wire [0 : 0] S00_AXI_AWID
    .S01_AXI_AWADDR(c0_s4_s_axi_awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
    .S01_AXI_AWLEN(c0_s4_s_axi_awlen),                // input wire [7 : 0] S00_AXI_AWLEN
    .S01_AXI_AWSIZE(c0_s4_s_axi_awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
    .S01_AXI_AWBURST(c0_s4_s_axi_awburst),            // input wire [1 : 0] S00_AXI_AWBURST
    .S01_AXI_AWLOCK(0),              // input wire S00_AXI_AWLOCK
    .S01_AXI_AWCACHE(0),            // input wire [3 : 0] S00_AXI_AWCACHE
    .S01_AXI_AWPROT(0),              // input wire [2 : 0] S00_AXI_AWPROT
    .S01_AXI_AWQOS(0),                // input wire [3 : 0] S00_AXI_AWQOS
    .S01_AXI_AWVALID(c0_s4_s_axi_awvalid),            // input wire S00_AXI_AWVALID
    .S01_AXI_AWREADY(c0_s4_s_axi_awready),            // output wire S00_AXI_AWREADY
    .S01_AXI_WDATA(c0_s4_s_axi_wdata),                // input wire [511 : 0] S00_AXI_WDATA
    .S01_AXI_WSTRB(c0_s4_s_axi_wstrb),                // input wire [63 : 0] S00_AXI_WSTRB
    .S01_AXI_WLAST(c0_s4_s_axi_wlast),                // input wire S00_AXI_WLAST
    .S01_AXI_WVALID(c0_s4_s_axi_wvalid),              // input wire S00_AXI_WVALID
    .S01_AXI_WREADY(c0_s4_s_axi_wready),              // output wire S00_AXI_WREADY
    .S01_AXI_BID(),                    // output wire [0 : 0] S00_AXI_BID
    .S01_AXI_BRESP(c0_s4_s_axi_bresp),                // output wire [1 : 0] S00_AXI_BRESP
    .S01_AXI_BVALID(c0_s4_s_axi_bvalid),              // output wire S00_AXI_BVALID
    .S01_AXI_BREADY(c0_s4_s_axi_bready),              // input wire S00_AXI_BREADY
    .S01_AXI_ARID(c0_s4_s_axi_arid),                  // input wire [0 : 0] S00_AXI_ARID
    .S01_AXI_ARADDR(c0_s4_s_axi_araddr),              // input wire [31 : 0] S00_AXI_ARADDR
    .S01_AXI_ARLEN(c0_s4_s_axi_arlen),                // input wire [7 : 0] S00_AXI_ARLEN
    .S01_AXI_ARSIZE(c0_s4_s_axi_arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
    .S01_AXI_ARBURST(c0_s4_s_axi_arburst),            // input wire [1 : 0] S00_AXI_ARBURST
    .S01_AXI_ARLOCK(0),              // input wire S00_AXI_ARLOCK
    .S01_AXI_ARCACHE(0),            // input wire [3 : 0] S00_AXI_ARCACHE
    .S01_AXI_ARPROT(0),              // input wire [2 : 0] S00_AXI_ARPROT
    .S01_AXI_ARQOS(0),                // input wire [3 : 0] S00_AXI_ARQOS
    .S01_AXI_ARVALID(c0_s4_s_axi_arvalid),            // input wire S00_AXI_ARVALID
    .S01_AXI_ARREADY(c0_s4_s_axi_arready),            // output wire S00_AXI_ARREADY
    .S01_AXI_RID(c0_s4_s_axi_rid),                    // output wire [0 : 0] S00_AXI_RID
    .S01_AXI_RDATA(c0_s4_s_axi_rdata),                // output wire [511 : 0] S00_AXI_RDATA
    .S01_AXI_RRESP(c0_s4_s_axi_rresp),                // output wire [1 : 0] S00_AXI_RRESP
    .S01_AXI_RLAST(c0_s4_s_axi_rlast),                // output wire S00_AXI_RLAST
    .S01_AXI_RVALID(c0_s4_s_axi_rvalid),              // output wire S00_AXI_RVALID
    .S01_AXI_RREADY(c0_s4_s_axi_rready),              // input wire S00_AXI_RREADY

    .S02_AXI_ARESET_OUT_N(),  // output wire S00_AXI_ARESET_OUT_N
    .S02_AXI_ACLK(c0_ui_clk),                  // input wire S00_AXI_ACLK
    .S02_AXI_AWID(c0_s5_s_axi_awid),                  // input wire [0 : 0] S00_AXI_AWID
    .S02_AXI_AWADDR(c0_s5_s_axi_awaddr),              // input wire [31 : 0] S00_AXI_AWADDR
    .S02_AXI_AWLEN(c0_s5_s_axi_awlen),                // input wire [7 : 0] S00_AXI_AWLEN
    .S02_AXI_AWSIZE(c0_s5_s_axi_awsize),              // input wire [2 : 0] S00_AXI_AWSIZE
    .S02_AXI_AWBURST(c0_s5_s_axi_awburst),            // input wire [1 : 0] S00_AXI_AWBURST
    .S02_AXI_AWLOCK(0),              // input wire S00_AXI_AWLOCK
    .S02_AXI_AWCACHE(0),            // input wire [3 : 0] S00_AXI_AWCACHE
    .S02_AXI_AWPROT(0),              // input wire [2 : 0] S00_AXI_AWPROT
    .S02_AXI_AWQOS(0),                // input wire [3 : 0] S00_AXI_AWQOS
    .S02_AXI_AWVALID(c0_s5_s_axi_awvalid),            // input wire S00_AXI_AWVALID
    .S02_AXI_AWREADY(c0_s5_s_axi_awready),            // output wire S00_AXI_AWREADY
    .S02_AXI_WDATA(c0_s5_s_axi_wdata),                // input wire [511 : 0] S00_AXI_WDATA
    .S02_AXI_WSTRB(c0_s5_s_axi_wstrb),                // input wire [63 : 0] S00_AXI_WSTRB
    .S02_AXI_WLAST(c0_s5_s_axi_wlast),                // input wire S00_AXI_WLAST
    .S02_AXI_WVALID(c0_s5_s_axi_wvalid),              // input wire S00_AXI_WVALID
    .S02_AXI_WREADY(c0_s5_s_axi_wready),              // output wire S00_AXI_WREADY
    .S02_AXI_BID(),                    // output wire [0 : 0] S00_AXI_BID
    .S02_AXI_BRESP(c0_s5_s_axi_bresp),                // output wire [1 : 0] S00_AXI_BRESP
    .S02_AXI_BVALID(c0_s5_s_axi_bvalid),              // output wire S00_AXI_BVALID
    .S02_AXI_BREADY(c0_s5_s_axi_bready),              // input wire S00_AXI_BREADY
    .S02_AXI_ARID(c0_s5_s_axi_arid),                  // input wire [0 : 0] S00_AXI_ARID
    .S02_AXI_ARADDR(c0_s5_s_axi_araddr),              // input wire [31 : 0] S00_AXI_ARADDR
    .S02_AXI_ARLEN(c0_s5_s_axi_arlen),                // input wire [7 : 0] S00_AXI_ARLEN
    .S02_AXI_ARSIZE(c0_s5_s_axi_arsize),              // input wire [2 : 0] S00_AXI_ARSIZE
    .S02_AXI_ARBURST(c0_s5_s_axi_arburst),            // input wire [1 : 0] S00_AXI_ARBURST
    .S02_AXI_ARLOCK(0),              // input wire S00_AXI_ARLOCK
    .S02_AXI_ARCACHE(0),            // input wire [3 : 0] S00_AXI_ARCACHE
    .S02_AXI_ARPROT(0),              // input wire [2 : 0] S00_AXI_ARPROT
    .S02_AXI_ARQOS(0),                // input wire [3 : 0] S00_AXI_ARQOS
    .S02_AXI_ARVALID(c0_s5_s_axi_arvalid),            // input wire S00_AXI_ARVALID
    .S02_AXI_ARREADY(c0_s5_s_axi_arready),            // output wire S00_AXI_ARREADY
    .S02_AXI_RID(c0_s5_s_axi_rid),                    // output wire [0 : 0] S00_AXI_RID
    .S02_AXI_RDATA(c0_s5_s_axi_rdata),                // output wire [511 : 0] S00_AXI_RDATA
    .S02_AXI_RRESP(c0_s5_s_axi_rresp),                // output wire [1 : 0] S00_AXI_RRESP
    .S02_AXI_RLAST(c0_s5_s_axi_rlast),                // output wire S00_AXI_RLAST
    .S02_AXI_RVALID(c0_s5_s_axi_rvalid),              // output wire S00_AXI_RVALID
    .S02_AXI_RREADY(c0_s5_s_axi_rready),              // input wire S00_AXI_RREADY

    
  .M00_AXI_ARESET_OUT_N(),  // output wire M00_AXI_ARESET_OUT_N
  .M00_AXI_ACLK(c0_ui_clk),                  // input wire M00_AXI_ACLK
  .M00_AXI_AWID(c0_s_axi_awid),                  // output wire [3 : 0] M00_AXI_AWID
  .M00_AXI_AWADDR(c0_s_axi_awaddr),              // output wire [31 : 0] M00_AXI_AWADDR
  .M00_AXI_AWLEN(c0_s_axi_awlen),                // output wire [7 : 0] M00_AXI_AWLEN
  .M00_AXI_AWSIZE(c0_s_axi_awsize),              // output wire [2 : 0] M00_AXI_AWSIZE
  .M00_AXI_AWBURST(c0_s_axi_awburst),            // output wire [1 : 0] M00_AXI_AWBURST
  .M00_AXI_AWLOCK(),              // output wire M00_AXI_AWLOCK
  .M00_AXI_AWCACHE(),            // output wire [3 : 0] M00_AXI_AWCACHE
  .M00_AXI_AWPROT(),              // output wire [2 : 0] M00_AXI_AWPROT
  .M00_AXI_AWQOS(),                // output wire [3 : 0] M00_AXI_AWQOS
  .M00_AXI_AWVALID(c0_s_axi_awvalid),            // output wire M00_AXI_AWVALID
  .M00_AXI_AWREADY(c0_s_axi_awready),            // input wire M00_AXI_AWREADY
  .M00_AXI_WDATA(c0_s_axi_wdata),                // output wire [511 : 0] M00_AXI_WDATA
  .M00_AXI_WSTRB(c0_s_axi_wstrb),                // output wire [63 : 0] M00_AXI_WSTRB
  .M00_AXI_WLAST(c0_s_axi_wlast),                // output wire M00_AXI_WLAST
  .M00_AXI_WVALID(c0_s_axi_wvalid),              // output wire M00_AXI_WVALID
  .M00_AXI_WREADY(c0_s_axi_wready),              // input wire M00_AXI_WREADY
  .M00_AXI_BID(c0_s_axi_bid),                    // input wire [3 : 0] M00_AXI_BID
  .M00_AXI_BRESP(c0_s_axi_bresp),                // input wire [1 : 0] M00_AXI_BRESP
  .M00_AXI_BVALID(c0_s_axi_bvalid),              // input wire M00_AXI_BVALID
  .M00_AXI_BREADY(c0_s_axi_bready),              // output wire M00_AXI_BREADY
  .M00_AXI_ARID(c0_s_axi_arid),                  // output wire [3 : 0] M00_AXI_ARID
  .M00_AXI_ARADDR(c0_s_axi_araddr),              // output wire [31 : 0] M00_AXI_ARADDR
  .M00_AXI_ARLEN(c0_s_axi_arlen),                // output wire [7 : 0] M00_AXI_ARLEN
  .M00_AXI_ARSIZE(c0_s_axi_arsize),              // output wire [2 : 0] M00_AXI_ARSIZE
  .M00_AXI_ARBURST(c0_s_axi_arburst),            // output wire [1 : 0] M00_AXI_ARBURST
  .M00_AXI_ARLOCK(),              // output wire M00_AXI_ARLOCK
  .M00_AXI_ARCACHE(),            // output wire [3 : 0] M00_AXI_ARCACHE
  .M00_AXI_ARPROT(),              // output wire [2 : 0] M00_AXI_ARPROT
  .M00_AXI_ARQOS(),                // output wire [3 : 0] M00_AXI_ARQOS
  .M00_AXI_ARVALID(c0_s_axi_arvalid),            // output wire M00_AXI_ARVALID
  .M00_AXI_ARREADY(c0_s_axi_arready),            // input wire M00_AXI_ARREADY
  .M00_AXI_RID(c0_s_axi_rid),                    // input wire [3 : 0] M00_AXI_RID
  .M00_AXI_RDATA(c0_s_axi_rdata),                // input wire [511 : 0] M00_AXI_RDATA
  .M00_AXI_RRESP(c0_s_axi_rresp),                // input wire [1 : 0] M00_AXI_RRESP
  .M00_AXI_RLAST(c0_s_axi_rlast),                // input wire M00_AXI_RLAST
  .M00_AXI_RVALID(c0_s_axi_rvalid),              // input wire M00_AXI_RVALID
  .M00_AXI_RREADY(c0_s_axi_rready)              // output wire M00_AXI_RREADY
);

//wire [3:0] c0_m_axi_arid_x;
//assign c0_m_axi_arid = c0_m_axi_arid_x[0];

//wire [3:0] c0_s_axi_arid_x;
//assign c0_s_axi_arid = c0_s_axi_arid_x[0];




endmodule
`default_nettype wire