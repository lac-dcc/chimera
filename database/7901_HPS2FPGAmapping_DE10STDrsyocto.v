// This program was cloned from: https://github.com/robseb/HPS2FPGAmapping
// License: MIT License

//
//            ########   ######     ##    ##  #######   ######  ########  #######                  
//            ##     ## ##    ##     ##  ##  ##     ## ##    ##    ##    ##     ##           
//            ##     ## ##            ####   ##     ## ##          ##    ##     ##        
//            ########   ######        ##    ##     ## ##          ##    ##     ##       
//            ##   ##         ##       ##    ##     ## ##          ##    ##     ##      
//            ##    ##  ##    ##       ##    ##     ## ##    ##    ##    ##     ##        
//            ##     ##  ######        ##     #######   ######     ##     #######         
//
//						rsYocto reference FPGA project of the Terasic DE10 Standard Board
//    				 created by Robin Sebastian (https://github.com/robseb) 
//
//


//====================================================================================================
//  feature enableling for Terasic DE10 Standard Board  
//====================================================================================================

`define USE_HPS
`define USE_HEX

//`define USE_SDRAM
//`define USE_VIDEO_IN
//`define USE_VGA
//`define USE_AUDO
//`define USE_PS2
`define USE_ADC
//`define IR_LED
//`define USE_PS2_VIDO_IF


