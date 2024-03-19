module UE1_PORT(
clk,
ammc_clk,
reset,
//rx_clk,
sgmii_clk,

out_pkt_wrreq,
out_pkt,
out_valid_wrreq,
out_valid,
out_pkt_almostfull,

out2_pkt_wrreq,
out2_pkt,
out2_pkt_almost_full,
out2_valid_wrreq,
out2_valid,

pkt_receive_add,
pkt_discard_add,
pkt_send_add,
//gmii
tx_clk,
rx_clk,

gm_tx_d,
gm_tx_en,
gm_tx_err,

gm_rx_d,
gm_rx_dv,
gm_rx_err,	

address,
write,
read,
writedata,
readdata,
waitrequest);
input 			clk;

input          ammc_clk;
input         	sgmii_clk;

input 			reset;
input 			out2_pkt_wrreq;//output to port2;
input [133:0]	out2_pkt;
output 			out2_pkt_almost_full;
input 			out2_valid_wrreq;
input 			out2_valid;

output 			out_pkt_wrreq;
output [133:0]	out_pkt;
input 			out_pkt_almostfull;
output 			out_valid_wrreq;
output 			out_valid;

output			pkt_receive_add;
output			pkt_discard_add;
output			pkt_send_add;
//gmii
input				tx_clk;
input				rx_clk;

input	[7:0]		gm_rx_d;
input				gm_rx_dv;
input				gm_rx_err;

output	[7:0]	gm_tx_d;
output			gm_tx_en;
output			gm_tx_err;

//
input 	[7:0] address;
input 			write;
input 			read;
input 	[31:0] writedata;
output 	[31:0]readdata;
output 			waitrequest;

SGMII_TX1 SGMII_TX1(
.clk						(clk),
.reset					(reset),
.ff_tx_clk				(sgmii_clk),
.ff_tx_data				(ff_tx_data),
.ff_tx_sop				(ff_tx_sop),
.ff_tx_eop				(ff_tx_eop),
.ff_tx_err				(ff_tx_err),	
.ff_tx_wren				(ff_tx_wren),
.ff_tx_crc_fwd			(ff_tx_crc_fwd),
.tx_ff_uflow			(tx_ff_uflow),
.ff_tx_rdy				(ff_tx_rdy),
.ff_tx_septy			(ff_tx_septy),	
.ff_tx_a_full			(ff_tx_a_full),
.ff_tx_a_empty			(ff_tx_a_empty),
.pkt_send_add			(pkt_send_add),
.data_in_wrreq			(out2_pkt_wrreq),
.data_in					(out2_pkt),
.data_in_almostfull	(out2_pkt_almost_full),
.data_in_valid_wrreq	(out2_valid_wrreq),
.data_in_valid			(out2_valid)  );

SGMII_RX1 SGMII_RX1(
.reset					(reset),
.ff_rx_clk				(sgmii_clk),	
.ff_rx_rdy				(ff_rx_rdy),
.ff_rx_data				(ff_rx_data),
.ff_rx_sop				(ff_rx_sop),
.ff_rx_eop				(ff_rx_eop),
.rx_err					(rx_err),	
.rx_err_stat			(rx_err_stat),
.rx_frm_type			(rx_frm_type),
.ff_rx_dsav				(ff_rx_dsav),
.ff_rx_dval				(ff_rx_dval),
.ff_rx_a_full			(ff_rx_a_full),
.ff_rx_a_empty			(ff_rx_a_empty),

.pkt_receive_add		(pkt_receive_add),
.pkt_discard_add		(pkt_discard_add),

.out_pkt_wrreq			(out_pkt_wrreq),
.out_pkt					(out_pkt),
.out_pkt_almostfull	(out_pkt_almostfull),
.out_valid_wrreq		(out_valid_wrreq),
.out_valid				(out_valid)
);

wire					ff_tx_clk;
wire	[7:0]			ff_tx_data;
wire					ff_tx_sop;
wire					ff_tx_eop;
wire					ff_tx_err;	
wire					ff_tx_wren;
wire					ff_tx_crc_fwd;
wire					tx_ff_uflow;
wire					ff_tx_rdy;
wire					ff_tx_septy;	
wire					ff_tx_a_full;
wire					ff_tx_a_empty;

wire					reset;
wire					ff_rx_clk;
wire					ff_rx_rdy;
wire		[7:0]		ff_rx_data;
wire					ff_rx_sop;
wire					ff_rx_eop;
wire		[5:0]		rx_err;
wire		[17:0]	rx_err_stat;
wire		[3:0]		rx_frm_type;
wire					ff_rx_dsav;
wire					ff_rx_dval;
wire					ff_rx_a_full;
wire					ff_rx_a_empty;
mac_core mac_core(

//MAC Transmit Interface Signals
	.ff_tx_clk			(sgmii_clk),
	.ff_tx_data			(ff_tx_data),
	.ff_tx_sop			(ff_tx_sop),
	.ff_tx_eop			(ff_tx_eop),
	.ff_tx_err			(ff_tx_err),	
	.ff_tx_wren			(ff_tx_wren),
	.ff_tx_crc_fwd		(ff_tx_crc_fwd),
	.tx_ff_uflow		(tx_ff_uflow),
	.ff_tx_rdy			(ff_tx_rdy),
	.ff_tx_septy		(ff_tx_septy),	
	.ff_tx_a_full		(ff_tx_a_full),
	.ff_tx_a_empty		(ff_tx_a_empty),

	//MAC Receive Interface Signals
	.ff_rx_clk			(sgmii_clk),	
	.ff_rx_rdy			(ff_rx_rdy),
	.ff_rx_data			(ff_rx_data),
	.ff_rx_sop			(ff_rx_sop),
	.ff_rx_eop			(ff_rx_eop),
	.rx_err				(rx_err),	
	.rx_err_stat		(rx_err_stat),
	.rx_frm_type		(rx_frm_type),
	.ff_rx_dsav			(ff_rx_dsav),
	.ff_rx_dval			(ff_rx_dval),
	.ff_rx_a_full		(ff_rx_a_full),
	.ff_rx_a_empty		(ff_rx_a_empty),
	
//	//MAC Contro
//	.clk					(ammc_clk),
//	.address				(address),
//	.write				(write),
//	.read					(read),
//	.writedata			(writedata),
//	.readdata			(readdata),
//	.waitrequest		(waitrequest),

	//MAC Contro
	.clk					(ammc_clk),
	.reg_addr				(address),
	.reg_wr				(write),
	.reg_rd					(read),
	.reg_data_in			(writedata),
	.reg_data_out			(readdata),
	.reg_busy		(waitrequest),

	//reset sgmii
	.reset				(~reset),
	.tx_clk				(tx_clk),
	.rx_clk				(rx_clk),
	//GMII
	.gm_rx_d				(gm_rx_d),
	.gm_rx_dv			(gm_rx_dv),
	.gm_rx_err			(gm_rx_err),
	
	.gm_tx_d				(gm_tx_d),
	.gm_tx_en			(gm_tx_en),
	.gm_tx_err			(gm_tx_err),
	//MII
	.m_rx_d				(4'b0),
	.m_rx_en				(1'b0),
	.m_rx_err			(1'b0),
	
	.m_tx_d				(),
	.m_tx_en				(),
	.m_tx_err			(),
		
	.set_10				(1'b0),
	.set_1000			(1'b1),	
	.ena_10				(),
	.eth_mode			());

endmodule	