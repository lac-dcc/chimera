//
module SGMII_PORT(
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
//out2_pkt_usedw,
out2_pkt_almost_full,
out2_valid_wrreq,
out2_valid,

pkt_receive_add,
pkt_discard_add,
pkt_send_add,
ref_clk,
txp,
rxp,

address,
write,
read,
writedata,
readdata,
waitrequest,
reconfig_clk//37.5Mhz ----50Mhz
);
input 			clk;

input          ammc_clk;
input         	sgmii_clk;
//output         rx_clk;
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

input  			ref_clk;
output 			txp;
input  			rxp;
input [7:0] 	address;
input 			write;
input 			read;
input [31:0] 	writedata;
output [31:0]	readdata;
output 			waitrequest;
input  			reconfig_clk;//37.5Mhz ----50Mhz


wire [7:0] 	acc_address;
wire 			acc_write;
wire 			acc_read;
wire [31:0] 	acc_writedata;
wire [31:0]	acc_readdata;
wire 			acc_waitrequest;


SGMII_TX SGMII_TX(
.clk						(clk),
.reset					(reset),
.ff_tx_clk				(sgmii_clk),
.ff_tx_data				(ff_tx_data),
.ff_tx_mod				(ff_tx_mod),
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

SGMII_RX SGMII_RX(
.reset					(reset),
.ff_rx_clk				(sgmii_clk),	
.ff_rx_rdy				(ff_rx_rdy),
.ff_rx_data				(ff_rx_data),
.ff_rx_mod				(ff_rx_mod),
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
wire	[31:0]		ff_tx_data;
wire	[1:0]			ff_tx_mod;
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
wire		[31:0]	ff_rx_data;
wire		[1:0]		ff_rx_mod;
wire					ff_rx_sop;
wire					ff_rx_eop;
wire		[5:0]		rx_err;
wire		[17:0]	rx_err_stat;
wire		[3:0]		rx_frm_type;
wire					ff_rx_dsav;
wire					ff_rx_dval;
wire					ff_rx_a_full;
wire					ff_rx_a_empty;
mac_sgmii mac_sgmii(
	//MAC Transmit Interface Signals
	.ff_tx_clk			(sgmii_clk),
	.ff_tx_data			(ff_tx_data),
	.ff_tx_mod			(ff_tx_mod),
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
	.ff_rx_mod			(ff_rx_mod),
	.ff_rx_sop			(ff_rx_sop),
	.ff_rx_eop			(ff_rx_eop),
	.rx_err				(rx_err),	
	.rx_err_stat		(rx_err_stat),
	.rx_frm_type		(rx_frm_type),
	.ff_rx_dsav			(ff_rx_dsav),
	.ff_rx_dval			(ff_rx_dval),
	.ff_rx_a_full		(ff_rx_a_full),
	.ff_rx_a_empty		(ff_rx_a_empty),
	//MAC Contro
	.clk					(ammc_clk),
//	.address				(address),
//	.write				(write),
//	.read					(read),
//	.writedata			(writedata),
//	.readdata			(readdata),
//	.waitrequest		(waitrequest),

	.reg_addr				(address),
	.reg_wr				(write),
	.reg_rd				(read),
	.reg_data_in		(writedata),
	.reg_data_out		(readdata),
	.reg_busy		(waitrequest),


//	.reg_addr			(acc_address),
//	.reg_wr				(acc_write),
//	.reg_rd				(acc_read),
//	.reg_data_in		(acc_writedata),
//	.reg_data_out		(acc_readdata),
//	.reg_busy		(acc_waitrequest),


	//reset sgmii
	.reset				(~reset),
	.rxp					(rxp),
	.txp					(txp),
	.ref_clk				(ref_clk),
	//LED
	.led_an				(),
	.led_char_err		(),
	.led_link			(),
	.led_disp_err		(),
	.led_crs				(),
	.led_col				(),
	//SERDES Control Signals
	.rx_recovclkout	(),
	//.gxb_cal_blk_clk	(ref_clk),
	.pcs_pwrdn_out		(),
//	.gxb_pwrdn_in		(1'b0),
	//.gxb_pwrdn_in		(~reset),//ZQ0830
//	.reconfig_clk		(reconfig_clk),
	.reconfig_togxb	(4'b010),
	.reconfig_fromgxb	()	
//	.reconfig_busy		(1'b0)	
	);
	
//MAC_REG_ACC	MAC_REG_ACC(
//.clk						(ammc_clk),
//.reset              (reset),
//.waitrequest        (waitrequest),
//.readdata           (readdata),
//   
//.address            (address),
//.write              (write),
//.read               (read),
//.writedata			(writedata)	);

/*MAC_REG_ACC	MAC_REG_ACC(
.clk						(ammc_clk),
.reset              (reset),
.waitrequest        (acc_waitrequest),
.readdata           (acc_readdata),
   
.address            (acc_address),
.write              (acc_write),
.read               (acc_read),
.writedata			(acc_writedata)	);*/

	
endmodule 