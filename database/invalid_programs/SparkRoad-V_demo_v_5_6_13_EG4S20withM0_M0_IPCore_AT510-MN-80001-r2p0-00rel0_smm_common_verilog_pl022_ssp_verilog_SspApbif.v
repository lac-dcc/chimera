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
//  File Name              : $RCSfile: SspApbif.v.rca $
//  File Revision          : 20345
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------

// Purpose      : APB Interface to generate decodes for write and read
//                accesses to SSP internal registers.

// --=========================================================================--
  
`timescale 1ns/1ps

//------------------------------------------------------------------------------


module SspApbif (
// Inputs
                 PCLK, 

                 PRESETn, 

                 PSEL, 
                 PWRITE, 
                 PENABLE, 
                 PADDR, 

                 PWDATA,

                 SSPRXD,
                 SSPFSSIN,
                 SSPCLKIN,

                 TNF, 
                 RNE, 
                 BSY, 
                 RFF, 
                 TFE, 

                 IntTXDMACLR,
                 IntRXDMACLR,
                 IntSSPTXDMASREQ,
                 IntSSPTXDMABREQ,
                 IntSSPRXDMASREQ,
                 IntSSPRXDMABREQ,
                 IntSSPINTR, 
                 IntSSPTXINTR, 
                 IntSSPRXINTR, 
                 IntSSPRTINTR, 
                 IntSSPRORINTR,

                 SSPITOP,

                 SSPCR0,

                 SSPCR1, 

                 SSPCPSR,

                 SSPIMSC,

                 TXRIS,
                 RXRIS,
                 RTRISSync,
                 RORRIS,

                 TXMIS,
                 RXMIS,
                 RTMISSync,
                 RORMIS,

                 SSPDMACR,

                 RxFRdData, 

                 TxFRdData,

                 TESTFIFO,
                 ITEN,
                 Revision,
// Outputs
                 PRDATA, 
                 PWDATAIn,
                 SSPCR0Wr, 
                 SSPCR1Wr, 
                 SSPDRWr, 
                 SSPCPSRWr,
                 SSPIMSCWr,
                 SSPICRWr,
                 SSPDMACRWr, 
                 SSPTCRWr,
                 SSPITIPWr,
                 SSPITOPWr,
                 SSPTDRWr,
                 SSPTDRRd,
                 RxFRdPtrInc
                );

// Include Defs file
`include "SspDefs.v"

// Inputs
input         PCLK;             // APB Bus Clock
input         PRESETn;          // AMBA Bus Reset
input         PSEL;             // APB Peripheral select
input         PWRITE;           // APB Peripheral Write
input         PENABLE;          // APB Peripheral enable
input  [11:2] PADDR;            // APB Peripheral address
input  [15:0] PWDATA;           // Write databus
input         SSPRXD;           // Receive Data input
input         SSPFSSIN;         // Frame input
input         SSPCLKIN;         // Clock input
input         TNF;              // Tx FIFO Not Full
input         RNE;              // Rx FIFO Not Empty
input         BSY;              // SSP Busy
input         RFF;              // Rx FIFO Full
input         TFE;              // Tx FIFO Empty
input         IntTXDMACLR;      // SSPTXDMACLR  test mux output ITIP(4)
input         IntRXDMACLR;      // SSPRXDMACLR  test mux output ITIP(3)
input         IntSSPTXDMASREQ;  // SSPTXDMASREQ test mux output ITOP(13)
input         IntSSPTXDMABREQ;  // SSPTXDMABREQ test mux output ITOP(12)
input         IntSSPRXDMASREQ;  // SSPRXDMASREQ test mux output ITOP(11)
input         IntSSPRXDMABREQ;  // SSPRXDMABREQ test mux output ITOP(10)
input         IntSSPINTR;       // Combined Interrupt
input         IntSSPTXINTR;     // Tx FIFO service request
input         IntSSPRXINTR;     // Rx FIFO service request
input         IntSSPRTINTR;     // Rx FIFO Timeout interrupt
input         IntSSPRORINTR;    // Rx FIFO Overrun interrupt
input   [4:0] SSPITOP;          // SSPITOP Register
input  [15:0] SSPCR0;           // 1st buffer
input   [6:0] SSPCR1;           // SSPCR1
input   [7:1] SSPCPSR;          // 1st buffer
input   [3:0] SSPIMSC;          // SSPIMSC
input         TXRIS;            // Tx Raw Interrupt Status
input         RXRIS;            // Rx Raw Interrupt Status
input         RTRISSync;        // Rx Timeout Raw Interrup Status
input         RORRIS;           // Rx Over Run Raw Interrupt Status
input         TXMIS;            // Tx Masked Interrupt Status
input         RXMIS;            // Rx Masked Interrupt Status
input         RTMISSync;        // Rx Timeout Masked Interrup Status
input         RORMIS;           // Rx Over Run Raw Interrupt Status
input   [1:0] SSPDMACR;         // DMA Control Register
input  [15:0] RxFRdData;        // Rx Data
input  [15:0] TxFRdData;        // Rx Data
input         TESTFIFO;         // FIFO test enable
input         ITEN;             // Integration Test Enable
input   [7:4] Revision;         // Peripheral revision code

