// This program was cloned from: https://github.com/habibagamal/SoC_Automation
// License: GNU General Public License v2.0

// *******************************************************************************************************
// **                                                                                                   **
// **   93AA56C.v - 93AA56C 2K-BIT MICROWIRE SERIAL EEPROM WITH 8/16-BIT ORG (VCC = +1.8V TO +5.5V)     **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2009 YOUNG ENGINEERING                                 **
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
// **   Modified Date  : 06/19/2009                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   06/19/2009:  Initial design                                                                     **
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
// **   1.01:  Internal Reset Logic                                                                     **
// **   1.02:  Input Data Register                                                                      **
// **   1.03:  Bit Clock Counter                                                                        **
// **   1.04:  Opcode Decoder                                                                           **
// **   1.05:  Write Enable                                                                             **
// **   1.06:  Write Cycle Processor                                                                    **
// **   1.07:  Ready/Busy State                                                                         **
// **   1.08:  Ready/Busy Enable                                                                        **
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

module M93AA56C (DI, DO, CLK, CS, ORG, RESET);

   input                DI;                             // data input
   input                CLK;                            // serial clock

   input                CS;                             // chip select
   input                ORG;                            // organization

   input                RESET;                          // model reset/power-on reset

   output               DO;                             // data output


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   reg  [26:00]         DataShifterI;                   // serial input data shifter
   reg  [15:00]         DataShifterO;                   // serial output data shifter
   reg  [31:00]         BitCounter;                     // serial input bit counter
   
   wire                 StartBit_Rcvd;                  // start bit received flag
   wire                 ValidInstruction;               // valid instruction flag

   wire                 InstructionERASE;               // decoded instruction
   wire                 InstructionERAL;                // decoded instruction
   wire                 InstructionEWDS;                // decoded instruction
   wire                 InstructionEWEN;                // decoded instruction
   wire                 InstructionREAD;                // decoded instruction
   wire                 InstructionWRITE;               // decoded instruction
   wire                 InstructionWRAL;                // decoded instruction

   reg                  WriteEnable;                    // memory write enable bit

   reg                  WriteActive;                    // write operation in progress
   reg                  ReadyBusyState;                 // ready/busy state flag
   reg                  ReadyBusyEnable;                // ready/busy enable flag
   reg                  ReadEnable;                     // read output enable flag
   
   reg  [07:00]         MemWrAddress;                   // memory write address
   reg  [15:00]         MemWrData;                      // memory write data

   reg  [07:00]         MemoryBlock [0:255];            // EEPROM data memory array (256x8)

   reg                  DO_DO;                          // serial output data - data
   wire                 DO_OE;                          // serial output data - output enable

   wire                 OutputEnable1;                  // timing accurate output enable
   wire                 OutputEnable2;                  // timing accurate output enable
   wire                 OutputEnable3;                  // timing accurate output enable

   integer              LoopIndex;                      // iterative loop index

   integer              tWC;                            // timing parameter
   integer              tEC;                            // timing parameter
   integer              tWL;                            // timing parameter
   integer              tPD;                            // timing parameter
   integer              tCZ;                            // timing parameter
   integer              tSV;                            // timing parameter

// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin
      `ifdef VCC_1_8V_TO_2_5V
         tWC  = 6000000;                                // memory write cycle time
         // ERAL & WRAL are only valid from 4.5V to 5.5V - so tEC & tWL are not defined for this range
         tPD  = 400;                                    // data output delay time
         tCZ  = 200;                                    // data output disable time
         tSV  = 500;                                    // status valid time
      `else
      `ifdef VCC_2_5V_TO_4_5V
         tWC  = 6000000;                                // memory write cycle time
         // ERAL & WRAL are only valid from 4.5V to 5.5V - so tEC & tWL are not defined for this range
         tPD  = 250;                                    // data output delay time
         tCZ  = 200;                                    // data output disable time
         tSV  = 300;                                    // status valid time
      `else
      `ifdef VCC_4_5V_TO_5_5V
         tWC  = 6000000;                                // memory write cycle time
         tEC  = 6000000;                                // memory write cycle time
         tWL  = 15000000;                               // memory write cycle time
         tPD  = 200;                                    // data output delay time
         tCZ  = 100;                                    // data output disable time
         tSV  = 200;                                    // status valid time
      `else
         tWC  = 6000000;                                // memory write cycle time
         tEC  = 6000000;                                // memory write cycle time
         tWL  = 15000000;                               // memory write cycle time
         tPD  = 200;                                    // data output delay time
         tCZ  = 100;                                    // data output disable time
         tSV  = 200;                                    // status valid time
      `endif
      `endif
      `endif
   end
   
   initial begin
      WriteActive = 0;
      WriteEnable = 0;
      ReadyBusyEnable = 0;
      ReadyBusyState = 0;
   end

// *******************************************************************************************************
// **   CORE LOGIC                                                                                      **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Internal Reset Logic
// -------------------------------------------------------------------------------------------------------

   always @(posedge CS) BitCounter <= 0;
   always @(posedge CS) DataShifterI <= 0;
   always @(posedge CS) DataShifterO <= 0;
   always @(negedge CS) ReadEnable <= 0;
   
// -------------------------------------------------------------------------------------------------------
//      1.02:  Input Data Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge CLK) begin
      if (CS == 1 & BitCounter < 27 & !WriteActive) begin
         DataShifterI[26-BitCounter] <= DI;
      end
   end
   
   assign StartBit_Rcvd = DataShifterI[26];
   
// -------------------------------------------------------------------------------------------------------
//      1.03:  Bit Clock Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge CLK) begin
      if (CS == 1 & (StartBit_Rcvd == 1 | DI == 1)) begin
         BitCounter <= BitCounter + 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.04:  Opcode Decoder
// -------------------------------------------------------------------------------------------------------

   assign ValidInstruction = (StartBit_Rcvd == 1) & (BitCounter > 5) & !WriteActive;
   
   assign InstructionERASE = (DataShifterI[25:24] == 2'b11) & ValidInstruction;
   assign InstructionERAL  = (DataShifterI[25:24] == 2'b00) & ValidInstruction & (DataShifterI[23:22] == 2'b10);
   assign InstructionEWDS  = (DataShifterI[25:24] == 2'b00) & ValidInstruction & (DataShifterI[23:22] == 2'b00);
   assign InstructionEWEN  = (DataShifterI[25:24] == 2'b00) & ValidInstruction & (DataShifterI[23:22] == 2'b11);
   assign InstructionREAD  = (DataShifterI[25:24] == 2'b10) & ValidInstruction;
   assign InstructionWRITE = (DataShifterI[25:24] == 2'b01) & ValidInstruction;
   assign InstructionWRAL  = (DataShifterI[25:24] == 2'b00) & ValidInstruction & (DataShifterI[23:22] == 2'b01);

// -------------------------------------------------------------------------------------------------------
//      1.05:  Write Enable
// -------------------------------------------------------------------------------------------------------

   always @(negedge CS) begin
      if (InstructionEWEN) WriteEnable <= 1;
      else if (InstructionEWDS) WriteEnable <= 0;
   end

// -------------------------------------------------------------------------------------------------------
//      1.06:  Write Cycle Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge CS) begin
      if (ORG == 0) begin
         if (BitCounter > 11 & InstructionERASE & WriteEnable) begin          // Erase
            WriteActive = 1;
            MemWrAddress = DataShifterI[22:15];
            #(tWC);
            
            MemoryBlock[MemWrAddress] = 8'hFF;
            WriteActive = 0;
         end
         else if (BitCounter > 11 & InstructionERAL & WriteEnable) begin      // Erase all
            WriteActive = 1;
            #(tEC);
            
            for (LoopIndex = 0; LoopIndex < 256; LoopIndex = LoopIndex + 1) begin
               MemoryBlock[LoopIndex] = 8'hFF;
            end
            WriteActive = 0;
         end
         else if (BitCounter > 19 & InstructionWRITE & WriteEnable) begin    // Write
            WriteActive = 1;
            MemWrAddress = DataShifterI[22:15];
            MemWrData[15:8] = DataShifterI[14:7];
            #(tWC);
            
            MemoryBlock[MemWrAddress] = MemWrData[15:8];
            WriteActive = 0;
         end
         else if (BitCounter > 19 & InstructionWRAL & WriteEnable) begin     // Write all
            WriteActive = 1;
            MemWrData[15:8] = DataShifterI[14:7];
            #(tWL);
            
            for (LoopIndex = 0; LoopIndex < 256; LoopIndex = LoopIndex + 1) begin
               MemoryBlock[LoopIndex] = MemWrData[15:8];
            end
            WriteActive = 0;
         end
      end
      else begin
         if (BitCounter > 10 & InstructionERASE & WriteEnable) begin          // Erase
            WriteActive = 1;
            MemWrAddress = DataShifterI[22:15];
            #(tWC);
            
            MemoryBlock[{MemWrAddress[7:1],1'b0}] = 8'hFF;
            MemoryBlock[{MemWrAddress[7:1],1'b1}] = 8'hFF;
            WriteActive = 0;
         end
         else if (BitCounter > 10 & InstructionERAL & WriteEnable) begin      // Erase all
            WriteActive = 1;
            #(tEC);
            
            for (LoopIndex = 0; LoopIndex < 128; LoopIndex = LoopIndex + 1) begin
               MemoryBlock[{LoopIndex,1'b0}] = 8'hFF;
               MemoryBlock[{LoopIndex,1'b1}] = 8'hFF;
            end
            WriteActive = 0;
         end
         else if (BitCounter > 26 & InstructionWRITE & WriteEnable) begin    // Write
            WriteActive = 1;
            MemWrAddress = DataShifterI[22:15];
            MemWrData = DataShifterI[15:0];
            #(tWC);
            
            MemoryBlock[{MemWrAddress[7:1],1'b0}] = MemWrData[15:8];
            MemoryBlock[{MemWrAddress[7:1],1'b1}] = MemWrData[7:0];
            WriteActive = 0;
         end
         else if (BitCounter > 26 & InstructionWRAL & WriteEnable) begin     // Write all
            WriteActive = 1;
            MemWrData = DataShifterI[15:0];
            #(tWL);
            
            for (LoopIndex = 0; LoopIndex < 128; LoopIndex = LoopIndex + 1) begin
               MemoryBlock[{LoopIndex,1'b0}] = MemWrData[15:8];
               MemoryBlock[{LoopIndex,1'b1}] = MemWrData[7:0];
            end
            WriteActive = 0;
         end
      end
   end
   
// -------------------------------------------------------------------------------------------------------
//      1.07:  Ready/Busy State
// -------------------------------------------------------------------------------------------------------

   always @(posedge WriteActive or posedge CLK) begin
      if (WriteActive == 1) begin
         ReadyBusyState <= 1;
      end
      else if (CS == 1 & CLK == 1 & DI == 1) begin
         ReadyBusyState <= 0;
      end
   end
   
// -------------------------------------------------------------------------------------------------------
//      1.08:  Ready/Busy Enable
// -------------------------------------------------------------------------------------------------------

   always @(negedge ReadyBusyState or posedge CS) begin
      if (ReadyBusyState == 0) begin
         ReadyBusyEnable <= 0;
      end
      else begin
         ReadyBusyEnable <= 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.09:  Output Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(posedge CLK) begin
      if (CS == 1 & InstructionREAD) begin
         if (ORG == 0) begin
            if (BitCounter >= 12) begin
               if (BitCounter[2:0] == 3'b100) begin
                  DataShifterO[15:8] <= MemoryBlock[DataShifterI[22:15]];
                  DataShifterI[22:15] <= DataShifterI[22:15] + 1;
               end
               else begin
                  DataShifterO <= {DataShifterO[14:0],1'b0};
               end
            end
         end
         else begin
            if (BitCounter >= 11) begin
               if (BitCounter[3:0] == 4'b1011) begin
                  DataShifterO[15:8] <= MemoryBlock[{DataShifterI[22:16],1'b0}];
                  DataShifterO[7:0] <= MemoryBlock[{DataShifterI[22:16],1'b1}];
                  DataShifterI[22:16] <= DataShifterI[22:16] + 1;
               end
               else begin
                  DataShifterO <= {DataShifterO[14:0],1'b0};
               end
            end
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.10:  Output Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(DataShifterO) DO_DO <= #(tPD) DataShifterO[15];
   
   always @(posedge CLK) begin
      if (CS == 1) begin
         if (ORG == 0) begin
            if (BitCounter >= 11) ReadEnable <= InstructionREAD;
         end
         else begin
            if (BitCounter >= 10) ReadEnable <= InstructionREAD;
         end
      end
   end

   buf #(tPD,0)    (OutputEnable1, ReadEnable);
   buf #(tSV,tCZ)  (OutputEnable2, ReadyBusyEnable & CS);
   buf #(tCZ)      (OutputEnable3, CS);

   assign DO_OE = (OutputEnable1 | OutputEnable2) & OutputEnable3;

   bufif1 (DO, (DO_DO & OutputEnable1) | (!WriteActive & OutputEnable2), DO_OE);

// *******************************************************************************************************
// **   DEBUG LOGIC                                                                                     **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      2.01:  Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] MemoryByte00 = MemoryBlock[000];
   wire [07:00] MemoryByte01 = MemoryBlock[001];
   wire [07:00] MemoryByte02 = MemoryBlock[002];
   wire [07:00] MemoryByte03 = MemoryBlock[003];
   wire [07:00] MemoryByte04 = MemoryBlock[004];
   wire [07:00] MemoryByte05 = MemoryBlock[005];
   wire [07:00] MemoryByte06 = MemoryBlock[006];
   wire [07:00] MemoryByte07 = MemoryBlock[007];
   wire [07:00] MemoryByte08 = MemoryBlock[008];
   wire [07:00] MemoryByte09 = MemoryBlock[009];
   wire [07:00] MemoryByte0A = MemoryBlock[010];
   wire [07:00] MemoryByte0B = MemoryBlock[011];
   wire [07:00] MemoryByte0C = MemoryBlock[012];
   wire [07:00] MemoryByte0D = MemoryBlock[013];
   wire [07:00] MemoryByte0E = MemoryBlock[014];
   wire [07:00] MemoryByte0F = MemoryBlock[015];

   wire [07:00] MemoryByteF0 = MemoryBlock[240];
   wire [07:00] MemoryByteF1 = MemoryBlock[241];
   wire [07:00] MemoryByteF2 = MemoryBlock[242];
   wire [07:00] MemoryByteF3 = MemoryBlock[243];
   wire [07:00] MemoryByteF4 = MemoryBlock[244];
   wire [07:00] MemoryByteF5 = MemoryBlock[245];
   wire [07:00] MemoryByteF6 = MemoryBlock[246];
   wire [07:00] MemoryByteF7 = MemoryBlock[247];
   wire [07:00] MemoryByteF8 = MemoryBlock[248];
   wire [07:00] MemoryByteF9 = MemoryBlock[249];
   wire [07:00] MemoryByteFA = MemoryBlock[250];
   wire [07:00] MemoryByteFB = MemoryBlock[251];
   wire [07:00] MemoryByteFC = MemoryBlock[252];
   wire [07:00] MemoryByteFD = MemoryBlock[253];
   wire [07:00] MemoryByteFE = MemoryBlock[254];
   wire [07:00] MemoryByteFF = MemoryBlock[255];

// *******************************************************************************************************
// **   TIMING CHECKS                                                                                   **
// *******************************************************************************************************

   wire TimingCheckEnable = (RESET == 0) & (CS == 1);

   specify
      `ifdef VCC_1_8V_TO_2_5V
         specparam
            tCKH = 450,                                 // Clock high time
            tCKL = 450,                                 // Clock low time
            tCSS = 250,                                 // Chip Select setup time
            tCSH =   0,                                 // Chip Select hold time
            tCSL = 250,                                 // Chip Select low time
            tDIS = 250,                                 // Data input setup time
            tDIH = 250;                                 // Data input hold time
      `else
      `ifdef VCC_2_5V_TO_4_5V
         specparam
            tCKH = 250,                                 // Clock high time
            tCKL = 200,                                 // Clock low time
            tCSS = 100,                                 // Chip Select setup time
            tCSH =   0,                                 // Chip Select hold time
            tCSL = 250,                                 // Chip Select low time
            tDIS = 100,                                 // Data input setup time
            tDIH = 100;                                 // Data input hold time
      `else
      `ifdef VCC_4_5V_TO_5_5V
         specparam
            tCKH = 200,                                 // Clock high time
            tCKL = 100,                                 // Clock low time
            tCSS =  50,                                 // Chip Select setup time
            tCSH =   0,                                 // Chip Select hold time
            tCSL = 250,                                 // Chip Select low time
            tDIS =  50,                                 // Data input setup time
            tDIH =  50;                                 // Data input hold time
      `else
         specparam
            tCKH = 200,                                 // Clock high time
            tCKL = 100,                                 // Clock low time
            tCSS =  50,                                 // Chip Select setup time
            tCSH =   0,                                 // Chip Select hold time
            tCSL = 250,                                 // Chip Select low time
            tDIS =  50,                                 // Data input setup time
            tDIH =  50;                                 // Data input hold time
      `endif
      `endif
      `endif

      $width (posedge CLK,  tCKH);
      $width (negedge CLK,  tCKL);
      $width (negedge CS, tCSL);

      $setup (DI, posedge CLK &&& TimingCheckEnable, tDIS);
      $setup (posedge CS, posedge CLK &&& TimingCheckEnable, tCSS);

      $hold  (posedge CLK &&& TimingCheckEnable, DI, tDIH);
      $hold  (negedge CLK &&& TimingCheckEnable, negedge CS, tCSH);
  endspecify

endmodule
