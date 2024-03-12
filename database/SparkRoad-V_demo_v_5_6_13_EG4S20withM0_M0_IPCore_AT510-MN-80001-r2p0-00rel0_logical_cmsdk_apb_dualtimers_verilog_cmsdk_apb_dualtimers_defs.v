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
//      Checked In          : $Date: 2012-07-30 16:01:51 +0100 (Mon, 30 Jul 2012) $
//
//      Revision            : $Revision: 216946 $
//
//      Release Information : Cortex-M System Design Kit-r1p0-00rel0
//
//-----------------------------------------------------------------------------
//-----------------------------------------------------------------------------
// Abstract : The constants used in the Timers system are defined in this file
//-----------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Timer register addresses
//------------------------------------------------------------------------------

// Timer base address prefixes
`define ARM_TIMER1A       7'b0000000
`define ARM_TIMER2A       7'b0000001
`define ARM_TIMER3A       7'b0000010
`define ARM_TIMER4A       7'b0000011

// Integration Test register base address
`define ARM_TIMERIA       7'b1111000
// Peripheral and PrimeCell register base address
`define ARM_TIMERP0A      7'b1111110
`define ARM_TIMERP1A      7'b1111111

// Integration Test register and ID registers base address
//`define ARM_TIMERIA       4'b1111

// Register addresses for use by Frcs
`define ARM_TIMERLOADA    3'b000
`define ARM_TIMERVALUEA   3'b001
`define ARM_TIMERCONTROLA 3'b010
`define ARM_TIMERCLEARA   3'b011
`define ARM_TIMERINTRAWA  3'b100
`define ARM_TIMERINTA     3'b101
`define ARM_TIMERLOADBGA  3'b110

// Peripheral and PrimeCell ID registers addresses
`define ARM_TIMERITCRA    6'b000000
`define ARM_TIMERITOPA    6'b000001
`define ARM_TPERIPHID4A   4'b0100
`define ARM_TPERIPHID5A   4'b0101
`define ARM_TPERIPHID6A   4'b0110
`define ARM_TPERIPHID7A   4'b0111
`define ARM_TPERIPHID0A   4'b1000
`define ARM_TPERIPHID1A   4'b1001
`define ARM_TPERIPHID2A   4'b1010
`define ARM_TPERIPHID3A   4'b1011
`define ARM_TPCELLID0A    4'b1100
`define ARM_TPCELLID1A    4'b1101
`define ARM_TPCELLID2A    4'b1110
`define ARM_TPCELLID3A    4'b1111

// --========================= End ===========================================--