// Output
output [15:0] PRDATA;           // Read Databus
output [15:0] PWDATAIn;         // Int PWDATA
output        SSPCR0Wr;         // Write enable for SSPCR0
output        SSPCR1Wr;         // Write enable for SSPCR1
output        SSPDRWr;          // Tx FIFO Write enable
output        SSPCPSRWr;        // Write enable for SSPCPSR
output        SSPIMSCWr;        // Write enable for SSPIMSC
output        SSPICRWr;         // Write enable for SSPICR
output        SSPDMACRWr;       // Write enable for SSPDMACR
output        SSPTCRWr;         // Write enable for SSPTCR
output        SSPITIPWr;        // Write enable for SSPITIP
output        SSPITOPWr;        // Write enable for SSPITOP
output        SSPTDRWr;         // Write enable for SSPTDR
output        SSPTDRRd;         // Read  enable for SSPTDR
output        RxFRdPtrInc;      // Rx FIFO Read

// -----------------------------------------------------------------------------
//
//                               SspApbif
//                               ========
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
// This module decodes APB accesses and generates the write strobes to the
// appropriate registers. This module also contains the output data multiplexer
// and the output register that form the read interface. The internal databus,
// for the SSP, PWDATAIn[15:0], is also generated in this module, by
// gating the input data bus, PWDATA[15:0] with PSEL and PWRITE.
//
// -----------------------------------------------------------------------------
//                    Ssp Register Map
// -----------------------------------------------------------------------------
// Offset Read (Width)       Write    (Width)   Description
// -----------------------------------------------------------------------------
// 0x00   SSPCR0   (16 bits) SSPCR0   (16 bits) SSP Control Register 0
// 0x04   SSPCR1   (7 bits)  SSPCR1   (7 bits)  SSP Control Register 1
// 0x08   SSPDR    (16 bits) SSPDR    (16 bits) SSP Data Register
//                                              Writes to Transmit FIFO
//                                              Reads from Receive FIFO
// 0x0C   SSPSR    (5 bits)   -                 SSP Status Register
// 0x10   SSPCPSR  (8 bits)  SSPCPSR  (8 bits)  SSP Clock Pre-Scale register
// 0x14   SSPIMSC  (4 bits)  SSPIMSC  (4 bits)  SSP Interrupt Mask Set/Clear
// 0x18   SSPRIS   (4 bits)        -            SSP Interrupt Raw Int. Status
// 0x1C   SSPMIS   (4 bits)        -            SSP Interrupt Masked Int. Status
// 0x20         -            SSPICR   (4 bits)  SSP Interrupt Clear Register
// 0x24   SSPDMACR (2 bits)  SSPDMACR (2 bits)  SSP DMA Control Register
// -----------------------------------------------------------------------------
//                    Ssp Test Register Map
// -----------------------------------------------------------------------------
// Offset Read   (Width)   Write   (Width)   Description
// -----------------------------------------------------------------------------
// 0x80   SSPTCR  (2 bits)  SSPTCR  (2 bits)  SSP Test Control Register
// 0x84   SSPITIP (5 bits)  SSPITIP (2 bits)  SSP Integration Test InPut Reg.
// 0x88   SSPITOP (14 bits) SSPITOP (14 bits) SSP Integration Test OutPut Reg.
// 0x8C   SSPTDR  (16 bits) -                 SSP Test Data Register
//
// ------------------------------------------------------------------
// Identification Registers
// ------------------------------------------------------------------
// 0xFE0  SSPPeriphID0(8 bits)                          PID0 register
// 0xFE4  SSPPeriphID1(8 bits)                          PID1 register
// 0xFE8  SSPPeriphID2(8 bits)                          PID2 register
// 0xFEC  SSPPeriphID3(8 bits)                          PID3 register
// 0xFF0  SSPPCellID0(8 bits)                           PCID0 register
// 0xFF4  SSPPCellID1(8 bits)                           PCID1 register
// 0xFF8  SSPPCellID2(8 bits)                           PCID2 register
// 0xFFC  SSPPCellID3(8 bits)                           PCID3 register

