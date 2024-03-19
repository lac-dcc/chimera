//-----------------------------------------------------------------
//                         USB2Sniffer
//                            V0.1
//                     Ultra-Embedded.com
//                       Copyright 2020
//
//                 Email: admin@ultra-embedded.com
//
//                         License: LGPL
//-----------------------------------------------------------------
//
// This source file may be used and distributed without
// restriction provided that this copyright statement is not
// removed from the file and that any derivative work contains
// the original copyright notice and the associated disclaimer.
//
// This source file is free software; you can redistribute it
// and/or modify it under the terms of the GNU Lesser General
// Public License as published by the Free Software Foundation;
// either version 2.1 of the License, or (at your option) any
// later version.
//
// This source is distributed in the hope that it will be
// useful, but WITHOUT ANY WARRANTY; without even the implied
// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
// PURPOSE.  See the GNU Lesser General Public License for more
// details.
//
// You should have received a copy of the GNU Lesser General
// Public License along with this source; if not, write to the
// Free Software Foundation, Inc., 59 Temple Place, Suite 330,
// Boston, MA  02111-1307  USA
//-----------------------------------------------------------------
module fpga_soc
//-----------------------------------------------------------------
// Params
//-----------------------------------------------------------------
#(
     parameter CLK_FREQ         = 60000000
)
//-----------------------------------------------------------------
// Ports
//-----------------------------------------------------------------
(
    // Inputs
     input           clk_ftdi_i
    ,input           clk_sys_i
    ,input           clk_usb_i
    ,input           rst_i
    ,input           axi_awready_i
    ,input           axi_wready_i
    ,input           axi_bvalid_i
    ,input  [  1:0]  axi_bresp_i
    ,input  [  3:0]  axi_bid_i
    ,input           axi_arready_i
    ,input           axi_rvalid_i
    ,input  [ 31:0]  axi_rdata_i
    ,input  [  1:0]  axi_rresp_i
    ,input  [  3:0]  axi_rid_i
    ,input           axi_rlast_i
    ,input           ftdi_rxf_i
    ,input           ftdi_txe_i
    ,input  [ 31:0]  ftdi_data_in_i
    ,input  [  3:0]  ftdi_be_in_i
    ,input  [ 31:0]  gpio_inputs_i
    ,input  [  7:0]  utmi_data_out_i
    ,input  [  7:0]  utmi_data_in_i
    ,input           utmi_txvalid_i
    ,input           utmi_txready_i
    ,input           utmi_rxvalid_i
    ,input           utmi_rxactive_i
    ,input           utmi_rxerror_i
    ,input  [  1:0]  utmi_linestate_i

    // Outputs
    ,output          axi_awvalid_o
    ,output [ 31:0]  axi_awaddr_o
    ,output [  3:0]  axi_awid_o
    ,output [  7:0]  axi_awlen_o
    ,output [  1:0]  axi_awburst_o
    ,output          axi_wvalid_o
    ,output [ 31:0]  axi_wdata_o
    ,output [  3:0]  axi_wstrb_o
    ,output          axi_wlast_o
    ,output          axi_bready_o
    ,output          axi_arvalid_o
    ,output [ 31:0]  axi_araddr_o
    ,output [  3:0]  axi_arid_o
    ,output [  7:0]  axi_arlen_o
    ,output [  1:0]  axi_arburst_o
    ,output          axi_rready_o
    ,output          ftdi_wrn_o
    ,output          ftdi_rdn_o
    ,output          ftdi_oen_o
    ,output [ 31:0]  ftdi_data_out_o
    ,output [  3:0]  ftdi_be_out_o
    ,output [ 31:0]  gpio_outputs_o
    ,output [  1:0]  utmi_op_mode_o
    ,output [  1:0]  utmi_xcvrselect_o
    ,output          utmi_termselect_o
    ,output          utmi_dppulldown_o
    ,output          utmi_dmpulldown_o
);

