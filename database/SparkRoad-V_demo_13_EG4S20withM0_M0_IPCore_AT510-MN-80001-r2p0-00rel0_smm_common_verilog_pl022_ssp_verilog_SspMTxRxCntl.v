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
//  File Name              : $RCSfile: SspMTxRxCntl.v.rca $S
//  File Revision          : 20350
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------

// Purpose          : This block consists of Master's Transmit/Receive
//                    control state machine.

// --=========================================================================--
  
`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspMTxRxCntl (
// Inputs
                     SSPCLK, 
                     nSSPRST, 
                     DSS, 
                     FRF, 
                     SCR, 
                     SPO, 
                     SPH, 
                     SSESync, 
                     SSPCLKDIV, 
                     TxDataAvlblSync, 
                     TxFRdDataIn, 
                     IntSSPRXD, 
                     MSSync, 
                     NextnSOE, 
                     NextSTXD, 
                     NextSRxFWr, 
                     NxtSTxFRdPtrInc, 
                     NextSTxRxBSY,
                     RNESync,
// Outputs
                     CLKOUT,
                     FSSOUT, 
                     TXD, 
                     nCTLOE, 
                     nOE, 
                     TxFRdPtrInc, 
                     RxFWr, 
                     MRxFWrData,
                     TxRxBSY,
                     MRxRT,
                     IncRxTimeOut 
                    );

// Include Defs file
`include "SspDefs.v"
 
input         SSPCLK;          // Main SSP clock
input         nSSPRST;         // Muxed reset (from nSSPRST)
input   [3:0] DSS;             // Bits per frame
input   [1:0] FRF;             // Frame format
input   [7:0] SCR;             // Serial clock rate
input         SPO;             // SCLK polarity
input         SPH;             // SCLK phase
input         SSESync;         // SSP enable
input         SSPCLKDIV;       // Pre-scaler output
input         TxDataAvlblSync; // Tx data available
input  [15:0] TxFRdDataIn;     // Left justified
input         IntSSPRXD;       // Loopback muxed SSPRXD
input         MSSync;          // Master / Slave Select bit
input         NextnSOE;        // Output enable for TXD in Slave Mode
input         NextSTXD;        // Serial transmit output in Slave Mode
input         NextSRxFWr;      // D-input of Slave's Rx FIFO write enable
input         NxtSTxFRdPtrInc; // D-input of Slave's Tx FIFO read ptr incr.
input         NextSTxRxBSY;    // D-input of Slave's SSP Tx/Rx controller busy
input         RNESync;         // Rx FIFO Not Empty
output        CLKOUT;          // Serial clock
output        FSSOUT;          // Serial frame
output        TXD;             // Serial transmit output
output        nCTLOE;          // Output Enable for SCLK and SFRM
output        nOE;             // Output enable for TXD
output        TxFRdPtrInc;     // Tx FIFO read ptr incr.
output        RxFWr;           // Rx FIFO write enable
output [15:0] MRxFWrData;      // Rx FIFO write data
output        TxRxBSY;         // SSP Tx/Rx controller busy
output        MRxRT;           // Master Rx Reload Timeout counter signal
output        IncRxTimeOut;    // Rx Time Out Counter Enable 
// -------------------------------------------------------------------------
//
//                              SspMTxRxCntl
//                              ============
//
// -------------------------------------------------------------------------
//
// Overview
// ========
//
// This block constitutes the Master's transmit / receive control logic in 
// SSP. Transmit data is first loaded into a 16-bit Transmit Shift Register.
// and bits are shifted out onto the TXD output line (MSBit first). 
// Receive data sampled on the RXDSSIn input is shifted into an internal
// shift register and when a complete frame is received, received data is
// copied into a receive buffer from the shift register. When the last data
// bit is sampled on the RXDSSIn input, it is copied into the Receive
// Buffer along with the contents of the receive shift register. Thus, the
// receive shift register is 15 bits wide and the receive buffer is 16 bits
// wide.
//  Interaction with the Transmit FIFO occurs through the TxFRdPtrInc
// signal. This signal is toggled at the beginning of the frame after the
// transmit data has been copied into the Transmit Shift register. In order
// to ensure that the signal gets synchronised to PCLK and is seen by the
// Transmit FIFO, the signal is kept stable for the duration of the frame. 
// As the frequency of PCLK is equal to or greater than that of SSPCLK, this
// signal is assured to be seen in the PCLK domain. In TI mode, TxFRdPtrInc
// signal gets toggled at the first rising edge of SCLK after the SFRM pulse
// as we are assured that it denotes the start of a new data. In NM mode,
// this signal is toggled when the slave transmits the MSB to master. In SPI
// mode, the signal is toggled at the next edge of SCLK after MSB of a new
// data has been transmitted out.
//  Interaction with the Receive FIFO occurs through the RxFWr signal which
// is also toggled at the instant where the last bit is being received.
//  The BitPeriodCnt counter in this module is an 8-bit down counter that
// is used to time the phase duration of SCLK. This counter is clocked by
// SSPCLK and counts down with every SSPCLKDIV pulse. To time one SCLK
// phase duration, this counter is loaded with the SCR value and when the
// count reaches zero, one SCLK phase duration is said to have elapsed.
// When the Nibmode input is asserted,this counter counts down by 17 (0x11)
// with every SSPCLKDIV pulse. Thus in the nibble mode, the 8-bit counter
// counts down as two 4-bit counters.
//  The BitCnt counter counts the number of bits that have been transmitted
// and received. For the TI Synchronous serial frame format and the
// Motorola SPI frame format, this counter is initially loaded with DSS and
// is decremented by 1 after one bit has been transmitted and received. In
// the National Microwire frame format, this counter is loaded with 7 at
// the start of transmission and is loaded with DSS at the start of
// reception.
//  The nOE output signal is the output enable signal for the TXD
// output.  This signal is meant to drive the output enable pin of the pad
// to which TXD is connected. To account for pad delays, nOE is
// asserted one SCLK phase time  before and after TXD is supposed to be
// valid.
// The synchronised MS signal determines whether the TXD, nOE, RxFWr, 
// TxFRdPtrInc and TxRxBSY signals of master or slave is to be driven out.  

// -----------------------------------------------------------------------------
 
// -----------------------------------------------------------------------------
//
//  Register  declarations
// -----------------------------------------------------------------------------

reg  [5:0] SspMTxRxState;
// Master State Register

