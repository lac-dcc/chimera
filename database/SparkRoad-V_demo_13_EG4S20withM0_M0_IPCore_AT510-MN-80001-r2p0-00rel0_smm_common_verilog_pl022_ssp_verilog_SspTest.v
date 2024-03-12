// --=========================================================================--
//  This confidential and proprietary software may be used only as
//  authorised by a licensing agreement from ARM Limited
//    (C) COPYRIGHT 2007-2008 ARM Limited
//        ALL RIGHTS RESERVED
//  The entire notice above must be reproduced on all authorised
//  opies and copies may only be made to the extent permitted
//  by a licensing agreement from ARM Limited.
// -----------------------------------------------------------------------------
//  Version and Release Control Information:
//
//  File Name              : $RCSfile: SspTest.v.rca $S
//  File Revision          : 20360
//
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
// -----------------------------------------------------------------------------
 
// -----------------------------------------------------------------------------
// Purpose      : Test logic to facilitate controlled clocking of the 
//                design
// --=========================================================================--

module SspTest (
               PCLK,
          
               PRESETn,
          
               PWDATAIn,
            
               LBM,
          
               SSPRXD,

               TXMIS,
               RXMIS,
               RORINTR,
               RTINTR,
               INTR,

               TXDMASREQ,
               TXDMABREQ,
               RXDMASREQ,
               RXDMABREQ,

               FSSOUT,
               CLKOUT,
               TXD,
               nCTLOE,
               nOE,
          
               SSPTCRWr,
               SSPITIPWr,
               SSPITOPWr,
               SSPTDRRd,
               SSPTXDMACLR,
               SSPRXDMACLR,
           
               IntSSPRXD,

          
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
                  
               IntSSPFSSOUT,
               IntSSPCLKOUT,
               IntSSPTXD,
               IntnSSPCTLOE,
               IntnSSPOE,

               SSPITOP,
          
               TESTFIFO,
               ITEN,
 
               TestTXFInc
              );

input         PCLK;              // APB bus clock

input         PRESETn;           // AMBA bus reset

input [13:0]  PWDATAIn;          // Int PWDATA

input         LBM;               // Loopback mode

input         SSPRXD;            // Serial receive input (pad)

input         TXMIS;             // TX interrupt signal
input         RXMIS;             // RX interrupt signal
input         RORINTR;           // Receive Over Run signal
input         RTINTR;            // Receive Time Out signal
input         INTR;              // Combined interrupt signal

input         TXDMASREQ;         //  TX DMA Single Request
input         TXDMABREQ;         //  TX DMA Burst  Request
input         RXDMASREQ;         //  RX DMA Single Request
input         RXDMABREQ;         //  RX DMA Burst  Request

input         FSSOUT;            // Serial FrameOut signal
input         CLKOUT;            // Serial Clock signal
input         TXD;               // Serial Transmit signal
input         nCTLOE;            // SSP Control Enable signal
input         nOE;               // SSP Data Enable signal

input         SSPTCRWr;          // Write enable for SSPTCR
input         SSPITIPWr;         // Write enable for SSPITIP
input         SSPITOPWr;         // Write enable for SSPITOP
input         SSPTDRRd;          // Read  enable for SSPTDR
input         SSPTXDMACLR;       // TX DMA Clear
input         SSPRXDMACLR;       // RX DMA Clear

output        IntSSPRXD;         // SSPRXD   loop back mode test mux


output        IntTXDMACLR;       // SSPTXDMACLR  test mux output ITIP(4)
output        IntRXDMACLR;       // SSPRXDMACLR  test mux output ITIP(3)

output        IntSSPTXDMASREQ;   // SSPTXDMASREQ test mux output ITOP(13)
output        IntSSPTXDMABREQ;   // SSPTXDMABREQ test mux output ITOP(12)
output        IntSSPRXDMASREQ;   // SSPRXDMASREQ test mux output ITOP(11)
output        IntSSPRXDMABREQ;   // SSPRXDMABREQ test mux output ITOP(10)
output        IntSSPINTR;        // INTR         test mux output ITOP(9)
output        IntSSPTXINTR;      // TXINTR       test mux output ITOP(8)
output        IntSSPRXINTR;      // RXINTR       test mux output ITOP(7)
output        IntSSPRTINTR;      // RTINTR       test mux output ITOP(6)
output        IntSSPRORINTR;     // RORINTR      test mux output ITOP(5)

