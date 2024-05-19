// This program was cloned from: https://github.com/FAST-Switch/fast
// License: Apache License 2.0

//rgmii to gmii,gmii to rgmii;
//by jzc 20100919;
 `timescale 1ns/1ns
 module rgmii_gmii
(
    reset_n,                   

    // RGMII Interface
                
    rgmii_txd,              
    rgmii_tx_ctl,           
    rgmii_tx_clk,          
    rgmii_rxd,              
    rgmii_rx_ctl,
    rgmii_rx_clk,	   
	 
	   // GMII Interface

    GTX_CLK,
    GMII_TXD_FROM_CORE,
    GMII_TX_EN_FROM_CORE,
    GMII_TX_ER_FROM_CORE,
    
  //  GRX_CLK,
    GMII_RXD_TO_CORE,
    GMII_RX_DV_TO_CORE,
    GMII_RX_ER_TO_CORE,
    
    clk_tx,
    
    SPEED_IS_10_100
	 
     );
   input SPEED_IS_10_100;
   // Port declarations

   input          reset_n;                   
   input          GTX_CLK; 
   input          clk_tx;
	
   // RGMII Interface
                              
   output [3:0]   rgmii_txd;             
   output         rgmii_tx_ctl;                      
   output         rgmii_tx_clk;          
   input  [3:0]   rgmii_rxd;             
   input          rgmii_rx_ctl;                             
   input          rgmii_rx_clk;                     
 
    // GMII Interface8
    input [7:0]   GMII_TXD_FROM_CORE;   
    input         GMII_TX_EN_FROM_CORE; 
    input         GMII_TX_ER_FROM_CORE; 
        
    output [7:0]   GMII_RXD_TO_CORE;     
    output        GMII_RX_DV_TO_CORE;   
    output        GMII_RX_ER_TO_CORE;  
    
   
    
   reg [3:0]   rgmii_txd_rising; 
   reg [3:0]   rgmii_txd_falling;
   reg         rgmii_tx_ctl_rising;
   reg         rgmii_tx_ctl_falling;
   
   reg [7:0]    GMII_RXD_TO_CORE;     
   reg         GMII_RX_DV_TO_CORE;   
   reg         GMII_RX_ER_TO_CORE; 
   
   wire [3:0]   rgmii_rxd_rising;
   wire [3:0]   rgmii_rxd_falling;
   wire         rgmii_rx_ctl_rising;
   wire         rgmii_rx_ctl_falling;
   wire rgmii_tx_clk;
  
 ddio_out ddio_out_data(
	.aclr(!reset_n),
	.datain_h(rgmii_txd_rising),
	.datain_l(rgmii_txd_falling),
	.outclock(GTX_CLK),
	.dataout(rgmii_txd));
	
      
 ddio_out_1 ddio_out_ctl(
	.aclr(!reset_n),
	.datain_h(rgmii_tx_ctl_rising),
	.datain_l(rgmii_tx_ctl_falling),
	.outclock(GTX_CLK),
	.dataout(rgmii_tx_ctl));  
	
 ddio_out_1 ddio_out_clk(
	.aclr(!reset_n),
	.datain_h(1'b1),
	.datain_l(1'b0),
	.outclock(clk_tx),
	.dataout(rgmii_tx_clk));  	
	
	
 ddio_in_4 ddio_in_data(
	.aclr(!reset_n),
	.datain(rgmii_rxd),
	.inclock(rgmii_rx_clk),
	.dataout_h(rgmii_rxd_rising),
	.dataout_l(rgmii_rxd_falling));
  
 ddio_in_1 ddio_in_ctl(
	.aclr(!reset_n),
	.datain(rgmii_rx_ctl),
	.inclock(rgmii_rx_clk),
	.dataout_h(rgmii_rx_ctl_rising),
	.dataout_l(rgmii_rx_ctl_falling));

//发送。GMII接口转换成RGMII接口。SPEED_IS_10_100为1 表示MII 百兆； 为0表示RGMII 千兆
always@(posedge GTX_CLK or negedge reset_n)
    begin
    	 if(!reset_n)
    	   begin
    	   	rgmii_txd_rising     <= 4'b0;
            rgmii_txd_falling    <= 4'b0;
            rgmii_tx_ctl_rising  <= 1'b0;
            rgmii_tx_ctl_falling <= 1'b0;
    	   end
    	 else
    	   begin
    	   	rgmii_txd_rising     <= GMII_TXD_FROM_CORE[3:0];
            rgmii_tx_ctl_rising  <= GMII_TX_EN_FROM_CORE;
            rgmii_tx_ctl_falling <= GMII_TX_EN_FROM_CORE ^ GMII_TX_ER_FROM_CORE;
            if(SPEED_IS_10_100)//100M
             rgmii_txd_falling    <= GMII_TXD_FROM_CORE[3:0];
            else//1000M
             rgmii_txd_falling    <= GMII_TXD_FROM_CORE[7:4];
    	   end
    end
 reg [3:0] rgmii_rxd_rising_r; 
 reg       rgmii_rx_ctl_rising_r; 
 //接收。RGMII接口转换成GMII接口
always@(posedge rgmii_rx_clk or negedge reset_n )
   begin
   	  if(!reset_n)
   	    begin
   	      GMII_RXD_TO_CORE   <= 8'b0;     
          GMII_RX_DV_TO_CORE <= 1'b0;   
          GMII_RX_ER_TO_CORE <= 1'b0; 
          rgmii_rxd_rising_r <= 4'b0;
          rgmii_rx_ctl_rising_r <= 1'b0;
   	    end
   	  else
   	    begin
   	    	GMII_RX_DV_TO_CORE    <= rgmii_rx_ctl_rising_r;
   	    	GMII_RX_ER_TO_CORE    <= rgmii_rx_ctl_rising_r ^ rgmii_rx_ctl_falling;
   	    	GMII_RXD_TO_CORE[7:4] <= rgmii_rxd_falling;
   	    	GMII_RXD_TO_CORE[3:0] <= rgmii_rxd_rising_r;
   	    	rgmii_rxd_rising_r    <= rgmii_rxd_rising;
   	    	rgmii_rx_ctl_rising_r <= rgmii_rx_ctl_rising;
   	    end
   end
    
 
endmodule 