wire           axi_dbg_usb_awvalid_w;
wire           axi_arb_out_arvalid_w;
wire  [ 31:0]  axi_dbg_usb_araddr_w;
wire           axi_usb_rready_w;
wire           axi_cfg_wvalid_w;
wire           axi_dbg_ftdi_awready_w;
wire           axi_arb_out_rready_w;
wire  [  7:0]  axi_arb_out_arlen_w;
wire  [ 31:0]  axi_cfg_wdata_w;
wire  [  3:0]  axi_arb_out_arid_w;
wire           axi_ftdi_rready_w;
wire           axi_ftdi_bvalid_w;
wire  [  3:0]  axi_arb_out_bid_w;
wire  [  1:0]  axi_dbg_usb_awburst_w;
wire           axi_usb_arvalid_w;
wire  [ 31:0]  axi_usb_araddr_w;
wire  [  7:0]  axi_dbg_usb_arlen_w;
wire           axi_ftdi_rlast_w;
wire           axi_usb_awready_w;
wire           axi_arb_out_wready_w;
wire  [  1:0]  axi_ftdi_rresp_w;
wire           axi_dbg_usb_arvalid_w;
wire           axi_dbg_ftdi_arready_w;
wire           axi_arb_out_bready_w;
wire  [  7:0]  axi_dbg_usb_awlen_w;
wire  [  1:0]  axi_dbg_ftdi_awburst_w;
wire  [ 31:0]  axi_dbg_usb_awaddr_w;
wire  [  1:0]  axi_dbg_usb_arburst_w;
wire           axi_arb_out_wlast_w;
wire  [  3:0]  axi_usb_bid_w;
wire  [ 31:0]  axi_cfg_rdata_w;
wire  [  7:0]  axi_arb_out_awlen_w;
wire  [  3:0]  axi_cfg_wstrb_w;
wire           axi_dbg_ftdi_arvalid_w;
wire           axi_ftdi_wlast_w;
wire  [ 31:0]  axi_cfg_araddr_w;
wire           axi_ftdi_bready_w;
wire  [  1:0]  axi_arb_out_awburst_w;
wire           axi_usb_arready_w;
wire  [ 31:0]  axi_ftdi_rdata_w;
wire           axi_usb_awvalid_w;
wire  [  3:0]  axi_arb_out_rid_w;
wire  [  3:0]  axi_dbg_ftdi_awid_w;
wire  [  1:0]  axi_usb_rresp_w;
wire  [ 31:0]  axi_dbg_ftdi_wdata_w;
wire  [ 31:0]  axi_ftdi_awaddr_w;
wire  [  1:0]  axi_usb_bresp_w;
wire           axi_cfg_bready_w;
wire  [  3:0]  axi_dbg_usb_rid_w;
wire  [ 31:0]  axi_dbg_ftdi_awaddr_w;
wire  [  7:0]  axi_dbg_ftdi_awlen_w;
wire           axi_dbg_usb_rlast_w;
wire           axi_dbg_usb_wready_w;
wire  [  3:0]  axi_dbg_usb_arid_w;
wire  [  3:0]  axi_usb_awid_w;
wire           axi_ftdi_awready_w;
wire           axi_cfg_awvalid_w;
wire           axi_cfg_wready_w;
wire  [  1:0]  axi_dbg_ftdi_rresp_w;
wire           axi_dbg_usb_awready_w;
wire           axi_dbg_usb_bready_w;
wire  [ 31:0]  axi_arb_out_araddr_w;
wire           axi_dbg_usb_arready_w;
wire  [  3:0]  axi_dbg_ftdi_rid_w;
wire  [  1:0]  axi_ftdi_awburst_w;
wire           axi_usb_wlast_w;
wire           axi_ftdi_awvalid_w;
wire  [  3:0]  axi_dbg_ftdi_wstrb_w;
wire  [  7:0]  axi_ftdi_awlen_w;
wire  [  1:0]  axi_arb_out_rresp_w;
wire  [  1:0]  axi_usb_awburst_w;
wire  [  3:0]  axi_usb_rid_w;
wire           axi_arb_out_arready_w;
wire           axi_arb_out_rlast_w;
wire           axi_usb_bready_w;
wire           axi_dbg_ftdi_bvalid_w;
wire  [  3:0]  axi_usb_wstrb_w;
wire  [ 31:0]  axi_dbg_usb_rdata_w;
wire  [  1:0]  axi_dbg_ftdi_bresp_w;
wire           axi_arb_out_rvalid_w;
wire           axi_cfg_rready_w;
wire  [  7:0]  axi_usb_arlen_w;
wire  [ 31:0]  axi_cfg_awaddr_w;
wire           axi_dbg_usb_rvalid_w;
wire  [ 31:0]  axi_dbg_ftdi_araddr_w;
wire           axi_arb_out_awready_w;
wire           axi_dbg_ftdi_rready_w;
wire           axi_usb_bvalid_w;
wire           axi_cfg_arvalid_w;
wire           axi_dbg_ftdi_rvalid_w;
wire  [  3:0]  axi_arb_out_wstrb_w;
wire           axi_dbg_ftdi_wlast_w;
wire  [  3:0]  axi_dbg_usb_wstrb_w;
wire  [  1:0]  axi_dbg_usb_rresp_w;
wire  [  7:0]  axi_usb_awlen_w;
wire  [  1:0]  axi_dbg_usb_bresp_w;
wire  [  3:0]  axi_ftdi_bid_w;
wire  [  3:0]  axi_usb_arid_w;
wire  [  3:0]  axi_dbg_ftdi_bid_w;
wire  [  1:0]  axi_ftdi_bresp_w;
wire  [  3:0]  axi_dbg_ftdi_arid_w;
wire           axi_ftdi_arready_w;
wire           axi_arb_out_wvalid_w;
wire  [ 31:0]  axi_arb_out_wdata_w;
wire  [  1:0]  axi_arb_out_bresp_w;
wire           axi_ftdi_rvalid_w;
wire  [ 31:0]  axi_usb_rdata_w;
wire           axi_ftdi_wvalid_w;
wire  [  3:0]  axi_dbg_usb_awid_w;
wire  [ 31:0]  axi_ftdi_araddr_w;
wire  [ 31:0]  axi_ftdi_wdata_w;
wire  [  1:0]  axi_arb_out_arburst_w;
wire  [  1:0]  axi_ftdi_arburst_w;
wire  [  3:0]  axi_ftdi_rid_w;
wire           axi_ftdi_arvalid_w;
wire  [  1:0]  axi_dbg_ftdi_arburst_w;
wire           axi_cfg_bvalid_w;
wire  [ 31:0]  axi_usb_awaddr_w;
wire           axi_arb_out_bvalid_w;
wire  [  7:0]  axi_ftdi_arlen_w;
wire           axi_cfg_rvalid_w;
wire           axi_dbg_ftdi_wready_w;
wire           axi_dbg_ftdi_rlast_w;
wire           axi_cfg_arready_w;
wire           axi_dbg_usb_wlast_w;
wire           axi_arb_out_awvalid_w;
wire           axi_ftdi_wready_w;
wire           axi_dbg_usb_rready_w;
wire  [  7:0]  axi_dbg_ftdi_arlen_w;
wire           axi_dbg_ftdi_awvalid_w;
wire  [ 31:0]  axi_usb_wdata_w;
wire  [  3:0]  axi_arb_out_awid_w;
wire           axi_usb_wready_w;
wire           axi_dbg_usb_bvalid_w;
wire           axi_dbg_ftdi_wvalid_w;
wire           axi_dbg_ftdi_bready_w;
wire           axi_usb_rvalid_w;
wire  [  3:0]  axi_ftdi_arid_w;
wire  [ 31:0]  axi_arb_out_awaddr_w;
wire  [  1:0]  axi_usb_arburst_w;
wire  [ 31:0]  axi_arb_out_rdata_w;
wire           axi_usb_rlast_w;
wire  [  3:0]  axi_dbg_usb_bid_w;
wire  [ 31:0]  axi_dbg_usb_wdata_w;
wire  [  1:0]  axi_cfg_rresp_w;
wire           axi_dbg_usb_wvalid_w;
wire           axi_cfg_awready_w;
wire  [ 31:0]  axi_dbg_ftdi_rdata_w;
wire  [  3:0]  axi_ftdi_awid_w;
wire  [  1:0]  axi_cfg_bresp_w;
wire  [  3:0]  axi_ftdi_wstrb_w;
wire           axi_usb_wvalid_w;


