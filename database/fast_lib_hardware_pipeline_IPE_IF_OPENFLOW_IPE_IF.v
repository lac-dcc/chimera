// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

module IPE_IF(
clk,
ammc_clk,

card0_clk,
card1_clk,
card0_refclk,
card1_refclk,
reconfig_clk,
ue1_clk,
reset,

//XAUI
line0_xaui_rxdat,
line0_xaui_txdat,

line1_xaui_rxdat,
line1_xaui_txdat,

//gmii
slot0_gm_tx_clk,
slot0_gm_rx_clk,
slot0_gm_tx_d,
slot0_gm_tx_en,
slot0_gm_tx_err,
slot0_gm_rx_d,
slot0_gm_rx_dv,
slot0_gm_rx_err,

slot1_gm_tx_clk,
slot1_gm_rx_clk,
slot1_gm_tx_d,
slot1_gm_tx_en,
slot1_gm_tx_err,
slot1_gm_rx_d,
slot1_gm_rx_dv,
slot1_gm_rx_err,
//egress
in_egress_pkt_wr,
in_egress_pkt,
out_egress_pkt_almostfull,
in_egress_pkt_valid_wr,
in_egress_pkt_valid,

//ingress
out_ingress_pkt_wr,
out_ingress_pkt,
in_ingress_pkt_almostfull,
out_ingress_valid_wr,
out_ingress_valid,

slot0_port0_address,
slot0_port0_write,
slot0_port0_read,
slot0_port0_writedata,
slot0_port0_readdata,
slot0_port0_waitrequest,

slot0_port1_address,
slot0_port1_write,
slot0_port1_read,
slot0_port1_writedata,
slot0_port1_readdata,
slot0_port1_waitrequest,

slot0_port2_address,
slot0_port2_write,
slot0_port2_read,
slot0_port2_writedata,
slot0_port2_readdata,
slot0_port2_waitrequest,

slot0_port3_address,
slot0_port3_write,
slot0_port3_read,
slot0_port3_writedata,
slot0_port3_readdata,
slot0_port3_waitrequest,

slot0_port4_address,
slot0_port4_write,
slot0_port4_read,
slot0_port4_writedata,
slot0_port4_readdata,
slot0_port4_waitrequest,

slot1_port0_address,
slot1_port0_write,
slot1_port0_read,
slot1_port0_writedata,
slot1_port0_readdata,
slot1_port0_waitrequest,

slot1_port1_address,
slot1_port1_write,
slot1_port1_read,
slot1_port1_writedata,
slot1_port1_readdata,
slot1_port1_waitrequest,

slot1_port2_address,
slot1_port2_write,
slot1_port2_read,
slot1_port2_writedata,
slot1_port2_readdata,
slot1_port2_waitrequest,

slot1_port3_address,
slot1_port3_write,
slot1_port3_read,
slot1_port3_writedata,
slot1_port3_readdata,
slot1_port3_waitrequest,

slot1_port4_address,
slot1_port4_write,
slot1_port4_read,
slot1_port4_writedata,
slot1_port4_readdata,
slot1_port4_waitrequest,
//port count
slot0_port0_pkt_receive_add,
slot0_port0_pkt_discard_add,
slot0_port0_pkt_send_add,
slot0_port1_pkt_receive_add,
slot0_port1_pkt_discard_add,
slot0_port1_pkt_send_add,
slot0_port2_pkt_receive_add,
slot0_port2_pkt_discard_add,
slot0_port2_pkt_send_add,
slot0_port3_pkt_receive_add,
slot0_port3_pkt_discard_add,
slot0_port3_pkt_send_add,
slot0_port4_pkt_receive_add,
slot0_port4_pkt_discard_add,
slot0_port4_pkt_send_add,

slot1_port0_pkt_receive_add,
slot1_port0_pkt_discard_add,
slot1_port0_pkt_send_add,
slot1_port1_pkt_receive_add,
slot1_port1_pkt_discard_add,
slot1_port1_pkt_send_add,
slot1_port2_pkt_receive_add,
slot1_port2_pkt_discard_add,
slot1_port2_pkt_send_add,
slot1_port3_pkt_receive_add,
slot1_port3_pkt_discard_add,
slot1_port3_pkt_send_add,
slot1_port4_pkt_receive_add,
slot1_port4_pkt_discard_add,
slot1_port4_pkt_send_add,
//mux count
mux0_receive_pkt_add,
mux0_discard_error_pkt_add,
mux1_receive_pkt_add,
mux1_discard_error_pkt_add,
//dmux count
dmux0_receive_pkt_add,
dmux0_discard_error_pkt_add,
dmux0_send_port0_pkt_add,
dmux0_send_port1_pkt_add,
dmux0_send_port2_pkt_add,
dmux0_send_port3_pkt_add,
dmux0_send_port4_pkt_add,

dmux1_receive_pkt_add,
dmux1_discard_error_pkt_add,
dmux1_send_port0_pkt_add,
dmux1_send_port1_pkt_add,
dmux1_send_port2_pkt_add,
dmux1_send_port3_pkt_add,
dmux1_send_port4_pkt_add,

//input ctl  count
inputctl_receive_pkt_add,

output_receive_pkt_add,
output_discard_error_pkt_add,
output_send_slot0_pkt_add,
output_send_slot1_pkt_add);
input					clk;
input 				ammc_clk;
input 				card0_refclk;
input 				card1_refclk;
input 				reconfig_clk;
input 				card0_clk;
input 				card1_clk;
input					ue1_clk;
input					reset;

  //XAUI                       
input  	[3:0]  	line0_xaui_rxdat;
output 	[3:0]  	line0_xaui_txdat;

input  	[3:0]  	line1_xaui_rxdat;
output 	[3:0]  	line1_xaui_txdat;
//gmii
input 				slot0_gm_tx_clk;
input 				slot0_gm_rx_clk;
output 	[7:0]		slot0_gm_tx_d;
output 				slot0_gm_tx_en;
output 				slot0_gm_tx_err;
input 	[7:0]		slot0_gm_rx_d;
input 				slot0_gm_rx_dv;
input 				slot0_gm_rx_err;

