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
//  File Name              : $RCSfile: SspScaleCntr.v.rca $S
//  File Revision          : 20357
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
// -----------------------------------------------------------------------------
  
// -----------------------------------------------------------------------------

// Purpose      : This module divides the input SSPCLK by a programmable
//                prescale factor. It also implements the SSPCLK-domain 
//                buffers of the 2-buffer synchronisation mechanism.

// --=========================================================================--

`timescale 1ns/1ps

// -----------------------------------------------------------------------------

module SspScaleCntr (
// Inputs
                     SSPCLK, 
                     nSSPRST, 
                     SSESync, 
                     CR0UpdateSync, 
                     CPSRUpdateSync,
                     SSPCR0, 
                     SSPCPSR, 
// Outputs
                     SSPCLKDIV,
                     SPO, 
                     SPH, 
                     DSS, 
                     FRF, 
                     SCR 
                    );
// Inputs
input        SSPCLK;         // Main SSP clock
input        nSSPRST;        // Muxed reset (from nSSPRST)
input        SSESync;        // SSP enable
input        CR0UpdateSync;  // SSCR0 update
input        CPSRUpdateSync; // SSCPSR update
input [15:0] SSPCR0;         // 2nd buffer
input  [7:1] SSPCPSR;        // 2nd buffer
// Outputs
output       SSPCLKDIV;      // Prescaled output
output       SPO;            // SCLK polarity
output       SPH;            // SCLK phase
output [3:0] DSS;            // Bits per frame
output [1:0] FRF;            // Frame format
output [7:0] SCR;            // Serial clock rate

// -----------------------------------------------------------------------------
//
//                            SspScaleCntr
//                            ============
//
// -----------------------------------------------------------------------------
//
// Overview
// ========
//
//  The prescaling counter provides flexibility to accomodate different input
// clock frequencies in order to provide the same range of baud rates. A 
// programmable internal counter generates the SSPCLKDIV signal. This counter
// has one half of the value written into the SSCPSR register as its reload
// value and counts down upto 1.
//  This module also contains the SSPCLK domain buffers of the SSP control
// registers. The distinct bit information from these buffers is separated out
// and driven as individual outputs.
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------
reg  [6:0] SSPCPSC;          
// SSP Clock Pre-Scale Counter

reg  [6:0] NextSSPCPSC;        
// D-input of SSPCPSC

reg [15:0] CR0;      
// Second stage buffer for SSCR0

reg [15:0] NextCR0;  
// D-input of CR0

reg  [7:1] CPSR;     
// Second stage buffer for SSCPSR

reg  [7:1] NextCPSR; 
// D-input of CPSR

reg        DelCR0Update;
// Delayed version of CR0UpdateSync

reg        DelCPSRUpdate;
// Delayed version of CPSRUpdateSync

// -----------------------------------------------------------------------------
// Wire declarations
// -----------------------------------------------------------------------------
wire       CR0Stg2WrEn;
// Load signal for the second stage buffer for SSPCR0

wire       CPSRStg2WrEn;
// Load signal for the second stage buffer for SSPCPSR register

// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Prescaler to divide SSPCLK by the value programmed in SSCPSR register
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST)
begin : p_CntSeq
  if (nSSPRST == 1'b0)  
    SSPCPSC   <= 7'b0000000; 
  else 
    SSPCPSC <= NextSSPCPSC;
end //  p_CntSeq

// -----------------------------------------------------------------------------
//  Prescaler to divide SSPCLK by the value programmed in SSCPSR register. The
// counter is reloaded with the value in the SSCPSRBuf3 register when any of
// the following conditions occur:
//  * When the counter counts down and reaches the value of "0001"
//  * When the SSP is disabled (so that on enabling the SSP, the counter starts
//    counting down from the reload value)
//
//  When the CPSR register is rewritten, i.e. when then reload value is changed,
// the counter continues counting down and after reaching the count of "0001",
// new reload value is loaded into the counter. Thus, there is a maximum
// possible latency of 15 SSPCLK cycles before the new reload value takes
// full effect after the second stage buffer has been updated.
// -----------------------------------------------------------------------------
always @(SSPCPSC or  CPSR or SSESync)
begin : p_CntComb
  if ((SSESync == 1'b0) || (SSPCPSC == 7'b0000001)) 
    NextSSPCPSC = CPSR;
  else 
      NextSSPCPSC = (SSPCPSC - 7'b0000001);
end // p_CntComb

// -----------------------------------------------------------------------------
// When the SSPCPSC counter reaches 1, assert the SSPCLKDIV signal.
// -----------------------------------------------------------------------------
assign SSPCLKDIV = (SSPCPSC == 7'b0000001);

// -----------------------------------------------------------------------------
// Second stage buffers for the SSPCR0 and SSPCPSR registers 
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST)
begin : p_RegSeq
  if (nSSPRST == 1'b0) 
    begin
      CR0  <= 16'h0000;
      CPSR <= 7'b0000000;
    end
  else 
    begin
      CR0  <= NextCR0;
      CPSR <= NextCPSR;
    end 
end // p_RegSeq

// -----------------------------------------------------------------------------
// Generation of delayed versions of the Update trigger inputs.
// -----------------------------------------------------------------------------
always @(posedge SSPCLK or negedge nSSPRST)
begin : p_TriggerDel
  if (nSSPRST == 1'b0)
    begin
      DelCR0Update  <= 1'b0;
      DelCPSRUpdate <= 1'b0;
    end
  else
    begin
      DelCR0Update  <= CR0UpdateSync;
      DelCPSRUpdate <= CPSRUpdateSync;
    end
end // p_TriggerDel;

// -----------------------------------------------------------------------------
// Generation of load signals for second stage buffers.
// -----------------------------------------------------------------------------
assign CR0Stg2WrEn  = CR0UpdateSync ^ DelCR0Update;
assign CPSRStg2WrEn = CPSRUpdateSync ^ DelCPSRUpdate;
 
// -----------------------------------------------------------------------------
// When the CR0Stg2WrEn signal is asserted, clock in the value on the
// SSPCR0 input into the CR0 register.
// -----------------------------------------------------------------------------
always @(CR0Stg2WrEn or SSPCR0 or CR0)
begin : p_CR0Comb
  if (CR0Stg2WrEn == 1'b1)
    NextCR0 = SSPCR0;
  else
    NextCR0 = CR0;
end // p_CR0Comb;

// -----------------------------------------------------------------------------
// When the CPSRStg2WrEn signal is asserted, clock in the value on the
// SSPCPSR input into the CPSR register.
// -----------------------------------------------------------------------------
always @(CPSRStg2WrEn or SSPCPSR or CPSR)
begin : p_CPSRComb
  if (CPSRStg2WrEn == 1'b1)
    NextCPSR = SSPCPSR;
  else
    NextCPSR = CPSR;
end // p_CPSRComb;
 
// ----------------------------------------------------------------------------
// Separate the bit fields in CR0 and assign them to the respective 
// outputs
// ----------------------------------------------------------------------------
assign DSS = CR0[3:0];
assign FRF = CR0[5:4];
assign SPO = CR0[6];
assign SPH = CR0[7];
assign SCR = CR0[15:8];

endmodule

//================================= End ======================================--
