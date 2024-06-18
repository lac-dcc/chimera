// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

/*
NP verify card fpga;
et/mmmmm
*/

module nmp_cb08(
   FPGA_SYS_CLK,//125.00MHz

	R_SGMII_REFCLK,//125.00MHz
	
	FPGA_RESET_L,//SYS RESET
	//LED test
	SFP_ACTIVE_LED,
	SFP_LINK_LED,

	SGMII1_RX,
	SGMII1_TX,
	
	SGMII0_RX,
	SGMII0_TX,
	//I2C port
	I2C_CLK,
	I2C_SDA,
	//PCIE_L interface 
	pcie_l_rx,          //PCML14  //PCIe Receive Data-req's OCT
	pcie_l_tx,          //PCML14  //PCIe Transmit Data
	pcie_l_refclk      //HCSL    //PCIe Clock- Terminate on MB//100MHz
);
	
input FPGA_SYS_CLK;
input R_SGMII_REFCLK;

input FPGA_RESET_L;
	//LED test

output	[7:0]			SFP_ACTIVE_LED;
output	[7:0]			SFP_LINK_LED;

input  [3:0]	SGMII1_RX;
output [3:0]	SGMII1_TX;

input  [3:0]	SGMII0_RX;
output [3:0]	SGMII0_TX;
//I2C port
output			I2C_CLK;
inout	 [3:0]	I2C_SDA;

//PCI-Express--------------------------//25 pins //--------------------------
input  [7:0] pcie_l_rx;           	//PCML14  //PCIe Receive Data-req's OCT
output [7:0] pcie_l_tx;           	//PCML14  //PCIe Transmit Data
input pcie_l_refclk;       	//HCSL    //PCIe Clock- Terminate on MB

reg [7:0]SFP_ACTIVE_LED_REG;
reg [7:0]SFP_LINK_LED_REG;
assign SFP_ACTIVE_LED=SFP_ACTIVE_LED_REG;
assign SFP_LINK_LED=SFP_LINK_LED_REG;

wire 					app_clk;
wire 					card0_clk;
wire 					card1_clk;

wire 					ammc_clk;
wire 					reconfig_clk;

wire					ue_refclk;
wire					ue1_clk;
wire 					spi_refclk;

/***************************************************************/
reg [15:0] reset_count; 
reg cnt_reset;

/***************************************************************/
CLK_MANAGE CLK_MANAGE(
//--------------------------------input clk_ Manage Module-------------------------
.CLK_FPGA_REFCK				(FPGA_SYS_CLK),//125M
//--------------------------------genarate clk_ Manage Module-------------------------
.app_clk							(app_clk),//125M user clk
.reconfig_clk					(reconfig_clk),//ctrl reconfig clk 40M
.spi_refclk						(spi_refclk)
);

//*****************************************************************************/
wire 					slot0_port0_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port0_out_mux_pkt;
wire 					slot0_port0_in_mux_pkt_almostfull;
wire 					slot0_port0_out_mux_pkt_valid_wr;
wire  				slot0_port0_out_mux_pkt_valid;

//******************************************************************************/
wire 	[7:0] 	slot0_port0_address;
wire 				slot0_port0_write;
wire 				slot0_port0_read;
wire 	[31:0] 	slot0_port0_writedata;
wire 	[31:0]	slot0_port0_readdata;
wire 				slot0_port0_waitrequest;

wire 	[7:0] 	slot0_port1_address;
wire 				slot0_port1_write;
wire 				slot0_port1_read;
wire 	[31:0] 	slot0_port1_writedata;
wire 	[31:0]	slot0_port1_readdata;
wire 				slot0_port1_waitrequest;

wire 	[7:0] 	slot0_port2_address;
wire 				slot0_port2_write;
wire 				slot0_port2_read;
wire 	[31:0] 	slot0_port2_writedata;
wire 	[31:0]	slot0_port2_readdata;
wire 				slot0_port2_waitrequest;

wire 	[7:0] 	slot0_port3_address;
wire 				slot0_port3_write;
wire 				slot0_port3_read;
wire 	[31:0] 	slot0_port3_writedata;
wire 	[31:0]	slot0_port3_readdata;
wire 				slot0_port3_waitrequest;

wire 	[7:0] 	slot0_port4_address;
wire 				slot0_port4_write;
wire 				slot0_port4_read;
wire 	[31:0] 	slot0_port4_writedata;
wire 	[31:0]	slot0_port4_readdata;
wire 				slot0_port4_waitrequest;

wire 	[7:0] 	slot1_port0_address;
wire 				slot1_port0_write;
wire 				slot1_port0_read;
wire 	[31:0] 	slot1_port0_writedata;
wire 	[31:0]	slot1_port0_readdata;
wire 				slot1_port0_waitrequest;

wire 	[7:0] 	slot1_port1_address;
wire 				slot1_port1_write;
wire 				slot1_port1_read;
wire 	[31:0] 	slot1_port1_writedata;
wire 	[31:0]	slot1_port1_readdata;
wire 				slot1_port1_waitrequest;

wire 	[7:0] 	slot1_port2_address;
wire 				slot1_port2_write;
wire 				slot1_port2_read;
wire 	[31:0] 	slot1_port2_writedata;
wire 	[31:0]	slot1_port2_readdata;
wire 				slot1_port2_waitrequest;

wire 	[7:0] 	slot1_port3_address;
wire 				slot1_port3_write;
wire 				slot1_port3_read;
wire 	[31:0] 	slot1_port3_writedata;
wire 	[31:0]	slot1_port3_readdata;
wire 				slot1_port3_waitrequest;

