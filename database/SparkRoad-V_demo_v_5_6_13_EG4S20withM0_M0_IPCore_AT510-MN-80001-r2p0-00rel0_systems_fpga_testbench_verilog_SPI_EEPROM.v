// *******************************************************************************************************
// **                                                                                                   **
// **   M25LC128.v - 25LC128 128K-BIT SPI SERIAL EEPROM (VCC = +2.5V TO +5.5V)                          **
// **                                                                                                   **
// *******************************************************************************************************
// **                                                                                                   **
// **                   This information is distributed under license from Young Engineering.           **
// **                              COPYRIGHT (c) 2006 YOUNG ENGINEERING                                 **
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
// **   Modified Date  : 06/26/2007                                                                     **
// **   Revision History:                                                                               **
// **                                                                                                   **
// **   06/26/2007:  Initial design                                                                     **
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
// **   1.02:  Input Data Shifter                                                                       **
// **   1.03:  Bit Clock Counter                                                                        **
// **   1.04:  Instruction Register                                                                     **
// **   1.05:  Address Register                                                                         **
// **   1.06:  Block Protect Bits                                                                       **
// **   1.07:  Write Protect Enable                                                                     **
// **   1.08:  Write Data Buffer                                                                        **
// **   1.09:  Write Enable Bit                                                                         **
// **   1.10:  Write Cycle Processor                                                                    **
// **   1.11:  Output Data Shifter                                                                      **
// **   1.12:  Output Data Buffer                                                                       **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   DEBUG LOGIC                                                                                     **
// **---------------------------------------------------------------------------------------------------**
// **   2.01:  Memory Data Bytes                                                                        **
// **   2.02:  Page Buffer Bytes                                                                        **
// **                                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **   TIMING CHECKS                                                                                   **
// **---------------------------------------------------------------------------------------------------**
// **                                                                                                   **
// *******************************************************************************************************


`timescale 1ns/10ps

module SPI_EEPROM (SI, SO, SCK, CS_N, WP_N, HOLD_N, RESET);

   input                SI;                             // serial data input
   input                SCK;                            // serial data clock

   input                CS_N;                           // chip select - active low
   input                WP_N;                           // write protect pin - active low

   input                HOLD_N;                         // interface suspend - active low

   input                RESET;                          // model reset/power-on reset

   output               SO;                             // serial data output


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************

   reg  [15:00]         DataShifterI;                   // serial input data shifter
   reg  [07:00]         DataShifterO;                   // serial output data shifter
   reg  [31:00]         BitCounter;                     // serial input bit counter
   reg  [07:00]         InstRegister;                   // instruction register
   reg  [15:00]         AddrRegister;                   // address register

   wire                 InstructionREAD;                // decoded instruction byte
   wire                 InstructionRDSR;                // decoded instruction byte
   wire                 InstructionWRSR;                // decoded instruction byte
   wire                 InstructionWRDI;                // decoded instruction byte
   wire                 InstructionWREN;                // decoded instruction byte
   wire                 InstructionWRITE;               // decoded instruction byte

   reg  [07:00]         WriteBuffer [0:63];             // 64-byte page write buffer
   reg  [05:00]         WritePointer;                   // page buffer pointer
   reg  [06:00]         WriteCounter;                   // byte write counter

   reg                  WriteEnable;                    // memory write enable bit
   wire                 RstWriteEnable;                 // asynchronous reset
   wire                 SetWriteEnable;                 // register set
   wire                 ClrWriteEnable;                 // register clear

   reg                  WriteActive;                    // write operation in progress

   reg                  BlockProtect0;                  // memory block write protect
   reg                  BlockProtect1;                  // memory block write protect
   reg                  BlockProtect0_New;              // memory data to be written
   reg                  BlockProtect1_New;              // memory data to be written

   reg                  WP_Enable;                      // write protect pin enable
   reg                  WP_Enable_New;                  // memory data to be written
   wire                 StatusWriteProtected;           // status register write protected

   reg  [05:00]         PageAddress;                    // page buffer address
   reg  [13:00]         BaseAddress;                    // memory write base address
   reg  [13:00]         MemWrAddress;                   // memory write address
   reg  [13:00]         MemRdAddress;                   // memory read address

   reg  [07:00]         MemoryBlock [0:16384];          // EEPROM data memory array (16384x8)

   reg                  SO_DO;                          // serial output data - data
   wire                 SO_OE;                          // serial output data - output enable

   reg                  SO_Enable;                      // serial data output enable

   wire                 OutputEnable1;                  // timing accurate output enable
   wire                 OutputEnable2;                  // timing accurate output enable
   wire                 OutputEnable3;                  // timing accurate output enable

   integer              LoopIndex;                      // iterative loop index

   integer              tWC;                            // timing parameter
   integer              tV;                             // timing parameter
   integer              tHZ;                            // timing parameter
   integer              tHV;                            // timing parameter
   integer              tDIS;                           // timing parameter

`define PAGE_SIZE 64                                    // 64-byte page size
`define WREN  8'b0000_0110                              // Write Enable instruction
`define READ  8'b0000_0011                              // Read instruction
`define WRDI  8'b0000_0100                              // Write Disable instruction
`define WRSR  8'b0000_0001                              // Write Status Register instruction
`define WRITE 8'b0000_0010                              // Write instruction
`define RDSR  8'b0000_0101                              // Read Status Register instruction

// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin

         tWC  = 5000000;                                // memory write cycle time
         tV   = 50;                                     // output valid from SCK low
         tHZ  = 30;                                     // HOLD_N low to output high-Z
         tHV  = 30;                                     // HOLD_N high to output valid
         tDIS = 40;                                     // CS_N high to output disable

   end

   initial begin
      BlockProtect0 = 0;
      BlockProtect1 = 0;

      WP_Enable = 0;

      WriteActive = 0;
      WriteEnable = 0;
   end


// *******************************************************************************************************
// **   CORE LOGIC                                                                                      **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      1.01:  Internal Reset Logic
// -------------------------------------------------------------------------------------------------------

   always @(negedge CS_N) BitCounter   <= 0;
   always @(negedge CS_N) SO_Enable    <= 0;
   always @(negedge CS_N) if (!WriteActive) WritePointer <= 0;
   always @(negedge CS_N) if (!WriteActive) WriteCounter <= 0;

// -------------------------------------------------------------------------------------------------------
//      1.02:  Input Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if (CS_N == 0)         DataShifterI <= {DataShifterI[14:00],SI};
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.03:  Bit Clock Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if (CS_N == 0)         BitCounter <= BitCounter + 1;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.04:  Instruction Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if (BitCounter == 7)   InstRegister <= {DataShifterI[06:00],SI};
      end
   end

   assign InstructionREAD  = (InstRegister[7:0] == `READ);
   assign InstructionRDSR  = (InstRegister[7:0] == `RDSR);
   assign InstructionWRSR  = (InstRegister[7:0] == `WRSR);
   assign InstructionWRDI  = (InstRegister[7:0] == `WRDI);
   assign InstructionWREN  = (InstRegister[7:0] == `WREN);
   assign InstructionWRITE = (InstRegister[7:0] == `WRITE);

// -------------------------------------------------------------------------------------------------------
//      1.05:  Address Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if ((BitCounter == 23) & !WriteActive) AddrRegister <= {DataShifterI[14:00],SI};
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.06:  Block Protect Bits
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if ((BitCounter == 15) & InstructionWRSR & WriteEnable & !WriteActive & !StatusWriteProtected) begin
            BlockProtect1_New <= DataShifterI[02];
            BlockProtect0_New <= DataShifterI[01];
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.07:  Write Protect Enable
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if ((BitCounter == 15) & InstructionWRSR & WriteEnable & !WriteActive & !StatusWriteProtected) begin
            WP_Enable_New <= DataShifterI[06];
         end
      end
   end

   assign StatusWriteProtected = WP_Enable & (WP_N == 0);