reg        TxRxBSY;
// Transmit-receive busy signal

reg        nOE;
// SSP Output Enable signal

reg        TXD;
// SSP TXD signal

reg        CLKOUT;
// SCLK Output signal

reg        FSSOUT;
// SFRM Output signal

reg        TxFRdPtrInc;
// TXFIFO Read Pointer Increment signal

reg        RxFWr;
// RXFIFO Write Pointer Increment signal

reg [15:0] MRxFWrData;
// RXFIFO Write data bus in Master mode

reg  [5:0] SspMTxRxNextState;
// Slave State Register

reg        NextMTxRxBSY;
// TxRxBSY signal in Master mode

reg        NextnMOE;
// nOE signal in Master mode

reg        NextMTXD;
// D-input of TXD signal in Master mode

reg        NextCLKOUT;
// D-input of SCLK output signal 

reg        NextFSSOUT;
// D-input of SFRM Output signal

reg        NextMRxFWr;
// RXFIFO Write signal in Master mode

reg        NxtMTxFRdPtrInc;
// D-input of TXFIFO Read Pointer Increment signal in Master mode

reg [15:0] NextMRxFWrData;
// D-input of RXFIFO Write data bus in Master mode
    
reg  [7:0] BitPeriodCnt;
// Bit Period Counter

reg  [7:0] NextBitPeriodCnt;
// D-input of Bit Period Counter

reg  [3:0] BitCnt;
// BitCounter

reg  [3:0] NextBitCnt;
// D-input of Bit Counter

reg [15:0] TxShft;
// TX Shift Register

reg [15:0] NextTxShft;
// D-input of TX Shift Register

reg [14:0] RxShft;
// RX Shift Register

reg [14:0] NextRxShft;
// D-input of RX Shift Register

reg        nCTLOE;
// SSP Output Enable signal for SCLK and SFRM

reg        DelCLKOUT;
// Delayed version of SCLKOUT signal

reg IncRxTimeOut;
//  Increment Rx TimeOut enable

reg NextIncRxTimeOut;
// D-input of Rx Time Out Counter Enable  

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire       BitPeriodCmp;
// Bit Period Comparator

wire       BitCmpHalf;
// Bit Comparator for half frame

wire       BitCmp;
// Bit Comparator
    
wire       NextnOE;
// D-input of nOE signal

wire       NextTXD;
// D-input of SSP TXD Output signal

wire       NextRxFWr;
// D-input of RXFIFO Write signal

wire       NextTxRxBSY;
// D-input of TxRxBSY signal

wire       NextTxFRdPtrInc;
// D-input of TXFIFO Read Pointer Increment signal

wire SCLKOUTEdgeTrigger;
// Set when it Detects rising edge of SCLKOUT


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Assign Bit Comparator and Bit Period Comparator 
// -----------------------------------------------------------------------------

