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
//  File Name              : $RCSfile: SspTxRegFile.v.rca $S
//  File Revision          : 20364
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

// Purpose      : Transmit FIFO Register File 

// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspTxRegFile (
// Inputs
                     PCLK, 
                     PRESETn, 
                     PWDATAIn, 
                     RegFileWrEn, 
                     WrPtr, 
                     RdPtr, 
// Output
                     TxFRdData
                    );

// Inputs
input         PCLK;               // APB bus clock
input         PRESETn;            // APB bus reset
input  [15:0] PWDATAIn;           // Int PWDATA
input         RegFileWrEn;        // Write enable for Reg file 
input   [2:0] WrPtr;              // Write pointer
input   [2:0] RdPtr;              // Read pointer
// Output
output [15:0] TxFRdData;          // Read data

// -----------------------------------------------------------------------------
//
//                               SspTxRegFile
//                               ============
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// This module contains the Register file for the Transmit FIFO. When the 
// Write enable signal RegFileWrEn is asserted, data on the write data bus 
// PWDATAIn is written into the location pointed to by the current value of the
// Write pointer WrPtr. On the read interface, the contents of the location
// pointed to by the current value of the read pointer RdPtr, is driven onto
// the read databus, TxFRdData.
// -----------------------------------------------------------------------------


//------------------------------------------------------------------------------
// Register declarations
//------------------------------------------------------------------------------
reg [15:0]  TxReg0;
// Transmit FIFO register 0 

reg [15:0]  NextTxReg0;
// D-input of TxReg0 

reg [15:0]  TxReg1;
// Transmit FIFO register 1 

reg [15:0]  NextTxReg1;
// D-input of TxReg1 

reg [15:0]  TxReg2;
// Transmit FIFO register 2 

reg [15:0]  NextTxReg2;
// D-input of TxReg2 

reg [15:0]  TxReg3;
// Transmit FIFO register 3 

reg [15:0]  NextTxReg3;
// D-input of TxReg3 

reg [15:0]  TxReg4;
// Transmit FIFO register 4 

reg [15:0]  NextTxReg4;
// D-input of TxReg4 

reg [15:0]  TxReg5;
// Transmit FIFO register 5 

reg [15:0]  NextTxReg5;
// D-input of TxReg5 

reg [15:0]  TxReg6;
// Transmit FIFO register 6 

reg [15:0]  NextTxReg6;
// D-input of TxReg6 

reg [15:0]  TxReg7;
// Transmit FIFO register 7 

reg [15:0]  NextTxReg7;
// D-input of TxReg7 

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Sequential logic for Tx FIFO registers.  
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_TxRegSeq
  if (PRESETn == 1'b0)
    begin
      TxReg0 <= 16'h0000;
      TxReg1 <= 16'h0000;
      TxReg2 <= 16'h0000;
      TxReg3 <= 16'h0000;
      TxReg4 <= 16'h0000;
      TxReg5 <= 16'h0000;
      TxReg6 <= 16'h0000;
      TxReg7 <= 16'h0000;
    end
  else
    begin
      TxReg0 <= NextTxReg0;
      TxReg1 <= NextTxReg1;
      TxReg2 <= NextTxReg2;
      TxReg3 <= NextTxReg3;
      TxReg4 <= NextTxReg4;
      TxReg5 <= NextTxReg5;
      TxReg6 <= NextTxReg6;
      TxReg7 <= NextTxReg7;
    end
end // p_TxRegSeq;

// -----------------------------------------------------------------------------
// Write logic. When the Write enable signal, RegFileWrEn, is asserted, data on
// the write data bus PWDATAIn is written into the location pointed to by the
// current value of the Write pointer, WrPtr[2:0].
// -----------------------------------------------------------------------------
always @(TxReg0 or TxReg1 or TxReg2 or TxReg3 or TxReg4 or TxReg5 or TxReg6 or 
         TxReg7 or  WrPtr or RegFileWrEn or PWDATAIn)
begin : p_WrComb
  NextTxReg0 = TxReg0;
  NextTxReg1 = TxReg1;
  NextTxReg2 = TxReg2;
  NextTxReg3 = TxReg3;
  NextTxReg4 = TxReg4;
  NextTxReg5 = TxReg5;
  NextTxReg6 = TxReg6;
  NextTxReg7 = TxReg7;
  if (RegFileWrEn == 1'b1)
    case (WrPtr)
      3'b000 : NextTxReg0 = PWDATAIn;
      3'b001 : NextTxReg1 = PWDATAIn;
      3'b010 : NextTxReg2 = PWDATAIn;
      3'b011 : NextTxReg3 = PWDATAIn;
      3'b100 : NextTxReg4 = PWDATAIn;
      3'b101 : NextTxReg5 = PWDATAIn;
      3'b110 : NextTxReg6 = PWDATAIn;
      3'b111 : NextTxReg7 = PWDATAIn;
      default : ;
    endcase
end // p_WrComb;

// -----------------------------------------------------------------------------
// Read Mux. The contents of the location pointed to by the current value of
// the read pointer RdPtr, is driven onto the read databus, TxFRdData.
// -----------------------------------------------------------------------------
assign TxFRdData = (RdPtr == 3'b000) ? TxReg0 : (
                   (RdPtr == 3'b001) ? TxReg1 : (
                   (RdPtr == 3'b010) ? TxReg2 : (
                   (RdPtr == 3'b011) ? TxReg3 : (
                   (RdPtr == 3'b100) ? TxReg4 : (
                   (RdPtr == 3'b101) ? TxReg5 : (
                   (RdPtr == 3'b110) ? TxReg6 : (
                   (RdPtr == 3'b111) ? TxReg7 : (
                   16'h0000))))))));

endmodule

// --================================ End ====================================--












