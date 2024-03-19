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
module top
(
      input         clk100_i

    , output        led0_r_o
    , output        led0_g_o
    , output        led0_b_o
    , output        led1_r_o
    , output        led1_g_o
    , output        led1_b_o

    // DDR3 SDRAM
    , inout [15:0]  ddr3_dq
    , inout [1:0]   ddr3_dqs_n
    , inout [1:0]   ddr3_dqs_p
    , output [14:0] ddr3_addr
    , output [2:0]  ddr3_ba
    , output        ddr3_ras_n
    , output        ddr3_cas_n
    , output        ddr3_we_n
    , output        ddr3_reset_n
    , output [0:0]  ddr3_ck_p
    , output [0:0]  ddr3_ck_n
    , output [0:0]  ddr3_cke
    , output [1:0]  ddr3_dm
    , output [0:0]  ddr3_odt

    // FTDI
    , input         ftdi_clk
    , output        ftdi_rst
    , inout [31:0]  ftdi_data
    , inout [3:0]   ftdi_be
    , input         ftdi_rxf_n
    , input         ftdi_txe_n
    , output        ftdi_rd_n
    , output        ftdi_wr_n
    , output        ftdi_oe_n
    , output        ftdi_siwua

    // USB switch
    , output        ulpi_sw_s
    , output        ulpi_sw_oe_n

    // ULPI0 Interface
    , output        ulpi0_reset_o
    , inout [7:0]   ulpi0_data_io
    , output        ulpi0_stp_o
    , input         ulpi0_nxt_i
    , input         ulpi0_dir_i
    , input         ulpi0_clk60_i
);

//-----------------------------------------------------------------
// Implementation
//-----------------------------------------------------------------
wire           clk0;
wire           clk1;
wire           clk_w;
wire           clk_sys_w;
wire           rst_sys_w;

wire           axi_rvalid_w;
wire           axi_wlast_w;
wire           axi_rlast_w;
wire  [  3:0]  axi_arid_w;
wire  [  1:0]  axi_rresp_w;
wire           axi_wvalid_w;
wire  [  7:0]  axi_awlen_w;
wire  [  1:0]  axi_awburst_w;
wire  [  1:0]  axi_bresp_w;
wire  [ 31:0]  axi_rdata_w;
wire           axi_arready_w;
wire           axi_awvalid_w;
wire  [ 31:0]  axi_araddr_w;
wire  [  1:0]  axi_arburst_w;
wire           axi_wready_w;
wire  [  7:0]  axi_arlen_w;
wire           axi_awready_w;
wire  [  3:0]  axi_bid_w;
wire  [  3:0]  axi_wstrb_w;
wire  [  3:0]  axi_awid_w;
wire           axi_rready_w;
wire  [  3:0]  axi_rid_w;
wire           axi_arvalid_w;
wire  [ 31:0]  axi_awaddr_w;
wire           axi_bvalid_w;
wire           axi_bready_w;
wire  [ 31:0]  axi_wdata_w;


wire clk100_buffered_w;

// Input buffering
BUFG IBUF_IN
(
    .I (clk100_i),
    .O (clk100_buffered_w)
);

artix7_pll
u_pll
(
    .clkref_i(clk100_buffered_w),
    .clkout0_o(clk0), // 100
    .clkout1_o(clk1), // 200
    .clkout2_o(clk_w) // 50
);

//-----------------------------------------------------------------
// ULPI Interface
//-----------------------------------------------------------------
assign ulpi_sw_oe_n = 1'b0;
assign ulpi_sw_s    = 1'b0; // 0 = USB<->USB

wire clk_bufg_w;
IBUF u_ibuf ( .I(ulpi0_clk60_i), .O(clk_bufg_w) );
BUFG u_bufg ( .I(clk_bufg_w),    .O(usb_clk_w) );

// USB clock / reset
wire usb_rst_w;

reset_gen
u_rst_usb
(
    .clk_i(usb_clk_w),
    .rst_o(usb_rst_w)
);

// ULPI Buffers
wire [7:0] ulpi_out_w;
wire [7:0] ulpi_in_w;
wire       ulpi_stp_w;

genvar i;
generate  
for (i=0; i < 8; i=i+1)  
begin: gen_buf
    IOBUF 
    #(
        .DRIVE(12),
        .IOSTANDARD("DEFAULT"),
        .SLEW("FAST")
    )
    IOBUF_inst
    (
        .T(ulpi0_dir_i),
        .I(ulpi_out_w[i]),
        .O(ulpi_in_w[i]),
        .IO(ulpi0_data_io[i])
    );
end  
endgenerate  

OBUF 
#(
    .DRIVE(12),
    .IOSTANDARD("DEFAULT"),
    .SLEW("FAST")
)
OBUF_stp
(
    .I(ulpi_stp_w),
    .O(ulpi0_stp_o)
);

wire  [  7:0]  utmi_data_out_w = 8'b0;
wire           utmi_txvalid_w = 1'b0;
wire           utmi_txready_w;
wire  [  7:0]  utmi_data_in_w;
wire           utmi_rxvalid_w;
wire           utmi_rxactive_w;
wire           utmi_rxerror_w;
wire  [  1:0]  utmi_linestate_w;

wire  [  1:0]  utmi_op_mode_w;
wire  [  1:0]  utmi_xcvrselect_w;
wire           utmi_termselect_w;
wire           utmi_dppulldown_w;
wire           utmi_dmpulldown_w;

ulpi_wrapper
u_usb
(
     .ulpi_clk60_i(usb_clk_w)
    ,.ulpi_rst_i(usb_rst_w)

    ,.ulpi_data_out_i(ulpi_in_w)
    ,.ulpi_dir_i(ulpi0_dir_i)
    ,.ulpi_nxt_i(ulpi0_nxt_i)
    ,.ulpi_data_in_o(ulpi_out_w)
    ,.ulpi_stp_o(ulpi_stp_w)

    ,.utmi_data_out_i(utmi_data_out_w)
    ,.utmi_txvalid_i(utmi_txvalid_w)
    ,.utmi_op_mode_i(utmi_op_mode_w)
    ,.utmi_xcvrselect_i(utmi_xcvrselect_w)
    ,.utmi_termselect_i(utmi_termselect_w)
    ,.utmi_dppulldown_i(utmi_dppulldown_w)
    ,.utmi_dmpulldown_i(utmi_dmpulldown_w)
    ,.utmi_data_in_o(utmi_data_in_w)
    ,.utmi_txready_o(utmi_txready_w)
    ,.utmi_rxvalid_o(utmi_rxvalid_w)
    ,.utmi_rxactive_o(utmi_rxactive_w)
    ,.utmi_rxerror_o(utmi_rxerror_w)
    ,.utmi_linestate_o(utmi_linestate_w)
);

assign ulpi0_reset_o = 1'b0;

//-----------------------------------------------------------------
// DDR
//-----------------------------------------------------------------
usb2sniffer_ddr u_ddr
(
    // Inputs
     .clk100_i(clk100_buffered_w)
    ,.clk200_i(clk1)
    ,.inport_awvalid_i(axi_awvalid_w)
    ,.inport_awaddr_i(axi_awaddr_w)
    ,.inport_awid_i(axi_awid_w)
    ,.inport_awlen_i(axi_awlen_w)
    ,.inport_awburst_i(axi_awburst_w)
    ,.inport_wvalid_i(axi_wvalid_w)
    ,.inport_wdata_i(axi_wdata_w)
    ,.inport_wstrb_i(axi_wstrb_w)
    ,.inport_wlast_i(axi_wlast_w)
    ,.inport_bready_i(axi_bready_w)
    ,.inport_arvalid_i(axi_arvalid_w)
    ,.inport_araddr_i(axi_araddr_w)
    ,.inport_arid_i(axi_arid_w)
    ,.inport_arlen_i(axi_arlen_w)
    ,.inport_arburst_i(axi_arburst_w)
    ,.inport_rready_i(axi_rready_w)

    // Outputs
    ,.clk_out_o(clk_sys_w)
    ,.rst_out_o(rst_sys_w)
    ,.inport_awready_o(axi_awready_w)
    ,.inport_wready_o(axi_wready_w)
    ,.inport_bvalid_o(axi_bvalid_w)
    ,.inport_bresp_o(axi_bresp_w)
    ,.inport_bid_o(axi_bid_w)
    ,.inport_arready_o(axi_arready_w)
    ,.inport_rvalid_o(axi_rvalid_w)
    ,.inport_rdata_o(axi_rdata_w)
    ,.inport_rresp_o(axi_rresp_w)
    ,.inport_rid_o(axi_rid_w)
    ,.inport_rlast_o(axi_rlast_w)
    ,.ddr_ck_p_o(ddr3_ck_p)
    ,.ddr_ck_n_o(ddr3_ck_n)
    ,.ddr_cke_o(ddr3_cke)
    ,.ddr_reset_n_o(ddr3_reset_n)
    ,.ddr_ras_n_o(ddr3_ras_n)
    ,.ddr_cas_n_o(ddr3_cas_n)
    ,.ddr_we_n_o(ddr3_we_n)
    ,.ddr_ba_o(ddr3_ba)
    ,.ddr_addr_o(ddr3_addr)
    ,.ddr_odt_o(ddr3_odt)
    ,.ddr_dm_o(ddr3_dm)
    ,.ddr_dqs_p_io(ddr3_dqs_p)
    ,.ddr_dqs_n_io(ddr3_dqs_n)
    ,.ddr_data_io(ddr3_dq)
);

