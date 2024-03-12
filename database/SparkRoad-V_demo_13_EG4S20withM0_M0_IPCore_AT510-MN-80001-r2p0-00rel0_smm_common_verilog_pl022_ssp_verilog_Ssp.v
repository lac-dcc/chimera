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
//  File Name              : $RCSfile: Ssp.v.rca $S
//  File Revision          : 20344
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
//  
// -----------------------------------------------------------------------------

//  Purpose          : This block is the top level of the SSP.

// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module Ssp ( 
// Inputs
            PCLK, 
            SSPCLK, 

            PRESETn, 
            nSSPRST, 

            PSEL, 
            PENABLE, 
            PWRITE, 

            SSPRXD, 
            SSPFSSIN, 
            SSPCLKIN,

            SCANENABLE,
            SCANINPCLK,
            SCANINSSPCLK,

            PADDR, 

            PWDATA, 

            SSPTXDMACLR,
            SSPRXDMACLR,
// Outputs 
            SSPINTR, 
            SSPRXINTR,
            SSPTXINTR , 
            SSPRORINTR, 
            SSPRTINTR,

            SSPFSSOUT, 
            SSPCLKOUT,

            SCANOUTPCLK, 
            SCANOUTSSPCLK, 

            SSPTXD, 
            nSSPOE, 
            nSSPCTLOE,

            PRDATA,
            
            SSPTXDMASREQ,
            SSPTXDMABREQ,
            SSPRXDMASREQ,
            SSPRXDMABREQ
           );

// Inputs
input          PCLK;            // APB Bus Clock
input          SSPCLK;          // Main SSP Clock
input          PRESETn;         // AMBA Bus Reset
input          nSSPRST;         // SSP Reset
input          PSEL;            // APB Peripheral select
input          PENABLE;         // APB Peripheral enable
input          PWRITE;          // APB Peripheral write
input          SSPRXD;          // SSP Receive input
input          SSPCLKIN;        // SSP Serial Clock input
input          SSPFSSIN;        // SSP Serial Frame input
input          SCANENABLE;      // Scan Enable 
input          SCANINPCLK;      // Scan Input signal in PCLK domain
input          SCANINSSPCLK;    // Scan Input signal in SSPCLK domain
input   [11:2] PADDR;           // APB Address Bus
input   [15:0] PWDATA;          // APB Write databus
input          SSPTXDMACLR;     // DMA clear signal
input          SSPRXDMACLR;     // DMA clear signal

//Outputs
output         SSPINTR;         // Combined Interrupt
output         SSPRXINTR;       // Receive FIFO Service Request
output         SSPTXINTR;       // Transmit FIFO Service Request
output         SSPRORINTR;      // Rx FIFO Overrun Interrupt
output         SSPRTINTR;       // Rx Receive Timeout Interrupt
output         SSPFSSOUT;       // Serial Frame Output pin
output         SSPCLKOUT;       // Serial Clock Output pin
output         SCANOUTPCLK;     // Scan Output signal in PCLK domain
output         SCANOUTSSPCLK;   // Scan Output signal in SSPCLK domain
output         SSPTXD;          // SSP Serial Transmit output
output         nSSPOE;          // Output Enable for SSPTXD
output         nSSPCTLOE;       // Output Enable for SSPCLKOUT and SSPFSSOUT
output  [15:0] PRDATA;          // Read databus
output         SSPTXDMASREQ;    // Transmit DMA Single Request
output         SSPTXDMABREQ;    // Transmit DMA Burst  Request
output         SSPRXDMASREQ;    // Receive  DMA Single Request
output         SSPRXDMABREQ;    // Receive  DMA Burst  Request
 
// -----------------------------------------------------------------------------
// 
//                                  Ssp
//                                  ===
// 
// -----------------------------------------------------------------------------
// 
// Overview
// ========
// 
//  This module instantiates the following sub-modules: 
// 
// 1.  SspApbif          - APB Interface
// 2.  SspRegCore        - Register Block
// 3.  SspRxFIFO         - Receive FIFO
// 4.  SspTxFIFO         - Transmit FIFO
// 5.  SspScaleCntr      - SSP Clock Pre-scaler
// 6.  SspMTxRxCntl      - Transmitter/Receiver Master mode
// 7.  SspSTxRxCntl      - Transmitter/Receiver Slave mode
// 8.  SspIntGen         - Interrupt Generator
// 9.  SspSynctoPCLK     - Synchronisers for signals crossing into PCLK domain
// 10. SspSynctoSSPCLK   - Synchronisers for signals crossing into SSPCLK domain
// 11. SspTest           - Test Logic 
// 12. SspDMA            - DMA Interface
// 13. SspRevAnd         - Revision place holder
//  The module SspRevAnd used as a place-holder cell to mark the
// Revision of the Ssp. It contains a 2 input AND gate. The 2 input
// pins are tied-off at the top level of the hierarchy. These "TieOffs"
// can be identified during layout and re-wired to "VDD" or "VSS"
// if needed.  
// -----------------------------------------------------------------------------
 
// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire [15:0] PWDATAIn;
// APB Write data Input
 
wire        RNE;
// Denotes RXFIFO not empty
 
wire        RNESync; 
// RNE synchronised to SSPCLK

wire [15:0] RxFRdData; 
// RXFIFO Read data bus

wire        RxFRdPtrInc; 
// RXFIFO Read Pointer Increment Signal

wire        TNF; 
// TXFIFO not full

wire        TxFRdPtrInc; 
// TXFIFO Read Pointer Increment Signal

wire        TxFRdPtrIncSync; 
// Double synchronised TXFIFO Read Ponter Increment signal

wire        TxDataAvlbl;
// TXFIFO Data available  

wire        SPH; 
// Indicates phase of SCLK in SPI mode

wire        SPO; 
// Indicates polarity of SCLK in SPI mode

wire  [7:0] SCR;
// Serial clock rate
 
wire  [1:0] FRF; 
// Frame format

wire  [3:0] DSS; 
// Specifies Datasize to be transmited

wire        SSPCLKDIV; 
// SSPCLOCK Division signal

wire        TxDataAvlblSync; 
// Transmiter data available synchronised signal

wire        RxFWrSync; 
// Reciever Fifo write sync signal

wire        RxFWr; 
//  Reciever Fifo write signal

wire [15:0] MRxFWrData; 
// RXFIFO Data to be written in Master mode

wire [15:0] SRxFWrData; 
// RXFIFO Data to be written in Slave mode

wire        TFE; 
// TXFIFO Empty signal

wire        RFF; 
// Denotes RXFIFO full

wire        SSESync;
// Synchronised SSP Enable signal

wire        TxRxBSY; 
// Denotes SSP is transmitting or receiving

wire        TxRxBSYSync; 
// Synchronised TxRxBSY signal

wire        BSY; 
// Denotes SSP is busy or TXFIFO is not empty

wire        CR0UpdateSync; 
// Synchronised Control Register 0 Update Signal

wire        CR0Update; 
// Control Register 0 Update Signal

wire        CPSRUpdateSync;
// Clock Pre-scale Register Update synchronised signal
 
wire        CPSRUpdate; 
// Clock Pre-scale Register Update signal

wire [15:0] SSPCR0; 
// SSP Control Register 0

wire  [6:0] SSPCR1; 
// SSP Control Register 1

wire  [3:0] SSPIMSC; 
// SSP Interrupt Mask Set Clear

wire  [1:0] SSPDMACR; 
// SSP DMA Control Register

wire  [4:0] SSPITOP; 
// SSP Integration OutPut test tegister

wire        SSPCR0Wr; 
//  SSP Control Register 0 Write signal

wire        SSPCR1Wr; 
//  SSP Control Register 1 Write signal

wire        SSPCPSRWr; 
//  SSP Clock Pre-scale Counter Register

wire        SSPDRWr ; 
//  SSP Data Register Write

wire        SSPIMSCWr; 
//  SSP Interrupt Mask Set Clear Write signal

wire        SSPICRWr; 
//  SSP Interrupt Clear Write Signal

wire        SSPDMACRWr; 
//  SSP DMA Control Register Write signal

wire        SSPTCRWr; 
//  SSP Test Control Register Write signal

wire        SSPITIPWr; 
//  SSP Integration Test Input Register Write signal

wire        SSPITOPWr; 
//  SSP Integration Test Output Register Write signal

wire        SSPTDRRd; 
//  SSP Test Control Register Write signal

wire [15:0] TxFRdData; 
//  TXFIFO Read data bus (direct from fifo)

wire [15:0] TxFRdDataIn; 
//  TXFIFO Read data bus (left justified fifo data)

wire [7:1]  SSPCPSR; 
//  SSP Clock Pre-scale Register

wire        LBM;
//  Loop Back Mode
  
wire        SSE;
//  SSP Enable signal
 
