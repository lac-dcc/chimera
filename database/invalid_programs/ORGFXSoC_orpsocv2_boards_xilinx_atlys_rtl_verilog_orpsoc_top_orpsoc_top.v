//////////////////////////////////////////////////////////////////////
///                                                               //// 
/// ORPSoC top for Atlys board                                    ////
///                                                               ////
/// Instantiates modules, depending on ORPSoC defines file        ////
///                                                               ////
/// Julius Baxter, julius@opencores.org                           ////
/// Contributor(s):                                               ////
///   Stefan Kristiansson, stefan.kristiansson@saunalahti.fi      ////
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
`include "synthesis-defines.v"
module orpsoc_top
  ( 
`ifdef JTAG_DEBUG    
    tdo_pad_o, tms_pad_i, tck_pad_i, tdi_pad_i,
`endif
`ifdef XILINX_DDR2
    ddr2_a, ddr2_ba, ddr2_ras_n, ddr2_cas_n, ddr2_we_n,
    ddr2_rzq, ddr2_zio, ddr2_odt, ddr2_cke, ddr2_dm, ddr2_udm,
    ddr2_dq, ddr2_dqs, ddr2_dqs_n, ddr2_udqs, ddr2_udqs_n, 
    ddr2_ck, ddr2_ck_n,
`endif
`ifdef XILINX_SSRAM
    sram_clk, sram_clk_fb, sram_flash_addr, sram_flash_data,
    sram_cen, sram_flash_oe_n, sram_flash_we_n, sram_bw,
    sram_adv_ld_n, sram_mode,
`endif    
`ifdef UART0
    uart0_srx_pad_i, uart0_stx_pad_o,
`ifdef UART0_EXPHEADER
    uart0_srx_expheader_pad_i, uart0_stx_expheader_pad_o,
`endif
`endif
`ifdef SPI0
    spi0_mosi_o, spi0_ss_o, spi0_sck_o, spi0_miso_i,
`endif    
`ifdef I2C0
    i2c0_sda_io, i2c0_scl_io,
`endif    
`ifdef I2C1
    i2c1_sda_io, i2c1_scl_io,
`endif    
`ifdef GPIO0
    gpio0_io,
`endif
  
`ifdef ETH0
    eth0_tx_clk, eth0_tx_data, eth0_tx_en, eth0_tx_er,   
    eth0_rx_clk, eth0_rx_data, eth0_dv, eth0_rx_er,   
    eth0_col, eth0_crs,
    eth0_mdc_pad_o, eth0_md_pad_io,
 `ifdef ETH0_PHY_RST
    eth0_rst_n_o,
 `endif
`endif
`ifdef VGA0
    tmds_o,
    tmdsb_o,
`endif
`ifdef AC97
    ac97_bit_clk_pad_i, ac97_sync_pad_o, ac97_sdata_pad_o, 
    ac97_sdata_pad_i, ac97_reset_pad_o,
`endif
`ifdef PS2_0
    ps2_0_clk, ps2_0_dat,
`endif
`ifdef PS2_1
    ps2_1_clk, ps2_1_dat,
`endif
    sys_clk_in,

    rst_n_pad_i  

    );

`include "orpsoc-params.v"   

   input sys_clk_in;
   
   input rst_n_pad_i;
   
`ifdef JTAG_DEBUG    
   output tdo_pad_o;
   input  tms_pad_i;
   input  tck_pad_i;
   input  tdi_pad_i;
`endif
`ifdef XILINX_DDR2
   output [12:0] 	      ddr2_a;
   output [2:0] 	      ddr2_ba;
   output 	    	      ddr2_ras_n;
   output 	    	      ddr2_cas_n;
   output 		          ddr2_we_n;
   output                 ddr2_rzq;
   output                 ddr2_zio;
   output        	      ddr2_odt;
   output        	      ddr2_cke;
   output        	      ddr2_dm;
   output        	      ddr2_udm;
   
   inout [15:0] 	      ddr2_dq;			  
   inout     		      ddr2_dqs;
   inout     		      ddr2_dqs_n;
   inout     		      ddr2_udqs;
   inout     		      ddr2_udqs_n;
   output        	      ddr2_ck;
   output        	      ddr2_ck_n;
`endif
`ifdef UART0
   input 	 uart0_srx_pad_i;
   output 	 uart0_stx_pad_o;
   // Duplicates of the UART signals, this time to the USB debug cable
`ifdef UART0_EXPHEADER
   input 	 uart0_srx_expheader_pad_i;
   output 	 uart0_stx_expheader_pad_o;
