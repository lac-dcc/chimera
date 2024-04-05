//////////////////////////////////////////////////////////////////////
///                                                               //// 
/// ORPSoC testbench                                              ////
///                                                               ////
/// Instantiate ORPSoC, monitors, provide stimulus                ////
///                                                               ////
/// Julius Baxter, julius@opencores.org                           ////
///                                                               ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2009, 2010 Authors and OPENCORES.ORG           ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////

`include "orpsoc-defines.v"
`include "orpsoc-testbench-defines.v"
`include "test-defines.v"

`include "timescale.v"

module orpsoc_testbench;

   // Clock and reset signal registers
   reg clk = 0;
   reg rst_n = 1; // Active LOW
   reg eth_clk = 0;
   
   always
     #((`BOARD_CLOCK_PERIOD)/2) clk <= ~clk;

`ifdef ETH_CLK
   always
     #((`ETHERNET_CLOCK_PERIOD)/2) eth_clk <= ~eth_clk;
`endif

   
   // Reset, ACTIVE LOW
   initial 
     begin
	#1;
	repeat (32) @(negedge clk)
	  rst_n <= 1;
	repeat (32) @(negedge clk)
	  rst_n <= 0;
	repeat (32) @(negedge clk)
	  rst_n <= 1;
     end

   // Include design parameters file
`include "orpsoc-params.v"

   // Pullup bus for I2C
   tri1 i2c_scl, i2c_sda;
   
