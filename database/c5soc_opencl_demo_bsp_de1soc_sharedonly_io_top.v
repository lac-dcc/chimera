module top (
	fpga_clk_50,
  	fpga_reset_n,
  	ledr,            // LEDR
	hex0,            //HEX0
  
 	memory_mem_a,
  	memory_mem_ba,
  	memory_mem_ck,
  	memory_mem_ck_n,
  	memory_mem_cke,
  	memory_mem_cs_n,
  	memory_mem_ras_n,
  	memory_mem_cas_n,
  	memory_mem_we_n,
  	memory_mem_reset_n,
  	memory_mem_dq,
  	memory_mem_dqs,
  	memory_mem_dqs_n,
  	memory_mem_odt,
  	memory_mem_dm,
  	memory_oct_rzqin,
  
  	emac_mdio,
	emac_mdc,
	emac_tx_ctl,
	emac_tx_clk,
	emac_txd,
  	emac_rx_ctl,
	emac_rx_clk,
  	emac_rxd,
	hps_usb1_D0,      
	 hps_usb1_D1,      
	 hps_usb1_D2,      
	 hps_usb1_D3,      
	 hps_usb1_D4,      
	 hps_usb1_D5,      
	 hps_usb1_D6,      
	 hps_usb1_D7,      
	 hps_usb1_CLK,     
	 hps_usb1_STP,          
	 hps_usb1_DIR,         
	 hps_usb1_NXT,    
  	sd_cmd,
  	sd_clk,
  	sd_d,
  	uart_rx,
  	uart_tx,
  	led,
  	i2c_sda,
  	i2c_scl

);

  input  wire 		      fpga_clk_50;
  input  wire 		      fpga_reset_n;
  output wire [9:0]   	ledr;
  output wire [3:0]   	hex0;
  
  output wire [14:0] 	memory_mem_a;
  output wire [2:0]  	memory_mem_ba;
  output wire 		      memory_mem_ck;
  output wire 		      memory_mem_ck_n;
  output wire 		      memory_mem_cke;
  output wire 		      memory_mem_cs_n;
  output wire 		      memory_mem_ras_n;
  output wire 		      memory_mem_cas_n;
  output wire 		      memory_mem_we_n;
  output wire 		      memory_mem_reset_n;
  inout  wire [31:0] 	memory_mem_dq;
  inout  wire [3:0] 	   memory_mem_dqs;
  inout  wire [3:0]   	memory_mem_dqs_n;
  output wire 		      memory_mem_odt;
  output wire [3:0]   	memory_mem_dm;
  input  wire 		      memory_oct_rzqin;

  inout  wire 		      emac_mdio;
  output wire 		      emac_mdc;
  output wire 		      emac_tx_ctl;
  output wire 		      emac_tx_clk;
  output wire [3:0] 	   emac_txd;
  input  wire 		      emac_rx_ctl;
  input  wire 		      emac_rx_clk;
  input  wire [3:0] 	   emac_rxd;
	inout  wire        hps_usb1_D0;    
	inout  wire        hps_usb1_D1;     
	inout  wire        hps_usb1_D2;      
	inout  wire        hps_usb1_D3;      
	inout  wire        hps_usb1_D4;      
	inout  wire        hps_usb1_D5;      
	inout  wire        hps_usb1_D6;      
	inout  wire        hps_usb1_D7;      
	input  wire        hps_usb1_CLK;     
	output wire        hps_usb1_STP;     
	input  wire        hps_usb1_DIR;     
	input  wire        hps_usb1_NXT;
  inout  wire 		      sd_cmd;
  output wire 		      sd_clk;
  inout  wire [3:0]  	sd_d;
  input  wire 		      uart_rx;
  output wire 		      uart_tx;
  inout  wire  	      led;
  inout  wire 		      i2c_scl;
  inout  wire 		      i2c_sda;

  wire	[29:0]	      fpga_internal_led;
  wire		            kernel_clk;

  system the_system (
	.reset_50_reset_n                    			(fpga_reset_n),
	.clk_50_clk                          			(fpga_clk_50),
   .kernel_clk_clk					            	(kernel_clk),
	.memory_mem_a                        			(memory_mem_a),
	.memory_mem_ba                       			(memory_mem_ba),
	.memory_mem_ck                       			(memory_mem_ck),
	.memory_mem_ck_n                     			(memory_mem_ck_n),
	.memory_mem_cke                      			(memory_mem_cke),
	.memory_mem_cs_n                     			(memory_mem_cs_n),
	.memory_mem_ras_n                    			(memory_mem_ras_n),
	.memory_mem_cas_n                    			(memory_mem_cas_n),
	.memory_mem_we_n                     			(memory_mem_we_n),
	.memory_mem_reset_n                  			(memory_mem_reset_n),
	.memory_mem_dq                       			(memory_mem_dq),
	.memory_mem_dqs                      			(memory_mem_dqs),
	.memory_mem_dqs_n                    			(memory_mem_dqs_n),
	.memory_mem_odt                      			(memory_mem_odt),
	.memory_mem_dm                       			(memory_mem_dm),
	.memory_oct_rzqin                    			(memory_oct_rzqin),
	.peripheral_hps_io_emac1_inst_MDIO   			(emac_mdio),
	.peripheral_hps_io_emac1_inst_MDC    			(emac_mdc),
	.peripheral_hps_io_emac1_inst_TX_CLK 			(emac_tx_clk),
	.peripheral_hps_io_emac1_inst_TX_CTL 			(emac_tx_ctl),
	.peripheral_hps_io_emac1_inst_TXD0   			(emac_txd[0]),
	.peripheral_hps_io_emac1_inst_TXD1   			(emac_txd[1]),
	.peripheral_hps_io_emac1_inst_TXD2   			(emac_txd[2]),
	.peripheral_hps_io_emac1_inst_TXD3   			(emac_txd[3]),
	.peripheral_hps_io_emac1_inst_RX_CLK 			(emac_rx_clk),
	.peripheral_hps_io_emac1_inst_RX_CTL 			(emac_rx_ctl),
	.peripheral_hps_io_emac1_inst_RXD0   			(emac_rxd[0]),
	.peripheral_hps_io_emac1_inst_RXD1   			(emac_rxd[1]),
	.peripheral_hps_io_emac1_inst_RXD2   			(emac_rxd[2]),
	.peripheral_hps_io_emac1_inst_RXD3   			(emac_rxd[3]),
	.peripheral_hps_io_usb1_inst_D0      			(hps_usb1_D0 ),      //                 .hps_io_usb1_inst_D0
	.peripheral_hps_io_usb1_inst_D1    			    (hps_usb1_D1 ),      //                 .hps_io_usb1_inst_D1
	.peripheral_hps_io_usb1_inst_D2      			(hps_usb1_D2 ),      //                 .hps_io_usb1_inst_D2
	.peripheral_hps_io_usb1_inst_D3     			(hps_usb1_D3 ),      //                 .hps_io_usb1_inst_D3
	.peripheral_hps_io_usb1_inst_D4      			(hps_usb1_D4),      //                 .hps_io_usb1_inst_D4
	.peripheral_hps_io_usb1_inst_D5      			(hps_usb1_D5 ),      //                 .hps_io_usb1_inst_D5
	.peripheral_hps_io_usb1_inst_D6      			(hps_usb1_D6 ),      //                 .hps_io_usb1_inst_D6
	.peripheral_hps_io_usb1_inst_D7      			(hps_usb1_D7 ),      //                 .hps_io_usb1_inst_D7
	.peripheral_hps_io_usb1_inst_CLK    			(hps_usb1_CLK ),     //                 .hps_io_usb1_inst_CLK
	.peripheral_hps_io_usb1_inst_STP    			(hps_usb1_STP ),     //                 .hps_io_usb1_inst_STP
	.peripheral_hps_io_usb1_inst_DIR     			(hps_usb1_DIR),     //                 .hps_io_usb1_inst_DIR
	.peripheral_hps_io_usb1_inst_NXT     			(hps_usb1_NXT ),     //                 .hps_io_usb1_inst_NXT

	.peripheral_hps_io_sdio_inst_CMD     			(sd_cmd),
	.peripheral_hps_io_sdio_inst_CLK     			(sd_clk),
	.peripheral_hps_io_sdio_inst_D0      			(sd_d[0]),
	.peripheral_hps_io_sdio_inst_D1      			(sd_d[1]),
	.peripheral_hps_io_sdio_inst_D2      			(sd_d[2]),
	.peripheral_hps_io_sdio_inst_D3      			(sd_d[3]),
	.peripheral_hps_io_uart0_inst_RX     			(uart_rx),
	.peripheral_hps_io_uart0_inst_TX     			(uart_tx),
	.peripheral_hps_io_gpio_inst_GPIO53  			(led),
	
	.acl_iface_led_pio_external_connection_export (ledr[7:0]),    //FPGA LED_PIO
	
	.peripheral_hps_io_i2c1_inst_SDA     			(i2c_sda),
	.peripheral_hps_io_i2c1_inst_SCL     			(i2c_scl) 
  );
 
 
    
  // module for visualizing the kernel clock with 4 LEDs
  async_counter_30 AC30 (
        .clk 	(kernel_clk),
        .count	(fpga_internal_led)
    );
 // assign fpga_led_output[3:0] = ~fpga_internal_led[29:26];  
    assign hex0[3:0] = ~fpga_internal_led[29:26];  
endmodule



module async_counter_30(clk, count);
  input			clk;
  output 	[29:0]	count;
  reg		[14:0] 	count_a;
  reg           [14:0]  count_b;  

  initial count_a = 15'b0;
  initial count_b = 15'b0;

always @(negedge clk)
	count_a <= count_a + 1'b1;

always @(negedge count_a[14])
	count_b <= count_b + 1'b1;

assign count = {count_b, count_a};

endmodule