module DE10STDrsyocto(

/////////////////////////////////////////////// CLOCK ////////////////////////////////////////////////
	input 		          		CLOCK2_50,
	input 		          		CLOCK3_50,
	input 		          		CLOCK4_50,
	input 		          		CLOCK_50,

///////////////////////////////////////////////  KEY /////////////////////////////////////////////////
	input 		     [3:0]		KEY,
 
/////////////////////////////////////////////// SW ///////////////////////////////////////////////////
	input 		     [9:0]		SW,

//////////////////////////////////////////////// Seg7 ////////////////////////////////////////////////
`ifdef USE_HEX
	output		     [6:0]		HEX0,
	output		     [6:0]		HEX1,
	output		     [6:0]		HEX2,
	output		     [6:0]		HEX3,
	output		     [6:0]		HEX4,
	output		     [6:0]		HEX5,
`endif 	

////////////////////////////////////////////////// SDRAM /////////////////////////////////////////////
`ifdef USE_SDRAM	
	output		    [12:0]		DRAM_ADDR,
	output		     [1:0]		DRAM_BA,
	output		          		DRAM_CAS_N,
	output		          		DRAM_CKE,
	output		          		DRAM_CLK,
	output		          		DRAM_CS_N,
	inout 		    [15:0]		DRAM_DQ,
	output		          		DRAM_LDQM,
	output		          		DRAM_RAS_N,
	output		          		DRAM_UDQM,
	output		          		DRAM_WE_N,
`endif

///////////////////////l/////////////////////////// Video-In ///////////////////////////////////////////
`ifdef USE_VIDEO_IN
	input 		          		TD_CLK27,
	input 		     [7:0]		TD_DATA,
	input 		          		TD_HS,
	output		          		TD_RESET_N,
	input 		          		TD_VS,
`endif 

///////////////////////////////////////////////// VGA /////////////////////////////////////////////////
`ifdef USE_VGA
	output		          		VGA_BLANK_N,
	output		     [7:0]		VGA_B,
	output		          		VGA_CLK,
	output		     [7:0]		VGA_G,
	output		          		VGA_HS,
	output		     [7:0]		VGA_R,
	output		          		VGA_SYNC_N,
	output		          		VGA_VS,
`endif 

////////////////////////////////////////////////// Audio //////////////////////////////////////////////
`ifdef USE_AUDO
	input 		          		AUD_ADCDAT,
	inout 		          		AUD_ADCLRCK,
	inout 		          		AUD_BCLK,
	output		          		AUD_DACDAT,
	inout 		          		AUD_DACLRCK,
	output		          		AUD_XCK,
`endif 

///////////////////////////////////////////////// PS2 /////////////////////////////////////////////////
`ifdef USE_PS2
	inout 		          		PS2_CLK,
	inout 		          		PS2_CLK2,
	inout 		          		PS2_DAT,
	inout 		          		PS2_DAT2,
`endif 

////////////////////////////////////////////////// ADC ////////////////////////////////////////////////
`ifdef USE_ADC
	output		          		ADC_CONVST,
	output		          		ADC_DIN,
	input 		          		ADC_DOUT,
	output		          		ADC_SCLK,
`endif 
	
////////////////////////////// I2C for Audio and Video-In /////////////////////////////////////////////
`ifdef USE_PS2_VIDO_IF
	output		          		FPGA_I2C_SCLK,
	inout 		          		FPGA_I2C_SDAT,
`endif

//////////////////////////////////////////////// HPS //////////////////////////////////////////////////
`ifdef USE_HPS
	inout 		          		HPS_CONV_USB_N,
	output		    [14:0]		HPS_DDR3_ADDR,
	output		     [2:0]		HPS_DDR3_BA,
	output		          		HPS_DDR3_CAS_N,
	output		          		HPS_DDR3_CKE,
	output		          		HPS_DDR3_CK_N,
	output		          		HPS_DDR3_CK_P,
	output		          		HPS_DDR3_CS_N,
	output		     [3:0]		HPS_DDR3_DM,
	inout 		    [31:0]		HPS_DDR3_DQ,
	inout 		     [3:0]		HPS_DDR3_DQS_N,
	inout 		     [3:0]		HPS_DDR3_DQS_P,
	output		          		HPS_DDR3_ODT,
	output		          		HPS_DDR3_RAS_N,
	output		          		HPS_DDR3_RESET_N,
	input 		          		HPS_DDR3_RZQ,
	output		          		HPS_DDR3_WE_N,
	output		          		HPS_ENET_GTX_CLK,
	inout 		          		HPS_ENET_INT_N,
	output		          		HPS_ENET_MDC,
	inout 		          		HPS_ENET_MDIO,
	input 		          		HPS_ENET_RX_CLK,
	input 		     [3:0]		HPS_ENET_RX_DATA,
	input 		          		HPS_ENET_RX_DV,
	output		     [3:0]		HPS_ENET_TX_DATA,
	output		          		HPS_ENET_TX_EN,
	inout 		     [3:0]		HPS_FLASH_DATA,
	output		          		HPS_FLASH_DCLK,
	output		          		HPS_FLASH_NCSO,
	inout 		          		HPS_GSENSOR_INT,
	inout 		          		HPS_I2C1_SCLK,
	inout 		          		HPS_I2C1_SDAT,
	inout 		          		HPS_I2C2_SCLK,
	inout 		          		HPS_I2C2_SDAT,
	inout 		          		HPS_I2C_CONTROL,
	inout 		          		HPS_KEY,
	inout 		          		HPS_LCM_BK,
	inout 		          		HPS_LCM_D_C,
	inout 		          		HPS_LCM_RST_N,
	output		          		HPS_LCM_SPIM_CLK,
	input 		          		HPS_LCM_SPIM_MISO,
	output		          		HPS_LCM_SPIM_MOSI,
	output		          		HPS_LCM_SPIM_SS,
	inout 		          		HPS_LED,
	inout 		          		HPS_LTC_GPIO,
	output		          		HPS_SD_CLK,
	inout 		          		HPS_SD_CMD,
	inout 		     [3:0]		HPS_SD_DATA,
	output		          		HPS_SPIM_CLK,
	input 		          		HPS_SPIM_MISO,
	output		          		HPS_SPIM_MOSI,
	output		          		HPS_SPIM_SS,
	input 		          		HPS_UART_RX,
	output		          		HPS_UART_TX,
	input 		          		HPS_USB_CLKOUT,
	inout 		     [7:0]		HPS_USB_DATA,
	input 		          		HPS_USB_DIR,
	input 		          		HPS_USB_NXT,
	output		          		HPS_USB_STP,
`endif 
//////////////////////////////////////////////// IR ///////////////////////////////////////////////////
`ifdef IR_LED
	input 		          		IRDA_RXD,
	output		          		IRDA_TXD,
`endif 
	
//////////////////////////////////////////////// LED /////////////////////////////////////////////////
	output		     [9:0]		LEDR,
	
/////////////////////////////////// 40 Pin 2.55mm I/O Connector //////////////////////////////////////
	inout 			  [35:0]		GPIO
);