wire 	[7:0] 	slot1_port4_address;
wire 				slot1_port4_write;
wire 				slot1_port4_read;
wire 	[31:0] 	slot1_port4_writedata;
wire 	[31:0]	slot1_port4_readdata;
wire 				slot1_port4_waitrequest;

wire 				in_egress_pkt_wr;
wire 	[133:0] 	in_egress_pkt;
wire 				out_egress_pkt_almostfull;
wire 				in_egress_pkt_valid_wr;
wire  			in_egress_pkt_valid;

UM UM(
.clk(app_clk),
.rst_n(reset_rn),
    
.sys_max_cpuid(sys_ctl_reg[5:0]),
//cdp
.cdp2um_data_wr(if_to_um_pkt_wr),
.cdp2um_data(if_to_um_pkt),
.cdp2um_valid_wr(if_to_um_pkt_valid_wr),
.cdp2um_valid(if_to_um_pkt_valid),
.um2cdp_alf(if_to_um_pkt_almful),

.um2cdp_data_wr(um_to_if_pkt_wr),
.um2cdp_data(um_to_if_pkt),
.um2cdp_valid_wr(um_to_if_pkt_valid_wr),
.um2cdp_valid(um_to_if_pkt_valid),
.cdp2um_alf(um_to_if_pkt_almful),
//npe
.npe2um_data_wr(npe_to_um_pkt_wr),
.npe2um_data(npe_to_um_pkt),
.npe2um_valid_wr(npe_to_um_pkt_valid_wr),
.npe2um_valid(npe_to_um_pkt_valid),
.um2npe_alf(npe_to_um_pkt_almful),

.um2npe_data_wr(um_to_npe_pkt_wr),
.um2npe_data(um_to_npe_pkt),
.um2npe_valid_wr(um_to_npe_pkt_valid_wr),
.um2npe_valid(um_to_npe_pkt_valid),
.npe2um_alf(um_to_npe_pkt_almful),
//localbus
.localbus_cs_n(cs_n),
.localbus_rd_wr(rd_wr),
.localbus_data(data),
.localbus_ale(ale),
.localbus_ack_n(ack_n_um),
.localbus_data_out(rdata_um));
wire					ale;
wire					cs_n;
wire					rd_wr;
wire		[31:0]	data;
wire					ack_n_um;
wire	[31:0]		rdata_um;

wire	[64:0] 	command;
wire				command_wr;	
wire	[31:0]	data_out;	
loacal_sw	loacal_sw(
.clk							(app_clk),
.reset						(reset_rn),
.command						(command),
.command_wr					(command_wr),	
.data_out					(data_out),
.ale							(ale),
.cs_n							(cs_n),
.rd_wr						(rd_wr),
.data							(data),
.ack_n_um					(ack_n_um),
.rdata_um					(rdata_um));
		
wire	[133:0]	if_to_um_pkt;
wire			if_to_um_pkt_wr;
wire			if_to_um_pkt_valid;
wire			if_to_um_pkt_valid_wr;
wire			if_to_um_pkt_almful;	

wire	[133:0]	um_to_if_pkt;
wire			um_to_if_pkt_wr;
wire			um_to_if_pkt_valid;
wire			um_to_if_pkt_valid_wr;
wire			um_to_if_pkt_almful;	

wire	[133:0]	npe_to_um_pkt;
wire			npe_to_um_pkt_wr;
wire			npe_to_um_pkt_valid;
wire			npe_to_um_pkt_valid_wr;
wire			npe_to_um_pkt_almful;	

