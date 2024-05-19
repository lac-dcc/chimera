// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

// *******************************************************************************************************
// **                                                                                                   **
// **   23LC512.v - 23LC512 512 KBIT SPI SERIAL SRAM (VCC = +2.5V TO +5.5V)                             **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2014 YOUNG ENGINEERING                                 **
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
// **   Revision       : 1.0                                                                            **
// **   Modified Date  : 04/23/2014                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   04/23/2014:  Initial design                                                                     **
// **   Modified Date  : 5/5/2014                                                                       **
// **   Revision History:                                                                               **
// **   Based on the 23LC1024.v model a 512k bit model for the 23LC512 is drafted below                 **
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
// **   1.01:  Internal Reset Logic                                                                     **
// **   1.02:  Input Data Shifter                                                                       **
// **   1.03:  Clock Cycle Counter                                                                      **
// **   1.04:  Instruction Register                                                                     **
// **   1.05:  Address Register                                                                         **
// **   1.06:  Status Register Write                                                                    **
// **   1.07:  I/O Mode Instructions                                                                    **
// **   1.08:  Array Write                                                                              **
// **   1.09:  Output Data Shifter                                                                      **
// **   1.10:  Output Data Buffer                                                                       **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   DEBUG LOGIC                                                                                     **
// **---------------------------------------------------------------------------------------------------**
// **   2.01:  Memory Data Bytes                                                                        **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   TIMING CHECKS                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **                                                                                                   **
// *******************************************************************************************************


`timescale 1ns/10ps

module M23LC512 (SI_SIO0, SO_SIO1, SCK, CS_N, SIO2, HOLD_N_SIO3, RESET);

   inout                SI_SIO0;                        // serial data input/output
   input                SCK;                            // serial data clock

   input                CS_N;                           // chip select - active low

   inout                SIO2;                           // serial data input/output

   inout                HOLD_N_SIO3;                    // interface suspend - active low/
                                                        //   serial data input/output

   input                RESET;                          // model reset/power-on reset

   inout                SO_SIO1;                        // serial data input/output


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   reg  [07:00]         DataShifterI;                   // serial input data shifter
   reg  [07:00]         DataShifterO;                   // serial output data shifter
   reg  [31:00]         ClockCounter;                   // serial input clock counter
   reg  [07:00]         InstRegister;                   // instruction register
   reg  [15:00]         AddrRegister;                   // address register modified for 16 bit addresses


   wire                 InstructionREAD;                // decoded instruction byte
   wire                 InstructionRDMR;                // decoded instruction byte
   wire                 InstructionWRMR;                // decoded instruction byte
   wire                 InstructionWRITE;               // decoded instruction byte
   wire                 InstructionEDIO;                // decoded instruction byte
   wire                 InstructionEQIO;                // decoded instruction byte
   wire                 InstructionRSTIO;               // decoded instruction byte

   reg  [01:00]         OpMode;                         // operation mode

   reg  [01:00]         IOMode;                         // I/O mode

   wire                 Hold;                           // hold function

   reg  [07:00]         MemoryBlock [0:65535];          // SRAM data memory array (65536x8)

   reg  [03:00]         SO_DO;                          // serial output data - data
   wire                 SO_OE;                          // serial output data - output enable

   reg                  SO_Enable;                      // serial data output enable

   wire                 OutputEnable1;                  // timing accurate output enable
   wire                 OutputEnable2;                  // timing accurate output enable
   wire                 OutputEnable3;                  // timing accurate output enable

   integer              tV;                             // timing parameter
   integer              tHZ;                            // timing parameter
   integer              tHV;                            // timing parameter
   integer              tDIS;                           // timing parameter

`define READ      8'b0000_0011                          // Read instruction
`define WRMR      8'b0000_0001                          // Write Mode Register instruction
`define WRITE     8'b0000_0010                          // Write instruction
`define RDMR      8'b0000_0101                          // Read Mode Register instruction
`define EDIO      8'b0011_1011                          // Enter Dual I/O instruction
`define EQIO      8'b0011_1000                          // Enter Quad I/O instruction
`define RSTIO     8'b1111_1111                          // Reset Dual and Quad I/O instruction

`define BYTEMODE  2'b00                                 // Byte operation mode
`define PAGEMODE  2'b10                                 // Page operation mode
`define SEQMODE   2'b01                                 // Sequential operation mode

`define SPIMODE   2'b00                                 // SPI I/O mode
`define SDIMODE   2'b01                                 // SDI I/O mode
`define SQIMODE   2'b10                                 // SQI I/O mode

// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin
      `ifdef TEMP_INDUSTRIAL
         tV   = 25;                                     // output valid from SCK low
         tHZ  = 10;                                     // HOLD_N low to output high-z
         tHV  = 50;                                     // HOLD_N high to output valid
         tDIS = 20;                                     // CS_N high to output disable
      `else
      `ifdef TEMP_EXTENDED
         tV   = 32;                                     // output valid from SCK low
         tHZ  = 10;                                     // HOLD_N low to output high-z
         tHV  = 50;                                     // HOLD_N high to output valid
         tDIS = 20;                                     // CS_N high to output disable
      `else
         tV   = 25;                                     // output valid from SCK low
         tHZ  = 10;                                     // HOLD_N low to output high-z
         tHV  = 50;                                     // HOLD_N high to output valid
         tDIS = 20;                                     // CS_N high to output disable
      `endif
      `endif
   end

   initial begin
      OpMode = `SEQMODE;

      IOMode = `SPIMODE;
   end

   assign Hold = (HOLD_N_SIO3 == 0) & (IOMode == `SPIMODE);


// *******************************************************************************************************
// **   CORE LOGIC                                                                                      **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Internal Reset Logic
// -------------------------------------------------------------------------------------------------------

   always @(negedge CS_N) ClockCounter <= 0;
   always @(negedge CS_N) SO_Enable    <= 0;

// -------------------------------------------------------------------------------------------------------
//      1.02:  Input Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         if (CS_N == 0) begin
            case (IOMode)
               `SPIMODE: DataShifterI <= {DataShifterI[06:00],SI_SIO0};
               `SDIMODE: DataShifterI <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
               `SQIMODE: DataShifterI <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
               default: $error("IOMode set to invalid value.");
            endcase
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.03:  Clock Cycle Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         if (CS_N == 0)         ClockCounter <= ClockCounter + 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.04:  Instruction Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0) begin
         case (IOMode)
            `SPIMODE: begin
               if (ClockCounter == 7) InstRegister <= {DataShifterI[06:00],SI_SIO0};
            end
            `SDIMODE: begin
               if (ClockCounter == 3) InstRegister <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
            end
            `SQIMODE: begin
               if (ClockCounter == 1) InstRegister <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
            end
            default: $error("IOMode set to invalid value.");
         endcase
      end
   end

   assign InstructionREAD  = (InstRegister[7:0] == `READ);
   assign InstructionRDMR  = (InstRegister[7:0] == `RDMR);
   assign InstructionWRMR  = (InstRegister[7:0] == `WRMR);
   assign InstructionWRITE = (InstRegister[7:0] == `WRITE);
   assign InstructionEDIO  = (InstRegister[7:0] == `EDIO);
   assign InstructionEQIO  = (InstRegister[7:0] == `EQIO);
   assign InstructionRSTIO = (InstRegister[7:0] == `RSTIO);

