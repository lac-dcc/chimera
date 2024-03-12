// --=========================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//    (C) COPYRIGHT 2007-2008 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  copies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
//  ----------------------------------------------------------------------------
//  
//  Version and Release Control Information:
//  
//  File Name              : $RCSfile: SspSynctoSSPCLK.v.rca $S
//  File Revision          : 20359
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
//  ----------------------------------------------------------------------------
  
//------------------------------------------------------------------------------

// Purpose      : Synchronisers for signals crossing from PCLK domain to
//                SSPCLK domain

// --=========================================================================--

`timescale 1ns/1ps

//  ----------------------------------------------------------------------------


module SspSynctoSSPCLK (
// Inputs
                        SSPCLK, 
                        nSSPRST, 
                        SSPCLKIN, 
                        SSPFSSIN, 
                        TxDataAvlbl, 
                        SSE, 
                        MS, 
                        SOD, 
                        CR0Update, 
                        CPSRUpdate,
                        RTIC,
                        RNE,
                        RTIM,
// Outputs
                        CLKINSync,
                        FSSINSync, 
                        TxDataAvlblSync, 
                        SSESync, 
                        MSSync, 
                        SODSync,
                        CR0UpdateSync, 
                        CPSRUpdateSync,
                        RTICSync,
                        RNESync,
                        RTIMSync 
                      );
// Inputs
input  SSPCLK;          // Main SSP clock
input  nSSPRST;         // Muxed reset (from nSSPRST)
input  SSPCLKIN;        // Serial Clock input
input  SSPFSSIN;        // Serial Frame input
input  TxDataAvlbl;     // TX data available
input  SSE;             // SSP enable
input  MS;              // Master / Slave Select bit
input  SOD;             // Slave Output Disable bit
input  CR0Update;       // Ctrl signal for SSPCR0 sync
input  CPSRUpdate;      // Trigger for SSPCPSR Sync
input  RTIC;            // Rx Time Out Interrupt Clear
input  RNE;             // Rx FIFO Not Empty
input  RTIM;            // Rx Time Interrupt Mask

//Outputs
output CLKINSync;       // To TxRx block
output FSSINSync;       // To TxRx block
output TxDataAvlblSync; // To TxRx block
output SSESync;         // SSP enable
output MSSync;          // Master/Slave Enable bit
output SODSync;         // Slave Output Disable 
output CR0UpdateSync;   // To Prescaler
output CPSRUpdateSync;  // To Prescaler
output RTICSync;        // RTIC  synchronised
output RNESync;         // RNE synchronised
output RTIMSync;        // RTIM  synchronised

//------------------------------------------------------------------------------
//
//                               SspSynctoSSPCLK
//                               ===============
//
//------------------------------------------------------------------------------
//
// Overview
// ========
//
// This block implements the synchronisers for signals crossing over from the
// PCLK domain to the SSPCLK domain. The signals are 'double-synchronise'd using
// inferred d-type flip-flops.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Register Declarations
//------------------------------------------------------------------------------
reg CR0UpdateSync1;
// 1st stage synchronised version of CR0Update input

reg CR0UpdateSync;
// 2nd stage synchronised version of CR0Update input

reg TxDataAvlblSync1;
// 1st stage synchronised version of TxDataAvlbl input

reg TxDataAvlblSync;
// 2nd stage synchronised version of TxDataAvlbl input

reg SSESync1;
// 1st stage synchronised version of SSE input

reg SSESync;
// 2nd stage synchronised version of SSE input

reg CPSRUpdateSync1;
// 1st stage synchronised version of CPSRUpdate input

reg CPSRUpdateSync;
// 2nd stage synchronised version of CPSRUpdate input

reg CLKINSync1;
// 1st stage synchronised version of SCLKIN input

reg CLKINSync;
// 2nd stage synchronised version of SCLKIN input

reg FSSINSync1;
// 1st stage synchronised version of SSPFSSIN input

reg FSSINSync;
// 2nd stage synchronised version of SSPFSSIN input

reg MSSync1;
// 1st stage synchronised version of MS input

reg MSSync;
// 2nd stage synchronised version of MS input

reg SODSync1;
// 1st stage synchronised version of SOD input

reg SODSync;
// 2nd stage synchronised version of SOD input

reg RTICSync1;
// 1st stage synchronised version of RTIC input

reg RTICSync;
// 2nd stage synchronised version of RTIC input

reg RNESync1;
// 1st stage synchronised version of RNE input

reg RNESync;
// 2ns stage synchronised version of RNE input

reg RTIMSync1;
// 1st stage synchronised version of RTIM input
 
reg RTIMSync;
// 2nd stage synchronised version of RTIM input
 

//------------------------------------------------------------------------------
//
// Main body of code
// =================
//
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
// Double-synchronise with inferred D-types
//------------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST)
begin : p_Sync
  if (nSSPRST == 1'b0) 
    begin
      CR0UpdateSync1   <= 1'b0;
      CR0UpdateSync    <= 1'b0;
      TxDataAvlblSync1 <= 1'b0;
      TxDataAvlblSync  <= 1'b0;
      SSESync1         <= 1'b0;
      SSESync          <= 1'b0;
      CPSRUpdateSync1  <= 1'b0;
      CPSRUpdateSync   <= 1'b0;
      CLKINSync1       <= 1'b0;
      CLKINSync        <= 1'b0;
      FSSINSync1       <= 1'b1;
      FSSINSync        <= 1'b1;
      MSSync1          <= 1'b0;
      MSSync           <= 1'b0;
      SODSync          <= 1'b0;
      SODSync1         <= 1'b0;
      RTICSync         <= 1'b0;
      RTICSync1        <= 1'b0;
      RNESync          <= 1'b0;
      RNESync1         <= 1'b0;
      RTIMSync         <= 1'b0;
      RTIMSync1        <= 1'b0;
    end 
  else 
    begin 
      CR0UpdateSync1   <= CR0Update;
      CR0UpdateSync    <= CR0UpdateSync1;

      TxDataAvlblSync1 <= TxDataAvlbl;
      TxDataAvlblSync  <= TxDataAvlblSync1;

      SSESync1         <= SSE;
      SSESync          <= SSESync1;

      CLKINSync1       <= SSPCLKIN;
      CLKINSync        <= CLKINSync1;

      FSSINSync1       <= SSPFSSIN;
      FSSINSync        <= FSSINSync1;

      MSSync1          <= MS;
      MSSync           <= MSSync1;

      SODSync1         <= SOD;
      SODSync          <= SODSync1;

      RTICSync1        <= RTIC;
      RTICSync         <= RTICSync1;

      RNESync1         <= RNE;
      RNESync          <= RNESync1;

      RTIMSync1        <= RTIM;
      RTIMSync         <= RTIMSync1;
    
      CPSRUpdateSync1  <= CPSRUpdate;
      CPSRUpdateSync   <= CPSRUpdateSync1;
    end
end // p_Sync

endmodule

//================================== End =====================================--