axi4_cdc
u_cdc_usb_ddr
(
    // Inputs
     .wr_clk_i(clk_usb_i)
    ,.wr_rst_i(rst_i)
    ,.inport_awvalid_i(axi_arb_out_awvalid_w)
    ,.inport_awaddr_i(axi_arb_out_awaddr_w)
    ,.inport_awid_i(axi_arb_out_awid_w)
    ,.inport_awlen_i(axi_arb_out_awlen_w)
    ,.inport_awburst_i(axi_arb_out_awburst_w)
    ,.inport_wvalid_i(axi_arb_out_wvalid_w)
    ,.inport_wdata_i(axi_arb_out_wdata_w)
    ,.inport_wstrb_i(axi_arb_out_wstrb_w)
    ,.inport_wlast_i(axi_arb_out_wlast_w)
    ,.inport_bready_i(axi_arb_out_bready_w)
    ,.inport_arvalid_i(axi_arb_out_arvalid_w)
    ,.inport_araddr_i(axi_arb_out_araddr_w)
    ,.inport_arid_i(axi_arb_out_arid_w)
    ,.inport_arlen_i(axi_arb_out_arlen_w)
    ,.inport_arburst_i(axi_arb_out_arburst_w)
    ,.inport_rready_i(axi_arb_out_rready_w)
    ,.rd_clk_i(clk_sys_i)
    ,.rd_rst_i(rst_i)
    ,.outport_awready_i(axi_awready_i)
    ,.outport_wready_i(axi_wready_i)
    ,.outport_bvalid_i(axi_bvalid_i)
    ,.outport_bresp_i(axi_bresp_i)
    ,.outport_bid_i(axi_bid_i)
    ,.outport_arready_i(axi_arready_i)
    ,.outport_rvalid_i(axi_rvalid_i)
    ,.outport_rdata_i(axi_rdata_i)
    ,.outport_rresp_i(axi_rresp_i)
    ,.outport_rid_i(axi_rid_i)
    ,.outport_rlast_i(axi_rlast_i)

    // Outputs
    ,.inport_awready_o(axi_arb_out_awready_w)
    ,.inport_wready_o(axi_arb_out_wready_w)
    ,.inport_bvalid_o(axi_arb_out_bvalid_w)
    ,.inport_bresp_o(axi_arb_out_bresp_w)
    ,.inport_bid_o(axi_arb_out_bid_w)
    ,.inport_arready_o(axi_arb_out_arready_w)
    ,.inport_rvalid_o(axi_arb_out_rvalid_w)
    ,.inport_rdata_o(axi_arb_out_rdata_w)
    ,.inport_rresp_o(axi_arb_out_rresp_w)
    ,.inport_rid_o(axi_arb_out_rid_w)
    ,.inport_rlast_o(axi_arb_out_rlast_w)
    ,.outport_awvalid_o(axi_awvalid_o)
    ,.outport_awaddr_o(axi_awaddr_o)
    ,.outport_awid_o(axi_awid_o)
    ,.outport_awlen_o(axi_awlen_o)
    ,.outport_awburst_o(axi_awburst_o)
    ,.outport_wvalid_o(axi_wvalid_o)
    ,.outport_wdata_o(axi_wdata_o)
    ,.outport_wstrb_o(axi_wstrb_o)
    ,.outport_wlast_o(axi_wlast_o)
    ,.outport_bready_o(axi_bready_o)
    ,.outport_arvalid_o(axi_arvalid_o)
    ,.outport_araddr_o(axi_araddr_o)
    ,.outport_arid_o(axi_arid_o)
    ,.outport_arlen_o(axi_arlen_o)
    ,.outport_arburst_o(axi_arburst_o)
    ,.outport_rready_o(axi_rready_o)
);