input 				slot1_gm_tx_clk;
input 				slot1_gm_rx_clk;
output 	[7:0]		slot1_gm_tx_d;
output 				slot1_gm_tx_en;
output 				slot1_gm_tx_err;
input 	[7:0]		slot1_gm_rx_d;
input 				slot1_gm_rx_dv;
input 				slot1_gm_rx_err;

//egress
input 				in_egress_pkt_wr;
input 	[133:0] 	in_egress_pkt;
output 				out_egress_pkt_almostfull;
input 				in_egress_pkt_valid_wr;
input  				in_egress_pkt_valid;

//ingress
output 				out_ingress_pkt_wr;
output 	[133:0]	out_ingress_pkt;
input 				in_ingress_pkt_almostfull;
output 				out_ingress_valid_wr;
output 				out_ingress_valid;

input 	[7:0] 	slot0_port0_address;
input 				slot0_port0_write;
input 				slot0_port0_read;
input 	[31:0] 	slot0_port0_writedata;
output 	[31:0]	slot0_port0_readdata;
output 				slot0_port0_waitrequest;

input 	[7:0] 	slot0_port1_address;
input 				slot0_port1_write;
input 				slot0_port1_read;
input 	[31:0] 	slot0_port1_writedata;
output 	[31:0]	slot0_port1_readdata;
output 				slot0_port1_waitrequest;

input 	[7:0] 	slot0_port2_address;
input 				slot0_port2_write;
input 				slot0_port2_read;
input 	[31:0] 	slot0_port2_writedata;
output 	[31:0]	slot0_port2_readdata;
output 				slot0_port2_waitrequest;

input 	[7:0] 	slot0_port3_address;
input 				slot0_port3_write;
input 				slot0_port3_read;
input 	[31:0] 	slot0_port3_writedata;
output 	[31:0]	slot0_port3_readdata;
output 				slot0_port3_waitrequest;

input 	[7:0] 	slot0_port4_address;
input 				slot0_port4_write;
input 				slot0_port4_read;
input 	[31:0] 	slot0_port4_writedata;
output 	[31:0]	slot0_port4_readdata;
output 				slot0_port4_waitrequest;

input 	[7:0] 	slot1_port0_address;
input 				slot1_port0_write;
input 				slot1_port0_read;
input 	[31:0] 	slot1_port0_writedata;
output 	[31:0]	slot1_port0_readdata;
output 				slot1_port0_waitrequest;

input 	[7:0] 	slot1_port1_address;
input 				slot1_port1_write;
input 				slot1_port1_read;
input 	[31:0] 	slot1_port1_writedata;
output 	[31:0]	slot1_port1_readdata;
output 				slot1_port1_waitrequest;

input 	[7:0] 	slot1_port2_address;
input 				slot1_port2_write;
input 				slot1_port2_read;
input 	[31:0] 	slot1_port2_writedata;
output 	[31:0]	slot1_port2_readdata;
output 				slot1_port2_waitrequest;

input 	[7:0] 	slot1_port3_address;
input 				slot1_port3_write;
input 				slot1_port3_read;
input 	[31:0] 	slot1_port3_writedata;
output 	[31:0]	slot1_port3_readdata;
output 				slot1_port3_waitrequest;

input 	[7:0] 	slot1_port4_address;
input 				slot1_port4_write;
input 				slot1_port4_read;
input 	[31:0] 	slot1_port4_writedata;
output 	[31:0]	slot1_port4_readdata;
output 				slot1_port4_waitrequest;
//MAC
output				slot0_port0_pkt_receive_add;
output				slot0_port0_pkt_discard_add;
output				slot0_port0_pkt_send_add;
output				slot0_port1_pkt_receive_add;
output				slot0_port1_pkt_discard_add;
output				slot0_port1_pkt_send_add;
output				slot0_port2_pkt_receive_add;
output				slot0_port2_pkt_discard_add;
output				slot0_port2_pkt_send_add;
output				slot0_port3_pkt_receive_add;
output				slot0_port3_pkt_discard_add;
output				slot0_port3_pkt_send_add;
output				slot0_port4_pkt_receive_add;
output				slot0_port4_pkt_discard_add;
output				slot0_port4_pkt_send_add;

output				slot1_port0_pkt_receive_add;
output				slot1_port0_pkt_discard_add;
output				slot1_port0_pkt_send_add;
output				slot1_port1_pkt_receive_add;
output				slot1_port1_pkt_discard_add;
output				slot1_port1_pkt_send_add;
output				slot1_port2_pkt_receive_add;
output				slot1_port2_pkt_discard_add;
output				slot1_port2_pkt_send_add;
output				slot1_port3_pkt_receive_add;
output				slot1_port3_pkt_discard_add;
output				slot1_port3_pkt_send_add;
output				slot1_port4_pkt_receive_add;
output				slot1_port4_pkt_discard_add;
output				slot1_port4_pkt_send_add;

output				mux0_receive_pkt_add;
output				mux0_discard_error_pkt_add;
output				mux1_receive_pkt_add;
output				mux1_discard_error_pkt_add;

output				dmux0_receive_pkt_add;
output				dmux0_discard_error_pkt_add;
output				dmux0_send_port0_pkt_add;
output				dmux0_send_port1_pkt_add;
output				dmux0_send_port2_pkt_add;
output				dmux0_send_port3_pkt_add;
output				dmux0_send_port4_pkt_add;

output				dmux1_receive_pkt_add;
output				dmux1_discard_error_pkt_add;
output				dmux1_send_port0_pkt_add;
output				dmux1_send_port1_pkt_add;
output				dmux1_send_port2_pkt_add;
output				dmux1_send_port3_pkt_add;
output				dmux1_send_port4_pkt_add;


output				inputctl_receive_pkt_add;

output 				output_receive_pkt_add;
output				output_discard_error_pkt_add;
output 				output_send_slot0_pkt_add;
output 				output_send_slot1_pkt_add;

wire 					slot0_port0_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port0_out_mux_pkt;
wire 					slot0_port0_in_mux_pkt_almostfull;
wire 					slot0_port0_out_mux_pkt_valid_wr;
wire  				slot0_port0_out_mux_pkt_valid;

wire 					slot0_port0_in_dmux_pkt_wr;
wire 		[133:0] 	slot0_port0_in_dmux_pkt;
wire 					slot0_port0_out_dmux_pkt_almostfull;
wire 					slot0_port0_in_dmux_pkt_valid_wr;
wire  				slot0_port0_in_dmux_pkt_valid;