// Register declarations
// -----------------------------------------------------------------------------
reg  [15:0] PRDATA; 
// Output of the Read multiplexer

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------

wire  [11:2] GatedPA;         
// Gate PA with PSEL to save power 

// -----------------------------------------------------------------------------
// Read Decodes for Register reads
// -----------------------------------------------------------------------------
wire        SSPCR0Rd;     
// SSPCR0 read

wire        SSPCR1Rd;      
// SSPCR1 read

wire        SSPDRRd;        
// SSPDR read

wire        SSPSRRd;         
// SSPSR read

wire        SSPCPSRRd;        
// SSPCPSR read

wire        SSPIMSCRd;
// SSPIMSC read

wire        SSPRISRd;
// SSPRIS read

wire        SSPMISRd;
// SSPMIS read

wire        SSPDMACRRd;
// SSPDMACR read

wire       SSPTCRRd;    
// SSPTCR read

wire       SSPITIPRd;    
// SSPITIP read

wire       SSPITOPRd;   
// SSPITOP read

wire       SSPTDRRd;   
// SSPTDR read

wire       PERIPHID0rd;
// PeripheralID0 read

wire       PERIPHID1rd;
// PeripheralID1 read

wire       PERIPHID2rd;
// PeripheralID2 read

wire       PERIPHID3rd;
// PeripheralID3 read

wire       PRIMECELLID0rd;
// PrimeCellID0 read

wire       PRIMECELLID1rd;
// PrimeCellID1 read

wire       PRIMECELLID2rd;
// PrimeCellID2 read

wire       PRIMECELLID3rd;
// PrimeCellID3 read

wire [15:0] NextPRDATA;         
// D-input PRDATA output register

wire        WrEn;
// Write Enable signal for registers  

wire        RdEn;
// Read Enable signal for registers  

wire [13:5] IntraOP;
// Intra chip outputs intermediate signal

wire [4:0] PrimaryOP;
// Primary chip outputs intermediate signal

wire [4:3] IntraIP;
// Intra chip inputs intermediate signal