wire	[133:0]	um_to_npe_pkt;
wire			um_to_npe_pkt_wr;
wire			um_to_npe_pkt_valid;
wire			um_to_npe_pkt_valid_wr;
wire			um_to_npe_pkt_almful;	
IPE_IF IPE_IF(
.clk												(app_clk),
.ammc_clk										(app_clk),

.card0_clk										(app_clk),
.card1_clk										(app_clk),
.card0_refclk									(R_SGMII_REFCLK),
.card1_refclk									(R_SGMII_REFCLK),

.ue1_clk											(app_clk),
.reconfig_clk									(reconfig_clk),

.reset											(reset_rn),
//.reset											(cnt_reset),

.line0_xaui_rxdat								(SGMII0_RX),
.line0_xaui_txdat								(SGMII0_TX),
.line1_xaui_rxdat								(SGMII1_RX),
.line1_xaui_txdat								(SGMII1_TX),

//egress
.in_egress_pkt_wr								(um_to_if_pkt_wr),
.in_egress_pkt									(um_to_if_pkt),
.out_egress_pkt_almostfull					(um_to_if_pkt_almful),
.in_egress_pkt_valid_wr						(um_to_if_pkt_valid_wr),
.in_egress_pkt_valid							(um_to_if_pkt_valid),
//ingress
.out_ingress_pkt_wr							(if_to_um_pkt_wr),
.out_ingress_pkt								(if_to_um_pkt),
.in_ingress_pkt_almostfull					(if_to_um_pkt_almful),
.out_ingress_valid_wr						(if_to_um_pkt_valid_wr),
.out_ingress_valid							(if_to_um_pkt_valid),

.slot0_port0_address							(slot0_port0_address),
.slot0_port0_write							(slot0_port0_write),
.slot0_port0_read								(slot0_port0_read),
.slot0_port0_writedata						(slot0_port0_writedata),
.slot0_port0_readdata						(slot0_port0_readdata),
.slot0_port0_waitrequest					(slot0_port0_waitrequest),

.slot0_port1_address							(slot0_port1_address),
.slot0_port1_write							(slot0_port1_write),
.slot0_port1_read								(slot0_port1_read),
.slot0_port1_writedata						(slot0_port1_writedata),
.slot0_port1_readdata						(slot0_port1_readdata),
.slot0_port1_waitrequest					(slot0_port1_waitrequest),

.slot0_port2_address							(slot0_port2_address),
.slot0_port2_write							(slot0_port2_write),
.slot0_port2_read								(slot0_port2_read),
.slot0_port2_writedata						(slot0_port2_writedata),
.slot0_port2_readdata						(slot0_port2_readdata),
.slot0_port2_waitrequest					(slot0_port2_waitrequest),

.slot0_port3_address							(slot0_port3_address),
.slot0_port3_write							(slot0_port3_write),
.slot0_port3_read								(slot0_port3_read),
.slot0_port3_writedata						(slot0_port3_writedata),
.slot0_port3_readdata						(slot0_port3_readdata),
.slot0_port3_waitrequest					(slot0_port3_waitrequest),

.slot0_port4_address							(slot0_port4_address),
.slot0_port4_write							(slot0_port4_write),
.slot0_port4_read								(slot0_port4_read),
.slot0_port4_writedata						(slot0_port4_writedata),
.slot0_port4_readdata						(slot0_port4_readdata),
.slot0_port4_waitrequest					(slot0_port4_waitrequest),

.slot1_port0_address							(slot1_port0_address),
.slot1_port0_write							(slot1_port0_write),
.slot1_port0_read								(slot1_port0_read),
.slot1_port0_writedata						(slot1_port0_writedata),
.slot1_port0_readdata						(slot1_port0_readdata),
.slot1_port0_waitrequest					(slot1_port0_waitrequest),

.slot1_port1_address							(slot1_port1_address),
.slot1_port1_write							(slot1_port1_write),
.slot1_port1_read								(slot1_port1_read),
.slot1_port1_writedata						(slot1_port1_writedata),
.slot1_port1_readdata						(slot1_port1_readdata),
.slot1_port1_waitrequest					(slot1_port1_waitrequest),

.slot1_port2_address							(slot1_port2_address),
.slot1_port2_write							(slot1_port2_write),
.slot1_port2_read								(slot1_port2_read),
.slot1_port2_writedata						(slot1_port2_writedata),
.slot1_port2_readdata						(slot1_port2_readdata),
.slot1_port2_waitrequest					(slot1_port2_waitrequest),

.slot1_port3_address							(slot1_port3_address),
.slot1_port3_write							(slot1_port3_write),
.slot1_port3_read								(slot1_port3_read),
.slot1_port3_writedata						(slot1_port3_writedata),
.slot1_port3_readdata						(slot1_port3_readdata),
.slot1_port3_waitrequest					(slot1_port3_waitrequest),

.slot1_port4_address							(slot1_port4_address),
.slot1_port4_write							(slot1_port4_write),
.slot1_port4_read								(slot1_port4_read),
.slot1_port4_writedata						(slot1_port4_writedata),
.slot1_port4_readdata						(slot1_port4_readdata),
.slot1_port4_waitrequest					(slot1_port4_waitrequest),
//port count
.slot0_port0_pkt_receive_add				(slot0_port0_pkt_receive_add),
.slot0_port0_pkt_discard_add				(slot0_port0_pkt_discard_add),
.slot0_port0_pkt_send_add					(slot0_port0_pkt_send_add),
.slot0_port1_pkt_receive_add				(slot0_port1_pkt_receive_add),
.slot0_port1_pkt_discard_add				(slot0_port1_pkt_discard_add),
.slot0_port1_pkt_send_add					(slot0_port1_pkt_send_add),
.slot0_port2_pkt_receive_add				(slot0_port2_pkt_receive_add),
.slot0_port2_pkt_discard_add				(slot0_port2_pkt_discard_add),
.slot0_port2_pkt_send_add					(slot0_port2_pkt_send_add),
.slot0_port3_pkt_receive_add				(slot0_port3_pkt_receive_add),
.slot0_port3_pkt_discard_add				(slot0_port3_pkt_discard_add),
.slot0_port3_pkt_send_add					(slot0_port3_pkt_send_add),
.slot0_port4_pkt_receive_add				(slot0_port4_pkt_receive_add),
.slot0_port4_pkt_discard_add				(slot0_port4_pkt_discard_add),
.slot0_port4_pkt_send_add					(slot0_port4_pkt_send_add),

.slot1_port0_pkt_receive_add				(slot1_port0_pkt_receive_add),
.slot1_port0_pkt_discard_add				(slot1_port0_pkt_discard_add),
.slot1_port0_pkt_send_add					(slot1_port0_pkt_send_add),
.slot1_port1_pkt_receive_add				(slot1_port1_pkt_receive_add),
.slot1_port1_pkt_discard_add				(slot1_port1_pkt_discard_add),
.slot1_port1_pkt_send_add					(slot1_port1_pkt_send_add),
.slot1_port2_pkt_receive_add				(slot1_port2_pkt_receive_add),
.slot1_port2_pkt_discard_add				(slot1_port2_pkt_discard_add),
.slot1_port2_pkt_send_add					(slot1_port2_pkt_send_add),
.slot1_port3_pkt_receive_add				(slot1_port3_pkt_receive_add),
.slot1_port3_pkt_discard_add				(slot1_port3_pkt_discard_add),
.slot1_port3_pkt_send_add					(slot1_port3_pkt_send_add),
.slot1_port4_pkt_receive_add				(slot1_port4_pkt_receive_add),
.slot1_port4_pkt_discard_add				(slot1_port4_pkt_discard_add),
.slot1_port4_pkt_send_add					(slot1_port4_pkt_send_add),
//mux count
.mux0_receive_pkt_add						(mux0_receive_pkt_add),
.mux0_discard_error_pkt_add				(mux0_discard_error_pkt_add),
.mux1_receive_pkt_add						(mux1_receive_pkt_add),
.mux1_discard_error_pkt_add				(mux1_discard_error_pkt_add),
//dmux count
.dmux0_receive_pkt_add						(dmux0_receive_pkt_add),
.dmux0_discard_error_pkt_add				(dmux0_discard_error_pkt_add),
.dmux0_send_port0_pkt_add					(dmux0_send_port0_pkt_add),
.dmux0_send_port1_pkt_add					(dmux0_send_port1_pkt_add),
.dmux0_send_port2_pkt_add					(dmux0_send_port2_pkt_add),
.dmux0_send_port3_pkt_add					(dmux0_send_port3_pkt_add),
.dmux0_send_port4_pkt_add					(dmux0_send_port4_pkt_add),

.dmux1_receive_pkt_add						(dmux1_receive_pkt_add),
.dmux1_discard_error_pkt_add				(dmux1_discard_error_pkt_add),
.dmux1_send_port0_pkt_add					(dmux1_send_port0_pkt_add),
.dmux1_send_port1_pkt_add					(dmux1_send_port1_pkt_add),
.dmux1_send_port2_pkt_add					(dmux1_send_port2_pkt_add),
.dmux1_send_port3_pkt_add					(dmux1_send_port3_pkt_add),
.dmux1_send_port4_pkt_add					(dmux1_send_port4_pkt_add),

//input ctl  count
.inputctl_receive_pkt_add					(inputctl_receive_pkt_add),

.output_receive_pkt_add						(output_receive_pkt_add),
.output_discard_error_pkt_add				(output_discard_error_pkt_add),
.output_send_slot0_pkt_add					(output_send_slot0_pkt_add),
.output_send_slot1_pkt_add					(output_send_slot1_pkt_add));