`ifdef JTAG_DEBUG
   wire 		     tdo_pad_o;
   wire 		     tck_pad_i;
   wire 		     tms_pad_i;
   wire 		     tdi_pad_i;
`endif   
`ifdef UART0
   wire 		     uart0_stx_pad_o;
   wire 		     uart0_srx_pad_i;
`endif
`ifdef GPIO0
   wire [gpio0_io_width-1:0] gpio0_io;
`endif
`ifdef VERSATILE_SDRAM   
   wire [12:0] 		     sdram_a_pad_o;
   wire [1:0] 		     sdram_ba_pad_o;
   wire 		     sdram_cas_pad_o;
   wire 		     sdram_cke_pad_o;
   wire 		     sdram_clk_pad_o;
   wire 		     sdram_cs_n_pad_o;
   wire [15:0] 		     sdram_dq_pad_io;
   wire [1:0] 		     sdram_dqm_pad_o;
   wire 		     sdram_ras_pad_o;
   wire 		     sdram_we_pad_o;
`endif
`ifdef SPI0
   wire 		     spi0_mosi_o;
   wire 		     spi0_miso_i;
   wire 		     spi0_sck_o;
   wire 		     spi0_hold_n_o;
   wire 		     spi0_w_n_o;   
   wire [spi0_ss_width-1:0]  spi0_ss_o;
`endif
`ifdef SPI1
   wire 		     spi1_mosi_o;
   wire 		     spi1_miso_i;   
   wire 		     spi1_sck_o;
   wire [spi1_ss_width-1:0]  spi1_ss_o;
`endif
`ifdef SPI2
   wire 		     spi2_mosi_o; 
   wire 		     spi2_miso_i;  
   wire 		     spi2_sck_o;
   wire [spi2_ss_width-1:0]  spi2_ss_o;
`endif
`ifdef USB0
   wire 		     usb0fullspeed_pad_o;
   wire 		     usb0ctrl_pad_o;
   wire [1:0] 		     usb0dat_pad_o;
   wire [1:0] 		     usb0dat_pad_i;
`endif
`ifdef USB1
   wire 		     usb1fullspeed_pad_o;
   wire 		     usb1ctrl_pad_o;
   wire [1:0] 		     usb1dat_pad_o;
   wire [1:0] 		     usb1dat_pad_i;
`endif   
`ifdef ETH0
 `ifdef SMII0
   parameter Td_smii = 2;   
   wire 		     #Td_smii eth0_smii_sync_pad_o;
   wire 		     #Td_smii eth0_smii_tx_pad_o;
   wire 		     #Td_smii eth0_smii_rx_pad_i;
 `endif
   wire 		     mtx_clk_o;		
   wire [3:0] 		     ethphy_mii_tx_d;	
   wire 		     ethphy_mii_tx_en;	
   wire 		     ethphy_mii_tx_err;	
   wire 		     mrx_clk_o;		
   wire [3:0] 		     mrxd_o;			
   wire 		     mrxdv_o;		
   wire 		     mrxerr_o;		
   wire 		     mcoll_o;		
   wire 		     mcrs_o;
   wire 		     ethphy_rst_n;

   wire 		     eth0_mdc_pad_o;
   wire 		     eth0_md_pad_io;
`endif

   orpsoc_top dut
     (
`ifdef JTAG_DEBUG          
      .tms_pad_i			(tms_pad_i),
      .tck_pad_i			(tck_pad_i),
      .tdi_pad_i			(tdi_pad_i),
      .tdo_pad_o			(tdo_pad_o),
`endif
`ifdef VERSATILE_SDRAM
      .sdram_dq_pad_io			(sdram_dq_pad_io),            
      .sdram_ba_pad_o			(sdram_ba_pad_o),
      .sdram_a_pad_o			(sdram_a_pad_o),
      .sdram_cs_n_pad_o			(sdram_cs_n_pad_o),
      .sdram_ras_pad_o			(sdram_ras_pad_o),
      .sdram_cas_pad_o			(sdram_cas_pad_o),
      .sdram_we_pad_o			(sdram_we_pad_o),
      .sdram_dqm_pad_o			(sdram_dqm_pad_o),
      .sdram_cke_pad_o			(sdram_cke_pad_o),
      .sdram_clk_pad_o                  (sdram_clk_pad_o),
`endif
`ifdef UART0      
      .uart0_stx_pad_o			(uart0_stx_pad_o),
      .uart0_srx_pad_i			(uart0_srx_pad_i),
`endif
`ifdef SPI0
      .spi0_sck_o			(spi0_sck_o),
      .spi0_mosi_o			(spi0_mosi_o),
      .spi0_miso_i			(spi0_miso_i),
 `ifdef SPI0_SLAVE_SELECTS      
      .spi0_ss_o			(spi0_ss_o),
 `endif      
      .spi0_hold_n_o                    (spi0_hold_n_o),
      .spi0_w_n_o                       (spi0_w_n_o),
`endif
`ifdef SPI1
      .spi1_sck_o			(spi1_sck_o),
      .spi1_mosi_o			(spi1_mosi_o),
      .spi1_miso_i			(spi1_miso_i),
 `ifdef SPI1_SLAVE_SELECTS                  
      .spi1_ss_o			(spi1_ss_o),
 `endif      
`endif
`ifdef SPI2
      .spi2_sck_o			(spi2_sck_o),
      .spi2_mosi_o			(spi2_mosi_o),
      .spi2_miso_i			(spi2_miso_i),
 `ifdef SPI2_SLAVE_SELECTS                        
      .spi2_ss_o			(spi2_ss_o),
 `endif      
`endif
`ifdef USB0
      .usb0dat_pad_o			(usb0dat_pad_o),
      .usb0ctrl_pad_o			(usb0ctrl_pad_o),
      .usb0fullspeed_pad_o		(usb0fullspeed_pad_o),
      .usb0dat_pad_i			(usb0dat_pad_i),
`endif
`ifdef USB1
      .usb1dat_pad_o			(usb1dat_pad_o),
      .usb1ctrl_pad_o			(usb1ctrl_pad_o),
      .usb1fullspeed_pad_o		(usb1fullspeed_pad_o),
      .usb1dat_pad_i			(usb1dat_pad_i),
`endif      
`ifdef I2C0
      .i2c0_sda_io			(i2c_sda),
      .i2c0_scl_io			(i2c_scl),
`endif
`ifdef I2C1
      .i2c1_sda_io			(i2c_sda),
      .i2c1_scl_io			(i2c_scl),
`endif
`ifdef I2C2
      .i2c2_sda_io			(i2c_sda),
      .i2c2_scl_io			(i2c_scl),
`endif
`ifdef I2C3
      .i2c3_sda_io			(i2c_sda),
      .i2c3_scl_io			(i2c_scl),
`endif
`ifdef GPIO0
      .gpio0_io				(gpio0_io),
`endif
`ifdef ETH0
 `ifdef SMII0      
      .eth0_smii_sync_pad_o                  (eth0_smii_sync_pad_o),
      .eth0_smii_tx_pad_o                    (eth0_smii_tx_pad_o),
      .eth0_smii_rx_pad_i                    (eth0_smii_rx_pad_i),
 `else
      .eth0_tx_clk                      (mtx_clk_o),
      .eth0_tx_data                     (ethphy_mii_tx_d),
      .eth0_tx_en                       (ethphy_mii_tx_en),
      .eth0_tx_er                       (ethphy_mii_tx_err),
      .eth0_rx_clk                      (mrx_clk_o),
      .eth0_rx_data                     (mrxd_o),
      .eth0_dv                          (mrxdv_o),
      .eth0_rx_er                       (mrxerr_o),
      .eth0_col                         (mcoll_o),
      .eth0_crs                         (mcrs_o),
 `endif // !`ifdef SMII0
 `ifdef ETH0_PHY_RST      
      .eth0_rst_n_o                     (ethphy_rst_n),
 `endif      
      .eth0_mdc_pad_o                   (eth0_mdc_pad_o),
      .eth0_md_pad_io                   (eth0_md_pad_io),
`endif //  `ifdef ETH0
`ifdef ETH_CLK
      .eth_clk_pad_i                    (eth_clk),
`endif
`ifdef SDC_CONTROLLER
      .sdc_cmd_pad_io                   (),
      .sdc_dat_pad_io                   (),
      .sdc_clk_pad_o                    (),
      .sdc_card_detect_pad_i            (1'b0),
`endif
      
      .sys_clk_pad_i			(clk),
      .rst_n_pad_i			(rst_n)      
      );

   //
   // Instantiate OR1200 monitor
   //
   or1200_monitor monitor();

