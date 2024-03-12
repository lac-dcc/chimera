//////////////////////////////////////////////////////////////////////
////                                                              ////
//// orpsoc-params                                                ////
////                                                              ////
//// Top level ORPSoC parameters file                             ////
////                                                              ////
//// Included in toplevel and testbench                           ////
////                                                              ////
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

///////////////////////////
//                       //
// Peripheral parameters //
//                       //
///////////////////////////

// SPI 0 params
parameter spi0_ss_width = 1;
parameter spi0_wb_adr = 8'hb0;
parameter wbs_d_spi0_data_width = 8;   
parameter spi0_wb_adr_width = 3;

// i2c master slave params
// Slave addresses
parameter HV0_SADR  = 8'h44;
parameter HV1_SADR  = 8'h45;
parameter HV2_SADR  = 8'h46;
parameter HV3_SADR  = 8'h47;

// i2c 0 params
parameter i2c_0_wb_adr = 8'ha0;
parameter i2c_0_wb_adr_width = 3;
parameter wbs_d_i2c0_data_width = 8;

// i2c 1 params
parameter i2c_1_wb_adr = 8'ha1;
parameter i2c_1_wb_adr_width = 3;
parameter wbs_d_i2c1_data_width = 8;


// GPIO 0 params
parameter wbs_d_gpio0_data_width = 8;
parameter gpio0_wb_adr_width = 3;
parameter gpio0_io_width = 8;
parameter gpio0_wb_adr = 8'h91;
parameter gpio0_dir_reset_val = 0;
parameter gpio0_o_reset_val = 0;

// UART 0 params
parameter wbs_d_uart0_data_width = 8;
parameter uart0_wb_adr = 8'h90;
parameter uart0_data_width = 8;
parameter uart0_addr_width = 3;

// PS2_0 params
parameter wbs_d_ps2_0_data_width = 8;
parameter ps2_0_wb_adr = 8'h94;
parameter ps2_0_wb_adr_width = 1;

// PS2_1 params
parameter wbs_d_ps2_1_data_width = 8;
parameter ps2_1_wb_adr = 8'h95;
parameter ps2_1_wb_adr_width = 1;

// TODO: ledtest params
parameter ledtest0_wb_adr = 8'hb8;

// ROM
parameter wbs_i_rom0_data_width = 32;
parameter wbs_i_rom0_addr_width = 6;
parameter rom0_wb_adr = 4'hf;

// MC0 (SDRAM, or other)
parameter wbs_i_mc0_data_width = 32;   
parameter wbs_d_mc0_data_width = 32;

// ETH0 defines
parameter eth0_wb_adr = 8'h92;
parameter wbs_d_eth0_data_width = 32;
parameter wbs_d_eth0_addr_width = 12;
parameter wbm_eth0_data_width = 32;
parameter wbm_eth0_addr_width = 32;

// VGA0 defines
parameter vga0_wb_adr = 8'h97;
parameter wbs_d_vga0_data_width = 32;
parameter wbs_d_vga0_addr_width = 12;
parameter wbm_vga0_data_width = 32;
parameter wbm_vga0_addr_width = 32;

// AC97 defines
parameter ac97_wb_adr = 8'h93;
parameter wbs_d_ac97_data_width = 32;
parameter wbs_d_ac97_addr_width = 32;

// DMA0 defines
parameter dma0_wb_adr = 8'h98;
parameter wbs_d_dma0_data_width = 32;
parameter wbs_d_dma0_addr_width = 32;
parameter wbm_dma0_data_width = 32;
parameter wbm_dma0_addr_width = 32;

// FDT0 defines
parameter fdt0_wb_adr = 8'h99;
parameter wbs_d_fdt0_data_width = 32;
parameter wbs_d_fdt0_addr_width = 32;

// Memory sizing for synthesis (small)
parameter internal_sram_mem_span = 32'h0080_0000;
parameter internal_sram_adr_width_for_span = 23;   

//////////////////////////////////////////////////////
//                                                  //
// Wishbone bus parameters                          //
//                                                  //
//////////////////////////////////////////////////////

////////////////////////
//                    //
// Arbiter parameters //
//                    // 
////////////////////////

parameter wb_dw = 32; // Default Wishbone full word width
parameter wb_aw = 32; // Default Wishbone full address width

///////////////////////////
//                       //
// Instruction bus       //
//                       //
///////////////////////////
parameter ibus_arb_addr_match_width = 4;
// Slave addresses
parameter ibus_arb_slave0_adr = rom0_wb_adr; // FLASH ROM
parameter ibus_arb_slave1_adr = 4'h0; // Main memory (SDRAM/FPGA SRAM)

///////////////////////////
//                       //
// Data bus              //
//                       //
///////////////////////////
// Has auto foward to slave2 when no address hits
parameter dbus_arb_wb_addr_match_width = 8;
parameter dbus_arb_wb_num_slaves = 7;
// Slave addresses
parameter dbus_arb_slave0_adr = 4'h0; // Main memory (SDRAM/FPGA SRAM)
parameter dbus_arb_slave1_adr = eth0_wb_adr; // Ethernet 0
parameter dbus_arb_slave3_adr = vga0_wb_adr;
parameter dbus_arb_slave4_adr = ac97_wb_adr;
parameter dbus_arb_slave5_adr = dma0_wb_adr;
parameter dbus_arb_slave6_adr = fdt0_wb_adr;
///////////////////////////////
//                           //
// Byte-wide peripheral bus  //
//                           //
///////////////////////////////
parameter bbus_arb_wb_addr_match_width = 8;
parameter bbus_arb_wb_num_slaves = 8; // Update this when changing slaves!
// Slave addresses
parameter bbus_arb_slave0_adr  = uart0_wb_adr;
parameter bbus_arb_slave1_adr  = gpio0_wb_adr;
parameter bbus_arb_slave2_adr  = i2c_0_wb_adr;
parameter bbus_arb_slave3_adr  = i2c_1_wb_adr;
parameter bbus_arb_slave4_adr  = spi0_wb_adr; 
parameter bbus_arb_slave5_adr  = ps2_0_wb_adr;
parameter bbus_arb_slave6_adr  = ps2_1_wb_adr;
parameter bbus_arb_slave7_adr = ledtest0_wb_adr; // TODO
parameter bbus_arb_slave8_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave9_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave10_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave11_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave12_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave13_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave14_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave15_adr = 0 /* UNASSIGNED */;
parameter bbus_arb_slave16_adr = 0 /* UNASSIGNED */;
