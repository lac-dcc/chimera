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
//  File Name              : $RCSfile: SspRxFCntl.v.rca $S
//  File Revision          : 20353
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

// Purpose      : This block controls accesses to the Receive FIFO.

// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspRxFCntl (
// Inputs
                   PCLK, 
                   PRESETn, 
                   RXIM,
                   RORIM,
                   RORIC,
                   RxFWrSync, 
                   RxFRdPtrInc,
                   TESTFIFO,
                   SSPTDRWr,

// Outputs
                   RNE, 
                   RFF,
                   RXRIS,
                   RORRIS,
                   RXMIS,
                   RORMIS,
            
                   RegFileWrEn, 
                   WrPtr, 
                   RdPtr
                  );

// Inputs
input        PCLK;        // APB bus clock
input        PRESETn;     // APB reset
input        RXIM;        // Rx Interrupt Mask
input        RORIM;       // Rx Over Run Mask
input        RORIC;       // Rx Over Run Interrupt Clear
input        RxFWrSync;   // RX FIFO write enable
input        RxFRdPtrInc; // RX FIFO read pointer incr.
input        TESTFIFO;    // Rx FIFO test mode enable
input        SSPTDRWr;    // Test Data Register write enable
// Outputs
output       RNE;         // RX FIFO not empty
output       RFF;         // RX FIFO full
output       RXRIS;       // RX fifo Raw Interrupt Status
output       RORRIS;      // RX fifo Over Run Raw Interrupt Status
output       RXMIS;       // RX fifo Masked Interrupt Status
output       RORMIS;      // RX fifo Over Run Masked Interrupt Status
output       RegFileWrEn; // Write enable to register file
output [2:0] WrPtr;       // Write pointer
output [2:0] RdPtr;       // Read pointer

// -----------------------------------------------------------------------------
//
//                          SspRxFCntl
//                          ==========
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//   The control logic for the Receive FIFO uses two pointers - a write pointer
// and a read pointer. Since the FIFO has 8 locations, the pointers are 3 bits
// wide. The write pointer points to the location to which the next write data
// will be written into. The read pointer points to the location whose contents
// are driven on the RxFRdData[15:0] Read data bus.
//   Both the pointers operate on PCLK so as to serve data consistently to the
// APB and to facilitate calculation of the FIFO fill level by finding the
// difference between the pointers.
//   This module also contains logic to generate the following status
//   and interrupts:
// RNE     Receive FIFO Not Empty
// RFF     Receive FIFO Full
// RXRIS   Receive fifo Raw Interrupt Status
// RXMIS   Receive fifo Masked Interrupt Status
// RORRIS  Receive fifo Over Run Raw Interrupt Status
// RORMIS  Receive fifo Over Run Masked Interrupt Status
//  
// The fifo can be set to be in TESTFIFO mode which allows data to
// be written directly into the Rx fifo.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------
reg [2:0] RdPtr; 
// Read pointer

reg [2:0] NextRdPtr; 
// D-input of RdPtr
 
reg [2:0] WrPtr;   
// Write pointer

reg [2:0] NextWrPtr; 
// D-input of WrPtr
 
reg       DelRxFWrSync;
// Delayed version of RxFWr - Receive FIFO Write enable signal. Used to 
// convert the level on the RxFWr signal to a one-PCLK wide pulse
 
reg       Wrap;    
// Store the condition when the write pointer has rolled over (from '111' to 
// '000') but the read pointer hasn't. The 'Wrap'signal is used in calculating
// the FIFOFillLevel

reg       NextWrap;
// D-input of Wrap

reg       RNE;
// Receive FIFO fill status indication (Receive FIFO not Empty)

reg       NextRNE;
// D-input of RNE

reg       RFF; 
// Receive FIFO Full indication. Also used to prevent writes into the FIFO 
// when the FIFO is already full.

reg       NextRFF;
// D-input of RFF

reg RXRIS;
// Receive FIFO raw interrupt status

reg NextRXRIS;
// D-input of RXRIS

