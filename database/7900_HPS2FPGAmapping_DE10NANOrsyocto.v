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
//						rsYocto reference FPGA project of the Terasic DE10 Nano Board
//    				 created by Robin Sebastian (https://github.com/robseb) 
//
//


//====================================================================================================
//  feature enableling for Terasic DE10 Nano Board  
//====================================================================================================

`define USE_HPS
`define USE_ADUINO
`define USE_ADC
// `define USE_HDMI
// `define USE_GPIO0
// `define USE_GPIO1



module DE10NANOrsyocto(

////////////////////////////////////////////////// ADC ////////////////////////////////////////////////
`ifdef USE_ADC
	output		          		ADC_CONVST,
	output		          		ADC_SCK,
	output		          		ADC_SDI,
	input 		          		ADC_SDO,
`endif

//////////////////////////////////////////////// ARDUINO //////////////////////////////////////////////
`ifdef USE_ADUINO
	inout 		    [15:0]		ARDUINO_IO,
	inout 		          		ARDUINO_RESET_N,
`endif

///////////////////////////////////////////////// HDMI ////////////////////////////////////////////////
`ifdef USE_HDMI
	inout 		          		HDMI_I2C_SCL,
	inout 		          		HDMI_I2C_SDA,
	inout 		          		HDMI_I2S,
	inout 		          		HDMI_LRCLK,
	inout 		          		HDMI_MCLK,
	inout 		          		HDMI_SCLK,
	output		          		HDMI_TX_CLK,
	output		          		HDMI_TX_DE,
	output		    [23:0]		HDMI_TX_D,
	output		          		HDMI_TX_HS,
	input 		          		HDMI_TX_INT,
	output		          		HDMI_TX_VS,
`endif 

////////////////////////////////////////////////// HPS ////////////////////////////////////////////////
`ifdef USE_HPS
	//inout 		          		HPS_CONV_USB_N,
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
	
	inout 		          		HPS_I2C1_SCLK,
	inout 		          		HPS_I2C1_SDAT,
	
	inout 		          		HPS_KEY,
	inout 		          		HPS_LED,
	
	//inout 		          		HPS_LTC_GPIO,
	output		          		HPS_SD_CLK,
	inout 		          		HPS_SD_CMD,
	inout 		     [3:0]		HPS_SD_DATA,
	
//	output		          		HPS_SPIM_CLK,
//	input 		          		HPS_SPIM_MISO,
//	output		          		HPS_SPIM_MOSI,
//	inout 		          		HPS_SPIM_SS,

	input 		          		HPS_UART_RX,
	output		          		HPS_UART_TX,
	input 		          		HPS_USB_CLKOUT,
	inout 		     [7:0]		HPS_USB_DATA,
	input 		          		HPS_USB_DIR,
	input 		          		HPS_USB_NXT,
	output		          		HPS_USB_STP,
`endif

//////////////////////////////////////////////// GPIO 0 ///////////////////////////////////////////////
`ifdef USE_GPIO0
	inout 		    [35:0]		GPI0GPIO,
`endif

//////////////////////////////////////////////// GPIO 1 ///////////////////////////////////////////////
`ifdef USE_GPIO1
	inout 		    [35:0]		GPI1GPIO,
`endif 

////////////////////////////////////////////////// KEY ////////////////////////////////////////////////
	input 		     [1:0]		KEY,
	
////////////////////////////////////////////////// LED ////////////////////////////////////////////////
	output		     [7:0]		LED,
	
////////////////////////////////////////////////// SW  ////////////////////////////////////////////////
	input 		     [3:0]		SW,

//////////////////////////////////////////////// CLOCK ////////////////////////////////////////////////
	input 		          		FPGA_CLK1_50,
	input 		          		FPGA_CLK2_50,
	input 		          		FPGA_CLK3_50
	
);

//====================================================================================================
//  REG/WIRE declarations
//====================================================================================================

//// IO Buffer Temp I2c 1 & 3 
wire scl1_o_e, sda1_o_e, scl1_o, sda1_o, 
     scl3_o_e, sda3_o_e, scl3_o, sda3_o;
	  
//// IO Buffer Temp SPI 0 	  
wire spi0_clk, spi0_mosi, spi0_miso,spi0_ss_0_n;