wire        MS;
//  Master/Slave Select signal
 
wire        MSSync;
//  Synchronised Master/Slave Select signal
 
wire        SOD;
//  Slave Output Disable Signal
 
wire [3:0]  DSSPCLK;
// Data Size Select Signal in PCLK domain

wire [1:0]  FRFPCLK;
// Frame Format Select Signal in PCLK domain

wire        RXRIS;        
// Receive FIFO Raw Interrupt Source

wire        RXMIS;        
// Receive FIFO Masked Interrupt Source

wire        TXRIS;        
// Transmit FIFO Raw Interrupt Source

wire        TXMIS;        
// Transmit FIFO Masked Interrupt Source

wire        RORRIS;        
// Rx FIFO Overrun Raw Interrupt Source

wire        RORMIS;        
// Rx FIFO Overrun Masked Interrupt Source

wire        RTRISSync;        
// Rx Receive Time Out Raw Interrupt

wire        RTMIS;        
// Rx Receive Time Out Masked Interrupt

wire        TXIM;        
// Tx  fifo Interrupt Mask

wire        RXIM;        
// Rx fifo Interrupt Mask 

wire        RTIM;        
// Rx Receive Timeout Interrupt Mask 

wire        RTIMSync;        
// Rx Receive Timeout Interrupt Mask sync'd to SSPCLK 

wire        RORIM;        
// Rx Over Run  Interrupt Mask

wire        NextSTXD;        
// D-input of Slave's Serial Transmit output

wire        NextnSOE;        
// Output Enable for Slave's SSPTXD signal

wire        NextSTxRxBSY;
// D-input of Slave's TxRxBSY signal

wire        NxtSTxFRdPtrInc;
// D-input of Slave's TXFIFO Read Pointer Increment signal

wire        NextSRxFWr;
// D-input of Slave's RXFIFO Write signal

wire        SODSync;
// Synchronised SOD signal

wire        CLKINSync;
// Synchronised SCLKIN signal

wire        FSSINSync;
// Synchronised SFSSIN signal

wire        TXDMAE;
//  SSP Tx DMA Enable control bit in SSPDMACR

wire        RXDMAE;
//  SSP Rx DMA Enable control bit in SSPDMACR

wire        FIFOLTE7Full;
//  SSP TX FIFO has one or more spaces

wire        DataStp;
//  Rx Data Stopped Time Out signal

wire        FSSOUT;
//  FSSOUT integration test mux input 

wire        CLKOUT;
//  CLKOUT integration test mux input

wire        TXD;
//  SSPTXD integration test mux input

wire        nCTLOE;
//  nSSPCTLOE integration test mux inout

wire        nOE;
//  nSSPOEint prior to integration test mux

wire        RORINTR;
// RORINTR prior to integration test mux

wire        RTINTR;
// RTINTR prior to integration test mux

wire        INTR;
// INTR prior to integration test mux

wire        IntSSPRXD;
// SSPRXD integration test mux output

wire        IntSSPTXINTR;
// SSPTXINTR integration test mux output

wire        IntSSPRXINTR;
// SSPRXINTR integration test mux output

wire        IntSSPRORINTR;
// RORINTR integration test mux output

wire        IntSSPRTINTR;
// RTINTR integration test mux output

wire        IntSSPINTR;
// INTR integration test mux output

wire        IntSSPFSSOUT;
// FSSOUT integration test mux output

wire        IntSSPCLKOUT;
// CLKOUT integration test mux output

wire        IntSSPTXD;
// TXD integration test mux output

wire        IntnSSPCTLOE;
// nCTLOE integration test mux output

wire        IntnSSPOE;
// nSSPOE integration test mux output

wire        TXDMASREQ;
// TX DMA Single REQ integration test mux input

wire        TXDMABREQ;
// TX DMA Burst REQ integration test mux input

wire        RXDMASREQ;
// RX DMA Single REQ integration test mux input

wire        RXDMABREQ;
// RX DMA Burst REQ integration test mux input

wire        IntSSPTXDMASREQ;
// TX DMA Single REQ integration test mux output

wire        IntSSPTXDMABREQ;
// TX DMA Burst REQ integration test mux output

wire        IntSSPRXDMASREQ;
// RX DMA Single REQ integration test mux output

wire        IntSSPRXDMABREQ;
// RX DMA Burst REQ integration test mux output

wire        IntTXDMACLR;
// TX DMA Clear integration test mux output

wire        IntRXDMACLR;
// RX DMA Clear integration test mux output