reg RORRIS;
// Receive Over Run raw interrupt status.

reg NextRORRIS;
// D-input of RORRIS

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire [3:0] RxFFillLevel;
// Receive FIFO Fill level indication

wire       WrPtrIncValid;
// Valid Write pointer increment

wire       RdPtrIncValid;
// Valid Read Pointer Increment 

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Generate Masked interrupts from raw interrupt sources
// -----------------------------------------------------------------------------

  assign RORMIS = RORRIS & RORIM;
  assign RXMIS  = RXRIS  & RXIM;

// -----------------------------------------------------------------------------
// Allow writes to the Receive FIFO only if the FIFO is not already full
// -----------------------------------------------------------------------------
assign RegFileWrEn = WrPtrIncValid;

// -----------------------------------------------------------------------------
// Clocked process for flip-flops in this module.
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_Seq
  if (PRESETn == 1'b0) 
    begin  
      WrPtr        <= 3'b000; 
      RdPtr        <= 3'b000; 
      Wrap         <= 1'b0;
      RNE          <= 1'b0;
      RFF          <= 1'b0;
      RXRIS        <= 1'b0;
      RORRIS       <= 1'b0;
      DelRxFWrSync <= 1'b0;
    end
  else 
    begin
      WrPtr        <= NextWrPtr;
      RdPtr        <= NextRdPtr;
      Wrap         <= NextWrap;
      RNE          <= NextRNE;
      RFF          <= NextRFF;
      RXRIS        <= NextRXRIS;
      RORRIS       <= NextRORRIS;
      DelRxFWrSync <= RxFWrSync;
    end 
end // p_Seq

// -----------------------------------------------------------------------------
// Increment the write pointer when there is a write to the FIFO from the
// Receive logic. The increment should be avoided if the receive FIFO is already
// full. If the FIFO is already full and there is a simultaneous read and a
// write, the write should be allowed to complete and the write pointer should
// be incremented.
// -----------------------------------------------------------------------------
assign WrPtrIncValid = ((RxFWrSync ^ DelRxFWrSync) & 
                       (~(RFF) | (RFF & RxFRdPtrInc))) |
                       (~(RFF) & TESTFIFO & SSPTDRWr);

// -----------------------------------------------------------------------------
// Increment the write pointer when the WrPtrIncValid signal is asserted
// -----------------------------------------------------------------------------
always @(WrPtr or WrPtrIncValid)
begin : p_WrPtrComb 
  if (WrPtrIncValid == 1'b1)
    NextWrPtr = WrPtr + 3'b001;
  else
    NextWrPtr = WrPtr;
end // p_WrPtrComb

// -----------------------------------------------------------------------------
// Increment the read pointer when the FIFO is not already empty and when there
// is a read from the FIFO i.e. when the RxFRdPtrInc signal from the APB
// interface, is asserted.
// -----------------------------------------------------------------------------
assign RdPtrIncValid = RxFRdPtrInc & RNE;

// -----------------------------------------------------------------------------
// Increment the read pointer when the RdPtrIncValid signal is asserted
// -----------------------------------------------------------------------------
always @(RdPtr or RdPtrIncValid)
begin : p_RdPtrComb 
  if (RdPtrIncValid == 1'b1) 
    NextRdPtr = RdPtr + 3'b001;
  else
    NextRdPtr = RdPtr;
end // p_RdPtrComb

// -----------------------------------------------------------------------------
// The 'Wrap' bit is used to keep track of the condition when the write pointer
// has wrapped around from '111' to '000', but the read pointer has not wrapped.
// This bit is used to calculate the value of RxFFillLevel. Toggle the 'Wrap'
// bit whenever the read pointer wraps around or the write pointer wraps
// around. When both the pointers wrap around simultaneously, the 'Wrap' bit
// should not toggle.
// -----------------------------------------------------------------------------
always @(WrPtr or WrPtrIncValid or RdPtr or Wrap or RdPtrIncValid)
begin : p_WrapComb 
  if (((WrPtr == 3'b111) && (WrPtrIncValid == 1'b1)) ^ 
      ((RdPtr == 3'b111) && (RdPtrIncValid == 1'b1)))  
    NextWrap = ~(Wrap);
  else
    begin
      NextWrap = Wrap;
    end
end // p_WrapComb

// -----------------------------------------------------------------------------
// The RORRIS (Receive Overrun Interrupt) signal indicates that the Receive 
// logic has attempted a write into the Receive FIFO when the Receive FIFO is
// already Full. This interrupt is cleared when the RORIC signal from the
// SSpRegCore nodule is asserted or when the RORIM Interrupt mask is
// de-asserted.
// The RORRIS signal is set when the Receive FIFO is Full and there is 
// another write into the FIFO without a simultaneous read.
// -----------------------------------------------------------------------------
always @(RxFFillLevel or RxFWrSync or DelRxFWrSync or RxFRdPtrInc or
         RORIC or RORRIS)
begin : p_RORINT 
  NextRORRIS = RORRIS;
  if ((RxFFillLevel == 4'b1000) && ((RxFWrSync ^ DelRxFWrSync) == 1'b1) 
           && (RxFRdPtrInc == 1'b0)) 
        NextRORRIS = 1'b1;
   else
   if (RORIC == 1'b1) 
      NextRORRIS = 1'b0;
end // p_RORINT

// -----------------------------------------------------------------------------
// Use the RxFFillLevel (Receive FIFO Fill Level) signal to detect whether
// the receive FIFO is not empty. If the FIFO is empty and there is a valid
// write detected, then the FIFO is no longer empty. If the FIFO has one valid
// entry and there is a valid read detected, without a simultaneous write,
// the Receive FIFO is empty.
// -----------------------------------------------------------------------------
always @(RxFFillLevel or WrPtrIncValid or RdPtrIncValid or RNE)
begin : p_RNE 
  if ((RxFFillLevel == 4'b0000) && (WrPtrIncValid == 1'b1)) 
    NextRNE = 1'b1;
  else
    begin
      if ((RxFFillLevel == 4'b0001) && (RdPtrIncValid == 1'b1)
         && (WrPtrIncValid == 1'b0)) 
        NextRNE = 1'b0;
      else
        NextRNE = RNE;
    end 
end // p_RNE

// -----------------------------------------------------------------------------
// Assert the Receive FIFO service request if the FIFO contains four or more
// valid entries
// -----------------------------------------------------------------------------
always @(RxFFillLevel) 
begin : p_RFS 
  NextRXRIS = 1'b0;
  if (RxFFillLevel >= 4'b0100)
     NextRXRIS = 1'b1;
end // p_RFS

// -----------------------------------------------------------------------------
// RFF (Receive FIFO Full) generation. When the FIFO has seven entries and
// and there is another write without a simultaneous read, the FIFO is said to
// be Full. When the FIFO is already full and there is a read from the FIFO
// without a simultaneous write, the FIFO is said to be 'Not Full'
// -----------------------------------------------------------------------------
always @(RxFFillLevel or RFF or WrPtrIncValid or RdPtrIncValid)
begin : p_RFF 
  if ((RxFFillLevel == 4'b0111) && (WrPtrIncValid == 1'b1) && 
      (RdPtrIncValid == 1'b0)) 
    NextRFF = 1'b1;
  else
    begin
      if ((RxFFillLevel == 4'b1000) && (RdPtrIncValid == 1'b1) && 
          (WrPtrIncValid == 1'b0)) 
        NextRFF = 1'b0;
      else
        NextRFF = RFF;
    end 
end // p_RFF

// -----------------------------------------------------------------------------
// Subtract the write pointer from the read pointer to calculate the FIFO fill 
// level. Use the Wrap bit to take into account the case when the write pointer
// has wrapped without the read pointer having wrapped
// -----------------------------------------------------------------------------
  assign RxFFillLevel = { Wrap , WrPtr } - { 1'b0 , RdPtr };
endmodule

// --================================ End ====================================--








