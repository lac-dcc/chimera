//rgmii-gmii,gmii-139,rx check,rx gen
`timescale 1ns/1ns
module rx_tx_1000(
      clk_125m_core,
      clk_25m_core,
      clk_25m_tx,//100M RGMII TX CLK
      clk_125m_tx,//1000M RGMII TX CLK
      reset,
      
      rgmii_txd,              
      rgmii_tx_ctl,           
      rgmii_tx_clk,          
      rgmii_rxd,              
      rgmii_rx_ctl,
      rgmii_rx_clk,
      
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
    input clk_125m_core;
    input clk_25m_core;
    input clk_25m_tx;
    input clk_125m_tx;
    input reset;
    
    output [3:0]rgmii_txd;              
    output rgmii_tx_ctl;           
    output rgmii_tx_clk;          
    input [3:0]rgmii_rxd;              
    input rgmii_rx_ctl;
    input rgmii_rx_clk;
    
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
    
    wire [3:0]rgmii_txd;              
    wire rgmii_tx_ctl;           
    wire rgmii_tx_clk; 
     
    wire [7:0]gmii_txd;
    wire gmii_txen;
    wire gmii_txer;
    //wire gmii_txclk;//gmii input clk;
    wire [7:0]gmii_rxd;
    wire gmii_rxen;
    wire gmii_rxer;
    wire gmii_rx_clk;//gmii output clk;
    wire crc_data_valid;//to data fifo(crc check module);
    wire [138:0] crc_data;
    wire pkt_valid_wrreq;//a full pkt,to flag fifo;
    wire pkt_valid;
    wire [7:0]txfifo_data_usedw;
    
    wire  port_receive;
    wire  port_discard;
    wire  port_send;
    //wire  SPEED_IS_100_1000;
    wire port_pream;
gmii_139_1000 gmii_139(
   .clk(rgmii_rx_clk),
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
rgmii_gmii rgmii_gmii(
    .reset_n(reset),                   

    // RGMII Interface
                
    .rgmii_txd(rgmii_txd),              
    .rgmii_tx_ctl(rgmii_tx_ctl),           
    .rgmii_tx_clk(rgmii_tx_clk),          
    .rgmii_rxd(rgmii_rxd),              
    .rgmii_rx_ctl(rgmii_rx_ctl),
    .rgmii_rx_clk(rgmii_rx_clk),	   
	 
	   // GMII Interface
    
    .GTX_CLK(clk_125m_core),
    .GMII_TXD_FROM_CORE(gmii_txd),
    .GMII_TX_EN_FROM_CORE(gmii_txen),
    .GMII_TX_ER_FROM_CORE(gmii_txer),
    
   // .GRX_CLK(gmii_rx_clk),
    .GMII_RXD_TO_CORE(gmii_rxd),
    .GMII_RX_DV_TO_CORE(gmii_rxen),
    .GMII_RX_ER_TO_CORE(gmii_rxer),
    
    .clk_tx(clk_125m_tx),
    
    
    .SPEED_IS_10_100(1'b0)//1£º100M   0:1000M
	 
     );
tx139_gmii_1000 tx139_gmii(
      .clk(clk_125m_core),//system clk;
      .reset(reset),
      .gmii_txclk(clk_125m_core),
      
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

endmodule


 