`ifndef SIM_QUIET
 `define CPU_ic_top or1200_ic_top
 `define CPU_dc_top or1200_dc_top
   wire ic_en = orpsoc_testbench.dut.or1200_top0.or1200_ic_top.ic_en;
   always @(posedge ic_en)
     $display("Or1200 IC enabled at %t", $time);

   wire dc_en = orpsoc_testbench.dut.or1200_top0.or1200_dc_top.dc_en;
   always @(posedge dc_en)
     $display("Or1200 DC enabled at %t", $time);
`endif


`ifdef JTAG_DEBUG   
 `ifdef VPI_DEBUG
   // Debugging interface
   vpi_debug_module vpi_dbg
     (
      .tms(tms_pad_i), 
      .tck(tck_pad_i), 
      .tdi(tdi_pad_i), 
      .tdo(tdo_pad_o)
      );
 `else   
   // If no VPI debugging, tie off JTAG inputs
   assign tdi_pad_i = 1;
   assign tck_pad_i = 0;
   assign tms_pad_i = 1;
 `endif // !`ifdef VPI_DEBUG_ENABLE
`endif //  `ifdef JTAG_DEBUG
   
`ifdef SPI0
   // SPI Flash
   AT26DFxxx spi0_flash
     (// Outputs
      .SO					(spi0_miso_i),
      // Inputs
      .CSB					(spi0_ss_o),
      .SCK					(spi0_sck_o),
      .SI					(spi0_mosi_o),
      .WPB					(spi0_w_n_o)
      );
`endif //  `ifdef SPI0

`ifdef ETH0
   // ORDB1 with OREEB1 always uses SMII, but keep this anyway.
 `ifdef SMII0

   wire 		     fast_ethernet, duplex, link;
   wire 		     eth_clk_smii_phy;

   assign eth_clk_smii_phy = eth_clk;     

   /* Converts SMII back to MII */
   smii_phy smii_phyend
     (
      // Outputs
      .smii_rx             		(/*eth0_smii_rx_pad_i*/), /* SMII RX */
      .ethphy_mii_tx_d			(ethphy_mii_tx_d[3:0]), /* MII TX */
      .ethphy_mii_tx_en			(ethphy_mii_tx_en),     /* MII TX */
      .ethphy_mii_tx_err		(ethphy_mii_tx_err),    /* MII TX */
      // Inputs
      .smii_tx				(eth0_smii_tx_pad_o),   /* SMII TX */ 
      .smii_sync			(eth0_smii_sync_pad_o), /* SMII SYNC */
      .ethphy_mii_tx_clk		(mtx_clk_o),            /* MII TX */
      
      .ethphy_mii_rx_d			(mrxd_o[3:0]), /* MII RX */
      .ethphy_mii_rx_dv			(mrxdv_o),     /* MII RX */
      .ethphy_mii_rx_err		(mrxerr_o),    /* MII RX */
      .ethphy_mii_rx_clk		(mrx_clk_o),   /* MII RX */
      
      .ethphy_mii_mcoll			(),
      .ethphy_mii_crs			(mcrs_o),
      .fast_ethernet			(fast_ethernet),
      .duplex				(duplex),
      .link				(link),
      .clk				(eth_clk_smii_phy),
      .rst_n				(rst_n));

 `endif //  `ifdef SMII0
   
   /* TX/RXes packets and checks them, enabled when ethernet MAC is */
 `include "eth_stim.v"

   eth_phy eth_phy0
     (
      // Outputs
      .mtx_clk_o			(mtx_clk_o),
      .mrx_clk_o			(mrx_clk_o),
      .mrxd_o				(mrxd_o[3:0]),
      .mrxdv_o				(mrxdv_o),
      .mrxerr_o				(mrxerr_o),
      .mcoll_o				(mcoll_o),
      .mcrs_o				(mcrs_o),
      // Sideband outputs for smii converter --jb
      .link_o                             (link),
      .speed_o                            (fast_ethernet), 
      .duplex_o                           (duplex),
      .smii_clk_i                       (eth_clk),
      .smii_sync_i                      (eth0_smii_sync_pad_o),
      .smii_rx_o                        (eth0_smii_rx_pad_i),
      // Inouts
      .md_io				(eth0_md_pad_io),
      // Inputs
 `ifndef ETH0_PHY_RST
      // If no reset out from the design, hook up to the board's active low rst
      .m_rst_n_i			(rst_n),
 `else
      .m_rst_n_i			(ethphy_rst_n),
 `endif      
      .mtxd_i				(ethphy_mii_tx_d[3:0]),
      .mtxen_i				(ethphy_mii_tx_en),
      .mtxerr_i				(ethphy_mii_tx_err),
      .mdc_i				(eth0_mdc_pad_o));