wire 					in_pcietx_pkt_wr;
wire [133:0] 		in_pcietx_pkt;
wire 					out_pcietx_pkt_almostfull;
wire 					in_pcietx_pkt_valid_wr;
wire  				in_pcietx_pkt_valid;

wire 					in_pcietx_des_wr;
wire [63:0] 		in_pcietx_des;

wire 					in_dispather_valid;
wire 					in_dispather_valid_wr;
wire [133:0] 		in_dispather_pkt;
wire 					in_dispather_pkt_wr;
wire 					out_dispather_pkt_almostfull;

wire [41:0] 		in_fpga_base_addr;
wire 					in_fpga_base_addr_wr;
wire [31:0]			in_fpga_virhead;

NPE_DMA NPE_DMA(
	.clk											(app_clk),
	.wrclk										(pcie_clk),
	.reset										(reset_rn),
//----------------------------------From Software---------------------------------	
	.in_fpga_channel_num						(sys_ctl_reg[5:0]),//RDMA will initial pkt chain by channel_num
	.in_fpga_virhead							(in_fpga_virhead),//vir addr head(),put in the front of vir addr body to form a vir addr 	
	.in_fpga_base_addr						(in_fpga_base_addr),
	.in_fpga_base_addr_wr					(in_fpga_base_addr_wr),
	.in_fpga_endian_flag						(sys_ctl_reg[14]),
//----------------------------------From PCIE RX---------------------------------	
	.out_pcierx_rdpkt_wr						(in_tdma_rdpkt_wr),
	.out_pcierx_rdpkt							(in_tdma_rdpkt),
	.in_pcierx_rdpkt_usedw					(out_tdma_rdpkt_usedw),
	
	.out_pcierx_pkt_wr						(in_rdma_pkt_wr),	
	.out_pcierx_pkt							(in_rdma_pkt),			
	.in_pcierx_pkt_almostfull				(out_rdma_pkt_almostfull),
	.out_pcierx_valid_wr						(in_rdma_valid_wr),
	.out_pcierx_valid							(in_rdma_valid),//valid will be sent after a pkt have send completed 
//----------------------------------From PCIE TX---------------------------------	
	.in_pcietx_des								(in_pcietx_des),
	.in_pcietx_des_wr							(in_pcietx_des_wr),
	
	.in_pcietx_pkt								(in_pcietx_pkt),
	.in_pcietx_pkt_wr							(in_pcietx_pkt_wr),
	.out_pcietx_pkt_almostfull				(out_pcietx_pkt_almostfull),
	.in_pcietx_valid							(in_pcietx_pkt_valid),
	.in_pcietx_valid_wr						(in_pcietx_pkt_valid_wr),
//----------------------------------From dispather---------------------------------	
	.in_dispather_valid						(in_dispather_valid),
	.in_dispather_valid_wr					(in_dispather_valid_wr),
	.in_dispather_pkt							(in_dispather_pkt),
	.in_dispather_pkt_wr						(in_dispather_pkt_wr),
	.out_dispather_pkt_almostfull			(out_dispather_pkt_almostfull),
	
	.out_egress_pkt							(in_tdma_pkt), 
	.out_egress_pkt_wr						(in_tdma_pkt_wr),
	.in_egress_pkt_almostfull				(out_tdma_pkt_almostfull),
	.out_egress_valid							(in_tdma_valid),
	.out_egress_valid_wr						(in_tdma_valid_wr),
//---------------------------------- To COUNT---------------------------------
	.cpuid_process_desc_add					(cpuid_process_desc_add),//201312241134
	.cpuid_receive_pkt_add					(cpuid_receive_pkt_add),//201312241134
	.cpuid_softaddr_add						(cpuid_softaddr_add),//201403101619
	.tdma_receive_pcietx_desc_add			(tdma_receive_pcietx_desc_add),
	.tdma_receive_generate_desc_add		(tdma_receive_generate_desc_add),
	.tdma_discard_desc_add					(tdma_discard_desc_add),
	.tdma_discard_overload_add				(tdma_discard_overload_add),
	.tdma_recycle_index_add					(tdma_recycle_index_add),
	.rdma_receive_pkt_add					(rdma_receive_pkt_add),
	.rdma_receive_addr_add					(rdma_receive_addr_add)
);