`endif
`endif
`ifdef SPI0
   output 	 spi0_mosi_o;
   output [spi0_ss_width-1:0] spi0_ss_o;
   output 		     spi0_sck_o;
   input 		     spi0_miso_i;

`endif
`ifdef I2C0
   inout 		      i2c0_sda_io, i2c0_scl_io;
`endif   
`ifdef I2C1
   inout 		      i2c1_sda_io, i2c1_scl_io;
`endif   
`ifdef GPIO0
   inout [gpio0_io_width-1:0] gpio0_io;   
`endif 
`ifdef ETH0
   input 		      eth0_tx_clk;
   output [3:0] 	      eth0_tx_data;
   output 		      eth0_tx_en;
   output 		      eth0_tx_er;
   input 		      eth0_rx_clk;
   input [3:0] 		      eth0_rx_data;
   input 		      eth0_dv;
   input 		      eth0_rx_er;
   input 		      eth0_col;
   input 		      eth0_crs;
   output 		      eth0_mdc_pad_o;
   inout 		      eth0_md_pad_io;
 `ifdef ETH0_PHY_RST
   output 		      eth0_rst_n_o;
 `endif
`endif //  `ifdef ETH0
`ifdef VGA0
   output [3:0]               tmds_o;
   output [3:0]               tmdsb_o;
`endif
`ifdef AC97
   input              ac97_bit_clk_pad_i;
   output             ac97_sync_pad_o;
   output             ac97_sdata_pad_o;
   input              ac97_sdata_pad_i;
   output             ac97_reset_pad_o;
`endif
`ifdef PS2_0
   inout              ps2_0_clk;
   inout              ps2_0_dat;
`endif
`ifdef PS2_1
   inout              ps2_1_clk;
   inout              ps2_1_dat;
`endif

   ////////////////////////////////////////////////////////////////////////
   //
   // Clock and reset generation module
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire 		      wb_clk, wb_rst;
   wire 		      ddr2_if_clk, ddr2_if_rst;
   wire 		      clk100;
   wire                       sys_clk_ibufg;
   wire 		      dbg_tck;
   
   clkgen clkgen0
     (
      .sys_clk_in                (sys_clk_in),

      .wb_clk_o                  (wb_clk),
      .wb_rst_o                  (wb_rst),

`ifdef JTAG_DEBUG
      .tck_pad_i                 (tck_pad_i),
      .dbg_tck_o                 (dbg_tck),
`endif
`ifdef XILINX_DDR2
      .ddr2_if_clk_o             (ddr2_if_clk),
      .ddr2_if_rst_o             (ddr2_if_rst),
      .clk100_o                  (clk100),
`endif
`ifdef VGA0
      .dvi_clk_o          (dvi_clk),
`endif 

      // Asynchronous active low reset
      .rst_n_pad_i               (rst_n_pad_i)
      );

   
   ////////////////////////////////////////////////////////////////////////
   //
   // Arbiter
   // 
   ////////////////////////////////////////////////////////////////////////
   
   // Wire naming convention:
   // First: wishbone master or slave (wbm/wbs)
   // Second: Which bus it's on instruction or data (i/d)
   // Third: Between which module and the arbiter the wires are
   // Fourth: Signal name
   // Fifth: Direction relative to module (not bus/arbiter!)
   //        ie. wbm_d_or12_adr_o is address OUT from the or1200

   // OR1200 instruction bus wires
   wire [wb_aw-1:0] 	      wbm_i_or12_adr_o;
   wire [wb_dw-1:0] 	      wbm_i_or12_dat_o;
   wire [3:0] 		      wbm_i_or12_sel_o;
   wire 		      wbm_i_or12_we_o;
   wire 		      wbm_i_or12_cyc_o;
   wire 		      wbm_i_or12_stb_o;
   wire [2:0] 		      wbm_i_or12_cti_o;
   wire [1:0] 		      wbm_i_or12_bte_o;
   
   wire [wb_dw-1:0] 	      wbm_i_or12_dat_i;   
   wire 		      wbm_i_or12_ack_i;
   wire 		      wbm_i_or12_err_i;
   wire 		      wbm_i_or12_rty_i;

   // OR1200 data bus wires   
   wire [wb_aw-1:0] 	      wbm_d_or12_adr_o;
   wire [wb_dw-1:0] 	      wbm_d_or12_dat_o;
   wire [3:0] 		      wbm_d_or12_sel_o;
   wire 		      wbm_d_or12_we_o;
   wire 		      wbm_d_or12_cyc_o;
   wire 		      wbm_d_or12_stb_o;
   wire [2:0] 		      wbm_d_or12_cti_o;
   wire [1:0] 		      wbm_d_or12_bte_o;
   
   wire [wb_dw-1:0] 	      wbm_d_or12_dat_i;   
   wire 		      wbm_d_or12_ack_i;
   wire 		      wbm_d_or12_err_i;
   wire 		      wbm_d_or12_rty_i;   

   // Debug interface bus wires   
   wire [wb_aw-1:0] 	      wbm_d_dbg_adr_o;
   wire [wb_dw-1:0] 	      wbm_d_dbg_dat_o;
   wire [3:0] 		      wbm_d_dbg_sel_o;
   wire 		      wbm_d_dbg_we_o;
   wire 		      wbm_d_dbg_cyc_o;
   wire 		      wbm_d_dbg_stb_o;
   wire [2:0] 		      wbm_d_dbg_cti_o;
   wire [1:0] 		      wbm_d_dbg_bte_o;
   
   wire [wb_dw-1:0] 	      wbm_d_dbg_dat_i;   
   wire 		      wbm_d_dbg_ack_i;
   wire 		      wbm_d_dbg_err_i;
   wire 		      wbm_d_dbg_rty_i;

   // Byte bus bridge master signals
   wire [wb_aw-1:0] 	      wbm_b_d_adr_o;
   wire [wb_dw-1:0] 	      wbm_b_d_dat_o;
   wire [3:0] 		      wbm_b_d_sel_o;
   wire 		      wbm_b_d_we_o;
   wire 		      wbm_b_d_cyc_o;
   wire 		      wbm_b_d_stb_o;
   wire [2:0] 		      wbm_b_d_cti_o;
   wire [1:0] 		      wbm_b_d_bte_o;
   
   wire [wb_dw-1:0] 	      wbm_b_d_dat_i;   
   wire 		      wbm_b_d_ack_i;
   wire 		      wbm_b_d_err_i;
   wire 		      wbm_b_d_rty_i;   

   // Instruction bus slave wires //
   
   // rom0 instruction bus wires
   wire [31:0] 		      wbs_i_rom0_adr_i;
   wire [wbs_i_rom0_data_width-1:0] wbs_i_rom0_dat_i;
   wire [3:0] 			    wbs_i_rom0_sel_i;
   wire 			    wbs_i_rom0_we_i;
   wire 			    wbs_i_rom0_cyc_i;
   wire 			    wbs_i_rom0_stb_i;
   wire [2:0] 			    wbs_i_rom0_cti_i;
   wire [1:0] 			    wbs_i_rom0_bte_i;   
   wire [wbs_i_rom0_data_width-1:0] wbs_i_rom0_dat_o;   
   wire 			    wbs_i_rom0_ack_o;
   wire 			    wbs_i_rom0_err_o;
   wire 			    wbs_i_rom0_rty_o;   

   // mc0 instruction bus wires
   wire [31:0] 			    wbs_i_mc0_adr_i;
   wire [wbs_i_mc0_data_width-1:0]  wbs_i_mc0_dat_i;
   wire [3:0] 			    wbs_i_mc0_sel_i;
   wire 			    wbs_i_mc0_we_i;
   wire 			    wbs_i_mc0_cyc_i;
   wire 			    wbs_i_mc0_stb_i;
   wire [2:0] 			    wbs_i_mc0_cti_i;
   wire [1:0] 			    wbs_i_mc0_bte_i;   
   wire [wbs_i_mc0_data_width-1:0]  wbs_i_mc0_dat_o;   
   wire 			    wbs_i_mc0_ack_o;
   wire 			    wbs_i_mc0_err_o;
   wire 			    wbs_i_mc0_rty_o;   
   
   // Data bus slave wires //
   
   // mc0 data bus wires
   wire [31:0] 			    wbs_d_mc0_adr_i;
   wire [wbs_d_mc0_data_width-1:0]  wbs_d_mc0_dat_i;
   wire [3:0] 			    wbs_d_mc0_sel_i;
   wire 			    wbs_d_mc0_we_i;
   wire 			    wbs_d_mc0_cyc_i;
   wire 			    wbs_d_mc0_stb_i;
   wire [2:0] 			    wbs_d_mc0_cti_i;
   wire [1:0] 			    wbs_d_mc0_bte_i;   
   wire [wbs_d_mc0_data_width-1:0]  wbs_d_mc0_dat_o;   
   wire 			    wbs_d_mc0_ack_o;
   wire 			    wbs_d_mc0_err_o;
   wire 			    wbs_d_mc0_rty_o;
   
   // i2c0 wires
   wire [31:0] 			    wbs_d_i2c0_adr_i;
   wire [wbs_d_i2c0_data_width-1:0] wbs_d_i2c0_dat_i;
   wire [3:0] 			    wbs_d_i2c0_sel_i;
   wire 			    wbs_d_i2c0_we_i;
   wire 			    wbs_d_i2c0_cyc_i;
   wire 			    wbs_d_i2c0_stb_i;
   wire [2:0] 			    wbs_d_i2c0_cti_i;
   wire [1:0] 			    wbs_d_i2c0_bte_i;   
   wire [wbs_d_i2c0_data_width-1:0] wbs_d_i2c0_dat_o;   
   wire 			    wbs_d_i2c0_ack_o;
   wire 			    wbs_d_i2c0_err_o;
   wire 			    wbs_d_i2c0_rty_o;   

   // i2c1 wires
   wire [31:0] 			    wbs_d_i2c1_adr_i;
   wire [wbs_d_i2c1_data_width-1:0] wbs_d_i2c1_dat_i;
   wire [3:0] 			    wbs_d_i2c1_sel_i;
   wire 			    wbs_d_i2c1_we_i;
   wire 			    wbs_d_i2c1_cyc_i;
   wire 			    wbs_d_i2c1_stb_i;
   wire [2:0] 			    wbs_d_i2c1_cti_i;
   wire [1:0] 			    wbs_d_i2c1_bte_i;   
   wire [wbs_d_i2c1_data_width-1:0] wbs_d_i2c1_dat_o;   
   wire 			    wbs_d_i2c1_ack_o;
   wire 			    wbs_d_i2c1_err_o;
   wire 			    wbs_d_i2c1_rty_o;
   
   // spi0 wires
   wire [31:0] 			    wbs_d_spi0_adr_i;
   wire [wbs_d_spi0_data_width-1:0] wbs_d_spi0_dat_i;
   wire [3:0] 			    wbs_d_spi0_sel_i;
   wire 			    wbs_d_spi0_we_i;
   wire 			    wbs_d_spi0_cyc_i;
   wire 			    wbs_d_spi0_stb_i;
   wire [2:0] 			    wbs_d_spi0_cti_i;
   wire [1:0] 			    wbs_d_spi0_bte_i;   
   wire [wbs_d_spi0_data_width-1:0] wbs_d_spi0_dat_o;   
   wire 			    wbs_d_spi0_ack_o;
   wire 			    wbs_d_spi0_err_o;
   wire 			    wbs_d_spi0_rty_o;   

   // uart0 wires
   wire [31:0] 			     wbs_d_uart0_adr_i;
   wire [wbs_d_uart0_data_width-1:0] wbs_d_uart0_dat_i;
   wire [3:0] 			     wbs_d_uart0_sel_i;
   wire 			     wbs_d_uart0_we_i;
   wire 			     wbs_d_uart0_cyc_i;
   wire 			     wbs_d_uart0_stb_i;
   wire [2:0] 			     wbs_d_uart0_cti_i;
   wire [1:0] 			     wbs_d_uart0_bte_i;   
   wire [wbs_d_uart0_data_width-1:0] wbs_d_uart0_dat_o;   
   wire 			     wbs_d_uart0_ack_o;
   wire 			     wbs_d_uart0_err_o;
   wire 			     wbs_d_uart0_rty_o;   
   
   // gpio0 wires
   wire [31:0] 			     wbs_d_gpio0_adr_i;
   wire [wbs_d_gpio0_data_width-1:0] wbs_d_gpio0_dat_i;
   wire [3:0] 			     wbs_d_gpio0_sel_i;
   wire 			     wbs_d_gpio0_we_i;
   wire 			     wbs_d_gpio0_cyc_i;
   wire 			     wbs_d_gpio0_stb_i;
   wire [2:0] 			     wbs_d_gpio0_cti_i;
   wire [1:0] 			     wbs_d_gpio0_bte_i;   
   wire [wbs_d_gpio0_data_width-1:0] wbs_d_gpio0_dat_o;   
   wire 			     wbs_d_gpio0_ack_o;
   wire 			     wbs_d_gpio0_err_o;
   wire 			     wbs_d_gpio0_rty_o;

   // ps2_0 wires
   wire [31:0]               wbs_d_ps2_0_adr_i;
   wire [wbs_d_ps2_0_data_width-1:0] wbs_d_ps2_0_dat_i;
   wire [3:0]                wbs_d_ps2_0_sel_i;
   wire                  wbs_d_ps2_0_we_i;
   wire                  wbs_d_ps2_0_cyc_i;
   wire                  wbs_d_ps2_0_stb_i;
   wire [2:0]                wbs_d_ps2_0_cti_i;
   wire [1:0]                wbs_d_ps2_0_bte_i;   
   wire [wbs_d_ps2_0_data_width-1:0] wbs_d_ps2_0_dat_o;   
   wire                  wbs_d_ps2_0_ack_o;
   wire                  wbs_d_ps2_0_err_o;
   wire                  wbs_d_ps2_0_rty_o;

   // ps2_1 wires
   wire [31:0]               wbs_d_ps2_1_adr_i;
   wire [wbs_d_ps2_1_data_width-1:0] wbs_d_ps2_1_dat_i;
   wire [3:0]                wbs_d_ps2_1_sel_i;
   wire                  wbs_d_ps2_1_we_i;
   wire                  wbs_d_ps2_1_cyc_i;
   wire                  wbs_d_ps2_1_stb_i;
   wire [2:0]                wbs_d_ps2_1_cti_i;
   wire [1:0]                wbs_d_ps2_1_bte_i;   
   wire [wbs_d_ps2_1_data_width-1:0] wbs_d_ps2_1_dat_o;   
   wire                  wbs_d_ps2_1_ack_o;
   wire                  wbs_d_ps2_1_err_o;
   wire                  wbs_d_ps2_1_rty_o;

   // eth0 slave wires
   wire [31:0] 				  wbs_d_eth0_adr_i;
   wire [wbs_d_eth0_data_width-1:0] 	  wbs_d_eth0_dat_i;
   wire [3:0] 				  wbs_d_eth0_sel_i;
   wire 				  wbs_d_eth0_we_i;
   wire 				  wbs_d_eth0_cyc_i;
   wire 				  wbs_d_eth0_stb_i;
   wire [2:0] 				  wbs_d_eth0_cti_i;
   wire [1:0] 				  wbs_d_eth0_bte_i;   
   wire [wbs_d_eth0_data_width-1:0] 	  wbs_d_eth0_dat_o;   
   wire 				  wbs_d_eth0_ack_o;
   wire 				  wbs_d_eth0_err_o;
   wire 				  wbs_d_eth0_rty_o;

   // eth0 master wires
   wire [wbm_eth0_addr_width-1:0] 	  wbm_eth0_adr_o;
   wire [wbm_eth0_data_width-1:0] 	  wbm_eth0_dat_o;
   wire [3:0] 				  wbm_eth0_sel_o;
   wire 				  wbm_eth0_we_o;
   wire 				  wbm_eth0_cyc_o;
   wire 				  wbm_eth0_stb_o;
   wire [2:0] 				  wbm_eth0_cti_o;
   wire [1:0] 				  wbm_eth0_bte_o;
   wire [wbm_eth0_data_width-1:0]         wbm_eth0_dat_i;
   wire 				  wbm_eth0_ack_i;
   wire 				  wbm_eth0_err_i;
   wire 				  wbm_eth0_rty_i;

   // vga0 slave wires
   wire [31:0]                      wbs_d_vga0_adr_i;
   wire [wbs_d_vga0_data_width-1:0] wbs_d_vga0_dat_i;
   wire [3:0]                       wbs_d_vga0_sel_i;
   wire                             wbs_d_vga0_we_i;
   wire                             wbs_d_vga0_cyc_i;
   wire                             wbs_d_vga0_stb_i;
   wire [2:0]                       wbs_d_vga0_cti_i;
   wire [1:0]                       wbs_d_vga0_bte_i;   
   wire [wbs_d_vga0_data_width-1:0] wbs_d_vga0_dat_o;   
   wire                             wbs_d_vga0_ack_o;
   wire                             wbs_d_vga0_err_o;
   wire                             wbs_d_vga0_rty_o;

   // vga0 master wires
   wire [wbm_vga0_addr_width-1:0] 	wbm_vga0_adr_o;
   wire [wbm_vga0_data_width-1:0] 	wbm_vga0_dat_o;
   wire [3:0]                       wbm_vga0_sel_o;
   wire                             wbm_vga0_we_o;
   wire                             wbm_vga0_cyc_o;
   wire                             wbm_vga0_stb_o;
   wire [2:0]                       wbm_vga0_cti_o;
   wire [1:0]                       wbm_vga0_bte_o;
   wire [wbm_vga0_data_width-1:0]   wbm_vga0_dat_i;
   wire                             wbm_vga0_ack_i;
   wire                             wbm_vga0_err_i;
   wire                             wbm_vga0_rty_i;

   // gfx0 slave wires
   wire [31:0]                      wbs_d_gfx0_adr_i;
   wire [wbs_d_gfx0_data_width-1:0] wbs_d_gfx0_dat_i;
   wire [3:0]                       wbs_d_gfx0_sel_i;
   wire                             wbs_d_gfx0_we_i;
   wire                             wbs_d_gfx0_cyc_i;
   wire                             wbs_d_gfx0_stb_i;
   wire [2:0]                       wbs_d_gfx0_cti_i;
   wire [1:0]                       wbs_d_gfx0_bte_i;   
   wire [wbs_d_gfx0_data_width-1:0] wbs_d_gfx0_dat_o;   
   wire                             wbs_d_gfx0_ack_o;
   wire                             wbs_d_gfx0_err_o;
   wire                             wbs_d_gfx0_rty_o;

   // GFX video bus wires   
   wire [wbm_write_gfx0_addr_width-1:0] wbm_write_gfx0_adr_o;
   wire [wbm_write_gfx0_data_width-1:0] wbm_write_gfx0_dat_o;
   wire [3:0] 		          wbm_write_gfx0_sel_o;
   wire 		          wbm_write_gfx0_we_o;
   wire 		          wbm_write_gfx0_cyc_o;
   wire 		          wbm_write_gfx0_stb_o;
   wire [2:0] 		          wbm_write_gfx0_cti_o;
   wire [1:0] 		          wbm_write_gfx0_bte_o;
   wire [wbm_write_gfx0_data_width-1:0] wbm_write_gfx0_dat_i;   
   wire 		          wbm_write_gfx0_ack_i;
   wire 		          wbm_write_gfx0_err_i;
   wire 		          wbm_write_gfx0_rty_i;

   wire 			  wbm_read_gfx0_cyc_o;
   wire 			  wbm_read_gfx0_stb_o;
   wire [2:0] 			  wbm_read_gfx0_cti_o;
   wire [1:0] 			  wbm_read_gfx0_bte_o;
   wire				  wbm_read_gfx0_we_o;
   wire [wbm_read_gfx0_addr_width-1:0] wbm_read_gfx0_adr_o;
   wire [3:0] 			  wbm_read_gfx0_sel_o;
   wire 			  wbm_read_gfx0_ack_i;
   wire 			  wbm_read_gfx0_err_i;
   wire [wbm_read_gfx0_data_width-1:0] wbm_read_gfx0_dat_i;

   // ac97 slave wires
   wire [31:0]                      wbs_d_ac97_adr_i;
   wire [wbs_d_ac97_data_width-1:0] wbs_d_ac97_dat_i;
   wire [3:0]                       wbs_d_ac97_sel_i;
   wire                             wbs_d_ac97_we_i;
   wire                             wbs_d_ac97_cyc_i;
   wire                             wbs_d_ac97_stb_i;
   wire [2:0]                       wbs_d_ac97_cti_i;
   wire [1:0]                       wbs_d_ac97_bte_i;   
   wire [wbs_d_ac97_data_width-1:0] wbs_d_ac97_dat_o;   
   wire                             wbs_d_ac97_ack_o;
   wire                             wbs_d_ac97_err_o;
   wire                             wbs_d_ac97_rty_o;

   // dma0 slave wires
   wire [31:0]                      wbs_d_dma0_adr_i;
   wire [wbs_d_dma0_data_width-1:0] wbs_d_dma0_dat_i;
   wire [3:0]                       wbs_d_dma0_sel_i;
   wire                             wbs_d_dma0_we_i;
   wire                             wbs_d_dma0_cyc_i;
   wire                             wbs_d_dma0_stb_i;
   wire [2:0]                       wbs_d_dma0_cti_i;
   wire [1:0]                       wbs_d_dma0_bte_i;   
   wire [wbs_d_dma0_data_width-1:0] wbs_d_dma0_dat_o;   
   wire                             wbs_d_dma0_ack_o;
   wire                             wbs_d_dma0_err_o;
   wire                             wbs_d_dma0_rty_o;

   // dma0 master wires
   wire [wbm_dma0_addr_width-1:0] 	wbm_dma0_adr_o;
   wire [wbm_dma0_data_width-1:0] 	wbm_dma0_dat_o;
   wire [3:0]                       wbm_dma0_sel_o;
   wire                             wbm_dma0_we_o;
   wire                             wbm_dma0_cyc_o;
   wire                             wbm_dma0_stb_o;
   wire [2:0]                       wbm_dma0_cti_o;
   wire [1:0]                       wbm_dma0_bte_o;
   wire [wbm_dma0_data_width-1:0]   wbm_dma0_dat_i;
   wire                             wbm_dma0_ack_i;
   wire                             wbm_dma0_err_i;
   wire                             wbm_dma0_rty_i;

   // fdt0 slave wires
   wire [31:0] 			    wbs_d_fdt0_adr_i;
   wire [wbs_d_fdt0_data_width-1:0] wbs_d_fdt0_dat_i;
   wire [3:0] 	                    wbs_d_fdt0_sel_i;
   wire 				    wbs_d_fdt0_we_i;
   wire 				    wbs_d_fdt0_cyc_i;
   wire 				    wbs_d_fdt0_stb_i;
   wire [2:0] 				    wbs_d_fdt0_cti_i;
   wire [1:0] 				    wbs_d_fdt0_bte_i;
   wire [wbs_d_fdt0_data_width-1:0] 	    wbs_d_fdt0_dat_o;
   wire 				    wbs_d_fdt0_ack_o;
   wire 				    wbs_d_fdt0_err_o;
   wire 				    wbs_d_fdt0_rty_o;

   //
   // Wishbone instruction bus arbiter
   //
   
   arbiter_ibus arbiter_ibus0
     (
      // Instruction Bus Master
      // Inputs to arbiter from master
      .wbm_adr_o			(wbm_i_or12_adr_o),
      .wbm_dat_o			(wbm_i_or12_dat_o),
      .wbm_sel_o			(wbm_i_or12_sel_o),
      .wbm_we_o				(wbm_i_or12_we_o),
      .wbm_cyc_o			(wbm_i_or12_cyc_o),
      .wbm_stb_o			(wbm_i_or12_stb_o),
      .wbm_cti_o			(wbm_i_or12_cti_o),
      .wbm_bte_o			(wbm_i_or12_bte_o),
      // Outputs to master from arbiter
      .wbm_dat_i			(wbm_i_or12_dat_i),
      .wbm_ack_i			(wbm_i_or12_ack_i),
      .wbm_err_i			(wbm_i_or12_err_i),
      .wbm_rty_i			(wbm_i_or12_rty_i),
      
      // Slave 0
      // Inputs to slave from arbiter
      .wbs0_adr_i			(wbs_i_rom0_adr_i),
      .wbs0_dat_i			(wbs_i_rom0_dat_i),
      .wbs0_sel_i			(wbs_i_rom0_sel_i),
      .wbs0_we_i			(wbs_i_rom0_we_i),
      .wbs0_cyc_i			(wbs_i_rom0_cyc_i),
      .wbs0_stb_i			(wbs_i_rom0_stb_i),
      .wbs0_cti_i			(wbs_i_rom0_cti_i),
      .wbs0_bte_i			(wbs_i_rom0_bte_i),
      // Outputs from slave to arbiter      
      .wbs0_dat_o			(wbs_i_rom0_dat_o),
      .wbs0_ack_o			(wbs_i_rom0_ack_o),
      .wbs0_err_o			(wbs_i_rom0_err_o),
      .wbs0_rty_o			(wbs_i_rom0_rty_o),

      // Slave 1
      // Inputs to slave from arbiter
      .wbs1_adr_i			(wbs_i_mc0_adr_i),
      .wbs1_dat_i			(wbs_i_mc0_dat_i),
      .wbs1_sel_i			(wbs_i_mc0_sel_i),
      .wbs1_we_i			(wbs_i_mc0_we_i),
      .wbs1_cyc_i			(wbs_i_mc0_cyc_i),
      .wbs1_stb_i			(wbs_i_mc0_stb_i),
      .wbs1_cti_i			(wbs_i_mc0_cti_i),
      .wbs1_bte_i			(wbs_i_mc0_bte_i),
      // Outputs from slave to arbiter
      .wbs1_dat_o			(wbs_i_mc0_dat_o),
      .wbs1_ack_o			(wbs_i_mc0_ack_o),
      .wbs1_err_o			(wbs_i_mc0_err_o),
      .wbs1_rty_o			(wbs_i_mc0_rty_o),

      // Clock, reset inputs
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam arbiter_ibus0.wb_addr_match_width = ibus_arb_addr_match_width;

   defparam arbiter_ibus0.slave0_adr = ibus_arb_slave0_adr; // FLASH ROM
   defparam arbiter_ibus0.slave1_adr = ibus_arb_slave1_adr; // Main memory

   //
   // Wishbone data bus arbiter
   //
   
   arbiter_dbus arbiter_dbus0
     (
      // Master 0
      // Inputs to arbiter from master
      .wbm0_adr_o			(wbm_d_or12_adr_o),
      .wbm0_dat_o			(wbm_d_or12_dat_o),
      .wbm0_sel_o			(wbm_d_or12_sel_o),
      .wbm0_we_o			(wbm_d_or12_we_o),
      .wbm0_cyc_o			(wbm_d_or12_cyc_o),
      .wbm0_stb_o			(wbm_d_or12_stb_o),
      .wbm0_cti_o			(wbm_d_or12_cti_o),
      .wbm0_bte_o			(wbm_d_or12_bte_o),
      // Outputs to master from arbiter
      .wbm0_dat_i			(wbm_d_or12_dat_i),
      .wbm0_ack_i			(wbm_d_or12_ack_i),
      .wbm0_err_i			(wbm_d_or12_err_i),
      .wbm0_rty_i			(wbm_d_or12_rty_i),

      // Master 0
      // Inputs to arbiter from master
      .wbm1_adr_o			(wbm_d_dbg_adr_o),
      .wbm1_dat_o			(wbm_d_dbg_dat_o),
      .wbm1_we_o			(wbm_d_dbg_we_o),
      .wbm1_cyc_o			(wbm_d_dbg_cyc_o),
      .wbm1_sel_o			(wbm_d_dbg_sel_o),
      .wbm1_stb_o			(wbm_d_dbg_stb_o),
      .wbm1_cti_o			(wbm_d_dbg_cti_o),
      .wbm1_bte_o			(wbm_d_dbg_bte_o),
      // Outputs to master from arbiter      
      .wbm1_dat_i			(wbm_d_dbg_dat_i),
      .wbm1_ack_i			(wbm_d_dbg_ack_i),
      .wbm1_err_i			(wbm_d_dbg_err_i),
      .wbm1_rty_i			(wbm_d_dbg_rty_i),

      // Slaves
      
      .wbs0_adr_i			(wbs_d_mc0_adr_i),
      .wbs0_dat_i			(wbs_d_mc0_dat_i),
      .wbs0_sel_i			(wbs_d_mc0_sel_i),
      .wbs0_we_i			(wbs_d_mc0_we_i),
      .wbs0_cyc_i			(wbs_d_mc0_cyc_i),
      .wbs0_stb_i			(wbs_d_mc0_stb_i),
      .wbs0_cti_i			(wbs_d_mc0_cti_i),
      .wbs0_bte_i			(wbs_d_mc0_bte_i),
      .wbs0_dat_o			(wbs_d_mc0_dat_o),
      .wbs0_ack_o			(wbs_d_mc0_ack_o),
      .wbs0_err_o			(wbs_d_mc0_err_o),
      .wbs0_rty_o			(wbs_d_mc0_rty_o),

      .wbs1_adr_i			(wbs_d_eth0_adr_i),
      .wbs1_dat_i			(wbs_d_eth0_dat_i),
      .wbs1_sel_i			(wbs_d_eth0_sel_i),
      .wbs1_we_i			(wbs_d_eth0_we_i),
      .wbs1_cyc_i			(wbs_d_eth0_cyc_i),
      .wbs1_stb_i			(wbs_d_eth0_stb_i),
      .wbs1_cti_i			(wbs_d_eth0_cti_i),
      .wbs1_bte_i			(wbs_d_eth0_bte_i),
      .wbs1_dat_o			(wbs_d_eth0_dat_o),
      .wbs1_ack_o			(wbs_d_eth0_ack_o),
      .wbs1_err_o			(wbs_d_eth0_err_o),
      .wbs1_rty_o			(wbs_d_eth0_rty_o),
      
      .wbs2_adr_i			(wbm_b_d_adr_o),
      .wbs2_dat_i			(wbm_b_d_dat_o),
      .wbs2_sel_i			(wbm_b_d_sel_o),
      .wbs2_we_i			(wbm_b_d_we_o),
      .wbs2_cyc_i			(wbm_b_d_cyc_o),
      .wbs2_stb_i			(wbm_b_d_stb_o),
      .wbs2_cti_i			(wbm_b_d_cti_o),
      .wbs2_bte_i			(wbm_b_d_bte_o),
      .wbs2_dat_o			(wbm_b_d_dat_i),
      .wbs2_ack_o			(wbm_b_d_ack_i),
      .wbs2_err_o			(wbm_b_d_err_i),
      .wbs2_rty_o			(wbm_b_d_rty_i),

      .wbs3_adr_i           (wbs_d_vga0_adr_i),
      .wbs3_dat_i           (wbs_d_vga0_dat_i),
      .wbs3_sel_i           (wbs_d_vga0_sel_i),
      .wbs3_we_i            (wbs_d_vga0_we_i),
      .wbs3_cyc_i           (wbs_d_vga0_cyc_i),
      .wbs3_stb_i           (wbs_d_vga0_stb_i),
      .wbs3_cti_i           (wbs_d_vga0_cti_i),
      .wbs3_bte_i           (wbs_d_vga0_bte_i),
      .wbs3_dat_o           (wbs_d_vga0_dat_o),
      .wbs3_ack_o           (wbs_d_vga0_ack_o),
      .wbs3_err_o           (wbs_d_vga0_err_o),
      .wbs3_rty_o           (wbs_d_vga0_rty_o),

      .wbs4_adr_i           (wbs_d_ac97_adr_i),
      .wbs4_dat_i           (wbs_d_ac97_dat_i),
      .wbs4_sel_i           (wbs_d_ac97_sel_i),
      .wbs4_we_i            (wbs_d_ac97_we_i),
      .wbs4_cyc_i           (wbs_d_ac97_cyc_i),
      .wbs4_stb_i           (wbs_d_ac97_stb_i),
      .wbs4_cti_i           (wbs_d_ac97_cti_i),
      .wbs4_bte_i           (wbs_d_ac97_bte_i),
      .wbs4_dat_o           (wbs_d_ac97_dat_o),
      .wbs4_ack_o           (wbs_d_ac97_ack_o),
      .wbs4_err_o           (wbs_d_ac97_err_o),
      .wbs4_rty_o           (wbs_d_ac97_rty_o),

      .wbs5_adr_i           (wbs_d_dma0_adr_i),
      .wbs5_dat_i           (wbs_d_dma0_dat_i),
      .wbs5_sel_i           (wbs_d_dma0_sel_i),
      .wbs5_we_i            (wbs_d_dma0_we_i),
      .wbs5_cyc_i           (wbs_d_dma0_cyc_i),
      .wbs5_stb_i           (wbs_d_dma0_stb_i),
      .wbs5_cti_i           (wbs_d_dma0_cti_i),
      .wbs5_bte_i           (wbs_d_dma0_bte_i),
      .wbs5_dat_o           (wbs_d_dma0_dat_o),
      .wbs5_ack_o           (wbs_d_dma0_ack_o),
      .wbs5_err_o           (wbs_d_dma0_err_o),
      .wbs5_rty_o           (wbs_d_dma0_rty_o),

      .wbs6_adr_i           (wbs_d_fdt0_adr_i),
      .wbs6_dat_i           (wbs_d_fdt0_dat_i),
      .wbs6_sel_i           (wbs_d_fdt0_sel_i),
      .wbs6_we_i            (wbs_d_fdt0_we_i),
      .wbs6_cyc_i           (wbs_d_fdt0_cyc_i),
      .wbs6_stb_i           (wbs_d_fdt0_stb_i),
      .wbs6_cti_i           (wbs_d_fdt0_cti_i),
      .wbs6_bte_i           (wbs_d_fdt0_bte_i),
      .wbs6_dat_o           (wbs_d_fdt0_dat_o),
      .wbs6_ack_o           (wbs_d_fdt0_ack_o),
      .wbs6_err_o           (wbs_d_fdt0_err_o),
      .wbs6_rty_o           (wbs_d_fdt0_rty_o),

      .wbs7_adr_i           (wbs_d_gfx0_adr_i),
      .wbs7_dat_i           (wbs_d_gfx0_dat_i),
      .wbs7_sel_i           (wbs_d_gfx0_sel_i),
      .wbs7_we_i            (wbs_d_gfx0_we_i),
      .wbs7_cyc_i           (wbs_d_gfx0_cyc_i),
      .wbs7_stb_i           (wbs_d_gfx0_stb_i),
      .wbs7_cti_i           (wbs_d_gfx0_cti_i),
      .wbs7_bte_i           (wbs_d_gfx0_bte_i),
      .wbs7_dat_o           (wbs_d_gfx0_dat_o),
      .wbs7_ack_o           (wbs_d_gfx0_ack_o),
      .wbs7_err_o           (wbs_d_gfx0_err_o),
      .wbs7_rty_o           (wbs_d_gfx0_rty_o),

      // Clock, reset inputs
      .wb_clk			(wb_clk),
      .wb_rst			(wb_rst));

   // These settings are from top level params file
   defparam arbiter_dbus0.wb_addr_match_width = dbus_arb_wb_addr_match_width;
   defparam arbiter_dbus0.wb_num_slaves = dbus_arb_wb_num_slaves;
   defparam arbiter_dbus0.slave0_adr = dbus_arb_slave0_adr;
   defparam arbiter_dbus0.slave1_adr = dbus_arb_slave1_adr;
   defparam arbiter_dbus0.slave3_adr = dbus_arb_slave3_adr;
   defparam arbiter_dbus0.slave4_adr = dbus_arb_slave4_adr;
   defparam arbiter_dbus0.slave5_adr = dbus_arb_slave5_adr;
   defparam arbiter_dbus0.slave6_adr = dbus_arb_slave6_adr;
   defparam arbiter_dbus0.slave7_adr = dbus_arb_slave7_adr;

   //
   // Wishbone byte-wide bus arbiter
   //   
   
   arbiter_bytebus arbiter_bytebus0
     (

      // Master 0
      // Inputs to arbiter from master
      .wbm0_adr_o			(wbm_b_d_adr_o),
      .wbm0_dat_o			(wbm_b_d_dat_o),
      .wbm0_sel_o			(wbm_b_d_sel_o),
      .wbm0_we_o			(wbm_b_d_we_o),
      .wbm0_cyc_o			(wbm_b_d_cyc_o),
      .wbm0_stb_o			(wbm_b_d_stb_o),
      .wbm0_cti_o			(wbm_b_d_cti_o),
      .wbm0_bte_o			(wbm_b_d_bte_o),
      // Outputs to master from arbiter
      .wbm0_dat_i			(wbm_b_d_dat_i),
      .wbm0_ack_i			(wbm_b_d_ack_i),
      .wbm0_err_i			(wbm_b_d_err_i),
      .wbm0_rty_i			(wbm_b_d_rty_i),

      // Byte bus slaves
      
      .wbs0_adr_i			(wbs_d_uart0_adr_i),
      .wbs0_dat_i			(wbs_d_uart0_dat_i),
      .wbs0_we_i			(wbs_d_uart0_we_i),
      .wbs0_cyc_i			(wbs_d_uart0_cyc_i),
      .wbs0_stb_i			(wbs_d_uart0_stb_i),
      .wbs0_cti_i			(wbs_d_uart0_cti_i),
      .wbs0_bte_i			(wbs_d_uart0_bte_i),
      .wbs0_dat_o			(wbs_d_uart0_dat_o),
      .wbs0_ack_o			(wbs_d_uart0_ack_o),
      .wbs0_err_o			(wbs_d_uart0_err_o),
      .wbs0_rty_o			(wbs_d_uart0_rty_o),

      .wbs1_adr_i			(wbs_d_gpio0_adr_i),
      .wbs1_dat_i			(wbs_d_gpio0_dat_i),
      .wbs1_we_i			(wbs_d_gpio0_we_i),
      .wbs1_cyc_i			(wbs_d_gpio0_cyc_i),
      .wbs1_stb_i			(wbs_d_gpio0_stb_i),
      .wbs1_cti_i			(wbs_d_gpio0_cti_i),
      .wbs1_bte_i			(wbs_d_gpio0_bte_i),
      .wbs1_dat_o			(wbs_d_gpio0_dat_o),
      .wbs1_ack_o			(wbs_d_gpio0_ack_o),
      .wbs1_err_o			(wbs_d_gpio0_err_o),
      .wbs1_rty_o			(wbs_d_gpio0_rty_o),

      .wbs2_adr_i			(wbs_d_i2c0_adr_i),
      .wbs2_dat_i			(wbs_d_i2c0_dat_i),
      .wbs2_we_i			(wbs_d_i2c0_we_i), 
      .wbs2_cyc_i			(wbs_d_i2c0_cyc_i),
      .wbs2_stb_i			(wbs_d_i2c0_stb_i),
      .wbs2_cti_i			(wbs_d_i2c0_cti_i),
      .wbs2_bte_i			(wbs_d_i2c0_bte_i),
      .wbs2_dat_o			(wbs_d_i2c0_dat_o),
      .wbs2_ack_o			(wbs_d_i2c0_ack_o),
      .wbs2_err_o			(wbs_d_i2c0_err_o),
      .wbs2_rty_o			(wbs_d_i2c0_rty_o),

      .wbs3_adr_i			(wbs_d_i2c1_adr_i),
      .wbs3_dat_i			(wbs_d_i2c1_dat_i),
      .wbs3_we_i			(wbs_d_i2c1_we_i), 
      .wbs3_cyc_i			(wbs_d_i2c1_cyc_i),
      .wbs3_stb_i			(wbs_d_i2c1_stb_i),
      .wbs3_cti_i			(wbs_d_i2c1_cti_i),
      .wbs3_bte_i			(wbs_d_i2c1_bte_i),
      .wbs3_dat_o			(wbs_d_i2c1_dat_o),
      .wbs3_ack_o			(wbs_d_i2c1_ack_o),
      .wbs3_err_o			(wbs_d_i2c1_err_o),
      .wbs3_rty_o			(wbs_d_i2c1_rty_o),

      .wbs4_adr_i			(wbs_d_spi0_adr_i),
      .wbs4_dat_i			(wbs_d_spi0_dat_i),
      .wbs4_we_i			(wbs_d_spi0_we_i), 
      .wbs4_cyc_i			(wbs_d_spi0_cyc_i),
      .wbs4_stb_i			(wbs_d_spi0_stb_i),
      .wbs4_cti_i			(wbs_d_spi0_cti_i),
      .wbs4_bte_i			(wbs_d_spi0_bte_i),
      .wbs4_dat_o			(wbs_d_spi0_dat_o),
      .wbs4_ack_o			(wbs_d_spi0_ack_o),
      .wbs4_err_o			(wbs_d_spi0_err_o),
      .wbs4_rty_o			(wbs_d_spi0_rty_o),

      .wbs5_adr_i           (wbs_d_ps2_0_adr_i),
      .wbs5_dat_i           (wbs_d_ps2_0_dat_i),
      .wbs5_we_i            (wbs_d_ps2_0_we_i), 
      .wbs5_cyc_i           (wbs_d_ps2_0_cyc_i),
      .wbs5_stb_i           (wbs_d_ps2_0_stb_i),
      .wbs5_cti_i           (wbs_d_ps2_0_cti_i),
      .wbs5_bte_i           (wbs_d_ps2_0_bte_i),
      .wbs5_dat_o           (wbs_d_ps2_0_dat_o),
      .wbs5_ack_o           (wbs_d_ps2_0_ack_o),
      .wbs5_err_o           (wbs_d_ps2_0_err_o),
      .wbs5_rty_o           (wbs_d_ps2_0_rty_o),

      .wbs6_adr_i           (wbs_d_ps2_1_adr_i),
      .wbs6_dat_i           (wbs_d_ps2_1_dat_i),
      .wbs6_we_i            (wbs_d_ps2_1_we_i), 
      .wbs6_cyc_i           (wbs_d_ps2_1_cyc_i),
      .wbs6_stb_i           (wbs_d_ps2_1_stb_i),
      .wbs6_cti_i           (wbs_d_ps2_1_cti_i),
      .wbs6_bte_i           (wbs_d_ps2_1_bte_i),
      .wbs6_dat_o           (wbs_d_ps2_1_dat_o),
      .wbs6_ack_o           (wbs_d_ps2_1_ack_o),
      .wbs6_err_o           (wbs_d_ps2_1_err_o),
      .wbs6_rty_o           (wbs_d_ps2_1_rty_o),

      // Clock, reset inputs
      .wb_clk			(wb_clk),
      .wb_rst			(wb_rst));

   defparam arbiter_bytebus0.wb_addr_match_width = bbus_arb_wb_addr_match_width;
   defparam arbiter_bytebus0.wb_num_slaves = bbus_arb_wb_num_slaves;

   defparam arbiter_bytebus0.slave0_adr = bbus_arb_slave0_adr;
   defparam arbiter_bytebus0.slave1_adr = bbus_arb_slave1_adr;
   defparam arbiter_bytebus0.slave2_adr = bbus_arb_slave2_adr;
   defparam arbiter_bytebus0.slave3_adr = bbus_arb_slave3_adr;
   defparam arbiter_bytebus0.slave4_adr = bbus_arb_slave4_adr;
   defparam arbiter_bytebus0.slave5_adr = bbus_arb_slave5_adr;
   defparam arbiter_bytebus0.slave6_adr = bbus_arb_slave6_adr;


`ifdef JTAG_DEBUG   
   ////////////////////////////////////////////////////////////////////////
   //
   // JTAG TAP
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire 				  dbg_if_select;   
   wire 				  dbg_if_tdo;
   wire 				  jtag_tap_tdo;   
   wire 				  jtag_tap_shift_dr, jtag_tap_pause_dr, 
					  jtag_tap_upate_dr, jtag_tap_capture_dr;
   //
   // Instantiation
   //

   jtag_tap jtag_tap0
     (
      // Ports to pads
      .tdo_pad_o			(tdo_pad_o),
      .tms_pad_i			(tms_pad_i),
      .tck_pad_i			(dbg_tck),
      .trst_pad_i			(async_rst),
      .tdi_pad_i			(tdi_pad_i),
      
      .tdo_padoe_o			(tdo_padoe_o),
      
      .tdo_o				(jtag_tap_tdo),

      .shift_dr_o			(jtag_tap_shift_dr),
      .pause_dr_o			(jtag_tap_pause_dr),
      .update_dr_o			(jtag_tap_update_dr),
      .capture_dr_o			(jtag_tap_capture_dr),
      
      .extest_select_o			(),
      .sample_preload_select_o		(),
      .mbist_select_o			(),
      .debug_select_o			(dbg_if_select),

      
      .bs_chain_tdi_i			(1'b0),
      .mbist_tdi_i			(1'b0),
      .debug_tdi_i			(dbg_if_tdo)
      
      );
   
   ////////////////////////////////////////////////////////////////////////
`endif //  `ifdef JTAG_DEBUG

   ////////////////////////////////////////////////////////////////////////
   //
   // OpenRISC processor
   // 
   ////////////////////////////////////////////////////////////////////////

   // 
   // Wires
   // 
   
   wire [30:0] 				  or1200_pic_ints;

   wire [31:0] 				  or1200_dbg_dat_i;
   wire [31:0] 				  or1200_dbg_adr_i;
   wire 				  or1200_dbg_we_i;
   wire 				  or1200_dbg_stb_i;
   wire 				  or1200_dbg_ack_o;
   wire [31:0] 				  or1200_dbg_dat_o;
   
   wire 				  or1200_dbg_stall_i;
   wire 				  or1200_dbg_ewt_i;
   wire [3:0] 				  or1200_dbg_lss_o;
   wire [1:0] 				  or1200_dbg_is_o;
   wire [10:0] 				  or1200_dbg_wp_o;
   wire 				  or1200_dbg_bp_o;
   wire 				  or1200_dbg_rst;   
   
   wire 				  or1200_clk, or1200_rst;
   wire 				  sig_tick;
   
   //
   // Assigns
   //
   assign or1200_clk = wb_clk;
   assign or1200_rst = wb_rst | or1200_dbg_rst;

   // 
   // Instantiation
   //    
   or1200_top or1200_top0
       (
	// Instruction bus, clocks, reset
	.iwb_clk_i			(wb_clk),
	.iwb_rst_i			(wb_rst),
	.iwb_ack_i			(wbm_i_or12_ack_i),
	.iwb_err_i			(wbm_i_or12_err_i),
	.iwb_rty_i			(wbm_i_or12_rty_i),
	.iwb_dat_i			(wbm_i_or12_dat_i),
	
	.iwb_cyc_o			(wbm_i_or12_cyc_o),
	.iwb_adr_o			(wbm_i_or12_adr_o),
	.iwb_stb_o			(wbm_i_or12_stb_o),
	.iwb_we_o				(wbm_i_or12_we_o),
	.iwb_sel_o			(wbm_i_or12_sel_o),
	.iwb_dat_o			(wbm_i_or12_dat_o),
	.iwb_cti_o			(wbm_i_or12_cti_o),
	.iwb_bte_o			(wbm_i_or12_bte_o),
	
	// Data bus, clocks, reset            
	.dwb_clk_i			(wb_clk),
	.dwb_rst_i			(wb_rst),
	.dwb_ack_i			(wbm_d_or12_ack_i),
	.dwb_err_i			(wbm_d_or12_err_i),
	.dwb_rty_i			(wbm_d_or12_rty_i),
	.dwb_dat_i			(wbm_d_or12_dat_i),

	.dwb_cyc_o			(wbm_d_or12_cyc_o),
	.dwb_adr_o			(wbm_d_or12_adr_o),
	.dwb_stb_o			(wbm_d_or12_stb_o),
	.dwb_we_o				(wbm_d_or12_we_o),
	.dwb_sel_o			(wbm_d_or12_sel_o),
	.dwb_dat_o			(wbm_d_or12_dat_o),
	.dwb_cti_o			(wbm_d_or12_cti_o),
	.dwb_bte_o			(wbm_d_or12_bte_o),
	
	// Debug interface ports
	.dbg_stall_i			(or1200_dbg_stall_i),
	//.dbg_ewt_i			(or1200_dbg_ewt_i),
	.dbg_ewt_i			(1'b0),
	.dbg_lss_o			(or1200_dbg_lss_o),
	.dbg_is_o				(or1200_dbg_is_o),
	.dbg_wp_o				(or1200_dbg_wp_o),
	.dbg_bp_o				(or1200_dbg_bp_o),

	.dbg_adr_i			(or1200_dbg_adr_i),      
	.dbg_we_i				(or1200_dbg_we_i ), 
	.dbg_stb_i			(or1200_dbg_stb_i),          
	.dbg_dat_i			(or1200_dbg_dat_i),
	.dbg_dat_o			(or1200_dbg_dat_o),
	.dbg_ack_o			(or1200_dbg_ack_o),
	
	.pm_clksd_o			(),
	.pm_dc_gate_o			(),
	.pm_ic_gate_o			(),
	.pm_dmmu_gate_o			(),
	.pm_immu_gate_o			(),
	.pm_tt_gate_o			(),
	.pm_cpu_gate_o			(),
	.pm_wakeup_o			(),
	.pm_lvolt_o			(),

	// Core clocks, resets
	.clk_i				(or1200_clk),
	.rst_i				(or1200_rst),
	
	.clmode_i				(2'b00),
	// Interrupts      
	.pic_ints_i			(or1200_pic_ints),
	.sig_tick(sig_tick),
	/*
	 .mbist_so_o			(),
	 .mbist_si_i			(0),
	 .mbist_ctrl_i			(0),
	 */

	.pm_cpustall_i			(1'b0)

	);
   
   ////////////////////////////////////////////////////////////////////////


`ifdef JTAG_DEBUG
   ////////////////////////////////////////////////////////////////////////
	 //
   // OR1200 Debug Interface
   // 
   ////////////////////////////////////////////////////////////////////////
   
   dbg_if dbg_if0
     (
      // OR1200 interface
      .cpu0_clk_i			(or1200_clk),
      .cpu0_rst_o			(or1200_dbg_rst),      
      .cpu0_addr_o			(or1200_dbg_adr_i),
      .cpu0_data_o			(or1200_dbg_dat_i),
      .cpu0_stb_o			(or1200_dbg_stb_i),
      .cpu0_we_o			(or1200_dbg_we_i),
      .cpu0_data_i			(or1200_dbg_dat_o),
      .cpu0_ack_i			(or1200_dbg_ack_o),      


      .cpu0_stall_o			(or1200_dbg_stall_i),
      .cpu0_bp_i			(or1200_dbg_bp_o),      
      
      // TAP interface
      .tck_i				(dbg_tck),
      .tdi_i				(jtag_tap_tdo),
      .tdo_o				(dbg_if_tdo),      
      .rst_i				(wb_rst),
      .shift_dr_i			(jtag_tap_shift_dr),
      .pause_dr_i			(jtag_tap_pause_dr),
      .update_dr_i			(jtag_tap_update_dr),
      .debug_select_i			(dbg_if_select),

      // Wishbone debug master
      .wb_clk_i				(wb_clk),
      .wb_dat_i				(wbm_d_dbg_dat_i),
      .wb_ack_i				(wbm_d_dbg_ack_i),
      .wb_err_i				(wbm_d_dbg_err_i),
      .wb_adr_o				(wbm_d_dbg_adr_o),
      .wb_dat_o				(wbm_d_dbg_dat_o),
      .wb_cyc_o				(wbm_d_dbg_cyc_o),
      .wb_stb_o				(wbm_d_dbg_stb_o),
      .wb_sel_o				(wbm_d_dbg_sel_o),
      .wb_we_o				(wbm_d_dbg_we_o ),
      .wb_cti_o				(wbm_d_dbg_cti_o),
      .wb_cab_o                         (/*   UNUSED  */),
      .wb_bte_o				(wbm_d_dbg_bte_o)
      );
   
   ////////////////////////////////////////////////////////////////////////   
`else // !`ifdef JTAG_DEBUG

   assign wbm_d_dbg_adr_o = 0;   
   assign wbm_d_dbg_dat_o = 0;   
   assign wbm_d_dbg_cyc_o = 0;   
   assign wbm_d_dbg_stb_o = 0;   
   assign wbm_d_dbg_sel_o = 0;   
   assign wbm_d_dbg_we_o  = 0;   
   assign wbm_d_dbg_cti_o = 0;   
   assign wbm_d_dbg_bte_o = 0;  

   assign or1200_dbg_adr_i = 0;   
   assign or1200_dbg_dat_i = 0;   
   assign or1200_dbg_stb_i = 0;   
   assign or1200_dbg_we_i = 0;
   assign or1200_dbg_stall_i = 0;
   
   ////////////////////////////////////////////////////////////////////////   
`endif // !`ifdef JTAG_DEBUG

`ifdef XILINX_DDR2
   ////////////////////////////////////////////////////////////////////////
   //
   // Xilinx MIG DDR2 controller, Wishbone interface
   // 
   ////////////////////////////////////////////////////////////////////////
   xilinx_ddr2 xilinx_ddr2_0
     (
/*
      .wbm0_adr_i                       (wbm_eth0_adr_o), 
      .wbm0_bte_i                       (wbm_eth0_bte_o), 
      .wbm0_cti_i                       (wbm_eth0_cti_o), 
      .wbm0_cyc_i                       (wbm_eth0_cyc_o), 
      .wbm0_dat_i                       (wbm_eth0_dat_o), 
      .wbm0_sel_i                       (wbm_eth0_sel_o),
      .wbm0_stb_i                       (wbm_eth0_stb_o), 
      .wbm0_we_i                        (wbm_eth0_we_o),
      .wbm0_ack_o                       (wbm_eth0_ack_i), 
      .wbm0_err_o                       (wbm_eth0_err_i), 
      .wbm0_rty_o                       (wbm_eth0_rty_i), 
      .wbm0_dat_o                       (wbm_eth0_dat_i),
*/
      .wbm0_adr_i                       (wbm_vga0_adr_o), 
      .wbm0_bte_i                       (wbm_vga0_bte_o), 
      .wbm0_cti_i                       (wbm_vga0_cti_o), 
      .wbm0_cyc_i                       (wbm_vga0_cyc_o), 
      .wbm0_dat_i                       (wbm_vga0_dat_o), 
      .wbm0_sel_i                       (wbm_vga0_sel_o),
      .wbm0_stb_i                       (wbm_vga0_stb_o), 
      .wbm0_we_i                        (wbm_vga0_we_o),
      .wbm0_ack_o                       (wbm_vga0_ack_i), 
      .wbm0_err_o                       (wbm_vga0_err_i), 
      .wbm0_rty_o                       (wbm_vga0_rty_i), 
      .wbm0_dat_o                       (wbm_vga0_dat_i),
      
      .wbm1_adr_i                       (wbs_d_mc0_adr_i), 
      .wbm1_bte_i                       (wbs_d_mc0_bte_i), 
      .wbm1_cti_i                       (wbs_d_mc0_cti_i), 
      .wbm1_cyc_i                       (wbs_d_mc0_cyc_i), 
      .wbm1_dat_i                       (wbs_d_mc0_dat_i), 
      .wbm1_sel_i                       (wbs_d_mc0_sel_i),
      .wbm1_stb_i                       (wbs_d_mc0_stb_i), 
      .wbm1_we_i                        (wbs_d_mc0_we_i),
      .wbm1_ack_o                       (wbs_d_mc0_ack_o), 
      .wbm1_err_o                       (wbs_d_mc0_err_o), 
      .wbm1_rty_o                       (wbs_d_mc0_rty_o),
      .wbm1_dat_o                       (wbs_d_mc0_dat_o),

      .wbm2_adr_i                       (wbm_write_gfx0_adr_o), 
      .wbm2_bte_i                       (wbm_write_gfx0_bte_o), 
      .wbm2_cti_i                       (wbm_write_gfx0_cti_o), 
      .wbm2_cyc_i                       (wbm_write_gfx0_cyc_o), 
      .wbm2_dat_i                       (wbm_write_gfx0_dat_o), 
      .wbm2_sel_i                       (wbm_write_gfx0_sel_o),
      .wbm2_stb_i                       (wbm_write_gfx0_stb_o), 
      .wbm2_we_i                        (wbm_write_gfx0_we_o),
      .wbm2_ack_o                       (wbm_write_gfx0_ack_i), 
      .wbm2_err_o                       (wbm_write_gfx0_err_i), 
      .wbm2_rty_o                       (wbm_write_gfx0_rty_i), 
      .wbm2_dat_o                       (wbm_write_gfx0_dat_i),
/*      
      .wbm2_adr_i                       (wbs_i_mc0_adr_i), 
      .wbm2_bte_i                       (wbs_i_mc0_bte_i), 
      .wbm2_cti_i                       (wbs_i_mc0_cti_i), 
      .wbm2_cyc_i                       (wbs_i_mc0_cyc_i), 
      .wbm2_dat_i                       (wbs_i_mc0_dat_i), 
      .wbm2_sel_i                       (wbs_i_mc0_sel_i),
      .wbm2_stb_i                       (wbs_i_mc0_stb_i), 
      .wbm2_we_i                        (wbs_i_mc0_we_i),
      .wbm2_ack_o                       (wbs_i_mc0_ack_o), 
      .wbm2_err_o                       (wbs_i_mc0_err_o), 
      .wbm2_rty_o                       (wbs_i_mc0_rty_o), 
      .wbm2_dat_o                       (wbs_i_mc0_dat_o),
*/
// new test temp TODO:
      .wbm3_adr_i                       (wbm_read_gfx0_adr_o), 
      .wbm3_bte_i                       (wbm_read_gfx0_bte_o), 
      .wbm3_cti_i                       (wbm_read_gfx0_cti_o), 
      .wbm3_cyc_i                       (wbm_read_gfx0_cyc_o), 
      .wbm3_dat_i                       (wbm_read_gfx0_dat_o), 
      .wbm3_sel_i                       (wbm_read_gfx0_sel_o),
      .wbm3_stb_i                       (wbm_read_gfx0_stb_o), 
      .wbm3_we_i                        (wbm_read_gfx0_we_o),
      .wbm3_ack_o                       (wbm_read_gfx0_ack_i), 
      .wbm3_err_o                       (wbm_read_gfx0_err_i), 
      .wbm3_rty_o                       (wbm_read_gfx0_rty_i), 
      .wbm3_dat_o                       (wbm_read_gfx0_dat_i),
//####################################

/*
      .wbm4_adr_i                       (wbm_read_gfx0_adr_o), 
      .wbm4_bte_i                       (wbm_read_gfx0_bte_o), 
      .wbm4_cti_i                       (wbm_read_gfx0_cti_o), 
      .wbm4_cyc_i                       (wbm_read_gfx0_cyc_o), 
      .wbm4_dat_i                       (wbm_read_gfx0_dat_o), 
      .wbm4_sel_i                       (wbm_read_gfx0_sel_o),
      .wbm4_stb_i                       (wbm_read_gfx0_stb_o), 
      .wbm4_we_i                        (wbm_read_gfx0_we_o),
      .wbm4_ack_o                       (wbm_read_gfx0_ack_i), 
      .wbm4_err_o                       (wbm_read_gfx0_err_i), 
      .wbm4_rty_o                       (wbm_read_gfx0_rty_i), 
      .wbm4_dat_o                       (wbm_read_gfx0_dat_i),
*/
// new test temp TODO:
      .wbm4_adr_i                       (wbs_i_mc0_adr_i), 
      .wbm4_bte_i                       (wbs_i_mc0_bte_i), 
      .wbm4_cti_i                       (wbs_i_mc0_cti_i), 
      .wbm4_cyc_i                       (wbs_i_mc0_cyc_i), 
      .wbm4_dat_i                       (wbs_i_mc0_dat_i), 
      .wbm4_sel_i                       (wbs_i_mc0_sel_i),
      .wbm4_stb_i                       (wbs_i_mc0_stb_i), 
      .wbm4_we_i                        (wbs_i_mc0_we_i),
      .wbm4_ack_o                       (wbs_i_mc0_ack_o), 
      .wbm4_err_o                       (wbs_i_mc0_err_o), 
      .wbm4_rty_o                       (wbs_i_mc0_rty_o), 
      .wbm4_dat_o                       (wbs_i_mc0_dat_o),
//####################################

      .wb_clk                           (wb_clk),
      .wb_rst                           (wb_rst),
      
      .ddr2_a                           (ddr2_a[12:0]),
      .ddr2_ba                          (ddr2_ba),
      .ddr2_ras_n                       (ddr2_ras_n),
      .ddr2_cas_n                       (ddr2_cas_n),
      .ddr2_we_n                        (ddr2_we_n),
      .ddr2_rzq                         (ddr2_rzq),
      .ddr2_zio                         (ddr2_zio),
      .ddr2_odt                         (ddr2_odt),
      .ddr2_cke                         (ddr2_cke),
      .ddr2_dm                          (ddr2_dm),
      .ddr2_udm                         (ddr2_udm),
      .ddr2_ck                          (ddr2_ck),
      .ddr2_ck_n                        (ddr2_ck_n),
      .ddr2_dq                          (ddr2_dq),
      .ddr2_dqs                         (ddr2_dqs),
      .ddr2_dqs_n                       (ddr2_dqs_n),
      .ddr2_udqs                        (ddr2_udqs),
      .ddr2_udqs_n                      (ddr2_udqs_n),
      .ddr2_if_clk                      (ddr2_if_clk),
      .ddr2_if_rst                      (ddr2_if_rst)
      );
   
`endif


   ////////////////////////////////////////////////////////////////////////
   //
   // ROM
   // 
   ////////////////////////////////////////////////////////////////////////
   
   rom rom0
     (
      .wb_dat_o				(wbs_i_rom0_dat_o),
      .wb_ack_o				(wbs_i_rom0_ack_o),
      .wb_adr_i				(wbs_i_rom0_adr_i[(wbs_i_rom0_addr_width+2)-1:2]),
      .wb_stb_i				(wbs_i_rom0_stb_i),
      .wb_cyc_i				(wbs_i_rom0_cyc_i),
      .wb_cti_i				(wbs_i_rom0_cti_i),
      .wb_bte_i				(wbs_i_rom0_bte_i),
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst));

   defparam rom0.addr_width = wbs_i_rom0_addr_width;

   assign wbs_i_rom0_err_o = 0;
   assign wbs_i_rom0_rty_o = 0;
   
   ////////////////////////////////////////////////////////////////////////

`ifdef RAM_WB
   ////////////////////////////////////////////////////////////////////////
   //
   // Generic RAM
   // 
   ////////////////////////////////////////////////////////////////////////

   ram_wb ram_wb0
     (
      // Wishbone slave interface 0
      .wbm0_dat_i			(wbs_i_mc0_dat_i),
      .wbm0_adr_i			(wbs_i_mc0_adr_i),
      .wbm0_sel_i			(wbs_i_mc0_sel_i),
      .wbm0_cti_i			(wbs_i_mc0_cti_i),
      .wbm0_bte_i			(wbs_i_mc0_bte_i),
      .wbm0_we_i			(wbs_i_mc0_we_i ),
      .wbm0_cyc_i			(wbs_i_mc0_cyc_i),
      .wbm0_stb_i			(wbs_i_mc0_stb_i),
      .wbm0_dat_o			(wbs_i_mc0_dat_o),
      .wbm0_ack_o			(wbs_i_mc0_ack_o),
      .wbm0_err_o                       (wbs_i_mc0_err_o),
      .wbm0_rty_o                       (wbs_i_mc0_rty_o),
      // Wishbone slave interface 1
      .wbm1_dat_i			(wbs_d_mc0_dat_i),
      .wbm1_adr_i			(wbs_d_mc0_adr_i),
      .wbm1_sel_i			(wbs_d_mc0_sel_i),
      .wbm1_cti_i			(wbs_d_mc0_cti_i),
      .wbm1_bte_i			(wbs_d_mc0_bte_i),
      .wbm1_we_i			(wbs_d_mc0_we_i ),
      .wbm1_cyc_i			(wbs_d_mc0_cyc_i),
      .wbm1_stb_i			(wbs_d_mc0_stb_i),
      .wbm1_dat_o			(wbs_d_mc0_dat_o),
      .wbm1_ack_o			(wbs_d_mc0_ack_o),
      .wbm1_err_o                       (wbs_d_mc0_err_o),
      .wbm1_rty_o                       (wbs_d_mc0_rty_o),     
      // Wishbone slave interface 2
      .wbm2_dat_i			(wbm_eth0_dat_o),
      .wbm2_adr_i			(wbm_eth0_adr_o),
      .wbm2_sel_i			(wbm_eth0_sel_o),
      .wbm2_cti_i			(wbm_eth0_cti_o),
      .wbm2_bte_i			(wbm_eth0_bte_o),
      .wbm2_we_i			(wbm_eth0_we_o ),
      .wbm2_cyc_i			(wbm_eth0_cyc_o),
      .wbm2_stb_i			(wbm_eth0_stb_o),
      .wbm2_dat_o			(wbm_eth0_dat_i),
      .wbm2_ack_o			(wbm_eth0_ack_i),
      .wbm2_err_o                       (wbm_eth0_err_i),
      .wbm2_rty_o                       (wbm_eth0_rty_i),
      // Wishbone slave interface 3
      .wbm3_dat_i           (wbm_vga0_dat_o),
      .wbm3_adr_i           (wbm_vga0_adr_o),
      .wbm3_sel_i           (wbm_vga0_sel_o),
      .wbm3_cti_i           (wbm_vga0_cti_o),
      .wbm3_bte_i           (wbm_vga0_bte_o),
      .wbm3_we_i            (wbm_vga0_we_o ),
      .wbm3_cyc_i           (wbm_vga0_cyc_o),
      .wbm3_stb_i           (wbm_vga0_stb_o),
      .wbm3_dat_o           (wbm_vga0_dat_i),
      .wbm3_ack_o           (wbm_vga0_ack_i),
      .wbm3_err_o           (wbm_vga0_err_i),
      .wbm3_rty_o           (wbm_vga0_rty_i),
      // Wishbone slave interface 4

      // Clock, reset
      .wb_clk_i				(wb_clk),
      .wb_rst_i				(wb_rst));
   
   defparam ram_wb0.aw = wb_aw;
   defparam ram_wb0.dw = wb_dw;
   
   defparam ram_wb0.mem_size_bytes = (8192*1024); // 8MB
   defparam ram_wb0.mem_adr_width = 23; // log2(8192*1024)
   ////////////////////////////////////////////////////////////////////////
`endif //  `ifdef RAM_WB


`ifdef ETH0

   //
   // Wires
   //
   wire        eth0_irq;
   wire [3:0]  eth0_mtxd;
   wire        eth0_mtxen;
   wire        eth0_mtxerr;
   wire        eth0_mtx_clk;
   wire        eth0_mrx_clk;
   wire [3:0]  eth0_mrxd;
   wire        eth0_mrxdv;
   wire        eth0_mrxerr;
   wire        eth0_mcoll;
   wire        eth0_mcrs;
   wire        eth0_speed;
   wire        eth0_duplex;
   wire        eth0_link;
   // Management interface wires
   wire        eth0_md_i;
   wire        eth0_md_o;
   wire        eth0_md_oe;


   //
   // assigns

   // Hook up MII wires
   assign eth0_mtx_clk   = eth0_tx_clk;
   assign eth0_tx_data   = eth0_mtxd[3:0];
   assign eth0_tx_en     = eth0_mtxen;
   assign eth0_tx_er     = eth0_mtxerr;
   assign eth0_mrxd[3:0] = eth0_rx_data;
   assign eth0_mrxdv     = eth0_dv;
   assign eth0_mrxerr    = eth0_rx_er;
   assign eth0_mrx_clk   = eth0_rx_clk;
   assign eth0_mcoll     = eth0_col;
   assign eth0_mcrs      = eth0_crs;

`ifdef XILINX
   // Xilinx primitive for MDIO tristate
   IOBUF iobuf_phy_smi_data
     (
      // Outputs
      .O                                 (eth0_md_i),
      // Inouts
      .IO                                (eth0_md_pad_io),
      // Inputs
      .I                                 (eth0_md_o),
      .T                                 (!eth0_md_oe));   
`else // !`ifdef XILINX
   
   // Generic technology tristate control for management interface
   assign eth0_md_pad_io = eth0_md_oe ? eth0_md_o : 1'bz;
   assign eth0_md_i = eth0_md_pad_io;
   
`endif // !`ifdef XILINX

`ifdef ETH0_PHY_RST
   assign eth0_rst_n_o = !wb_rst;
`endif
   
   ethmac ethmac0
     (
      // Wishbone Slave interface
      .wb_clk_i		(wb_clk),
      .wb_rst_i		(wb_rst),
      .wb_dat_i		(wbs_d_eth0_dat_i[31:0]),
      .wb_adr_i		(wbs_d_eth0_adr_i[wbs_d_eth0_addr_width-1:2]),
      .wb_sel_i		(wbs_d_eth0_sel_i[3:0]),
      .wb_we_i 		(wbs_d_eth0_we_i),
      .wb_cyc_i		(wbs_d_eth0_cyc_i),
      .wb_stb_i		(wbs_d_eth0_stb_i),
      .wb_dat_o		(wbs_d_eth0_dat_o[31:0]),
      .wb_err_o		(wbs_d_eth0_err_o),
      .wb_ack_o		(wbs_d_eth0_ack_o),
      // Wishbone Master Interface
      .m_wb_adr_o	(wbm_eth0_adr_o[31:0]),
      .m_wb_sel_o	(wbm_eth0_sel_o[3:0]),
      .m_wb_we_o 	(wbm_eth0_we_o),
      .m_wb_dat_o	(wbm_eth0_dat_o[31:0]),
      .m_wb_cyc_o	(wbm_eth0_cyc_o),
      .m_wb_stb_o	(wbm_eth0_stb_o),
      .m_wb_cti_o	(wbm_eth0_cti_o[2:0]),
      .m_wb_bte_o	(wbm_eth0_bte_o[1:0]),
      .m_wb_dat_i	(wbm_eth0_dat_i[31:0]),
      .m_wb_ack_i	(wbm_eth0_ack_i),
      .m_wb_err_i	(wbm_eth0_err_i),

      // Ethernet MII interface
      // Transmit
      .mtxd_pad_o	(eth0_mtxd[3:0]),
      .mtxen_pad_o	(eth0_mtxen),
      .mtxerr_pad_o	(eth0_mtxerr),
      .mtx_clk_pad_i	(eth0_mtx_clk),
      // Receive
      .mrx_clk_pad_i	(eth0_mrx_clk),
      .mrxd_pad_i	(eth0_mrxd[3:0]),
      .mrxdv_pad_i	(eth0_mrxdv),
      .mrxerr_pad_i	(eth0_mrxerr),
      .mcoll_pad_i	(eth0_mcoll),
      .mcrs_pad_i	(eth0_mcrs),
      // Management interface
      .md_pad_i		(eth0_md_i),
      .mdc_pad_o	(eth0_mdc_pad_o),
      .md_pad_o		(eth0_md_o),
      .md_padoe_o	(eth0_md_oe),

      // Processor interrupt
      .int_o		(eth0_irq)
      
      /*
       .mbist_so_o			(),
       .mbist_si_i			(),
       .mbist_ctrl_i			()
       */
      
      );

   assign wbs_d_eth0_rty_o = 0;

`else
   assign wbs_d_eth0_dat_o = 0;
   assign wbs_d_eth0_err_o = 0;
   assign wbs_d_eth0_ack_o = 0;
   assign wbs_d_eth0_rty_o = 0;
   assign wbm_eth0_adr_o = 0;
   assign wbm_eth0_sel_o = 0;
   assign wbm_eth0_we_o = 0;
   assign wbm_eth0_dat_o = 0;
   assign wbm_eth0_cyc_o = 0;
   assign wbm_eth0_stb_o = 0;
   assign wbm_eth0_cti_o = 0;
   assign wbm_eth0_bte_o = 0;
`endif
   
`ifdef UART0
   ////////////////////////////////////////////////////////////////////////
   //
   // UART0
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire        uart0_srx;
   wire        uart0_stx;
   
   wire        uart0_irq;

   //
   // Assigns
   //
   assign wbs_d_uart0_err_o = 0;
   assign wbs_d_uart0_rty_o = 0;

   // Two UART lines coming to single one (ensure they go high when unconnected)
`ifdef UART0_EXPHEADER   
   assign uart0_srx = uart0_srx_pad_i & uart0_srx_expheader_pad_i;
`else
   assign uart0_srx = uart0_srx_pad_i;
`endif
   assign uart0_stx_pad_o = uart0_stx;
   assign uart0_stx_expheader_pad_o = uart0_stx;
   
   
   uart16550 uart16550_0
     (
      // Wishbone slave interface
      .wb_clk_i				(wb_clk),
      .wb_rst_i				(wb_rst),
      .wb_adr_i				(wbs_d_uart0_adr_i[uart0_addr_width-1:0]),
      .wb_dat_i				(wbs_d_uart0_dat_i),
      .wb_we_i				(wbs_d_uart0_we_i),
      .wb_stb_i				(wbs_d_uart0_stb_i),
      .wb_cyc_i				(wbs_d_uart0_cyc_i),
      //.wb_sel_i				(),
      .wb_dat_o				(wbs_d_uart0_dat_o),
      .wb_ack_o				(wbs_d_uart0_ack_o),

      .int_o				(uart0_irq),
      .stx_pad_o			(uart0_stx),
      .rts_pad_o			(),
      .dtr_pad_o			(),
`ifdef UART_HAS_BAUDRATE_OUTPUT
      .baud_o				(),
`endif
      // Inputs
      .srx_pad_i			(uart0_srx),
      .cts_pad_i			(1'b0),
      .dsr_pad_i			(1'b0),
      .ri_pad_i				(1'b0),
      .dcd_pad_i			(1'b0));

   ////////////////////////////////////////////////////////////////////////          
`else // !`ifdef UART0
   
   //
   // Assigns
   //
   assign wbs_d_uart0_err_o = 0;   
   assign wbs_d_uart0_rty_o = 0;
   assign wbs_d_uart0_ack_o = 0;
   assign wbs_d_uart0_dat_o = 0;
   
   ////////////////////////////////////////////////////////////////////////       
`endif // !`ifdef UART0
   
`ifdef SPI0   
   ////////////////////////////////////////////////////////////////////////
   //
   // SPI0 controller
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire 			     spi0_irq;

   //
   // Assigns
   //
   assign wbs_d_spi0_err_o = 0;
   assign wbs_d_spi0_rty_o = 0;
   //assign spi0_hold_n_o = 1;
   //assign spi0_w_n_o = 1;
   
   
   simple_spi spi0
     (
      // Wishbone slave interface
      .clk_i				(wb_clk),
      .rst_i				(wb_rst),
      .cyc_i				(wbs_d_spi0_cyc_i),
      .stb_i				(wbs_d_spi0_stb_i),
      .adr_i				(wbs_d_spi0_adr_i[spi0_wb_adr_width-1:0]),
      .we_i				(wbs_d_spi0_we_i),
      .dat_i				(wbs_d_spi0_dat_i),
      .dat_o				(wbs_d_spi0_dat_o),
      .ack_o				(wbs_d_spi0_ack_o),
      // SPI IRQ
      .inta_o				(spi0_irq),
      // External SPI interface
      .sck_o				(spi0_sck_o),
      .ss_o                             (spi0_ss_o),
      .mosi_o				(spi0_mosi_o),      
      .miso_i				(spi0_miso_i)
      );

   defparam spi0.slave_select_width = spi0_ss_width;

   ////////////////////////////////////////////////////////////////////////   
`else // !`ifdef SPI0

   //
   // Assigns
   //
   assign wbs_d_spi0_dat_o = 0;
   assign wbs_d_spi0_ack_o = 0;   
   assign wbs_d_spi0_err_o = 0;
   assign wbs_d_spi0_rty_o = 0;
   
   ////////////////////////////////////////////////////////////////////////
`endif // !`ifdef SPI0   


`ifdef I2C0
   ////////////////////////////////////////////////////////////////////////
   //
   // i2c controller 0
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire 			     i2c0_irq;
   wire 			     scl0_pad_o;
   wire 			     scl0_padoen_o;
   wire 			     sda0_pad_o;
   wire 			     sda0_padoen_o;
   
  i2c_master_slave
    #
    (
     .DEFAULT_SLAVE_ADDR(HV0_SADR)     
    )
  i2c_master_slave0 
    (
     .wb_clk_i			     (wb_clk),
     .wb_rst_i			     (wb_rst),
     .arst_i			     (wb_rst),
     .wb_adr_i			     (wbs_d_i2c0_adr_i[i2c_0_wb_adr_width-1:0]),
     .wb_dat_i			     (wbs_d_i2c0_dat_i),
     .wb_we_i			     (wbs_d_i2c0_we_i ),
     .wb_cyc_i			     (wbs_d_i2c0_cyc_i),
     .wb_stb_i			     (wbs_d_i2c0_stb_i),    
     .wb_dat_o			     (wbs_d_i2c0_dat_o),
     .wb_ack_o			     (wbs_d_i2c0_ack_o),
     .scl_pad_i		             (i2c0_scl_io     ),
     .scl_pad_o		             (scl0_pad_o	 ),
     .scl_padoen_o		     (scl0_padoen_o	 ),
     .sda_pad_i		             (i2c0_sda_io 	 ),
     .sda_pad_o		             (sda0_pad_o	 ),
     .sda_padoen_o		     (sda0_padoen_o	 ),
      
      // Interrupt
     .wb_inta_o		             (i2c0_irq)
    
      );

   assign wbs_d_i2c0_err_o = 0;
   assign wbs_d_i2c0_rty_o = 0;

   // i2c phy lines
   assign i2c0_scl_io = scl0_padoen_o ? 1'bz : scl0_pad_o;  
   assign i2c0_sda_io = sda0_padoen_o ? 1'bz : sda0_pad_o;  


   ////////////////////////////////////////////////////////////////////////
`else // !`ifdef I2C0

   assign wbs_d_i2c0_dat_o = 0;
   assign wbs_d_i2c0_ack_o = 0;
   assign wbs_d_i2c0_err_o = 0;
   assign wbs_d_i2c0_rty_o = 0;

   ////////////////////////////////////////////////////////////////////////
`endif // !`ifdef I2C0   

`ifdef I2C1
   ////////////////////////////////////////////////////////////////////////
   //
   // i2c controller 1
   // 
   ////////////////////////////////////////////////////////////////////////

   //
   // Wires
   //
   wire 			     i2c1_irq;
   wire 			     scl1_pad_o;
   wire 			     scl1_padoen_o;
   wire 			     sda1_pad_o;
   wire 			     sda1_padoen_o;

   i2c_master_slave
    #
    (
     .DEFAULT_SLAVE_ADDR(HV1_SADR)     
    )
   i2c_master_slave1 
     (
      .wb_clk_i			     (wb_clk),
      .wb_rst_i			     (wb_rst),
      .arst_i			     (wb_rst),
      .wb_adr_i			     (wbs_d_i2c1_adr_i[i2c_1_wb_adr_width-1:0]),
      .wb_dat_i			     (wbs_d_i2c1_dat_i),
      .wb_we_i			     (wbs_d_i2c1_we_i ),
      .wb_cyc_i			     (wbs_d_i2c1_cyc_i),
      .wb_stb_i			     (wbs_d_i2c1_stb_i),    
      .wb_dat_o			     (wbs_d_i2c1_dat_o),
      .wb_ack_o			     (wbs_d_i2c1_ack_o),
      .scl_pad_i		     (i2c1_scl_io     ),
      .scl_pad_o		     (scl1_pad_o	 ),
      .scl_padoen_o		     (scl1_padoen_o	 ),
      .sda_pad_i		     (i2c1_sda_io 	 ),
      .sda_pad_o		     (sda1_pad_o	 ),
      .sda_padoen_o		     (sda1_padoen_o	 ),
      
      // Interrupt
      .wb_inta_o		     (i2c1_irq)
    
      );

   assign wbs_d_i2c1_err_o = 0;
   assign wbs_d_i2c1_rty_o = 0;

   // i2c phy lines
   assign i2c1_scl_io = scl1_padoen_o ? 1'bz : scl1_pad_o;  
   assign i2c1_sda_io = sda1_padoen_o ? 1'bz : sda1_pad_o;  

   ////////////////////////////////////////////////////////////////////////
`else // !`ifdef I2C1   

   assign wbs_d_i2c1_dat_o = 0;
   assign wbs_d_i2c1_ack_o = 0;
   assign wbs_d_i2c1_err_o = 0;
   assign wbs_d_i2c1_rty_o = 0;

   ////////////////////////////////////////////////////////////////////////
`endif // !`ifdef I2C1   

`ifdef GPIO0
   ////////////////////////////////////////////////////////////////////////
   //
   // GPIO 0
   // 
   ////////////////////////////////////////////////////////////////////////

   gpio gpio0
     (
      // GPIO bus
      .gpio_io				(gpio0_io[gpio0_io_width-1:0]),
      // Wishbone slave interface
      .wb_adr_i				(wbs_d_gpio0_adr_i[gpio0_wb_adr_width-1:0]),
      .wb_dat_i				(wbs_d_gpio0_dat_i),
      .wb_we_i				(wbs_d_gpio0_we_i),
      .wb_cyc_i				(wbs_d_gpio0_cyc_i),
      .wb_stb_i				(wbs_d_gpio0_stb_i),
      .wb_cti_i				(wbs_d_gpio0_cti_i),
      .wb_bte_i				(wbs_d_gpio0_bte_i),
      .wb_dat_o				(wbs_d_gpio0_dat_o),
      .wb_ack_o				(wbs_d_gpio0_ack_o),
      .wb_err_o				(wbs_d_gpio0_err_o),
      .wb_rty_o				(wbs_d_gpio0_rty_o),
      
      .wb_clk				(wb_clk),
      .wb_rst				(wb_rst)
      );

   defparam gpio0.gpio_io_width = gpio0_io_width;
   defparam gpio0.gpio_dir_reset_val = gpio0_dir_reset_val;
   defparam gpio0.gpio_o_reset_val = gpio0_o_reset_val;

   ////////////////////////////////////////////////////////////////////////
`else // !`ifdef GPIO0
   assign wbs_d_gpio0_dat_o = 0;
   assign wbs_d_gpio0_ack_o = 0;
   assign wbs_d_gpio0_err_o = 0;
   assign wbs_d_gpio0_rty_o = 0;
   ////////////////////////////////////////////////////////////////////////
`endif // !`ifdef GPIO0
`ifdef VGA0
   ////////////////////////////////////////////////////////////////////////
   //
   // VGA
   // 
   ////////////////////////////////////////////////////////////////////////

  wire        vga0_irq;
  wire        pclk;
  wire [7:0]  r;
  wire [7:0]  g;
  wire [7:0]  b;
  wire        hsync; 
  wire        vsync;
  wire        blank; 
  wire        gate;
  wire [15:0] hlen;
  wire [15:0] vlen;
  
  vga_enh_top vga0
    (
    .wb_clk_i            (wb_clk), 
    .wb_rst_i            (wb_rst),  
    .rst_i               (1'b1), 
    .wb_inta_o           (vga0_irq),
    .wbs_adr_i           (wbs_d_vga0_adr_i[wbs_d_vga0_addr_width-1:0]),
    .wbs_dat_i           (wbs_d_vga0_dat_i[31:0]), 
    .wbs_dat_o           (wbs_d_vga0_dat_o[31:0]), 
    .wbs_sel_i           (wbs_d_vga0_sel_i[3:0]), 
    .wbs_we_i            (wbs_d_vga0_we_i), 
    .wbs_stb_i           (wbs_d_vga0_stb_i), 
    .wbs_cyc_i           (wbs_d_vga0_cyc_i), 
    .wbs_ack_o           (wbs_d_vga0_ack_o), 
    .wbs_rty_o           (wbs_d_vga0_rty_o), 
    .wbs_err_o           (wbs_d_vga0_err_o),
    .wbm_adr_o           (wbm_vga0_adr_o[31:0]),
    .wbm_dat_i           (wbm_vga0_dat_i[31:0]), 
    .wbm_cti_o           (wbm_vga0_cti_o[2:0]), 
    .wbm_bte_o           (wbm_vga0_bte_o[1:0]), 
    .wbm_sel_o           (wbm_vga0_sel_o[3:0]), 
    .wbm_we_o            (wbm_vga0_we_o), 
    .wbm_stb_o           (wbm_vga0_stb_o), 
    .wbm_cyc_o           (wbm_vga0_cyc_o), 
    .wbm_ack_i           (wbm_vga0_ack_i), 
    .wbm_err_i           (wbm_vga0_err_i),
    .clk_p_i             (pclk),
`ifdef VGA_12BIT_DVI
    .dvi_pclk_p_o        (), 
    .dvi_pclk_m_o        (), 
    .dvi_hsync_o         (), 
    .dvi_vsync_o         (), 
    .dvi_de_o            (), 
    .dvi_d_o             (),
`endif
    .clk_p_o             (), 
    .hsync_pad_o         (hsync), 
    .vsync_pad_o         (vsync), 
    .csync_pad_o         (), 
    .blank_pad_o         (blank), 
    .r_pad_o             (r), 
    .g_pad_o             (g), 
    .b_pad_o             (b),
    .Thlen               (hlen),
    .Tvlen               (vlen)    
    );

    dvi_gen_top dvi_gen0 (
      .rst_n_pad_i   (rst_n_pad_i),
      .dvi_clk_i     (dvi_clk),
      .hlen          (hlen),
      .vlen          (vlen),
      .TMDS          (tmds_o),
      .TMDSB         (tmdsb_o),
      .pclk_o        (pclk),
      .hsync_i       (hsync), 
      .vsync_i       (vsync), 
      .blank_i       (blank), 
      .red_data_i    (r),
      .green_data_i  (g),
      .blue_data_i   (b)
    );
    
`endif

`ifdef GFX0
   ////////////////////////////////////////////////////////////////////////
   //
   // GFX - ORSOC Graphics accelerator
   // 
   ////////////////////////////////////////////////////////////////////////

// Wires
  wire gfx0_irq;
  
  gfx_top gfx0
    (
      .wb_clk_i         (wb_clk),
      .wb_rst_i         (wb_rst),
      .wb_inta_o        (gfx0_irq),
	
      .wbm_write_cyc_o	(wbm_write_gfx0_cyc_o), 
      .wbm_write_stb_o	(wbm_write_gfx0_stb_o), 
      .wbm_write_cti_o	(wbm_write_gfx0_cti_o[2:0]), 
      .wbm_write_bte_o	(wbm_write_gfx0_bte_o[1:0]), 
      .wbm_write_we_o	  (wbm_write_gfx0_we_o), 
      .wbm_write_adr_o	(wbm_write_gfx0_adr_o[31:0]),
      .wbm_write_sel_o	(wbm_write_gfx0_sel_o[3:0]), 
      .wbm_write_ack_i	(wbm_write_gfx0_ack_i), 
      .wbm_write_err_i	(wbm_write_gfx0_err_i),
      .wbm_write_dat_o	(wbm_write_gfx0_dat_o[31:0]), 

      .wbm_read_cyc_o 	(wbm_read_gfx0_cyc_o),
      .wbm_read_stb_o 	(wbm_read_gfx0_stb_o),
      .wbm_read_cti_o 	(wbm_read_gfx0_cti_o[2:0]),
      .wbm_read_bte_o 	(wbm_read_gfx0_bte_o[1:0]),
      .wbm_read_we_o 	  (wbm_read_gfx0_we_o),
      .wbm_read_adr_o 	(wbm_read_gfx0_adr_o[31:0]),
      .wbm_read_sel_o 	(wbm_read_gfx0_sel_o[3:0]),
      .wbm_read_ack_i 	(wbm_read_gfx0_ack_i),
      .wbm_read_err_i 	(wbm_read_gfx0_err_i),
      .wbm_read_dat_i 	(wbm_read_gfx0_dat_i[31:0]),

      .wbs_cyc_i	      (wbs_d_gfx0_cyc_i), 
      .wbs_stb_i	      (wbs_d_gfx0_stb_i), 
      .wbs_cti_i	      (wbs_d_gfx0_cti_i),
      .wbs_bte_i	      (wbs_d_gfx0_bte_i),
      .wbs_we_i		      (wbs_d_gfx0_we_i), 
      .wbs_adr_i	      (wbs_d_gfx0_adr_i[wbs_d_gfx0_addr_width-1:0]),
      .wbs_sel_i	      (wbs_d_gfx0_sel_i[3:0]), 
      .wbs_ack_o	      (wbs_d_gfx0_ack_o),
      .wbs_err_o	      (wbs_d_gfx0_err_o),
      .wbs_dat_i	      (wbs_d_gfx0_dat_i[31:0]), 
      .wbs_dat_o	      (wbs_d_gfx0_dat_o[31:0])
    );

   defparam gfx0.point_width    = 16;
   defparam gfx0.subpixel_width = 16;
   defparam gfx0.fifo_depth     = 10;

`else
   assign wbs_d_gfx0_dat_o     = 0;
   assign wbs_d_gfx0_ack_o     = 0;
   assign wbs_d_gfx0_err_o     = 0;

   assign wbm_write_gfx0_adr_o = 0;
   assign wbm_write_gfx0_dat_o = 0;
   assign wbm_write_gfx0_cti_o = 0;
   assign wbm_write_gfx0_bte_o = 0;
   assign wbm_write_gfx0_sel_o = 0;
   assign wbm_write_gfx0_we_o  = 0;
   assign wbm_write_gfx0_stb_o = 0;
   assign wbm_write_gfx0_cyc_o = 0;

   assign wbm_read_gfx0_adr_o  = 0;
   assign wbm_read_gfx0_cti_o  = 0;
   assign wbm_read_gfx0_bte_o  = 0;
   assign wbm_read_gfx0_sel_o  = 0;
   assign wbm_read_gfx0_we_o   = 0;
   assign wbm_read_gfx0_stb_o  = 0;
   assign wbm_read_gfx0_cyc_o  = 0;
`endif
   assign wbs_d_gfx0_rty_o     = 0;

`ifdef AC97
   ////////////////////////////////////////////////////////////////////////
   //
   // AC97
   // 
   ////////////////////////////////////////////////////////////////////////
   wire ac97_irq;
   wire ac97_dma_req;
   wire ac97_dma_ack;
   
   ac97_top ac97(
      .clk_i                (wb_clk),
      .rst_i                (!wb_rst),
      .wb_data_i            (wbs_d_ac97_dat_i),
      .wb_data_o            (wbs_d_ac97_dat_o),
      .wb_addr_i            (wbs_d_ac97_adr_i[wbs_d_ac97_addr_width-1:0]),
      .wb_sel_i             (wbs_d_ac97_sel_i), 
      .wb_we_i              (wbs_d_ac97_we_i),
      .wb_cyc_i             (wbs_d_ac97_cyc_i),
      .wb_stb_i             (wbs_d_ac97_stb_i),
      .wb_ack_o             (wbs_d_ac97_ack_o),
      .wb_err_o             (wbs_d_ac97_err_o), 
      .int_o                (ac97_irq),
      .dma_req_o            (ac97_dma_req),
      .dma_ack_i            (ac97_dma_ack),
      .suspended_o          (),
      .bit_clk_pad_i        (ac97_bit_clk_pad_i),
      .sync_pad_o           (ac97_sync_pad_o),
      .sdata_pad_o          (ac97_sdata_pad_o), 
      .sdata_pad_i          (ac97_sdata_pad_i),
      .ac97_reset_pad_o_    (ac97_reset_pad_o)
    );

`endif

`ifdef PS2_0
   ////////////////////////////////////////////////////////////////////////
   //
   // PS2_0
   // 
   ////////////////////////////////////////////////////////////////////////
   wire ps2_0_irq;
   
   ps2_wb ps2_0(
      .wb_clk_i             (wb_clk),
      .wb_rst_i             (wb_rst),
      .wb_dat_i             (wbs_d_ps2_0_dat_i),
      .wb_dat_o             (wbs_d_ps2_0_dat_o),
      .wb_adr_i             (wbs_d_ps2_0_adr_i[ps2_0_wb_adr_width-1:0]),
      .wb_stb_i             (wbs_d_ps2_0_cyc_i & wbs_d_ps2_0_stb_i),
      .wb_we_i              (wbs_d_ps2_0_we_i),
      .wb_ack_o             (wbs_d_ps2_0_ack_o),

      //IRQ output
      .irq_o                 (ps2_0_irq),

      // PS2 signals
      .ps2_clk               (ps2_0_clk),
      .ps2_dat               (ps2_0_dat)
   );
   assign wbs_d_ps2_0_err_o = 0;
   assign wbs_d_ps2_0_rty_o = 0;
`else
   assign wbs_d_ps2_0_dat_o = 0;
   assign wbs_d_ps2_0_ack_o = 0;
   assign wbs_d_ps2_0_err_o = 0;
   assign wbs_d_ps2_0_rty_o = 0;
`endif // PS2_0

`ifdef PS2_1
   ////////////////////////////////////////////////////////////////////////
   //
   // PS2_1
   // 
   ////////////////////////////////////////////////////////////////////////
   wire ps2_1_irq;
   
   ps2_wb ps2_1(
      .wb_clk_i             (wb_clk),
      .wb_rst_i             (wb_rst),
      .wb_dat_i             (wbs_d_ps2_1_dat_i),
      .wb_dat_o             (wbs_d_ps2_1_dat_o),
      .wb_adr_i             (wbs_d_ps2_1_adr_i[ps2_1_wb_adr_width-1:0]),
      .wb_stb_i             (wbs_d_ps2_1_cyc_i & wbs_d_ps2_1_stb_i),
      .wb_we_i              (wbs_d_ps2_1_we_i),
      .wb_ack_o             (wbs_d_ps2_1_ack_o),

      //IRQ output
      .irq_o                 (ps2_1_irq),

      // PS2 signals
      .ps2_clk               (ps2_1_clk),
      .ps2_dat               (ps2_1_dat)
   );
   assign wbs_d_ps2_1_err_o = 0;
   assign wbs_d_ps2_1_rty_o = 0;
`else
   assign wbs_d_ps2_1_dat_o = 0;
   assign wbs_d_ps2_1_ack_o = 0;
   assign wbs_d_ps2_1_err_o = 0;
   assign wbs_d_ps2_1_rty_o = 0;
`endif // PS2_1 

`ifdef DMA0
   ////////////////////////////////////////////////////////////////////////
   //
   // DMA0
   // 
   ////////////////////////////////////////////////////////////////////////
   wire [31:0] dma_req;
   wire [31:0] dma_ack;   
   
   assign dma_req[31:1] = 0;
   assign dma_req[0]    = ac97_dma_req;
   
   assign ac97_dma_ack  = dma_ack[0];
   
   wb_dma_top wb_dma0(
      .clk_i            (wb_clk), 
      .rst_i            (wb_rst),
      
      .wb0s_data_i      (wbs_d_dma0_dat_i),
      .wb0s_data_o      (wbs_d_dma0_dat_o),      
      .wb0_addr_i       (wbs_d_dma0_adr_i),
      .wb0_sel_i        (wbs_d_dma0_sel_i),
      .wb0_we_i         (wbs_d_dma0_we_i),
      .wb0_cyc_i        (wbs_d_dma0_cyc_i),      
      .wb0_stb_i        (wbs_d_dma0_stb_i),
      .wb0_ack_o        (wbs_d_dma0_ack_o),
      .wb0_err_o        (wbs_d_dma0_err_o),
      .wb0_rty_o        (wbs_d_dma0_rty_o),
    
      .wb0m_data_i      (wbm_dma0_dat_i),
      .wb0m_data_o      (wbm_dma0_dat_o),
      .wb0_addr_o       (wbm_dma0_adr_o),
      .wb0_sel_o        (wbm_dma0_sel_o),
      .wb0_we_o         (wbm_dma0_we_o), 
      .wb0_cyc_o        (wbm_dma0_cyc_o),
      .wb0_stb_o        (wbm_dma0_stb_o),
      .wb0_ack_i        (wbm_dma0_ack_i),
      .wb0_err_i        (wbm_dma0_err_i),
      .wb0_rty_i        (wbm_dma0_rty_i),

      .wb1s_data_i      (),
      .wb1s_data_o      (),
      .wb1_addr_i       (),
      .wb1_sel_i        (),
      .wb1_we_i         (),
      .wb1_cyc_i        (),
      .wb1_stb_i        (),
      .wb1_ack_o        (),
      .wb1_err_o        (),
      .wb1_rty_o        (),
      
      .wb1m_data_i      (),
      .wb1m_data_o      (),
      .wb1_addr_o       (),
      .wb1_sel_o        (),
      .wb1_we_o         (),
      .wb1_cyc_o        (),
      .wb1_stb_o        (),
      .wb1_ack_i        (),
      .wb1_err_i        (),
      .wb1_rty_i        (),

      .dma_req_i        (dma_req), 
      .dma_ack_o        (dma_ack), 
      .dma_nd_i         (), 
      .dma_rest_i       (),

      .inta_o           (), 
      .intb_o           ()
    );
    
`endif
 `ifdef FDT0
   ////////////////////////////////////////////////////////////////////////
   //
   // FDT0
   // 
   ////////////////////////////////////////////////////////////////////////
   fdt fdt0(
      .wb_rst_i             (wb_rst),
      .wb_clk_i             (wb_clk),
      .wb_dat_i             (wbs_d_fdt0_dat_i),
      .wb_adr_i             (wbs_d_fdt0_adr_i[wbs_d_fdt0_addr_width-1:2]),
      .wb_sel_i             (wbs_d_fdt0_sel_i),
      .wb_we_i              (wbs_d_fdt0_we_i),
      .wb_cyc_i             (wbs_d_fdt0_cyc_i),
      .wb_stb_i             (wbs_d_fdt0_stb_i),
      .wb_dat_o             (wbs_d_fdt0_dat_o),
      .wb_ack_o             (wbs_d_fdt0_ack_o),
      .wb_err_o             (wbs_d_fdt0_err_o), 
      .wb_rty_o             (wbs_d_fdt0_rty_o)
   );   
`endif // FDT0

   ////////////////////////////////////////////////////////////////////////
   //
   // OR1200 Interrupt assignment
   // 
   ////////////////////////////////////////////////////////////////////////
   
   assign or1200_pic_ints[0] = 0; // Non-maskable inside OR1200
   assign or1200_pic_ints[1] = 0; // Non-maskable inside OR1200
`ifdef UART0
   assign or1200_pic_ints[2] = uart0_irq;
`else   
   assign or1200_pic_ints[2] = 0;
`endif
   assign or1200_pic_ints[3] = 0;
`ifdef ETH0
   assign or1200_pic_ints[4] = eth0_irq;
`else
   assign or1200_pic_ints[4] = 0;
`endif
`ifdef PS2_0
   assign or1200_pic_ints[5] = ps2_0_irq;
`else
   assign or1200_pic_ints[5] = 0;
`endif
`ifdef SPI0
   assign or1200_pic_ints[6] = spi0_irq;
`else   
   assign or1200_pic_ints[6] = 0;
`endif
   assign or1200_pic_ints[7] = 0;
`ifdef VGA0
   assign or1200_pic_ints[8] = vga0_irq;
`else
   assign or1200_pic_ints[8] = 0;
`endif
`ifdef GFX0
   assign or1200_pic_ints[9] = gfx0_irq;
`else
   assign or1200_pic_ints[9] = 0;
`endif
`ifdef I2C0
   assign or1200_pic_ints[10] = i2c0_irq;
`else   
   assign or1200_pic_ints[10] = 0;
`endif
`ifdef I2C1
   assign or1200_pic_ints[11] = i2c1_irq;
`else   
   assign or1200_pic_ints[11] = 0;
`endif
`ifdef AC97
   assign or1200_pic_ints[12] = ac97_irq;
`else
   assign or1200_pic_ints[12] = 0;
`endif
`ifdef PS2_1
   assign or1200_pic_ints[13] = ps2_1_irq;
`else
   assign or1200_pic_ints[13] = 0;
`endif
   assign or1200_pic_ints[14] = 0;
   assign or1200_pic_ints[15] = 0;
   assign or1200_pic_ints[16] = 0;
   assign or1200_pic_ints[17] = 0;
   assign or1200_pic_ints[18] = 0;
   assign or1200_pic_ints[19] = 0;
   assign or1200_pic_ints[20] = 0;
   assign or1200_pic_ints[21] = 0;
   assign or1200_pic_ints[22] = 0;
   assign or1200_pic_ints[23] = 0;
   assign or1200_pic_ints[24] = 0;
   assign or1200_pic_ints[25] = 0;
   assign or1200_pic_ints[26] = 0;
   assign or1200_pic_ints[27] = 0;
   assign or1200_pic_ints[28] = 0;
   assign or1200_pic_ints[29] = 0;
   assign or1200_pic_ints[30] = 0;
   
endmodule // orpsoc_top


