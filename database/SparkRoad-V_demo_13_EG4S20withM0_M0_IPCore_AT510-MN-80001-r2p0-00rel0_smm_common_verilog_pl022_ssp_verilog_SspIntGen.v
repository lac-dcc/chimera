// --=========================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//    (C) COPYRIGHT 2007-2008 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  copies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
// -----------------------------------------------------------------------------
//  
//  Version and Release Control Information:
//  
//  File Name              : $RCSfile: SspIntGen.v.rca $S
//  File Revision          : 20349
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

// Purpose      : INTR Interrupt generation logic.

// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspIntGen (
                  TXMIS, 
                  RXMIS, 
                  RORMIS,
                  DataStp,
                  RTIMSync,

                  RORIC,
                  RTIC,
                  RORINTR,
                  RTINTR,
                  INTR
                 );

// Inputs
input  TXMIS;    // Tx FIFO Service request
input  RXMIS;    // Rx FIFO Service request
input  RORMIS;   // Rx FIFO Overrun interrupt
input  DataStp;  // Rx TimeOut interrupt input
input  RTIMSync; // Rx TimeOut Interrupt Mask Sync
input  RORIC;    // Rx FIFO Overrun Clear input
input  RTIC;     // Rx TimeOut Clear input

// Outputs
output RORINTR;  // Rx FIFO Overrun interrupt output
output RTINTR;   // RX TimeOut Masked Interrupt output
output INTR;     // Combined interrupt

// -----------------------------------------------------------------------------
//
//                               SspIntGen
//                               =========
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// The combined interrupt INTR is generated as an OR of the individual 
// interrupt sources RXMIS, TXMIS and RORINTR and RTINTR.
// 
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register  declarations
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// ---------------------------------------------------------------------
// -- When the relevant interrupt clear signal is asserted, the
// -- asynchronous interrupt is cleared.  
// ---------------------------------------------------------------------

assign RTINTR  = DataStp & RTIMSync & ~RTIC;
assign RORINTR = RORMIS  & ~RORIC;

// -----------------------------------------------------------------------------
// OR the individual interrupts to generate INTR
// -----------------------------------------------------------------------------
assign INTR = RXMIS | TXMIS | RORINTR | RTINTR;

endmodule

// --============================ End ========================================--











