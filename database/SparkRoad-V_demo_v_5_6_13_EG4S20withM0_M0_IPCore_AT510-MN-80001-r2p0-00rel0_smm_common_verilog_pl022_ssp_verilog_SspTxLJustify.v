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
//  File Name              : $RCSfile: SspTxLJustify.v.rca $S
//  File Revision          : 20363
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

// Purpose      : This modules left-justifies transmit data.

// --=========================================================================--

`timescale 1ns/1ps

//  ----------------------------------------------------------------------------

module SspTxLJustify (
// Inputs
                      PCLK, 
                      PRESETn, 
                      FRFPCLK, 
                      DSSPCLK, 
                      TxFRdData, 
                      MS,
// Output
                      TxFRdDataIn
                     );
// Inputs
input         PCLK;              // APB bus clock
input         PRESETn;           // APB bus reset
input   [1:0] FRFPCLK;           // Frame format
input   [3:0] DSSPCLK;           // Data size
input  [15:0] TxFRdData;         // From FIFO
input         MS;                // Master or Slave Select bit
// Output
output [15:0] TxFRdDataIn;       // To TxRx block

// -----------------------------------------------------------------------------
//
//                     SspTxLJustify
//                     =============
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
//  Transmit data written into the transmit FIFO is right justified. In order
// to facilitate shifting out of data by the transmit state machine, the
// transmit data is left-justified and driven. The unused bottom bits in the
// 16-bit data output, is filled with zeros.
//
//  For example, a 4-bit transmit data is stored in the transmit FIFO in the
// form :
//
//        0  0  0  0  0  0  0  0  0  0  0  0 d3 d2 d1 d0
//
// In the SspTxLJustify module, this data is left-justfied and driven out in the
// form :
//
//        d3 d2 d1 d0 0  0  0  0  0  0  0  0  0  0  0  0
//
//   The case of National Microwire Frame format is a special case, in that the
// transmit data is always 8-bit wide and is independent of the DSS[3:0] (Data
// Size Select) field in the SSCR0 control register.
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declaration
// -----------------------------------------------------------------------------
reg [15:0] TxFRdDataIn;
// Left-justified data output

reg [15:0] NextTxFRdDataIn;
// D-input of TxFRdDataIn

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Generate TxFRdDataIn by filling the top bits with significant bits from
// TxFRdData and by zero-filling the remaining lower order bits.
// If the Frame format is National Microwire and is in Master mode, then 
// ignore DSS and use a fixed transmit data width of 8 bits.
// -----------------------------------------------------------------------------
always @(TxFRdData or FRFPCLK or DSSPCLK or TxFRdDataIn or MS)
begin : p_LJustComb
  NextTxFRdDataIn = TxFRdDataIn;
  if (FRFPCLK == 2'b10 & MS == 1'b0)
    NextTxFRdDataIn = { TxFRdData[7:0], 8'h00 };
  else
    begin
      NextTxFRdDataIn = 16'h0000;
      case (DSSPCLK)
        4'b0011 :
          NextTxFRdDataIn = { TxFRdData[3:0]  , 12'b000000000000 };
        4'b0100 :
          NextTxFRdDataIn = { TxFRdData[4:0]  , 11'b00000000000 };
        4'b0101 :
          NextTxFRdDataIn = { TxFRdData[5:0]  , 10'b0000000000 };
        4'b0110 :
          NextTxFRdDataIn = { TxFRdData[6:0]  ,  9'b000000000 };
        4'b0111 :
          NextTxFRdDataIn = { TxFRdData[7:0]  ,  8'b00000000 };
        4'b1000 :
          NextTxFRdDataIn = { TxFRdData[8:0]  ,  7'b0000000 };
        4'b1001 :
          NextTxFRdDataIn = { TxFRdData[9:0]  ,  6'b000000 };
        4'b1010 :
          NextTxFRdDataIn = { TxFRdData[10:0] ,  5'b00000 };
        4'b1011 :
          NextTxFRdDataIn = { TxFRdData[11:0] ,  4'b0000 };
        4'b1100 :
          NextTxFRdDataIn = { TxFRdData[12:0] ,  3'b000 };
        4'b1101 :
          NextTxFRdDataIn = { TxFRdData[13:0] ,  2'b00 };
        4'b1110 :
          NextTxFRdDataIn = { TxFRdData[14:0] ,  1'b0 };
        4'b1111 :
          NextTxFRdDataIn =  TxFRdData[15:0];
        default :
          NextTxFRdDataIn = 16'h0000;
      endcase
    end
end // p_LJustComb

// -----------------------------------------------------------------------------
// Sequential process for TxFRdDataIn generation
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_LJustSeq
  if (PRESETn == 1'b0)
    TxFRdDataIn <= 16'h0000;
  else
    TxFRdDataIn <= NextTxFRdDataIn;
end // p_LJustSeq

endmodule
 
// --================================= End ===================================--