//====================================================================================================
//  REG/WIRE declarations
//====================================================================================================

//// IO Buffer Temp I2c 1 & 3 
wire scl1_o_e, sda1_o_e, scl1_o, sda1_o, 
	  scl3_o_e, sda3_o_e, scl3_o, sda3_o;
//// IO Buffer Temp SPI 0 	  
//wire spi0_clk, spi0_mosi, spi0_miso,spi0_ss_0_n;
//// IO Buffer Temp UART 1 	
wire uart1_rx,uart1_tx;
//// IO Buffer Temp CAN 0
wire can0_rx, can0_tx; 


//====================================================================================================
//  BASE Platform Designer module
//====================================================================================================

base_hps u0 (

/////////////////////////////////////////////// CLOCKS ////////////////////////////////////////////////
		.clk_clk                            	 	(CLOCK_50),                          

///////////////////////////////////////////////////////////////////////////////////////////////////////	  
///////////////////////////////////////// 	HPS    ///////////////////////////////////////////////////  
///////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////  Onboard DDR3 1GB Memmory  //////////////////////////////////////
      .hps_0_ddr_mem_a                          ( HPS_DDR3_ADDR),                     
      .hps_0_ddr_mem_ba                         ( HPS_DDR3_BA),                        
      .hps_0_ddr_mem_ck                         ( HPS_DDR3_CK_P),                       
      .hps_0_ddr_mem_ck_n                       ( HPS_DDR3_CK_N),                       
      .hps_0_ddr_mem_cke                        ( HPS_DDR3_CKE),                        
      .hps_0_ddr_mem_cs_n                       ( HPS_DDR3_CS_N),                    
      .hps_0_ddr_mem_ras_n                      ( HPS_DDR3_RAS_N),                      
      .hps_0_ddr_mem_cas_n                      ( HPS_DDR3_CAS_N),                      
      .hps_0_ddr_mem_we_n                       ( HPS_DDR3_WE_N),                      
      .hps_0_ddr_mem_reset_n                    ( HPS_DDR3_RESET_N),                    
      .hps_0_ddr_mem_dq                         ( HPS_DDR3_DQ),                        
      .hps_0_ddr_mem_dqs                        ( HPS_DDR3_DQS_P),                      
      .hps_0_ddr_mem_dqs_n                      ( HPS_DDR3_DQS_N),                      
      .hps_0_ddr_mem_odt                        ( HPS_DDR3_ODT),                        
      .hps_0_ddr_mem_dm                         ( HPS_DDR3_DM),                         
      .hps_0_ddr_oct_rzqin                      ( HPS_DDR3_RZQ),                         

 ///////////////////////////////////////// HPS Ethernet 1  ////////////////////////////////////////////    
      .hps_0_io_hps_io_emac1_inst_TX_CLK ( HPS_ENET_GTX_CLK),     
      .hps_0_io_hps_io_emac1_inst_TXD0   ( HPS_ENET_TX_DATA[0] ),
      .hps_0_io_hps_io_emac1_inst_TXD1   ( HPS_ENET_TX_DATA[1] ),   
      .hps_0_io_hps_io_emac1_inst_TXD2   ( HPS_ENET_TX_DATA[2] ),   
      .hps_0_io_hps_io_emac1_inst_TXD3   ( HPS_ENET_TX_DATA[3] ),  
      .hps_0_io_hps_io_emac1_inst_RXD0   ( HPS_ENET_RX_DATA[0] ),  
      .hps_0_io_hps_io_emac1_inst_MDIO   ( HPS_ENET_MDIO ),  
      .hps_0_io_hps_io_emac1_inst_MDC    ( HPS_ENET_MDC  ),        
      .hps_0_io_hps_io_emac1_inst_RX_CTL ( HPS_ENET_RX_DV),        
      .hps_0_io_hps_io_emac1_inst_TX_CTL ( HPS_ENET_TX_EN),       
      .hps_0_io_hps_io_emac1_inst_RX_CLK ( HPS_ENET_RX_CLK),       
      .hps_0_io_hps_io_emac1_inst_RXD1   ( HPS_ENET_RX_DATA[1] ),  
      .hps_0_io_hps_io_emac1_inst_RXD2   ( HPS_ENET_RX_DATA[2] ),   
      .hps_0_io_hps_io_emac1_inst_RXD3   ( HPS_ENET_RX_DATA[3] ),  

/////////////////////////////////////// SD Card Boot drive  ///////////////////////////////////////////  
      .hps_0_io_hps_io_sdio_inst_CMD     ( HPS_SD_CMD    	  ),          
      .hps_0_io_hps_io_sdio_inst_D0      ( HPS_SD_DATA[0]     ),     
      .hps_0_io_hps_io_sdio_inst_D1      ( HPS_SD_DATA[1]     ),     
      .hps_0_io_hps_io_sdio_inst_CLK     ( HPS_SD_CLK   		  ),            
      .hps_0_io_hps_io_sdio_inst_D2      ( HPS_SD_DATA[2]     ),      
      .hps_0_io_hps_io_sdio_inst_D3      ( HPS_SD_DATA[3]     ),      

////////////////////////////////////////// 	USB HOST 	//////////////////////////////////////////////  
      .hps_0_io_hps_io_usb1_inst_D0      ( HPS_USB_DATA[0]    ),      
      .hps_0_io_hps_io_usb1_inst_D1      ( HPS_USB_DATA[1]    ),      
      .hps_0_io_hps_io_usb1_inst_D2      ( HPS_USB_DATA[2]    ),      
      .hps_0_io_hps_io_usb1_inst_D3      ( HPS_USB_DATA[3]    ),     
      .hps_0_io_hps_io_usb1_inst_D4      ( HPS_USB_DATA[4]    ),      
      .hps_0_io_hps_io_usb1_inst_D5      ( HPS_USB_DATA[5]    ),     
      .hps_0_io_hps_io_usb1_inst_D6      ( HPS_USB_DATA[6]    ),      
      .hps_0_io_hps_io_usb1_inst_D7      ( HPS_USB_DATA[7]    ),     
      .hps_0_io_hps_io_usb1_inst_CLK     ( HPS_USB_CLKOUT     ),     
      .hps_0_io_hps_io_usb1_inst_STP     ( HPS_USB_STP        ),         
      .hps_0_io_hps_io_usb1_inst_DIR     ( HPS_USB_DIR        ),         
      .hps_0_io_hps_io_usb1_inst_NXT     ( HPS_USB_NXT        ),         

//////////////////////////////////////// UART 0 (Console)  ///////////////////////////////////////////
      .hps_0_io_hps_io_uart0_inst_RX     ( HPS_UART_RX        ),          
      .hps_0_io_hps_io_uart0_inst_TX     ( HPS_UART_TX        ), 
		

//////////////////////////////////////////////////////////////////////////////////////////////////////	  
/////////////////////////////// 	HPS Hard IP to FPGA Mapping     /////////////////////////////////////  


		
///////////////////////////////////////////// HPS UART 1  /////////////////////////////////////////////
		.hps_0_uart1_cts                    (),                    
		.hps_0_uart1_dsr                    (),                    
		.hps_0_uart1_dcd                    (),                   
		.hps_0_uart1_ri                     (),                    
		.hps_0_uart1_dtr                    (),                    
		.hps_0_uart1_rts                    (),                   
		.hps_0_uart1_out1_n                 (),                 	 
		.hps_0_uart1_out2_n                 (),                 	 
		.hps_0_uart1_rxd                    (uart1_rx),          
		.hps_0_uart1_txd                    (uart1_tx),           

///////////////////////////////////////////////// I2C1  ///////////////////////////////////////////////
		.hps_0_i2c1_clk_clk            		(scl1_o_e),              	
		.hps_0_i2c1_scl_in_clk              (scl1_o),         
		.hps_0_i2c1_out_data                (sda1_o_e),                	
		.hps_0_i2c1_sda                     (sda1_o),

////////////////////////////////////////////////// I2C3  //////////////////////////////////////////////
		.hps_0_i2c3_scl_in_clk					(scl3_o_e),
		.hps_0_i2c3_clk_clk                 (scl3_o),
		.hps_0_i2c3_out_data					   (sda3_o_e),
		.hps_0_i2c3_sda							(sda3_o),

//////////////////////////////////////////////// CAN0  ////////////////////////////////////////////////
		.hps_0_can0_rxd                     (can0_rx),           
		.hps_0_can0_txd                     (can0_tx),		

////////////////////////////////////////////////  SPI0 Master  ////////////////////////////////////////
//		.hps_0_spim0_sclk_out_clk           (spi0_clk),          
//		.hps_0_spim0_txd                    (spi0_mosi),                    
//		.hps_0_spim0_rxd                    (spi0_miso),                  
//		.hps_0_spim0_ss_in_n                (1'b1),              
//		.hps_0_spim0_ssi_oe_n               (spim0_ssi_oe_n),             
//		.hps_0_spim0_ss_0_n                 (spi0_ss_0_n),                
//		.hps_0_spim0_ss_1_n                 (),               
//		.hps_0_spim0_ss_2_n                 (),                 
//		.hps_0_spim0_ss_3_n                 (),

////////////////////////////////////////////////// SPIO LCD ////////////////////////////////////////////
		.hps_0_io_hps_io_spim0_inst_CLK    (HPS_LCM_SPIM_CLK),     
	   .hps_0_io_hps_io_spim0_inst_MOSI   (HPS_LCM_SPIM_MOSI),    
	   .hps_0_io_hps_io_spim0_inst_MISO   (HPS_LCM_SPIM_MISO),     
	   .hps_0_io_hps_io_spim0_inst_SS0    (HPS_LCM_SPIM_SS),    

		
///////////////////////////////////////////////////////////////////////////////////////////////////////	  
////////////////////////////////// 	   On Board Compunents     ////////////////////////////////////////  
///////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////  HPS LED & KEY  ///////////////////////////////////////////
      .hps_0_io_hps_io_gpio_inst_GPIO53  ( HPS_LED),                
      .hps_0_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY),   
		