wire        IntTXDMACLRSync;
// TX DMA Clear Synchronised

wire        IntRXDMACLRSync;
// RX DMA Clear Synchronised

wire        RORIC;
// Rx Over Run Interrupt Clear

wire        RTIC;
// Rx Time Out Interrupt Clear

wire        RTICSync;
// Rx Time Out Interrupt Clear Sync

wire        TESTFIFO;
// Tx and Rx FIFO Test mode enable

wire        ITEN;
// Integration Test Enable

wire        TestTXFInc;
// Test Mode TX FIFO read pointer increment enable

wire        SSPTDRWr;
// Test Mode Rx Test Data Register Write enable

wire        MRxRT;
// MasterRx Reload Timeout counter signal

wire        SRxRT;
// Slave Rx Reload Timeout counter signal

wire  [7:4] TieOff1;
  // Revision code input signals, set 1
  
wire  [7:4] TieOff2;
  // Revision code input signals, set 2
  
wire  [7:4] Revision;
 // Peripheral revision code output

wire        IncRxTimeOut;
  // Rx Time Out Counter Enable 

wire        RTMISSync;


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Assigning register bits to Local wires 
// -----------------------------------------------------------------------------
assign SOD          = SSPCR1[3];
assign MS           = SSPCR1[2];
assign SSE          = SSPCR1[1];
assign LBM          = SSPCR1[0];

assign FRFPCLK      = SSPCR0[5:4];
assign DSSPCLK      = SSPCR0[3:0];

assign TXIM         = SSPIMSC[3];
assign RXIM         = SSPIMSC[2];
assign RTIM         = SSPIMSC[1];
assign RORIM        = SSPIMSC[0];

assign TXDMAE       = SSPDMACR[1];
assign RXDMAE       = SSPDMACR[0];

assign SSPFSSOUT    = IntSSPFSSOUT; 
assign SSPCLKOUT    = IntSSPCLKOUT; 
assign SSPTXD       = IntSSPTXD; 
assign nSSPOE       = IntnSSPOE;
assign nSSPCTLOE    = IntnSSPCTLOE;
  
assign SSPTXINTR    = IntSSPTXINTR; 
assign SSPRXINTR    = IntSSPRXINTR; 
assign SSPRORINTR   = IntSSPRORINTR;
assign SSPRTINTR    = IntSSPRTINTR;
assign SSPINTR      = IntSSPINTR;

assign SSPTXDMASREQ = IntSSPTXDMASREQ;
assign SSPTXDMABREQ = IntSSPTXDMABREQ;
assign SSPRXDMASREQ = IntSSPRXDMASREQ;
assign SSPRXDMABREQ = IntSSPRXDMABREQ;

assign TieOff1      = 4'b0010;
assign TieOff2      = 4'b0010;

// -----------------------------------------------------------------------------
// The APB Interface contains the Write interface and the Read interface
// for registers in the SSP.
// -----------------------------------------------------------------------------
SspApbif uSspApbif            (
             .PCLK            (PCLK),
             .PRESETn         (PRESETn),
             .PSEL            (PSEL),
             .PWRITE          (PWRITE),
             .PENABLE         (PENABLE),
             .PADDR           (PADDR),
             .PWDATA          (PWDATA),
             .SSPRXD          (SSPRXD),
             .SSPFSSIN        (SSPFSSIN),
             .SSPCLKIN        (SSPCLKIN),
             .TNF             (TNF),
             .RNE             (RNE),
             .BSY             (BSY),
             .RFF             (RFF),
             .TFE             (TFE),
             .IntTXDMACLR     (IntTXDMACLR),
             .IntRXDMACLR     (IntRXDMACLR),
             .IntSSPTXDMASREQ (IntSSPTXDMASREQ),
             .IntSSPTXDMABREQ (IntSSPTXDMABREQ),
             .IntSSPRXDMASREQ (IntSSPRXDMASREQ),
             .IntSSPRXDMABREQ (IntSSPRXDMABREQ),
             .IntSSPINTR      (IntSSPINTR),
             .IntSSPTXINTR    (IntSSPTXINTR),
             .IntSSPRXINTR    (IntSSPRXINTR),
             .IntSSPRTINTR    (IntSSPRTINTR),
             .IntSSPRORINTR   (IntSSPRORINTR),
             .SSPITOP         (SSPITOP),
             .SSPCR0          (SSPCR0),
             .SSPCR1          (SSPCR1),
             .SSPCPSR         (SSPCPSR),
             .SSPIMSC         (SSPIMSC),
             .TXRIS           (TXRIS),
             .RXRIS           (RXRIS),
             .RTRISSync       (RTRISSync),
             .RORRIS          (RORRIS),
             .TXMIS           (TXMIS),
             .RXMIS           (RXMIS),
             .RTMISSync       (RTMISSync),
             .RORMIS          (RORMIS),
             .SSPDMACR        (SSPDMACR),
             .RxFRdData       (RxFRdData),
             .TxFRdData       (TxFRdData),
             .TESTFIFO        (TESTFIFO),
             .ITEN            (ITEN),
             .Revision        (Revision),

             .PRDATA          (PRDATA),
             .PWDATAIn        (PWDATAIn),
             .SSPCR0Wr        (SSPCR0Wr),
             .SSPCR1Wr        (SSPCR1Wr),
             .SSPDRWr         (SSPDRWr),
             .SSPCPSRWr       (SSPCPSRWr),
             .SSPIMSCWr       (SSPIMSCWr),
             .SSPICRWr        (SSPICRWr),
             .SSPDMACRWr      (SSPDMACRWr),
             .SSPTCRWr        (SSPTCRWr),
             .SSPITIPWr       (SSPITIPWr),
             .SSPITOPWr       (SSPITOPWr),
             .SSPTDRWr        (SSPTDRWr),
             .SSPTDRRd        (SSPTDRRd),
             .RxFRdPtrInc     (RxFRdPtrInc)
           );

