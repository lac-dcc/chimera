// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

// *******************************************************************************************************
// **                                                                                                   **
// **   MCP79410.v - MCP79410 I2C RTC/CALENDAR/EEPROM/SRAM/UNIQUE ID (VCC = +2.5V TO +5.5V)             **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2010 YOUNG ENGINEERING                                 **
// **                                      ALL RIGHTS RESERVED                                          **
// **                                                                                                   **
// **   THIS PROGRAM IS CONFIDENTIAL AND  A  TRADE SECRET  OF  YOUNG  ENGINEERING.  THE RECEIPT OR      **
// **   POSSESSION  OF THIS PROGRAM  DOES NOT  CONVEY  ANY  RIGHTS TO  REPRODUCE  OR  DISCLOSE ITS      **
// **   CONTENTS,  OR TO MANUFACTURE, USE, OR SELL  ANYTHING  THAT IT MAY DESCRIBE, IN WHOLE OR IN      **
// **   PART, WITHOUT THE SPECIFIC WRITTEN CONSENT OF YOUNG ENGINEERING.                                **
// **                                                                                                   **
// *******************************************************************************************************
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
// **   Revision       : 1.0                                                                            **
// **   Modified Date  : 10/10/2010                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   10/10/2010:  Initial design                                                                     **
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
// **   I/O LOGIC - XTAL                                                                                **
// **---------------------------------------------------------------------------------------------------**
// **   1.01:  Xtal2 Output                                                                             **
// **   1.02:  Oscillator Clock Divider                                                                 **
// **   1.03:  Oscillator Calibration                                                                   **
// **   1.04:  Oscillator Active Detect                                                                 **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   I/O LOGIC - I2C                                                                                 **
// **---------------------------------------------------------------------------------------------------**
// **   2.01:  START Bit Detection                                                                      **
// **   2.02:  STOP Bit Detection                                                                       **
// **   2.03:  Input Shift Register                                                                     **
// **   2.04:  Input Bit Counter                                                                        **
// **   2.05:  Control Byte Processor                                                                   **
// **   2.06:  Address Byte Processor                                                                   **
// **   2.07:  Write Data Buffer                                                                        **
// **   2.08:  Acknowledge Generator                                                                    **
// **   2.09:  Acknowledge Detect                                                                       **
// **   2.10:  STOP Flag Removal                                                                        **
// **   2.11:  Read Data Processor                                                                      **
// **   2.12:  Read Data Multiplexor                                                                    **
// **   2.13:  SDA Data I/O Buffer                                                                      **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   I/O LOGIC - MFP                                                                                 **
// **---------------------------------------------------------------------------------------------------**
// **   3.01:  Output Pin Open-Drain Driver                                                             **
// **   3.02:  Output Pin Signal Select                                                                 **
// **   3.03:  Output Signal - 64.0 Hz Clock                                                            **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   CORE LOGIC - RTCC                                                                               **
// **---------------------------------------------------------------------------------------------------**
// **   4.01:  RTCC Control and Data Registers                                                          **
// **   4.02:  RTCC Control Register Bits                                                               **
// **   4.03:  RTCC Time and Date - Seconds                                                             **
// **   4.04:  RTCC Time and Date - Minutes                                                             **
// **   4.05:  RTCC Time and Date - Hours                                                               **
// **   4.06:  RTCC Time and Date - Days                                                                **
// **   4.07:  RTCC Time and Date - Year/Month/Date                                                     **
// **   4.08:  RTCC Time and Date - Status Signals                                                      **
// **   4.09:  RTCC Alarm #0 Logic                                                                      **
// **   4.10:  RTCC Alarm #1 Logic                                                                      **
// **   4.11:  RTCC Alarm Output Signal                                                                 **
// **   4.12:  RTCC Power Fail Detect                                                                   **
// **   4.13:  RTCC Time Saver Registers - VCC Fail                                                     **
// **   4.14:  RTCC Time Saver Registers - VCC OK                                                       **
// **   4.15:  RTCC Read Data Multiplexor                                                               **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   CORE LOGIC - SRAM                                                                               **
// **---------------------------------------------------------------------------------------------------**
// **   5.01:  SRAM Write Logic                                                                         **
// **   5.02:  SRAM Read Logic                                                                          **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   CORE LOGIC - EEPROM                                                                             **
// **---------------------------------------------------------------------------------------------------**
// **   6.01:  EEPROM Write Operation Timer                                                             **
// **   6.02:  EEPROM Memory Write Logic                                                                **
// **   6.03:  EEPROM Memory Read Logic                                                                 **
// **   6.04:  EEPROM Status Register                                                                   **
// **   6.05:  EEPROM Unique ID Unlock Logic                                                            **
// **   6.06:  EEPROM Unique ID Write Logic                                                             **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   LOGIC FUNCTIONS                                                                                 **
// **---------------------------------------------------------------------------------------------------**
// **   7.01:  DateNext - Compute the Next Year-Month-Date                                              **
// **   7.02:  BCDtoHex - Convert BCD to Hex Value                                                      **
// **   7.03:  HexToBCD - Convert Hex to BCD Value                                                      **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   DEBUG LOGIC                                                                                     **
// **---------------------------------------------------------------------------------------------------**
// **   8.01:  SRAM Memory Data Bytes                                                                   **
// **   8.02:  EEPROM Memory Data Bytes                                                                 **
// **   8.03:  Write Data Buffer                                                                        **
// **   8.04:  Unique ID Memory Block                                                                   **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   TIMING CHECKS                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **                                                                                                   **
// *******************************************************************************************************