wire 					reset_rn;
wire [3:0] 			lane_act;

wire 					pcie_clk;

wire [133:0] 		in_tdma_rdpkt;
wire 					in_tdma_rdpkt_wr;
wire [10:0] 			out_tdma_rdpkt_usedw;

wire [133:0]		in_rdma_pkt;
wire 					in_rdma_pkt_wr;
wire 					out_rdma_pkt_almostfull;
wire 					in_rdma_valid;
wire 					in_rdma_valid_wr;

NPE_PCIE NPE_PCIE(
.npor                               (FPGA_RESET_L),
.reset_rn									(reset_rn),
.reset_reg									(reset_reg),
.pld_clk										(pcie_clk),
.app_clk										(app_clk),
.refclk										(pcie_l_refclk),
.rx_in										(pcie_l_rx),
.lane_act									(lane_act),
.tx_out										(pcie_l_tx),	
				 
.tag_sent									(sys_ctl_reg[11:6]),
.rdpkt_limit								(rdpkt_limit),
.in_rdma_pkt								(in_rdma_pkt),    
.in_rdma_pkt_wr							(in_rdma_pkt_wr),
.in_rdma_valid_wr							(in_rdma_valid_wr),
.in_rdma_valid								(in_rdma_valid),
.out_rdma_pkt_almostfull				(out_rdma_pkt_almostfull),


.in_tdma_rdpkt								(in_tdma_rdpkt),
.in_tdma_rdpkt_wr							(in_tdma_rdpkt_wr),
.out_tdma_rdpkt_usedw					(out_tdma_rdpkt_usedw),

.out_tdma_des_wr							(in_pcietx_des_wr),
.out_tdma_des								(in_pcietx_des),	

.localbus_out								(localbus_out),//lxj1011
.localbus_out_wr							(localbus_out_wr),//lxj1011
.localbus_in								(localbus_in),//lxj1011
.localbus_in_wr							(localbus_in_wr),//lxj1011	 


.out_tdma_pkt_wr							(in_pcietx_pkt_wr),
.out_tdma_pkt								(in_pcietx_pkt),
.in_tdma_pkt_almostfull					(out_pcietx_pkt_almostfull),
.out_tdma_valid							(in_pcietx_pkt_valid),
.out_tdma_valid_wr						(in_pcietx_pkt_valid_wr),

.pcierx_receive_pktrdrequest_add		(pcierx_receive_pktrdrequest_add),
.pcierx_receive_memrequest_add		(pcierx_receive_memrequest_add),
.pcietx_receive_memrequest_add		(pcietx_receive_memrequest_add),
.pcietx_receive_completion_pkt_add	(pcietx_receive_completion_pkt_add),
.pcietx_storage_pkt_add					(pcietx_storage_pkt_add),
.pcietx_sent_pkt_add						(pcietx_sent_pkt_add),
.pcietx_receive_zeroindex_add (pcietx_receive_zeroindex_add),
.pcie_test (pcietx_test)
);

wire pcietx_receive_zeroindex_add;
wire pcietx_test;

wire 				in_inputctrl_pkt_wr;
wire 	[133:0]	in_inputctrl_pkt;
wire 				out_inputctrl_pkt_almostfull;
wire 				in_inputctrl_valid_wr;
wire 				in_inputctrl_valid;

wire [133:0] 	in_tdma_pkt;
wire 				in_tdma_pkt_wr;
wire 				out_tdma_pkt_almostfull;
wire 				in_tdma_valid;
wire 				in_tdma_valid_wr;