// -----------------------------------------------------------------------------
// The SspTxFIFO block contains the Transmit FIFO and the control logic
// required to regulate accesses to the FIFO.
// -----------------------------------------------------------------------------
 SspTxFIFO uSspTxFIFO         (
             .PCLK            (PCLK),
             .PRESETn         (PRESETn), 
             .MS              (MS),
             .SSPDRWr         (SSPDRWr),
             .TxFRdPtrIncSync (TxFRdPtrIncSync),
             .TxRxBSYSync     (TxRxBSYSync),
             .TXIM            (TXIM),
             .FRFPCLK         (FRFPCLK),
             .DSSPCLK         (DSSPCLK),
             .PWDATAIn        (PWDATAIn),
             .TestTXFInc      (TestTXFInc),

             .TNF             (TNF), 
             .TFE             (TFE),
             .BSY             (BSY),
             .TXRIS           (TXRIS),
             .TXMIS           (TXMIS),
             .FIFOLTE7Full    (FIFOLTE7Full),
             .TxDataAvlbl     (TxDataAvlbl),
             .TxFRdData       (TxFRdData),
             .TxFRdDataIn     (TxFRdDataIn)
             );

// -----------------------------------------------------------------------------
// The SspRxFIFO block contains the Receive FIFO and the control logic
// required to regulate accesses to the FIFO.
// -----------------------------------------------------------------------------
 SspRxFIFO uSspRxFIFO     (
             .PCLK        (PCLK),
             .PRESETn     (PRESETn),
             .RXIM        (RXIM),
             .RORIM       (RORIM),
             .RORIC       (RORIC),
             .RxFWrSync   (RxFWrSync),
             .RxFRdPtrInc (RxFRdPtrInc),
             .MS          (MS),
             .SRxFWrData  (SRxFWrData),
             .MRxFWrData  (MRxFWrData),
             .TESTFIFO    (TESTFIFO),
             .PWDATAIn    (PWDATAIn),
             .SSPTDRWr    (SSPTDRWr),

             .RNE         (RNE),
             .RFF         (RFF),
             .RXRIS       (RXRIS),
             .RORRIS      (RORRIS),
             .RXMIS       (RXMIS),
             .RORMIS      (RORMIS),
             .RxFRdData   (RxFRdData)
             );

// -----------------------------------------------------------------------------
// This block contains synchronisers for signals crossing into the PCLK
// domain.
// -----------------------------------------------------------------------------
 SspSynctoPCLK uSspSynctoPCLK    (
             .PCLK               (PCLK),

             .PRESETn            (PRESETn),

             .TxRxBSY            (TxRxBSY),
             .TxFRdPtrInc        (TxFRdPtrInc),
             .RxFWr              (RxFWr),
             .DataStp            (DataStp),
             .RTINTR             (RTINTR),
             .IntTXDMACLR        (IntTXDMACLR),
             .IntRXDMACLR        (IntRXDMACLR),
          
             .TxRxBSYSync        (TxRxBSYSync),
             .TxFRdPtrIncSync    (TxFRdPtrIncSync),
             .RxFWrSync          (RxFWrSync),
             .RTRISSync          (RTRISSync),
             .RTMISSync          (RTMISSync),
             .IntTXDMACLRSync    (IntTXDMACLRSync),
             .IntRXDMACLRSync    (IntRXDMACLRSync)
);