assign BitPeriodCmp    = (BitPeriodCnt[7:0] == 8'b00000000);
assign BitCmpHalf      = (BitCnt[3:0] == {1'b0,DSS[3:1]});
assign BitCmp          = (BitCnt[3:0] == 4'b0000);
assign NextTXD         = (MSSync == 1'b1) ? NextSTXD        : NextMTXD;
assign NextnOE         = (MSSync == 1'b1) ? NextnSOE        : NextnMOE;
assign NextTxRxBSY     = (MSSync == 1'b1) ? NextSTxRxBSY    : NextMTxRxBSY;
assign NextTxFRdPtrInc = (MSSync == 1'b1) ? NxtSTxFRdPtrInc : NxtMTxFRdPtrInc;
assign NextRxFWr       = (MSSync == 1'b1) ? NextSRxFWr      : NextMRxFWr;
    
// -----------------------------------------------------------------------------
//  Detection of edge on CLKOUT 
// -----------------------------------------------------------------------------
assign SCLKOUTEdgeTrigger = CLKOUT ^ DelCLKOUT;
assign MRxRT = SCLKOUTEdgeTrigger;

// -----------------------------------------------------------------------------
// State transition
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_MSMCSeq
// When nSSPRST is asserted, transition to the `ST_MRESET state and
// wait for the SSP to be enabled.
  if (~nSSPRST) 
    begin
      SspMTxRxState <= `ST_MRESET;
      TxRxBSY       <= 1'b0;
      nOE           <= 1'b1;
      TXD           <= 1'b0;
      CLKOUT        <= 1'b0;
      FSSOUT        <= 1'b1;
      TxFRdPtrInc   <= 1'b0;
      RxFWr         <= 1'b0;
      MRxFWrData    <= 16'h0000;
      IncRxTimeOut  <= 1'b0;
    end
    else
    begin
      SspMTxRxState <= SspMTxRxNextState;
      TxRxBSY       <= NextTxRxBSY;
      nOE           <= NextnOE;
      TXD           <= NextTXD;
      CLKOUT        <= NextCLKOUT;
      FSSOUT        <= NextFSSOUT;
      TxFRdPtrInc   <= NextTxFRdPtrInc;
      RxFWr         <= NextRxFWr;
      MRxFWrData    <= NextMRxFWrData;
      IncRxTimeOut  <= NextIncRxTimeOut;
    end
end // p_MSMCSeq

// -----------------------------------------------------------------------------
// Output and next state logic generation
// -----------------------------------------------------------------------------

always @(SspMTxRxState or MSSync or DSS or FRF or SCR or SPO or 
         SPH or SSESync or TxDataAvlblSync or TxFRdDataIn or IntSSPRXD or 
         SSPCLKDIV or RNESync or BitPeriodCnt or BitCnt or
         TxShft or RxShft or BitPeriodCmp or BitCmpHalf or BitCmp or TxRxBSY or
         nOE or TXD or CLKOUT or FSSOUT or TxFRdPtrInc or RxFWr or MRxFWrData) 
begin
  // Default assignments
  SspMTxRxNextState = SspMTxRxState;
  NextMTxRxBSY      = TxRxBSY;
  NextnMOE          = nOE;
  NextMTXD          = TXD;
  NextCLKOUT        = CLKOUT;
  NextFSSOUT        = FSSOUT;
  NxtMTxFRdPtrInc   = TxFRdPtrInc;
  NextMRxFWr        = RxFWr;
  NextMRxFWrData    = MRxFWrData;
  NextBitPeriodCnt  = BitPeriodCnt;
  NextBitCnt        = BitCnt;
  NextTxShft        = TxShft;
  NextRxShft        = RxShft;
  NextIncRxTimeOut  = 1'b0;

  // If the SSP is disabled, then the state machine should terminate
  // transmission / reception,  initialise the outputs and the 
  // internal variables and transition to the `ST_MRESET state.
        
  if (~SSESync | MSSync) 
    begin
      NextMTxRxBSY      = 1'b0;
      NextnMOE          = 1'b1;
      NextMTXD          = 1'b0;
      NextCLKOUT        = (~FRF[1] & ~FRF[0] & SPO);
      NextFSSOUT        = ~FRF[0];
      NextMRxFWrData    = 16'h0000;
      NextBitPeriodCnt  = 8'b00000000;
      NextBitCnt        = 4'b0000;
      NextTxShft        = 16'b0000000000000000;
      NextRxShft        = 15'b000000000000000;
      SspMTxRxNextState = `ST_MRESET;

  // Rx TimeOut is active when SSP is configured as a slave and enabled.
    if (MSSync & SSESync)
      begin
        if (SSPCLKDIV & BitPeriodCmp & RNESync)
          begin
            NextIncRxTimeOut = 1'b1;
            NextBitPeriodCnt = SCR[7:0];
          end
        else if (SSPCLKDIV & ~BitPeriodCmp)
          NextBitPeriodCnt = BitPeriodCnt - 1;
      end
    end
  else 
    begin
      case (SspMTxRxState)
        // Wait for data to be available in the transmit FIFO provided the
        // frame format is not changed.
        `ST_MTIIDLE : 
           begin
             // Texas Instruments' Synchronous Serial Frame format is no
             // longer the programmed format.
             if (~(~FRF[1] & FRF[0])) 
               begin
                 // National Microwire Frame format selected.
                 if (FRF[1] & ~FRF[0]) 
                   begin
                     // Initialise the outputs to their inactive values.
                     NextMTxRxBSY      = 1'b0;
                     NextnMOE          = 1'b1;
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = 1'b0;
                     NextFSSOUT        = 1'b1;
                     SspMTxRxNextState = `ST_MNMIDLE;
                   end
                 // Motorola SPI Frame format selected.
                 else if (~FRF[1] & ~FRF[0]) 
                   begin
                     // Initialise the outputs to their inactive values.
                        
                     NextMTxRxBSY      = 1'b0;
                     NextnMOE          = 1'b1;
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = SPO;
                     NextFSSOUT        = 1'b1;
                     SspMTxRxNextState = `ST_MSPIIDLE;
                   end
               end
             // Transmit data available in the Transmit FIFO.
             else if (~FRF[1] & FRF[0] & TxDataAvlblSync) 
               begin
                 NextMTxRxBSY = 1'b1;
                 NextnMOE     = 1'b1;
                 // SSPCLKDIV asserted, so start frame now. Load transmit
                 // data into the transmit shift register, initialise
                 // the BitPeriodCnt and BitCnt counters and assert the
                 // TxFRdPtrInc signal for the Transmit FIFO.
                 if (SSPCLKDIV) 
                   begin
                     NextCLKOUT        = 1'b1;
                     NextFSSOUT        = 1'b1;
                     NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                     NextBitPeriodCnt  = SCR[7:0];
                     NextBitCnt        = DSS[3:0];
                     NextTxShft        = TxFRdDataIn[15:0];
                     SspMTxRxNextState = `ST_MTISFRM1;
                   end
                 // SSPCLKDIV is not currently asserted, so wait for the next
                 // SSPCLKDIV pulse.
                 else if (~SSPCLKDIV) 
                     SspMTxRxNextState = `ST_MTIDATAAVLBL;
               end
             else if (SSPCLKDIV & BitPeriodCmp & RNESync)
               begin
                 NextIncRxTimeOut = 1'b1;
                 NextBitPeriodCnt[7:0] = SCR[7:0];
               end
             else if (SSPCLKDIV & ~BitPeriodCmp)
                   NextBitPeriodCnt = BitPeriodCnt - 1;
           end
         
        // Wait for a time duration corresponding to one SCLK phase.
        `ST_MTISFRM2 : 
           begin
             // One phase of SCLK elapsed, so pull SCLK high and SFRM low.
             // Clock out the MSBit of the transmit Shift register into
             // TXD and shift the contents of the shift register left
             // by one bit position. Also, reload the BitPeriodCnt counter.
             if (SSPCLKDIV & BitPeriodCmp & ~BitCmpHalf) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = 1'b1;
                 NextFSSOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextTxShft        = TxShft << 1;
                 SspMTxRxNextState = `ST_MTISHIFT1;
               end
                // One half of the frame has elapsed, so deassert TxFRdPtrInc
                // and RxFWr. Shift out the next Transmit bit and reload the
                // BitPeriodCnt counter.
                else if (SSPCLKDIV & BitPeriodCmp & BitCmpHalf) 
                  begin
                    NextMTXD          = TxShft[15];
                    NextCLKOUT        = 1'b1;
                    NextTxShft        = TxShft << 1;
                    NextBitPeriodCnt  = SCR[7:0];
                    SspMTxRxNextState = `ST_MTISTG2;
                  end
                // Decrement the BitPeriodCnt by 1 on every SSPCLKDIV pulse.
                else if (SSPCLKDIV & ~BitPeriodCmp) 
                  begin
                    NextBitPeriodCnt  = BitPeriodCnt - 1;
                    SspMTxRxNextState = `ST_MTISFRM2;
                  end
           end
        // Wait in this state for a time period corresponding to the high phase
        // of SCLK after a bit has been shifted out onto the TXD line.
        `ST_MTISHIFT1 : 
           begin
             // Time duration, corresponding to the High phase of SCLK after
             // a bit has been shifted out on the TXD line, has elapsed.
             // Sample the IntSSPRXD input and shift it into the Receive
             // shift register. Pull SCLK low and reload BitPeriodCnt.
             // Decrement the BitCnt counter by 1.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b0;
                 NextBitCnt        = BitCnt - 4'b0001;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextRxShft        = {RxShft[13:0],IntSSPRXD};
                 SspMTxRxNextState = `ST_MTISFRM2;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTISHIFT1;
               end
           end
        // Wait for a period of time corresponding to one phase of SCLK.
        `ST_MTISTG2 : 
           begin
             // Time duration, corresponding to the High phase of SCLK after
             // a bit has been shifted out on the TXD line, has elapsed.
             // Sample the IntSSPRXD input and shift it into the Receive
             // shift register. Pull SCLK low and reload BitPeriodCnt.
             // Decrement the BitCnt counter by 1.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextRxShft        = {RxShft[13:0],IntSSPRXD};
                 NextBitCnt        = BitCnt - 4'b0001;
                 SspMTxRxNextState = `ST_MTISHIFT2;
               end
                // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV
                //  pulse.
                else if (SSPCLKDIV & ~BitPeriodCmp) 
                  begin
                    NextBitPeriodCnt  = BitPeriodCnt - 1;
                    SspMTxRxNextState = `ST_MTISTG2;
                end
           end
        // Wait for a period of time corresponding to one SCLK phase.
        `ST_MTISHIFT2 : 
           begin
             // All data bits except the last bit have been 
             // shifted out/sampled.
             if (SSPCLKDIV & BitPeriodCmp & BitCmp) 
               begin
                 // More transmit data is available in the Transmit FIFO, so
                 // generate an SFRM pulse during the last bit of the
                 // previous frame, to signal the beginning of the next data
                 // frame. Shift out the last data bit and load the Transmit
                 // shift register with the next transmit data. Also, reload
                 // the BitCnt counter with DSS and the BitPeriodCnt 
                 // counter with SCR.
                    
                 if (TxDataAvlblSync) 
                   begin
                     NextMTXD          = TxShft[15];
                     NextCLKOUT        = 1'b1;
                     NextFSSOUT        = 1'b1;
                     NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                     NextBitPeriodCnt  = SCR[7:0];
                     NextTxShft        = TxFRdDataIn[15:0];
                     NextBitCnt        = DSS[3:0];
                     SspMTxRxNextState = `ST_MTITXFNE;
                   end
                 // No more transmit data available in the transmit FIFO, so
                 // keep SFRM unchanged (low) and shift out the last Transmit
                 // bit onto the TXD line.
                 else if (~TxDataAvlblSync) 
                   begin
                     NextMTXD          = TxShft[15];
                     NextCLKOUT        = 1'b1;
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MTILASTBIT;
                   end
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTISHIFT2;
               end
             // One phase of SCLK elapsed, so pull SCLK high and SFRM low.
             // Clock out the MSBit of the transmit Shift register into
             // TXD and shift the contents of the shift register left
             // by one bit position. Also, reload the BitPeriodCnt counter.
             else if (SSPCLKDIV & BitPeriodCmp & ~BitCmp) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextTxShft        = TxShft << 1;
                 SspMTxRxNextState = `ST_MTISTG2;
               end
           end

        // Wait for the first SCLK phase time after SCLK has been pulled low
        // for the last time.
        `ST_MTISSPOE1 : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTISSPOE1;
               end

              // Reload the BitPeriodCnt counter to wait for one more
              // SCLK phase time.
              else if (SSPCLKDIV & BitPeriodCmp) 
                begin
                  NextBitPeriodCnt  = SCR[7:0];
                  SspMTxRxNextState = `ST_MTISSPOE2;
                end
           end

        // Transmit the last data bit.
        `ST_MTILASTBIT : 
           begin
             // Pull SCLK low and then wait for one SCLK period i.e. 2 SCLK
             // phase times before deasserting nOE.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b0;
                 NextMRxFWr        = ~RxFWr;
                 NextMRxFWrData    = {RxShft[14:0],IntSSPRXD};
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MTISSPOE1;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                  NextBitPeriodCnt  = BitPeriodCnt - 1;
                  SspMTxRxNextState = `ST_MTILASTBIT;
               end
           end
  
        // While in this state, wait for a time duration corresponding to the
        // high phase of SCLK after the last bit of the previous frame has been 
        // shifted out.
        `ST_MTITXFNE : 
           begin
             // Sample the last Rx data bit and load the sampled bit and the
             // contents of the Receive shift register into the Receive
             // buffer. Clear the receive shift register and assert the
             // RxFWr write enable output to the receive FIFO.
                
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMRxFWr        = ~RxFWr;
                 NextMRxFWrData    = {RxShft[14:0],IntSSPRXD};
                 NextRxShft        = 15'b000000000000000;

                 // Reload the BitPeriodCnt counter and pull SCLK low for the
                 // second SCLK phase during which SFRM is to be pulled high.
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MTISFRM2;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTITXFNE;
               end
            end

        // Stay in this state for the first SCLK phase during which SFRM is
        // to be driven high.
        `ST_MTISFRM1 : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTISFRM1;
               end
             // The BitPeriodCnt counter has counted down to 0 i.e. one half
             // period of SCLK has elapsed. Assert nOE one half SCLK
             // earlier than the time at which TXD is supposed to be
             // driven with valid data. This is done to account for pad
             // delays.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextnMOE       = 1'b0;

                 // Reload the BitPeriodCnt counter and pull SCLK low for the
                 // second SCLK phase during which SFRM is to be pulled high.
                 NextCLKOUT       = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MTISFRM2;
               end
           end

        // Transmit Data is available in the transmit FIFO. Wait for the next
        // pulse on SSPCLKDIV to start the frame.
        `ST_MTIDATAAVLBL : 
           begin
             // SSPCLKDIV asserted, so start frame now. Load transmit
             // data into the transmit shift register, initialise
             // the BitPeriodCnt and BitCnt counters and assert the
             // TxFRdPtrInc signal for the Transmit FIFO.
                
             if (SSPCLKDIV) 
               begin
                 NextCLKOUT        = 1'b1;
                 NextFSSOUT        = 1'b1;
                 NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = DSS[3:0];
                 NextTxShft        = TxFRdDataIn[15:0];
                 SspMTxRxNextState = `ST_MTISFRM1;
               end
           end
        // Wait for one last SCLK phase time before de-asserting nOE.
        `ST_MTISSPOE2 : 
           begin
             // De-assert nOE and return to idle state.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMTxRxBSY     = 1'b0;
                 NextnMOE         = 1'b1;
                NextBitPeriodCnt  = SCR[7:0];
                SspMTxRxNextState = `ST_MTIIDLE;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV
             //  pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MTISSPOE2;
               end
           end

        // Wait for data to be available in the transmit FIFO provided the
        // frame format is not changed.
        `ST_MNMIDLE : 
           begin
             // National Microwire frame format is no longer the programmed
             // frame format.
             if (~(FRF[1] & ~FRF[0])) 
               begin
                 // Motorola SPI Frame format selected.
                 if (~FRF[1] & ~FRF[0]) 
                   begin
                     // Initialise the outputs to their inactive values.
                     NextMTxRxBSY      = 1'b0;
                     NextnMOE          = 1'b1;
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = SPO;
                     NextFSSOUT        = 1'b1;
                     SspMTxRxNextState = `ST_MSPIIDLE;
                   end
                 // Texas Instruments' Synchronous Serial frame format
                 // selected.
                 else if (~FRF[1] & FRF[0]) 
                   begin
                     // Initialise the outputs to their inactive values.
                     NextMTxRxBSY      = 1'b0;
                     NextnMOE          = 1'b1;
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = 1'b0;
                     NextFSSOUT        = 1'b0;
                     SspMTxRxNextState = `ST_MTIIDLE;
                   end
               end

               // Transmit Data available in the transmit FIFO.
               else if (FRF[1] & ~FRF[0] & TxDataAvlblSync) 
                 begin
                   NextMTxRxBSY = 1'b1;
                   // SSPCLKDIV is not currently asserted, so wait for the next
                   // SSPCLKDIV pulse.
                   if (~SSPCLKDIV) 
                       SspMTxRxNextState = `ST_MNMDATAAVLBL;

                   // SSPCLKDIV asserted, so start frame now. Load transmit
                   // data into the transmit shift register, initialise
                   // the BitPeriodCnt and BitCnt counters and assert the
                   // TxFRdPtrInc signal for the Transmit FIFO.
                   else if (SSPCLKDIV) 
                     begin
                       NextnMOE          = 1'b0;
                       NextFSSOUT        = 1'b0;
                       NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                       NextBitPeriodCnt  = SCR[7:0];
                       NextTxShft        = TxFRdDataIn[15:0];
                       NextRxShft        = 15'b000000000000000;
                       SspMTxRxNextState = `ST_MNMSFRM;
                     end
                 end
               else if (SSPCLKDIV & BitPeriodCmp & RNESync)
                 begin
                   NextIncRxTimeOut = 1'b1;
                   NextBitPeriodCnt = SCR[7:0];
                 end
               else if (SSPCLKDIV & ~BitPeriodCmp)
                  NextBitPeriodCnt  = BitPeriodCnt - 1;
           end

        `ST_MNMDATAAVLBL : 
           begin
             // SSPCLKDIV asserted, so start frame now. Load transmit
             // data into the transmit shift register, initialise
             // the BitPeriodCnt and BitCnt counters and assert the
             // TxFRdPtrInc signal for the Transmit FIFO.
             if (SSPCLKDIV) 
               begin
                 NextnMOE          = 1'b0;
                 NextFSSOUT        = 1'b0;
                 NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextTxShft        = TxFRdDataIn[15:0];
                 NextRxShft        = 15'b000000000000000;
                 SspMTxRxNextState = `ST_MNMSFRM;
               end
           end
        // Stay in this state for the first state of SCLK.
        `ST_MNMSFRM : 
           begin
             // One SCLK phase elapsed after SFRM was first asserted. Shift
             // out the MSBit of the transmit data onto the TXD line
             // and shift the transmit shift register left by one bit
             // position.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMTXD   = TxShft[15];
                 NextTxShft = TxShft << 1;
                    
                 // Load 7 into the BitCnt counter because the transmit data
                 // size is always 8 bits in this frame format.
                    
                 NextCLKOUT       = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = 4'b0111;
                 SspMTxRxNextState = `ST_MNMTXBIT;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMSFRM;
               end
           end

        // Wait for a time duration corresponding to one phase of SCLK.
        `ST_MNMTXBIT : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMTXBIT;
               end

             // Pull CLKOUT high and reload the BitPeriodCnt counter.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MNMTXBIT2;
               end
           end
  
        // Wait for a time duration corresponding to one phase of SCLK.
        `ST_MNMTXBIT2 : 
           begin
             // Clock out the MSBit from the Transmit shift register onto
             // the TXD output line and shift the contents of the
             // Transmit shift register left by one bit position.
             if (SSPCLKDIV & BitPeriodCmp & ~BitCmp) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = BitCnt - 4'b0001;
                 NextTxShft        = TxShft << 1;
                 SspMTxRxNextState = `ST_MNMTXBIT;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMTXBIT2;
               end

             // All bits in the transmit data have been shifted out.
             else if (SSPCLKDIV & BitPeriodCmp & BitCmp) 
               begin
                 NextMTXD          = 1'b0;
                 // Pull SCLK low and reload the BitPeriodCnt counter.
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MNMWAIT1;
               end
           end

        // Wait for a time duration corresponding to one phase time of CLKOUT.
        `ST_MNMWAIT1 : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMWAIT1;
               end
             // De-assert nOE, pull SCLK high and reload the BitPeriodCnt
             // counter.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextnMOE             = 1'b1;
                 NextCLKOUT           = 1'b1;
                 NextBitPeriodCnt     = SCR[7:0];
                 SspMTxRxNextState    = `ST_MNMWAIT2;
               end
           end

        // Wait for a time duration corresponding to one phase of SCLK.
        `ST_MNMWAIT2 : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMWAIT2;
               end
             // One SCLK wait period completed between transmission and 
             // reception. De-assert TxFRdPrtInc and RxFWr output signals.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 // Clear the Receive shift register to start reception. Load
                 // the BitCnt counter with DSS and the BitPeriodCnt counter
                 // with SCR.
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = DSS[3:0];
                 NextRxShft        = 15'b000000000000000;
                 SspMTxRxNextState = `ST_MNMRX1;
               end
           end
        // Wait for a time duration corresponding to one SCLK phase.
        `ST_MNMRX1 : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMRX1;
               end

             // Sample the next bit on the IntSSPRXD line and shift it into
             // the receive shift register.
             else if (SSPCLKDIV & BitPeriodCmp & ~BitCmp) 
               begin
                 NextCLKOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextRxShft        = {RxShft[13:0],IntSSPRXD};
                 SspMTxRxNextState = `ST_MNMRX2;
               end

             // Sample the last bit on the IntSSPRXD input and load it into
             // the Receive buffer along with the contents of the Receive
             // shift register.
             else if (SSPCLKDIV & BitPeriodCmp & BitCmp) 
               begin
                 NextCLKOUT     = 1'b1;
                 NextMRxFWr     = ~RxFWr;
                 NextMRxFWrData = {RxShft[14:0],IntSSPRXD};

                 // No more data available for transmission.
                 if (~TxDataAvlblSync) 
                   begin
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MNMRXLAST;
                   end

                 // More transmit data is available in the Transmit FIFO, so
                 // reload the BitPeriodCnt counter with SCR.
                 else if (TxDataAvlblSync) 
                   begin
                     NextnMOE          = 1'b0;
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MNMTXFNE;
                   end
               end
           end

        // Wait for a time duration corresponding to one CLKOUT phase.
        `ST_MNMRX2 : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMRX2;
               end

             // Toggle CLKOUT and reload the BitPeriodCnt counter.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = BitCnt - 4'b0001;
                 SspMTxRxNextState = `ST_MNMRX1;
               end
           end

        // Wait for a period of time corresponding to one SCLK phase.
        `ST_MNMSFRMLAST : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMSFRMLAST;
               end

             // End of frame reached.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 // End of Frame reached, so pull SFRM high.
                 NextMTxRxBSY      = 1'b0;
                 NextFSSOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MNMIDLE;
               end
           end

        // Wait for a time duration corresponding to one CLKOUT phase.
        `ST_MNMRXLAST : 
           begin
             // Pull SCLK low and reload the BitPeriodCnt counter.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MNMSFRMLAST;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMRXLAST;
                end
           end

        // Wait for one SCLK phase time before shifting out the next transmit
        // data.
        `ST_MNMTXFNE : 
           begin
             // Clock out the MSBit of the next transmit data onto the TXD
             // line. Load the transmit shift register with the remaining 15
             // bits in the transmit data appended with a 0.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMTXD          = TxFRdDataIn[15];
                 NxtMTxFRdPtrInc    = ~TxFRdPtrInc;
                 NextTxShft        = {TxFRdDataIn[14:0],1'b0};
                 // Load 7 into the BitCnt counter because the transmit data
                 // size is always 8 bits in this frame format.
                 NextCLKOUT        = 1'b0;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = 4'b0111;
                 SspMTxRxNextState = `ST_MNMTXBIT;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MNMTXFNE;
               end
           end

        // Wait for data to be available in the transmit FIFO provided the
        // frame format is not changed.
        `ST_MSPIIDLE : 
           begin
             // Motorola's SPI Frame Format is no longer the programmed frame
             // format.
             if (~(~FRF[1] & ~FRF[0])) 
               begin
                 // Texas Instruments' Synchronous Serial Frame format
                 // selected.
                 if (~FRF[1] & FRF[0]) 
                   begin
                     // Initialise the outputs to their inactive values.
                     NextMTxRxBSY      = 1'b0;
                     NextnMOE          = 1'b1;
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = 1'b0;
                     NextFSSOUT        = 1'b0;
                     SspMTxRxNextState = `ST_MTIIDLE;
                   end
                 // National Microwire Frame format selected.
                 else if (FRF[1] & ~FRF[0]) 
                   begin
                   // Initialise the outputs to their inactive values.
                        NextMTxRxBSY      = 1'b0;
                        NextnMOE          = 1'b1;
                        NextMTXD          = 1'b0;
                        NextCLKOUT        = 1'b0;
                        NextFSSOUT        = 1'b1;
                        SspMTxRxNextState = `ST_MNMIDLE;
                    end
               end
             // Transmit data available in the Transmit FIFO.
           else if (~FRF[1] & ~FRF[0] & TxDataAvlblSync) 
             begin
               NextMTxRxBSY = 1'b1;
               // SSPCLKDIV is not currently asserted, so wait for the next
               // SSPCLKDIV pulse.
               if (~SSPCLKDIV) 
                   SspMTxRxNextState = `ST_MSPIDATAAVLBL;
               // SSPCLKDIV asserted, so start frame now. Load transmit
               // data into the transmit shift register, initialise
               // the BitPeriodCnt and BitCnt counters and assert the
               // TxFRdPtrInc signal for the Transmit FIFO.
               else if (SSPCLKDIV) 
                 begin
                   NextnMOE          = 1'b0;
                   NextFSSOUT        = 1'b0;
                   NxtMTxFRdPtrInc   = ~TxFRdPtrInc;
                   NextBitPeriodCnt  = SCR[7:0];
                   NextBitCnt        = DSS[3:0];
                   NextTxShft        = TxFRdDataIn[15:0];
                   NextRxShft        = 15'b000000000000000;
                   SspMTxRxNextState = `ST_MSPISFRM;
                 end
             end
             else if (SSPCLKDIV & BitPeriodCmp & RNESync)
               begin
                 NextIncRxTimeOut = 1'b1;
                 NextBitPeriodCnt = SCR[7:0];
               end
             else if (SSPCLKDIV & ~BitPeriodCmp)
                 NextBitPeriodCnt = BitPeriodCnt - 1;
           end

        // Transmit Data is available in the transmit FIFO. Wait for the next
        // pulse on SSPCLKDIV to start the frame.
        `ST_MSPIDATAAVLBL : 
           begin
             // SSPCLKDIV asserted, so start frame now. Load transmit
             // data into the transmit shift register, initialise
             // the BitPeriodCnt and BitCnt counters and assert the
             // TxFRdPtrInc signal for the Transmit FIFO.
             if (SSPCLKDIV) begin
                 NextnMOE          = 1'b0;
                 NextFSSOUT        = 1'b0;
                 NxtMTxFRdPtrInc   = ~TxFRdPtrInc;
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = DSS[3:0];
                 NextTxShft        = TxFRdDataIn[15:0];
                 NextRxShft        = 15'b000000000000000;
                 SspMTxRxNextState = `ST_MSPISFRM;
               end
           end

        // Stay in this state for the first phase of SCLK.
        `ST_MSPISFRM : 
           begin
             // One SCLK phase elapsed after SFRM was first asserted.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMTXD = TxShft[15];
                 NextTxShft  = TxShft << 1;
                 // Drive the XOR of SPO and SPH on the SCLK line.
                 // Shift the Transmit shift register left by one bit 
                 // position and reload the BitPeriodCnt counter
                 // with SCR.
                 NextCLKOUT       = (SPO ^ SPH);
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPITX1;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPISFRM;
               end
           end

        // Wait for an CLKOUT phase after shifting out a bit onto the
        // TXD line.
        `ST_MSPITX1 : 
           begin
             // Sample IntSSPRXD and shift the sampled data bit into the
             // receive shift register. Toggle CLKOUT and decrement the
             // BitCnt counter by 1.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = (~(SPO ^ SPH));
                 NextRxShft        = {RxShft[13:0],IntSSPRXD};
                 NextBitPeriodCnt  = SCR[7:0];
                 NextBitCnt        = BitCnt - 4'b0001;
                 SspMTxRxNextState = `ST_MSPIRX1;
               end

             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPITX1;
               end
           end
        // Wait for an CLKOUT phase after sampling one bit on the IntSSPRXD
        // input line.
        `ST_MSPIRX1 : 
           begin
             // One half phase of SCLK elapsed, so toggle SCLK.
             // Clock out the MSBit of the transmit Shift register into
             // TXD and shift the contents of the shift register left by
             // one bit position. Also, reload the BitPeriodCnt
             // counter.
             if (SSPCLKDIV & BitPeriodCmp & ~BitCmpHalf) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = (SPO ^ SPH);
                 NextTxShft        = TxShft << 1;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPITX1;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPIRX1;
               end

             // One half of the frame has elapsed, so deassert TxFRdPtrInc
             // and RxFWr. Shift out the next Transmit bit and reload the
             // BitPeriodCnt counter.
             else if (SSPCLKDIV & BitPeriodCmp & BitCmpHalf) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = (SPO ^ SPH);
                 NextBitPeriodCnt  = SCR[7:0];
                 NextTxShft        = TxShft << 1;
                 SspMTxRxNextState = `ST_MSPITX2;
               end
           end

        // Wait for an CLKOUT phase after shifting out a bit onto the
        // TXD line.
        `ST_MSPITX2 : 
           begin
             // Sample IntSSPRXD and shift the sampled data bit into the
             // receive shift register. Toggle SCLK and decrement the
             // BitCnt counter by 1.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = (~(SPO ^ SPH));
                 NextBitPeriodCnt  = SCR[7:0];
                 NextRxShft        = {RxShft[13:0],IntSSPRXD};
                 NextBitCnt        = BitCnt - 4'b0001;
                 SspMTxRxNextState = `ST_MSPIRX2;
               end

             // Decrement the BitPeriodCnt counter by 1 on every
             // SSPCLKDIV pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPITX2;
               end
           end

        // Wait for an CLKOUT phase after sampling one bit on the IntSSPRXD
        // input line.
        `ST_MSPIRX2 : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPIRX2;
               end
             // One half phase of SCLK elapsed, so toggle SCLK.
             // Clock out the MSBit of the transmit Shift register into
             // TXD and shift the contents of the shift register left
             // by one bit position. Also, reload the BitPeriodCnt
             // counter.
             else if (SSPCLKDIV & BitPeriodCmp & ~BitCmp) 
               begin
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = (SPO ^ SPH);
                 NextBitPeriodCnt  = SCR[7:0];
                 NextTxShft        = TxShft << 1;
                 SspMTxRxNextState = `ST_MSPITX2;
               end
             else if (SSPCLKDIV & BitPeriodCmp & BitCmp) 
               begin
                 // Shift out the last bit onto the TXD line.
                 NextMTXD          = TxShft[15];
                 NextCLKOUT        = (SPO ^ SPH);
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPILASTTX;
               end
           end

        // Wait for one CLKOUT phase before pulling SFRM high again.
        `ST_MSPISFRMEND : 
           begin
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPISFRMEND;
               end
             // End of frame reached, so pull SFRM high and de-assert
             // TxFRdPtrInc and RxFWr.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextMTxRxBSY      = 1'b0;
                 NextnMOE          = 1'b1;
                 NextFSSOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPIIDLE;
               end
           end

        // Wait for a time duration corresponding to the SCLK phase
        // after the last Tx bit has been shifted out.
        `ST_MSPILASTTX : 
           begin
             // Sample the last Rx bit from the SSPRXD input and clock it
             // into the receive buffer along with the contents of the
             // receive shift register.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = (~(SPO ^ SPH));
                 NextMRxFWr        = ~RxFWr;
                 NextMRxFWrData    = {RxShft[14:0],IntSSPRXD};
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPILASTRX;
               end
             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPILASTTX;
               end
           end

        // Wait for a time duration corresponding to one CLKOUT phase duration
        // after the last Rx bit has been sampled from SSPRXD.
        `ST_MSPILASTRX : 
           begin
             // All bits shifted out/sampled.
             if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 // No more transmit data available, so set TXD and
                 // SCLK to their default values.
                 if (~TxDataAvlblSync) 
                   begin
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = SPO;
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MSPISFRMEND;
                   end

                 // More transmit data available in the Transmit FIFO
                 // and SPH is programmed to a value of 0,
                 // so deassert SFRM for one SCLK phase time.
                 else if (TxDataAvlblSync & ~SPH) 
                   begin
                     NextMTXD          = 1'b0;
                     NextCLKOUT        = SPO;
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MSPISD1;
                   end

                 // More transmit data available in the Transmit FIFO
                 // and the value of SPH is programmed to 1,
                 // so clock in the MSBit of Transmit data onto the TXDSS
                 // line and load the shift register with the next 15 bits
                 // in the Transmit Data, appended with a 0. SFRM
                 // does not need to be de-asserted between 
                 // successive data characters.
                 else if (TxDataAvlblSync & SPH) 
                   begin
                     NextMTXD        = TxFRdDataIn[15];
                     NxtMTxFRdPtrInc = ~TxFRdPtrInc;
                     NextTxShft      = {TxFRdDataIn[14:0],1'b0};
                     NextBitCnt      = DSS[3:0];
                     NextRxShft      = 15'b000000000000000;

                     // Drive the XOR of SPO and SPH on the SCLK line.
                     // Shift the Transmit shift register left by one bit 
                     // position and reload the BitPeriodCnt counter
                     // with SCR.
                     NextCLKOUT        = (SPO ^ SPH);
                     NextBitPeriodCnt  = SCR[7:0];
                     SspMTxRxNextState = `ST_MSPITX1;
                   end
               end

             // Decrement the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             else if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPILASTRX;
               end
           end

        `ST_MSPISD1 : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPISD1;
               end

             // After one SCLK phase time, de-assert SFRM and pull
             // SCLK to its inactive level.
             else if (SSPCLKDIV & BitPeriodCmp) 
               begin
                 NextCLKOUT        = SPO;
                 NextFSSOUT        = 1'b1;
                 NextBitPeriodCnt  = SCR[7:0];
                 SspMTxRxNextState = `ST_MSPISD2;
               end
           end

        `ST_MSPISD2 : 
           begin
             // Decrement  the BitPeriodCnt counter by 1 on every SSPCLKDIV 
             // pulse.
             if (SSPCLKDIV & ~BitPeriodCmp) 
               begin
                 NextBitPeriodCnt  = BitPeriodCnt - 1;
                 SspMTxRxNextState = `ST_MSPISD2;
               end
             else if (BitPeriodCmp) 
               begin
                 // SSPCLKDIV is not currently asserted, so wait for the next
                 // SSPCLKDIV pulse.
                 if (~SSPCLKDIV) 
                   begin
                     SspMTxRxNextState = `ST_MSPIDATAAVLBL;
                   end
                 // SSPCLKDIV asserted, so start frame now. Load transmit
                 // data into the transmit shift register, initialise
                 // the BitPeriodCnt and BitCnt counters and assert the
                 // TxFRdPtrInc signal for the Transmit FIFO.
                 else if (SSPCLKDIV) begin
                     NextnMOE          = 1'b0;
                     NextFSSOUT        = 1'b0;
                     NxtMTxFRdPtrInc   = ~TxFRdPtrInc;
                     NextBitPeriodCnt  = SCR[7:0];
                     NextBitCnt        = DSS[3:0];
                     NextTxShft        = TxFRdDataIn[15:0];
                     NextRxShft        = 15'b000000000000000;
                     SspMTxRxNextState = `ST_MSPISFRM;
                   end
               end
           end

        `ST_MRESET : 
           begin
             // Texas Instruments' Synchronous Serial frame format
             // selected and the SSP is enabled.
             if (~FRF[1] & FRF[0] & SSESync) begin
                 // Initialise the outputs to their inactive values.
                 NextMTxRxBSY      = 1'b0;
                 NextnMOE          = 1'b1;
                 NextMTXD          = 1'b0;
                 NextCLKOUT        = 1'b0;
                 NextFSSOUT        = 1'b0;
                 SspMTxRxNextState = `ST_MTIIDLE;
               end

             // Motorola SPI Frame format selected and the SSP is enabled.
             else if (~FRF[1] & ~FRF[0] & SSESync) begin
                 // Initialise the outputs to their inactive values.
                 NextMTxRxBSY      = 1'b0;
                 NextnMOE          = 1'b1;
                 NextMTXD          = 1'b0;
                 NextCLKOUT        = SPO;
                 NextFSSOUT        = 1'b1;
                 SspMTxRxNextState = `ST_MSPIIDLE;
               end

             // National Microwire Frame format selected and the
             // SSP is enabled.
             else if (FRF[1] & ~FRF[0] & SSESync) begin
                 // Initialise the outputs to their inactive values.
                 NextMTxRxBSY      = 1'b0;
                 NextnMOE          = 1'b1;
                 NextMTXD          = 1'b0;
                 NextCLKOUT        = 1'b0;
                 NextFSSOUT        = 1'b1;
                 SspMTxRxNextState = `ST_MNMIDLE;
               end
           end
        default : 
          begin
            NextMTxRxBSY      = 1'b0;
            NextnMOE          = 1'b1;
            NextMTXD          = 1'b0;
            NextCLKOUT        = 1'b0;
            NextFSSOUT        = 1'b1;
            NextMRxFWrData    = 16'h0000;
            SspMTxRxNextState = `ST_MRESET;
            NextBitPeriodCnt  = 8'b00000000;
            NextIncRxTimeOut  = 1'b0;
            NxtMTxFRdPtrInc   = 1'b0;
            NextMRxFWr        = 1'b0;
            NextBitCnt        = 4'b0000;
            NextTxShft        = 16'h0000;
            NextRxShft        = 15'h0000;
          end
      endcase
    end
end // p_MSMCComb

// -----------------------------------------------------------------------------
// nCTLOE Flip-flop  
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_nCTLOESeq
  // When nSSPRST is asserted, transition to the `ST_MRESET state and
  // wait for the SSP to be enabled.
  if (~nSSPRST) 
      nCTLOE <= 1'b0;
  else 
      nCTLOE <= MSSync;
end // p_nCTLOESeq

// -----------------------------------------------------------------------------
// Bit Period Counter 
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_BitPeriodCntSeq
  // When nSSPRST is asserted, transition to the `ST_MRESET state and
  // wait for the SSP to be enabled.
  if (~nSSPRST) 
      BitPeriodCnt <= 8'b00000000;
  else
      BitPeriodCnt <= NextBitPeriodCnt;
end // p_BitPeriodCntSeq

// -----------------------------------------------------------------------------
// Bit Counter 
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_BitCntSeq
  // When nSSPRST is asserted, transition to the `ST_MRESET state and
  // wait for the SSP to be enabled.
  if (~nSSPRST) 
      BitCnt <= 4'b0000;
  else
      BitCnt <= NextBitCnt;
end // p_BitCntSeq

// -----------------------------------------------------------------------------
// Transmit Shift Register 
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_TxShftSeq
  // When nSSPRST is asserted, transition to the `ST_MRESET state and
  // wait for the SSP to be enabled.
        
  if (~nSSPRST) 
      TxShft <= 16'b0000000000000000;
  else
      TxShft <= NextTxShft;
end // p_TxShftSeq

// -----------------------------------------------------------------------------
// Receive Shift Register 
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_RxShftSeq
  // When nSSPRST is asserted, transition to the `ST_MRESET state and
  // wait for the SSP to be enabled.
  if (~nSSPRST) 
      RxShft <= 15'b000000000000000;
  else 
      RxShft <= NextRxShft;
end // p_RxShftSeq

// -----------------------------------------------------------------------------
// Delayed version of CLKOUT signal
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST) 
begin : p_DelCLKOUTSeq 
  if (~nSSPRST)
    DelCLKOUT <= 1'b0; 
  else
    DelCLKOUT <= CLKOUT;
end // p_DelCLKOUTSeq;


endmodule
// --============================ End ========================================--
