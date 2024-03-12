//-----------------------------------------------------------------------------
// The confidential and proprietary information contained in this file may
// only be used by a person authorised under and to the extent permitted
// by a subsisting licensing agreement from ARM Limited or its affiliates.
//
//            (C) COPYRIGHT 2013 ARM Limited or its affiliates.
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
// Abstract : FPGA design options
//-----------------------------------------------------------------------------
`define REVC

`define INCLUDE_PSRAM

`define INCLUDE_VGA

`define INCLUDE_BLOCKRAM

//---------------------------------------------------------------
// CPU selection is done in cmsdk_mcu_defs.v as a single location
//---------------------------------------------------------------


// Note: PLL option is defined in synthesis project.
//       We don't want to use PLL in simulation.
// `define INCLUDE_PLL

// Appnote information
`define IDENT        12'h387
`define BUILD         8'h03
// Processor revision
`define VARIANT       4'h0
`define REV           4'h1

// Generate correct BOARD_TARGET code
`ifndef REVC
`ifndef REVB
//-----------
//   rev A
//-----------
// Target board Rev 0=A, 1=B, etc.
`define BOARD_TARGET  4'h0
`else
//-----------
//  rev B
//-----------
// Target board Rev 0=A, 1=B, etc.
`define BOARD_TARGET  4'h1
//-----------------------------------------------------------------------------

`endif
`else
//-----------
//  rev C
//-----------
// Target board Rev 0=A, 1=B, etc.
`define BOARD_TARGET  4'h2
//-----------------------------------------------------------------------------

`endif

