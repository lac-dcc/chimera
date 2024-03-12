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
//  File Name              : $RCSfile: SspSynctoPCLK.v.rca $S
//  File Revision          : 20358
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------
// Purpose      : Synchronisers for signals crossing from SSPCLK domain to
//                PCLK domain
// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspSynctoPCLK (
// Inputs
                      PCLK, 

                      PRESETn, 

                      TxRxBSY, 
                      TxFRdPtrInc, 
                      RxFWr,
                      DataStp, 
                      RTINTR,
                      IntTXDMACLR,
                      IntRXDMACLR,
// Outputs
                      TxRxBSYSync, 
                      TxFRdPtrIncSync,
                      RxFWrSync,
                      RTRISSync,
                      RTMISSync,
                      IntTXDMACLRSync,
                      IntRXDMACLRSync
                     );

// Inputs
input  PCLK;               // APB bus clock
input  PRESETn;            // Muxed reset (from BPRESETn)
input  TxRxBSY;            // SSP Tx/Rx controller busy
input  TxFRdPtrInc;        // TX FIFO read pointer incr.
input  RxFWr;              // RX FIFO write enable
input  DataStp;            // RX Timeout Raw interrupt
input  RTINTR;             // RX Timeout Masked interrupt
input  IntTXDMACLR;        // IntTXDMACLR
input  IntRXDMACLR;        // IntRXDMACLR
// Outputs
output TxRxBSYSync;        // To TX FIFO
output TxFRdPtrIncSync;    // To TX FIFO
output RxFWrSync;          // To RX FIFO
output RTRISSync;          // Rx Timeout Raw Interrupt Status
output RTMISSync;          // Rx Timeout Raw Interrupt Status
output IntTXDMACLRSync;    // IntTXDMACLR synchronised
output IntRXDMACLRSync;    // IntRXDMACLR synchronised

// -----------------------------------------------------------------------------
//
//                               SspSynctoPCLK
//                               =============
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// This block implements the synchronisers for signals crossing over from the
// SSPCLK domain to the PCLK domain. The signals are 'double-synchronise'd 
// using inferred d-type flip-flops.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations 
// -----------------------------------------------------------------------------
reg TxFRdPtrIncSync1;
// 1st stage synchronised version of TxFRdPtrInc input

reg TxFRdPtrIncSync;
// 2nd stage synchronised version of TxFRdPtrInc input

reg RxFWrSync1;
// 1st stage synchronised version of RxFWr input

reg RxFWrSync;
// 2nd stage synchronised version of RxFWr input

reg TxRxBSYSync1;
// 1st stage synchronised version of TxRxBSY input

reg TxRxBSYSync;
// 2nd stage synchronised version of TxRxBSY input

reg RTRISSync1;
// 1st stage synchronised version of DataStp input

reg RTMISSync1;
// 1st stage synchronised version of RTINTR input

reg IntTXDMACLRSync1;
// 1st stage synchronised version of IntTXDMACLR input

reg IntTXDMACLRSync;
// 2nd stage synchronised version of IntTXDMACLR input

reg IntRXDMACLRSync1;
// 1st stage synchronised version of IntRXDMACLR input

reg IntRXDMACLRSync;
// 2nd stage synchronised version of IntRXDMACLR input

reg RTRISSync;
// 2nd stage synchronised version of DataStp input

reg RTMISSync;
// 2nd stage synchronised version of RTINTR input


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// Double-synchronise with inferred D-types
// -----------------------------------------------------------------------------
always @(posedge PCLK or  negedge PRESETn)
begin : p_Sync
  if (PRESETn == 1'b0) 
    begin 
      TxFRdPtrIncSync1    <= 1'b0;
      TxFRdPtrIncSync     <= 1'b0;
      RxFWrSync1          <= 1'b0;
      RxFWrSync           <= 1'b0;
      TxRxBSYSync1        <= 1'b0;
      TxRxBSYSync         <= 1'b0;
      RTRISSync1          <= 1'b0;
      RTRISSync           <= 1'b0;
      RTMISSync1          <= 1'b0;
      RTMISSync           <= 1'b0;
      IntTXDMACLRSync1    <= 1'b0;
      IntTXDMACLRSync     <= 1'b0;
      IntRXDMACLRSync1    <= 1'b0;
      IntRXDMACLRSync     <= 1'b0;    
    end
  else 
    begin
      TxFRdPtrIncSync1    <= TxFRdPtrInc;
      TxFRdPtrIncSync     <= TxFRdPtrIncSync1;

      RxFWrSync1          <= RxFWr;
      RxFWrSync           <= RxFWrSync1;

      TxRxBSYSync1        <= TxRxBSY;
      TxRxBSYSync         <= TxRxBSYSync1;

      RTRISSync1          <= DataStp;
      RTRISSync           <= RTRISSync1;

      RTMISSync1          <= RTINTR;
      RTMISSync           <= RTMISSync1;

      IntTXDMACLRSync1    <= IntTXDMACLR;
      IntTXDMACLRSync     <= IntTXDMACLRSync1;

      IntRXDMACLRSync1    <= IntRXDMACLR;
      IntRXDMACLRSync     <= IntRXDMACLRSync1;
    end
end // p_Sync
endmodule

//================================== End =====================================--








