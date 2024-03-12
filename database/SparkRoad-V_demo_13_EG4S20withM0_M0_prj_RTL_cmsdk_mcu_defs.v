//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2010-2013 ARM Limited or its affiliates.
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
// Abstract : System configurations for Cortex-M0 example system
//-----------------------------------------------------------------------------
`include "fpga_options_defs.v"

// ============= MCU System options ===========

//------------------------------------------------------------------------------
// Option for debug protocol
// It can either be SWD (Serial Wire Debug protocol) or JTAG
// These options specified here cannot be controlled purely by parameters
// due to impact on I/O ports
//
`define ARM_CMSDK_INCLUDE_JTAG

//------------------------------------------------------------------------------
// Option to define if DMA controller is included.
//------------------------------------------------------------------------------
//`define ARM_CMSDK_INCLUDE_DMA

//------------------------------------------------------------------------------
// Option to define if 16-bit Flash memory support is included.
// (Available for Cortex-M0+ processor only)
//------------------------------------------------------------------------------
//`define ARM_CMSDK_INCLUDE_F16

//------------------------------------------------------------------------------
// Option to define if MTB is included (Cortex-M0+ specific so only valid
// when CORTEX_M0PLUS is defined below).
//------------------------------------------------------------------------------
//  Note : Be aware that when the MTB is selected the RAM in the system is
//         shared between Cortex-M0+ (for data) and the MTB (for trace & SFRs).
//         Therefore, changes to the AWIDTH (default 16) in tb_cmsdk_mcu.v for
//         the MTB will directly affect the size of the RAM, which could result
//         in some tests failing.

//`define ARM_CMSDK_INCLUDE_MTB

//------------------------------------------------------------------------------
// Option to define if I/O Port is included (Cortex-M0+ specific so only valid
// when CORTEXM0_PLUS is defined below).
//------------------------------------------------------------------------------
// `define ARM_CMSDK_INCLUDE_IOP
// `ifdef CORTEX_M0PLUS
  // `define ARM_IOP_ASSERT_ON
// `endif

//------------------------------------------------------------------------------
// CPU selection
//
//  Note : No need to set this for simulation. The Verilog command file (.vc)
//         set this up
//
//         **IMPORTANT** You need to set up this for synthesis.

//------------------------------------------------------------------------------
// Option to define if CORTEX-M0+ processor is used.
//   No need to set this for simulation, as the verilog command file already
//   define this.
//------------------------------------------------------------------------------
//`define CORTEX_M0PLUS

//------------------------------------------------------------------------------
// Option to define if CORTEX-M0 processor is used.
//   No need to set this for simulation, as the verilog command file already
//   define this.
//------------------------------------------------------------------------------
//`define CORTEX_M0

//------------------------------------------------------------------------------
// Option to define if CORTEX-M0 DesignStart is used.
//   No need to set this for simulation, as the verilog command file already
//   define this.
//------------------------------------------------------------------------------
`define CORTEX_M0DESIGNSTART

//------------------------------------------------------------------------------
// Default to Cortex-M0 processor if none is selected
// and prevent multiple defines
//------------------------------------------------------------------------------

`ifndef CORTEX_M0
`ifndef CORTEX_M0PLUS
`ifndef CORTEX_M0DESIGNSTART
// default choice
`define CORTEX_M0
`undef ARM_CMSDK_INCLUDE_MTB
`undef ARM_CMSDK_INCLUDE_IOP
`endif
`endif
`endif

// Prevent multiple defines
`ifdef CORTEX_M0
`ifdef CORTEX_M0PLUS
`undef CORTEX_M0
`endif
`endif

`ifdef CORTEX_M0
`ifdef CORTEX_M0DESIGNSTART
`undef CORTEX_M0DESIGNSTART
`undef ARM_CMSDK_INCLUDE_MTB
`undef ARM_CMSDK_INCLUDE_IOP
`endif
`endif

`ifdef CORTEX_M0PLUS
`ifdef CORTEX_M0DESIGNSTART
`undef CORTEX_M0DESIGNSTART
`endif
`endif

//------------------------------------------------------------------------------
// Prevent 16-bit Flash Support for Cortex-M0
//------------------------------------------------------------------------------

`ifdef ARM_CMSDK_INCLUDE_F16
`ifndef CORTEX_M0PLUS
`undef ARM_CMSDK_INCLUDE_F16
`endif
`endif

//------------------------------------------------------------------------------
// Prevent IOP support for Cortex-M0
//------------------------------------------------------------------------------

`ifdef ARM_CMSDK_INCLUDE_IOP
`ifndef CORTEX_M0PLUS
`undef ARM_CMSDK_INCLUDE_IOP
`endif
`endif

//------------------------------------------------------------------------------
// Prevent MTB support for Cortex-M0
//------------------------------------------------------------------------------

`ifdef ARM_CMSDK_INCLUDE_MTB
`ifndef CORTEX_M0PLUS
`undef ARM_CMSDK_INCLUDE_MTB
`endif
`endif

