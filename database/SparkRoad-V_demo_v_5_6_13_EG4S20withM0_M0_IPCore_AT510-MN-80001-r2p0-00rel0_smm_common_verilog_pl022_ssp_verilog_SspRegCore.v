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
//  File Name              : $RCSfile: SspRegCore.v.rca $S
//  File Revision          : 20351
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

// Purpose      : This block contains the normal mode registers in the SSP

// --=========================================================================--

`timescale 1ns/1ps

//  ----------------------------------------------------------------------------

module SspRegCore (
// Inputs 
                   PCLK,  
                   PRESETn,
                   PWDATAIn,
                   SSPCR0Wr,  
                   SSPCR1Wr,  
                   SSPCPSRWr,
                   SSPIMSCWr,
                   SSPICRWr,
                   SSPDMACRWr,
                   RTRISSync,
// Outputs
                   SSPCR0,  
                   SSPCR1,  
                   SSPCPSR,
                   SSPIMSC,
                   SSPDMACR,
                   RTIC,
                   RORIC,
                   CR0Update,  
                   CPSRUpdate 
                  );

// Inputs
input         PCLK;       // APB bus clock
input         PRESETn;    // Muxed reset (from BPRESETn)
input  [15:0] PWDATAIn;   // Int PWDATA
input         SSPCR0Wr;   // Write enable for SSPCR0
input         SSPCR1Wr;   // Write enable for SSPCR1
input         SSPCPSRWr;  // Write enable for SSPCPSR
input         SSPIMSCWr;  // Write enable for SSPIMSC
input         SSPICRWr;   // Write enable for SSPIC
input         SSPDMACRWr; // Write enable for SSPDMACR
input         RTRISSync;  // Rx Time Out Raw Interrupt Status

//Outputs
output [15:0] SSPCR0;     // 1st buffer
output  [6:0] SSPCR1;     // SSPCR1
output  [7:1] SSPCPSR;    // 1st buffer
output  [3:0] SSPIMSC;    // SSPIMSC
output  [1:0] SSPDMACR;   // SSPDMACR
output        RTIC;       // Rx Time Out Interrupt Clear
output        RORIC;      // Rx Over Run Interrupt Clear
output        CR0Update;  // Update trigger
output        CPSRUpdate; // Update trigger
//
// -----------------------------------------------------------------------------
//
//                               SspRegCore
//                               ==========
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// This block contains the normal mode registers in the SSP. The writable
// registers in the normal mode are SSPCR0, SSPCR1, SSPIMSC, SSPDR, SSCPSR 
// and SSICR.
// Out of these, writes to SSPDR go to the Transmit FIFO and SSPICR is a virtual
// register. Thus, SSPDR and SSPICR have no storage elements in this block.
// The entire contents of SSPCR0 and SSPCPSR need to be synchronised to the
// SSPCLK domain. These registers contain bit fields that need to remain
// coherent during the synchronisation process. Use of double synchronisation
// does not guarantee this. Hence, a two-buffer synchronisation technique
// is used for synchronisation. The first stage required for this
// technique is implemented in this module. In the case of SSCR1, 4 bits need
// to be synchronised to the SSPCLK domain. These bits are single-bit fields
// and hence double sunchronisation is used to synchronise these bits to the
// SSPCLK domain.
// The first buffer is written to, when the write enable input for the
// corresponding register is asserted. 
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------
reg [15:0] SSPCR0;   
// SSPCR0 First stage buffer

reg [15:0] NextSSPCR0;   
// D-input of SSPCR0

reg [6:0] SSPCR1;        
// SSPCR1 Register

reg [6:0] NextSSPCR1;        
// D-input of SSPCR1

reg [7:1] SSPCPSR;   
// SSPCPSR First stage buffer

reg [7:1] NextSSPCPSR;   
// D-input of SSPCPSR

reg [3:0] SSPIMSC;
// SSPIMSC First stage buffer

reg [3:0] NextSSPIMSC;
// D-input of SSPIMSC

reg [1:0] SSPDMACR;
// SSPDMACR DMA Control Register

reg [1:0] NextSSPDMACR;
// D-input of SSPDMACR

reg       CR0Update;
// Update trigger for SSPCR0

reg       NextCR0Update;
// D-input of CR0Update

reg       CPSRUpdate;
// Update trigger for SSPCPSR

reg       NextCPSRUpdate;
// D-input of CPSRUpdate

reg RTIC;
// Recieve Time Out Interrupt Clear register

wire NextRTIC;
// D-input of Recieve Time Out Interrupt Clear register

reg RORIC;
// Recieve Over Run Interrupt Clear register

reg NextRORIC;
// D-input of Recieve Over Run  Interrupt Clear register

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Clocked process for the registers in this block.
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_SeqSSE
  if (PRESETn == 1'b0) 
    begin
      SSPCR0   <= 16'h0000; 
      SSPCR1   <= 7'b0000000;
      SSPCPSR  <= 7'b0000000;
      SSPIMSC  <= 4'b0000;
      SSPDMACR <= 2'b00;
    end
  else 
    begin
      SSPCR1   <= NextSSPCR1;
      SSPCR0   <= NextSSPCR0;
      SSPCPSR  <= NextSSPCPSR;
      SSPIMSC  <= NextSSPIMSC;
      SSPDMACR <= NextSSPDMACR;
    end
end // p_SeqSSE

// -----------------------------------------------------------------------------
// Write interface for DMA Control Register
// -----------------------------------------------------------------------------

always@(SSPDMACRWr or SSPDMACR or PWDATAIn)
begin : p_SSPDMACRComb 
  if (SSPDMACRWr == 1'b1)
    NextSSPDMACR = PWDATAIn[1:0];
  else
    NextSSPDMACR = SSPDMACR;
end // p_SSPDMACRComb

// -----------------------------------------------------------------------------
// Write interface for First stage buffer
// Write into the First stage buffers from the Data bus when the corresponding 
// write enable signal is asserted. 
// -----------------------------------------------------------------------------
always @(SSPCR0 or SSPCR1 or SSPCPSR or SSPIMSC or SSPCR0Wr or SSPCR1Wr or 
         SSPCPSRWr or SSPIMSCWr or PWDATAIn)
begin : p_RegComb
  NextSSPCR0  = SSPCR0;
  NextSSPCR1  = SSPCR1;
  NextSSPCPSR = SSPCPSR;
  NextSSPIMSC = SSPIMSC;

  if (SSPCR0Wr == 1'b1) 
    NextSSPCR0 = PWDATAIn;

  if (SSPCR1Wr == 1'b1) 
    NextSSPCR1 = PWDATAIn[6:0];

  if (SSPCPSRWr == 1'b1) 
    NextSSPCPSR = PWDATAIn[7:1];

  if (SSPIMSCWr == 1'b1) 
    NextSSPIMSC = PWDATAIn[3:0];
end // p_RegComb

// -----------------------------------------------------------------------------
// The CR0Update signal toggles with every write to the SSPCR0 register
// -----------------------------------------------------------------------------
always @(CR0Update or SSPCR0Wr)
begin : p_UpdtCR0Comb 
  NextCR0Update = CR0Update;
  if (SSPCR0Wr == 1'b1)
    NextCR0Update = ~(CR0Update);
end // p_UpdtCR0Comb
 
// -----------------------------------------------------------------------------
// Sequential process for CR0Update
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_UpdtCR0Seq
  if (PRESETn == 1'b0)
    CR0Update <= 1'b0;
  else 
    CR0Update <= NextCR0Update;
end // p_UpdtCR0Seq

// -----------------------------------------------------------------------------
// The CPSRUpdate signal toggles with every write to the SSPCPSR register
// -----------------------------------------------------------------------------
always @ (CPSRUpdate or SSPCPSRWr)
begin : p_UpdtCPSRComb
  NextCPSRUpdate = CPSRUpdate;
  if (SSPCPSRWr == 1'b1)
    NextCPSRUpdate = ~(CPSRUpdate);
end // p_UpdtCPSRComb
 
// -----------------------------------------------------------------------------
// Sequential process for iCPSRUpdate
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_UpdtCPSRSeq
  if (PRESETn == 1'b0)
    CPSRUpdate <= 1'b0;
  else
    CPSRUpdate <= NextCPSRUpdate;
end // p_UpdtCPSRSeq

// ------------------------------------------------------------------
// RORIC : Receive Over Run Timeout
// ------------------------------------------------------------------

always@(SSPICRWr or RORIC or PWDATAIn) 
begin : p_RORICComb 
  NextRORIC   = RORIC;

  if(SSPICRWr == 1'b1)
    NextRORIC = PWDATAIn[0];
  else
    NextRORIC = 1'b0;
end // p_RORICComb

always@(posedge PCLK or negedge PRESETn)
  begin : p_RORICSeq 
    if (PRESETn == 1'b0)
      RORIC <= 1'b0;
    else
      RORIC <= NextRORIC;
  end // p_RORICSeq


// ---------------------------------------------------------------------
// -- RTIC : Receive Timeout
// ---------------------------------------------------------------------

assign NextRTIC = ((RTRISSync & RTIC) | (SSPICRWr & PWDATAIn[1]));

 always@(posedge PCLK or negedge PRESETn)
  begin : p_RTICSeq 
    if(PRESETn == 1'b0)
      RTIC <= 1'b0;
    else
      RTIC <= NextRTIC;
  end // p_RTICSeq
  
endmodule

// --============================ End ========================================--