// -----------------------------------------------------------------------------
// The SspIntGen block combines the three individual interrupts     .SPRFSINTR,
// SSPTFSINTR and SSPRORINTR by ORing them and the resultant signal is 
// clocked out as SSPINTR.
// -----------------------------------------------------------------------------
 SspIntGen uSspIntGen  (
             .TXMIS    (TXMIS),
             .RXMIS    (RXMIS),
             .RORMIS   (RORMIS),
             .DataStp  (DataStp),
             .RTIMSync (RTIMSync),
             .RORIC    (RORIC),
             .RTIC     (RTIC),
             .RORINTR  (RORINTR),
             .RTINTR   (RTINTR),
             .INTR     (INTR)
             );

// -----------------------------------------------------------------------------
// The SspTest block generates Test clock enable and Test reset for the SSP
// It also contains logic to perform Test muxing on non-AMBA inputs to the SSP
// -----------------------------------------------------------------------------
 SspTest uSspTest             (
             .PCLK            (PCLK),

             .PRESETn         (PRESETn),

             .PWDATAIn        (PWDATAIn[13:0]),

             .LBM             (LBM),

             .SSPRXD          (SSPRXD),

             .TXMIS           (TXMIS),
             .RXMIS           (RXMIS),
             .RORINTR         (RORINTR),
             .RTINTR          (RTINTR),
             .INTR            (INTR),

             .TXDMASREQ       (TXDMASREQ), 
             .TXDMABREQ       (TXDMABREQ), 
             .RXDMASREQ       (RXDMASREQ), 
             .RXDMABREQ       (RXDMABREQ), 

             .FSSOUT          (FSSOUT),
             .CLKOUT          (CLKOUT),
             .TXD             (TXD),
             .nCTLOE          (nCTLOE),
             .nOE             (nOE),
          
             .SSPTCRWr        (SSPTCRWr),
             .SSPITIPWr       (SSPITIPWr),
             .SSPITOPWr       (SSPITOPWr),
             .SSPTDRRd        (SSPTDRRd),
             .SSPTXDMACLR     (SSPTXDMACLR),
             .SSPRXDMACLR     (SSPRXDMACLR),
          
             .IntSSPRXD       (IntSSPRXD),
         
             .IntTXDMACLR     (IntTXDMACLR),
             .IntRXDMACLR     (IntRXDMACLR),
          
             .IntSSPTXDMASREQ (IntSSPTXDMASREQ),
             .IntSSPTXDMABREQ (IntSSPTXDMABREQ),
             .IntSSPRXDMASREQ (IntSSPRXDMASREQ),
             .IntSSPRXDMABREQ (IntSSPRXDMABREQ),
             .IntSSPINTR      (IntSSPINTR),
             .IntSSPTXINTR    (IntSSPTXINTR),
             .IntSSPRXINTR    (IntSSPRXINTR),
             .IntSSPRTINTR    (IntSSPRTINTR),
             .IntSSPRORINTR   (IntSSPRORINTR),
                  
             .IntSSPFSSOUT    (IntSSPFSSOUT),
             .IntSSPCLKOUT    (IntSSPCLKOUT),
             .IntSSPTXD       (IntSSPTXD),
             .IntnSSPCTLOE    (IntnSSPCTLOE),
             .IntnSSPOE       (IntnSSPOE),

             .SSPITOP         (SSPITOP),
          
             .TESTFIFO        (TESTFIFO),
             .ITEN            (ITEN),
                     
             .TestTXFInc      (TestTXFInc)
         );