// -------------------------------------------------------------------------------------------------------
//      1.05:  Address Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & (InstructionREAD | InstructionWRITE)) begin
         case (IOMode)
            `SPIMODE: begin

               if (ClockCounter == 15) AddrRegister[15:08] <= {DataShifterI[06:00],SI_SIO0};
               else if (ClockCounter == 23) AddrRegister[07:00] <= {DataShifterI[06:00],SI_SIO0};

            end
            `SDIMODE: begin

               if (ClockCounter == 7) AddrRegister[15:08] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};
               else if (ClockCounter == 11) AddrRegister[07:00] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};

            end
            `SQIMODE: begin

               if (ClockCounter == 3) AddrRegister[15:08] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};
               else if (ClockCounter == 5) AddrRegister[07:00] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};


            end
            default: $error("IOMode set to invalid value.");
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.06:  Status Register Write
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & InstructionWRMR) begin
         case (IOMode)
            `SPIMODE: begin
               if (ClockCounter == 15) OpMode <= DataShifterI[06:05]; //datashifter is missing one bit
            end
            `SDIMODE: begin
               if (ClockCounter == 7) OpMode <= DataShifterI[05:04]; //datashifter is missing two bits
            end
            `SQIMODE: begin
               if (ClockCounter == 3) OpMode <= DataShifterI[03:02]; //...missing a nibble
            end
            default: $error("IOMode set to invalid value.");
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.07:  I/O Mode Instructions
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin   //changes io mode.
      case (IOMode)
         `SPIMODE: begin
            if (ClockCounter == 7) begin
               if ({DataShifterI[06:00],SI_SIO0} == `EDIO) IOMode <= `SDIMODE;
               else if ({DataShifterI[06:00],SI_SIO0} == `EQIO) IOMode <= `SQIMODE;
            end
         end
         `SDIMODE: begin
            if (ClockCounter == 3) begin
               if ({DataShifterI[05:00],SO_SIO1,SI_SIO0} == `EQIO) IOMode <= `SQIMODE;
               else if ({DataShifterI[05:00],SO_SIO1,SI_SIO0} == `RSTIO) IOMode <= `SPIMODE;
            end
         end
         `SQIMODE: begin
            if (ClockCounter == 1) begin
               if ({DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0} == `EDIO) IOMode <= `SDIMODE;
               else if ({DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0} == `RSTIO) IOMode <= `SPIMODE;
            end
         end
      endcase
   end

// -------------------------------------------------------------------------------------------------------
//      1.08:  Array Write
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (Hold == 0 & InstructionWRITE) begin
         case (IOMode)
            `SPIMODE: begin

                 if ((ClockCounter >= 31) & (ClockCounter[2:0] == 3'b111)) begin   //every odd clock, where odd means %8=7

                  MemoryBlock[AddrRegister[15:00]] <= {DataShifterI[06:00],SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;
                  endcase
               end
            end
            `SDIMODE: begin

               if ((ClockCounter >= 15) & (ClockCounter[1:0] == 2'b11)) begin

                  MemoryBlock[AddrRegister[15:00]] <= {DataShifterI[05:00],SO_SIO1,SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;
                  endcase
               end
            end
            `SQIMODE: begin

              if ((ClockCounter >= 7) & (ClockCounter[0] == 1'b1)) begin

                  MemoryBlock[AddrRegister[15:00]] <= {DataShifterI[03:00],HOLD_N_SIO3,SIO2,SO_SIO1,SI_SIO0};

                  case (OpMode)
                     `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                     `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;

                  endcase
               end
            end
            default: $error("IOMode set to invalid value.");
         endcase
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.09:  Output Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCK) begin
      if (Hold == 0) begin
         if (InstructionREAD) begin
            case (IOMode)
               `SPIMODE: begin

                   if ((ClockCounter >= 24) & (ClockCounter[2:0] == 3'b000)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[15:00]];
                     SO_Enable    <= 1;

                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 1;
               end
               `SDIMODE: begin
                  if ((ClockCounter >= 16) & (ClockCounter[1:0] == 2'b00)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[15:00]];
                     SO_Enable    <= 1;

                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 2;
               end
               `SQIMODE: begin
                  if ((ClockCounter >= 8) & (ClockCounter[0] == 1'b0)) begin
                     DataShifterO <= MemoryBlock[AddrRegister[15:00]];
                     SO_Enable    <= 1;

                     case (OpMode)
                       `PAGEMODE: AddrRegister[04:00] <= AddrRegister[04:00] + 1;
                       `SEQMODE: AddrRegister[15:00] <= AddrRegister[15:00] + 1;
                     endcase
                  end
                  else DataShifterO <= DataShifterO << 4;
               end
               default: $error("IOMode set to invalid value.");
            endcase
         end
         else if (InstructionRDMR) begin
            case (IOMode)
               `SPIMODE: begin
                  if ((ClockCounter > 7) & (ClockCounter[2:0] == 3'b000)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 1;
               end
               `SDIMODE: begin
                  if ((ClockCounter > 3) & (ClockCounter[1:0] == 2'b00)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 2;
               end
               `SQIMODE: begin
                  if ((ClockCounter > 1) & (ClockCounter[0] == 1'b0)) begin
                     DataShifterO <= {OpMode,6'b000000};
                     SO_Enable    <= 1;
                  end
                  else DataShifterO <= DataShifterO << 4;
               end
               default: $error("IOMode set to invalid value.");
            endcase
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.10:  Output Data Buffer
// -------------------------------------------------------------------------------------------------------

   // Buffer for SPI mode
   bufif1 (SO_SIO1, SO_DO[0], SO_OE & (IOMode == `SPIMODE));

   // Buffers for SDI mode
   bufif1 (SI_SIO0, SO_DO[0], SO_OE & (IOMode == `SDIMODE));
   bufif1 (SO_SIO1, SO_DO[1], SO_OE & (IOMode == `SDIMODE));

   // Buffers for SQI Mode
   bufif1 (SI_SIO0, SO_DO[0], SO_OE & (IOMode == `SQIMODE));
   bufif1 (SO_SIO1, SO_DO[1], SO_OE & (IOMode == `SQIMODE));
   bufif1 (SIO2, SO_DO[2], SO_OE & (IOMode == `SQIMODE));
   bufif1 (HOLD_N_SIO3, SO_DO[3], SO_OE & (IOMode == `SQIMODE));

   always @(DataShifterO) begin
      case (IOMode)
        `SPIMODE: begin
           SO_DO[0] <= #(tV) DataShifterO[07];
        end
        `SDIMODE: begin
           SO_DO[1] <= #(tV) DataShifterO[07];
           SO_DO[0] <= #(tV) DataShifterO[06];
        end
        `SQIMODE: begin
           SO_DO[3] <= #(tV) DataShifterO[07];
           SO_DO[2] <= #(tV) DataShifterO[06];
           SO_DO[1] <= #(tV) DataShifterO[05];
           SO_DO[0] <= #(tV) DataShifterO[04];
        end
      endcase
   end

   bufif1 #(tV,0)    (OutputEnable1, SO_Enable, 1);
   notif1 #(tDIS)    (OutputEnable2, CS_N,   1);
   bufif1 #(tHV,tHZ) (OutputEnable3, HOLD_N_SIO3 | !(IOMode == `SPIMODE), 1);

   assign SO_OE = OutputEnable1 & OutputEnable2 & OutputEnable3;


// *******************************************************************************************************
// **   DEBUG LOGIC                                                                                     **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      2.01:  Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] MemoryByte00000 = MemoryBlock[000000];
   wire [07:00] MemoryByte00001 = MemoryBlock[000001];
   wire [07:00] MemoryByte00002 = MemoryBlock[000002];
   wire [07:00] MemoryByte00003 = MemoryBlock[000003];
   wire [07:00] MemoryByte00004 = MemoryBlock[000004];
   wire [07:00] MemoryByte00005 = MemoryBlock[000005];
   wire [07:00] MemoryByte00006 = MemoryBlock[000006];
   wire [07:00] MemoryByte00007 = MemoryBlock[000007];
   wire [07:00] MemoryByte00008 = MemoryBlock[000008];
   wire [07:00] MemoryByte00009 = MemoryBlock[000009];
   wire [07:00] MemoryByte0000A = MemoryBlock[000010];
   wire [07:00] MemoryByte0000B = MemoryBlock[000011];
   wire [07:00] MemoryByte0000C = MemoryBlock[000012];
   wire [07:00] MemoryByte0000D = MemoryBlock[000013];
   wire [07:00] MemoryByte0000E = MemoryBlock[000014];
   wire [07:00] MemoryByte0000F = MemoryBlock[000015];

   wire [07:00] MemoryByte0FFF0 = MemoryBlock[65519];
   wire [07:00] MemoryByte0FFF1 = MemoryBlock[65520];
   wire [07:00] MemoryByte0FFF2 = MemoryBlock[65521];
   wire [07:00] MemoryByte0FFF3 = MemoryBlock[65522];
   wire [07:00] MemoryByte0FFF4 = MemoryBlock[65523];
   wire [07:00] MemoryByte0FFF5 = MemoryBlock[65524];
   wire [07:00] MemoryByte0FFF6 = MemoryBlock[65525];
   wire [07:00] MemoryByte0FFF7 = MemoryBlock[65526];
   wire [07:00] MemoryByte0FFF8 = MemoryBlock[65527];
   wire [07:00] MemoryByte0FFF9 = MemoryBlock[65528];
   wire [07:00] MemoryByte0FFFA = MemoryBlock[65529];
   wire [07:00] MemoryByte0FFFB = MemoryBlock[65530];
   wire [07:00] MemoryByte0FFFC = MemoryBlock[65531];
   wire [07:00] MemoryByte0FFFD = MemoryBlock[65532];
   wire [07:00] MemoryByte0FFFE = MemoryBlock[65534];
   wire [07:00] MemoryByte0FFFF = MemoryBlock[65535];

// *******************************************************************************************************
// **   TIMING CHECKS                                                                                   **
// *******************************************************************************************************

   wire TimingCheckEnable = (RESET == 0) & (CS_N == 0);
   wire SPITimingCheckEnable = TimingCheckEnable & (IOMode == `SPIMODE);
   wire SDITimingCheckEnable = TimingCheckEnable & (IOMode == `SDIMODE) & (SO_Enable == 0);
   wire SQITimingCheckEnable = TimingCheckEnable & (IOMode == `SQIMODE) & (SO_Enable == 0);

   specify
      `ifdef TEMP_INDUSTRIAL
         specparam
            tHI  = 25,                                  // Clock high time
            tLO  = 25,                                  // Clock low time
            tSU  = 10,                                  // Data setup time
            tHD  = 10,                                  // Data hold time
            tHS  = 10,                                  // HOLD_N setup time
            tHH  = 10,                                  // HOLD_N hold time
            tCSD = 25,                                  // CS_N disable time
            tCSS = 25,                                  // CS_N setup time
            tCSH = 50,                                  // CS_N hold time
            tCLD = 25;                                  // Clock delay time
      `else
      `ifdef TEMP_EXTENDED
         specparam
            tHI  = 32,                                  // Clock high time
            tLO  = 32,                                  // Clock low time
            tSU  = 10,                                  // Data setup time
            tHD  = 10,                                  // Data hold time
            tHS  = 10,                                  // HOLD_N setup time
            tHH  = 10,                                  // HOLD_N hold time
            tCSD = 32,                                  // CS_N disable time
            tCSS = 32,                                  // CS_N setup time
            tCSH = 50,                                  // CS_N hold time
            tCLD = 32;                                  // Clock delay time
      `else
         specparam
            tHI  = 25,                                  // Clock high time
            tLO  = 25,                                  // Clock low time
            tSU  = 10,                                  // Data setup time
            tHD  = 10,                                  // Data hold time
            tHS  = 10,                                  // HOLD_N setup time
            tHH  = 10,                                  // HOLD_N hold time
            tCSD = 25,                                  // CS_N disable time
            tCSS = 25,                                  // CS_N setup time
            tCSH = 50,                                  // CS_N hold time
            tCLD = 25;                                  // Clock delay time
      `endif
      `endif

      $width (posedge SCK,  tHI);
      $width (negedge SCK,  tLO);
      $width (posedge CS_N, tCSD);

      $setup (negedge CS_N, posedge SCK &&& TimingCheckEnable, tCSS);
      $setup (posedge CS_N, posedge SCK &&& TimingCheckEnable, tCLD);

      $hold  (posedge SCK &&& TimingCheckEnable, posedge CS_N, tCSH);

      // SPI-specific timing checks
      $setup (SI_SIO0, posedge SCK &&& SPITimingCheckEnable, tSU);
      $setup (negedge SCK, negedge HOLD_N_SIO3 &&& SPITimingCheckEnable, tHS);

      $hold  (posedge SCK &&& SPITimingCheckEnable, SI_SIO0,   tHD);
      $hold  (posedge HOLD_N_SIO3 &&& SPITimingCheckEnable, posedge SCK,  tHH);

      // SDI-specific timing checks
      $setup (SI_SIO0, posedge SCK &&& SDITimingCheckEnable, tSU);
      $setup (SO_SIO1, posedge SCK &&& SDITimingCheckEnable, tSU);

      $hold  (posedge SCK &&& SDITimingCheckEnable, SI_SIO0,   tHD);
      $hold  (posedge SCK &&& SDITimingCheckEnable, SO_SIO1,   tHD);

      // SQI-specific timing checks
      $setup (SI_SIO0, posedge SCK &&& SQITimingCheckEnable, tSU);
      $setup (SO_SIO1, posedge SCK &&& SQITimingCheckEnable, tSU);
      $setup (SIO2, posedge SCK &&& SQITimingCheckEnable, tSU);
      $setup (HOLD_N_SIO3, posedge SCK &&& SQITimingCheckEnable, tSU);

      $hold  (posedge SCK &&& SQITimingCheckEnable, SI_SIO0,   tHD);
      $hold  (posedge SCK &&& SQITimingCheckEnable, SO_SIO1,   tHD);
      $hold  (posedge SCK &&& SQITimingCheckEnable, SIO2,   tHD);
      $hold  (posedge SCK &&& SQITimingCheckEnable, HOLD_N_SIO3,   tHD);
  endspecify

endmodule