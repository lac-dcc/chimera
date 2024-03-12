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
//      Checked In          : $Date: 2013-04-18 11:30:44 +0100 (Thu, 18 Apr 2013) $
//
//      Revision            : $Revision: 244427 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : Constants Definitions for APB watchdog timer
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Watchdog register addresses
//------------------------------------------------------------------------------

// Watchdog base address prefixes
`define ARM_WDOG1A 7'b0000000
`define ARM_WDOG2A 7'b0000001

// Lock register base address
`define ARM_WDOGLA 7'b1100000
// Integration Test register base address
`define ARM_WDOGIA 7'b1111000
// Peripheral and PrimeCell register base address
`define ARM_WDOGPA1 7'b1111111
`define ARM_WDOGPA2 7'b1111110

// Register addresses for use by Frcs
`define ARM_WDOGLOADA 3'b000
`define ARM_WDOGVALUEA 3'b001
`define ARM_WDOGCONTROLA 3'b010
`define ARM_WDOGCLEARA 3'b011
`define ARM_WDOGINTRAWA 3'b100
`define ARM_WDOGINTA 3'b101

// Watchdog Lock register
`define ARM_WDOGLOCKA 3'b000

// Integration Test registers
`define ARM_WDOGTCRA 3'b000
`define ARM_WDOGTOPA 3'b001

// Peripheral and PrimeCell ID registers
`define ARM_WPERIPHID4A 4'b0100
`define ARM_WPERIPHID5A 4'b0101
`define ARM_WPERIPHID6A 4'b0110
`define ARM_WPERIPHID7A 4'b0111
`define ARM_WPERIPHID0A 4'b1000
`define ARM_WPERIPHID1A 4'b1001
`define ARM_WPERIPHID2A 4'b1010
`define ARM_WPERIPHID3A 4'b1011
`define ARM_WPCELLID0A 4'b1100
`define ARM_WPCELLID1A 4'b1101
`define ARM_WPCELLID2A 4'b1110
`define ARM_WPCELLID3A 4'b1111

// --============================== End ======================================--