axi4_lite_tap
u_dist
(
    // Inputs
     .clk_i(clk_usb_i)
    ,.rst_i(rst_i)
    ,.inport_awvalid_i(axi_dbg_usb_awvalid_w)
    ,.inport_awaddr_i(axi_dbg_usb_awaddr_w)
    ,.inport_awid_i(axi_dbg_usb_awid_w)
    ,.inport_awlen_i(axi_dbg_usb_awlen_w)
    ,.inport_awburst_i(axi_dbg_usb_awburst_w)
    ,.inport_wvalid_i(axi_dbg_usb_wvalid_w)
    ,.inport_wdata_i(axi_dbg_usb_wdata_w)
    ,.inport_wstrb_i(axi_dbg_usb_wstrb_w)
    ,.inport_wlast_i(axi_dbg_usb_wlast_w)
    ,.inport_bready_i(axi_dbg_usb_bready_w)
    ,.inport_arvalid_i(axi_dbg_usb_arvalid_w)
    ,.inport_araddr_i(axi_dbg_usb_araddr_w)
    ,.inport_arid_i(axi_dbg_usb_arid_w)
    ,.inport_arlen_i(axi_dbg_usb_arlen_w)
    ,.inport_arburst_i(axi_dbg_usb_arburst_w)
    ,.inport_rready_i(axi_dbg_usb_rready_w)
    ,.outport_awready_i(axi_ftdi_awready_w)
    ,.outport_wready_i(axi_ftdi_wready_w)
    ,.outport_bvalid_i(axi_ftdi_bvalid_w)
    ,.outport_bresp_i(axi_ftdi_bresp_w)
    ,.outport_bid_i(axi_ftdi_bid_w)
    ,.outport_arready_i(axi_ftdi_arready_w)
    ,.outport_rvalid_i(axi_ftdi_rvalid_w)
    ,.outport_rdata_i(axi_ftdi_rdata_w)
    ,.outport_rresp_i(axi_ftdi_rresp_w)
    ,.outport_rid_i(axi_ftdi_rid_w)
    ,.outport_rlast_i(axi_ftdi_rlast_w)
    ,.outport_peripheral0_awready_i(axi_cfg_awready_w)
    ,.outport_peripheral0_wready_i(axi_cfg_wready_w)
    ,.outport_peripheral0_bvalid_i(axi_cfg_bvalid_w)
    ,.outport_peripheral0_bresp_i(axi_cfg_bresp_w)
    ,.outport_peripheral0_arready_i(axi_cfg_arready_w)
    ,.outport_peripheral0_rvalid_i(axi_cfg_rvalid_w)
    ,.outport_peripheral0_rdata_i(axi_cfg_rdata_w)
    ,.outport_peripheral0_rresp_i(axi_cfg_rresp_w)

    // Outputs
    ,.inport_awready_o(axi_dbg_usb_awready_w)
    ,.inport_wready_o(axi_dbg_usb_wready_w)
    ,.inport_bvalid_o(axi_dbg_usb_bvalid_w)
    ,.inport_bresp_o(axi_dbg_usb_bresp_w)
    ,.inport_bid_o(axi_dbg_usb_bid_w)
    ,.inport_arready_o(axi_dbg_usb_arready_w)
    ,.inport_rvalid_o(axi_dbg_usb_rvalid_w)
    ,.inport_rdata_o(axi_dbg_usb_rdata_w)
    ,.inport_rresp_o(axi_dbg_usb_rresp_w)
    ,.inport_rid_o(axi_dbg_usb_rid_w)
    ,.inport_rlast_o(axi_dbg_usb_rlast_w)
    ,.outport_awvalid_o(axi_ftdi_awvalid_w)
    ,.outport_awaddr_o(axi_ftdi_awaddr_w)
    ,.outport_awid_o(axi_ftdi_awid_w)
    ,.outport_awlen_o(axi_ftdi_awlen_w)
    ,.outport_awburst_o(axi_ftdi_awburst_w)
    ,.outport_wvalid_o(axi_ftdi_wvalid_w)
    ,.outport_wdata_o(axi_ftdi_wdata_w)
    ,.outport_wstrb_o(axi_ftdi_wstrb_w)
    ,.outport_wlast_o(axi_ftdi_wlast_w)
    ,.outport_bready_o(axi_ftdi_bready_w)
    ,.outport_arvalid_o(axi_ftdi_arvalid_w)
    ,.outport_araddr_o(axi_ftdi_araddr_w)
    ,.outport_arid_o(axi_ftdi_arid_w)
    ,.outport_arlen_o(axi_ftdi_arlen_w)
    ,.outport_arburst_o(axi_ftdi_arburst_w)
    ,.outport_rready_o(axi_ftdi_rready_w)
    ,.outport_peripheral0_awvalid_o(axi_cfg_awvalid_w)
    ,.outport_peripheral0_awaddr_o(axi_cfg_awaddr_w)
    ,.outport_peripheral0_wvalid_o(axi_cfg_wvalid_w)
    ,.outport_peripheral0_wdata_o(axi_cfg_wdata_w)
    ,.outport_peripheral0_wstrb_o(axi_cfg_wstrb_w)
    ,.outport_peripheral0_bready_o(axi_cfg_bready_w)
    ,.outport_peripheral0_arvalid_o(axi_cfg_arvalid_w)
    ,.outport_peripheral0_araddr_o(axi_cfg_araddr_w)
    ,.outport_peripheral0_rready_o(axi_cfg_rready_w)
);


