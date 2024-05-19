// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

// *******************************************************************************************************
// **                                                                                                   **
// **   M11LC080.v - 11LC080 8K-BIT UNI/O(R) BUS SERIAL EEPROM (VCC = +2.5V TO +5.5V)                   **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2008 YOUNG ENGINEERING                                 **
// **                                      ALL RIGHTS RESERVED                                          **
// **                                                                                                   **
// **                                                                                                   **
// **   Young Engineering provides design expertise for the digital world                               **
// **   Started in 1990, Young Engineering offers products and services for your electronic design      **
// **   project.  We have the expertise in PCB, FPGA, ASIC, firmware, and software design.              **
// **   From concept to prototype to production, we can help you.                                       **
// **                                                                                                   **
// **   http://www.young-engineering.com/                                                               **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **   This information is provided to you for your convenience and use with Microchip products only.  **
// **   Microchip disclaims all liability arising from this information and its use.                    **
// **                                                                                                   **
// **   THIS INFORMATION IS PROVIDED "AS IS." MICROCHIP MAKES NO REPRESENTATION OR WARRANTIES OF        **
// **   ANY KIND WHETHER EXPRESS OR IMPLIED, WRITTEN OR ORAL, STATUTORY OR OTHERWISE, RELATED TO        **
// **   THE INFORMATION PROVIDED TO YOU, INCLUDING BUT NOT LIMITED TO ITS CONDITION, QUALITY,           **
// **   PERFORMANCE, MERCHANTABILITY, NON-INFRINGEMENT, OR FITNESS FOR PURPOSE.                         **
// **   MICROCHIP IS NOT LIABLE, UNDER ANY CIRCUMSTANCES, FOR SPECIAL, INCIDENTAL OR CONSEQUENTIAL      **
// **   DAMAGES, FOR ANY REASON WHATSOEVER.                                                             **
// **                                                                                                   **
// **   It is your responsibility to ensure that your application meets with your specifications.       **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **   Revision       : 1.2                                                                            **
// **   Modified Date  : 02/29/2008                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   12/01/2007:  Initial design                                                                     **
// **   02/14/2008:  Changed the WRITE command write cycle time to 5 msec.                              **
// **                Modified all write cycle logic to clear WriteEnable (WEL) at the end of the cycle. **
// **                Modified the ERAL/SETAL write cycle logic to require both Block Protect (BP) bits  **
// **                to be cleared to execute the command.                                              **
// **                Modified the SAK logic to not generate the SAK if a command is terminated early.   **
// **                Modified the state logic to require a Standby Pulse is a command is terminated     ** 
// **                early.                                                                             **
// **                Added power-on logic to require a low-to-high edge on SCIO after initialization.   **
// **                Replaced separate read/write address pointers with a single address pointer.       **
// **   02/29/2008:  Modified certain commands to be invalid during write cycle.                        **
// **                Added address pointer increment after each byte received during WRITE command.     **
// **   10/30/2008:  Updated trademark symbol for UNI/O bus.                                            **
// **                                                                                                   **
// *******************************************************************************************************
// **                                       TABLE OF CONTENTS                                           **
// *******************************************************************************************************
// **---------------------------------------------------------------------------------------------------**
// **   DECLARATIONS                                                                                    **
// **---------------------------------------------------------------------------------------------------**
// **---------------------------------------------------------------------------------------------------**
// **   INITIALIZATION                                                                                  **
// **---------------------------------------------------------------------------------------------------**
// **---------------------------------------------------------------------------------------------------**
// **   CORE LOGIC                                                                                      **
// **---------------------------------------------------------------------------------------------------**
// **   1.01:  Internal Sample Clock                                                                    **
// **   1.02:  Internal Sample Counter                                                                  **
// **   1.03:  SCIO Input Edge Detect                                                                   **
// **   1.04:  Device Power-On Release                                                                  **
// **   1.05:  Bit Period Calculation                                                                   **
// **   1.06:  Device Idle Definition                                                                   **
// **   1.07:  Interface State Machine                                                                  **
// **   1.08:  Address/Command Validation                                                               **
// **   1.09:  SCIO Output Data Encoder                                                                 **
// **   1.10:  Start Header Bit Counter                                                                 **
// **   1.11:  Transfer Data Bit Counter                                                                **
// **   1.12:  Receive Byte Data Latch                                                                  **
// **   1.13:  Receive MAK Bit Latch                                                                    **
// **   1.14:  Receive MAK Window                                                                       **
// **   1.15:  Transmit SAK Window                                                                      **
// **   1.16:  Write Cycle Processor - WRSR                                                             **
// **   1.17:  Write Cycle Processor - ERAL                                                             **
// **   1.18:  Write Cycle Processor - SETAL                                                            **
// **   1.19:  Write Cycle Processor - WRITE                                                            **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   FUNCTIONS                                                                                       **
// **---------------------------------------------------------------------------------------------------**
// **   2.01:  ManchesterDecode - Manchester Bit Decoder                                                **
// **   2.02:  CodingError - Manchester Coding Error Detect                                             **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   DEBUG LOGIC                                                                                     **
// **---------------------------------------------------------------------------------------------------**
// **   3.01:  Command Byte Decode                                                                      **
// **   3.02:  Memory Data Bytes                                                                        **
// **   3.03:  Page Write Buffer                                                                        **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   TIMING CHECKS                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **                                                                                                   **
// *******************************************************************************************************