//////////////////////////////////////////////  HPS GPIO  /////////////////////////////////////////////
		.hps_0_io_hps_io_gpio_inst_GPIO09  (HPS_CONV_USB_N),        	
		.hps_0_io_hps_io_gpio_inst_GPIO35  (HPS_ENET_INT_N),     
		.hps_0_io_hps_io_gpio_inst_GPIO37  (HPS_LCM_BK),       
		
		.hps_0_io_hps_io_gpio_inst_GPIO41  (HPS_LCM_D_C),     
		.hps_0_io_hps_io_gpio_inst_GPIO44  (HPS_LCM_RST_N),    
		.hps_0_io_hps_io_gpio_inst_GPIO48  (HPS_I2C_CONTROL),            
		.hps_0_io_hps_io_gpio_inst_GPIO61  (HPS_GSENSOR_INT), 
		
//////////////////////////////////	G-Sensor: I2C0 (Terasic Docu I2C1) ////////////////////////////////
		.hps_0_io_hps_io_i2c0_inst_SDA      (HPS_I2C1_SDAT),      		
		.hps_0_io_hps_io_i2c0_inst_SCL      (HPS_I2C1_SCLK),      		
		
/////////////////////////////////// onboard LEDs, Switches and Keys ///////////////////////////////////
		.led_pio_external_connection_export (LEDR), // LEDR
		.pb_pio_external_connection_export  (KEY), 
		.sw_pio_external_connection_export  (SW),
		