// -----------------------------------------------------------------------------
// The SspRegCore Block contains all the read/writable normal mode registers
// in the SSP. It also contains the PCLK-domain part of the control logic
// required to synchronise the contents of SSPCR0 and SSPCPSR to the SSPCLK
// domain.
// -----------------------------------------------------------------------------
 SspRegCore uSspRegCore  (
             .PCLK       (PCLK),
          
             .PRESETn    (PRESETn),
          
             .PWDATAIn   (PWDATAIn),
          
             .SSPCR0Wr   (SSPCR0Wr),
             .SSPCR1Wr   (SSPCR1Wr),
             .SSPCPSRWr  (SSPCPSRWr),
             .SSPIMSCWr  (SSPIMSCWr),
             .SSPICRWr   (SSPICRWr),
             .SSPDMACRWr (SSPDMACRWr),

             .RTRISSync  (RTRISSync),

             .SSPCR0     (SSPCR0),
             .SSPCR1     (SSPCR1),
             .SSPCPSR    (SSPCPSR),
             .SSPIMSC    (SSPIMSC),
             .SSPDMACR   (SSPDMACR),

             .RTIC       (RTIC),
             .RORIC      (RORIC),

             .CR0Update  (CR0Update),
             .CPSRUpdate (CPSRUpdate)
             );

// -----------------------------------------------------------------------------
// The SspSynctoSSPCLK block contains synchronisers for signals crossing
// into the SSPCLK domain. 
// -----------------------------------------------------------------------------
 SspSynctoSSPCLK uSspSynctoSSPCLK (
             .SSPCLK          (SSPCLK),
          
             .nSSPRST         (nSSPRST),
          
             .SSPCLKIN        (SSPCLKIN),
             .SSPFSSIN        (SSPFSSIN),
             .TxDataAvlbl     (TxDataAvlbl),
             .SSE             (SSE),
             .MS              (MS),
             .SOD             (SOD),

             .CR0Update       (CR0Update),
             .CPSRUpdate      (CPSRUpdate),

             .RTIC            (RTIC),
             .RNE             (RNE),
             .RTIM            (RTIM),

             .CLKINSync       (CLKINSync),
             .FSSINSync       (FSSINSync),
             .TxDataAvlblSync (TxDataAvlblSync),
             .SSESync         (SSESync),
             .MSSync          (MSSync),
             .SODSync         (SODSync),

             .CR0UpdateSync   (CR0UpdateSync),
             .CPSRUpdateSync  (CPSRUpdateSync),

             .RTICSync        (RTICSync),
             .RNESync         (RNESync),
             .RTIMSync        (RTIMSync)
           );

// -----------------------------------------------------------------------------
// The SspScaleCntr block contains a pre-scaling counter that scales down
// the SSPCLK input in accordance with the value programmed in the SSPCPSR
// register. This block also contains the SSPCLK-domain part of the control
// logic required to synchronise the contents of SSPCR0 and SSPCPSR registers
// to the SSPCLK domain.
// -----------------------------------------------------------------------------
 SspScaleCntr uSspScaleCntr (
             .SSPCLK         (SSPCLK),
            
             .nSSPRST        (nSSPRST),
            
             .SSESync        (SSESync),
             .CR0UpdateSync  (CR0UpdateSync),
             .CPSRUpdateSync (CPSRUpdateSync),
             .SSPCR0         (SSPCR0),
             .SSPCPSR        (SSPCPSR),

             .SSPCLKDIV      (SSPCLKDIV),
             .SPO            (SPO),
             .SPH            (SPH),
             .DSS            (DSS),
             .FRF            (FRF),
             .SCR            (SCR)
            );

// -----------------------------------------------------------------------------
// The SspMTxRxCntl block contains the main Transmit/Receive Master mode control
// logic in the SSP.
// -----------------------------------------------------------------------------
 SspMTxRxCntl uSspMTxRxCntl (
             .SSPCLK          (SSPCLK),
             .nSSPRST         (nSSPRST),

             .DSS             (DSS),

             .FRF             (FRF),

             .SCR             (SCR),

             .SPO             (SPO),
             .SPH             (SPH),

             .SSESync         (SSESync),
             .SSPCLKDIV       (SSPCLKDIV),
        
             .TxDataAvlblSync (TxDataAvlblSync),
             .TxFRdDataIn     (TxFRdDataIn),

             .IntSSPRXD       (IntSSPRXD),
             .MSSync          (MSSync),
             .NextnSOE        (NextnSOE),
                                       
             .NextSTXD        (NextSTXD),
 
             .NextSRxFWr      (NextSRxFWr),
                                       
             .NxtSTxFRdPtrInc (NxtSTxFRdPtrInc),
                                       
             .NextSTxRxBSY    (NextSTxRxBSY),

             .RNESync         (RNESync),
                                       
             .CLKOUT          (CLKOUT),
             .FSSOUT          (FSSOUT),
             .TXD             (TXD),
             .nCTLOE          (nCTLOE),
             .nOE             (nOE),

             .TxFRdPtrInc     (TxFRdPtrInc),
             .RxFWr           (RxFWr),
             .MRxFWrData      (MRxFWrData),     
                                        
             .TxRxBSY         (TxRxBSY),

             .MRxRT           (MRxRT),
             .IncRxTimeOut    (IncRxTimeOut)
             );