// -------------------------------------------------------------------------------------------------------
//      1.08:  Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCK) begin
      if (HOLD_N == 1) begin
         if ((BitCounter >= 31) & (BitCounter[2:0] == 7) & InstructionWRITE & WriteEnable & !WriteActive) begin
            WriteBuffer[WritePointer] <= {DataShifterI[06:00],SI};

            WritePointer <= WritePointer + 1;
            if (WriteCounter < `PAGE_SIZE) WriteCounter <= WriteCounter + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.09:  Write Enable Bit
// -------------------------------------------------------------------------------------------------------

   always @(posedge CS_N or posedge RstWriteEnable) begin
      if (RstWriteEnable)       WriteEnable <= 0;
      else if (SetWriteEnable)  WriteEnable <= 1;
      else if (ClrWriteEnable)  WriteEnable <= 0;
   end

   assign RstWriteEnable = RESET;

   assign SetWriteEnable = (BitCounter == 8) & InstructionWREN & !WriteActive;
   assign ClrWriteEnable = (BitCounter == 8) & InstructionWRDI & !WriteActive;

// -------------------------------------------------------------------------------------------------------
//      1.10:  Write Cycle Processor
// -------------------------------------------------------------------------------------------------------

   always @(posedge CS_N) begin
      if ((BitCounter == 16) & (BitCounter[2:0] == 0) & InstructionWRSR  & WriteEnable & !WriteActive) begin
         if (!StatusWriteProtected) begin
            WriteActive = 1;
            #(tWC);

            BlockProtect1 = BlockProtect1_New;
            BlockProtect0 = BlockProtect0_New;
            WP_Enable = WP_Enable_New;
         end

         WriteActive = 0;
         WriteEnable = 0;
      end
      if ((BitCounter >= 32) & (BitCounter[2:0] == 0) & InstructionWRITE & WriteEnable & !WriteActive) begin
         for (LoopIndex = 0; LoopIndex < WriteCounter; LoopIndex = LoopIndex + 1) begin
            BaseAddress = {AddrRegister[13:06],6'h00};
            PageAddress = (AddrRegister[05:00] + LoopIndex);

            MemWrAddress = {BaseAddress[13:06],PageAddress[05:00]};

            if ({BlockProtect1,BlockProtect0} == 2'b00) begin
               WriteActive = 1;
            end
            if ({BlockProtect1,BlockProtect0} == 2'b01) begin
               if ((MemWrAddress >= 14'h3000) && (MemWrAddress <= 14'h3FFF)) begin
                  // write protected region
               end
               else begin
                  WriteActive = 1;
               end
            end
            if ({BlockProtect1,BlockProtect0} == 2'b10) begin
               if ((MemWrAddress >= 14'h2000) && (MemWrAddress <= 14'h3FFF)) begin
                  // write protected region
               end
               else begin
                  WriteActive = 1;
               end
            end
            if ({BlockProtect1,BlockProtect0} == 2'b11) begin
               if ((MemWrAddress >= 14'h0000) && (MemWrAddress <= 14'h3FFF)) begin
                  // write protected region
               end
               else begin
                  WriteActive = 1;
               end
            end
         end

         if (WriteActive) begin
            #(tWC);

            for (LoopIndex = 0; LoopIndex < WriteCounter; LoopIndex = LoopIndex + 1) begin
               BaseAddress = {AddrRegister[13:06],6'h00};
               PageAddress = (AddrRegister[05:00] + LoopIndex);

               MemWrAddress = {BaseAddress[13:06],PageAddress[05:00]};

               if ({BlockProtect1,BlockProtect0} == 2'b00) begin
                  MemoryBlock[MemWrAddress] = WriteBuffer[LoopIndex];
               end
               if ({BlockProtect1,BlockProtect0} == 2'b01) begin
                  if ((MemWrAddress >= 14'h3000) && (MemWrAddress <= 14'h3FFF)) begin
                     // write protected region
                  end
                  else begin
                     MemoryBlock[MemWrAddress] = WriteBuffer[LoopIndex];
                  end
               end
               if ({BlockProtect1,BlockProtect0} == 2'b10) begin
                  if ((MemWrAddress >= 14'h2000) && (MemWrAddress <= 14'h3FFF)) begin
                     // write protected region
                  end
                  else begin
                     MemoryBlock[MemWrAddress] = WriteBuffer[LoopIndex];
                  end
               end
               if ({BlockProtect1,BlockProtect0} == 2'b11) begin
                  if ((MemWrAddress >= 14'h0000) && (MemWrAddress <= 14'h3FFF)) begin
                     // write protected region
                  end
                  else begin
                     MemoryBlock[MemWrAddress] = WriteBuffer[LoopIndex];
                  end
               end
            end
         end

         WriteActive = 0;
         WriteEnable = 0;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.11:  Output Data Shifter
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCK) begin
      if (HOLD_N == 1) begin
         if ((BitCounter >= 24) & (BitCounter[2:0] == 0) & InstructionREAD & !WriteActive) begin
            if (BitCounter == 24) begin
               DataShifterO <= MemoryBlock[AddrRegister[13:00]];
               MemRdAddress <= AddrRegister + 1;
               SO_Enable    <= 1;
            end
            else begin
               DataShifterO <= MemoryBlock[MemRdAddress[13:00]];
               MemRdAddress <= MemRdAddress + 1;
            end
         end
         else if ((BitCounter > 7) & (BitCounter[2:0] == 3'b000) & InstructionRDSR) begin
            DataShifterO <= {WP_Enable,3'b000,BlockProtect1,BlockProtect0,WriteEnable,WriteActive};
            SO_Enable    <= 1;
         end
         else begin
            DataShifterO <= DataShifterO << 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      1.12:  Output Data Buffer
// -------------------------------------------------------------------------------------------------------

   bufif1 (SO, SO_DO, SO_OE);




   always @(DataShifterO) SO_DO <= #(tV) DataShifterO[07];

   bufif1 #(tV,0)    (OutputEnable1, SO_Enable, 1);
   notif1 #(tDIS)    (OutputEnable2, CS_N,   1);
   bufif1 #(tHV,tHZ) (OutputEnable3, HOLD_N, 1);

   assign SO_OE = OutputEnable1 & OutputEnable2 & OutputEnable3;


// *******************************************************************************************************
// **   DEBUG LOGIC                                                                                     **
// *******************************************************************************************************
// -------------------------------------------------------------------------------------------------------
//      2.01:  Memory Data Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] MemoryByte0000 = MemoryBlock[00000];
   wire [07:00] MemoryByte0001 = MemoryBlock[00001];
   wire [07:00] MemoryByte0002 = MemoryBlock[00002];
   wire [07:00] MemoryByte0003 = MemoryBlock[00003];
   wire [07:00] MemoryByte0004 = MemoryBlock[00004];
   wire [07:00] MemoryByte0005 = MemoryBlock[00005];
   wire [07:00] MemoryByte0006 = MemoryBlock[00006];
   wire [07:00] MemoryByte0007 = MemoryBlock[00007];
   wire [07:00] MemoryByte0008 = MemoryBlock[00008];
   wire [07:00] MemoryByte0009 = MemoryBlock[00009];
   wire [07:00] MemoryByte000A = MemoryBlock[00010];
   wire [07:00] MemoryByte000B = MemoryBlock[00011];
   wire [07:00] MemoryByte000C = MemoryBlock[00012];
   wire [07:00] MemoryByte000D = MemoryBlock[00013];
   wire [07:00] MemoryByte000E = MemoryBlock[00014];
   wire [07:00] MemoryByte000F = MemoryBlock[00015];

   wire [07:00] MemoryByte3FF0 = MemoryBlock[16368];
   wire [07:00] MemoryByte3FF1 = MemoryBlock[16369];
   wire [07:00] MemoryByte3FF2 = MemoryBlock[16370];
   wire [07:00] MemoryByte3FF3 = MemoryBlock[16371];
   wire [07:00] MemoryByte3FF4 = MemoryBlock[16372];
   wire [07:00] MemoryByte3FF5 = MemoryBlock[16373];
   wire [07:00] MemoryByte3FF6 = MemoryBlock[16374];
   wire [07:00] MemoryByte3FF7 = MemoryBlock[16375];
   wire [07:00] MemoryByte3FF8 = MemoryBlock[16376];
   wire [07:00] MemoryByte3FF9 = MemoryBlock[16377];
   wire [07:00] MemoryByte3FFA = MemoryBlock[16378];
   wire [07:00] MemoryByte3FFB = MemoryBlock[16379];
   wire [07:00] MemoryByte3FFC = MemoryBlock[16380];
   wire [07:00] MemoryByte3FFD = MemoryBlock[16381];
   wire [07:00] MemoryByte3FFE = MemoryBlock[16382];
   wire [07:00] MemoryByte3FFF = MemoryBlock[16383];

// -------------------------------------------------------------------------------------------------------
//      2.02:  Page Buffer Bytes
// -------------------------------------------------------------------------------------------------------

   wire [07:00] PageBuffer00 = WriteBuffer[00];
   wire [07:00] PageBuffer01 = WriteBuffer[01];
   wire [07:00] PageBuffer02 = WriteBuffer[02];
   wire [07:00] PageBuffer03 = WriteBuffer[03];
   wire [07:00] PageBuffer04 = WriteBuffer[04];
   wire [07:00] PageBuffer05 = WriteBuffer[05];
   wire [07:00] PageBuffer06 = WriteBuffer[06];
   wire [07:00] PageBuffer07 = WriteBuffer[07];
   wire [07:00] PageBuffer08 = WriteBuffer[08];
   wire [07:00] PageBuffer09 = WriteBuffer[09];
   wire [07:00] PageBuffer0A = WriteBuffer[10];
   wire [07:00] PageBuffer0B = WriteBuffer[11];
   wire [07:00] PageBuffer0C = WriteBuffer[12];
   wire [07:00] PageBuffer0D = WriteBuffer[13];
   wire [07:00] PageBuffer0E = WriteBuffer[14];
   wire [07:00] PageBuffer0F = WriteBuffer[15];

   wire [07:00] PageBuffer10 = WriteBuffer[16];
   wire [07:00] PageBuffer11 = WriteBuffer[17];
   wire [07:00] PageBuffer12 = WriteBuffer[18];
   wire [07:00] PageBuffer13 = WriteBuffer[19];
   wire [07:00] PageBuffer14 = WriteBuffer[20];
   wire [07:00] PageBuffer15 = WriteBuffer[21];
   wire [07:00] PageBuffer16 = WriteBuffer[22];
   wire [07:00] PageBuffer17 = WriteBuffer[23];
   wire [07:00] PageBuffer18 = WriteBuffer[24];
   wire [07:00] PageBuffer19 = WriteBuffer[25];
   wire [07:00] PageBuffer1A = WriteBuffer[26];
   wire [07:00] PageBuffer1B = WriteBuffer[27];
   wire [07:00] PageBuffer1C = WriteBuffer[28];
   wire [07:00] PageBuffer1D = WriteBuffer[29];
   wire [07:00] PageBuffer1E = WriteBuffer[30];
   wire [07:00] PageBuffer1F = WriteBuffer[31];

   wire [07:00] PageBuffer20 = WriteBuffer[32];
   wire [07:00] PageBuffer21 = WriteBuffer[33];
   wire [07:00] PageBuffer22 = WriteBuffer[34];
   wire [07:00] PageBuffer23 = WriteBuffer[35];
   wire [07:00] PageBuffer24 = WriteBuffer[36];
   wire [07:00] PageBuffer25 = WriteBuffer[37];
   wire [07:00] PageBuffer26 = WriteBuffer[38];
   wire [07:00] PageBuffer27 = WriteBuffer[39];
   wire [07:00] PageBuffer28 = WriteBuffer[40];
   wire [07:00] PageBuffer29 = WriteBuffer[41];
   wire [07:00] PageBuffer2A = WriteBuffer[42];
   wire [07:00] PageBuffer2B = WriteBuffer[43];
   wire [07:00] PageBuffer2C = WriteBuffer[44];
   wire [07:00] PageBuffer2D = WriteBuffer[45];
   wire [07:00] PageBuffer2E = WriteBuffer[46];
   wire [07:00] PageBuffer2F = WriteBuffer[47];

   wire [07:00] PageBuffer30 = WriteBuffer[48];
   wire [07:00] PageBuffer31 = WriteBuffer[49];
   wire [07:00] PageBuffer32 = WriteBuffer[50];
   wire [07:00] PageBuffer33 = WriteBuffer[51];
   wire [07:00] PageBuffer34 = WriteBuffer[52];
   wire [07:00] PageBuffer35 = WriteBuffer[53];
   wire [07:00] PageBuffer36 = WriteBuffer[54];
   wire [07:00] PageBuffer37 = WriteBuffer[55];
   wire [07:00] PageBuffer38 = WriteBuffer[56];
   wire [07:00] PageBuffer39 = WriteBuffer[57];
   wire [07:00] PageBuffer3A = WriteBuffer[58];
   wire [07:00] PageBuffer3B = WriteBuffer[59];
   wire [07:00] PageBuffer3C = WriteBuffer[60];
   wire [07:00] PageBuffer3D = WriteBuffer[61];
   wire [07:00] PageBuffer3E = WriteBuffer[62];
   wire [07:00] PageBuffer3F = WriteBuffer[63];


// *******************************************************************************************************
// **   TIMING CHECKS                                                                                   **
// *******************************************************************************************************

   wire TimingCheckEnable = (RESET == 0) & (CS_N == 0);
/*
   specify
      `ifdef VCC_2_5V_TO_4_5V
         specparam
            tHI  = 100,                                 // Clock high time
            tLO  = 100,                                 // Clock low time
            tSU  =  20,                                 // Data setup time
            tHD  =  40,                                 // Data hold time
            tHS  =  40,                                 // HOLD_N setup time
            tHH  =  40,                                 // HOLD_N hold time
            tCSD =  50,                                 // CS_N disable time
            tCSS = 100,                                 // CS_N setup time
            tCSH = 200,                                 // CS_N hold time
            tCLD = 50,                                  // Clock delay time
            tCLE = 50;                                  // Clock enable time
      `else
      `ifdef VCC_4_5V_TO_5_5V
         specparam
            tHI  =  50,                                 // Clock high time
            tLO  =  50,                                 // Clock low time
            tSU  =  10,                                 // Data setup time
            tHD  =  20,                                 // Data hold time
            tHS  =  20,                                 // HOLD_N setup time
            tHH  =  20,                                 // HOLD_N hold time
            tCSD =  50,                                 // CS_N disable time
            tCSS =  50,                                 // CS_N setup time
            tCSH = 100,                                 // CS_N hold time
            tCLD = 50,                                  // Clock delay time
            tCLE = 50;                                  // Clock enable time
      `else
         specparam
            tHI  =  50,                                 // Clock high time
            tLO  =  50,                                 // Clock low time
            tSU  =  10,                                 // Data setup time
            tHD  =  20,                                 // Data hold time
            tHS  =  20,                                 // HOLD_N setup time
            tHH  =  20,                                 // HOLD_N hold time
            tCSD =  50,                                 // CS_N disable time
            tCSS =  50,                                 // CS_N setup time
            tCSH = 100,                                 // CS_N hold time
            tCLD = 50,                                  // Clock delay time
            tCLE = 50;                                  // Clock enable time
      `endif
      `endif

      $width (posedge SCK,  tHI);
      $width (negedge SCK,  tLO);
      $width (posedge CS_N, tCSD);

      $setup (SI, posedge SCK &&& TimingCheckEnable, tSU);
      $setup (negedge CS_N, posedge SCK &&& TimingCheckEnable, tCSS);
      $setup (negedge SCK, negedge HOLD_N &&& TimingCheckEnable, tHS);
      $setup (posedge CS_N, posedge SCK &&& TimingCheckEnable, tCLD);

      $hold  (posedge SCK    &&& TimingCheckEnable, SI,   tHD);
      $hold  (posedge SCK    &&& TimingCheckEnable, posedge CS_N, tCSH);
      $hold  (posedge HOLD_N &&& TimingCheckEnable, posedge SCK,  tHH);
      $hold  (posedge SCK    &&& TimingCheckEnable, negedge CS_N, tCLE);
  endspecify
*/
endmodule
