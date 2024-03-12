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
//  File Name              : $RCSfile: SspRxFIFO.v.rca $S
//  File Revision          : 20354
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

//  Purpose          : This block instantiates the SspRxFCntl and the
//                     SspRxRegFile blocks
// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspRxFIFO (
// Inputs
                  PCLK, 
                  PRESETn,
                  RXIM,
                  RORIM,
                  RORIC,
                  RxFWrSync, 
                  RxFRdPtrInc, 
                  MS, 
                  SRxFWrData, 
                  MRxFWrData,
                  TESTFIFO,
                  PWDATAIn,
                  SSPTDRWr,
// Outputs
                  RNE, 
                  RFF,
                  RXRIS, 
                  RORRIS,
                  RXMIS,
                  RORMIS, 
                  RxFRdData
                 );
// Inputs
input         PCLK;          // APB bus clock
input         PRESETn;       // APB Reset
input         RXIM;          // Rx Interrupt Mask
input         RORIM;         // Rx Over Run Interrupt Mask
input         RORIC;         // Rx Over Run Interrupt Clear
input         RxFWrSync;     // RX FIFO write enable
input         RxFRdPtrInc;   // RX FIFO read pointer incr.
input         MS;            // Master / Slave Select bit
input [15:0]  SRxFWrData;    // Slave's  RX FIFO write data
input [15:0]  MRxFWrData;    // Master's RX FIFO write data
input         TESTFIFO;      // Rx FIFO test mode enable
input [15:0]  PWDATAIn;      // APB write data.
input         SSPTDRWr;      // Test Data Register write enable
// Outputs
output        RNE;           // RX FIFO not empty
output        RFF;           // RX FIFO full
output        RXRIS;         // RX Raw Interrupt Status
output        RORRIS;        // RX Over Run Raw Interrupt Status
output        RXMIS;         // RX Masked Interrupt Status
output        RORMIS;        // RX Over Run Masked Interrupt Status
output [15:0] RxFRdData;     // RX FIFO read data

// -----------------------------------------------------------------------------
// 
//                            SspRxFIFO
//                            =========
// 
// -----------------------------------------------------------------------------
// 
// Overview
// ========
// 
//  The SspRxFIFO block instantiates the SspRxRegFile block and the SspRxFCntl
// block. The SspRxRegFile block contains the Receive FIFO register file. Read  
// data from the master(MRxFWrData) or from the slave(SRxFWrData) depending 
// upon MS bit, is written into the location in the Receive FIFO pointed to by 
// the current value of the WrPtr[2:0] (Write pointer) signal on the rising 
// edge of PCLK on which the RegFileWrEn signal is sampled high. Data in the 
// FIFO location pointed to by the RdPtr[2:0] signal is always driven on the 
// RxFRdData[15:0] output. The SspRxFCntl block controls the Read pointer and 
// the Write pointer. Thus the Receive FIFO is implemented as a circular buffer.
// The SspRxFCntl block also generates FIFO status signals RFF and RNE besides 
// the interrupts SSPRFSINTR (Receive FIFO service request) and SSPRORINTR 
// (Receive Overrun).
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

wire       RegFileWrEn; 
wire [2:0] WrPtr; 
wire [2:0] RdPtr; 

// -----------------------------------------------------------------------------
// The SspRxFCntl block contains the control logic for the Receive FIFO.
// -----------------------------------------------------------------------------
 SspRxFCntl uSspRxFCntl               (
                        .PCLK         (PCLK),
                        .PRESETn      (PRESETn),
                        .RXIM         (RXIM),
                        .RORIM        (RORIM),
                        .RORIC        (RORIC),
                        .RxFWrSync    (RxFWrSync),
                        .RxFRdPtrInc  (RxFRdPtrInc),
                        .TESTFIFO     (TESTFIFO),
                        .SSPTDRWr     (SSPTDRWr),
                        .RNE          (RNE),
                        .RFF          (RFF),
                        .RXRIS        (RXRIS),
                        .RORRIS       (RORRIS),
                        .RXMIS        (RXMIS),
                        .RORMIS       (RORMIS),
                        .RegFileWrEn  (RegFileWrEn),
                        .WrPtr        (WrPtr),
                        .RdPtr        (RdPtr)
                       );


// -----------------------------------------------------------------------------
// The SspRxRegFile block is a 16-bit wide 8-deep Register File for the Receive
// FIFO.
// -----------------------------------------------------------------------------
 SspRxRegFile uSspRxRegFile           (
                        .PCLK         (PCLK),
                        .PRESETn      (PRESETn),
                        .MS           (MS),
                        .SRxFWrData   (SRxFWrData),
                        .MRxFWrData   (MRxFWrData),
                        .RegFileWrEn  (RegFileWrEn),
                        .TESTFIFO     (TESTFIFO),
                        .WrPtr        (WrPtr),
                        .RdPtr        (RdPtr),
                        .PWDATAIn     (PWDATAIn),
                        .RxFRdData    (RxFRdData)
                       );
endmodule

// --============================ End ========================================--