`endif //  `ifdef ETH0

   // Simple slaves to test the SPI masters
`ifdef SPI1
 `ifdef SPI1_SLAVE_SELECTS
   wire [spi1_ss_width-1:0]  spi1_leds;
   genvar 		     spi1;   
   generate
      for (spi1 = 0; spi1 < spi1_ss_width; spi1 = spi1+1) begin : spi1_gen
	 spi_slave spi1_slave
	   (.clk(clk), 
	    .SCK(spi1_sck_o), .MOSI(spi1_mosi_o), 
	    .MISO(spi1_miso_i), .SSEL(spi1_ss_o[spi1]),
	    .LED(spi1_leds[spi1]));
      end
   endgenerate
 `else // !`ifdef SPI1_SLAVE_SELECTS
   spi_slave spi1_slave
     (.clk(clk), 
      .SCK(spi1_sck_o), .MOSI(spi1_mosi_o), 
      .MISO(spi1_miso_i), .SSEL(1'b0),
      .LED());
 `endif // !`ifdef SPI1_SLAVE_SELECTS   
`endif

`ifdef SPI2
 `ifdef SPI2_SLAVE_SELECTS
   wire [spi2_ss_width-1:0] spi2_leds;
   genvar 		    spi2;   
   generate
      for (spi2 = 0; spi2 < spi2_ss_width; spi2 = spi2+1) begin : spi2_gen
	 spi_slave spi2_slave
	   (.clk(clk), 
	    .SCK(spi2_sck_o), .MOSI(spi2_mosi_o), 
	    .MISO(spi2_miso_i), .SSEL(spi2_ss_o[spi2]),
	    .LED(spi2_leds[spi2]));
      end
   endgenerate
 `else // !`ifdef SPI2_SLAVE_SELECTS
   spi_slave spi2_slave
     (.clk(clk), 
      .SCK(spi2_sck_o), .MOSI(spi2_mosi_o), 
      .MISO(spi2_miso_i), .SSEL(1'b0),
      .LED());
 `endif // !`ifdef SPI2_SLAVE_SELECTS   
`endif

`ifdef VERSATILE_SDRAM
   parameter TPROP_PCB = 2.0;
   reg [12:0] 		     sdram_a_pad_o_to_sdram;
   reg [1:0] 		     sdram_ba_pad_o_to_sdram;
   reg 		             sdram_cas_pad_o_to_sdram;
   reg 		             sdram_cke_pad_o_to_sdram;
   reg 		             sdram_cs_n_pad_o_to_sdram;
   wire [15:0] 		     sdram_dq_pad_io_to_sdram;
   reg [1:0] 		     sdram_dqm_pad_o_to_sdram;
   reg 		             sdram_ras_pad_o_to_sdram;
   reg 		             sdram_we_pad_o_to_sdram;

   always @( * ) begin
      sdram_a_pad_o_to_sdram    <= #(TPROP_PCB) sdram_a_pad_o;
      sdram_ba_pad_o_to_sdram   <= #(TPROP_PCB) sdram_ba_pad_o;
      sdram_cas_pad_o_to_sdram  <= #(TPROP_PCB) sdram_cas_pad_o;
      sdram_cke_pad_o_to_sdram  <= #(TPROP_PCB) sdram_cke_pad_o;
      sdram_cs_n_pad_o_to_sdram <= #(TPROP_PCB) sdram_cs_n_pad_o;
      sdram_dqm_pad_o_to_sdram  <= #(TPROP_PCB) sdram_dqm_pad_o;
      sdram_ras_pad_o_to_sdram  <= #(TPROP_PCB) sdram_ras_pad_o;
      sdram_we_pad_o_to_sdram   <= #(TPROP_PCB) sdram_we_pad_o;
   end

   genvar dqwd;
   generate
      for (dqwd = 0;dqwd < 16 ;dqwd = dqwd+1) begin : dq_delay
	 wiredelay #
	   (
            .Delay_g     (TPROP_PCB),
            .Delay_rd    (TPROP_PCB)
	    )
	 u_delay_dq
	   (
            .A           (sdram_dq_pad_io[dqwd]),
            .B           (sdram_dq_pad_io_to_sdram[dqwd]),
            .reset       (rst_n)
	    );
      end
   endgenerate
   
   // SDRAM
   mt48lc16m16a2 sdram0
     (
      // Inouts
      .Dq    (sdram_dq_pad_io_to_sdram),
      // Inputs
      .Addr  (sdram_a_pad_o_to_sdram),
      .Ba    (sdram_ba_pad_o_to_sdram),
      .Clk   (sdram_clk_pad_o),
      .Cke   (sdram_cke_pad_o_to_sdram),
      .Cs_n  (sdram_cs_n_pad_o_to_sdram),
      .Ras_n (sdram_ras_pad_o_to_sdram),
      .Cas_n (sdram_cas_pad_o_to_sdram),
      .We_n  (sdram_we_pad_o_to_sdram),
      .Dqm   (sdram_dqm_pad_o_to_sdram));
`endif //  `ifdef VERSATILE_SDRAM

`ifdef VCD
   reg vcd_go = 0;
   always @(vcd_go)
     begin
	
 `ifdef VCD_DELAY
	repeat(10000) begin
		#(`VCD_DELAY);
	end
 `endif

	// Delay by x insns
 `ifdef VCD_DELAY_INSNS
	#10; // Delay until after the value becomes valid
	while (monitor.insns < `VCD_DELAY_INSNS)
	  @(posedge clk);
 `endif	

 `ifdef SIMULATOR_MODELSIM
	// Modelsim can GZip VCDs on the fly if given in the suffix
  `define VCD_SUFFIX   ".vcd.gz"
 `else
  `define VCD_SUFFIX   ".vcd"
 `endif
	
`ifndef SIM_QUIET
	$display("* VCD in %s\n", {"../out/",`TEST_NAME_STRING,`VCD_SUFFIX});
`endif	
	$dumpfile({"../out/",`TEST_NAME_STRING,`VCD_SUFFIX});
 `ifndef VCD_DEPTH
  `define VCD_DEPTH 0
 `endif     
	$dumpvars(`VCD_DEPTH);
	
     end
`endif //  `ifdef VCD
   
   initial 
     begin
`ifndef SIM_QUIET
	$display("\n* Starting simulation of design RTL.\n* Test: %s\n",
		 `TEST_NAME_STRING );
`endif	
	
`ifdef VCD
	vcd_go = 1;
`endif
	
     end // initial begin
   
`ifdef END_TIME
   initial begin
      #(`END_TIME);
`ifndef SIM_QUIET      
      $display("* Finish simulation due to END_TIME being set at %t", $time);
`endif      
      $finish;
   end
`endif

`ifdef END_INSNS
   initial begin
      #10
	while (monitor.insns < `END_INSNS)
	  @(posedge clk);
 `ifndef SIM_QUIET      
      $display("* Finish simulation due to END_INSNS count (%d) reached at %t",
	       `END_INSNS, $time);
 `endif
      $finish;
   end
`endif     
   
`ifdef UART0   
   //	
   // UART0 decoder
   //   
   uart_decoder
     #( 
	.uart_baudrate_period_ns(8680) // 115200 baud = period 8.68uS
	)
   uart0_decoder
     (
      .clk(clk),
      .uart_tx(uart0_stx_pad_o)
      );
   
   // Loopback UART lines
   assign uart0_srx_pad_i = uart0_stx_pad_o;
   
`endif //  `ifdef UART0

`ifdef USB0
   // USB testbench setup...
    // All USB testbenches disabled for now
 `include "usbHostControl_h.v"
 `include "wishBoneBus_h.v"
 `include "usbHostSlave_h.v"
 `include "usbSlaveControl_h.v"
 `include "usbHostSlave_h.v"
 `include "usbConstants_h.v"
   // The actual file with stimulus:
 `include "usb_hostslave_tb.v"

`endif
   
endmodule // orpsoc_testbench

// Local Variables:
// verilog-library-directories:("." "../../rtl/verilog/orpsoc_top")
// verilog-library-files:()
// verilog-library-extensions:(".v" ".h")
// End:

