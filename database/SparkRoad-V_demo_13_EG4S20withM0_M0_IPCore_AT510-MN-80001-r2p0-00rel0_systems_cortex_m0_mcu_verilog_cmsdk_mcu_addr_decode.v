//------------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2015 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368442 $
//  File Date           : $Date: 2017-07-25 15:07:59 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//------------------------------------------------------------------------------
// Verilog-2001 (IEEE Std 1364-2001)
//------------------------------------------------------------------------------
//
//-----------------------------------------------------------------------------
// Abstract : This module performs the address decode of the HADDR from the
//            CPU and generates the HSELs for each of the target peripherals.
//            Also performs address decode for MTB
//-----------------------------------------------------------------------------
//
`include "cmsdk_mcu_defs.v"

module cmsdk_mcu_addr_decode #(
  // GPIO0 peripheral base address
  parameter BASEADDR_GPIO0       = 32'h4001_0000,
  // GPIO1 peripheral base address
  parameter BASEADDR_GPIO1       = 32'h4001_1000,

  // Generate BOOT_LOADER_PRESENT based on BOOT_MEM_TYPE
  // This is a derived parameter - do not override using instantiation
  parameter BOOT_LOADER_PRESENT  = 0,

  // Location of the System ROM Table.
  parameter BASEADDR_SYSROMTABLE = 32'hF000_0000
 )
 (
    // System Address
    input wire [31:0]       haddr,

    input wire              remap_ctrl,

    // Memory Selection
    output wire             boot_hsel,
    output wire             flash_hsel,
    output wire             sram_hsel,

    // Peripheral Selection
    output wire             apbsys_hsel,
    output wire             gpio0_hsel,
    output wire             gpio1_hsel,
    output wire             sysctrl_hsel,
    output wire             sysrom_hsel,

    // Default slave
    output wire             defslv_hsel,

    // MTB Selection
    output wire             hselmtb,        // Select MTB
    output wire             hselram,        // Select MTB RAM
    output wire             hselsfr);       // Select MTB Special Function Registers


  // AHB address decode
  // 0x00000000 - 0x0000FFFF : 64K flash / boot firmware
  // 0x01000000 - 0x0100FFFF : boot firmware  : only 4k is used
  // 0x20000000 - 0x2000FFFF : SRAM
  // 0x40000000 - 0x4000FFFF : APB subsystem
  // 0x40010000 - 0x4001FFFF : AHB peripherals (GPIOs)
  // 0xF0000000 - 0xF0000FFF : System ROM Table

  // ----------------------------------------------------------
  // Memory decode logic
  // ----------------------------------------------------------

  // If Boot loader is not present (BOOT_LOADER_PRESENT==0),
  // boot_hsel always 0.
  // Otherwise select if address = 0x0100xxxx or when remap_ctrl
  // is 1, and address = 0x0000xxxx
  assign boot_hsel    = (BOOT_LOADER_PRESENT==0) ? 1'b0 :
     ((haddr[31:16]==16'h0000) & (remap_ctrl==1'b1)) |
      (haddr[31:16]==16'h0100);

  assign flash_hsel   = (BOOT_LOADER_PRESENT==0) ?   // 0x00000000
    // Boot loader not present. Select if first 64KB is selected
    (haddr[31:16]==16'h0000) :
    // Boot loader present. If boot loader is selected then flash is
    // not selected
    (haddr[31:16]==16'h0000) & (boot_hsel==1'b0);

  assign sram_hsel    = (haddr[31:16]==16'h2000);    // 0x20000000

  // ----------------------------------------------------------
  // Peripheral Selection decode logic
  // ----------------------------------------------------------

  assign apbsys_hsel  = (haddr[31:16]==16'h4000);      // 0x40000000
  assign gpio0_hsel   = (haddr[31:12]==
                         BASEADDR_GPIO0[31:12]);       // 0x40010000
  assign gpio1_hsel   = (haddr[31:12]==
                         BASEADDR_GPIO1[31:12]);       // 0x40011000
  assign sysctrl_hsel = (haddr[31:12]==20'h4001F);     // 0x4001F000
  assign sysrom_hsel  = (haddr[31:12]==
                         BASEADDR_SYSROMTABLE[31:12]); // 0xF0000000

  // ----------------------------------------------------------
  // Default slave decode logic
  // ----------------------------------------------------------

  assign defslv_hsel  = ~(flash_hsel   | sram_hsel   |
                          boot_hsel    | apbsys_hsel |
                          gpio0_hsel   | gpio1_hsel  |
                          sysctrl_hsel | sysrom_hsel |
                          hselmtb);

  // ----------------------------------------------------------
  // MTB Selection decode logic
  // ----------------------------------------------------------

  assign hselmtb        = 1'b0;
  assign hselram        = 1'b0;
  assign hselsfr        = 1'b0;

endmodule
