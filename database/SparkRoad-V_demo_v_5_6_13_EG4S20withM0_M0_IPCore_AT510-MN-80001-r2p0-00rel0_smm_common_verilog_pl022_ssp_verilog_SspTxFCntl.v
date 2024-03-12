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
//  File Name              : $RCSfile: SspTxFCntl.v.rca $S
//  File Revision          : 20361
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
//  ----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

// Purpose      : This module controls accesses to the Transmit FIFO 

// --=========================================================================--

`timescale 1ns/1ps

//  ----------------------------------------------------------------------------


module SspTxFCntl (
// Inputs
                   PCLK, 
                   PRESETn, 
                   TXIM, 
                   SSPDRWr, 
                   TxFRdPtrIncSync, 
                   TxRxBSYSync,
                   TestTXFInc, 
// Outputs
                   TNF, 
                   TFE,
                   BSY,
                   TXRIS,
                   TXMIS,
                   FIFOLTE7Full, 
                   RegFileWrEn, 
                   TxDataAvlbl, 
                   WrPtr, 
                   RdPtr
                  );

// Inputs
input        PCLK;            // APB bus clock
input        PRESETn;         // Muxed reset (from BPRESETn)
input        TXIM;            // Intr enable for SSPTFSINTR
input        SSPDRWr;         // TX FIFO Write enable
input        TxFRdPtrIncSync; // TX FIFO Read Ptr Inc
input        TxRxBSYSync;     // Tx/Rx controller busy
input        TestTXFInc;      // Test Mode read pointer inc for Tx fifo
// Outputs
output       TNF;             // TX FIFO not full
output       TFE;             // TX FIFO empty
output       BSY;             // SSP Busy
output       TXRIS;           // TX fifo Raw Interrupt Status
output       TXMIS;           // TX fifo Masked Interrupt Status
output       FIFOLTE7Full;    // TX FIFO has one or more spaces
output       RegFileWrEn;     // Register file write enable
output       TxDataAvlbl;     // TX Data available
output [2:0] WrPtr;           // Write pointer
output [2:0] RdPtr;           // Read pointer

// -----------------------------------------------------------------------------
//
//                              SspTxFCntl
//                              ==========
//
// -----------------------------------------------------------------------------
// Overview
// ========
//
//   The control logic for the Transmit FIFO uses two pointers - a write
// pointer and a read pointer. The pointers are 3 bits wide. The write pointer
// points to the location to which the next write data will be written into.
// The read pointer points to the location whose contents are driven on the
// TxFRdData[15:0] Read data bus.
//   Both the pointers operate on PCLK so as not to miss any writes from the
// APB and to facilitate calculation of the FIFO fill level by finding the
// difference between the pointers.
//   This module also contains logic to generate the TNF (Transmit FIFO Not
// Full) and TFE (Transmit FIFO Empty) status signals and the SSPTXINTR
// (Transmit FIFO Service Request) interrupt signal.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declaration
// -----------------------------------------------------------------------------
reg  [2:0] RdPtr;
// Read pointer

reg  [2:0] NextRdPtr; 
// D-input of RdPtr

reg  [2:0] WrPtr; 
// Write pointer

reg  [2:0] NextWrPtr;
// D-input of WrPtr

reg        DelRdPtrInc;
// Delayed version of TxFRdPtrIncSync - FIFO read pointer increment signal
// Used to convert the level on the TxFRdPtrIncSync signal to a 
// one-PCLK wide pulse
 
reg        Wrap;
// Store the condition when the write pointer has rolled over (from '111' to 
// '000') but the read pointer hasn't. The 'Wrap'signal is used in calculating
// the FIFOFillLevel

reg        NextWrap;
// D-input of Wrap

reg TXRIS;
// Transmit FIFO Raw Interrupt Status 

reg NextTXRIS;
// D-input of iTXRIS

reg        TNF;
// FIFO fill status indication (Transmit FIFO not full)

reg        NextTNF;
// D-input of TNF

reg        TxDataAvlbl;
// FIFO Fill status indication (Transmit Data Available in FIFO)

reg        NextDatAvlbl;
// D-input of TxDataAvlbl

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire [3:0] TxFFillLevel;
// FIFO Fill level indication

wire       WrPtrIncValid;
// Valid Write pointer increment

wire       RdPtrIncValid;
// Valid Read Pointer Increment 


wire TXMIS;
// Transmit FIFO service request 

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// --------------------------------------------------------------------------
// Generate Masked interrupts from Raw interrupt source
// --------------------------------------------------------------------------

assign TXMIS = (TXRIS & TXIM);

// -----------------------------------------------------------------------------
// Generate the TFE (Transmit FIFO Empty) signal by inverting the TxDataAvlbl
// signal. When the TxDataAvlbl signal is asserted, it implies that the transmit
// FIFO has atleast one byte of data and hence the FIFO is not empty (TFE to be
// de-asserted). When the TxDataAvlbl signal is not asserted, it implies that 
// there is no data in the Transmit FIFO and hence the FIFO is empty (TFE to be 
// asserted)
// -----------------------------------------------------------------------------
assign TFE = ~(TxDataAvlbl);

// -----------------------------------------------------------------------------
// Allow writes to the Transmit FIFO only if the FIFO is not already full
// -----------------------------------------------------------------------------
assign RegFileWrEn = WrPtrIncValid;

// -----------------------------------------------------------------------------
// The SSP is BUSY when there is valid data available in the Transmit FIFO or
// when the Transmitter/Receiver is busy.
// -----------------------------------------------------------------------------
assign BSY = TxDataAvlbl | TxRxBSYSync;

// -----------------------------------------------------------------------------
// Clocked process for flip-flops in this module
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_Seq
  if (PRESETn == 1'b0) 
  begin 
    WrPtr       <= 3'b000; 
    RdPtr       <= 3'b000; 
    Wrap        <= 1'b0;
    TNF         <= 1'b1;
    TXRIS       <= 1'b1;
    TxDataAvlbl <= 1'b0;
    DelRdPtrInc <= 1'b0;
  end
  else
  begin
    WrPtr       <= NextWrPtr;
    RdPtr       <= NextRdPtr;
    Wrap        <= NextWrap;
    TNF         <= NextTNF;
    TXRIS       <= NextTXRIS;
    TxDataAvlbl <= NextDatAvlbl;
    DelRdPtrInc <= TxFRdPtrIncSync;
  end
end // p_Seq

// -----------------------------------------------------------------------------
// Increment the write pointer when there is a write to the FIFO from the APB.
// The increment should be avoided if the transmit FIFO is already full. If
// when the FIFO is full, there is a write and a simultaneous read, the write
// should be allowed.
// -----------------------------------------------------------------------------
assign WrPtrIncValid = (SSPDRWr & (TNF | (~(TNF) &
                       (TxFRdPtrIncSync ^ DelRdPtrInc)))); 

// -----------------------------------------------------------------------------
// Increment the Write pointer when the WrPtrIncValid signal is asserted.
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
// is a read from the FIFO i.e. a toggling is detected on the TxFRdPtrIncSync
// signal.
// -----------------------------------------------------------------------------
assign RdPtrIncValid = (TxDataAvlbl & ((TxFRdPtrIncSync ^ DelRdPtrInc)
                        | TestTXFInc)); 

// -----------------------------------------------------------------------------
// Increment the read pointer when the RdPtrIncValid signal is asserted.
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
// This bit is used to calculate the value of TxFFillLevel. Toggle the 'Wrap'
// bit whenever the read pointer wraps around or the write pointer wraps
// around. When both the pointers wrap around simultaneously, the 'Wrap' bit
// should not toggle.
// -----------------------------------------------------------------------------
always @(WrPtr or RdPtr or WrPtrIncValid or RdPtrIncValid or Wrap)
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
// The iTNF (Transmit FIFO not Full) signal indicates the status of the Transmit
// FIFO. When the FIFO is one less than full and there is another write to the
// FIFO without a simultaneous read, the iTNF signal is cleared. 
// When the FIFO is already full and there is a read from the FIFO, without a 
// simultaneous write, the iTNF signal is set.
// -----------------------------------------------------------------------------
always @(TxFFillLevel or TNF or WrPtrIncValid or RdPtrIncValid)
begin : p_TNF 
  if ((TxFFillLevel == 4'b0111) && (WrPtrIncValid == 1'b1)
      && (RdPtrIncValid == 1'b0)) 
    NextTNF = 1'b0;
  else
    begin
      if ((TxFFillLevel == 4'b1000) && (RdPtrIncValid == 1'b1) &&
          (WrPtrIncValid == 1'b0)) 
        NextTNF = 1'b1;
       else
        NextTNF = TNF;
    end
end // p_TNF

// -----------------------------------------------------------------------------
// Use the TxFFillLevel (Transmit FIFO Fill Level) signal to indicate that
// data is avilable for transmission. The result of the comparison is clocked
// out onto the TxDataAvlbl signal.
// -----------------------------------------------------------------------------
always @(TxFFillLevel or WrPtrIncValid or RdPtrIncValid or TxDataAvlbl)
begin : p_DataAvlbl 
  if ((TxFFillLevel == 4'b0000) && (WrPtrIncValid == 1'b1)) 
    NextDatAvlbl = 1'b1;
  else
    begin
      if ((TxFFillLevel == 4'b0001)  && (RdPtrIncValid == 1'b1)
         && (WrPtrIncValid == 1'b0)) 
        NextDatAvlbl = 1'b0;
      else
        NextDatAvlbl = TxDataAvlbl;
    end 
end // p_DataAvlbl

// -----------------------------------------------------------------------------
// Assert the Transmit FIFO service request if the FIFO contains four or fewer
// valid entries
// -----------------------------------------------------------------------------
always @(TxFFillLevel)
begin : p_TFS 
      if (TxFFillLevel <= 4'b0100) 
        NextTXRIS = 1'b1;
      else
        NextTXRIS = 1'b0;
end // p_TFS

// ------------------------------------------------------------------
// Use the TXFFillLevel signal to find whether the Transmit FIFO has 
// at least one empty location. 
// ------------------------------------------------------------------

assign FIFOLTE7Full = (TxFFillLevel <= 4'b0111);

// -----------------------------------------------------------------------------
// Subtract the write pointer from the read pointer to calculate the FIFO fill 
// level. Use the Wrap bit to take into account the case when the write pointer
// has wrapped without the read pointer having wrapped
// -----------------------------------------------------------------------------

assign TxFFillLevel = {Wrap , WrPtr} - {1'b0 , RdPtr};

endmodule

// --============================ End ========================================--