ft60x_axi
#( .AXI_ID(8) )
u_dbg
(
    // Inputs
     .clk_i(clk_ftdi_i)
    ,.rst_i(rst_i)
    ,.ftdi_rxf_i(ftdi_rxf_i)
    ,.ftdi_txe_i(ftdi_txe_i)
    ,.ftdi_data_in_i(ftdi_data_in_i)
    ,.ftdi_be_in_i(ftdi_be_in_i)
    ,.outport_awready_i(axi_dbg_ftdi_awready_w)
    ,.outport_wready_i(axi_dbg_ftdi_wready_w)
    ,.outport_bvalid_i(axi_dbg_ftdi_bvalid_w)
    ,.outport_bresp_i(axi_dbg_ftdi_bresp_w)
    ,.outport_bid_i(axi_dbg_ftdi_bid_w)
    ,.outport_arready_i(axi_dbg_ftdi_arready_w)
    ,.outport_rvalid_i(axi_dbg_ftdi_rvalid_w)
    ,.outport_rdata_i(axi_dbg_ftdi_rdata_w)
    ,.outport_rresp_i(axi_dbg_ftdi_rresp_w)
    ,.outport_rid_i(axi_dbg_ftdi_rid_w)
    ,.outport_rlast_i(axi_dbg_ftdi_rlast_w)
    ,.gpio_inputs_i(gpio_inputs_i)

    // Outputs
    ,.ftdi_wrn_o(ftdi_wrn_o)
    ,.ftdi_rdn_o(ftdi_rdn_o)
    ,.ftdi_oen_o(ftdi_oen_o)
    ,.ftdi_data_out_o(ftdi_data_out_o)
    ,.ftdi_be_out_o(ftdi_be_out_o)
    ,.outport_awvalid_o(axi_dbg_ftdi_awvalid_w)
    ,.outport_awaddr_o(axi_dbg_ftdi_awaddr_w)
    ,.outport_awid_o(axi_dbg_ftdi_awid_w)
    ,.outport_awlen_o(axi_dbg_ftdi_awlen_w)
    ,.outport_awburst_o(axi_dbg_ftdi_awburst_w)
    ,.outport_wvalid_o(axi_dbg_ftdi_wvalid_w)
    ,.outport_wdata_o(axi_dbg_ftdi_wdata_w)
    ,.outport_wstrb_o(axi_dbg_ftdi_wstrb_w)
    ,.outport_wlast_o(axi_dbg_ftdi_wlast_w)
    ,.outport_bready_o(axi_dbg_ftdi_bready_w)
    ,.outport_arvalid_o(axi_dbg_ftdi_arvalid_w)
    ,.outport_araddr_o(axi_dbg_ftdi_araddr_w)
    ,.outport_arid_o(axi_dbg_ftdi_arid_w)
    ,.outport_arlen_o(axi_dbg_ftdi_arlen_w)
    ,.outport_arburst_o(axi_dbg_ftdi_arburst_w)
    ,.outport_rready_o(axi_dbg_ftdi_rready_w)
    ,.gpio_outputs_o(gpio_outputs_o)
);


