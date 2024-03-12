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
//  File Name              : $RCSfile: SspRxRegFile.v.rca $S
//  File Revision          : 20355
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Purpose      : Receive FIFO Register File
// --=========================================================================--
  
`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspRxRegFile (
// Inputs
                     PCLK, 
                     PRESETn, 
                     MS, 
                     RegFileWrEn, 
                     TESTFIFO,
                     WrPtr, 
                     RdPtr, 
                     SRxFWrData, 
                     MRxFWrData,
                     PWDATAIn, 
// Output
                     RxFRdData
                    );

// Inputs
input         PCLK;            // APB bus clock
input         PRESETn;         // Muxed Reset (from BPRESETn)
input         MS;              // Master / Slave Select bit
input         RegFileWrEn;     // Write enable
input         TESTFIFO;        // FIFO Test mode control
input   [2:0] WrPtr;           // Write pointer
input   [2:0] RdPtr;           // Read pointer
input  [15:0] MRxFWrData;      // Master's RX FIFO write data
input  [15:0] SRxFWrData;      // Slave's  RX FIFO write data
input  [15:0] PWDATAIn;        // Rx Fifo Test Data

//Output
output [15:0] RxFRdData;       // Read Data

// -----------------------------------------------------------------------------
//
//                               SspRxRegFile
//                               ============
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// This module contains the Register file for the Receive FIFO. When the 
// Write enable signal RegFileWrEn is asserted, data on the write data bus 
// RxFWrData is written into the location pointed to by the current value of the
// Write pointer WrPtr. On the read interface, the contents of the location
// pointed to by the current value of the read pointer RdPtr, is driven onto
// the read databus, RxFRdData.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------
reg [15:0]  RxReg0;
// Receive FIFO register 0 

reg [15:0]  NextRxReg0;
// D-input of RxReg0 

reg [15:0]  RxReg1;
// Receive FIFO register 1 

reg [15:0]  NextRxReg1;
// D-input of RxReg1 

reg [15:0]  RxReg2;
// Receive FIFO register 2 

reg [15:0]  NextRxReg2;
// D-input of RxReg2 

reg [15:0]  RxReg3;
// Receive FIFO register 3 

reg [15:0]  NextRxReg3;
// D-input of RxReg3 

reg [15:0]  RxReg4;
// Receive FIFO register 4 

reg [15:0]  NextRxReg4;
// D-input of RxReg4 

reg [15:0]  RxReg5;
// Receive FIFO register 5 

reg [15:0]  NextRxReg5;
// D-input of RxReg5 

reg [15:0]  RxReg6;
// Receive FIFO register 6 

reg [15:0]  NextRxReg6;
// D-input of RxReg6 

reg [15:0]  RxReg7;
// Receive FIFO register 7 

reg [15:0]  NextRxReg7;
// D-input of RxReg7 

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire [15:0] RxFWrData;
// Write data from the SSP core logic


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------
// In test mode, external PWDATA data can be written to the RX FIFO.
// In normal mode, data is written to RxFIFO from the data buses 
// of Master/Slave depending upon the MS bit.
// -----------------------------------------------------------------------------
assign RxFWrData = (TESTFIFO == 1'b1) ? PWDATAIn   :
                   (MS == 1'b1)       ? SRxFWrData : 
                    MRxFWrData;

// -----------------------------------------------------------------------------
// Sequential logic for Rx FIFO registers.  
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_RxRegSeq
  if (PRESETn == 1'b0)
    begin
      RxReg0 <= 16'h0000;
      RxReg1 <= 16'h0000;
      RxReg2 <= 16'h0000;
      RxReg3 <= 16'h0000;
      RxReg4 <= 16'h0000;
      RxReg5 <= 16'h0000;
      RxReg6 <= 16'h0000;
      RxReg7 <= 16'h0000;
    end
  else
    begin
      RxReg0 <= NextRxReg0;
      RxReg1 <= NextRxReg1;
      RxReg2 <= NextRxReg2;
      RxReg3 <= NextRxReg3;
      RxReg4 <= NextRxReg4;
      RxReg5 <= NextRxReg5;
      RxReg6 <= NextRxReg6;
      RxReg7 <= NextRxReg7;
    end
end // p_RxRegSeq;

// -----------------------------------------------------------------------------
// Write logic. When the Write enable signal, RegFileWr, is asserted, data on
// the RxFWrData bus is written into the location pointed to by the 
// current value of the Write pointer, WrPtr[2:0].
// -----------------------------------------------------------------------------
always @(RxReg0 or RxReg1 or RxReg2 or RxReg3 or RxReg4 or RxReg5 or RxReg6 or 
         RxReg7 or  WrPtr or RegFileWrEn or RxFWrData)
begin : p_WrComb
  NextRxReg0 = RxReg0;
  NextRxReg1 = RxReg1;
  NextRxReg2 = RxReg2;
  NextRxReg3 = RxReg3;
  NextRxReg4 = RxReg4;
  NextRxReg5 = RxReg5;
  NextRxReg6 = RxReg6;
  NextRxReg7 = RxReg7;

  if (RegFileWrEn == 1'b1)
    case (WrPtr)
      3'b000 : NextRxReg0 = RxFWrData;
      3'b001 : NextRxReg1 = RxFWrData;
      3'b010 : NextRxReg2 = RxFWrData;
      3'b011 : NextRxReg3 = RxFWrData;
      3'b100 : NextRxReg4 = RxFWrData;
      3'b101 : NextRxReg5 = RxFWrData;
      3'b110 : NextRxReg6 = RxFWrData;
      3'b111 : NextRxReg7 = RxFWrData;
      default : ;
    endcase
end // p_WrComb;

// -----------------------------------------------------------------------------
// Read Mux. The contents of the location pointed to by the current value of 
// the read pointer, RdPtr, is driven onto the read databus, RxFRdData.
// -----------------------------------------------------------------------------
assign RxFRdData = (RdPtr == 3'b000) ? RxReg0 : (
                   (RdPtr == 3'b001) ? RxReg1 : (
                   (RdPtr == 3'b010) ? RxReg2 : (
                   (RdPtr == 3'b011) ? RxReg3 : (
                   (RdPtr == 3'b100) ? RxReg4 : (
                   (RdPtr == 3'b101) ? RxReg5 : (
                   (RdPtr == 3'b110) ? RxReg6 : (
                   (RdPtr == 3'b111) ? RxReg7 : (
                   9'b000000000))))))));
                   

endmodule

// --================================ End ====================================--




