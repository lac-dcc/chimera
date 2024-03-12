//  ----------------------------------------------------------------------------
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
//  File Name              : $RCSfile: SspDataStp.v.rca $S
//  File Revision          : 20347
//  
//  Release Information : Cortex-M0 DesignStart-r2p0-00rel0
//  
//  ----------------------------------------------------------------------------
//  
//  
// -----------------------------------------------------------------------------
//  Purpose    : This state machine detects idle state on the SCLKIN input.
// --=========================================================================--
  
`timescale 1ns/1ps


module SspDataStp (
// Inputs 
                  SSPCLK,
                  nSSPRST,
                  IncRxTimeOut,
                  MRxRT,
                  SRxRT,
                  RNESync,
                  RTICSync,
// Outputs
                  DataStp
                  );

// Include Defs file
`include "SspDefs.v"

// Inputs
input        SSPCLK;        // Main SSP Clock
input        nSSPRST;       // SSPCLK domin reset        
input        IncRxTimeOut;  // Stream of SSPCLK-wide pulses      
input        MRxRT;         // Master Rx Reload Time Out counter   
input        SRxRT;         // Slave  Rx Reload Time Out counter
input        RNESync;       // RX fifo Not Empty
input        RTICSync;      // RX Timeout Intr. Clear
        
//Outputs
output        DataStp;      // Receive Idle detected

  
// 
// ---------------------------------------------------------------------------
// 
//                             SspDataStp
//                             ===========
//
// ---------------------------------------------------------------------------
// 
// Overview
// ========
//
// This block detects the SCLKIN line going idle. If the SCLKIN line goes to
// LOW state for more than a 32-bit period and if the Receive FIFO is 
// not empty, the SCLKIN line is said to have gone idle. This is signalled
// by the block output, DataStp. Once set, the DataStp signal can be
// cleared by reading the Rx Fifo contents until empty or if there is new
// activity on the recieve input. Alternatively it can be cleared by writing
// a "1" to the RTIC bit within the SSPICR register.
// To time the 32-bit period, the watchdog counter, that counts down 
// with every IncRxTimeOut pulse, is initially loaded with a value of 31. 
// ---------------------------------------------------------------------------

// -----------------------------------------------------------------------------
// Register declarations
// -----------------------------------------------------------------------------

//  Encoding style: Gray
reg [0:0]   SspDataStpState;
reg [0:0]   SspDataStpNextState;
reg         DataStp;
reg         NextDataStp;
reg         delRTICSync;
  
reg [5:0]   WDCount;
reg [5:0]   NextWDCount;
  
wire        RxRT;
wire        ReloadCounter;
wire        WDCmp;
wire        SSPRTIClr;


// -----------------------------------------------------------------------------
//
// Main body of code
// =================
//
// -----------------------------------------------------------------------------


// Expansion of aliases...
assign RxRT          = MRxRT | SRxRT;
assign ReloadCounter = (RxRT & ~(DataStp)) | ~(RNESync);

// Expansion of comparators...
assign WDCmp = (WDCount[5:0] == 6'b000000);

// State transition process
always @(posedge SSPCLK or negedge nSSPRST)
begin : seq
  if (~nSSPRST)
    begin
      SspDataStpState <= 1'b0;
      DataStp <= 1'b0;
      delRTICSync <= 1'b0;
    end
  else
    begin
      SspDataStpState <= SspDataStpNextState;
      DataStp <= NextDataStp;
      delRTICSync <= RTICSync;
    end
end // process seq;


  // Receive timeout interrupt clear signal
  // signal to clear the interrupt
assign SSPRTIClr = (RTICSync & ~(delRTICSync));

  
// Output and next state logic generation
always @(SspDataStpState or RNESync or IncRxTimeOut or ReloadCounter or
         WDCount or WDCmp or SSPRTIClr or DataStp or RxRT)
begin : combo
  // Default assignments
  SspDataStpNextState = SspDataStpState;
  NextDataStp         =  1'b0;
  NextWDCount         = WDCount;
  case (SspDataStpState)
  1'b0 :
       // This is the reset state of this machine. The DataStp signal is
       // not asserted and the WDCount counter counts down on  every
       // IncRxTimeOut pulse.   
       begin
         if (ReloadCounter)
         begin
           // Reload the watchdog counter whenever there is activity on the 
           // Receive line or when the Receive FIFO is empty.
           NextWDCount          = 6'b111111;
           SspDataStpNextState  = 1'b0;
         end           
         else if (~ReloadCounter & IncRxTimeOut & ~WDCmp)
         begin
           // Keep the watchdog counter counting down so long as the Receive
           // FIFO is not empty.
           NextWDCount          = WDCount - 1;
           SspDataStpNextState  = 1'b0;
         end
         else if (IncRxTimeOut & WDCmp & ~ReloadCounter)
         begin
           // If the watchdog counter has counted down to zero, then assert the
           // DataStp output signal.
           SspDataStpNextState = 1'b1;
           NextDataStp         = 1'b1;
         end
       end
        
    1'b1 :
       // Remain in the S_TRIGGER state till the Receive FIFO contents have 
       // been read out or until there is activity on the SSPCLKOUT/SSPCLKIN 
       // line. If there is a write to the SSPICR or if the RX FIFO is
       // empty, reload the watchdog counter.
       begin
         if (SSPRTIClr | ~RNESync | RxRT)
         begin
           NextWDCount          = 6'b111111;
           SspDataStpNextState  = 1'b0;
           NextDataStp          = 1'b0;
         end
         else
         begin
           SspDataStpNextState  = SspDataStpState;
           NextDataStp          = DataStp;
         end
       end
        
    default :
      SspDataStpNextState = 1'b0;
  endcase
end // process combo;
  
always @(posedge SSPCLK or negedge nSSPRST)
  begin : WDCount_seq
    // Set the WDCount to its maximum value of all ones on Reset.
    
    if (~nSSPRST)
      WDCount <= 6'b111111;
    else 
      WDCount <= NextWDCount;
  end //process WDCount_seq

endmodule