axi4_arb
u_arb
(
    // Inputs
     .clk_i(clk_usb_i)
    ,.rst_i(rst_i)
    ,.inport0_awvalid_i(axi_usb_awvalid_w)
    ,.inport0_awaddr_i(axi_usb_awaddr_w)
    ,.inport0_awid_i(axi_usb_awid_w)
    ,.inport0_awlen_i(axi_usb_awlen_w)
    ,.inport0_awburst_i(axi_usb_awburst_w)
    ,.inport0_wvalid_i(axi_usb_wvalid_w)
    ,.inport0_wdata_i(axi_usb_wdata_w)
    ,.inport0_wstrb_i(axi_usb_wstrb_w)
    ,.inport0_wlast_i(axi_usb_wlast_w)
    ,.inport0_bready_i(axi_usb_bready_w)
    ,.inport0_arvalid_i(axi_usb_arvalid_w)
    ,.inport0_araddr_i(axi_usb_araddr_w)
    ,.inport0_arid_i(axi_usb_arid_w)
    ,.inport0_arlen_i(axi_usb_arlen_w)
    ,.inport0_arburst_i(axi_usb_arburst_w)
    ,.inport0_rready_i(axi_usb_rready_w)
    ,.inport1_awvalid_i(axi_ftdi_awvalid_w)
    ,.inport1_awaddr_i(axi_ftdi_awaddr_w)
    ,.inport1_awid_i(axi_ftdi_awid_w)
    ,.inport1_awlen_i(axi_ftdi_awlen_w)
    ,.inport1_awburst_i(axi_ftdi_awburst_w)
    ,.inport1_wvalid_i(axi_ftdi_wvalid_w)
    ,.inport1_wdata_i(axi_ftdi_wdata_w)
    ,.inport1_wstrb_i(axi_ftdi_wstrb_w)
    ,.inport1_wlast_i(axi_ftdi_wlast_w)
    ,.inport1_bready_i(axi_ftdi_bready_w)
    ,.inport1_arvalid_i(axi_ftdi_arvalid_w)
    ,.inport1_araddr_i(axi_ftdi_araddr_w)
    ,.inport1_arid_i(axi_ftdi_arid_w)
    ,.inport1_arlen_i(axi_ftdi_arlen_w)
    ,.inport1_arburst_i(axi_ftdi_arburst_w)
    ,.inport1_rready_i(axi_ftdi_rready_w)
    ,.outport_awready_i(axi_arb_out_awready_w)
    ,.outport_wready_i(axi_arb_out_wready_w)
    ,.outport_bvalid_i(axi_arb_out_bvalid_w)
    ,.outport_bresp_i(axi_arb_out_bresp_w)
    ,.outport_bid_i(axi_arb_out_bid_w)
    ,.outport_arready_i(axi_arb_out_arready_w)
    ,.outport_rvalid_i(axi_arb_out_rvalid_w)
    ,.outport_rdata_i(axi_arb_out_rdata_w)
    ,.outport_rresp_i(axi_arb_out_rresp_w)
    ,.outport_rid_i(axi_arb_out_rid_w)
    ,.outport_rlast_i(axi_arb_out_rlast_w)

    // Outputs
    ,.inport0_awready_o(axi_usb_awready_w)
    ,.inport0_wready_o(axi_usb_wready_w)
    ,.inport0_bvalid_o(axi_usb_bvalid_w)
    ,.inport0_bresp_o(axi_usb_bresp_w)
    ,.inport0_bid_o(axi_usb_bid_w)
    ,.inport0_arready_o(axi_usb_arready_w)
    ,.inport0_rvalid_o(axi_usb_rvalid_w)
    ,.inport0_rdata_o(axi_usb_rdata_w)
    ,.inport0_rresp_o(axi_usb_rresp_w)
    ,.inport0_rid_o(axi_usb_rid_w)
    ,.inport0_rlast_o(axi_usb_rlast_w)
    ,.inport1_awready_o(axi_ftdi_awready_w)
    ,.inport1_wready_o(axi_ftdi_wready_w)
    ,.inport1_bvalid_o(axi_ftdi_bvalid_w)
    ,.inport1_bresp_o(axi_ftdi_bresp_w)
    ,.inport1_bid_o(axi_ftdi_bid_w)
    ,.inport1_arready_o(axi_ftdi_arready_w)
    ,.inport1_rvalid_o(axi_ftdi_rvalid_w)
    ,.inport1_rdata_o(axi_ftdi_rdata_w)
    ,.inport1_rresp_o(axi_ftdi_rresp_w)
    ,.inport1_rid_o(axi_ftdi_rid_w)
    ,.inport1_rlast_o(axi_ftdi_rlast_w)
    ,.outport_awvalid_o(axi_arb_out_awvalid_w)
    ,.outport_awaddr_o(axi_arb_out_awaddr_w)
    ,.outport_awid_o(axi_arb_out_awid_w)
    ,.outport_awlen_o(axi_arb_out_awlen_w)
    ,.outport_awburst_o(axi_arb_out_awburst_w)
    ,.outport_wvalid_o(axi_arb_out_wvalid_w)
    ,.outport_wdata_o(axi_arb_out_wdata_w)
    ,.outport_wstrb_o(axi_arb_out_wstrb_w)
    ,.outport_wlast_o(axi_arb_out_wlast_w)
    ,.outport_bready_o(axi_arb_out_bready_w)
    ,.outport_arvalid_o(axi_arb_out_arvalid_w)
    ,.outport_araddr_o(axi_arb_out_araddr_w)
    ,.outport_arid_o(axi_arb_out_arid_w)
    ,.outport_arlen_o(axi_arb_out_arlen_w)
    ,.outport_arburst_o(axi_arb_out_arburst_w)
    ,.outport_rready_o(axi_arb_out_rready_w)
);