`timescale 1ns/10ps

module M11LC080 (SCIO);

   inout        SCIO;                           // serial data I/O


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   parameter        EEPROM_BYTE_COUNT = 1024;   // memory size in bytes

   parameter        SAMPLE_PERIOD = 100;        // sample clock period

   parameter        READ  = 8'h03;              // command decode
   parameter        CRRD  = 8'h06;              // command decode
   parameter        RDSR  = 8'h05;              // command decode
   parameter        WREN  = 8'h96;              // command decode
   parameter        WRDI  = 8'h91;              // command decode
   parameter        WRSR  = 8'h6E;              // command decode
   parameter        ERAL  = 8'h6D;              // command decode
   parameter        WRITE = 8'h6C;              // command decode
   parameter        SETAL = 8'h67;              // command decode

   reg  [07:00]     MemoryBlock [0:1023];       // EEPROM data memory array (8 x 1024)

   reg              SCIO_DI;                    // serial data - input
   reg              SCIO_DO;                    // serial data - output
   reg              SCIO_OE;                    // serial data - output enable

   wire             SyncWindow;                 // synchronization window to master

   reg              SampleClock;                // internal sample clock
   reg  [15:00]     SampleCount;                // sample counter
   reg  [15:00]     SampleCountNew;             // sample counter load value
   wire             SetSampleCount;             // synchronous control
   wire             IncSampleCount;             // synchronous control

   reg  [03:00]     HeaderBitCounter;           // header bit counter
   wire             ClrHdrBitCounter;           // synchronous control
   wire             IncHdrBitCounter;           // synchronous control

   reg  [03:00]     BitCounter;                 // data bit counter
   wire             ClrBitCounter;              // synchronous control
   wire             IncBitCounter;              // synchronous control

   reg              SCIO_D1;                    // registered - 1 clock delay
   reg              SCIO_D2;                    // registered - 2 clock delay

   wire             SCIO_Posedge;               // synchronous edge detect
   wire             SCIO_Negedge;               // synchronous edge detect
   wire             SCIO_Anyedge;               // synchronous edge detect

   wire             BitBorderEarly;             // manchester bit border

   wire             BitBorder;                  // manchester bit border
   wire             BitMiddle;                  // manchester bit middle
   wire             BitClockA;                  // bit sample point A
   wire             BitClockB;                  // bit sample point B

   wire [15:00]     BitPeriod;                  // averaged bit period

   reg  [15:00]     BitPeriod1;                 // sampled bit period
   reg  [15:00]     BitPeriod2;                 // sampled bit period
   reg  [15:00]     BitPeriod3;                 // sampled bit period
   reg  [15:00]     BitPeriod4;                 // sampled bit period

   wire             StateDevIdle;               // device idle mode

   reg              StatePowerOn;               // interface state flag
   reg              StateStandby;               // interface state flag
   reg              StateWaitHdr;               // interface state flag
   reg              StateStrtHdr;               // interface state flag
   reg              StateDevAddr;               // interface state flag
   reg              StateCommand;               // interface state flag
   reg              StateAddrMSB;               // interface state flag
   reg              StateAddrLSB;               // interface state flag
   reg              StateDataSnd;               // interface state flag
   reg              StateDataRcv;               // interface state flag

   reg              MAK_BitTime;                // MAK bit time
   wire             SetMAK_BitTime;             // synchronous control
   wire             ClrMAK_BitTime;             // synchronous control

   reg              SAK_BitTime;                // SAK bit time
   wire             SetSAK_BitTime;             // synchronous control
   wire             ClrSAK_BitTime;             // synchronous control

   reg              BitCodeA;                   // coded bit sample
   reg              BitCodeB;                   // coded bit sample

   reg  [07:00]     ByteRcvd;                   // received data byte
   reg              MAK_Rcvd;                   // received MAK bit

   reg  [07:00]     DevAddrRcvd;                // received device address
   reg  [07:00]     CommandRcvd;                // received command byte

   wire             DevAddrValid;               // valid device address
   wire             CommandValid;               // valid command byte

   reg  [07:00]     DataOut;                    // output data byte
   reg  [15:00]     AddressPointer;             // memory address pointer
   reg  [07:00]     WrDataCounter;              // page buffer byte counter
   reg  [03:00]     PageWrAddress;              // memory page address
   reg  [15:00]     PageWrInitialAddr;          // page write initial address
   reg  [07:00]     PageBuffer [0:15];          // page buffer - 16 bytes
   reg  [03:00]     PageAddress;                // memory page address - temporary

   reg              WriteEnable;                // write enable bit
   reg              WriteActive;                // write in progress
   reg  [01:00]     BlockProtect;               // block protect bits

   event            WriteCycle1;                // byte write cycle event - WRSR
   event            WriteCycle2;                // byte write cycle event - ERAL
   event            WriteCycle3;                // byte write cycle event - SETAL
   event            WriteCycle4;                // byte write cycle event - WRITE

   event            CheckTiming_tE;             // timing check event

   integer          LoopIndex;                  // iterative loop index

   integer          tSTBY;                      // timing parameter

   integer          tWC1;                       // timing parameter
   integer          tWC2;                       // timing parameter
   integer          tWC3;                       // timing parameter
   integer          tWC4;                       // timing parameter

   integer          tE_MIN;                     // timing parameter
   integer          tE_MAX;                     // timing parameter


// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin
      SCIO_DO = 0;
      SCIO_OE = 0;
   end

   initial begin
      SampleCount = 1;

      BitCounter = 0;
      BitPeriod1 = 0;
      BitPeriod2 = 0;
      BitPeriod3 = 0;
      BitPeriod4 = 0;
   end

   initial begin
      StatePowerOn = 1;
      StateStandby = 0;
      StateWaitHdr = 0;
      StateStrtHdr = 0;
      StateDevAddr = 0;
      StateCommand = 0;
      StateAddrMSB = 0;
      StateAddrLSB = 0;
      StateDataSnd = 0;
      StateDataRcv = 0;
   end

   initial begin
      ByteRcvd = 0;
      MAK_Rcvd = 0;

      DevAddrRcvd = 0;
      CommandRcvd = 0;
   end

   initial begin
      MAK_BitTime = 0;
      SAK_BitTime = 0;
   end

   initial begin
      WriteEnable  = 0;
      WriteActive  = 0;
      BlockProtect = 0;
   end

   initial begin
      AddressPointer = 0;
      WrDataCounter  = 0;
      PageWrAddress  = 0;
   end

   initial begin
      tSTBY =  600000;                          // 600 usec

      tWC1 =  5000000;                          //   5 msec
      tWC2 = 10000000;                          //  10 msec
      tWC3 = 10000000;                          //  10 msec
      tWC4 =  5000000;                          //   5 msec

      tE_MIN =  10000 / SAMPLE_PERIOD;          //  10 usec
      tE_MAX = 100000 / SAMPLE_PERIOD;          // 100 usec
   end


// *******************************************************************************************************
// **   CORE LOGIC                                                                                      **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Internal Sample Clock
// -------------------------------------------------------------------------------------------------------

   initial begin
      SampleClock = 0;

      forever begin
         #(SAMPLE_PERIOD/2) SampleClock = 1;
         #(SAMPLE_PERIOD/2) SampleClock = 0;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.02:  Internal Sample Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (SetSampleCount)   SampleCount <= SampleCountNew;
      else if (IncSampleCount)  SampleCount <= SampleCount + 1;
   end

   always @(StateDevIdle or StatePowerOn or StateStandby or StateWaitHdr or StateStrtHdr or
            StateDevAddr or StateCommand or StateAddrMSB or StateAddrLSB or StateDataSnd or
            StateDataRcv or MAK_BitTime  or SCIO_Posedge or BitPeriod) begin
      SampleCountNew = 1;

      if (StateDevIdle) SampleCountNew = 1;
      if (StateStandby) SampleCountNew = 1;
      if (StateDevAddr & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
      if (StateCommand & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
      if (StateAddrMSB & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
      if (StateAddrLSB & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
      if (StateDataSnd & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
      if (StateDataRcv & MAK_BitTime & SCIO_Posedge & SyncWindow) SampleCountNew = (BitPeriod/2) + 1;
   end

   assign SyncWindow = (SampleCount >= ((BitPeriod*40)/100)) && (SampleCount <= ((BitPeriod*60)/100));

   assign SetSampleCount = StateDevIdle & (SCIO_DI !== 1)
                         | StateStandby & SCIO_Negedge
                         | StateWaitHdr & SCIO_Posedge
                         | StateStrtHdr & SCIO_Anyedge & !MAK_BitTime & !SAK_BitTime
                         | StateStrtHdr & MAK_BitTime & BitBorder
                         | StateStrtHdr & SAK_BitTime & BitBorder
                         | StateDevAddr & BitBorder
                         | StateCommand & BitBorder
                         | StateAddrMSB & BitBorder
                         | StateAddrLSB & BitBorder
                         | StateDataRcv & BitBorder
                         | StateDataSnd & BitBorder
                         | StateDevAddr & MAK_BitTime & SCIO_Posedge & SyncWindow   // sync to master
                         | StateCommand & MAK_BitTime & SCIO_Posedge & SyncWindow   // sync to master
                         | StateAddrMSB & MAK_BitTime & SCIO_Posedge & SyncWindow   // sync to master
                         | StateAddrLSB & MAK_BitTime & SCIO_Posedge & SyncWindow   // sync to master
                         | StateDataSnd & MAK_BitTime & SCIO_Posedge & SyncWindow   // sync to master
                         | StateDataRcv & MAK_BitTime & SCIO_Posedge & SyncWindow;  // sync to master

   assign IncSampleCount = !StatePowerOn & (StateDevIdle ? (SCIO_DI === 1) : 1) 
                         & (SampleCount <= (tSTBY/SAMPLE_PERIOD)-1);

// -------------------------------------------------------------------------------------------------------
//      1.03:  SCIO Input Edge Detect
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) SCIO_D1 <= SCIO_DI;
   always @(posedge SampleClock) SCIO_D2 <= SCIO_D1;

   assign SCIO_Posedge = SCIO_D1 & !SCIO_D2;
   assign SCIO_Negedge = SCIO_D2 & !SCIO_D1;
   assign SCIO_Anyedge = SCIO_D1 ^  SCIO_D2;

// -------------------------------------------------------------------------------------------------------
//      1.04:  Device Power-On Release
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (StatePowerOn & SCIO_Posedge) StatePowerOn <= 0;
   end

// -------------------------------------------------------------------------------------------------------
//      1.05:  Bit Period Calculation
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (StateStrtHdr) begin
         if ((HeaderBitCounter == 1) & SCIO_Posedge) BitPeriod1 <= SampleCount;
         if ((HeaderBitCounter == 2) & SCIO_Negedge) BitPeriod2 <= SampleCount;
         if ((HeaderBitCounter == 3) & SCIO_Posedge) BitPeriod3 <= SampleCount;
         if ((HeaderBitCounter == 4) & SCIO_Negedge) BitPeriod4 <= SampleCount;
      end
   end

   assign BitPeriod = (BitPeriod1 + BitPeriod2 +  BitPeriod3 + BitPeriod4) / 4;

   assign BitBorder = (SampleCount == (BitPeriod));
   assign BitMiddle = (SampleCount == (BitPeriod/2));
   assign BitClockA = (SampleCount == ((BitPeriod*1)/4));
   assign BitClockB = (SampleCount == ((BitPeriod*3)/4));

   assign BitBorderEarly = (SampleCount == (BitPeriod-2));

// -------------------------------------------------------------------------------------------------------
//      1.06:  Device Idle Definition
// -------------------------------------------------------------------------------------------------------

   assign StateDevIdle = !StatePowerOn & !StateStandby & !StateWaitHdr & !StateStrtHdr
                       & !StateDevAddr & !StateCommand & !StateAddrMSB & !StateAddrLSB
                       & !StateDataSnd & !StateDataRcv;

// -------------------------------------------------------------------------------------------------------
//      1.07:  Interface State Machine
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (!StateStandby & (SampleCount==(tSTBY/SAMPLE_PERIOD)-1)) begin /* ---- state  reset ---- */
         StateStandby <= 1; 
         StateWaitHdr <= 0;
         StateStrtHdr <= 0;
         StateDevAddr <= 0;
         StateCommand <= 0;
         StateAddrMSB <= 0;
         StateAddrLSB <= 0;
         StateDataSnd <= 0;
         StateDataRcv <= 0;
      end
      else if (StateStandby) begin                  /* ---- StateStandby ---- */
         if (SCIO_Negedge) begin
            StateStandby <= 0; 
            StateWaitHdr <= 1;
            StateStrtHdr <= 0;
            StateDevAddr <= 0;
            StateCommand <= 0;
            StateAddrMSB <= 0;
            StateAddrLSB <= 0;
            StateDataSnd <= 0;
            StateDataRcv <= 0;
         end
      end
      else if (StateWaitHdr) begin                  /* ---- StateWaitHdr ---- */
         if (SCIO_Posedge) begin
            StateStandby <= 0; 
            StateWaitHdr <= 0;
            StateStrtHdr <= 1;
            StateDevAddr <= 0;
            StateCommand <= 0;
            StateAddrMSB <= 0;
            StateAddrLSB <= 0;
            StateDataSnd <= 0;
            StateDataRcv <= 0;
         end
      end
      else if (StateStrtHdr) begin                  /* ---- StateStrtHdr ---- */
         if (SAK_BitTime & BitBorder) begin
            StateStandby <= 0; 
            StateWaitHdr <= 0;
            StateStrtHdr <= 0;
            StateDevAddr <= 1;
            StateCommand <= 0;
            StateAddrMSB <= 0;
            StateAddrLSB <= 0;
            StateDataSnd <= 0;
            StateDataRcv <= 0;

            ->CheckTiming_tE;
         end
      end
      else if (StateDevAddr) begin                  /* ---- StateDevAddr ---- */
         if ((BitCounter == 7) & BitBorder) begin
            DevAddrRcvd <= ByteRcvd;
         end
         if (MAK_BitTime & BitBorder) begin
            if (DevAddrValid) begin
               SCIO_DO <= 0;
               SCIO_OE <= 1;    // SAK start    
            end
            else begin      // invalid
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (SAK_BitTime & BitMiddle) begin
            if (DevAddrValid) begin
               SCIO_DO <= 1; 
               SCIO_OE <= 1;    // SAK middle
            end
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 1;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
            else begin      // MAK_Rcvd=0
               StateStandby <= 1; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            SCIO_DO <= 0;
            SCIO_OE <= 0;   // SAK finish
         end
      end
      else if (StateCommand) begin                  /* ---- StateCommand ---- */
         if ((BitCounter == 7) & BitBorder) begin
            CommandRcvd <= ByteRcvd;
         end
         if (MAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               if ((CommandRcvd == READ) ||
                   (CommandRcvd == WRSR) ||
                   (CommandRcvd == WRITE) &&
                   !WriteActive) begin
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if (CommandRcvd == CRRD && !WriteActive) begin
                  DataOut <= MemoryBlock[AddressPointer[9:0]];
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if (CommandRcvd == RDSR) begin
                  DataOut <= {4'h0,BlockProtect[1:0],WriteEnable,WriteActive};
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if ((CommandRcvd == WREN) ||
                   (CommandRcvd == WRDI) ||
                   (CommandRcvd == ERAL) ||
                   (CommandRcvd == SETAL)) begin
                  StateStandby <= 0;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               end
            end
            else begin      // MAK_Rcvd=0
               if (CommandRcvd == WREN) begin
                  WriteEnable <= 1;
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if (CommandRcvd == WRDI) begin
                  WriteEnable <= 0;
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if (CommandRcvd == ERAL && !WriteActive) begin
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
               if (CommandRcvd == SETAL && !WriteActive) begin
                  SCIO_DO <= 0;
                  SCIO_OE <= 1; // SAK start
               end
            end
            if (!CommandValid) begin
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (SAK_BitTime & BitMiddle) begin
            if (CommandValid) begin
               SCIO_DO <= 1;   // SAK middle
            end
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               if ((CommandRcvd == READ) ||
                   (CommandRcvd == WRITE)) begin
                  StateStandby <= 0;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 1;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               end
               if ((CommandRcvd == CRRD) ||
                   (CommandRcvd == RDSR)) begin
                  StateStandby <= 0;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 1;
                  StateDataRcv <= 0;

                  SCIO_DO <= !DataOut[7];
                  SCIO_OE <= 1;
               end
               if (CommandRcvd == WRSR) begin
                  StateStandby <= 0;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 1;
               end
            end
            else begin      // MAK_Rcvd=0
               if ((CommandRcvd == ERAL) ||
                   (CommandRcvd == SETAL) ||
                   (CommandRcvd == WREN) ||
                   (CommandRcvd == WRDI)) begin
                  StateStandby <= 1;
               end
               else begin
                  StateStandby <= 0;
               end
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               if (CommandRcvd == ERAL) begin
                  if (WriteEnable & !WriteActive) begin        
                     ->WriteCycle2;
                  end
               end
               if (CommandRcvd == SETAL) begin
                  if (WriteEnable & !WriteActive) begin        
                     ->WriteCycle3;
                  end
               end
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            if ((CommandRcvd != CRRD) &&
                (CommandRcvd != RDSR)) begin
               SCIO_DO <= 0;
               SCIO_OE <= 0;    // SAK finish
            end
         end
      end
      else if (StateAddrMSB) begin                  /* ---- StateAddrMSB ---- */
         if ((BitCounter == 7) & BitBorder) begin
            if (CommandRcvd == READ) begin
               AddressPointer[15:08] <= ByteRcvd;
            end
            if (CommandRcvd == WRITE) begin
               AddressPointer[15:08] <= ByteRcvd;
               PageWrInitialAddr[15:08] <= ByteRcvd;
            end
            if (CodingError(ByteRcvd)) begin
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (MAK_BitTime & BitBorder & MAK_Rcvd) begin
            SCIO_DO <= 0; 
            SCIO_OE <= 1;   // SAK start
         end
         if (SAK_BitTime & BitMiddle) begin
            SCIO_DO <= 1;   // SAK middle
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 1;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
            else begin      // MAK_Rcvd=0
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            SCIO_DO <= 0;
            SCIO_OE <= 0;   // SAK finish
         end
      end
      else if (StateAddrLSB) begin                  /* ---- StateAddrLSB ---- */
         if ((BitCounter == 7) & BitBorder) begin
            if (CommandRcvd == READ) begin
               AddressPointer[07:00] <= ByteRcvd;
            end
            if (CommandRcvd == WRITE) begin
               AddressPointer[07:00] <= ByteRcvd;
               PageWrAddress[03:00] <= ByteRcvd[03:00];
               PageWrInitialAddr[07:00] <= ByteRcvd;
               WrDataCounter[07:00] <= 0;
            end
            if (CodingError(ByteRcvd)) begin
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (MAK_BitTime & BitBorder & MAK_Rcvd) begin
            if (CommandRcvd == READ) begin
               DataOut <= MemoryBlock[AddressPointer[9:0]];
            end
            SCIO_DO <= 0; 
            SCIO_OE <= 1;   // SAK start
         end
         if (SAK_BitTime & BitMiddle) begin
            SCIO_DO <= 1;   // SAK middle
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               if (CommandRcvd == READ) begin
                  StateStandby <= 0; 
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 1;
                  StateDataRcv <= 0;

                  SCIO_DO <= !DataOut[7];
                  SCIO_OE <= 1;
               end 
               if (CommandRcvd == WRITE) begin
                  StateStandby <= 0; 
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 1;
               end 
            end
            else begin      // MAK_Rcvd=0
               StateStandby <= 0; 
               StateWaitHdr <= 0;
               StateStrtHdr <= 0;
               StateDevAddr <= 0;
               StateCommand <= 0;
               StateAddrMSB <= 0;
               StateAddrLSB <= 0;
               StateDataSnd <= 0;
               StateDataRcv <= 0;
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            if (CommandRcvd != READ) begin
               SCIO_DO <= 0;
               SCIO_OE <= 0;    // SAK finish
            end
         end
      end
      else if (StateDataSnd) begin                  /* ---- StateDataSnd ---- */
         if ((BitCounter == 7) & BitBorderEarly) begin
            SCIO_OE <= 0;   // wait for MAK
         end
         if ((BitCounter == 7) & BitBorder) begin
            if ((CommandRcvd == READ) ||
                (CommandRcvd == CRRD)) begin
               AddressPointer <= AddressPointer + 1;
            end
         end
         if (MAK_BitTime & BitBorder) begin
            if ((CommandRcvd == READ) ||
                (CommandRcvd == CRRD)) begin
               DataOut <= MemoryBlock[AddressPointer[9:0]];
            end
            if (CommandRcvd == RDSR) begin
               DataOut <= {4'h0,BlockProtect[1:0],WriteEnable,WriteActive};
            end
            SCIO_DO <= 0;
            SCIO_OE <= 1;   // SAK start
         end
         if (SAK_BitTime & BitMiddle) begin
            SCIO_DO <= 1; 
            SCIO_OE <= 1;   // SAK middle
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
               if ((CommandRcvd == READ) ||
                   (CommandRcvd == CRRD) ||
                   (CommandRcvd == RDSR)) begin
                  SCIO_DO <= !DataOut[7];
               end 
            end
            else begin      // MAK_Rcvd=0
               if ((CommandRcvd == READ) ||
                   (CommandRcvd == CRRD) ||
                   (CommandRcvd == RDSR)) begin
                  StateStandby <= 1; 
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               end 
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            if (MAK_Rcvd == 0) begin
               SCIO_DO <= 0;
               SCIO_OE <= 0;    // SAK finish
            end
         end
      end
      else if (StateDataRcv) begin                  /* ---- StateDataRcv ---- */
         if ((BitCounter == 7) & BitBorder) begin
         end
         if (MAK_BitTime & BitBorder) begin
            if (CommandRcvd == WRSR) begin
               if (MAK_Rcvd == 0) begin
                  if (CodingError(ByteRcvd)) begin
                     StateStandby <= 0; 
                     StateWaitHdr <= 0;
                     StateStrtHdr <= 0;
                     StateDevAddr <= 0;
                     StateCommand <= 0;
                     StateAddrMSB <= 0;
                     StateAddrLSB <= 0;
                     StateDataSnd <= 0;
                     StateDataRcv <= 0;
                  end
                  else begin
                     SCIO_DO <= 0; 
                     SCIO_OE <= 1;  // SAK start
                  end
               end
               else begin   // MAK_Rcvd=1
                  StateStandby <= 0;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               end
            end
            if (CommandRcvd == WRITE) begin
               if (CodingError(ByteRcvd)) begin
                  StateStandby <= 0; 
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
               end
               else begin
                  PageBuffer[PageWrAddress] <= ByteRcvd;
                  PageWrAddress <= PageWrAddress + 1;
                  WrDataCounter <= WrDataCounter + 1;
                  AddressPointer[03:00] <= AddressPointer[03:00] + 1;
                  SCIO_DO <= 0; 
                  SCIO_OE <= 1; // SAK start
               end
            end
         end
         if (SAK_BitTime & BitMiddle) begin
            SCIO_DO <= 1;   // SAK middle
         end
         if (SAK_BitTime & BitBorder) begin
            if (MAK_Rcvd == 1) begin
            end
            else begin      // MAK_Rcvd=0
               if (CommandRcvd == WRSR) begin
                  StateStandby <= 1;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;
         
                  if (WriteEnable & !WriteActive) begin        
                     BlockProtect[1:0] <= ByteRcvd[3:2];
                     ->WriteCycle1;
                  end
               end
               if (CommandRcvd == WRITE) begin
                  StateStandby <= 1;
                  StateWaitHdr <= 0;
                  StateStrtHdr <= 0;
                  StateDevAddr <= 0;
                  StateCommand <= 0;
                  StateAddrMSB <= 0;
                  StateAddrLSB <= 0;
                  StateDataSnd <= 0;
                  StateDataRcv <= 0;

                  if (WriteEnable & !WriteActive) begin        
                     ->WriteCycle4;
                  end
               end
            end
         end
         if (SAK_BitTime & BitBorderEarly) begin
            SCIO_DO <= 0;
            SCIO_OE <= 0;   // SAK finish
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.08:  Address/Command Validation
// -------------------------------------------------------------------------------------------------------

   assign DevAddrValid = (DevAddrRcvd == 8'hA0);
   assign CommandValid = (CommandRcvd == READ && !WriteActive)
                       | (CommandRcvd == CRRD && !WriteActive)
                       | (CommandRcvd == RDSR)
                       | (CommandRcvd == WREN)
                       | (CommandRcvd == WRDI)
                       | (CommandRcvd == WRSR && !WriteActive)
                       | (CommandRcvd == ERAL && !WriteActive)
                       | (CommandRcvd == WRITE && !WriteActive)
                       | (CommandRcvd == SETAL && !WriteActive);

// -------------------------------------------------------------------------------------------------------
//      1.09:  SCIO Output Data Encoder
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (StateDataSnd) begin
         if (BitMiddle & (BitCounter < 8)) SCIO_DO <=  DataOut[7-BitCounter];
         if (BitBorder & (BitCounter < 7)) SCIO_DO <= !DataOut[6-BitCounter];
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.10:  Start Header Bit Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (ClrHdrBitCounter) HeaderBitCounter <= 0;
      else if (IncHdrBitCounter)HeaderBitCounter <= HeaderBitCounter + 1;
   end

   assign ClrHdrBitCounter = StateWaitHdr & SCIO_Posedge;
   assign IncHdrBitCounter = StateStrtHdr & SCIO_Anyedge;

// -------------------------------------------------------------------------------------------------------
//      1.11:  Transfer Data Bit Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (ClrBitCounter)    BitCounter <= 0;
      else if (IncBitCounter)   BitCounter <= BitCounter + 1;
   end

   assign ClrBitCounter = SAK_BitTime  & BitBorder;
   assign IncBitCounter = StateDevAddr & BitBorder
                        | StateCommand & BitBorder
                        | StateAddrMSB & BitBorder
                        | StateAddrLSB & BitBorder
                        | StateDataSnd & BitBorder
                        | StateDataRcv & BitBorder;

// -------------------------------------------------------------------------------------------------------
//      1.12:  Receive Byte Data Latch
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) if (BitClockA) BitCodeA <= SCIO_D2;
   always @(posedge SampleClock) if (BitClockB) BitCodeB <= SCIO_D2;

   always @(posedge SampleClock) begin
      if (BitClockB & (BitCounter < 8)) begin
         ByteRcvd[7-BitCounter] <= ManchesterDecode(BitCodeA, SCIO_D2);
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.13:  Receive MAK Bit Latch
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (BitClockB & MAK_BitTime) begin
         MAK_Rcvd <= ManchesterDecode(BitCodeA, SCIO_D2);
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.14:  Receive MAK Window
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (SetMAK_BitTime)   MAK_BitTime <= 1;
      else if (ClrMAK_BitTime)  MAK_BitTime <= 0;
   end

   assign SetMAK_BitTime = StateStrtHdr & (HeaderBitCounter == 8) & SCIO_Negedge
                         | StateDevAddr & (BitCounter == 7) & BitBorder
                         | StateCommand & (BitCounter == 7) & BitBorder
                         | StateAddrMSB & (BitCounter == 7) & BitBorder
                         | StateAddrLSB & (BitCounter == 7) & BitBorder
                         | StateDataSnd & (BitCounter == 7) & BitBorder
                         | StateDataRcv & (BitCounter == 7) & BitBorder;
   assign ClrMAK_BitTime = BitBorder;

// -------------------------------------------------------------------------------------------------------
//      1.15:  Transmit SAK Window
// -------------------------------------------------------------------------------------------------------

   always @(posedge SampleClock) begin
      if (SetSAK_BitTime)   SAK_BitTime <= 1;
      else if (ClrSAK_BitTime)  SAK_BitTime <= 0;
   end

   assign SetSAK_BitTime = MAK_BitTime & ClrMAK_BitTime;
   assign ClrSAK_BitTime = BitBorder;

// -------------------------------------------------------------------------------------------------------
//      1.16:  Write Cycle Processor - WRSR
// -------------------------------------------------------------------------------------------------------

   always @(WriteCycle1) begin
      WriteActive = 1;
      #(tWC1);
      WriteActive = 0;
      WriteEnable = 0;
   end

// -------------------------------------------------------------------------------------------------------
//      1.17:  Write Cycle Processor - ERAL
// -------------------------------------------------------------------------------------------------------

   always @(WriteCycle2) begin
      WriteActive = 1;
      #(tWC2);
      WriteActive = 0;
      WriteEnable = 0;
      for (LoopIndex = 0; LoopIndex < EEPROM_BYTE_COUNT; LoopIndex = LoopIndex + 1) begin
         if (BlockProtect == 0) begin
            MemoryBlock[LoopIndex] = 8'h00;
         end
         if (BlockProtect == 1) begin
            // fully write protected
         end
         if (BlockProtect == 2) begin
            // fully write protected
         end
         if (BlockProtect == 3) begin
            // fully write protected
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.18:  Write Cycle Processor - SETAL
// -------------------------------------------------------------------------------------------------------

   always @(WriteCycle3) begin
      WriteActive = 1;
      #(tWC3);
      WriteActive = 0;
      WriteEnable = 0;
      for (LoopIndex = 0; LoopIndex < EEPROM_BYTE_COUNT; LoopIndex = LoopIndex + 1) begin
         if (BlockProtect == 0) begin
            MemoryBlock[LoopIndex] = 8'hFF;
         end
         if (BlockProtect == 1) begin
            // fully write protected
         end
         if (BlockProtect == 2) begin
            // fully write protected
         end
         if (BlockProtect == 3) begin
            // fully write protected
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.19:  Write Cycle Processor - WRITE
// -------------------------------------------------------------------------------------------------------

   always @(WriteCycle4) begin
      WriteActive = 1;
      #(tWC4);
      WriteActive = 0;
      WriteEnable = 0;
      for (LoopIndex = 0; LoopIndex < WrDataCounter; LoopIndex = LoopIndex + 1) begin
         if (BlockProtect == 0) begin
            PageAddress = PageWrInitialAddr[03:00] + LoopIndex;
            MemoryBlock [{PageWrInitialAddr[09:04],PageAddress[03:00]}] = PageBuffer[PageAddress];
         end
         if (BlockProtect == 1) begin
            if (PageWrInitialAddr < (EEPROM_BYTE_COUNT*3)/4) begin
               PageAddress = PageWrInitialAddr[03:00] + LoopIndex;
               MemoryBlock [{PageWrInitialAddr[09:04],PageAddress[03:00]}] = PageBuffer[PageAddress];
            end
         end
         if (BlockProtect == 2) begin
            if (PageWrInitialAddr < (EEPROM_BYTE_COUNT*2)/4) begin
               PageAddress = PageWrInitialAddr[03:00] + LoopIndex;
               MemoryBlock [{PageWrInitialAddr[09:04],PageAddress[03:00]}] = PageBuffer[PageAddress];
            end
         end
         if (BlockProtect == 3) begin
            // fully write protected
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.20:  SCIO I/O Buffer
// -------------------------------------------------------------------------------------------------------

   bufif1 (SCIO, SCIO_DO, SCIO_OE);

   always @(SCIO) begin
      case (SCIO)
         1'b1:    SCIO_DI = 1'b1;
         1'b0:    SCIO_DI = 1'b0;
         default: SCIO_DI = 1'bX;
      endcase
   end


// *******************************************************************************************************
// **   FUNCTIONS                                                                                       **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      2.01:  ManchesterDecode - Manchester Bit Decoder
// -------------------------------------------------------------------------------------------------------

   function ManchesterDecode;

      input     BitCodeA;
      input BitCodeB;

      reg   DataBit;

      begin
         case ({BitCodeA,BitCodeB})
            2'b01:  DataBit = 1'b1;
            2'b10:  DataBit = 1'b0;
            default:    DataBit = 1'bX;
         endcase

         ManchesterDecode = DataBit;
      end
   endfunction

// -------------------------------------------------------------------------------------------------------
//      2.02:  CodingError - Manchester Coding Error Detect
// -------------------------------------------------------------------------------------------------------

   function CodingError;

      input [07:00]     DataByte;

      reg       ErrorDetect;

      begin
         if ((DataByte[0] === 1'bX) || (DataByte[1] === 1'bX) ||
             (DataByte[2] === 1'bX) || (DataByte[3] === 1'bX) ||
             (DataByte[4] === 1'bX) || (DataByte[5] === 1'bX) ||
             (DataByte[6] === 1'bX) || (DataByte[7] === 1'bX))
              ErrorDetect = 1;
         else ErrorDetect = 0;

         CodingError = ErrorDetect;
      end
   endfunction


// *******************************************************************************************************
// **   DEBUG LOGIC                                                                                     **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      3.01:  Command Byte Decode
// -------------------------------------------------------------------------------------------------------

   reg  [63:00] Command;    // ASCII string

   always @(CommandRcvd) begin
      case (CommandRcvd)
         8'h03:     Command = "READ";
         8'h06:     Command = "CRRD";
         8'h6C:     Command = "WRITE";
         8'h96:     Command = "WREN";
         8'h91:     Command = "WRDI";
         8'h05:     Command = "RDSR";
         8'h6E:     Command = "WRSR";
         8'h6D:     Command = "ERAL";
         8'h67:     Command = "SETAL";

         default:   Command = "Invalid";
      endcase
   end

// -------------------------------------------------------------------------------------------------------
//      3.02:  Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] MemoryByte000 = MemoryBlock[0000];
   wire [07:00] MemoryByte001 = MemoryBlock[0001];
   wire [07:00] MemoryByte002 = MemoryBlock[0002];
   wire [07:00] MemoryByte003 = MemoryBlock[0003];
   wire [07:00] MemoryByte004 = MemoryBlock[0004];
   wire [07:00] MemoryByte005 = MemoryBlock[0005];
   wire [07:00] MemoryByte006 = MemoryBlock[0006];
   wire [07:00] MemoryByte007 = MemoryBlock[0007];
   wire [07:00] MemoryByte008 = MemoryBlock[0008];
   wire [07:00] MemoryByte009 = MemoryBlock[0009];
   wire [07:00] MemoryByte00A = MemoryBlock[0010];
   wire [07:00] MemoryByte00B = MemoryBlock[0011];
   wire [07:00] MemoryByte00C = MemoryBlock[0012];
   wire [07:00] MemoryByte00D = MemoryBlock[0013];
   wire [07:00] MemoryByte00E = MemoryBlock[0014];
   wire [07:00] MemoryByte00F = MemoryBlock[0015];


   wire [07:00] MemoryByte3F0 = MemoryBlock[1008];
   wire [07:00] MemoryByte3F1 = MemoryBlock[1009];
   wire [07:00] MemoryByte3F2 = MemoryBlock[1010];
   wire [07:00] MemoryByte3F3 = MemoryBlock[1011];
   wire [07:00] MemoryByte3F4 = MemoryBlock[1012];
   wire [07:00] MemoryByte3F5 = MemoryBlock[1013];
   wire [07:00] MemoryByte3F6 = MemoryBlock[1014];
   wire [07:00] MemoryByte3F7 = MemoryBlock[1015];
   wire [07:00] MemoryByte3F8 = MemoryBlock[1016];
   wire [07:00] MemoryByte3F9 = MemoryBlock[1017];
   wire [07:00] MemoryByte3FA = MemoryBlock[1018];
   wire [07:00] MemoryByte3FB = MemoryBlock[1019];
   wire [07:00] MemoryByte3FC = MemoryBlock[1020];
   wire [07:00] MemoryByte3FD = MemoryBlock[1021];
   wire [07:00] MemoryByte3FE = MemoryBlock[1022];
   wire [07:00] MemoryByte3FF = MemoryBlock[1023];

// -------------------------------------------------------------------------------------------------------
//      3.03:  Page Write Buffer
// -------------------------------------------------------------------------------------------------------

   wire [07:00] PageData0 = PageBuffer[00];
   wire [07:00] PageData1 = PageBuffer[01];
   wire [07:00] PageData2 = PageBuffer[02];
   wire [07:00] PageData3 = PageBuffer[03];
   wire [07:00] PageData4 = PageBuffer[04];
   wire [07:00] PageData5 = PageBuffer[05];
   wire [07:00] PageData6 = PageBuffer[06];
   wire [07:00] PageData7 = PageBuffer[07];
   wire [07:00] PageData8 = PageBuffer[08];
   wire [07:00] PageData9 = PageBuffer[09];
   wire [07:00] PageDataA = PageBuffer[10];
   wire [07:00] PageDataB = PageBuffer[11];
   wire [07:00] PageDataC = PageBuffer[12];
   wire [07:00] PageDataD = PageBuffer[13];
   wire [07:00] PageDataE = PageBuffer[14];
   wire [07:00] PageDataF = PageBuffer[15];


// *******************************************************************************************************
// **   TIMING CHECKS                                                                                   **
// *******************************************************************************************************

   always @(CheckTiming_tE) begin
      if (BitPeriod < tE_MIN) begin
         $display ("    ERROR! M11LC080: measured bit period < 10 usec (time: %0d ns)", $stime);
      end
      if (BitPeriod > tE_MAX) begin
         $display ("    ERROR! M11LC080: measured bit period > 100 usec (time: %0d ns)", $stime);
      end
   end

endmodule