SGMII_PORT  SLOT0_SGMII_PORT0(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card0_clk),
.reset						(reset),

.out_pkt_wrreq				(slot0_port0_out_mux_pkt_wr),
.out_pkt						(slot0_port0_out_mux_pkt),
.out_pkt_almostfull		(slot0_port0_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot0_port0_out_mux_pkt_valid_wr),
.out_valid					(slot0_port0_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot0_port0_in_dmux_pkt_wr),
.out2_pkt					(slot0_port0_in_dmux_pkt),
.out2_pkt_almost_full	(slot0_port0_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot0_port0_in_dmux_pkt_valid_wr),
.out2_valid					(slot0_port0_in_dmux_pkt_valid),

.pkt_receive_add			(slot0_port0_pkt_receive_add),
.pkt_discard_add			(slot0_port0_pkt_discard_add),
.pkt_send_add				(slot0_port0_pkt_send_add),

.ref_clk						(card0_refclk),
.txp							(line0_xaui_txdat[0]),
.rxp							(line0_xaui_rxdat[0]),

.address						(slot0_port0_address),
.write						(slot0_port0_write),
.read							(slot0_port0_read),
.writedata					(slot0_port0_writedata),
.readdata					(slot0_port0_readdata),
.waitrequest				(slot0_port0_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot0_port1_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port1_out_mux_pkt;
wire 					slot0_port1_in_mux_pkt_almostfull;
wire 					slot0_port1_out_mux_pkt_valid_wr;
wire  				slot0_port1_out_mux_pkt_valid;

wire 					slot0_port1_in_dmux_pkt_wr;
wire 		[133:0] 	slot0_port1_in_dmux_pkt;
wire 					slot0_port1_out_dmux_pkt_almostfull;
wire 					slot0_port1_in_dmux_pkt_valid_wr;
wire  				slot0_port1_in_dmux_pkt_valid;

SGMII_PORT  SLOT0_SGMII_PORT1(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card0_clk),
.reset						(reset),

.out_pkt_wrreq				(slot0_port1_out_mux_pkt_wr),
.out_pkt						(slot0_port1_out_mux_pkt),
.out_pkt_almostfull		(slot0_port1_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot0_port1_out_mux_pkt_valid_wr),
.out_valid					(slot0_port1_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot0_port1_in_dmux_pkt_wr),
.out2_pkt					(slot0_port1_in_dmux_pkt),
.out2_pkt_almost_full	(slot0_port1_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot0_port1_in_dmux_pkt_valid_wr),
.out2_valid					(slot0_port1_in_dmux_pkt_valid),

.pkt_receive_add			(slot0_port1_pkt_receive_add),
.pkt_discard_add			(slot0_port1_pkt_discard_add),
.pkt_send_add				(slot0_port1_pkt_send_add),

.ref_clk						(card0_refclk),
.txp							(line0_xaui_txdat[1]),
.rxp							(line0_xaui_rxdat[1]),

.address						(slot0_port1_address),
.write						(slot0_port1_write),
.read							(slot0_port1_read),
.writedata					(slot0_port1_writedata),
.readdata					(slot0_port1_readdata),
.waitrequest				(slot0_port1_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot0_port2_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port2_out_mux_pkt;
wire 					slot0_port2_in_mux_pkt_almostfull;
wire 					slot0_port2_out_mux_pkt_valid_wr;
wire  				slot0_port2_out_mux_pkt_valid;

wire 					slot0_port2_in_dmux_pkt_wr;
wire 		[133:0] 	slot0_port2_in_dmux_pkt;
wire 					slot0_port2_out_dmux_pkt_almostfull;
wire 					slot0_port2_in_dmux_pkt_valid_wr;
wire  				slot0_port2_in_dmux_pkt_valid;

SGMII_PORT  SLOT0_SGMII_PORT2(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card0_clk),
.reset						(reset),

.out_pkt_wrreq				(slot0_port2_out_mux_pkt_wr),
.out_pkt						(slot0_port2_out_mux_pkt),
.out_pkt_almostfull		(slot0_port2_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot0_port2_out_mux_pkt_valid_wr),
.out_valid					(slot0_port2_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot0_port2_in_dmux_pkt_wr),
.out2_pkt					(slot0_port2_in_dmux_pkt),
.out2_pkt_almost_full	(slot0_port2_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot0_port2_in_dmux_pkt_valid_wr),
.out2_valid					(slot0_port2_in_dmux_pkt_valid),

.pkt_receive_add			(slot0_port2_pkt_receive_add),
.pkt_discard_add			(slot0_port2_pkt_discard_add),
.pkt_send_add				(slot0_port2_pkt_send_add),

.ref_clk						(card0_refclk),
.txp							(line0_xaui_txdat[2]),
.rxp							(line0_xaui_rxdat[2]),

.address						(slot0_port2_address),
.write						(slot0_port2_write),
.read							(slot0_port2_read),
.writedata					(slot0_port2_writedata),
.readdata					(slot0_port2_readdata),
.waitrequest				(slot0_port2_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot0_port3_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port3_out_mux_pkt;
wire 					slot0_port3_in_mux_pkt_almostfull;
wire 					slot0_port3_out_mux_pkt_valid_wr;
wire  				slot0_port3_out_mux_pkt_valid;

wire 					slot0_port3_in_dmux_pkt_wr;
wire 		[133:0] 	slot0_port3_in_dmux_pkt;
wire 					slot0_port3_out_dmux_pkt_almostfull;
wire 					slot0_port3_in_dmux_pkt_valid_wr;
wire  				slot0_port3_in_dmux_pkt_valid;

SGMII_PORT  SLOT0_SGMII_PORT3(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card0_clk),
.reset						(reset),

.out_pkt_wrreq				(slot0_port3_out_mux_pkt_wr),
.out_pkt						(slot0_port3_out_mux_pkt),
.out_pkt_almostfull		(slot0_port3_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot0_port3_out_mux_pkt_valid_wr),
.out_valid					(slot0_port3_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot0_port3_in_dmux_pkt_wr),
.out2_pkt					(slot0_port3_in_dmux_pkt),
.out2_pkt_almost_full	(slot0_port3_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot0_port3_in_dmux_pkt_valid_wr),
.out2_valid					(slot0_port3_in_dmux_pkt_valid),

.pkt_receive_add			(slot0_port3_pkt_receive_add),
.pkt_discard_add			(slot0_port3_pkt_discard_add),
.pkt_send_add				(slot0_port3_pkt_send_add),

.ref_clk						(card0_refclk),
.txp							(line0_xaui_txdat[3]),
.rxp							(line0_xaui_rxdat[3]),

.address						(slot0_port3_address),
.write						(slot0_port3_write),
.read							(slot0_port3_read),
.writedata					(slot0_port3_writedata),
.readdata					(slot0_port3_readdata),
.waitrequest				(slot0_port3_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot1_port0_out_mux_pkt_wr;
wire 		[133:0] 	slot1_port0_out_mux_pkt;
wire 					slot1_port0_in_mux_pkt_almostfull;
wire 					slot1_port0_out_mux_pkt_valid_wr;
wire  				slot1_port0_out_mux_pkt_valid;

wire 					slot1_port0_in_dmux_pkt_wr;
wire 		[133:0] 	slot1_port0_in_dmux_pkt;
wire 					slot1_port0_out_dmux_pkt_almostfull;
wire 					slot1_port0_in_dmux_pkt_valid_wr;
wire  				slot1_port0_in_dmux_pkt_valid;

SGMII_PORT  SLOT1_SGMII_PORT0(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot1_port0_out_mux_pkt_wr),
.out_pkt						(slot1_port0_out_mux_pkt),
.out_pkt_almostfull		(slot1_port0_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot1_port0_out_mux_pkt_valid_wr),
.out_valid					(slot1_port0_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot1_port0_in_dmux_pkt_wr),
.out2_pkt					(slot1_port0_in_dmux_pkt),
.out2_pkt_almost_full	(slot1_port0_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot1_port0_in_dmux_pkt_valid_wr),
.out2_valid					(slot1_port0_in_dmux_pkt_valid),

.pkt_receive_add			(slot1_port0_pkt_receive_add),
.pkt_discard_add			(slot1_port0_pkt_discard_add),
.pkt_send_add				(slot1_port0_pkt_send_add),

.ref_clk						(card1_refclk),
.txp							(line1_xaui_txdat[0]),
.rxp							(line1_xaui_rxdat[0]),

.address						(slot1_port0_address),
.write						(slot1_port0_write),
.read							(slot1_port0_read),
.writedata					(slot1_port0_writedata),
.readdata					(slot1_port0_readdata),
.waitrequest				(slot1_port0_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot1_port1_out_mux_pkt_wr;
wire 		[133:0] 	slot1_port1_out_mux_pkt;
wire 					slot1_port1_in_mux_pkt_almostfull;
wire 					slot1_port1_out_mux_pkt_valid_wr;
wire  				slot1_port1_out_mux_pkt_valid;

wire 					slot1_port1_in_dmux_pkt_wr;
wire 		[133:0] 	slot1_port1_in_dmux_pkt;
wire 					slot1_port1_out_dmux_pkt_almostfull;
wire 					slot1_port1_in_dmux_pkt_valid_wr;
wire  				slot1_port1_in_dmux_pkt_valid;

SGMII_PORT  SLOT1_SGMII_PORT1(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot1_port1_out_mux_pkt_wr),
.out_pkt						(slot1_port1_out_mux_pkt),
.out_pkt_almostfull		(slot1_port1_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot1_port1_out_mux_pkt_valid_wr),
.out_valid					(slot1_port1_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot1_port1_in_dmux_pkt_wr),
.out2_pkt					(slot1_port1_in_dmux_pkt),
.out2_pkt_almost_full	(slot1_port1_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot1_port1_in_dmux_pkt_valid_wr),
.out2_valid					(slot1_port1_in_dmux_pkt_valid),

.pkt_receive_add			(slot1_port1_pkt_receive_add),
.pkt_discard_add			(slot1_port1_pkt_discard_add),
.pkt_send_add				(slot1_port1_pkt_send_add),

.ref_clk						(card1_refclk),
.txp							(line1_xaui_txdat[1]),
.rxp							(line1_xaui_rxdat[1]),

.address						(slot1_port1_address),
.write						(slot1_port1_write),
.read							(slot1_port1_read),
.writedata					(slot1_port1_writedata),
.readdata					(slot1_port1_readdata),
.waitrequest				(slot1_port1_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot1_port2_out_mux_pkt_wr;
wire 		[133:0] 	slot1_port2_out_mux_pkt;
wire 					slot1_port2_in_mux_pkt_almostfull;
wire 					slot1_port2_out_mux_pkt_valid_wr;
wire  				slot1_port2_out_mux_pkt_valid;

wire 					slot1_port2_in_dmux_pkt_wr;
wire 		[133:0] 	slot1_port2_in_dmux_pkt;
wire 					slot1_port2_out_dmux_pkt_almostfull;
wire 					slot1_port2_in_dmux_pkt_valid_wr;
wire  				slot1_port2_in_dmux_pkt_valid;

SGMII_PORT  SLOT1_SGMII_PORT2(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot1_port2_out_mux_pkt_wr),
.out_pkt						(slot1_port2_out_mux_pkt),
.out_pkt_almostfull		(slot1_port2_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot1_port2_out_mux_pkt_valid_wr),
.out_valid					(slot1_port2_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot1_port2_in_dmux_pkt_wr),
.out2_pkt					(slot1_port2_in_dmux_pkt),
.out2_pkt_almost_full	(slot1_port2_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot1_port2_in_dmux_pkt_valid_wr),
.out2_valid					(slot1_port2_in_dmux_pkt_valid),

.pkt_receive_add			(slot1_port2_pkt_receive_add),
.pkt_discard_add			(slot1_port2_pkt_discard_add),
.pkt_send_add				(slot1_port2_pkt_send_add),

.ref_clk						(card1_refclk),
.txp							(line1_xaui_txdat[2]),
.rxp							(line1_xaui_rxdat[2]),

.address						(slot1_port2_address),
.write						(slot1_port2_write),
.read							(slot1_port2_read),
.writedata					(slot1_port2_writedata),
.readdata					(slot1_port2_readdata),
.waitrequest				(slot1_port2_waitrequest),
.reconfig_clk				(reconfig_clk));

wire 					slot1_port3_out_mux_pkt_wr;
wire 		[133:0] 	slot1_port3_out_mux_pkt;
wire 					slot1_port3_in_mux_pkt_almostfull;
wire 					slot1_port3_out_mux_pkt_valid_wr;
wire  				slot1_port3_out_mux_pkt_valid;

wire 					slot1_port3_in_dmux_pkt_wr;
wire 		[133:0] 	slot1_port3_in_dmux_pkt;
wire 					slot1_port3_out_dmux_pkt_almostfull;
wire 					slot1_port3_in_dmux_pkt_valid_wr;
wire  				slot1_port3_in_dmux_pkt_valid;

SGMII_PORT  SLOT1_SGMII_PORT3(  
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(card1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot1_port3_out_mux_pkt_wr),
.out_pkt						(slot1_port3_out_mux_pkt),
.out_pkt_almostfull		(slot1_port3_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot1_port3_out_mux_pkt_valid_wr),
.out_valid					(slot1_port3_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot1_port3_in_dmux_pkt_wr),
.out2_pkt					(slot1_port3_in_dmux_pkt),
.out2_pkt_almost_full	(slot1_port3_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot1_port3_in_dmux_pkt_valid_wr),
.out2_valid					(slot1_port3_in_dmux_pkt_valid),

.pkt_receive_add			(slot1_port3_pkt_receive_add),
.pkt_discard_add			(slot1_port3_pkt_discard_add),
.pkt_send_add				(slot1_port3_pkt_send_add),

.ref_clk						(card1_refclk),
.txp							(line1_xaui_txdat[3]),
.rxp							(line1_xaui_rxdat[3]),

.address						(slot1_port3_address),
.write						(slot1_port3_write),
.read							(slot1_port3_read),
.writedata					(slot1_port3_writedata),
.readdata					(slot1_port3_readdata),
.waitrequest				(slot1_port3_waitrequest),
.reconfig_clk				(reconfig_clk));//37.5Mhz ----50Mhz

wire 					slot0_port4_out_mux_pkt_wr;
wire 		[133:0] 	slot0_port4_out_mux_pkt;
wire 					slot0_port4_in_mux_pkt_almostfull;
wire 					slot0_port4_out_mux_pkt_valid_wr;
wire  				slot0_port4_out_mux_pkt_valid;

wire 					slot0_port4_in_dmux_pkt_wr;
wire 		[133:0] 	slot0_port4_in_dmux_pkt;
wire 					slot0_port4_out_dmux_pkt_almostfull;
wire 					slot0_port4_in_dmux_pkt_valid_wr;
wire  				slot0_port4_in_dmux_pkt_valid;

UE1_PORT	UE1_SLOT0_PORT(
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(ue1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot0_port4_out_mux_pkt_wr),
.out_pkt						(slot0_port4_out_mux_pkt),
.out_pkt_almostfull		(slot0_port4_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot0_port4_out_mux_pkt_valid_wr),
.out_valid					(slot0_port4_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot0_port4_in_dmux_pkt_wr),
.out2_pkt					(slot0_port4_in_dmux_pkt),
.out2_pkt_almost_full	(slot0_port4_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot0_port4_in_dmux_pkt_valid_wr),
.out2_valid					(slot0_port4_in_dmux_pkt_valid),

.pkt_receive_add			(slot0_port4_pkt_receive_add),
.pkt_discard_add			(slot0_port4_pkt_discard_add),
.pkt_send_add				(slot0_port4_pkt_send_add),

//gmii
.tx_clk						(slot0_gm_tx_clk),
.rx_clk						(slot0_gm_rx_clk),

.gm_tx_d						(slot0_gm_tx_d),
.gm_tx_en					(slot0_gm_tx_en),
.gm_tx_err					(slot0_gm_tx_err),

.gm_rx_d						(slot0_gm_rx_d),
.gm_rx_dv					(slot0_gm_rx_dv),
.gm_rx_err					(slot0_gm_rx_err),

.address						(slot0_port4_address),
.write						(slot0_port4_write),
.read							(slot0_port4_read),
.writedata					(slot0_port4_writedata),
.readdata					(slot0_port4_readdata),
.waitrequest				(slot0_port4_waitrequest));

UE1_PORT	UE1_SLOT1_PORT(
.clk							(clk),
.ammc_clk					(ammc_clk),
.sgmii_clk					(ue1_clk),
.reset						(reset),

.out_pkt_wrreq				(slot1_port4_out_mux_pkt_wr),
.out_pkt						(slot1_port4_out_mux_pkt),
.out_pkt_almostfull		(slot1_port4_in_mux_pkt_almostfull),
.out_valid_wrreq			(slot1_port4_out_mux_pkt_valid_wr),
.out_valid					(slot1_port4_out_mux_pkt_valid),

.out2_pkt_wrreq			(slot1_port4_in_dmux_pkt_wr),
.out2_pkt					(slot1_port4_in_dmux_pkt),
.out2_pkt_almost_full	(slot1_port4_out_dmux_pkt_almostfull),
.out2_valid_wrreq			(slot1_port4_in_dmux_pkt_valid_wr),
.out2_valid					(slot1_port4_in_dmux_pkt_valid),

.pkt_receive_add			(slot1_port4_pkt_receive_add),
.pkt_discard_add			(slot1_port4_pkt_discard_add),
.pkt_send_add				(slot1_port4_pkt_send_add),
//gmii
.tx_clk						(slot1_gm_tx_clk),
.rx_clk						(slot1_gm_rx_clk),

.gm_tx_d						(slot1_gm_tx_d),
.gm_tx_en					(slot1_gm_tx_en),
.gm_tx_err					(slot1_gm_tx_err),

.gm_rx_d						(slot1_gm_rx_d),
.gm_rx_dv					(slot1_gm_rx_dv),
.gm_rx_err					(slot1_gm_rx_err),

.address						(slot1_port4_address),
.write						(slot1_port4_write),
.read							(slot1_port4_read),
.writedata					(slot1_port4_writedata),
.readdata					(slot1_port4_readdata),
.waitrequest				(slot1_port4_waitrequest));

SGMII_DMUX Slot0_DMUX(
.clk								(clk),
.reset							(reset),
//xaul0
.out_xaui0_pkt_wr				(slot0_port0_in_dmux_pkt_wr),
.out_xaui0_pkt					(slot0_port0_in_dmux_pkt),
.in_xaui0_pkt_almostfull	(slot0_port0_out_dmux_pkt_almostfull),
.out_xaui0_pkt_valid_wr		(slot0_port0_in_dmux_pkt_valid_wr),
.out_xaui0_pkt_valid			(slot0_port0_in_dmux_pkt_valid),
//xaui1
.out_xaui1_pkt_wr				(slot0_port1_in_dmux_pkt_wr),
.out_xaui1_pkt					(slot0_port1_in_dmux_pkt),
.in_xaui1_pkt_almostfull	(slot0_port1_out_dmux_pkt_almostfull),
.out_xaui1_pkt_valid_wr		(slot0_port1_in_dmux_pkt_valid_wr),
.out_xaui1_pkt_valid			(slot0_port1_in_dmux_pkt_valid),
//xaui2
.out_xaui2_pkt_wr				(slot0_port2_in_dmux_pkt_wr),
.out_xaui2_pkt					(slot0_port2_in_dmux_pkt),
.in_xaui2_pkt_almostfull	(slot0_port2_out_dmux_pkt_almostfull),
.out_xaui2_pkt_valid_wr		(slot0_port2_in_dmux_pkt_valid_wr),
.out_xaui2_pkt_valid			(slot0_port2_in_dmux_pkt_valid),
//xaui3
.out_xaui3_pkt_wr				(slot0_port3_in_dmux_pkt_wr),
.out_xaui3_pkt					(slot0_port3_in_dmux_pkt),
.in_xaui3_pkt_almostfull	(slot0_port3_out_dmux_pkt_almostfull),
.out_xaui3_pkt_valid_wr		(slot0_port3_in_dmux_pkt_valid_wr),
.out_xaui3_pkt_valid			(slot0_port3_in_dmux_pkt_valid),
//xaul4
.out_xaui4_pkt_wr				(slot0_port4_in_dmux_pkt_wr),
.out_xaui4_pkt					(slot0_port4_in_dmux_pkt),
.in_xaui4_pkt_almostfull	(slot0_port4_out_dmux_pkt_almostfull),
.out_xaui4_pkt_valid_wr		(slot0_port4_in_dmux_pkt_valid_wr),
.out_xaui4_pkt_valid			(slot0_port4_in_dmux_pkt_valid),

//to NA
.in_egress_pkt_wr				(out_slot0_pkt_wr),
.in_egress_pkt					(out_slot0_pkt),
.out_egress_pkt_almostfull	(in_slot0_pkt_almostfull),
.in_egress_pkt_valid_wr		(out_slot0_pkt_valid_wr),
.in_egress_pkt_valid			(out_slot0_pkt_valid),

.dmux_receive_pkt_add			(dmux0_receive_pkt_add),
.dmux_discard_error_pkt_add	(dmux0_discard_error_pkt_add),
.dmux_send_port0_pkt_add		(dmux0_send_port0_pkt_add),
.dmux_send_port1_pkt_add		(dmux0_send_port1_pkt_add),
.dmux_send_port2_pkt_add		(dmux0_send_port2_pkt_add),
.dmux_send_port3_pkt_add		(dmux0_send_port3_pkt_add),
.dmux_send_port4_pkt_add		(dmux0_send_port4_pkt_add));

wire 					slot1_port4_in_dmux_pkt_wr;
wire 		[133:0] 	slot1_port4_in_dmux_pkt;
wire 					slot1_port4_out_dmux_pkt_almostfull;
wire 					slot1_port4_in_dmux_pkt_valid_wr;
wire  				slot1_port4_in_dmux_pkt_valid;
SGMII_DMUX Slot1_DMUX(
.clk								(clk),
.reset							(reset),
//xaul0
.out_xaui0_pkt_wr				(slot1_port0_in_dmux_pkt_wr),
.out_xaui0_pkt					(slot1_port0_in_dmux_pkt),
.in_xaui0_pkt_almostfull	(slot1_port0_out_dmux_pkt_almostfull),
.out_xaui0_pkt_valid_wr		(slot1_port0_in_dmux_pkt_valid_wr),
.out_xaui0_pkt_valid			(slot1_port0_in_dmux_pkt_valid),
//xaui1
.out_xaui1_pkt_wr				(slot1_port1_in_dmux_pkt_wr),
.out_xaui1_pkt					(slot1_port1_in_dmux_pkt),
.in_xaui1_pkt_almostfull	(slot1_port1_out_dmux_pkt_almostfull),
.out_xaui1_pkt_valid_wr		(slot1_port1_in_dmux_pkt_valid_wr),
.out_xaui1_pkt_valid			(slot1_port1_in_dmux_pkt_valid),
//xaui2
.out_xaui2_pkt_wr				(slot1_port2_in_dmux_pkt_wr),
.out_xaui2_pkt					(slot1_port2_in_dmux_pkt),
.in_xaui2_pkt_almostfull	(slot1_port2_out_dmux_pkt_almostfull),
.out_xaui2_pkt_valid_wr		(slot1_port2_in_dmux_pkt_valid_wr),
.out_xaui2_pkt_valid			(slot1_port2_in_dmux_pkt_valid),
//xaui3
.out_xaui3_pkt_wr				(slot1_port3_in_dmux_pkt_wr),
.out_xaui3_pkt					(slot1_port3_in_dmux_pkt),
.in_xaui3_pkt_almostfull	(slot1_port3_out_dmux_pkt_almostfull),
.out_xaui3_pkt_valid_wr		(slot1_port3_in_dmux_pkt_valid_wr),
.out_xaui3_pkt_valid			(slot1_port3_in_dmux_pkt_valid),
//xaul4
.out_xaui4_pkt_wr				(slot1_port4_in_dmux_pkt_wr),
.out_xaui4_pkt					(slot1_port4_in_dmux_pkt),
.in_xaui4_pkt_almostfull	(slot1_port4_out_dmux_pkt_almostfull),
.out_xaui4_pkt_valid_wr		(slot1_port4_in_dmux_pkt_valid_wr),
.out_xaui4_pkt_valid			(slot1_port4_in_dmux_pkt_valid),

//to NA
.in_egress_pkt_wr				(out_slot1_pkt_wr),
.in_egress_pkt					(out_slot1_pkt),
.out_egress_pkt_almostfull	(in_slot1_pkt_almostfull),
.in_egress_pkt_valid_wr		(out_slot1_pkt_valid_wr),
.in_egress_pkt_valid			(out_slot1_pkt_valid),

.dmux_receive_pkt_add			(dmux1_receive_pkt_add),
.dmux_discard_error_pkt_add	(dmux1_discard_error_pkt_add),
.dmux_send_port0_pkt_add		(dmux1_send_port0_pkt_add),
.dmux_send_port1_pkt_add		(dmux1_send_port1_pkt_add),
.dmux_send_port2_pkt_add		(dmux1_send_port2_pkt_add),
.dmux_send_port3_pkt_add		(dmux1_send_port3_pkt_add),
.dmux_send_port4_pkt_add		(dmux1_send_port4_pkt_add));

wire 					slot0_out_input_pkt_wr;
wire 		[133:0] 	slot0_out_input_pkt;
wire 					slot0_in_input_pkt_almostfull;
wire 					slot0_out_input_pkt_valid_wr;
wire  	[11:0]	slot0_out_input_pkt_valid;
SGMII_MUX slot0(
.clk								(clk),
.wrclk0							(card0_clk),
.wrclk1							(card0_clk),
.wrclk2							(card0_clk),
.wrclk3							(card0_clk),
.wrclk4							(ue1_clk),
.reset							(reset),
//xaul0
.in_xaui0_pkt_wrreq			(slot0_port0_out_mux_pkt_wr),
.in_xaui0_pkt					(slot0_port0_out_mux_pkt),
.out_xaui0_pkt_almostfull	(slot0_port0_in_mux_pkt_almostfull),
.in_xaui0_pkt_valid_wrreq	(slot0_port0_out_mux_pkt_valid_wr),
.in_xaui0_pkt_valid			(slot0_port0_out_mux_pkt_valid),

//xaui1
.in_xaui1_pkt_wrreq			(slot0_port1_out_mux_pkt_wr),
.in_xaui1_pkt					(slot0_port1_out_mux_pkt),
.out_xaui1_pkt_almostfull	(slot0_port1_in_mux_pkt_almostfull),
.in_xaui1_pkt_valid_wrreq	(slot0_port1_out_mux_pkt_valid_wr),
.in_xaui1_pkt_valid			(slot0_port1_out_mux_pkt_valid),
//xaul2
.in_xaui2_pkt_wrreq			(slot0_port2_out_mux_pkt_wr),
.in_xaui2_pkt					(slot0_port2_out_mux_pkt),
.out_xaui2_pkt_almostfull	(slot0_port2_in_mux_pkt_almostfull),
.in_xaui2_pkt_valid_wrreq	(slot0_port2_out_mux_pkt_valid_wr),
.in_xaui2_pkt_valid			(slot0_port2_out_mux_pkt_valid),

//xaui3
.in_xaui3_pkt_wrreq			(slot0_port3_out_mux_pkt_wr),
.in_xaui3_pkt					(slot0_port3_out_mux_pkt),
.out_xaui3_pkt_almostfull	(slot0_port3_in_mux_pkt_almostfull),
.in_xaui3_pkt_valid_wrreq	(slot0_port3_out_mux_pkt_valid_wr),
.in_xaui3_pkt_valid			(slot0_port3_out_mux_pkt_valid),

//xaui4
.in_xaui4_pkt_wrreq			(slot0_port4_out_mux_pkt_wr),
.in_xaui4_pkt					(slot0_port4_out_mux_pkt),
.out_xaui4_pkt_almostfull	(slot0_port4_in_mux_pkt_almostfull),
.in_xaui4_pkt_valid_wrreq	(slot0_port4_out_mux_pkt_valid_wr),
.in_xaui4_pkt_valid			(slot0_port4_out_mux_pkt_valid),
//to NA
.out_xaui_pkt_wrreq			(slot0_out_input_pkt_wr),
.out_xaui_pkt					(slot0_out_input_pkt),
.in_xaui_pkt_almostfull		(slot0_in_input_pkt_almostfull),
.out_xaui_pkt_valid_wrreq	(slot0_out_input_pkt_valid_wr),
.out_xaui_pkt_valid			(slot0_out_input_pkt_valid),

.pkt_inport0					(5'd0),
.pkt_inport1					(5'd1),
.pkt_inport2					(5'd2),
.pkt_inport3					(5'd3),
.pkt_inport4					(5'd4),
.slot_ID							(3'b000),
.card_ID							(),
.receive_pkt_add				(mux0_receive_pkt_add),
.discard_error_pkt_add		(mux0_discard_error_pkt_add));

wire 					slot1_port4_out_mux_pkt_wr;
wire 		[133:0] 	slot1_port4_out_mux_pkt;
wire 					slot1_port4_in_mux_pkt_almostfull;
wire 					slot1_port4_out_mux_pkt_valid_wr;
wire  				slot1_port4_out_mux_pkt_valid;

wire 					slot1_out_input_pkt_wr;
wire 		[133:0] 	slot1_out_input_pkt;
wire 					slot1_in_input_pkt_almostfull;
wire 					slot1_out_input_pkt_valid_wr;
wire  	[11:0]	slot1_out_input_pkt_valid;
SGMII_MUX slot1(
.clk								(clk),
.wrclk0							(card1_clk),
.wrclk1							(card1_clk),
.wrclk2							(card1_clk),
.wrclk3							(card1_clk),
.wrclk4							(ue1_clk),
.reset							(reset),
//xaul0
.in_xaui0_pkt_wrreq			(slot1_port0_out_mux_pkt_wr),
.in_xaui0_pkt					(slot1_port0_out_mux_pkt),
.out_xaui0_pkt_almostfull	(slot1_port0_in_mux_pkt_almostfull),
.in_xaui0_pkt_valid_wrreq	(slot1_port0_out_mux_pkt_valid_wr),
.in_xaui0_pkt_valid			(slot1_port0_out_mux_pkt_valid),

//xaui1
.in_xaui1_pkt_wrreq			(slot1_port1_out_mux_pkt_wr),
.in_xaui1_pkt					(slot1_port1_out_mux_pkt),
.out_xaui1_pkt_almostfull	(slot1_port1_in_mux_pkt_almostfull),
.in_xaui1_pkt_valid_wrreq	(slot1_port1_out_mux_pkt_valid_wr),
.in_xaui1_pkt_valid			(slot1_port1_out_mux_pkt_valid),
//xaul2
.in_xaui2_pkt_wrreq			(slot1_port2_out_mux_pkt_wr),
.in_xaui2_pkt					(slot1_port2_out_mux_pkt),
.out_xaui2_pkt_almostfull	(slot1_port2_in_mux_pkt_almostfull),
.in_xaui2_pkt_valid_wrreq	(slot1_port2_out_mux_pkt_valid_wr),
.in_xaui2_pkt_valid			(slot1_port2_out_mux_pkt_valid),

//xaui3
.in_xaui3_pkt_wrreq			(slot1_port3_out_mux_pkt_wr),
.in_xaui3_pkt					(slot1_port3_out_mux_pkt),
.out_xaui3_pkt_almostfull	(slot1_port3_in_mux_pkt_almostfull),
.in_xaui3_pkt_valid_wrreq	(slot1_port3_out_mux_pkt_valid_wr),
.in_xaui3_pkt_valid			(slot1_port3_out_mux_pkt_valid),

//xaui4
.in_xaui4_pkt_wrreq			(slot1_port4_out_mux_pkt_wr),
.in_xaui4_pkt					(slot1_port4_out_mux_pkt),
.out_xaui4_pkt_almostfull	(slot1_port4_in_mux_pkt_almostfull),
.in_xaui4_pkt_valid_wrreq	(slot1_port4_out_mux_pkt_valid_wr),
.in_xaui4_pkt_valid			(slot1_port4_out_mux_pkt_valid),
//to NA
.out_xaui_pkt_wrreq			(slot1_out_input_pkt_wr),
.out_xaui_pkt					(slot1_out_input_pkt),
.in_xaui_pkt_almostfull		(slot1_in_input_pkt_almostfull),
.out_xaui_pkt_valid_wrreq	(slot1_out_input_pkt_valid_wr),
.out_xaui_pkt_valid			(slot1_out_input_pkt_valid),

.pkt_inport0					(5'd0),
.pkt_inport1					(5'd1),
.pkt_inport2					(5'd2),
.pkt_inport3					(5'd3),
.pkt_inport4					(5'd4),
.slot_ID							(3'b001),
.card_ID							(),
.receive_pkt_add				(mux1_receive_pkt_add),
.discard_error_pkt_add		(mux1_discard_error_pkt_add));


INPUT_CTL INPUT_CTL(
.clk								(clk),
.reset							(reset),
//xaul0
.in_xaui0_pkt_wr				(slot0_out_input_pkt_wr),
.in_xaui0_pkt					(slot0_out_input_pkt),
.out_xaui0_pkt_almostfull	(slot0_in_input_pkt_almostfull),
.in_xaui0_pkt_valid_wr		(slot0_out_input_pkt_valid_wr),
.in_xaui0_pkt_valid			(slot0_out_input_pkt_valid),

//xaui1
.in_xaui1_pkt_wr				(slot1_out_input_pkt_wr),
.in_xaui1_pkt					(slot1_out_input_pkt),
.out_xaui1_pkt_almostfull	(slot1_in_input_pkt_almostfull),
.in_xaui1_pkt_valid_wr		(slot1_out_input_pkt_valid_wr),
.in_xaui1_pkt_valid			(slot1_out_input_pkt_valid),

//to NA
.out_xaui_pkt_wr				(out_ingress_pkt_wr),
.out_xaui_pkt					(out_ingress_pkt),
.in_xaui_pkt_almostfull		(in_ingress_pkt_almostfull),
.out_xaui_valid_wr			(out_ingress_valid_wr),
.out_xaui_valid				(out_ingress_valid),

.inputctl_receive_pkt_add	(inputctl_receive_pkt_add));

wire 					out_slot0_pkt_wr;
wire 		[133:0] 	out_slot0_pkt;
wire 					out_slot0_pkt_valid;
wire 					out_slot0_pkt_valid_wr;
wire  				in_slot0_pkt_almostfull;

wire 					out_slot1_pkt_wr;
wire 		[133:0] 	out_slot1_pkt;
wire 					out_slot1_pkt_valid;
wire 					out_slot1_pkt_valid_wr;
wire  				in_slot1_pkt_almostfull;


OUTPUT_CTL	OUTPUT_CTL(
.clk										(clk),
.reset									(reset),

.in_egress_pkt_wr						(in_egress_pkt_wr),
.in_egress_pkt							(in_egress_pkt),
.in_egress_pkt_valid_wr				(in_egress_pkt_valid_wr),
.in_egress_pkt_valid					(in_egress_pkt_valid),
.out_egress_pkt_almostfull			(out_egress_pkt_almostfull),

.out_slot0_pkt							(out_slot0_pkt),
.out_slot0_pkt_wr						(out_slot0_pkt_wr),
.out_slot0_pkt_valid					(out_slot0_pkt_valid),
.out_slot0_pkt_valid_wr				(out_slot0_pkt_valid_wr),
.in_slot0_pkt_almostfull			(in_slot0_pkt_almostfull),

.out_slot1_pkt							(out_slot1_pkt),
.out_slot1_pkt_wr						(out_slot1_pkt_wr),
.out_slot1_pkt_valid					(out_slot1_pkt_valid),
.out_slot1_pkt_valid_wr				(out_slot1_pkt_valid_wr),
.in_slot1_pkt_almostfull			(in_slot1_pkt_almostfull),

.output_receive_pkt_add				(output_receive_pkt_add),
.output_discard_error_pkt_add		(output_discard_error_pkt_add),
.output_send_slot0_pkt_add			(output_send_slot0_pkt_add),
.output_send_slot1_pkt_add			(output_send_slot1_pkt_add));
endmodule 