// -----------------------------------------------------------------------------
// The SspSTxRxCntl block contains the main Transmit/Receive Slave mode control
// logic in the SSP.
// -----------------------------------------------------------------------------
   SspSTxRxCntl uSspSTxRxCntl  (
            .SSPCLK          (SSPCLK),
        
            .nSSPRST         (nSSPRST),

            .TXD             (TXD),
            .nOE             (nOE),
        
            .DSS             (DSS),       
                                       
            .FRF             (FRF),     
                                       
            .SCR             (SCR),      
                                       
            .SPO             (SPO),
            .SPH             (SPH),
            .SSPCLKDIV       (SSPCLKDIV),
       
            .CLKINSync       (CLKINSync),
            .FSSINSync       (FSSINSync),
            .SSESync         (SSESync),
            .MSSync          (MSSync),
            .SODSync         (SODSync),
            .TxFRdDataIn     (TxFRdDataIn),    
                                       
            .TxFRdPtrInc     (TxFRdPtrInc),
            .RxFWr           (RxFWr),
            .TxRxBSY         (TxRxBSY),
            .IntSSPRXD       (IntSSPRXD),
 
            .NxtSTxFRdPtrInc (NxtSTxFRdPtrInc),
                                        
            .NextSTxRxBSY    (NextSTxRxBSY),
                                        
            .NextSRxFWr      (NextSRxFWr),
                                        
            .NextnSOE        (NextnSOE),
            .NextSTXD        (NextSTXD),
            .SRxFWrData      (SRxFWrData),   
                                        
            .SRxRT           (SRxRT)
             );

  SspDataStp uSspDataStp (

            .SSPCLK       (SSPCLK),
            .nSSPRST      (nSSPRST),
        
            .IncRxTimeOut (IncRxTimeOut),
        
            .MRxRT        (MRxRT),
            .SRxRT        (SRxRT),        
            .RNESync      (RNESync),
            .RTICSync     (RTICSync),
        
            .DataStp      (DataStp)
    );
  

  SspDMA  uSspDMA (
            .PCLK               (PCLK),
            .PRESETn            (PRESETn),
     
            .SSE                (SSE),
            .TXDMAE             (TXDMAE),
            .RXDMAE             (RXDMAE),
  
            .TESTFIFO           (TESTFIFO),
            .TXRIS              (TXRIS),
            .RXRIS              (RXRIS),
            .TXFLTE7Full        (FIFOLTE7Full),
            .RXFGTE1Full        (RNE),
            .IntTXDMACLRSync    (IntTXDMACLRSync),
            .IntRXDMACLRSync    (IntRXDMACLRSync),
        
            .TXDMASREQ          (TXDMASREQ),
            .TXDMABREQ          (TXDMABREQ),
            .RXDMASREQ          (RXDMASREQ),
            .RXDMABREQ          (RXDMABREQ)
          );

// ---------------------------------------------------------------------
// 1st instantiation of SspRevAnd
// ---------------------------------------------------------------------
  SspRevAnd  u0SspRevAnd (

            .TieOff1  (TieOff1[4]),
            .TieOff2  (TieOff2[4]),

            .Revision (Revision[4])
    );

// ---------------------------------------------------------------------
// 2nd instantiation of SspRevAnd
// ---------------------------------------------------------------------
  SspRevAnd  u1SspRevAnd (

            .TieOff1 (TieOff1[5]),
            .TieOff2 (TieOff2[5]),

            .Revision (Revision[5])
    );

// ---------------------------------------------------------------------
// 3rd instantiation of SspRevAnd
// ---------------------------------------------------------------------
  SspRevAnd  u2SspRevAnd (

            .TieOff1  (TieOff1[6]),
            .TieOff2  (TieOff2[6]),

            .Revision (Revision[6])
    );
    
// ---------------------------------------------------------------------
// 4th instantiation of SspRevAnd
// ---------------------------------------------------------------------
  SspRevAnd  u3SspRevAnd (

            .TieOff1  (TieOff1[7]),
            .TieOff2  (TieOff2[7]),

            .Revision (Revision[7])
    );
 
endmodule

   
// --================================== End ==================================--
