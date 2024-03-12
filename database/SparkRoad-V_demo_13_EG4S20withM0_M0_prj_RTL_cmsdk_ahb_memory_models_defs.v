//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited.
//                ALL RIGHTS RESERVED
//
// This entire notice must be reproduced on all copies of this file
// and copies of this file may only be made by a person if such person is
// permitted to do so under the terms of a subsisting license agreement
// from ARM Limited.
//
//      SVN Information
//
//      Checked In          : $Date: 2013-03-22 11:05:41 +0000 (Fri, 22 Mar 2013) $
//
//      Revision            : $Revision: 242013 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Memory model definitions
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Memory types
//------------------------------------------------------------------------------
// Constants for ROM types - Match to cmsdk_ahb_rom.v
  //  0) AHB_ROM_NONE             - memory not present
  //  1) AHB_ROM_BEH_MODEL        - behavioral ROM memory
  //  2) AHB_ROM_FPGA_SRAM_MODEL  - behavioral FPGA SRAM model with SRAM wrapper
  //  3) AHB_ROM_FLASH32_MODEL    - behavioral 32-bit flash memory
  //  4) AHB_ROM_FLASH16_MODEL    - behavioral 16-bit flash memory

`define AHB_ROM_NONE             0
`define AHB_ROM_BEH_MODEL        1
`define AHB_ROM_FPGA_SRAM_MODEL  2
`define AHB_ROM_FLASH32_MODEL    3
`define AHB_ROM_FLASH16_MODEL    4


// Constants for RAM types - Match to cmsdk_ahb_ram.v
  //  0) AHB_RAM_NONE             - memory not present
  //  1) AHB_RAM_BEH_MODEL        - behavioral RAM memory
  //  2) AHB_RAM_FPGA_SRAM_MODEL  - behavioral SRAM model with SRAM wrapper
  //  3) AHB_RAM_EXT_SRAM16_MODEL - for benchmarking using 16-bit external asynchronous SRAM
  //  4) AHB_RAM_EXT_SRAM8_MODEL - for benchmarking using 8-bit external asynchronous SRAM

`define AHB_RAM_NONE             0
`define AHB_RAM_BEH_MODEL        1
`define AHB_RAM_FPGA_SRAM_MODEL  2
`define AHB_RAM_EXT_SRAM16_MODEL 3
`define AHB_RAM_EXT_SRAM8_MODEL  4
