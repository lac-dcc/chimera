//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2013-2017 ARM Limited or its affiliates.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited or its affiliates.
//
//  Version and Release Control Information:
//
//  File Revision       : $Revision: 368444 $
//  File Date           : $Date: 2017-07-25 15:10:13 +0100 (Tue, 25 Jul 2017) $
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : This module performs the address decode of the HADDR from the
//            CPU and generates the HSELs' for each of the target peripherals.
//            Also performs address decode for MTB
//-----------------------------------------------------------------------------
//
// Note: This file has been modified from original CMSDK due to memory
//       map differences.
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
    input wire              zbt_boot_ctrl, // Set to 1 to boot from ZBT SRAM

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
    output wire             hselmtb,         // Select MTB
    output wire             hselram,         // Select MTB RAM
    output wire             hselsfr);        // Select MTB Special Function Registers


  // AHB address decode
  // 0x00000000 - 0x0000FFFF : 64K flash / boot firmware
  // 0x01000000 - 0x0100FFFF : boot firmware  : only 4k is used
  // 0x20000000 - 0x207FFFFF : SRAM (8MB range, but might only have 4MB fitted)
  // 0x40000000 - 0x4000FFFF : APB subsystem
  // 0x40010000 - 0x4001FFFF : AHB peripherals (GPIOs)
  // 0xF0000000 - 0xF0000FFF : System ROM Table

  // ----------------------------------------------------------
  // Memory decode logic
  // ----------------------------------------------------------

  // If Boot loader is not present (BOOT_LOADER_PRESENT==0),
  // boot_hsel always 0.
  // Otherwise select if address = 0x0100xxxx or
  // when remap_ctrl is 1 and zbt_boot_ctrl is 0,
  // and address = 0x0000xxxx
  assign boot_hsel    = (BOOT_LOADER_PRESENT==0) ? 1'b0 :
     ((haddr[31:16]==16'h0000) & (remap_ctrl==1'b1) & ~zbt_boot_ctrl) |
      (haddr[31:16]==16'h0100);

  assign flash_hsel   = (BOOT_LOADER_PRESENT==0) ?   // 0x00000000
    // Boot loader not present. Select if first 64KB is selected
    (haddr[31:23]==9'b0000_0000_0) :
    // Boot loader present. If boot loader is selected then flash is
    // not selected
    (haddr[31:23]==9'b0000_0000_0) & (boot_hsel==1'b0);

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

  // Modification

  assign defslv_hsel  = 1'b0; // Default slave is not required
                              // at cmsdk_mcu_system level as
                              // it is handled by fpga_system
                              // code.

  assign sram_hsel    = ~(flash_hsel   | hselmtb   |
                          boot_hsel    | apbsys_hsel |
                          gpio0_hsel   | gpio1_hsel  |
                          sysctrl_hsel | sysrom_hsel );

  // ----------------------------------------------------------
  // MTB Selection decode logic
  // ----------------------------------------------------------

`ifdef CORTEX_M0PLUS
`ifdef ARM_CMSDK_INCLUDE_MTB
  // MTB Decode for read/write accesses
  // MTB Memory Map
  // 0x20000000 - 0x2000FFFF : SRAM
  // 0xF0200000 - 0xF0200FFF : MTB SFR Address space
  // 0xF0210000 - 0xF021FFFF : MTB SRAM Address space (64k)

  assign hselmtb    = (haddr[31:16]==16'hF020) |
                      (haddr[31:16]==16'hF021) |
                      (haddr[31:16]==16'h2000);
  assign hselram    = (haddr[31:16]==16'hF021) |
                      (haddr[31:16]==16'h2000);
  assign hselsfr    = (haddr[31:12]==20'hF0200);

`else
  assign hselmtb        = 1'b0;
  assign hselram        = 1'b0;
  assign hselsfr        = 1'b0;
`endif
`else
  assign hselmtb        = 1'b0;
  assign hselram        = 1'b0;
  assign hselsfr        = 1'b0;
`endif

endmodule