axi4_cdc
u_cdc_ftdi_usb
(
    // Inputs
     .wr_clk_i(clk_ftdi_i)
    ,.wr_rst_i(rst_i)
    ,.inport_awvalid_i(axi_dbg_ftdi_awvalid_w)
    ,.inport_awaddr_i(axi_dbg_ftdi_awaddr_w)
    ,.inport_awid_i(axi_dbg_ftdi_awid_w)
    ,.inport_awlen_i(axi_dbg_ftdi_awlen_w)
    ,.inport_awburst_i(axi_dbg_ftdi_awburst_w)
    ,.inport_wvalid_i(axi_dbg_ftdi_wvalid_w)
    ,.inport_wdata_i(axi_dbg_ftdi_wdata_w)
    ,.inport_wstrb_i(axi_dbg_ftdi_wstrb_w)
    ,.inport_wlast_i(axi_dbg_ftdi_wlast_w)
    ,.inport_bready_i(axi_dbg_ftdi_bready_w)
    ,.inport_arvalid_i(axi_dbg_ftdi_arvalid_w)
    ,.inport_araddr_i(axi_dbg_ftdi_araddr_w)
    ,.inport_arid_i(axi_dbg_ftdi_arid_w)
    ,.inport_arlen_i(axi_dbg_ftdi_arlen_w)
    ,.inport_arburst_i(axi_dbg_ftdi_arburst_w)
    ,.inport_rready_i(axi_dbg_ftdi_rready_w)
    ,.rd_clk_i(clk_usb_i)
    ,.rd_rst_i(rst_i)
    ,.outport_awready_i(axi_dbg_usb_awready_w)
    ,.outport_wready_i(axi_dbg_usb_wready_w)
    ,.outport_bvalid_i(axi_dbg_usb_bvalid_w)
    ,.outport_bresp_i(axi_dbg_usb_bresp_w)
    ,.outport_bid_i(axi_dbg_usb_bid_w)
    ,.outport_arready_i(axi_dbg_usb_arready_w)
    ,.outport_rvalid_i(axi_dbg_usb_rvalid_w)
    ,.outport_rdata_i(axi_dbg_usb_rdata_w)
    ,.outport_rresp_i(axi_dbg_usb_rresp_w)
    ,.outport_rid_i(axi_dbg_usb_rid_w)
    ,.outport_rlast_i(axi_dbg_usb_rlast_w)

    // Outputs
    ,.inport_awready_o(axi_dbg_ftdi_awready_w)
    ,.inport_wready_o(axi_dbg_ftdi_wready_w)
    ,.inport_bvalid_o(axi_dbg_ftdi_bvalid_w)
    ,.inport_bresp_o(axi_dbg_ftdi_bresp_w)
    ,.inport_bid_o(axi_dbg_ftdi_bid_w)
    ,.inport_arready_o(axi_dbg_ftdi_arready_w)
    ,.inport_rvalid_o(axi_dbg_ftdi_rvalid_w)
    ,.inport_rdata_o(axi_dbg_ftdi_rdata_w)
    ,.inport_rresp_o(axi_dbg_ftdi_rresp_w)
    ,.inport_rid_o(axi_dbg_ftdi_rid_w)
    ,.inport_rlast_o(axi_dbg_ftdi_rlast_w)
    ,.outport_awvalid_o(axi_dbg_usb_awvalid_w)
    ,.outport_awaddr_o(axi_dbg_usb_awaddr_w)
    ,.outport_awid_o(axi_dbg_usb_awid_w)
    ,.outport_awlen_o(axi_dbg_usb_awlen_w)
    ,.outport_awburst_o(axi_dbg_usb_awburst_w)
    ,.outport_wvalid_o(axi_dbg_usb_wvalid_w)
    ,.outport_wdata_o(axi_dbg_usb_wdata_w)
    ,.outport_wstrb_o(axi_dbg_usb_wstrb_w)
    ,.outport_wlast_o(axi_dbg_usb_wlast_w)
    ,.outport_bready_o(axi_dbg_usb_bready_w)
    ,.outport_arvalid_o(axi_dbg_usb_arvalid_w)
    ,.outport_araddr_o(axi_dbg_usb_araddr_w)
    ,.outport_arid_o(axi_dbg_usb_arid_w)
    ,.outport_arlen_o(axi_dbg_usb_arlen_w)
    ,.outport_arburst_o(axi_dbg_usb_arburst_w)
    ,.outport_rready_o(axi_dbg_usb_rready_w)
);