`timescale 1ns/10ps

module MCP79410 (X1, X2, MFP, SDA, SCL, VCC, VBAT, RESET);

   input                X1;                             // crystal/external oscillator input
   output               X2;                             // crystal output

   output               MFP;                            // multi-function pin (open-drain)

   inout                SDA;                            // serial data I/O
   input                SCL;                            // serial data clock

   input                VCC;                            // primary power pin
   input                VBAT;                           // battery backup power pin

   input                RESET;                          // system reset (disable timing checks)


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   parameter            CTRL_BYTE_EEPROM = 7'b1010111;  // control byte for EEPROM access
   parameter            CTRL_BYTE_RTCCSR = 7'b1101111;  // control byte for RTCC/SRAM access

   parameter            UNIQUE_ID_0 = 8'hFF;            // default value
   parameter            UNIQUE_ID_1 = 8'hFF;            // default value
   parameter            UNIQUE_ID_2 = 8'hFF;            // default value
   parameter            UNIQUE_ID_3 = 8'hFF;            // default value
   parameter            UNIQUE_ID_4 = 8'hFF;            // default value
   parameter            UNIQUE_ID_5 = 8'hFF;            // default value
   parameter            UNIQUE_ID_6 = 8'hFF;            // default value
   parameter            UNIQUE_ID_7 = 8'hFF;            // default value

   parameter            T_WC = 500000;                  // timing parameter
   parameter            T_AA = 900;                     // timing parameter

// .......................................................................................................

   reg  [15:00]         OscCounter;                     // oscillator clock active counter
   reg  [14:00]         OscDivider;                     // oscillator clock divider
   wire                 Clk1Hz;                         // internal clock
   wire                 Clk4096Hz;                      // internal clock
   wire                 Clk8192Hz;                      // internal clock
   wire                 Clk32768Hz;                     // internal clock

   reg                  Clk1Hz_D1;                      // internal clock - delayed 1ns

   reg  [15:00]         OscGateTimer;                   // oscillator calibration clock gate

// .......................................................................................................

   reg                  SDA_DO;                         // I2C serial data - output
   reg                  SDA_OE;                         // I2C serial data - output enable

   wire                 SDA_DriveEnable;                // I2C serial data output enable
   reg                  SDA_DriveEnableDlyd;            // I2C serial data output enable - delayed

   reg  [03:00]         I2C_BitCounter;                 // I2C serial bit counter

   reg                  STRT_Rcvd;                      // START bit received flag
   reg                  STOP_Rcvd;                      // STOP bit received flag
   reg                  CTRL_Rcvd;                      // control byte received flag
   reg                  ADDR_Rcvd;                      // byte address received flag
   reg                  MACK_Rcvd;                      // master acknowledge received flag

   reg                  RTCCSR_Access;                  // RTCC/SRAM access operation
   reg                  EEPROM_Access;                  // EEPROM access operation

   reg                  WrOperation;                    // memory write operation
   reg                  RdOperation;                    // memory read operation

   reg  [07:00]         DataShifter;                    // input data shift register

   reg  [07:00]         ControlByte;                    // control byte register
   wire                 CTRL_Valid;                     // control byte valid

   reg                  I2C_FirstRead;                  // I2C first data read flag

   reg  [07:00]         StartAddress;                   // memory access starting address
   reg  [07:00]         WriteAddress;                   // memory write address
   reg  [07:00]         WriteData;                      // memory write address
   reg  [02:00]         PageAddress;                    // memory page address
   reg  [07:00]         PageBuffer [0:7];               // memory write data buffer

   wire                 AddressInvalid;                 // invalid address

   wire [07:00]         WrDataByte;                     // I2C write data
   wire [07:00]         RdDataByte;                     // I2C read data

   reg  [06:00]         RTCCSR_WrAddress;               // RTCC/SRAM write address
   reg  [07:00]         RTCCSR_WrData;                  // RTCC/SRAM write data
   event                RTCCSR_WrEvent;                 // RTCC/SRAM write event

   wire [06:00]         RTCCSR_RdAddress;               // RTCC/SRAM read address 
   wire [07:00]         EEPROM_RdAddress;               // EEPROM read address

   reg  [07:00]         RdPointer;                      // read address pointer
   reg  [15:00]         WrCounter;                      // write buffer counter
   reg  [07:00]         WrPointer;                      // write address pointer
   reg  [02:00]         PagePointer;                    // page buffer write pointer

// .......................................................................................................

   wire                 MFP;                            // multi-function output pin
   reg                  MFP_DO;                         // multi-function output signal

   reg                  Clk64Hz;                        // 64 Hz clock
   reg  [10:00]         Clk64HzCounter;                 // 64 Hz clock generator
   wire [10:00]         Clk64HzLoadValue;               // counter reload value
   reg  [10:00]         Clk64HzSaveValue;               // counter reload value saved

// .......................................................................................................

   reg  [07:00]         RTCC_00;                        // RTCC register
   reg  [07:00]         RTCC_01;                        // RTCC register
   reg  [07:00]         RTCC_02;                        // RTCC register
   reg  [07:00]         RTCC_03;                        // RTCC register
   reg  [07:00]         RTCC_04;                        // RTCC register
   reg  [07:00]         RTCC_05;                        // RTCC register
   reg  [07:00]         RTCC_06;                        // RTCC register
   reg  [07:00]         RTCC_07;                        // RTCC register
   reg  [07:00]         RTCC_08;                        // RTCC register
   reg  [07:00]         RTCC_09;                        // RTCC register
   reg  [07:00]         RTCC_0A;                        // RTCC register
   reg  [07:00]         RTCC_0B;                        // RTCC register
   reg  [07:00]         RTCC_0C;                        // RTCC register
   reg  [07:00]         RTCC_0D;                        // RTCC register
   reg  [07:00]         RTCC_0E;                        // RTCC register
   reg  [07:00]         RTCC_0F;                        // RTCC register
   reg  [07:00]         RTCC_11;                        // RTCC register
   reg  [07:00]         RTCC_12;                        // RTCC register
   reg  [07:00]         RTCC_13;                        // RTCC register
   reg  [07:00]         RTCC_14;                        // RTCC register
   reg  [07:00]         RTCC_15;                        // RTCC register
   reg  [07:00]         RTCC_16;                        // RTCC register
   reg  [07:00]         RTCC_18;                        // RTCC register
   reg  [07:00]         RTCC_19;                        // RTCC register
   reg  [07:00]         RTCC_1A;                        // RTCC register
   reg  [07:00]         RTCC_1B;                        // RTCC register
   reg  [07:00]         RTCC_1C;                        // RTCC register
   reg  [07:00]         RTCC_1D;                        // RTCC register
   reg  [07:00]         RTCC_1E;                        // RTCC register
   reg  [07:00]         RTCC_1F;                        // RTCC register

   wire                 IsLeapYear;                     // leap year flag       
   wire                 IsMidnight;                     // midnight 12AM flag

   wire                 RTCC_ST;                        // control register bit

   reg                  RTCC_OSCON;                     // status register bit
   reg                  RTCC_VBAT;                      // status register bit
   wire                 RTCC_VBATEN;                    // control register bit

   wire                 RTCC_OUT;                       // control register bit
   wire                 RTCC_SQWE;                      // control register bit
   wire                 RTCC_ALM1;                      // control register bit
   wire                 RTCC_ALM0;                      // control register bit
   wire                 RTCC_EXTOSC;                    // control register bit
   wire                 RTCC_RS2;                       // control register bit
   wire                 RTCC_RS1;                       // control register bit
   wire                 RTCC_RS0;                       // control register bit

   wire                 RTCC_ALM0POL;                   // alarm control bit
   wire                 RTCC_ALM0C2;                    // alarm control bit
   wire                 RTCC_ALM0C1;                    // alarm control bit
   wire                 RTCC_ALM0C0;                    // alarm control bit

   wire                 RTCC_ALM1POL;                   // alarm control bit
   wire                 RTCC_ALM1C2;                    // alarm control bit
   wire                 RTCC_ALM1C1;                    // alarm control bit
   wire                 RTCC_ALM1C0;                    // alarm control bit

   reg                  Alarm0_True;                    // alarm condition true
   reg                  Alarm1_True;                    // alarm condition true
   reg                  RTCC_Alarm0;                    // alarm active flag
   reg                  RTCC_Alarm1;                    // alarm active flag
   reg                  RTCC_AlarmOut;                  // alarm output signal

   reg  [07:00]         RTCCSR_RdData;                  // multiplexed read data

// .......................................................................................................

   reg  [07:00]         SRAM_Memory [0:63];             // SRAM memory array
   wire [07:00]         SRAM_RdData;                    // SRAM memory read data
   wire [05:00]         SRAM_RdAddress;                 // SRAM memory read address
   wire [05:00]         SRAM_WrAddress;                 // SRAM memory write address

// .......................................................................................................

   reg  [07:00]         UnlockData0;                    // unique ID unlock register
   reg  [07:00]         UnlockData1;                    // unique ID unlock register
   reg                  UniqueID_Lock;                  // unique ID lock status

   integer              LoopIndex;                      // iterative loop index

   reg                  WriteActive;                    // memory write cycle active

   reg  [07:00]         EEPROM_Memory [0:127];          // EEPROM memory array
   reg  [07:00]         EEPROM_RdData;                  // EEPROM memory read data
   reg  [07:00]         EEPROM_UniqueID [0:7];          // unique ID memory block
   reg  [07:00]         EEPROM_StatusRegister;          // EEPROM status register

   wire [07:00]         EEPROM_MemData;                 // decoded memory data
   wire [07:00]         EEPROM_UIdData;                 // decoded memory data

   wire [01:00]         EEPROM_BlockProtect;            // EEPROM block protection bits


// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin
      OscDivider   = 0;
      OscGateTimer = 0;

      Clk64Hz = 0;
      Clk64HzCounter = 256;
   end

   initial begin
      SDA_DO = 0;
      SDA_OE = 0;
   end

   initial begin
      STRT_Rcvd = 0;
      STOP_Rcvd = 0;
      CTRL_Rcvd = 0;
      ADDR_Rcvd = 0;
      MACK_Rcvd = 0;
   end

   initial begin
      RdPointer = 0;
      WrPointer = 0;

      I2C_BitCounter = 0;
      ControlByte = 0;
   end

   initial begin
      WrOperation = 0;
      RdOperation = 0;
      WriteActive = 0;

      RTCCSR_Access = 0;
      EEPROM_Access = 0;
   end

   initial begin
      RTCC_00 = 8'h00;
      RTCC_01 = 8'h00;
      RTCC_02 = 8'h00;
      RTCC_03 = 8'h01;
      RTCC_04 = 8'h01;
      RTCC_05 = 8'h01;
      RTCC_06 = 8'h01;
      RTCC_07 = 8'h80;
      RTCC_08 = 8'h00;

      RTCC_0A = 8'h00;
      RTCC_0B = 8'h00;
      RTCC_0C = 8'h00;
      RTCC_0D = 8'h01;
      RTCC_0E = 8'h01;
      RTCC_0F = 8'h01;
      RTCC_11 = 8'h00;
      RTCC_12 = 8'h00;
      RTCC_13 = 8'h00;
      RTCC_14 = 8'h01;
      RTCC_15 = 8'h01;
      RTCC_16 = 8'h01;

      RTCC_18 = 8'h00;
      RTCC_19 = 8'h00;
      RTCC_1A = 8'h00;
      RTCC_1B = 8'h00;
      RTCC_1C = 8'h00;
      RTCC_1D = 8'h00;
      RTCC_1E = 8'h00;
      RTCC_1F = 8'h00;
   end

   initial begin
      RTCC_Alarm0 = 0;
      RTCC_Alarm1 = 0;
   end

   initial begin
      RTCC_VBAT = 0;
   end

   initial begin
      EEPROM_StatusRegister = 8'h00;
   end

   initial begin
      UniqueID_Lock = 1;

      EEPROM_UniqueID[0] = UNIQUE_ID_0;
      EEPROM_UniqueID[1] = UNIQUE_ID_1;
      EEPROM_UniqueID[2] = UNIQUE_ID_2;
      EEPROM_UniqueID[3] = UNIQUE_ID_3;
      EEPROM_UniqueID[4] = UNIQUE_ID_4;
      EEPROM_UniqueID[5] = UNIQUE_ID_5;
      EEPROM_UniqueID[6] = UNIQUE_ID_6;
      EEPROM_UniqueID[7] = UNIQUE_ID_7;
   end


// *******************************************************************************************************
// **   I/O LOGIC - XTAL                                                                                **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Xtal2 Output
// -------------------------------------------------------------------------------------------------------

   assign X2 = RTCC_EXTOSC ? 1'bZ : !X1;

// -------------------------------------------------------------------------------------------------------
//      1.02:  Oscillator Clock Divider
// -------------------------------------------------------------------------------------------------------

   always @(posedge X1) begin
      if (RTCC_ST == 1) begin
         if ((OscDivider == 15'h3FFF) & (RTCC_00[6:0] == 7'h59)) begin
            OscDivider <= 15'h4000 + {RTCC_08[6:0],1'b0};
         end
         else if (OscGateTimer == 0) begin
            OscDivider <= OscDivider + 1;
         end
      end
   end

   assign Clk32768Hz = X1;
   assign Clk8192Hz  = OscDivider[01];
   assign Clk4096Hz  = OscDivider[02];
   assign Clk1Hz     = OscDivider[14];

   always @(Clk1Hz) Clk1Hz_D1 <= #1 Clk1Hz;

// -------------------------------------------------------------------------------------------------------
//      1.03:  Oscillator Calibration
// -------------------------------------------------------------------------------------------------------
 
   always @(posedge X1) begin
      if ((OscDivider == 15'h3FFF) & (RTCC_00[6:0] == 7'h59)) begin
         OscGateTimer <= RTCC_08[7] ? 0 : {RTCC_08[6:0],1'b0};
      end
      else if (OscGateTimer != 0) begin
         OscGateTimer <= OscGateTimer - 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.04:  Oscillator Active Detect
// -------------------------------------------------------------------------------------------------------

   initial begin
      RTCC_OSCON = 0;
      OscCounter = 0;
      forever begin
         #(1000000);
         RTCC_OSCON = (OscCounter >= 32);
         OscCounter = 0;
      end
   end

   always @(posedge X1 or negedge RTCC_ST) begin
      if (RTCC_ST == 0) OscCounter <= 0;
      else OscCounter <= OscCounter + 1;
   end


// *******************************************************************************************************
// **   I/O LOGIC - I2C                                                                                 **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      2.01:  START Bit Detection
// -------------------------------------------------------------------------------------------------------

   always @(negedge SDA) begin
      if (SCL == 1) begin
         STRT_Rcvd <= 1;
         STOP_Rcvd <= 0;
         CTRL_Rcvd <= 0;
         ADDR_Rcvd <= 0;
         MACK_Rcvd <= 0;
         I2C_FirstRead  <= 0;
         I2C_BitCounter <= 0;

         WrOperation <= #1 0;
         RdOperation <= #1 0;

         RTCCSR_Access <= #1 0;
         EEPROM_Access <= #1 0;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      2.02:  STOP Bit Detection
// -------------------------------------------------------------------------------------------------------

   always @(posedge SDA) begin
      if (SCL == 1) begin
         STRT_Rcvd <= 0;
         STOP_Rcvd <= 1;
         CTRL_Rcvd <= 0;
         ADDR_Rcvd <= 0;
         MACK_Rcvd <= 0;
         I2C_FirstRead  <= 0;
         I2C_BitCounter <= 10;

         WrOperation <= #1 0;
         RdOperation <= #1 0;

         RTCCSR_Access <= #1 0;
         EEPROM_Access <= #1 0;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      2.03:  Input Shift Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      DataShifter[0] <= SDA;
      DataShifter[1] <= DataShifter[0];
      DataShifter[2] <= DataShifter[1];
      DataShifter[3] <= DataShifter[2];
      DataShifter[4] <= DataShifter[3];
      DataShifter[5] <= DataShifter[4];
      DataShifter[6] <= DataShifter[5];
      DataShifter[7] <= DataShifter[6];
   end

// -------------------------------------------------------------------------------------------------------
//      2.04:  Input Bit Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      if (I2C_BitCounter < 10) I2C_BitCounter <= I2C_BitCounter + 1;
   end

   always @(negedge SCL) begin
      if (I2C_BitCounter == 9) I2C_BitCounter <= 0;
   end

// -------------------------------------------------------------------------------------------------------
//      2.05:  Control Byte Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (STRT_Rcvd & (I2C_BitCounter == 8)) begin
         //if (!WriteActive) begin
            if (DataShifter[0] == 0) WrOperation <= 1;
            if (DataShifter[0] == 1) RdOperation <= 1;

            ControlByte <= DataShifter[7:0];
            CTRL_Rcvd <= 1;

            if (DataShifter[7:1] == CTRL_BYTE_RTCCSR) RTCCSR_Access <= 1;
            if (DataShifter[7:1] == CTRL_BYTE_EEPROM) EEPROM_Access <= 1;
         //end
         STRT_Rcvd <= 0;
      end
   end

   assign CTRL_Valid = STRT_Rcvd & (DataShifter[7:1]==CTRL_BYTE_EEPROM)
                     | STRT_Rcvd & (DataShifter[7:1]==CTRL_BYTE_RTCCSR)
                     | CTRL_Rcvd & (ControlByte[7:1]==CTRL_BYTE_EEPROM)
                     | CTRL_Rcvd & (ControlByte[7:1]==CTRL_BYTE_RTCCSR);

// -------------------------------------------------------------------------------------------------------
//      2.06:  Address Byte Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (CTRL_Rcvd & (I2C_BitCounter == 8)) begin
         StartAddress <= DataShifter[7:0];
         RdPointer    <= DataShifter[7:0];
         WrCounter <= 0;
         WrPointer <= 0;

         CTRL_Rcvd <= 0;
         ADDR_Rcvd <= 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      2.07:  Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (ADDR_Rcvd & (I2C_BitCounter == 8)) begin
         if (EEPROM_Access & WrOperation/*(WP == 0) & (RdWrBit == 0)*/) begin
            PagePointer = WrPointer[2:0];
            PageBuffer[PagePointer] <= DataShifter[7:0];

            WrCounter <= WrCounter + 1;
            WrPointer <= WrPointer + 1;
         end
         if (RTCCSR_Access & WrOperation) begin
            RTCCSR_WrAddress <= StartAddress + WrPointer;
            RTCCSR_WrData <= DataShifter[7:0];

            WrCounter <= WrCounter + 1;
            WrPointer <= WrPointer + 1;
            #(1.00);
            if (RTCCSR_WrAddress < 7'h60) ->RTCCSR_WrEvent; 
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      2.08:  Acknowledge Generator
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (!WriteActive) begin
         if ((STRT_Rcvd & CTRL_Valid) | CTRL_Rcvd | WrOperation | (RdOperation & !ADDR_Rcvd)) begin
            if ((I2C_BitCounter == 8) & !AddressInvalid) begin
               SDA_DO <= 0;
               SDA_OE <= 1;
            end 
            if (I2C_BitCounter == 9) begin
               SDA_DO <= 0;
               SDA_OE <= 0;
            end
         end
      end
   end

   assign AddressInvalid = ADDR_Rcvd & RTCCSR_Access & WrOperation & ((StartAddress + WrPointer) >= 7'h60)
                         | CTRL_Rcvd & RTCCSR_Access & (DataShifter[7:0] >= 7'h60)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'h8)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'h9)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'hA)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'hB)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'hC)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'hD)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:4] == 4'hE)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hF8)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hF9)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hFA)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hFB)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hFC)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hFD)
                         | CTRL_Rcvd & EEPROM_Access & (DataShifter[7:0] == 8'hFE);

// -------------------------------------------------------------------------------------------------------
//      2.09:  Acknowledge Detect
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      if (RdOperation & (I2C_BitCounter == 8)) begin
         if ((SDA == 0) & (SDA_OE == 0)) MACK_Rcvd <= 1;
      end
   end

   always @(negedge SCL) MACK_Rcvd <= 0;

// -------------------------------------------------------------------------------------------------------
//      2.10:  STOP Flag Removal 
// -------------------------------------------------------------------------------------------------------

   always @(posedge STOP_Rcvd) begin
      #(1.00);
      STOP_Rcvd = 0;
   end

// -------------------------------------------------------------------------------------------------------
//      2.11:  Read Data Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (RdOperation & CTRL_Rcvd) begin
         if ((I2C_BitCounter == 8) & !AddressInvalid) begin
            I2C_FirstRead <= 1;
         end
      end
      if (RdOperation & ADDR_Rcvd) begin
         if (I2C_BitCounter == 8) begin
            SDA_DO <= 0;
            SDA_OE <= 0;
         end
         else if (I2C_BitCounter == 9) begin
            I2C_FirstRead <= 0;

            SDA_DO <= RdDataByte[7];
            SDA_OE <= MACK_Rcvd | I2C_FirstRead;
         end
         else begin
            SDA_DO <= RdDataByte[7-I2C_BitCounter];
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      2.12:  Read Data Multiplexor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (I2C_BitCounter == 8) begin
         if (WrOperation & ADDR_Rcvd) begin
            RdPointer <= StartAddress + WrPointer + 1;
         end
         if (RdOperation) begin
            RdPointer <= RdPointer + 1;
         end
      end
   end

   assign RTCCSR_RdAddress = RdPointer[6:0];
   assign EEPROM_RdAddress = RdPointer[7:0];

   assign RdDataByte = RTCCSR_Access ? RTCCSR_RdData : EEPROM_RdData;

// -------------------------------------------------------------------------------------------------------
//      2.13:  SDA Data I/O Buffer
// -------------------------------------------------------------------------------------------------------

   bufif1 (SDA, 1'b0, SDA_DriveEnableDlyd);

   assign SDA_DriveEnable = !SDA_DO & SDA_OE;
   always @(SDA_DriveEnable) SDA_DriveEnableDlyd <= #(T_AA) SDA_DriveEnable;


// *******************************************************************************************************
// **   I/O LOGIC - MFP                                                                                 **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      3.01:  Output Pin Open-Drain Driver
// -------------------------------------------------------------------------------------------------------

   bufif1 (MFP, 1'b0, (MFP_DO == 0));

// -------------------------------------------------------------------------------------------------------
//      3.02:  Output Pin Signal Select
// -------------------------------------------------------------------------------------------------------

   always @(RTCC_OUT or RTCC_SQWE or RTCC_VBAT or RTCC_RS2 or RTCC_RS1 or RTCC_RS0 or
            Clk64Hz or Clk1Hz or Clk4096Hz or Clk8192Hz or Clk32768Hz) begin
      casex ({RTCC_SQWE, RTCC_RS2,RTCC_RS1,RTCC_RS0})
         4'b0_xxx:  MFP_DO = RTCC_OUT;

         4'b1_1xx:  MFP_DO = RTCC_VBAT | Clk64Hz;
         4'b1_000:  MFP_DO = RTCC_VBAT | Clk1Hz;
         4'b1_001:  MFP_DO = RTCC_VBAT | Clk4096Hz;
         4'b1_010:  MFP_DO = RTCC_VBAT | Clk8192Hz;
         4'b1_011:  MFP_DO = RTCC_VBAT | Clk32768Hz;
      endcase
   end

// -------------------------------------------------------------------------------------------------------
//      3.03:  Output Signal - 64.0 Hz Clock
// -------------------------------------------------------------------------------------------------------

   always @(posedge X1) begin
      if (Clk64HzCounter == 1) begin
         Clk64HzCounter   <= Clk64HzLoadValue;
         Clk64HzSaveValue <= Clk64HzLoadValue;
      end
      else begin
         Clk64HzCounter <= Clk64HzCounter - 1;
      end
   end

   always @(posedge X1) begin
      if (Clk64HzCounter == 1)                             Clk64Hz <= 1;
      else if (Clk64HzCounter == ((Clk64HzSaveValue/2)+1)) Clk64Hz <= 0;
   end

   assign Clk64HzLoadValue = RTCC_08[7] ? (512 - {RTCC_08[6:0],2'h0}) : (512 + {RTCC_08[6:0],2'h0});


// *******************************************************************************************************
// **   CORE LOGIC - RTCC                                                                               **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      4.01:  RTCC Control and Data Registers
// -------------------------------------------------------------------------------------------------------

   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h00) RTCC_00 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h01) RTCC_01 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h02) RTCC_02 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h03) RTCC_03 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h04) RTCC_04 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h05) RTCC_05 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h06) RTCC_06 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h07) RTCC_07 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h08) RTCC_08 <= RTCCSR_WrData;

   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0A) RTCC_0A <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0B) RTCC_0B <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0C) RTCC_0C <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0D) RTCC_0D <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0E) RTCC_0E <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h0F) RTCC_0F <= RTCCSR_WrData;

   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h11) RTCC_11 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h12) RTCC_12 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h13) RTCC_13 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h14) RTCC_14 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h15) RTCC_15 <= RTCCSR_WrData;
   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h16) RTCC_16 <= RTCCSR_WrData;

// -------------------------------------------------------------------------------------------------------
//      4.02:  RTCC Control Register Bits
// -------------------------------------------------------------------------------------------------------

   assign RTCC_ST     = RTCC_00[7];

   assign RTCC_VBATEN = RTCC_03[3];

   assign RTCC_OUT    = RTCC_07[7];
   assign RTCC_SQWE   = RTCC_07[6];
   assign RTCC_ALM1   = RTCC_07[5];
   assign RTCC_ALM0   = RTCC_07[4];
   assign RTCC_EXTOSC = RTCC_07[3];
   assign RTCC_RS2    = RTCC_07[2];
   assign RTCC_RS1    = RTCC_07[1];
   assign RTCC_RS0    = RTCC_07[0];

   assign RTCC_ALM0POL = RTCC_0D[7];
   assign RTCC_ALM0C2  = RTCC_0D[6];
   assign RTCC_ALM0C1  = RTCC_0D[5];
   assign RTCC_ALM0C0  = RTCC_0D[4];

   assign RTCC_ALM1POL = RTCC_0D[7];
   assign RTCC_ALM1C2  = RTCC_14[6];
   assign RTCC_ALM1C1  = RTCC_14[5];
   assign RTCC_ALM1C0  = RTCC_14[4];

// -------------------------------------------------------------------------------------------------------
//      4.03:  RTCC Time and Date - Seconds
// -------------------------------------------------------------------------------------------------------

   always @(posedge Clk1Hz) begin
      if      ((RTCC_00[6:4]==5) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h0,4'h0};
      else if ((RTCC_00[6:4]==4) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h5,4'h0};
      else if ((RTCC_00[6:4]==3) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h4,4'h0};
      else if ((RTCC_00[6:4]==2) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h3,4'h0};
      else if ((RTCC_00[6:4]==1) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h2,4'h0};
      else if ((RTCC_00[6:4]==0) & (RTCC_00[3:0]==9))    RTCC_00[6:0] <= {3'h1,4'h0};
      else                                               RTCC_00[3:0] <= RTCC_00[3:0] + 1;
   end

// -------------------------------------------------------------------------------------------------------
//      4.04:  RTCC Time and Date - Minutes
// -------------------------------------------------------------------------------------------------------

   always @(posedge Clk1Hz) begin
      if ((RTCC_00[6:4]==5) & (RTCC_00[3:0]==9)) begin
         if      ((RTCC_01[6:4]==5) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h0,4'h0};
         else if ((RTCC_01[6:4]==4) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h5,4'h0};
         else if ((RTCC_01[6:4]==3) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h4,4'h0};
         else if ((RTCC_01[6:4]==2) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h3,4'h0};
         else if ((RTCC_01[6:4]==1) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h2,4'h0};
         else if ((RTCC_01[6:4]==0) & (RTCC_01[3:0]==9)) RTCC_01[6:0] <= {3'h1,4'h0};
         else                                            RTCC_01[3:0] <= RTCC_01[3:0] + 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.05:  RTCC Time and Date - Hours
// -------------------------------------------------------------------------------------------------------

   always @(posedge Clk1Hz) begin
      if ((RTCC_01[6:4]==5) & (RTCC_01[3:0]==9) & (RTCC_00[6:4]==5) & (RTCC_00[3:0]==9)) begin
         if (RTCC_02[6] == 0) begin // 24 hour format
            if      ((RTCC_02[5:4]==0) & (RTCC_02[3:0]==9))     RTCC_02[5:0] <= {2'h1,4'h0};
            else if ((RTCC_02[5:4]==1) & (RTCC_02[3:0]==9))     RTCC_02[5:0] <= {2'h2,4'h0};
            else if ((RTCC_02[5:4]==2) & (RTCC_02[3:0]==3))     RTCC_02[5:0] <= {2'h0,4'h0};
            else                                                RTCC_02[3:0] <= RTCC_02[3:0] + 1;
         end
         else begin                 // 12 hour format
            if      ((RTCC_02[5:4]==0) & (RTCC_02[3:0]==9))     RTCC_02[5:0] <= {2'h1,4'h0};
            else if ((RTCC_02[5:4]==1) & (RTCC_02[3:0]==1))     RTCC_02[5:0] <= {2'h3,4'h2};
            else if ((RTCC_02[5:4]==1) & (RTCC_02[3:0]==2))     RTCC_02[5:0] <= {2'h0,4'h1};
            else if ((RTCC_02[5:4]==2) & (RTCC_02[3:0]==9))     RTCC_02[5:0] <= {2'h3,4'h0};
            else if ((RTCC_02[5:4]==3) & (RTCC_02[3:0]==1))     RTCC_02[5:0] <= {2'h1,4'h2};
            else if ((RTCC_02[5:4]==3) & (RTCC_02[3:0]==2))     RTCC_02[5:0] <= {2'h2,4'h1};
            else                                                RTCC_02[3:0] <= RTCC_02[3:0] + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.06:  RTCC Time and Date - Days
// -------------------------------------------------------------------------------------------------------

   always @(posedge Clk1Hz) begin
      if ((RTCC_01[6:4]==5) & (RTCC_01[3:0]==9) & (RTCC_00[6:4]==5) & (RTCC_00[3:0]==9)) begin
         if ((RTCC_02[6] == 0) & (RTCC_02[5:4]==2) & (RTCC_02[3:0]==3)) begin // 24 hour format
            if (RTCC_03[2:0]==7)        RTCC_03[2:0] <= {3'h1};
            else                        RTCC_03[2:0] <= RTCC_03[2:00] + 1;
         end
         if ((RTCC_02[6] == 1) & (RTCC_02[5:4]==3) & (RTCC_02[3:0]==1)) begin // 12 hour format
            if (RTCC_03[2:0]==7)        RTCC_03[2:0] <= {3'h1};
            else                        RTCC_03[2:0] <= RTCC_03[2:00] + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.07:  RTCC Time and Date - Year/Month/Date
// -------------------------------------------------------------------------------------------------------

   always @(posedge Clk1Hz) begin
      if ((RTCC_01[6:4]==5) & (RTCC_01[3:0]==9) & (RTCC_00[6:4]==5) & (RTCC_00[3:0]==9)) begin
         if ((RTCC_02[6] == 0) & (RTCC_02[5:4]==2) & (RTCC_02[3:0]==3)) begin // 24 hour format
            {RTCC_06,RTCC_05,RTCC_04} <= DateNext(RTCC_06[7:0],RTCC_05[4:0],RTCC_04[5:0]);
         end
         if ((RTCC_02[6] == 1) & (RTCC_02[5:4]==3) & (RTCC_02[3:0]==1)) begin // 12 hour format
            {RTCC_06,RTCC_05,RTCC_04} <= DateNext(RTCC_06[7:0],RTCC_05[4:0],RTCC_04[5:0]);
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.08:  RTCC Time and Date - Status Signals
// -------------------------------------------------------------------------------------------------------

   assign IsLeapYear = ((BCDtoHex(RTCC_06) % 4) == 0) ? 1 : 0;

   assign IsMidnight = (RTCC_02[6] ? (RTCC_02[5:0] == 6'h12) : (RTCC_02[5:0] == 6'h00))
                     & (RTCC_00[6:0] == 0) 
                     & (RTCC_01[6:0] == 0);

// -------------------------------------------------------------------------------------------------------
//      4.09:  RTCC Alarm #0 Logic
// -------------------------------------------------------------------------------------------------------

   always @(RTCC_00 or RTCC_01 or RTCC_02 or RTCC_03 or RTCC_04 or RTCC_05 or
            RTCC_0A or RTCC_0B or RTCC_0C or RTCC_0D or RTCC_0E or RTCC_0F or
            RTCC_ALM0C2 or RTCC_ALM0C1 or RTCC_ALM0C0 or IsMidnight) begin
      Alarm0_True = 0;
      case ({RTCC_ALM0C2,RTCC_ALM0C1,RTCC_ALM0C0})
         3'h0:  if ((RTCC_00[6:0] == RTCC_0A[6:0])) Alarm0_True = 1; 
         3'h1:  if ((RTCC_01[6:0] == RTCC_0B[6:0])) Alarm0_True = 1; 
         3'h2:  if ((RTCC_02[5:0] == RTCC_0C[5:0])) Alarm0_True = 1; 
         3'h3:  if ((RTCC_03[2:0] == RTCC_0D[2:0]) & IsMidnight) Alarm0_True = 1;
         3'h4:  if ((RTCC_04[5:0] == RTCC_0E[5:0])) Alarm0_True = 1; 
         3'h7:  if ((RTCC_00[6:0] == RTCC_0A[6:0]) &
                    (RTCC_01[6:0] == RTCC_0B[6:0]) &
                    (RTCC_02[5:0] == RTCC_0C[5:0]) &
                    (RTCC_04[5:0] == RTCC_0E[5:0]) &
                    (RTCC_05[4:0] == RTCC_0F[4:0])) Alarm0_True = 1;
      endcase
   end

   always @(posedge Clk1Hz_D1) if (Alarm0_True) RTCC_Alarm0 <= 1;
   always @(RTCCSR_WrEvent) if ((RTCCSR_WrAddress == 7'h0D) & !RTCCSR_WrData[3]) RTCC_Alarm0 <= 0;

// -------------------------------------------------------------------------------------------------------
//      4.10:  RTCC Alarm #1 Logic
// -------------------------------------------------------------------------------------------------------

   always @(RTCC_00 or RTCC_01 or RTCC_02 or RTCC_03 or RTCC_04 or RTCC_05 or
            RTCC_11 or RTCC_12 or RTCC_13 or RTCC_14 or RTCC_15 or RTCC_16 or
            RTCC_ALM1C2 or RTCC_ALM1C1 or RTCC_ALM1C0 or IsMidnight) begin
      Alarm1_True = 0;
      case ({RTCC_ALM1C2,RTCC_ALM1C1,RTCC_ALM1C0})
         3'h0:  if ((RTCC_00[6:0] == RTCC_11[6:0])) Alarm1_True = 1; 
         3'h1:  if ((RTCC_01[6:0] == RTCC_12[6:0])) Alarm1_True = 1; 
         3'h2:  if ((RTCC_02[5:0] == RTCC_13[5:0])) Alarm1_True = 1; 
         3'h3:  if ((RTCC_03[2:0] == RTCC_14[2:0]) & IsMidnight) Alarm1_True = 1;
         3'h4:  if ((RTCC_04[5:0] == RTCC_15[5:0])) Alarm1_True = 1; 
         3'h7:  if ((RTCC_00[6:0] == RTCC_11[6:0]) &
                    (RTCC_01[6:0] == RTCC_12[6:0]) &
                    (RTCC_02[5:0] == RTCC_13[5:0]) &
                    (RTCC_04[5:0] == RTCC_15[5:0]) &
                    (RTCC_05[4:0] == RTCC_16[4:0])) Alarm1_True = 1;
      endcase
   end

   always @(posedge Clk1Hz_D1) if (Alarm1_True) RTCC_Alarm1 <= 1;
   always @(RTCCSR_WrEvent) if ((RTCCSR_WrAddress == 7'h14) & !RTCCSR_WrData[3]) RTCC_Alarm1 <= 0;

// -------------------------------------------------------------------------------------------------------
//      4.11:  RTCC Alarm Output Signal
// -------------------------------------------------------------------------------------------------------

   always @(RTCC_Alarm0 or RTCC_Alarm1 or RTCC_ALM0POL) begin
      case ({RTCC_Alarm1,RTCC_Alarm0, RTCC_ALM0POL})
         3'b00_1:  RTCC_AlarmOut = 0;
         3'b01_1:  RTCC_AlarmOut = 1;
         3'b10_1:  RTCC_AlarmOut = 1;
         3'b11_1:  RTCC_AlarmOut = 1;

         3'b00_0:  RTCC_AlarmOut = 1;
         3'b01_0:  RTCC_AlarmOut = 0;
         3'b10_0:  RTCC_AlarmOut = 0;
         3'b11_0:  RTCC_AlarmOut = 0;
      endcase
   end

// -------------------------------------------------------------------------------------------------------
//      4.12:  RTCC Power Fail Detect
// -------------------------------------------------------------------------------------------------------

   always @(VCC or VBAT or RTCC_VBATEN) begin
      casex ({VCC,VBAT})
         2'b1x:  RTCC_VBAT = 0;   
         2'b00:  RTCC_VBAT = 0;   
         2'b01:  RTCC_VBAT = RTCC_VBATEN;
      endcase
   end

   always @(RTCCSR_WrEvent) if ((RTCCSR_WrAddress == 7'h03) & !RTCCSR_WrData[4]) RTCC_VBAT <= 0;

// -------------------------------------------------------------------------------------------------------
//      4.13:  RTCC Time Saver Registers - VCC Fail
// -------------------------------------------------------------------------------------------------------

   always @(negedge VCC) begin
      RTCC_18 <= {1'h0,RTCC_01[6:0]};
      RTCC_19 <= {1'h0,RTCC_02[6:0]};
      RTCC_1A <= {2'h0,RTCC_04[5:0]};
      RTCC_1B <= {RTCC_03[2:0],RTCC_05[4:0]};
   end

   always @(RTCCSR_WrEvent) begin
      if ((RTCCSR_WrAddress == 7'h03) & !RTCCSR_WrData[4]) begin
         RTCC_18 <= 8'h00;
         RTCC_19 <= 8'h00;
         RTCC_1A <= 8'h00;
         RTCC_1B <= 8'h00;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.14:  RTCC Time Saver Registers - VCC OK
// -------------------------------------------------------------------------------------------------------

   always @(posedge VCC) begin
      if (RTCC_VBAT == 1) begin
         RTCC_1C <= {1'h0,RTCC_01[6:0]};
         RTCC_1D <= {1'h0,RTCC_02[6:0]};
         RTCC_1E <= {2'h0,RTCC_04[5:0]};
         RTCC_1F <= {RTCC_03[2:0],RTCC_05[4:0]};
      end
   end

   always @(RTCCSR_WrEvent) begin
      if ((RTCCSR_WrAddress == 7'h03) & !RTCCSR_WrData[4]) begin
         RTCC_1C <= 8'h00;
         RTCC_1D <= 8'h00;
         RTCC_1E <= 8'h00;
         RTCC_1F <= 8'h00;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      4.15:  RTCC Read Data Multiplexor
// -------------------------------------------------------------------------------------------------------

   always @(RTCC_00 or RTCC_01 or RTCC_02 or RTCC_03 or RTCC_04 or RTCC_05 or RTCC_06 or RTCC_07 or
            RTCC_08 or RTCC_0A or RTCC_0B or RTCC_0C or RTCC_0D or RTCC_0E or RTCC_0F or 
            RTCC_11 or RTCC_12 or RTCC_13 or RTCC_14 or RTCC_15 or RTCC_16 or RTCC_18 or RTCC_19 or
            RTCC_1A or RTCC_1B or RTCC_1C or RTCC_1D or RTCC_1E or RTCC_1F or RTCC_OSCON or 
            RTCC_VBAT or IsLeapYear or SRAM_RdData or UnlockData0 or RTCCSR_RdAddress) begin 
      casex (RTCCSR_RdAddress)
         7'h00:  RTCCSR_RdData = RTCC_00;                                  // seconds
         7'h01:  RTCCSR_RdData = {1'h0,RTCC_01[6:0]};                      // minutes
         7'h02:  RTCCSR_RdData = {1'h0,RTCC_02[6:0]};                      // hours
         7'h03:  RTCCSR_RdData = {2'h0,RTCC_OSCON,RTCC_VBAT,RTCC_03[3:0]}; // day
         7'h04:  RTCCSR_RdData = {2'h0,RTCC_04[5:0]};                      // date
         7'h05:  RTCCSR_RdData = {2'h0,IsLeapYear,RTCC_05[4:0]};           // month
         7'h06:  RTCCSR_RdData = RTCC_06;                                  // year
         7'h07:  RTCCSR_RdData = {RTCC_07[7:6],RTCC_Alarm1,RTCC_Alarm0,RTCC_07[3:0]}; // control
         7'h08:  RTCCSR_RdData = RTCC_08;                                  // calibration
         7'h09:  RTCCSR_RdData = UnlockData0;                              // unlock data

         7'h0A:  RTCCSR_RdData = {1'h0,RTCC_0A[6:0]};                      // alarm0 seconds
         7'h0B:  RTCCSR_RdData = {1'h0,RTCC_0B[6:0]};                      // alarm0 minutes
         7'h0C:  RTCCSR_RdData = {1'h0,RTCC_02[6],RTCC_0C[5:0]};           // alarm0 hours
         7'h0D:  RTCCSR_RdData = {RTCC_0D[7],RTCC_0D[6:4],RTCC_Alarm0,RTCC_0D[2:0]};  // alarm0 day
         7'h0E:  RTCCSR_RdData = {2'h0,RTCC_0E[5:0]};                      // alarm0 date
         7'h0F:  RTCCSR_RdData = {3'h0,RTCC_0F[4:0]};                      // alarm0 month
         7'h10:  RTCCSR_RdData = 8'h01;                                    // reserved

         7'h11:  RTCCSR_RdData = {1'h0,RTCC_11[6:0]};                      // alarm1 seconds
         7'h12:  RTCCSR_RdData = {1'h0,RTCC_12[6:0]};                      // alarm1 minutes
         7'h13:  RTCCSR_RdData = {1'h0,RTCC_02[6],RTCC_13[5:0]};           // alarm1 hours
         7'h14:  RTCCSR_RdData = {RTCC_0D[7],RTCC_14[6:4],RTCC_Alarm1,RTCC_14[2:0]};  // alarm1 day
         7'h15:  RTCCSR_RdData = {2'h0,RTCC_15[5:0]};                      // alarm1 date
         7'h16:  RTCCSR_RdData = {3'h0,RTCC_16[4:0]};                      // alarm1 month
         7'h17:  RTCCSR_RdData = 8'h01;                                    // reserved

         7'h18:  RTCCSR_RdData = {1'h0,RTCC_18[6:0]};                      // timestamp minutes
         7'h19:  RTCCSR_RdData = {1'h0,RTCC_19[6:0]};                      // timestamp hours
         7'h1A:  RTCCSR_RdData = {2'h0,RTCC_1A[5:0]};                      // timestamp date
         7'h1B:  RTCCSR_RdData = RTCC_1B;                                  // timestamp month

         7'h1C:  RTCCSR_RdData = {1'h0,RTCC_1C[6:0]};                      // timestamp minutes
         7'h1D:  RTCCSR_RdData = {1'h0,RTCC_1D[6:0]};                      // timestamp hours
         7'h1E:  RTCCSR_RdData = {2'h0,RTCC_1E[5:0]};                      // timestamp date
         7'h1F:  RTCCSR_RdData = RTCC_1F;                                  // timestamp month

         default: RTCCSR_RdData = SRAM_RdData;                             // SRAM memory area (0x20-0x5F)
      endcase
   end


// *******************************************************************************************************
// **   CORE LOGIC - SRAM                                                                               **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      5.01:  SRAM Write Logic
// -------------------------------------------------------------------------------------------------------

   assign SRAM_WrAddress = RTCCSR_WrAddress - 7'h20;

   always @(RTCCSR_WrEvent) begin
      SRAM_Memory[SRAM_WrAddress] = RTCCSR_WrData;
   end

// -------------------------------------------------------------------------------------------------------
//      5.02:  SRAM Read Logic
// -------------------------------------------------------------------------------------------------------

   assign SRAM_RdAddress = RTCCSR_RdAddress - 7'h20;
   assign SRAM_RdData = SRAM_Memory[SRAM_RdAddress];


// *******************************************************************************************************
// **   CORE LOGIC - EEPROM                                                                             **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      6.01:  EEPROM Write Operation Timer
// -------------------------------------------------------------------------------------------------------

   always @(posedge STOP_Rcvd) begin
      if (EEPROM_Access & WrOperation & (WrCounter > 0)) begin
         if (((StartAddress[7:3] == 5'h1E) & !UniqueID_Lock) || 
             ((StartAddress[7:3] == 5'h1F)) ||
             ((StartAddress[7:3]  < 5'h0C) & (EEPROM_BlockProtect == 2'b01)) ||
             ((StartAddress[7:3]  < 5'h08) & (EEPROM_BlockProtect == 2'b10)) ||
             ((StartAddress[7] == 0) & (EEPROM_BlockProtect == 2'b00))) begin
            WriteActive = 1;
            #(T_WC);
            WriteActive = 0;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      6.02:  EEPROM Memory Write Logic
// -------------------------------------------------------------------------------------------------------

   always @(negedge WriteActive) begin
      for (LoopIndex = 0; LoopIndex < WrCounter; LoopIndex = LoopIndex + 1) begin
         PageAddress = StartAddress[2:0] + LoopIndex;
         WriteAddress = {StartAddress[7:3],PageAddress[2:0]};

         if (EEPROM_BlockProtect == 2'b00) begin
            EEPROM_Memory[WriteAddress] = PageBuffer[LoopIndex[2:0]];
         end
         if (EEPROM_BlockProtect == 2'b01) begin
            if (WriteAddress < 8'h60) begin
               EEPROM_Memory[WriteAddress] = PageBuffer[LoopIndex[2:0]];
            end
         end
         if (EEPROM_BlockProtect == 2'b10) begin
            if (WriteAddress < 8'h40) begin
               EEPROM_Memory[WriteAddress] = PageBuffer[LoopIndex[2:0]];
            end
         end
         if (EEPROM_BlockProtect == 2'b11) begin
            // EEPROM memory is write-protected
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      6.03:  EEPROM Memory Read Logic
// -------------------------------------------------------------------------------------------------------

   always @(EEPROM_RdAddress or EEPROM_MemData or EEPROM_UIdData or EEPROM_StatusRegister) begin
      EEPROM_RdData = 0;
      casex (EEPROM_RdAddress)
         8'b0xxx_xxxx:  EEPROM_RdData = EEPROM_MemData;
         8'b1111_0xxx:  EEPROM_RdData = EEPROM_UIdData;
         8'b1111_1111:  EEPROM_RdData = EEPROM_StatusRegister;
      endcase
   end

   assign EEPROM_MemData = EEPROM_Memory[EEPROM_RdAddress[6:0]];
   assign EEPROM_UIdData = EEPROM_UniqueID[EEPROM_RdAddress[2:0]];

// -------------------------------------------------------------------------------------------------------
//      6.04:  EEPROM Status Register
// -------------------------------------------------------------------------------------------------------

   always @(negedge WriteActive) begin
      for (LoopIndex = 0; LoopIndex < WrCounter; LoopIndex = LoopIndex + 1) begin
         PageAddress = StartAddress[2:0] + LoopIndex;
         WriteAddress = {StartAddress[7:3],PageAddress[2:0]};
         WriteData = PageBuffer[LoopIndex[2:0]];

         if (WriteAddress == 8'hFF) EEPROM_StatusRegister = {4'h0,WriteData[3:2],2'h0};
      end
   end

   assign EEPROM_BlockProtect = EEPROM_StatusRegister[03:02];

// -------------------------------------------------------------------------------------------------------
//      6.05:  EEPROM Unique ID Unlock Logic
// -------------------------------------------------------------------------------------------------------

   always @(RTCCSR_WrEvent) if (RTCCSR_WrAddress == 7'h09) UnlockData0 <= RTCCSR_WrData;

   always @(posedge STOP_Rcvd) begin
      if (RTCCSR_WrAddress == 7'h09) begin
         UnlockData1 <= UnlockData0;
      end
      else begin
         UnlockData0 <= 8'h00;
         UnlockData1 <= 8'h00;
      end
   end

   always @(negedge VCC) UniqueID_Lock = 1;

   always @(posedge STOP_Rcvd) begin
      if (StartAddress[7:3] == 5'h1E) UniqueID_Lock = 1;
   end

   always @(posedge STOP_Rcvd) begin
      if ((UnlockData0==8'hAA) & (UnlockData1==8'h55) & (RTCCSR_WrAddress==7'h09)) UniqueID_Lock = 0;
   end
  
// -------------------------------------------------------------------------------------------------------
//      6.06:  EEPROM Unique ID Write Logic
// -------------------------------------------------------------------------------------------------------

   always @(negedge WriteActive) begin
      for (LoopIndex = 0; LoopIndex < WrCounter; LoopIndex = LoopIndex + 1) begin
         PageAddress = StartAddress[2:0] + LoopIndex;
         WriteAddress = {StartAddress[7:3],PageAddress[2:0]};

         if (WriteAddress == 8'hF0) EEPROM_UniqueID[0] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF1) EEPROM_UniqueID[1] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF2) EEPROM_UniqueID[2] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF3) EEPROM_UniqueID[3] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF4) EEPROM_UniqueID[4] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF5) EEPROM_UniqueID[5] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF6) EEPROM_UniqueID[6] = PageBuffer[LoopIndex[2:0]];
         if (WriteAddress == 8'hF7) EEPROM_UniqueID[7] = PageBuffer[LoopIndex[2:0]];
      end
   end


// *******************************************************************************************************
// **   LOGIC FUNCTIONS                                                                                 **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      7.01:  DateNext - Compute the Next Year-Month-Date
// -------------------------------------------------------------------------------------------------------

   function [23:00] DateNext;

      input [07:00] Year;
      input [04:00] Month;
      input [05:00] Date;

      reg           LeapYear;

      reg   [07:00] ThisYear;
      reg   [07:00] ThisMonth;
      reg   [07:00] ThisDate;

      reg   [07:00] NextYear;
      reg   [07:00] NextMonth;
      reg   [07:00] NextDate;

      begin
         ThisYear  = BCDtoHex(Year[7:0]);
         ThisMonth = BCDtoHex({3'h0,Month[4:0]});
         ThisDate  = BCDtoHex({2'h0,Date [5:0]});

         NextYear  = ThisYear;
         NextMonth = ThisMonth;
         NextDate  = ThisDate;

         LeapYear = ((ThisYear % 4) == 0) ? 1 : 0;

         if      ((ThisMonth ==  1) & (ThisDate == 31)) begin NextMonth =  2; NextDate = 1; end
         else if ((ThisMonth ==  2) & (ThisDate == 28) & !LeapYear) begin NextMonth = 3; NextDate = 1; end
         else if ((ThisMonth ==  2) & (ThisDate == 29) &  LeapYear) begin NextMonth = 3; NextDate = 1; end
         else if ((ThisMonth ==  3) & (ThisDate == 31)) begin NextMonth =  4; NextDate = 1; end
         else if ((ThisMonth ==  4) & (ThisDate == 30)) begin NextMonth =  5; NextDate = 1; end
         else if ((ThisMonth ==  5) & (ThisDate == 31)) begin NextMonth =  6; NextDate = 1; end
         else if ((ThisMonth ==  6) & (ThisDate == 30)) begin NextMonth =  7; NextDate = 1; end
         else if ((ThisMonth ==  7) & (ThisDate == 31)) begin NextMonth =  8; NextDate = 1; end
         else if ((ThisMonth ==  8) & (ThisDate == 31)) begin NextMonth =  9; NextDate = 1; end
         else if ((ThisMonth ==  9) & (ThisDate == 30)) begin NextMonth = 10; NextDate = 1; end
         else if ((ThisMonth == 10) & (ThisDate == 31)) begin NextMonth = 11; NextDate = 1; end
         else if ((ThisMonth == 11) & (ThisDate == 30)) begin NextMonth = 12; NextDate = 1; end
         else if ((ThisMonth == 12) & (ThisDate == 31)) begin NextMonth =  1; NextDate = 1; NextYear = ThisYear + 1; end
         else NextDate = ThisDate + 1;

         NextYear  = HexToBCD(NextYear);
         NextMonth = HexToBCD(NextMonth);
         NextDate  = HexToBCD(NextDate);

         DateNext = {NextYear[7:0],3'h0,NextMonth[4:0],2'h0,NextDate[5:0]};
      end
   endfunction

// -------------------------------------------------------------------------------------------------------
//      7.02:  BCDtoHex - Convert BCD to Hex Value
// -------------------------------------------------------------------------------------------------------

   function [07:00] BCDtoHex;

      input [07:00] BCD;

      reg   [07:00] Tens;
      reg   [07:00] Ones;

      begin
         Tens = BCD[07:04] * 10;
         Ones = BCD[03:00];

         BCDtoHex = Tens + Ones; 
      end
   endfunction

// -------------------------------------------------------------------------------------------------------
//      7.03:  HexToBCD - Convert Hex to BCD Value
// -------------------------------------------------------------------------------------------------------

   function [07:00] HexToBCD;

      input [07:00] Hex;

      reg   [03:00] Tens;
      reg   [03:00] Ones;

      begin
         Tens = Hex / 10;
         Ones = Hex % 10;
         HexToBCD = {Tens[3:0],Ones[3:0]}; 
      end
   endfunction


// *******************************************************************************************************
// **   DEBUG LOGIC                                                                                     **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      8.01:  SRAM Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] SRAM_Byte00 = SRAM_Memory[00];
   wire [07:00] SRAM_Byte01 = SRAM_Memory[01];
   wire [07:00] SRAM_Byte02 = SRAM_Memory[02];
   wire [07:00] SRAM_Byte03 = SRAM_Memory[03];
   wire [07:00] SRAM_Byte04 = SRAM_Memory[04];
   wire [07:00] SRAM_Byte05 = SRAM_Memory[05];
   wire [07:00] SRAM_Byte06 = SRAM_Memory[06];
   wire [07:00] SRAM_Byte07 = SRAM_Memory[07];
   wire [07:00] SRAM_Byte08 = SRAM_Memory[08];
   wire [07:00] SRAM_Byte09 = SRAM_Memory[09];
   wire [07:00] SRAM_Byte0A = SRAM_Memory[10];
   wire [07:00] SRAM_Byte0B = SRAM_Memory[11];
   wire [07:00] SRAM_Byte0C = SRAM_Memory[12];
   wire [07:00] SRAM_Byte0D = SRAM_Memory[13];
   wire [07:00] SRAM_Byte0E = SRAM_Memory[14];
   wire [07:00] SRAM_Byte0F = SRAM_Memory[15];
   wire [07:00] SRAM_Byte10 = SRAM_Memory[16];
   wire [07:00] SRAM_Byte11 = SRAM_Memory[17];
   wire [07:00] SRAM_Byte12 = SRAM_Memory[18];
   wire [07:00] SRAM_Byte13 = SRAM_Memory[19];
   wire [07:00] SRAM_Byte14 = SRAM_Memory[20];
   wire [07:00] SRAM_Byte15 = SRAM_Memory[21];
   wire [07:00] SRAM_Byte16 = SRAM_Memory[22];
   wire [07:00] SRAM_Byte17 = SRAM_Memory[23];
   wire [07:00] SRAM_Byte18 = SRAM_Memory[24];
   wire [07:00] SRAM_Byte19 = SRAM_Memory[25];
   wire [07:00] SRAM_Byte1A = SRAM_Memory[26];
   wire [07:00] SRAM_Byte1B = SRAM_Memory[27];
   wire [07:00] SRAM_Byte1C = SRAM_Memory[28];
   wire [07:00] SRAM_Byte1D = SRAM_Memory[29];
   wire [07:00] SRAM_Byte1E = SRAM_Memory[30];
   wire [07:00] SRAM_Byte1F = SRAM_Memory[31];
   wire [07:00] SRAM_Byte20 = SRAM_Memory[32];
   wire [07:00] SRAM_Byte21 = SRAM_Memory[33];
   wire [07:00] SRAM_Byte22 = SRAM_Memory[34];
   wire [07:00] SRAM_Byte23 = SRAM_Memory[35];
   wire [07:00] SRAM_Byte24 = SRAM_Memory[36];
   wire [07:00] SRAM_Byte25 = SRAM_Memory[37];
   wire [07:00] SRAM_Byte26 = SRAM_Memory[38];
   wire [07:00] SRAM_Byte27 = SRAM_Memory[39];
   wire [07:00] SRAM_Byte28 = SRAM_Memory[40];
   wire [07:00] SRAM_Byte29 = SRAM_Memory[41];
   wire [07:00] SRAM_Byte2A = SRAM_Memory[42];
   wire [07:00] SRAM_Byte2B = SRAM_Memory[43];
   wire [07:00] SRAM_Byte2C = SRAM_Memory[44];
   wire [07:00] SRAM_Byte2D = SRAM_Memory[45];
   wire [07:00] SRAM_Byte2E = SRAM_Memory[46];
   wire [07:00] SRAM_Byte2F = SRAM_Memory[47];
   wire [07:00] SRAM_Byte30 = SRAM_Memory[48];
   wire [07:00] SRAM_Byte31 = SRAM_Memory[49];
   wire [07:00] SRAM_Byte32 = SRAM_Memory[50];
   wire [07:00] SRAM_Byte33 = SRAM_Memory[51];
   wire [07:00] SRAM_Byte34 = SRAM_Memory[52];
   wire [07:00] SRAM_Byte35 = SRAM_Memory[53];
   wire [07:00] SRAM_Byte36 = SRAM_Memory[54];
   wire [07:00] SRAM_Byte37 = SRAM_Memory[55];
   wire [07:00] SRAM_Byte38 = SRAM_Memory[56];
   wire [07:00] SRAM_Byte39 = SRAM_Memory[57];
   wire [07:00] SRAM_Byte3A = SRAM_Memory[58];
   wire [07:00] SRAM_Byte3B = SRAM_Memory[59];
   wire [07:00] SRAM_Byte3C = SRAM_Memory[60];
   wire [07:00] SRAM_Byte3D = SRAM_Memory[61];
   wire [07:00] SRAM_Byte3E = SRAM_Memory[62];
   wire [07:00] SRAM_Byte3F = SRAM_Memory[63];

// -------------------------------------------------------------------------------------------------------
//      8.02:  EEPROM Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] EEPROM_Byte00 = EEPROM_Memory[00];
   wire [07:00] EEPROM_Byte01 = EEPROM_Memory[01];
   wire [07:00] EEPROM_Byte02 = EEPROM_Memory[02];
   wire [07:00] EEPROM_Byte03 = EEPROM_Memory[03];
   wire [07:00] EEPROM_Byte04 = EEPROM_Memory[04];
   wire [07:00] EEPROM_Byte05 = EEPROM_Memory[05];
   wire [07:00] EEPROM_Byte06 = EEPROM_Memory[06];
   wire [07:00] EEPROM_Byte07 = EEPROM_Memory[07];
   wire [07:00] EEPROM_Byte08 = EEPROM_Memory[08];
   wire [07:00] EEPROM_Byte09 = EEPROM_Memory[09];
   wire [07:00] EEPROM_Byte0A = EEPROM_Memory[10];
   wire [07:00] EEPROM_Byte0B = EEPROM_Memory[11];
   wire [07:00] EEPROM_Byte0C = EEPROM_Memory[12];
   wire [07:00] EEPROM_Byte0D = EEPROM_Memory[13];
   wire [07:00] EEPROM_Byte0E = EEPROM_Memory[14];
   wire [07:00] EEPROM_Byte0F = EEPROM_Memory[15];

   wire [07:00] EEPROM_Byte10 = EEPROM_Memory[16];
   wire [07:00] EEPROM_Byte11 = EEPROM_Memory[17];
   wire [07:00] EEPROM_Byte12 = EEPROM_Memory[18];
   wire [07:00] EEPROM_Byte13 = EEPROM_Memory[19];
   wire [07:00] EEPROM_Byte14 = EEPROM_Memory[20];
   wire [07:00] EEPROM_Byte15 = EEPROM_Memory[21];
   wire [07:00] EEPROM_Byte16 = EEPROM_Memory[22];
   wire [07:00] EEPROM_Byte17 = EEPROM_Memory[23];
   wire [07:00] EEPROM_Byte18 = EEPROM_Memory[24];
   wire [07:00] EEPROM_Byte19 = EEPROM_Memory[25];
   wire [07:00] EEPROM_Byte1A = EEPROM_Memory[26];
   wire [07:00] EEPROM_Byte1B = EEPROM_Memory[27];
   wire [07:00] EEPROM_Byte1C = EEPROM_Memory[28];
   wire [07:00] EEPROM_Byte1D = EEPROM_Memory[29];
   wire [07:00] EEPROM_Byte1E = EEPROM_Memory[30];
   wire [07:00] EEPROM_Byte1F = EEPROM_Memory[31];

   wire [07:00] EEPROM_Byte70 = EEPROM_Memory[112];
   wire [07:00] EEPROM_Byte71 = EEPROM_Memory[113];
   wire [07:00] EEPROM_Byte72 = EEPROM_Memory[114];
   wire [07:00] EEPROM_Byte73 = EEPROM_Memory[115];
   wire [07:00] EEPROM_Byte74 = EEPROM_Memory[116];
   wire [07:00] EEPROM_Byte75 = EEPROM_Memory[117];
   wire [07:00] EEPROM_Byte76 = EEPROM_Memory[118];
   wire [07:00] EEPROM_Byte77 = EEPROM_Memory[119];
   wire [07:00] EEPROM_Byte78 = EEPROM_Memory[120];
   wire [07:00] EEPROM_Byte79 = EEPROM_Memory[121];
   wire [07:00] EEPROM_Byte7A = EEPROM_Memory[122];
   wire [07:00] EEPROM_Byte7B = EEPROM_Memory[123];
   wire [07:00] EEPROM_Byte7C = EEPROM_Memory[124];
   wire [07:00] EEPROM_Byte7D = EEPROM_Memory[125];
   wire [07:00] EEPROM_Byte7E = EEPROM_Memory[126];
   wire [07:00] EEPROM_Byte7F = EEPROM_Memory[127];

// -------------------------------------------------------------------------------------------------------
//      8.03:  Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   wire [07:00] PageBuffer0 = PageBuffer[00];
   wire [07:00] PageBuffer1 = PageBuffer[01];
   wire [07:00] PageBuffer2 = PageBuffer[02];
   wire [07:00] PageBuffer3 = PageBuffer[03];
   wire [07:00] PageBuffer4 = PageBuffer[04];
   wire [07:00] PageBuffer5 = PageBuffer[05];
   wire [07:00] PageBuffer6 = PageBuffer[06];
   wire [07:00] PageBuffer7 = PageBuffer[07];

// -------------------------------------------------------------------------------------------------------
//      8.04:  Unique ID Memory Block
// -------------------------------------------------------------------------------------------------------

   wire [07:00] UniqueID0 = EEPROM_UniqueID[0];
   wire [07:00] UniqueID1 = EEPROM_UniqueID[1];
   wire [07:00] UniqueID2 = EEPROM_UniqueID[2];
   wire [07:00] UniqueID3 = EEPROM_UniqueID[3];
   wire [07:00] UniqueID4 = EEPROM_UniqueID[4];
   wire [07:00] UniqueID5 = EEPROM_UniqueID[5];
   wire [07:00] UniqueID6 = EEPROM_UniqueID[6];
   wire [07:00] UniqueID7 = EEPROM_UniqueID[7];


// *******************************************************************************************************
// **   TIMING CHECKS                                                                                   **
// *******************************************************************************************************

   wire TimingCheckEnable = (RESET == 0) & (SDA_OE == 0);

   specify
      specparam
         tHI = 600,                                     // SCL pulse width - high
         tLO = 1300,                                    // SCL pulse width - low
         tSU_STA = 600,                                 // SCL to SDA setup time
         tHD_STA = 600,                                 // SCL to SDA hold time
         tSU_DAT = 100,                                 // SDA to SCL setup time
         tSU_STO = 600,                                 // SCL to SDA setup time
         tBUF = 1300;                                   // Bus free time

      $width (posedge SCL, tHI);
      $width (negedge SCL, tLO);

      $width (posedge SDA &&& SCL, tBUF);

      $setup (posedge SCL, negedge SDA &&& TimingCheckEnable, tSU_STA);
      $setup (SDA, posedge SCL &&& TimingCheckEnable, tSU_DAT);
      $setup (posedge SCL, posedge SDA &&& TimingCheckEnable, tSU_STO);

      $hold  (negedge SDA &&& TimingCheckEnable, negedge SCL, tHD_STA);
   endspecify

endmodule