////////////////////////////////// 24 Bit seven sigment HEX Display ///////////////////////////////////
	  .de10std7sig_hex_io0_readdata       (HEX0), 
	  .de10std7sig_hex_io1_readdata       (HEX1),
	  .de10std7sig_hex_io2_readdata       (HEX2),
	  .de10std7sig_hex_io3_readdata       (HEX3),
	  .de10std7sig_hex_io4_readdata       (HEX4),	 
	  .de10std7sig_hex_io5_readdata       (HEX5),
	  
	  
//////////////////////////////////	ADC: Analog Devices LTC2308 ////////////////////////////////
		.ltc2308_io_convst_writeresponsevalid_n     (ADC_CONVST),    
      .ltc2308_io_sck_writeresponsevalid_n        (ADC_SCLK),        
      .ltc2308_io_sdi_writeresponsevalid_n        (ADC_DIN),      
      .ltc2308_io_sdo_beginbursttransfer          (ADC_DOUT),       
		
	  
	  
////////////////////////////////// HPS -> FPGA GPIO ///////////////////////////////////
	  .hps_0_h2f_gp_gp_in					  (32'hACDCACDC),
	  .hps_0_h2f_gp_gp_out					  (),
	  
	 /////////////////// USER CLOCK TEST ////////////////////////////
	  .hps_0_h2f_user0_clock_clk			  (GPIO[34]),
	  .hps_0_h2f_user2_clock_clk          (GPIO[35])
);


