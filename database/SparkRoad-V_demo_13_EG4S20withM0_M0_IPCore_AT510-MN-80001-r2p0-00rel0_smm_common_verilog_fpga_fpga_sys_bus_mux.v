//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//      Revision            : $Revision: 368444 $
//
//      Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Simple bus multiplexer for V2M-MPS2 FPGA
//-----------------------------------------------------------------------------
// Note: This bus MUX does not support simultaneous request from both sides
// select control is driven by SPI to APB/AHB interface
// When MCC is driving the bus, the processor must be disabled

module fpga_sys_bus_mux (
  input   wire            hclk,
  input   wire            hresetn,

  input   wire            spibus_select, // 0 = processor, 1 = SPI

  // Bus connection from processor
  input   wire            cpusys_hsel,        // select
  input   wire    [31:0]  cpusys_haddr,       // address
  input   wire     [1:0]  cpusys_htrans,      // transfer control
  input   wire     [2:0]  cpusys_hsize,       // size
  input   wire            cpusys_hwrite,      // write control
  input   wire    [31:0]  cpusys_hwdata,      // write data
  input   wire            cpusys_hready,      // ready

  output  wire            cpusys_hreadyout,   // ready
  output  wire    [31:0]  cpusys_hrdata,      // read data output from SRAM
  output  wire            cpusys_hresp,       // response

  // AHB connection from SPI to APB/AHB block
  input   wire            spi2mem_s1_hsel,
  input   wire    [31:0]  spi2mem_s1_haddr,
  input   wire     [1:0]  spi2mem_s1_htrans,
  input   wire            spi2mem_s1_hwrite,
  input   wire    [31:0]  spi2mem_s1_hwdata,
  input   wire     [1:0]  spi2mem_s1_hsize,

  output  wire    [31:0]  spi2mem_s1_hrdata,
  output  wire            spi2mem_s1_hready,
  output  wire            spi2mem_s1_hresp,

  // AHB connection to FPGA system
  output  wire            fpgasys_hsel,        // select
  output  wire    [31:0]  fpgasys_haddr,       // address
  output  wire     [1:0]  fpgasys_htrans,      // transfer control
  output  wire     [2:0]  fpgasys_hsize,       // size
  output  wire            fpgasys_hwrite,      // write control
  output  wire    [31:0]  fpgasys_hwdata,      // write data
  output  wire            fpgasys_hready,      // ready

  input   wire            fpgasys_hreadyout,   // ready
  input   wire    [31:0]  fpgasys_hrdata,      // read data output from SRAM
  input   wire            fpgasys_hresp        // response
  );

  // Simple bus mux - spibus_select can only be switched when CPU is not active

  assign fpgasys_hsel  = (spibus_select) ? spi2mem_s1_hsel  : cpusys_hsel;
  assign fpgasys_haddr = (spibus_select) ? spi2mem_s1_haddr : cpusys_haddr;
  assign fpgasys_htrans= (spibus_select) ? spi2mem_s1_htrans: cpusys_htrans;
  assign fpgasys_hsize = (spibus_select) ? {1'b0,spi2mem_s1_hsize}: cpusys_hsize;
  assign fpgasys_hwrite= (spibus_select) ? spi2mem_s1_hwrite  : cpusys_hwrite;
  assign fpgasys_hwdata= (spibus_select) ? spi2mem_s1_hwdata  : cpusys_hwdata;
  assign fpgasys_hready= (spibus_select) ? fpgasys_hreadyout  : cpusys_hready;

  assign cpusys_hreadyout  = (spibus_select) ? 1'b1  : fpgasys_hreadyout;
  assign cpusys_hrdata     = fpgasys_hrdata;
  assign cpusys_hresp      = (spibus_select) ? 1'b0 : fpgasys_hresp;

  assign spi2mem_s1_hrdata = fpgasys_hrdata;
  assign spi2mem_s1_hready = (spibus_select) ? fpgasys_hreadyout : 1'b1;
  assign spi2mem_s1_hresp  = (spibus_select) ? fpgasys_hresp     : 1'b0;

endmodule


