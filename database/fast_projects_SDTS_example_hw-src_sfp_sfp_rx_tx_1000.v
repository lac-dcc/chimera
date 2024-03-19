//rgmii-gmii,gmii-139,rx check,rx gen
`timescale 1ns/1ns
module sfp_rx_tx_1000(
      clk,
      sfp_clk,
      reset,
      gmii_rx_clk,
      gmii_tx_clk,
      sfp_rxp,
      sfp_txp,
      l_link_sfp,
      r_act_sfp,
      crc_data_valid,//rx data fifo
      crc_data,
      pkt_usedw,
   
      pkt_valid_wrreq,
      pkt_valid,
      
      crc_gen_to_txfifo_wrreq,//tx fifo;
      crc_gen_to_txfifo_data,
      txfifo_data_usedw,
      pkt_output_valid_wrreq,
      pkt_output_valid,
      
      port_receive,
      port_discard,
      port_send,
      port_pream
     );
     
    input clk;
    input sfp_clk;
    input reset;
    output gmii_rx_clk;
    output gmii_tx_clk;
    input   sfp_rxp;
    output  sfp_txp;
    output	l_link_sfp;
    output	r_act_sfp;  
    output crc_data_valid;//to data fifo(crc check module);
    output [138:0] crc_data;
    input [7:0]pkt_usedw;
   
    output pkt_valid_wrreq;//a full pkt,to flag fifo;
    output pkt_valid;
    
    input crc_gen_to_txfifo_wrreq;//data to txfifo;
    input [138:0]crc_gen_to_txfifo_data;
    output [7:0]txfifo_data_usedw;//data fifo usedw;
    
    input pkt_output_valid_wrreq;//flag to flagfifo;
    input pkt_output_valid;
    
    output  port_receive;
    output  port_discard;
    output  port_send;
    output  port_pream;
    
     
    wire [7:0]gmii_txd;
    wire gmii_txen;
    wire gmii_txer;
    wire [7:0]gmii_rxd;
    wire gmii_rxen;
    wire gmii_rxer;
    wire gmii_rx_clk;//gmii rx clk;
    wire gmii_tx_clk;//gmii tx clk;
    wire crc_data_valid;//to data fifo(crc check module);
    wire [138:0] crc_data;
    wire pkt_valid_wrreq;//a full pkt,to flag fifo;
    wire pkt_valid;
    wire [7:0]txfifo_data_usedw;
    
    wire  port_receive;
    wire  port_discard;
    wire  port_send;
    wire  port_pream;
gmii_139_1000 gmii_139(
   .clk(gmii_rx_clk),
   .reset(reset),
   
   .gmii_rxd(gmii_rxd),
   .gmii_rxdv(gmii_rxen),
   .gmii_rxer(gmii_rxer),
   
   .crc_data_valid(crc_data_valid),
   .crc_data(crc_data),
   .pkt_usedw(pkt_usedw),
   
   .pkt_valid_wrreq(pkt_valid_wrreq),
   .pkt_valid(pkt_valid),
   .port_receive(port_receive),
   .port_discard(port_discard),
   .port_pream(port_pream)
 );

tx139_gmii_1000 tx139_gmii(
      .clk(clk),//system clk;
      .reset(reset),
      .gmii_txclk(gmii_tx_clk),
      
      .crc_gen_to_txfifo_wrreq(crc_gen_to_txfifo_wrreq),
      .crc_gen_to_txfifo_data(crc_gen_to_txfifo_data),
      
      .pkt_output_valid_wrreq(pkt_output_valid_wrreq),
      .pkt_output_valid(pkt_output_valid),
      
      .gmii_txd(gmii_txd),
      .gmii_txen(gmii_txen),
      .gmii_txer(gmii_txer),
      
      .txfifo_data_usedw(txfifo_data_usedw),//output_data_usedw0;
      .port_send(port_send)
   );
	wire l_link_sfp0;
	wire l_link_sfp;
    assign l_link_sfp = ~l_link_sfp0;

sfp2gmii sfp2gmii(
	.gmii_rx_d(gmii_rxd),
	.gmii_rx_dv(gmii_rxen),
	.gmii_rx_err(gmii_rxer),
	.tx_clk(gmii_tx_clk),
	.rx_clk(gmii_rx_clk),
	.readdata(),
	.waitrequest(),
	.txp(sfp_txp),
	.reconfig_fromgxb(),
	.led_an(),
	.led_disp_err(),
	.led_char_err(),
	.led_link(l_link_sfp0),
	.gmii_tx_d(gmii_txd),
	.gmii_tx_en(gmii_txen),
	.gmii_tx_err(gmii_txer),
	.reset_tx_clk(~reset),
	.reset_rx_clk(~reset),
	.address(5'b0),
	.read(1'b0),
	.writedata(16'b0),
	.write(1'b0),
	.clk(clk),
	.reset(~reset),
	.rxp(sfp_rxp),
	.ref_clk(sfp_clk),
	.reconfig_clk(1'b0),
	.reconfig_togxb(3'b010),
	.gxb_cal_blk_clk(sfp_clk)
	);

act_led act_led(
.clk(clk),
.reset(reset),
.gmii_rxen(gmii_rxen),
.gmii_txen(gmii_txen),
.r_act_sfp(r_act_sfp)
);

endmodule


 