//////////////////////////////////////////////////////////////////////////////////////////////////////	  
/////////////////////////////// 	HPS Hard IP to FPGA Mapping     /////////////////////////////////////  
///////////////////////////////       		 IO Buffer 				  /////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////

		
//////////////////////////////////////////// DE10 STANDARD ///////////////////////////////////////////
////////////////////////////////////////////  USER GPIO PORT /////////////////////////////////////////
//////////////////////////////////// (40 Pin Wannenstecker 2,54mm)  //////////////////////////////////
		
										///////////////////////////////////////////////////
										//  PIN   | ---	 mapped func ---	|  GPIO      //
										//    1   | 			  UART1 TX 		|	  0		 //
										//    2   | 			  UART1 RX 	   |	  1		 //
										//    3   | 			  I2C1 SCL     |	  2		 //
										//    4   | 			  I2C1 SDA     |	  3		 //
										//    5   | 			  CAN0 TX		|	  4		 //
										//    6   |				  CAN0 RX		|	  5		 //
										//    7   |                         |	  6		 //
										//    8   |                         |	  7		 //
										//    9   |                         |	  8		 //
										//   10   |                         |	  9		 //
										//   11   ---  VDD 5V  ------       |	   		 //
										//   12   ---  GND     ------       |	  	   	 //
										//   13	 |	 			 I2C2 SCL      |	 10   	 //
										//   14	 |	 			 I2C2 SDA      |	 11		 //
										//   15   |				         	   |	 12		 //
										//   16   |									|	 13		 //
										//   17   |	                  		|	 14   	 //
										//   18   |				         		|	 15		 //
										//   19   |									|	 16		 //
										//   20   |									|	 17		 //
										//   21   |			                  |	 18		 //
										//   22   |									|	 19		 //
										//   23   |			             		|	 20		 //
										//   24   |									|	 21		 //
										//   25   |									|	 22		 //
										//   26   |			                  |	 23		 //
										//   27   |									|	 24		 //
										//   28   |									|	 25		 //
										//   29   ---  VCC 3V3  ------		|	   		 //
										//   30   ---  GND      ------		|	  		    //
										//   31   |									|	 26		 //
										//   32   |			         			|	 27		 //	                 
										//   33   |									|	 28		 //
										//   34   |									|	 29		 //
										//   35   |									|	 30		 //
										//   36   |									|	 31		 //
										//   37   |									|	 32		 //
										//   38   |									|	 33		 //
										//   39   |									|	 34		 //
										//   40   |									|	 35		 //										
										///////////////////////////////////////////////////
										


