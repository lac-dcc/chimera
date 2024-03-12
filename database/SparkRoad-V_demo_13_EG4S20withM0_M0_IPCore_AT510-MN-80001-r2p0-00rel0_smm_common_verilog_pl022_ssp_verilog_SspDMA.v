//  ----------------------------------------------------------------------------
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
//  File Name              : SspDMA.v.rca
//  File Revision          : 20346
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
//  ----------------------------------------------------------------------------
//  
//  
//  

`timescale 1ns/1ps

module SspDMA (
              PCLK,
              PRESETn,
        
              SSE,
              TXDMAE,
              RXDMAE,
        
              TESTFIFO,
              TXRIS,
              RXRIS,
              TXFLTE7Full,
              RXFGTE1Full,
              IntTXDMACLRSync,
              IntRXDMACLRSync,
        
              TXDMASREQ,
              TXDMABREQ,
              RXDMASREQ,
              RXDMABREQ
              );

// Include Defs file
`include "SspDefs.v"

input       PCLK;               // APB Clock
input       PRESETn;            // AMBA Bus reset
        
input       SSE;                // Ssp Enable
input       TXDMAE;             // Transmit DMA Enable
input       RXDMAE;             // Receive DMA Enable
        
input       TESTFIFO;           // Test FIFO mode
input       TXRIS;              // Transmit burst
input       RXRIS;              // Receive burst
input       TXFLTE7Full;        // TX FIFO has 1 or more spaces
input       RXFGTE1Full;        // RX FIFO contains data
input       IntTXDMACLRSync;    // DMA clear signal
input       IntRXDMACLRSync;    // DMA clear signal
        
output      TXDMASREQ;          // Transmit single request
output      TXDMABREQ;          // Transmit burst request
output      RXDMASREQ;          // Receive single request
output      RXDMABREQ;          // Receive burst request

// ---------------------------------------------------------------------
// Purpose    :  This block contains the logic for the DMA Interface.
// ---------------------------------------------------------------------

// -----------------------------------------------------------------------
//                          SspDMA
//                          =======
//                          
// -----------------------------------------------------------------------
// Overview
// ========
// This block contains the logic for the DMA interface. It generates the
// 4 DMA request signals, TXDMASREQ, RXDMASREQ, TXDMABREQ and RXDMABREQ 
// depending on the amount of data in the FIFO's.
// 
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
// Register declarations
//
// -----------------------------------------------------------------------------

reg nextTXDMASREQ;
// D-input of TXDMASREQ
  
reg nextTXDMABREQ;
// D-input of TXDMABREQ
  
reg nextRXDMASREQ;
// D-input of RXDMASREQ
  
reg nextRXDMABREQ;
// D-input of RXDMABREQ
  
reg TXDMABREQ;
// TXDMABREQ
  
reg RXDMABREQ;
// RXDMABREQ

reg TXDMASREQ;
// TXDMASREQ
  
reg RXDMASREQ;
// RXDMASREQ
 
wire DMATXEn;
//  DMA Transmit enable

wire DMARXEn;
//  DMA Receive enable
  
  
// -----------------------------------------------------------------------------
//  Internal Constants
// -----------------------------------------------------------------------------


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

 
// -----------------------------------------------------------------------------
// Sequential process for registers/flip-flops in this block
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_Seq
  if (~PRESETn)
  begin
    TXDMASREQ  <= 1'b0;
    TXDMABREQ  <= 1'b0;
    RXDMASREQ  <= 1'b0;
    RXDMABREQ  <= 1'b0;
  end
  else
  begin
    TXDMASREQ  <= nextTXDMASREQ;
    TXDMABREQ  <= nextTXDMABREQ;
    RXDMASREQ  <= nextRXDMASREQ;
    RXDMABREQ  <= nextRXDMABREQ;
  end   
end //p_Seq;

  
// ---------------------------------------------------------------------
// The DMATXEn is asserted when the Ssp is enabled and the Transmit 
// DMA bit is set in the SspDMACR register. 
// This can also be asserted when the FIFOs need to be tested 
// with DMA.
// ---------------------------------------------------------------------

assign DMATXEn = ((SSE | TESTFIFO) & TXDMAE);

// -------------------------------------------------------------------
// The transmit single request is set when there is at least one 
// space in the transmit FIFO. 
// It is cleared when either there is a IntTXDMACLRSync signal or 
// when the DMATXEn is not asserted.
// -------------------------------------------------------------------

always @(DMATXEn or IntTXDMACLRSync or TXFLTE7Full or TXDMASREQ)
begin : p_TXDMASREQ
  if (~DMATXEn  | IntTXDMACLRSync)
    nextTXDMASREQ = 1'b0;
  else if (TXFLTE7Full)
    nextTXDMASREQ = 1'b1;
  else
    nextTXDMASREQ = TXDMASREQ;
end // p_TXDMASREQ;

// ---------------------------------------------------------------------
// The transmit burst request is set when there are more spaces than
// the watermark level in the transmit FIFO. It is cleared when
// either there is a IntTXDMACLRSync signal or when the DMATXEn is not 
// asserted.
// ---------------------------------------------------------------------

always @(DMATXEn or IntTXDMACLRSync or TXRIS or TXDMABREQ)
begin : p_TXDMABREQ 
   if (~DMATXEn | IntTXDMACLRSync) 
     nextTXDMABREQ = 1'b0;
   else if (TXRIS) 
     nextTXDMABREQ = 1'b1;
   else
     nextTXDMABREQ = TXDMABREQ;
end // p_TXDMABREQ;

  
// ---------------------------------------------------------------------
// The DMARXEn is asserted when the Ssp is enabled and the Receive 
// DMA bit is set in the SspDMACR register. This can also be aserted
// when the FIFOs need to be tested with DMA. 
// ---------------------------------------------------------------------
  
assign DMARXEn = (SSE | TESTFIFO) &  RXDMAE;

// -------------------------------------------------------------------
// The receive single request is set when there is at least one 
// character in the receive FIFO. 
// It is cleared when either there is a IntRXDMACLRSync signal or when
// the DMARXEn is not asserted. 
// -------------------------------------------------------------------
  
always @(DMARXEn or IntRXDMACLRSync or RXFGTE1Full or RXDMASREQ) 
begin : p_RXDMASREQ
  nextRXDMASREQ = RXDMASREQ;
  if (~DMARXEn | IntRXDMACLRSync)
    nextRXDMASREQ = 1'b0;
  else if (RXFGTE1Full)
    nextRXDMASREQ = 1'b1;
  else
    nextRXDMASREQ = RXDMASREQ;
end // p_RXDMASREQ;


// ---------------------------------------------------------------------
// The receive burst request is set when there are more characters 
// than the watermark level in the receive FIFO. 
// It is cleared when either:
//   - there is a IntRXDMACLRSync signal
//   - the DMARXEn is not asserted or

// ---------------------------------------------------------------------
  
always @(DMARXEn or IntRXDMACLRSync or RXRIS or RXDMABREQ)
begin : p_RXDMABREQ
  if (~DMARXEn | IntRXDMACLRSync)
    nextRXDMABREQ = 1'b0;
  else if (RXRIS)
    nextRXDMABREQ = 1'b1; 
  else
    nextRXDMABREQ = RXDMABREQ;
end // p_RXDMABREQ;


endmodule

// --================================== End ==================================--