//------------------------------------------------------------------------------
// Option to define if bit band wrapper is included.
//------------------------------------------------------------------------------
`ifndef CORTEX_M0DESIGNSTART
`define ARM_CMSDK_INCLUDE_BITBAND
`endif

//------------------------------------------------------------------------------
// Option for Debug Tester feature for the testbench
// If this Macro is not defined, debug tester will be disabled in the testbench
`define ARM_CMSDK_INCLUDE_DEBUG_TESTER
// Note : This define macro does not affect the debug features of the processor
//        itself which is defined using Verilog parameter.


//------------------------------------------------------------------------------
// Option for enable clock gate
//`define ARM_CMSDK_INCLUDE_CLKGATE


//------------------------------------------------------------------------------
// Option for using slower PCLK.
// If this is set, APB running at half of AHB frequency.
// This option is available only if clock gating option is set
//`define ARM_CMSDK_SLOWSPEED_PCLK

//------------------------------------------------------------------------------
// Memory types
//------------------------------------------------------------------------------

`include "cmsdk_ahb_memory_models_defs.v"

// Memory types used in the Example system

  // Force the system to select the 16-bit Flash when this option is enabled.
`ifndef ARM_CMSDK_INCLUDE_F16
  // Boot loader memory type
`ifdef INCLUDE_BLOCKRAM
`define ARM_CMSDK_BOOT_MEM_TYPE `AHB_ROM_BEH_MODEL
`else
`define ARM_CMSDK_BOOT_MEM_TYPE `AHB_ROM_NONE
`endif
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_ROM_NONE             - memory not present
  //  1) AHB_ROM_BEH_MODEL        - behavioral ROM memory
  //  2) AHB_ROM_FPGA_SRAM_MODEL  - behavioral FPGA SRAM model with SRAM wrapper
  //  3) AHB_ROM_FLASH32_MODEL    - behavioral 32-bit flash memory
  //  4) AHB_ROM_FLASH16_MODEL    - behavioral 16-bit flash memory

  // ROM memory type
`define ARM_CMSDK_ROM_MEM_TYPE  `AHB_ROM_BEH_MODEL
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_ROM_NONE             - memory not present (Invalid for a Cortex-M0 system))
  //  1) AHB_ROM_BEH_MODEL        - behavioral ROM memory
  //  2) AHB_ROM_FPGA_SRAM_MODEL  - behavioral FPGA SRAM model with SRAM wrapper
  //  3) AHB_ROM_FLASH32_MODEL    - behavioral 32-bit flash memory
  //  4) AHB_ROM_FLASH16_MODEL    - behavioral 16-bit flash memory

`else
  // 16-bit Flash support is used
  // (this feature is available on Cortex-M0+)

  // BOOT ROM can be 16-bit flash or None
  //  0) AHB_ROM_NONE             - memory not present (Invalid for a Cortex-M0 system))
  //  4) AHB_ROM_FLASH16_MODEL    - behavioral 16-bit flash memory
`ifdef INCLUDE_BLOCKRAM
`define ARM_CMSDK_BOOT_MEM_TYPE `AHB_ROM_BEH_MODEL
`else
`define ARM_CMSDK_BOOT_MEM_TYPE `AHB_ROM_NONE
`endif

  // ROM memory type
  // Program ROM can only be AHB_ROM_FLASH16_MODEL
  // (Don't edit ROM_MEM below since required for 16-bit system)
`define ARM_CMSDK_ROM_MEM_TYPE  `AHB_ROM_FLASH16_MODEL
`endif

  // RAM memory type
`define ARM_CMSDK_RAM_MEM_TYPE  `AHB_RAM_BEH_MODEL
  //  Based on the definition constants in logical/models/memories/cmsdk_ahb_memory_model_defs.v
  //  0) AHB_RAM_NONE             - memory not present (Invalid for a Cortex-M0 system)
  //  1) AHB_RAM_BEH_MODEL        - behavioral RAM memory
  //  2) AHB_RAM_FPGA_SRAM_MODEL  - behavioral SRAM model with SRAM wrapper
  //  3) AHB_RAM_EXT_SRAM16_MODEL - for benchmarking using 16-bit external asynchronous SRAM
  //  4) AHB_RAM_EXT_SRAM8_MODEL  - for benchmarking using 8-bit external asynchronous SRAM

  // Memory wait state parameters - used by behaviorial model if applicable
  // Boot ROM non-sequential and sequential waitstate
`define ARM_CMSDK_BOOT_MEM_WS_N   0
`define ARM_CMSDK_BOOT_MEM_WS_S   0

   // ROM non-sequential and sequential waitstate
`define ARM_CMSDK_ROM_MEM_WS_N    0
`define ARM_CMSDK_ROM_MEM_WS_S    0

   // RAM non-sequential and sequential waitstate
`define ARM_CMSDK_RAM_MEM_WS_N    0
`define ARM_CMSDK_RAM_MEM_WS_S    0