//// IO Buffer Temp UART 1 	
wire uart1_rx,uart1_tx;

//// IO Buffer Temp CAN 0
wire can0_rx, can0_tx; 

base_hps u0 (

/////////////////////////////////////////////// CLOCKS ////////////////////////////////////////////////
		 .clk_clk                          ( FPGA_CLK1_50 ),                          

///////////////////////////////////////////////////////////////////////////////////////////////////////	  
///////////////////////////////////////// 	HPS    ///////////////////////////////////////////////////  
///////////////////////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////  Onboard DDR3 1GB Memmory  //////////////////////////////////////
      .hps_0_ddr_mem_a                   ( HPS_DDR3_ADDR),                     
      .hps_0_ddr_mem_ba                  ( HPS_DDR3_BA),                        
      .hps_0_ddr_mem_ck                  ( HPS_DDR3_CK_P),                       
      .hps_0_ddr_mem_ck_n                ( HPS_DDR3_CK_N),                       
      .hps_0_ddr_mem_cke                 ( HPS_DDR3_CKE),                        
      .hps_0_ddr_mem_cs_n                ( HPS_DDR3_CS_N),                    
      .hps_0_ddr_mem_ras_n               ( HPS_DDR3_RAS_N),                      
      .hps_0_ddr_mem_cas_n               ( HPS_DDR3_CAS_N),                      
      .hps_0_ddr_mem_we_n                ( HPS_DDR3_WE_N),                      
      .hps_0_ddr_mem_reset_n             ( HPS_DDR3_RESET_N),                    
      .hps_0_ddr_mem_dq                  ( HPS_DDR3_DQ),                        
      .hps_0_ddr_mem_dqs                 ( HPS_DDR3_DQS_P),                      
      .hps_0_ddr_mem_dqs_n               ( HPS_DDR3_DQS_N),                      
      .hps_0_ddr_mem_odt                 ( HPS_DDR3_ODT),                        
      .hps_0_ddr_mem_dm                  ( HPS_DDR3_DM),                         
      .hps_0_ddr_oct_rzqin               ( HPS_DDR3_RZQ),                         

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
		.hps_0_spim0_sclk_out_clk           (spi0_clk),          
		.hps_0_spim0_txd                    (spi0_mosi),                    
		.hps_0_spim0_rxd                    (spi0_miso),                  
		.hps_0_spim0_ss_in_n                (1'b1),              
		.hps_0_spim0_ssi_oe_n               (spim0_ssi_oe_n),             
		.hps_0_spim0_ss_0_n                 (spi0_ss_0_n),                
		.hps_0_spim0_ss_1_n                 (),               
		.hps_0_spim0_ss_2_n                 (),                 
		.hps_0_spim0_ss_3_n                 (),


///////////////////////////////////////////////////////////////////////////////////////////////////////	  
////////////////////////////////// 	   On Board Compunents     ////////////////////////////////////////  
///////////////////////////////////////////////////////////////////////////////////////////////////////


///////////////////////////////////////////  Analog Devices LTC2308    ////////////////////////////////

		.adc_ltc2308_conduit_end_CONVST   (ADC_CONVST),  
		.adc_ltc2308_conduit_end_SCK      (ADC_SCK),      
		.adc_ltc2308_conduit_end_SDI      (ADC_SDI),      
		.adc_ltc2308_conduit_end_SDO      (ADC_SDO),


///////////////////////////////////////////  HPS LED & KEY  ///////////////////////////////////////////
      .hps_0_io_hps_io_gpio_inst_GPIO53  ( HPS_LED),                
      .hps_0_io_hps_io_gpio_inst_GPIO54  ( HPS_KEY),   

//////////////////////////////////	G-Sensor: I2C0 (Terasic Docu I2C1) ////////////////////////////////
		.hps_0_io_hps_io_i2c0_inst_SDA      (HPS_I2C1_SDAT),      		
		.hps_0_io_hps_io_i2c0_inst_SCL      (HPS_I2C1_SCLK),      		
		
/////////////////////////////////// onboard LEDs, Switches and Keys ///////////////////////////////////
		.led_pio_external_connection_export (LED),
		.pb_pio_external_connection_export  (KEY), 
		.sw_pio_external_connection_export  (SW),
		

	  
////////////////////////////////// HPS -> FPGA GPIO ///////////////////////////////////
//    32-Bit direct access registry between HPS and FPGA
	  .hps_0_h2f_gp_gp_in					  (32'hACDCACDC), // FPGA to HPS -->
	  .hps_0_h2f_gp_gp_out					  ()					// HPS to FPGA <--
);



//////////////////////////// DE10 NANO //////////////////////////////
		
		////////////  Arduino Shild IF ///////////////

		///////////////////////////////////////////
		//  PIN   | Uno func-> mapped func		  //
		//   D0   | TXD    ->  UART1 RX 			  //
		//   D1   | RXD    ->  UART1 TX 	        //
		//   D2   | INT0   ->  I2C3 SDA          //
		//   D3   | INT1   ->  I2C3 SCL          //
		//   D4   | T0     ->     					  //
		//   D5   | T1     ->                    //
		//   D6   | AIN0   ->                    //
		//   D7   | AIN1 	 ->                    //
		//   D8   | CLKO   -> CAN0 TX            //
		//   D9   | OC1A   -> CAN0 RX            //
		//  D10   | SS     -> SPIO CS            //
		//  D11   | MOSI   -> SPIO MOSI          //
		//  D12   |	MISO   -> SPIO MISO          //
		//  D13   | SCK    -> SPIO CLK           //
		//   		 |	GND                          //
		//   		 | AREF                         //
		//   		 |	I2C     -> I2C1 SDA          //
		//   		 |	I2C     -> I2C1 SCL          //
		///////////////////////////////////////////


////////////////////////////////////////// IO Buffer SPI 0 /////////////////////////////////////////////
	// SPI0 -> CS
	ALT_IOBUF spi0_ss_iobuf    (.i(spi0_ss_0_n), .oe(1'b1), .o(), .io(ARDUINO_IO[10]));
	// SPI0 -> MOSI
	ALT_IOBUF spi0_mosi_iobuf  (.i(spi0_mosi), .oe(1'b1), .o(), .io(ARDUINO_IO[11]));
	// SPI0 -> MISO 
	ALT_IOBUF spi0_miso_iobuf  (.i(1'b0), .oe(1'b0), .o(spi0_miso), .io(ARDUINO_IO[12]));
	// SPI0  -> CLK
	ALT_IOBUF spi0_clk_iobuf   (.i(spi0_clk), .oe(1'b1), .o(), .io(ARDUINO_IO[13]));
	
////////////////////////////////////////// IO Buffer I2C 1 and 3 //////////////////////////////////////
	// I2C1 -> SCL 
	ALT_IOBUF i2c1_scl_iobuf   (.i(1'b0),.oe(scl1_o_e),.o(scl1_o),.io(ARDUINO_IO[15]));
	// I2C1 -> SDA 
	ALT_IOBUF i2c1_sda_iobuf   (.i(1'b0),.oe(sda1_o_e),.o(sda1_o),.io(ARDUINO_IO[14]));
	
	// I2C3 -> SCL 
	ALT_IOBUF i2c3_scl_iobuf   (.i(1'b0),.oe(scl3_o_e),.o(scl3_o),.io(ARDUINO_IO[3]));
	// I2C3 -> SDA 
	ALT_IOBUF i2c3_sda_iobuf   (.i(1'b0),.oe(sda3_o_e),.o(sda3_o),.io(ARDUINO_IO[2]));

////////////////////////////////////////// IO Buffer UART1  //////////////////////////////////////////
	// UART1 -> RX
	ALT_IOBUF uart1_rx_iobuf (.i(1'b0), .oe(1'b0), .o(uart1_rx), .io(ARDUINO_IO[1]));
   // UART1 -> TX
	ALT_IOBUF uart1_tx_iobuf (.i(uart1_tx), .oe(1'b1), .o(), .io(ARDUINO_IO[0]));

////////////////////////////////////////// IO Buffer CAN0  ///////////////////////////////////////////
	// CANO -> RX
	ALT_IOBUF can0_rx_iobuf (.i(1'b0), .oe(1'b0), .o(can0_rx), .io(ARDUINO_IO[9]));
   // CAN-> TX
	ALT_IOBUF can0_tx_iobuf (.i(can0_tx), .oe(1'b1), .o(), .io(ARDUINO_IO[8]));
	

endmodule