output        IntSSPFSSOUT;      // FSSOUT       test mux output ITOP(4)
output        IntSSPCLKOUT;      // CLKOUT       test mux output ITOP(3)
output        IntSSPTXD;         // SSPTXD       test mux output ITOP(2)
output        IntnSSPCTLOE;      // SSPCTLOE     test mux output ITOP(1)
output        IntnSSPOE;         // SSPOE        test mux output ITOP(0)

output [4:0]  SSPITOP;           // SSPITOP Register output

output        TESTFIFO;          // SSPTCR Bit 1
output        ITEN;              // SSPTCR Bit 0
output        TestTXFInc;        //  Read pointer increment signal for Tx fifo

// -----------------------------------------------------------------------------
//                               SspTest
//                               =======
// -----------------------------------------------------------------------------
// Overview
// ========
// This module contains the Test mode registers. It performs the following
// functions :

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------

reg [1:0]   SSPTCR; 
// SSP Test Control Register

reg [4:3]   SSPITIP; 
// SSP Integration test input Register

reg [13:0]  iSSPITOP; 
// SSP Integration test output Register

reg [1:0]   NextSSPTCR; 
// D-input of iSSPTCR

reg [4:3]   NextSSPITIP; 
// D-input of SSPITIP

reg [13:0]  NextiSSPITOP; 
// D-input of iSSPITOP

reg delSSPTDRRd;
// delayed version of SSPTDRRd

reg NextdelSSPTDRRd;
// D-input of SSPTDRRd

// TESTFIFO;
// Test Signal to enable writing into Rx fifo and read from Tx fifo
// Test Fifo signal allows data to be written to the Rx fifo and
// read  from the Tx fifo.  When set to 0 the Tx fifo can only be
// written to and the Rx fifo read from.
  
// -----------------------------------------------------------------------------
// Test control signals
// -----------------------------------------------------------------------------

// ITEN;
// Integration test enable. When set to 1, the SSPITIP and
// iSSPITOP registers are used to read/write values to the inputs
// and outputs.
  
// -----------------------------------------------------------------------------
// 
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

assign ITEN      = SSPTCR[0];
assign TESTFIFO  = SSPTCR[1];
assign SSPITOP   = iSSPITOP[4:0];

// -----------------------------------------------------------------------------
// Write interface for Test mode Registers
// -----------------------------------------------------------------------------
always @(SSPTCRWr or PWDATAIn or SSPTCR or SSPITIPWr or SSPITIP or SSPITOPWr or
                 iSSPITOP)
begin : p_Comb
  if (SSPTCRWr)
    NextSSPTCR = PWDATAIn[1:0];
  else
    NextSSPTCR = SSPTCR;

  if (SSPITIPWr)
    NextSSPITIP = PWDATAIn[4:3];
  else
    NextSSPITIP = SSPITIP;

  if (SSPITOPWr)
    NextiSSPITOP = PWDATAIn[13:0];
  else
    NextiSSPITOP = iSSPITOP;
end // p_Comb;

// -----------------------------------------------------------------------------
// Test mode Registers
// -----------------------------------------------------------------------------
always @(posedge PCLK or negedge PRESETn)
begin : p_Seq
  if(~PRESETn)
  begin
    SSPTCR  <= 2'b00;
    SSPITIP <= 2'b00;
    iSSPITOP <= 14'b00000000000000;
  end
  else
  begin
    SSPTCR  <= NextSSPTCR;
    SSPITIP <= NextSSPITIP;
    iSSPITOP <= NextiSSPITOP;
  end
end // p_Seq;

// ---------------------------------------------------------------------
// Generate Read pointer Increment signals for TestFifo
// mode when reading from the Tx fifo.
// ---------------------------------------------------------------------