wire [31:0] ftdi_data_in_w;
wire [31:0] ftdi_data_out_w;
wire [3:0]  ftdi_be_in_w;
wire [3:0]  ftdi_be_out_w;

wire [31:0] gpio_out_w;

//-----------------------------------------------------------------
// SoC
//-----------------------------------------------------------------
fpga_soc
u_top
(
     .clk_ftdi_i(ftdi_clk)
    ,.clk_sys_i(clk_sys_w)
    ,.clk_usb_i(usb_clk_w)
    ,.rst_i(rst_sys_w)

    ,.ftdi_rxf_i(ftdi_rxf_n)
    ,.ftdi_txe_i(ftdi_txe_n)
    ,.ftdi_data_in_i(ftdi_data_in_w)
    ,.ftdi_be_in_i(ftdi_be_in_w)
    ,.ftdi_wrn_o(ftdi_wr_n)
    ,.ftdi_rdn_o(ftdi_rd_n)
    ,.ftdi_oen_o(ftdi_oe_n)
    ,.ftdi_data_out_o(ftdi_data_out_w)
    ,.ftdi_be_out_o(ftdi_be_out_w)

    ,.gpio_inputs_i(32'b0)
    ,.gpio_outputs_o(gpio_out_w)

    // DDR AXI
    ,.axi_awvalid_o(axi_awvalid_w)
    ,.axi_awaddr_o(axi_awaddr_w)
    ,.axi_awid_o(axi_awid_w)
    ,.axi_awlen_o(axi_awlen_w)
    ,.axi_awburst_o(axi_awburst_w)
    ,.axi_wvalid_o(axi_wvalid_w)
    ,.axi_wdata_o(axi_wdata_w)
    ,.axi_wstrb_o(axi_wstrb_w)
    ,.axi_wlast_o(axi_wlast_w)
    ,.axi_bready_o(axi_bready_w)
    ,.axi_arvalid_o(axi_arvalid_w)
    ,.axi_araddr_o(axi_araddr_w)
    ,.axi_arid_o(axi_arid_w)
    ,.axi_arlen_o(axi_arlen_w)
    ,.axi_arburst_o(axi_arburst_w)
    ,.axi_rready_o(axi_rready_w)    
    ,.axi_awready_i(axi_awready_w)
    ,.axi_wready_i(axi_wready_w)
    ,.axi_bvalid_i(axi_bvalid_w)
    ,.axi_bresp_i(axi_bresp_w)
    ,.axi_bid_i(axi_bid_w)
    ,.axi_arready_i(axi_arready_w)
    ,.axi_rvalid_i(axi_rvalid_w)
    ,.axi_rdata_i(axi_rdata_w)
    ,.axi_rresp_i(axi_rresp_w)
    ,.axi_rid_i(axi_rid_w)
    ,.axi_rlast_i(axi_rlast_w)

    // UTMI
    ,.utmi_data_out_i(utmi_data_out_w)
    ,.utmi_data_in_i(utmi_data_in_w)
    ,.utmi_txvalid_i(utmi_txvalid_w)
    ,.utmi_txready_i(utmi_txready_w)
    ,.utmi_rxvalid_i(utmi_rxvalid_w)
    ,.utmi_rxactive_i(utmi_rxactive_w)
    ,.utmi_rxerror_i(utmi_rxerror_w)
    ,.utmi_linestate_i(utmi_linestate_w)
    ,.utmi_op_mode_o(utmi_op_mode_w)
    ,.utmi_xcvrselect_o(utmi_xcvrselect_w)
    ,.utmi_termselect_o(utmi_termselect_w)
    ,.utmi_dppulldown_o(utmi_dppulldown_w)
    ,.utmi_dmpulldown_o(utmi_dmpulldown_w)
);

assign ftdi_rst       = ~rst_sys_w;
assign ftdi_siwua     = 1'b1;

assign ftdi_data_in_w = ftdi_data;
assign ftdi_data      = ftdi_oe_n ? ftdi_data_out_w : 32'hZZZZZZZZ;

assign ftdi_be_in_w   = ftdi_be;
assign ftdi_be        = ftdi_oe_n ? ftdi_be_out_w : 4'hZ;

assign {led0_r_o, led0_g_o, led0_b_o, led1_r_o, led1_g_o, led1_b_o} = ~gpio_out_w[5:0];

endmodule