IPE_PPS IPE_PPS(
.clk										(app_clk),
.reset									(reset_rn),
//.reset											(cnt_reset),

.in_fpgaac_channel_num				(sys_ctl_reg[5:0]),
.in_fpgaac_cpuid_cs					(sys_ctl_reg[15]),
.cpuid_valid					(32'hFFFFFFFF),
.out_rdma_pkt_wr						(in_dispather_pkt_wr),
.out_rdma_pkt							(in_dispather_pkt),
.out_rdma_valid_wr					(in_dispather_valid_wr),
.out_rdma_valid						(in_dispather_valid),
.in_rdma_pkt_almostfull				(out_dispather_pkt_almostfull),

.in_tdma_pkt_wr						(in_tdma_pkt_wr),
.in_tdma_pkt							(in_tdma_pkt),
.in_tdma_valid_wr						(in_tdma_valid_wr),
.in_tdma_valid							(in_tdma_valid),
.out_tdma_pkt_almostfull			(out_tdma_pkt_almostfull),

.in_inputctrl_pkt_wr					(um_to_npe_pkt_wr),
.in_inputctrl_pkt						(um_to_npe_pkt),
.in_inputctrl_valid_wr				(um_to_npe_pkt_valid_wr),
.in_inputctrl_valid					(um_to_npe_pkt_valid),
.out_inputctrl_pkt_almostfull		(um_to_npe_pkt_almful),

.out_outputctrl_pkt_wr				(npe_to_um_pkt_wr),
.out_outputctrl_pkt					(npe_to_um_pkt),
.out_outputctrl_valid_wr			(npe_to_um_pkt_valid_wr),
.out_outputctrl_valid				(npe_to_um_pkt_valid),
.in_outputctrl_pkt_almostfull		(npe_to_um_pkt_almful)
/*
.in_inputctrl_pkt_wr					(),
.in_inputctrl_pkt						(),
.in_inputctrl_valid_wr				(),
.in_inputctrl_valid					(),
.out_inputctrl_pkt_almostfull		(),

.out_outputctrl_pkt_wr				(um_to_npe_pkt_wr),
.out_outputctrl_pkt					(um_to_npe_pkt),
.out_outputctrl_valid_wr			(um_to_npe_pkt_valid_wr),
.out_outputctrl_valid				(um_to_npe_pkt_valid),
.in_outputctrl_pkt_almostfull		(um_to_npe_pkt_almful)
*/
);


wire 				reset_reg;
wire			  	in_ramwr_iace_rd_wr;
wire  [127:0]	in_ramwr_iace_data;
wire  [20:0] 	in_ramwr_iace_addr;

wire 	[127:0]	out_ramwr_iace_rd_data;
wire 		  		in_ramwr_iace_cs_n;
wire 		  		out_ramwr_iace_rd_ack_n;	

wire 	[92:0] 	localbus_out;//lxj1011
wire 				localbus_out_wr;//lxj1011
wire 	[92:0] 	localbus_in;//lxj1011
wire 				localbus_in_wr;//lxj1011

wire	[15:0]	sys_ctl_reg;	
wire	[31:0]	cpuid_valid;
//MAC
wire				slot0_port0_pkt_receive_add;
wire				slot0_port0_pkt_discard_add;
wire				slot0_port0_pkt_send_add;
wire				slot0_port1_pkt_receive_add;
wire				slot0_port1_pkt_discard_add;
wire				slot0_port1_pkt_send_add;
wire				slot0_port2_pkt_receive_add;
wire				slot0_port2_pkt_discard_add;
wire				slot0_port2_pkt_send_add;
wire				slot0_port3_pkt_receive_add;
wire				slot0_port3_pkt_discard_add;
wire				slot0_port3_pkt_send_add;
wire				slot0_port4_pkt_receive_add;
wire				slot0_port4_pkt_discard_add;
wire				slot0_port4_pkt_send_add;

wire				slot1_port0_pkt_receive_add;
wire				slot1_port0_pkt_discard_add;
wire				slot1_port0_pkt_send_add;
wire				slot1_port1_pkt_receive_add;
wire				slot1_port1_pkt_discard_add;
wire				slot1_port1_pkt_send_add;
wire				slot1_port2_pkt_receive_add;
wire				slot1_port2_pkt_discard_add;
wire				slot1_port2_pkt_send_add;
wire				slot1_port3_pkt_receive_add;
wire				slot1_port3_pkt_discard_add;
wire				slot1_port3_pkt_send_add;
wire				slot1_port4_pkt_receive_add;
wire				slot1_port4_pkt_discard_add;
wire				slot1_port4_pkt_send_add;
//SYS clock field
wire [31:0] 		cpuid_process_desc_add;//201312241134
wire [31:0] 		cpuid_receive_pkt_add;//201312241134
wire [31:0] 		cpuid_softaddr_add;//201403101619
wire				tdma_receive_pcietx_desc_add;
wire				tdma_receive_generate_desc_add;
wire				tdma_discard_desc_add;
wire				tdma_discard_overload_add;
wire				tdma_recycle_index_add;
wire				rdma_receive_pkt_add;
wire				rdma_receive_addr_add;

wire				mux0_receive_pkt_add;
wire				mux0_discard_error_pkt_add;
wire				mux1_receive_pkt_add;
wire				mux1_discard_error_pkt_add;
wire				dmux0_receive_pkt_add;
wire				dmux0_discard_error_pkt_add;
wire				dmux0_send_port0_pkt_add;
wire				dmux0_send_port1_pkt_add;
wire				dmux0_send_port2_pkt_add;
wire				dmux0_send_port3_pkt_add;
wire				dmux0_send_port4_pkt_add;

wire				dmux1_receive_pkt_add;
wire				dmux1_discard_error_pkt_add;
wire				dmux1_send_port0_pkt_add;
wire				dmux1_send_port1_pkt_add;
wire				dmux1_send_port2_pkt_add;
wire				dmux1_send_port3_pkt_add;
wire				dmux1_send_port4_pkt_add;

wire				inputctl_receive_pkt_add;

wire 				output_receive_pkt_add;
wire				output_discard_error_pkt_add;
wire  			output_send_slot0_pkt_add;
wire  			output_send_slot1_pkt_add;
//pcie clock field
wire				pcierx_receive_pktrdrequest_add;
wire				pcierx_receive_memrequest_add;
wire				pcietx_receive_memrequest_add;
wire				pcietx_receive_completion_pkt_add;
wire				pcietx_storage_pkt_add;
wire				pcietx_sent_pkt_add;
wire   [31:0] card_inf;
wire 		[31:0]	rdpkt_limit;
//assign card_inf[3:0] =	CARD2_ID[3:0];
//assign card_inf[7:4] =	CARD1_ID[3:0];
//assign card_inf[31:8]	={4'h2,4'h0,4'h2,4'h3,4'h0,4'h0};//31:28
//assign card_inf[31:8]	={4'h1,4'h0,4'h2,4'h3,4'h1,4'h1};//31:28
assign card_inf[31:8]	={4'h3,4'h0,4'h2,4'h3,4'h1,4'h2};//31:28
NPE_CAB NPE_CAB(
.pcie_clk										(pcie_clk),
.reset											(reset_rn),
//.reset											(cnt_reset),
.app_clk											(app_clk),
.localbus_in									(localbus_in),
.localbus_in_wr								(localbus_in_wr),
.clk_mac											(app_clk),//there is a problem!!
.localbus_out									(localbus_out),
.localbus_out_wr								(localbus_out_wr),
//FPGA	CTL
.reset_reg										(reset_reg),
.sys_ctl_reg									(sys_ctl_reg),
.cpuid_valid									(cpuid_valid),
.dma_addr										(in_fpga_base_addr),
.dma_addr_wr									(in_fpga_base_addr_wr),
.virhead_reg									(in_fpga_virhead),
.card_inf										(card_inf),
.rdpkt_limit									(rdpkt_limit),
.command										(command),
.command_wr										(command_wr),
.data_out										(data_out),
.cab2burner_clk 								(I2C_CLK),//add the I2C clock
.cab2burner_data 								(I2C_SDA),//add the I2C data
//spi
.spi_refclk										(spi_refclk),
.slot0_spi_miso								(),		
.slot0_spi_mosi								(),	
.slot0_spi_clk									(),		
.slot0_spi_cs_n								(),

.slot1_spi_miso								(),		
.slot1_spi_mosi								(),	
.slot1_spi_clk									(),		
.slot1_spi_cs_n								(),
//MAC clock field
.slot0_port0_pkt_receive_add				(slot0_port0_pkt_receive_add),
.slot0_port0_pkt_discard_add				(slot0_port0_pkt_discard_add),
.slot0_port0_pkt_send_add					(slot0_port0_pkt_send_add),
.slot0_port1_pkt_receive_add				(slot0_port1_pkt_receive_add),
.slot0_port1_pkt_discard_add				(slot0_port1_pkt_discard_add),
.slot0_port1_pkt_send_add					(slot0_port1_pkt_send_add),
.slot0_port2_pkt_receive_add				(slot0_port2_pkt_receive_add),
.slot0_port2_pkt_discard_add				(slot0_port2_pkt_discard_add),
.slot0_port2_pkt_send_add					(slot0_port2_pkt_send_add),
.slot0_port3_pkt_receive_add				(slot0_port3_pkt_receive_add),
.slot0_port3_pkt_discard_add				(slot0_port3_pkt_discard_add),
.slot0_port3_pkt_send_add					(slot0_port3_pkt_send_add),
.slot0_port4_pkt_receive_add				(slot0_port4_pkt_receive_add),
.slot0_port4_pkt_discard_add				(slot0_port4_pkt_discard_add),
.slot0_port4_pkt_send_add					(slot0_port4_pkt_send_add),

.slot1_port0_pkt_receive_add				(slot1_port0_pkt_receive_add),
.slot1_port0_pkt_discard_add				(slot1_port0_pkt_discard_add),
.slot1_port0_pkt_send_add					(slot1_port0_pkt_send_add),
.slot1_port1_pkt_receive_add				(slot1_port1_pkt_receive_add),
.slot1_port1_pkt_discard_add				(slot1_port1_pkt_discard_add),
.slot1_port1_pkt_send_add					(slot1_port1_pkt_send_add),
.slot1_port2_pkt_receive_add				(slot1_port2_pkt_receive_add),
.slot1_port2_pkt_discard_add				(slot1_port2_pkt_discard_add),
.slot1_port2_pkt_send_add					(slot1_port2_pkt_send_add),
.slot1_port3_pkt_receive_add				(slot1_port3_pkt_receive_add),
.slot1_port3_pkt_discard_add				(slot1_port3_pkt_discard_add),
.slot1_port3_pkt_send_add					(slot1_port3_pkt_send_add),
.slot1_port4_pkt_receive_add				(slot1_port4_pkt_receive_add),
.slot1_port4_pkt_discard_add				(slot1_port4_pkt_discard_add),
.slot1_port4_pkt_send_add					(slot1_port4_pkt_send_add),

//SYS clock field
.cpuid_process_desc_add					(cpuid_process_desc_add),//201312241134
.cpuid_receive_pkt_add					(cpuid_receive_pkt_add),//201312241134
.cpuid_softaddr_add						(cpuid_softaddr_add),//201403101619
.tdma_receive_pcietx_desc_add				(tdma_receive_pcietx_desc_add),
.tdma_receive_generate_desc_add			(tdma_receive_generate_desc_add),
.tdma_discard_desc_add						(tdma_discard_desc_add),
.tdma_discard_overload_add					(tdma_discard_overload_add),
.tdma_recycle_index_add						(tdma_recycle_index_add),
.rdma_receive_pkt_add						(rdma_receive_pkt_add),
.rdma_receive_addr_add						(rdma_receive_addr_add),

.mux0_receive_pkt_add						(mux0_receive_pkt_add),
.mux0_discard_error_pkt_add				(mux0_discard_error_pkt_add),
.mux1_receive_pkt_add						(mux1_receive_pkt_add),
.mux1_discard_error_pkt_add				(mux1_discard_error_pkt_add),
.dmux0_receive_pkt_add						(dmux0_receive_pkt_add),
.dmux0_discard_error_pkt_add				(dmux0_discard_error_pkt_add),
.dmux0_send_port0_pkt_add					(dmux0_send_port0_pkt_add),
.dmux0_send_port1_pkt_add					(dmux0_send_port1_pkt_add),
.dmux0_send_port2_pkt_add					(dmux0_send_port2_pkt_add),
.dmux0_send_port3_pkt_add					(dmux0_send_port3_pkt_add),
.dmux0_send_port4_pkt_add					(dmux0_send_port4_pkt_add),

.dmux1_receive_pkt_add						(dmux1_receive_pkt_add),
.dmux1_discard_error_pkt_add				(dmux1_discard_error_pkt_add),
.dmux1_send_port0_pkt_add					(dmux1_send_port0_pkt_add),
.dmux1_send_port1_pkt_add					(dmux1_send_port1_pkt_add),
.dmux1_send_port2_pkt_add					(dmux1_send_port2_pkt_add),
.dmux1_send_port3_pkt_add					(dmux1_send_port3_pkt_add),
.dmux1_send_port4_pkt_add					(dmux1_send_port4_pkt_add),

.inputctl_receive_pkt_add					(inputctl_receive_pkt_add),

.output_receive_pkt_add						(output_receive_pkt_add),
.output_discard_error_pkt_add				(output_discard_error_pkt_add),
.output_send_slot0_pkt_add					(output_send_slot0_pkt_add),
.output_send_slot1_pkt_add					(output_send_slot1_pkt_add),
//pcie clock field
.pcierx_receive_pktrdrequest_add			(pcierx_receive_pktrdrequest_add),
.pcierx_receive_memrequest_add			(pcierx_receive_memrequest_add),
.pcietx_receive_memrequest_add			(pcietx_receive_memrequest_add),
.pcietx_receive_completion_pkt_add		(pcietx_receive_completion_pkt_add),
.pcietx_storage_pkt_add						(pcietx_storage_pkt_add),
.pcietx_sent_pkt_add							(pcietx_sent_pkt_add),
.pcietx_receive_zeroindex_add (pcietx_receive_zeroindex_add),
.pcietx_test (pcietx_test),
//avalon-MM
.ammc_clk											(app_clk),

.address0										(slot0_port0_address),
.write0											(slot0_port0_write),
.read0											(slot0_port0_read),
.writedata0										(slot0_port0_writedata),
.readdata0										(slot0_port0_readdata),
.waitrequest0									(slot0_port0_waitrequest),

.address1										(slot0_port1_address),
.write1											(slot0_port1_write),
.read1											(slot0_port1_read),
.writedata1										(slot0_port1_writedata),
.readdata1										(slot0_port1_readdata),
.waitrequest1									(slot0_port1_waitrequest),

.address2										(slot0_port2_address),
.write2											(slot0_port2_write),
.read2											(slot0_port2_read),
.writedata2										(slot0_port2_writedata),
.readdata2										(slot0_port2_readdata),
.waitrequest2									(slot0_port2_waitrequest),

.address3										(slot0_port3_address),
.write3											(slot0_port3_write),
.read3											(slot0_port3_read),
.writedata3										(slot0_port3_writedata),
.readdata3										(slot0_port3_readdata),
.waitrequest3									(slot0_port3_waitrequest),

.address4										(slot0_port4_address),
.write4											(slot0_port4_write),
.read4											(slot0_port4_read),
.writedata4										(slot0_port4_writedata),
.readdata4										(slot0_port4_readdata),
.waitrequest4									(slot0_port4_waitrequest),

.address5										(slot1_port0_address),
.write5											(slot1_port0_write),
.read5											(slot1_port0_read),
.writedata5										(slot1_port0_writedata),
.readdata5										(slot1_port0_readdata),
.waitrequest5									(slot1_port0_waitrequest),

.address6										(slot1_port1_address),
.write6											(slot1_port1_write),
.read6											(slot1_port1_read),
.writedata6										(slot1_port1_writedata),
.readdata6										(slot1_port1_readdata),
.waitrequest6									(slot1_port1_waitrequest),

.address7										(slot1_port2_address),
.write7											(slot1_port2_write),
.read7											(slot1_port2_read),
.writedata7										(slot1_port2_writedata),
.readdata7										(slot1_port2_readdata),
.waitrequest7									(slot1_port2_waitrequest),

.address8										(slot1_port3_address),
.write8											(slot1_port3_write),
.read8											(slot1_port3_read),
.writedata8										(slot1_port3_writedata),
.readdata8										(slot1_port3_readdata),
.waitrequest8									(slot1_port3_waitrequest),

.address9										(slot1_port4_address),
.write9											(slot1_port4_write),
.read9											(slot1_port4_read),
.writedata9										(slot1_port4_writedata),
.readdata9										(slot1_port4_readdata),
.waitrequest9									(slot1_port4_waitrequest)
);

//*****************************************//
always@(posedge app_clk or negedge FPGA_RESET_L) begin
 if(!FPGA_RESET_L)begin 
    reset_count<=0;
	 cnt_reset<=1'b0;
	 SFP_ACTIVE_LED_REG<=8'b11111111;
	 SFP_LINK_LED_REG<=8'b11111111;
	 end 
 else begin 
	 if(reset_count==65535)begin
	    cnt_reset<=1'b1;
		 SFP_ACTIVE_LED_REG<=8'b00000000;
	    SFP_LINK_LED_REG<=8'b00000000;
	 end 
	 else begin
	     reset_count<=reset_count+1'b1;
		  cnt_reset<=1'b0;
	 
	 end 
	end
end 
//*****************************************//
endmodule