usb_sniffer
u_usb_sniffer
(
    // Inputs
     .clk_i(clk_usb_i)
    ,.rst_i(rst_i)
    ,.cfg_awvalid_i(axi_cfg_awvalid_w)
    ,.cfg_awaddr_i(axi_cfg_awaddr_w)
    ,.cfg_wvalid_i(axi_cfg_wvalid_w)
    ,.cfg_wdata_i(axi_cfg_wdata_w)
    ,.cfg_wstrb_i(axi_cfg_wstrb_w)
    ,.cfg_bready_i(axi_cfg_bready_w)
    ,.cfg_arvalid_i(axi_cfg_arvalid_w)
    ,.cfg_araddr_i(axi_cfg_araddr_w)
    ,.cfg_rready_i(axi_cfg_rready_w)
    ,.utmi_data_out_i(utmi_data_out_i)
    ,.utmi_data_in_i(utmi_data_in_i)
    ,.utmi_txvalid_i(utmi_txvalid_i)
    ,.utmi_txready_i(utmi_txready_i)
    ,.utmi_rxvalid_i(utmi_rxvalid_i)
    ,.utmi_rxactive_i(utmi_rxactive_i)
    ,.utmi_rxerror_i(utmi_rxerror_i)
    ,.utmi_linestate_i(utmi_linestate_i)
    ,.outport_awready_i(axi_usb_awready_w)
    ,.outport_wready_i(axi_usb_wready_w)
    ,.outport_bvalid_i(axi_usb_bvalid_w)
    ,.outport_bresp_i(axi_usb_bresp_w)
    ,.outport_bid_i(axi_usb_bid_w)
    ,.outport_arready_i(axi_usb_arready_w)
    ,.outport_rvalid_i(axi_usb_rvalid_w)
    ,.outport_rdata_i(axi_usb_rdata_w)
    ,.outport_rresp_i(axi_usb_rresp_w)
    ,.outport_rid_i(axi_usb_rid_w)
    ,.outport_rlast_i(axi_usb_rlast_w)

    // Outputs
    ,.cfg_awready_o(axi_cfg_awready_w)
    ,.cfg_wready_o(axi_cfg_wready_w)
    ,.cfg_bvalid_o(axi_cfg_bvalid_w)
    ,.cfg_bresp_o(axi_cfg_bresp_w)
    ,.cfg_arready_o(axi_cfg_arready_w)
    ,.cfg_rvalid_o(axi_cfg_rvalid_w)
    ,.cfg_rdata_o(axi_cfg_rdata_w)
    ,.cfg_rresp_o(axi_cfg_rresp_w)
    ,.utmi_op_mode_o(utmi_op_mode_o)
    ,.utmi_xcvrselect_o(utmi_xcvrselect_o)
    ,.utmi_termselect_o(utmi_termselect_o)
    ,.utmi_dppulldown_o(utmi_dppulldown_o)
    ,.utmi_dmpulldown_o(utmi_dmpulldown_o)
    ,.outport_awvalid_o(axi_usb_awvalid_w)
    ,.outport_awaddr_o(axi_usb_awaddr_w)
    ,.outport_awid_o(axi_usb_awid_w)
    ,.outport_awlen_o(axi_usb_awlen_w)
    ,.outport_awburst_o(axi_usb_awburst_w)
    ,.outport_wvalid_o(axi_usb_wvalid_w)
    ,.outport_wdata_o(axi_usb_wdata_w)
    ,.outport_wstrb_o(axi_usb_wstrb_w)
    ,.outport_wlast_o(axi_usb_wlast_w)
    ,.outport_bready_o(axi_usb_bready_w)
    ,.outport_arvalid_o(axi_usb_arvalid_w)
    ,.outport_araddr_o(axi_usb_araddr_w)
    ,.outport_arid_o(axi_usb_arid_w)
    ,.outport_arlen_o(axi_usb_arlen_w)
    ,.outport_arburst_o(axi_usb_arburst_w)
    ,.outport_rready_o(axi_usb_rready_w)
);




endmodule