wire [2:0] PrimaryIP;
// Primary chip inputs intermediate signal

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Write Interface
// -----------------------------------------------------------------------------
// -----------------------------------------------------------------------------
// Save power by preventing change in internal data bus and address bus when
// the device is not selected.
// -----------------------------------------------------------------------------
assign GatedPA[11:2] = (PSEL == 1'b1) ? PADDR : 10'b0000000000;

assign PWDATAIn     = ((PSEL == 1'b1) && (PWRITE == 1'b1)) ? PWDATA : 
                      16'h0000; 

assign WrEn         =  PENABLE & PSEL & PWRITE; 
// -----------------------------------------------------------------------------
// Normal Mode Register Write Decodes
// -----------------------------------------------------------------------------
// SSPSCR0
assign SSPCR0Wr      = WrEn & (GatedPA == `PA_SSPCR0);

// SSPCR1
assign SSPCR1Wr      = WrEn & (GatedPA == `PA_SSPCR1);

// SSPDR
assign SSPDRWr       = WrEn & (GatedPA == `PA_SSPDR);

// SSPCPSR
assign SSPCPSRWr     = WrEn & (GatedPA == `PA_SSPCPSR);

// SSPIMSC
assign SSPIMSCWr     = WrEn & (GatedPA == `PA_SSPIMSC);

// SSPICR
assign SSPICRWr      = WrEn & (GatedPA == `PA_SSPICR);

// SSPDMACR
assign SSPDMACRWr    = WrEn & (GatedPA == `PA_SSPDMACR);

// -----------------------------------------------------------------------------
// Test Mode Register Write Decodes
// -----------------------------------------------------------------------------
// SSPTCR
assign SSPTCRWr      = WrEn & (GatedPA == `PA_SSPTCR);

// SSPITIP
assign SSPITIPWr     = WrEn & (GatedPA == `PA_SSPITIP);

// SSPITOP
assign SSPITOPWr     = WrEn & (GatedPA == `PA_SSPITOP);

// SSPTDR
assign SSPTDRWr      = WrEn & (GatedPA == `PA_SSPTDR);

// -----------------------------------------------------------------------------
// Read Interface
// -----------------------------------------------------------------------------
assign RdEn         = PSEL & ~PWRITE; 

// -----------------------------------------------------------------------------
// Normal mode Register Read Decodes
// -----------------------------------------------------------------------------
// SSPCR0
assign SSPCR0Rd      = RdEn & (GatedPA == `PA_SSPCR0);

// SSPCR1
assign SSPCR1Rd      = RdEn & (GatedPA == `PA_SSPCR1);

// SSPDR
assign SSPDRRd       = RdEn & (GatedPA == `PA_SSPDR);

// SSPSR
assign SSPSRRd       = RdEn & (GatedPA == `PA_SSPSR);

// SSPCPSR
assign SSPCPSRRd     = RdEn & (GatedPA == `PA_SSPCPSR);

// SSPIMSC
assign SSPIMSCRd     = RdEn & (GatedPA == `PA_SSPIMSC);

// SSPRIS
assign SSPRISRd      = RdEn & (GatedPA == `PA_SSPRIS);

// SSPMIS
assign SSPMISRd      = RdEn & (GatedPA == `PA_SSPMIS);

// SSPDMACR
assign SSPDMACRRd    = RdEn & (GatedPA == `PA_SSPDMACR);

// -----------------------------------------------------------------------------
// Test mode Register Read Decodes
// -----------------------------------------------------------------------------

// SSPTCR
assign SSPTCRRd      = RdEn & (GatedPA == `PA_SSPTCR);

// SSPITIP
assign SSPITIPRd     = RdEn & (GatedPA == `PA_SSPITIP);

// SSPITOP
assign SSPITOPRd     = RdEn & (GatedPA == `PA_SSPITOP);

// SSPTDR
assign SSPTDRRd         = RdEn & (GatedPA == `PA_SSPTDR);

// -----------------------------------------------------------------------------
// Peripheral Identification Register Read Decodes
// -----------------------------------------------------------------------------

// PERIPHID0
assign PERIPHID0rd      = RdEn & (GatedPA == `PA_PERIPHID0);

// PERIPHID1
assign PERIPHID1rd      = RdEn & (GatedPA == `PA_PERIPHID1);

// PERIPHID2
assign PERIPHID2rd      = RdEn & (GatedPA == `PA_PERIPHID2);

// PERIPHID3
assign PERIPHID3rd      = RdEn & (GatedPA == `PA_PERIPHID3);

// -----------------------------------------------------------------------------
// PrimeCell Identification Register Read Decodes
// -----------------------------------------------------------------------------

// PRIMECELLID0
assign PRIMECELLID0rd   = RdEn & (GatedPA == `PA_PRIMECELLID0);

// PRIMECELLID1
assign PRIMECELLID1rd   = RdEn & (GatedPA == `PA_PRIMECELLID1);

// PRIMECELLID2
assign PRIMECELLID2rd   = RdEn & (GatedPA == `PA_PRIMECELLID2);

// PRIMECELLID3
assign PRIMECELLID3rd   = RdEn & (GatedPA == `PA_PRIMECELLID3);


// -----------------------------------------------------------------------------
// Increment the Read pointer in the Receive FIFO after every read from
// the Receive FIFO i.e.  after every read from the SSPDR Register
// -----------------------------------------------------------------------------
assign RxFRdPtrInc  = PENABLE & PSEL & ~PWRITE & (GatedPA == `PA_SSPDR); 
                        
// -----------------------------------------------------------------------------
// Output Mux.
// When the peripheral is not being accessed, '0's are driven on the Read
// Databus (PRDATA) so as not to place any restrictions on the method of
// external bus connection. The external data buses of the peripherals on the
// APB may then be connected to the APB bridge using Muxed or ORed bus
// connection method.
// -----------------------------------------------------------------------------

assign IntraOP    = { IntSSPTXDMASREQ, IntSSPTXDMABREQ, IntSSPRXDMASREQ,
                             IntSSPRXDMABREQ, IntSSPINTR, IntSSPTXINTR, 
                             IntSSPRXINTR, IntSSPRTINTR, IntSSPRORINTR };

assign PrimaryOP = SSPITOP;

assign IntraIP   = {IntTXDMACLR, IntRXDMACLR};

assign PrimaryIP = {SSPCLKIN, SSPFSSIN, SSPRXD};

assign  NextPRDATA = 
        (SSPCR0Rd        == 1'b1)  ? SSPCR0                               : (
        (SSPCR1Rd        == 1'b1)  ? {9'b000000000,SSPCR1}                : (
        (SSPDRRd         == 1'b1)  ? RxFRdData                            : (
        (SSPSRRd         == 1'b1)  ? {11'b00000000000,BSY,RFF,
                                      RNE,TNF,TFE}                        : (
        (SSPCPSRRd       == 1'b1)  ? {8'h00, SSPCPSR, 1'b0}               : (
        (SSPIMSCRd       == 1'b1)  ? {12'b000000000000, SSPIMSC}          : (
        (SSPRISRd        == 1'b1)  ? {12'b000000000000,  
                                      TXRIS, RXRIS, RTRISSync, 
                                      RORRIS}                             : (
        (SSPMISRd        == 1'b1)  ? {12'b000000000000,
                                      TXMIS, RXMIS, RTMISSync, RORMIS}    : (
        (SSPDMACRRd      == 1'b1)  ? {14'b00000000000000, SSPDMACR}       : (
        (SSPTCRRd        == 1'b1)  ? {14'b00000000000000, TESTFIFO, ITEN} : (
        (SSPITIPRd       == 1'b1)  ? {11'b00000000000,IntraIP,PrimaryIP}  : (
        (SSPITOPRd       == 1'b1)  ? {2'b00,
                                      IntraOP, PrimaryOP}                 : (
        (PERIPHID0rd     == 1'b1)  ? {8'b00000000, 8'b00100010}           : (
        (PERIPHID1rd     == 1'b1)  ? {8'b00000000, 8'b00010000}           : (
        (PERIPHID2rd     == 1'b1)  ? {8'b00000000, Revision, 
                                      4'b0100}                            : (
        (PERIPHID3rd     == 1'b1)  ? {8'b00000000, 8'b00000000}           : (
        (PRIMECELLID0rd  == 1'b1)  ? {8'b00000000, 8'b00001101}           : (
        (PRIMECELLID1rd  == 1'b1)  ? {8'b00000000, 8'b11110000}           : (
        (PRIMECELLID2rd  == 1'b1)  ? {8'b00000000, 8'b00000101}           : (
        (PRIMECELLID3rd  == 1'b1)  ? {8'b00000000, 8'b10110001}           : (
        ((SSPTDRRd == 1'b1) & (TESTFIFO == 1'b1)) ? 
                                      TxFRdData                           : (
        16'h0000)))))))))))))))))))));

// -----------------------------------------------------------------------------
// Output register. The Output Register is not clock enabled because the clock
// enable signal is qualified with PENABLE. If the Output register were clock
// enabled, read data would be available on the Q-ouput of the register only
// after the rising edge on which data is sampled by the APB bridge.
// This register is not reset by the TESTRST bit in the SSPTCR register. If
// it were, it would not be possible to read the internal registers with the
// TESTRST bit set.
// -----------------------------------------------------------------------------
always @ (posedge PCLK or negedge PRESETn) 
begin : p_Seq 
  if (PRESETn == 1'b0) 
    PRDATA  <= 16'h0000;
  else
    PRDATA  <= NextPRDATA;
end // p_Seq

endmodule

// --============================ End ========================================--