always @(SSPTCR or SSPTDRRd or delSSPTDRRd)
begin : p_TXTestFptrIncComb
  if (SSPTCR[1])
    NextdelSSPTDRRd = SSPTDRRd;
  else
    NextdelSSPTDRRd = delSSPTDRRd;
end // p_TXTestFptrIncComb;    

always @(posedge PCLK or negedge PRESETn)
begin : p_TXTestFptrIncSeq
  if(~PRESETn)
    delSSPTDRRd <= 1'b0;
  else
    delSSPTDRRd <= NextdelSSPTDRRd;
end // p_TXTestFptrIncSeq;    


assign TestTXFInc = SSPTDRRd & delSSPTDRRd;

// -----------------------------------------------------------------------------
// If the LBM input is asserted, IntSSPRXD is connected to TXD to
// implement loopback, else connected to SSPRXD pad input.
// -----------------------------------------------------------------------------

assign IntSSPRXD  = (LBM == 1'b1) ? TXD : SSPRXD;
               
// --------------------------------------------------------------------
// Intra chip inputs.
// If SSPTCR[0] (Integration test enable bit) is high, the SSPITIP
// register value is used; else the functional mode input is driven on
// the DMACLR signals.
// --------------------------------------------------------------------
 
assign IntTXDMACLR = (SSPTCR[0] == 1'b1) ? SSPITIP[4] : SSPTXDMACLR;

assign IntRXDMACLR = (SSPTCR[0] == 1'b1) ? SSPITIP[3] : SSPRXDMACLR;

// --------------------------------------------------------------------
// Intra chip outputs.
// If SSPTCR[0] ITEN (Integration test enable bit) is high,the iSSPITOP
// register value is used; else the functional mode value is driven
// on to the port.
// --------------------------------------------------------------------

assign IntSSPTXDMASREQ = (SSPTCR[0] == 1'b1) ? iSSPITOP[13] : TXDMASREQ;

assign IntSSPTXDMABREQ = (SSPTCR[0] == 1'b1) ? iSSPITOP[12] : TXDMABREQ;

assign IntSSPRXDMASREQ = (SSPTCR[0] == 1'b1) ? iSSPITOP[11] : RXDMASREQ;

assign IntSSPRXDMABREQ = (SSPTCR[0] == 1'b1) ? iSSPITOP[10] : RXDMABREQ;
  
assign IntSSPINTR      = (SSPTCR[0] == 1'b1) ? iSSPITOP[9]  : INTR;
  
assign IntSSPTXINTR    = (SSPTCR[0] == 1'b1) ? iSSPITOP[8]  : TXMIS;

assign IntSSPRXINTR    = (SSPTCR[0] == 1'b1) ? iSSPITOP[7]  : RXMIS;

assign IntSSPRTINTR    = (SSPTCR[0] == 1'b1) ? iSSPITOP[6]  : RTINTR;
  
assign IntSSPRORINTR   = (SSPTCR[0] == 1'b1) ? iSSPITOP[5]  : RORINTR;

// --------------------------------------------------------------------
// Primary Output Mux
// If SSPTCR[0] ITEN (Integration test enable bit) is high,the iSSPITOP
// register value is used; else the functional mode value is driven
// on to the pin.
// --------------------------------------------------------------------


assign IntnSSPOE       = (SSPTCR[0] == 1'b1) ? iSSPITOP[4] : nOE;

assign IntnSSPCTLOE    = (SSPTCR[0] == 1'b1) ? iSSPITOP[3] : nCTLOE;

assign IntSSPCLKOUT    = (SSPTCR[0] == 1'b1) ? iSSPITOP[2] : CLKOUT;

assign IntSSPFSSOUT    = (SSPTCR[0] == 1'b1) ? iSSPITOP[1] : FSSOUT;

assign IntSSPTXD       = (SSPTCR[0] == 1'b1) ? iSSPITOP[0] : TXD;

endmodule

// --===================================== End ===============================--