//////////////////////////////////////// IO Buffer SPI 0 /////////////////////////////////////////////
//	// SPI0 -> CS
//	ALT_IOBUF spi0_ss_iobuf    (.i(spi0_ss_0_n), .oe(1'b1), .o(), .io(GPIO[6])); // AH
//////	// SPI0 -> MOSI 
//	ALT_IOBUF spi0_mosi_iobuf  (.i(spi0_mosi), .oe(1'b1), .o(), .io(GPIO[18]));   // AF
//////	// SPI0 -> MISO  
//	ALT_IOBUF spi0_miso_iobuf  (.i(1'b0), .oe(1'b0), .o(spi0_miso), .io(GPIO[27])); // AE
//////	// SPI0  -> CLK
//	ALT_IOBUF spi0_clk_iobuf   (.i(spi0_clk), .oe(1'b1), .o(), .io(GPIO[23])); // AD
////	
////////////////////////////////////////// IO Buffer I2C 1 and 3 /////////////////////////////////////
//	// I2C1 -> SCL 
	ALT_IOBUF i2c1_scl_iobuf   (.i(1'b0),.oe(scl1_o_e),.o(scl1_o),.io(GPIO[2])); // Y
////	// I2C1 -> SDA 
	ALT_IOBUF i2c1_sda_iobuf   (.i(1'b0),.oe(sda1_o_e),.o(sda1_o),.io(GPIO[3])); // AK
////	// I2C3 -> SCL 
	ALT_IOBUF i2c3_scl_iobuf   (.i(1'b0),.oe(scl3_o_e),.o(scl3_o),.io(GPIO[10])); // AG
////	// I2C3 -> SDA 
	ALT_IOBUF i2c3_sda_iobuf   (.i(1'b0),.oe(sda3_o_e),.o(sda3_o),.io(GPIO[11])); // AG
////
//////////////////////////////////////////// IO Buffer UART1  //////////////////////////////////////////
////	// UART1 -> RX
	ALT_IOBUF uart1_rx_iobuf (.i(1'b0), .oe(1'b0), .o(uart1_rx), .io(GPIO[1])); // W
////   // UART1 -> TX
	ALT_IOBUF uart1_tx_iobuf (.i(uart1_tx), .oe(1'b1), .o(), .io(GPIO[0]));     // AK
////
//////////////////////////////////////////// IO Buffer CAN0  ///////////////////////////////////////////
	// CAN0 -> RX
	ALT_IOBUF can0_rx_iobuf (.i(1'b0), .oe(1'b0), .o(can0_rx), .io(GPIO[5])); // AJ
   // CAN0 -> TX 
	ALT_IOBUF can0_tx_iobuf (.i(can0_tx), .oe(1'b1), .o(), .io(GPIO[4]));     // AJ
//
//	
	
endmodule


// ################################## KNOWN ISSUES with Quartus and this project #################################

// In case of an HPS I/O Fitting error run flowing TCL Script manuely
//   -> Tools/TCL Script .../.../hps_sdram_p0:pin_assignments.tcl

// In case of Error (14566): The Fitter cannot place 1 periphery component(s) due to conflicts with existing constraints
// -> Run following TCL Command: 
//		set_global_assignment -name AUTO_RESERVE_CLKUSR_FOR_CALIBRATION OFF
// 
//		Workaround/Fix
//		To work around this problem, avoid placing more than one PHY Lite for Parallel Interfaces Intel® 
//    FPGA IP place in the same I/O bank. This is because each of the PHY Lite for Parallel Interfaces Intel FPGA IP 
//    has a specific interface requirement which required a specific PLL setting. However, there is only one PLL available in a given bank.
// More Infos: https://www.intel.com/content/www/us/en/programmable/support/support-resources/knowledge-base/tools/2019/error--fitter-cannot-place-1-periphery-component-s--due-to-confl.html
