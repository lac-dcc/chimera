//********************************************************************************************************
// This model is the property of Cypress Semiconductor Corp.
// and is protected by the US copyright laws, any unauthorized
// copying and distribution is prohibited.
// Cypress reserves the right to change any of the functional
// specifications without any prior notice.
// Cypress is not liable for any damages which may result from
// the use of this functional model
// -------------------------------------------------------------------------------------------------------
// File name : nvSRAM_I2C.v
// -------------------------------------------------------------------------------------------------------
// Functionality : Verilog behavourial Model for CY14CxxxI_CY14BxxxI_CY14ExxxI_CY14CxxxJ_CY14BxxxJ_CY14ExxxJ
// Source:  CYPRESS Data Sheet :
//              "CY14C101I_CY14B101I_CY14E101I 1 Mbit   (128K x 8)  Serial (I2C) nvSRAM with    Real Time Clock"
//              "CY14C101J_CY14B101J_CY14E101J 1 Mbit   (128K x 8)  Serial (I2C) nvSRAM without Real Time Clock"
//              "CY14C512I_CY14B512I_CY14E512I 512 Kbit (64K x 8)   Serial (I2C) nvSRAM with    Real Time Clock"
//              "CY14C512J_CY14B512J_CY14E512J 512 Kbit (64K x 8)   Serial (I2C) nvSRAM without Real Time Clock"
//              "CY14C256I_CY14B256I_CY14E256I 256 Kbit (32K x 8)   Serial (I2C) nvSRAM with    Real Time Clock"
//              "CY14MC256J_CY14MB256J_CY14ME256J 256 Kbit (32K x 8)   Serial (I2C) nvSRAM without Real Time Clock"
//              "CY14C064I_CY14B064I_CY14E064I 064 Kbit (8K x 8)    Serial (I2C) nvSRAM with    Real Time Clock"
//              "CY14MB064J_CY14ME064J 064 Kbit (8K x 8)    Serial (I2C) nvSRAM without Real Time Clock"
//              "CY14MB064J1A/CY14MB064J2A_CY14ME064J1A/CY14ME064J2A 064 Kbit (8K x 8)    Serial (I2C) nvSRAM without Real Time Clock"
// Version:  1.2 November 8, 2012
// -------------------------------------------------------------------------------------------------------
// Developed by CYPRESS SEMICONDUCTOR
//
// version |   author     | mod date | changes made
//    1.0  |    MEDU      | 23/02/11 |  New Model
//     1.1  |    GVCH      | 12/06/2012| Added CY14MB064J1A/CY14MB064J2A and CY14ME064J1A/CY14ME064J2A
//    1.2  |    GVCH      | 11/08/2012| Added Device ID logic
// -------------------------------------------------------------------------------------------------------
// PART DESCRIPTION :
// Part:        All parts of nvSRAM I2C
//
// Descripton:  Verilog behavourial Model  for  nvSRAM I2C parts
// ----------------------------------------------------------------------------------------------------------

`timescale 1ns/10ps

module I2C_SRAM (power_cycle, A0, A1, A2, WP, SDA, SCL, SDA_OE, HSB_bar, INT);

   input                power_cycle;

   input                A0;                             // chip select bit
   input                A1;                             // chip select bit
   input                A2;                             // chip select bit

   input                WP;                             // write protect pin

   inout                SDA;                            // serial data I/O
   input                SCL;                            // serial data clock
   output               SDA_OE;                         // SDA output enable

   inout                HSB_bar;                        // Hardware Store Busy

   output               INT;                            // Interrupt Pin


   `define CY14B101I
   `define rtc_sec_tick  500000
   `define freq_1MHz

   //reg [7:0] device_id[0:3];


      parameter Vswitch   =  2.35;
      parameter Vccmax    =  2.6;
      parameter tHRECALL  = 40000000;
      parameter tSTORE    =  8000000;
      parameter tRECALL   =   600000;
      parameter tSS       =   500000;

      `define addrBits 17
      `define Memblksize 131072
      `define cy1M
      parameter hasRTC = 0;
      parameter hasWP = 1;
      parameter hasVCAP = 0;
     // parameter hasA0 = 0;
      parameter hasA0 = 1;
      parameter hasHSB = 0;

      parameter [7:0]  device_id_0 = 8'h06;
      parameter [7:0]  device_id_1 = 8'h81;
      parameter [7:0]  device_id_2 = 8'h20;
      parameter [7:0]  device_id_3 = 8'hA0;


// *******************************************************************************************************
// **   DECLARATIONS                                                                                    **
// *******************************************************************************************************


   reg                  SDA_DO;                         // serial data - output
   reg                  SDA_OE;                         // serial data - output enable

   wire                 SDA_DriveEnable;                // serial data output enable
   reg                  SDA_DriveEnableDlyd;            // serial data output enable - delayed

   wire [02:00]         ChipAddress;                    // hardwired chip address

   reg  [03:00]         BitCounter;                     // serial bit counter

   reg                  START_Rcvd;                     // START bit received flag
   reg                  STOP_Rcvd;                      // STOP bit received flag
   reg                  SLAVE_ADDR_Rcvd;                // SRAM slave address byte received flag
   reg                  RTCSLAVE_ADDR_Rcvd;             // RTC slave address byte received flag
   reg                  CNTRLREGSLAVE_ADDR_Rcvd;       // Control Register slave address byte received flag
   reg                  ADHI_Rcvd;                      // byte address hi received flag
   reg                  ADLO_Rcvd;                      // byte address lo received flag
   reg                  RTCADDR_Rcvd;                   // RTC address byte received flag
   reg                  CNTRLREGADDR_Rcvd;              // Control Address address byte received flag
   reg                  MACK_Rcvd;                      // master acknowledge received flag

   reg                  WrCycle;                        // memory write cycle
   reg                  RdCycle;                        // memory read cycle
   reg                  RTCWrCycle;                     // RTC write cycle
   reg                  RTCRdCycle;                     // RTC read cycle
   reg                  CNTRLREGWrCycle;                // Control Register write cycle
   reg                  CNTRLREGRdCycle;                // Control Register read cycle

   reg  [07:00]         ShiftRegister;                  // input data shift register

   reg  [07:00]         SlaveAddress;                    // Slave Address register
   wire                 RdWrBit;                        // read/write control bit

   reg  [`addrBits-1:00]         StartAddress;                   // memory access starting address
   reg  [06:00]         PageAddress;                    // memory page address
   reg  [07:00]         RTCStartAddress;                // RTC register access starting address
   reg  [07:00]         CNTRLREGStartAddress;           // Control register access starting address
   reg  [07:00]         CNTRLMEMAddr;

   reg  [07:00]         WrDataByte [0:127];             // memory write data buffer
   wire [07:00]         RdDataByte;                     // memory read data
   reg  [07:00]         RTCWrDataByte [0:127];          // RTC write data buffer
   reg  [07:00]         RTCRdDataByte;                  // RTC read data
   reg  [07:00]         CNTRLREGWrDataByte [0:127];     // Control Register write data buffer
   wire [07:00]         CNTRLREGRdDataByte;             // Control Register read data

   reg  [`addrBits-1:00]         WrCounter;                      // memory write buffer counter
   reg  [03:00]         RTCWrCounter;                   // RTC write buffer counter
   reg  [03:00]         CNTRLREGWrCounter;              // Control Register write buffer counter

   reg  [06:00]         WrPointer;                      // memory write buffer pointer
   reg  [`addrBits-1:00]         RdPointer;                      // memory read address pointer
   reg  [03:00]         RTCWrPointer;                   // RTC write buffer pointer
   reg  [03:00]         RTCRdPointer;                   // RTC read address pointer
   reg  [03:00]         CNTRLREGWrPointer;              // Control Register write buffer pointer
   reg  [03:00]         CNTRLREGRdPointer;              // Control Register read address pointer

   reg                  WriteActive;                    // memory write cycle active
   reg                  RTCWriteActive;                 // RTC write cycle active
   reg                  CNTRLREGWriteActive;            // Control Register write cycle active

   reg  [07:00]         MemoryBlock [0:`Memblksize-1];         // SRAM memory array
   reg  [07:00]         nvMemoryBlock [0:`Memblksize-1];         // nvSRAM memory array

   reg  [07:00]         RTCBlock [0:15];                // RTC register array
   reg  [07:00]         CNTRLREGBlock [0:15];           // Control register array
   reg [7:0]            StatusRegister;
   reg [7:0]            dispStatusReg;
   reg [2:0]            SQWAVE;

   reg [24:0] addrMax, addrBegFullProt, addrBegHalfProt, addrBegQuarProt, addrBegProt, addrEndProt;

   reg [7:0] realRegRTC[0:15];
   reg RTC_clk;
   reg RTC_clk_div_2;
   reg RTC_clk_div_4;
   reg RTC_clk_div_8;
   reg RTC_clk_div_16;
   reg RTC_clk_div_32;
   reg RTC_clk_div_64;
   reg RTC_clk_div_128;
   reg RTC_clk_div_256;
   reg RTC_clk_div_512;
   reg RTC_clk_div_1024;
   reg RTC_clk_div_2048;
   reg RTC_clk_div_4096;
   reg RTC_clk_div_8192;
   reg RTC_clk_div_16384;
   reg RTC_clk_div_32768;

   reg [3:0] RTC_sec1;
   reg [2:0] RTC_sec10;
   reg [3:0] RTC_min1;
   reg [2:0] RTC_min10;
   reg [3:0] RTC_hours1;
   reg [1:0] RTC_hours10;
   reg [3:0] RTC_days1;
   reg [1:0] RTC_days10;
   reg [3:0] RTC_months1;
   reg RTC_months10;
   reg [3:0] RTC_years1;
   reg [3:0] RTC_years10;
   reg [2:0] RTC_dow;


   reg [5:0] WDT_counter;

   reg [3:0] monthdays1;
   reg [1:0] monthdays10;

   reg   WDT_rst;   // used to reset watchdog timer
   reg   int_out;


   integer              LoopIndex;                      // iterative loop index
   integer              wr_status;

   real                 Vcc;
   real                 Vrtccap;
   real                 Vrtcbat;
   reg                  HSB_bar1;
   reg                  sleep_mode;
   reg                  autostore_en;
   reg                  trigger_nv;
   reg                  nvsram_busy;
   reg                  comm_nacked;

   integer i;
   real    j;
   reg     time_low;
   reg     INT1;
   reg     memProt;

   time negSCLTim;
   time posSCLTim;
   time negSDATim;
   time posSDATim;
   time STARTTim;
   time STOPTim;

   parameter [7:0] STORE  = 'h3C;
   parameter [7:0] RECALL = 'h60;
   parameter [7:0] ASENB  = 'h59;
   parameter [7:0] ASDISB = 'h19;
   parameter [7:0] SLEEP  = 'hB9;

   // Parameters
`ifdef freq_400KHz
   parameter tHIGH   =   600;
   parameter tLOW    =  1300;
   parameter tSUDATA =   100;
   parameter tHDDATA =     0;
   parameter tSUSTO  =   600;
   parameter tBUF    =  1300;
   parameter tSUSTA  =   600;
   parameter tHDSTA  =   600;
   parameter tVDDATA =   900;        // 900 : MAX spec
`endif

`ifdef freq_1MHz
   parameter tHIGH   =  260;
   parameter tLOW    =  500;
   parameter tSUDATA =  100;
   parameter tHDDATA =    0;
   parameter tSUSTO  =  250;
   parameter tBUF    =  500;
   parameter tSUSTA  =  250;
   parameter tHDSTA  =  250;
   parameter tVDDATA =  400;          // 400 : MAX spec
`endif

`ifdef freq_3p4MHz
   parameter tHIGH   =   60;
   parameter tLOW    =  160;
   parameter tSUDATA =   10;
   parameter tHDDATA =    0;
   parameter tSUSTO  =  160;
   parameter tBUF    =  300;
   parameter tSUSTA  =  160;
   parameter tHDSTA  =  160;
   parameter tVDDATA =  130;        // 130 : MAX spec
`endif

   `define tdelay  25  //Time Allowed to Complete SRAM Cycle
   parameter BPF_th = 1.5;

   `define mem_sec1 RTCBlock[9][3:0]
   `define mem_sec10 RTCBlock[9][6:4]
   `define mem_min1 RTCBlock[10][3:0]
   `define mem_min10 RTCBlock[10][6:4]
   `define mem_hours1 RTCBlock[11][3:0]
   `define mem_hours10 RTCBlock[11][6:4]

   `define mem_dow RTCBlock[12][2:0]
   `define mem_days1 RTCBlock[13][3:0]
   `define mem_days10 RTCBlock[13][5:4]
   `define mem_months1 RTCBlock[14][3:0]
   `define mem_months10 RTCBlock[14][4]
   `define mem_years1 RTCBlock[15][3:0]
   `define mem_years10 RTCBlock[15][7:4]

   // Alarm
   `define mem_alarm_sec1 RTCBlock[2][3:0]
   `define mem_alarm_sec10 RTCBlock[2][6:4]
   `define mem_alarm_min1 RTCBlock[3][3:0]
   `define mem_alarm_min10 RTCBlock[3][6:4]
   `define mem_alarm_hours1 RTCBlock[4][3:0]
   `define mem_alarm_hours10 RTCBlock[4][6:4]
   `define mem_alarm_days1 RTCBlock[5][3:0]
   `define mem_alarm_days10 RTCBlock[5][5:4]

   `define mem_alarm_Msec RTCBlock[2][7]
   `define mem_alarm_Mmin RTCBlock[3][7]
   `define mem_alarm_Mhours RTCBlock[4][7]
   `define mem_alarm_Mdays RTCBlock[5][7]



   // Registers and Flags

   // Interrupt register
   `define mem_WIE RTCBlock[6][7]
   `define mem_AIE RTCBlock[6][6]
   `define mem_PFIE RTCBlock[6][5]

   `define mem_HL RTCBlock[6][3]
   `define mem_PL RTCBlock[6][2]
   `define mem_SQWE RTCBlock[6][4]
   `define mem_SQ0 RTCBlock[6][0]
   `define mem_SQ1 RTCBlock[6][1]

   // Flag register
   `define mem_WDF RTCBlock[0][7]
   `define mem_AF RTCBlock[0][6]
   `define mem_PF RTCBlock[0][5]
   `define mem_OSCF RTCBlock[0][4]
   `define mem_BPF RTCBlock[0][3]

   `define mem_CAL RTCBlock[0][2]
   `define mem_W RTCBlock[0][1]
   `define mem_R RTCBlock[0][0]

   // Watchdog
   `define mem_WDS RTCBlock[7][7]
   `define mem_WDW RTCBlock[7][6]
   `define mem_WDT RTCBlock[7][5:0]

   wire vccx_hi = ((Vcc >= Vswitch) && (sleep_mode == 0));
   wire vccx_lo = (Vcc < Vswitch || (sleep_mode == 'b1));
   wire rtc_write_bit = RTCBlock[0][1];
   wire rtc_read_bit  = RTCBlock[0][0];


// *******************************************************************************************************
// **   INITIALIZATION                                                                                  **
// *******************************************************************************************************

   initial begin
      SDA_DO = 0;
      SDA_OE = 0;
      HSB_bar1 = 1'bz;
   end

   initial begin
      START_Rcvd = 0;
      STOP_Rcvd  = 0;
      SLAVE_ADDR_Rcvd  = 0;
      RTCSLAVE_ADDR_Rcvd  = 0;
      CNTRLREGSLAVE_ADDR_Rcvd  = 0;
      ADHI_Rcvd  = 0;
      ADLO_Rcvd  = 0;
      RTCADDR_Rcvd  = 0;
      CNTRLREGADDR_Rcvd  = 0;
      MACK_Rcvd  = 0;
   end

   initial begin
      BitCounter  = 0;
      SlaveAddress = 0;
   end

   initial begin
      WrCycle = 0;
      RdCycle = 0;
      RTCWrCycle = 0;
      RTCRdCycle = 0;
      CNTRLREGWrCycle = 0;
      CNTRLREGRdCycle = 0;
      STOPTim = 0;
      STARTTim = 0;
      WriteActive = 0;
      RTCWriteActive = 0;
      CNTRLREGWriteActive = 0;
      for(i=0; i<`Memblksize; i=i+1)
         MemoryBlock[i] = 'hFF;
      sleep_mode = 0;
      negSCLTim = 0;
      posSCLTim = 0;
      int_out = 0;
      WDT_counter = 5'b00000;
      RTC_sec1   = 4'b0000;
      RTC_sec10  = 3'b000;
      RTC_min1   = 4'b0000;
      RTC_min10  = 3'b000;
      RTC_hours1 = 4'b0000;
      RTC_hours10= 3'b000;
      RTC_days1  = 4'b0001;
      RTC_days10 = 2'b00;
      RTC_dow    = 3'b001;
      RTC_months1 = 4'b0001;
      RTC_months10= 1'b0;
      RTC_years1  = 4'b0000;
      RTC_years10 = 4'b0000;
      RTC_clk     = 1'b0;
      RTC_clk_div_2 = 1'b0;
      RTC_clk_div_4 = 1'b0;
      RTC_clk_div_8 = 1'b0;
      RTC_clk_div_16 = 1'b0;
      RTC_clk_div_32 = 1'b0;
      RTC_clk_div_64 = 1'b0;
      RTC_clk_div_128 = 1'b0;
      RTC_clk_div_256 = 1'b0;
      RTC_clk_div_512 = 1'b0;
      RTC_clk_div_1024 = 1'b0;
      RTC_clk_div_2048 = 1'b0;
      RTC_clk_div_4096 = 1'b0;
      RTC_clk_div_8192 = 1'b0;
      RTC_clk_div_16384 = 1'b0;
      RTC_clk_div_32768 = 1'b0;
      monthdays1  = 4'b0000;
      monthdays10 = 2'b11;
      CNTRLREGBlock  [0] = 'h00;
      CNTRLREGBlock  [1] = 'h00;
      CNTRLREGBlock  [2] = 'h00;
      CNTRLREGBlock  [3] = 'h00;
      CNTRLREGBlock  [4] = 'h00;
      CNTRLREGBlock  [5] = 'h00;
      CNTRLREGBlock  [6] = 'h00;
      CNTRLREGBlock  [7] = 'h00;
      CNTRLREGBlock  [8] = 'h00;
      CNTRLREGBlock  [9] = device_id_0;
      CNTRLREGBlock [10] = device_id_1;
      CNTRLREGBlock [11] = device_id_2;
      CNTRLREGBlock [12] = device_id_3;
      CNTRLREGBlock [13] = 'h00;

      addrMax = 24'h0000;
      for(i=0; i<`addrBits; i=i+1)
      addrMax[i]=1;

      addrBegFullProt = 24'h0000;
      addrBegHalfProt = (addrMax >> 1) + 24'h0001;
      addrBegQuarProt = addrBegHalfProt + (addrMax >> 2) + 24'h0001;
      $display("*");
      $display("* Max. address:                        %h",addrMax);
      $display("* Begin of full protection address:    %h",addrBegFullProt);
      $display("* Begin of half protection address:    %h",addrBegHalfProt);
      $display("* Begin of quarter protection address: %h",addrBegQuarProt );
      $display("*");
      $display("===========================================================");
      $display;
      memProt = 1'b0;
      INT1 = 'bz;
      `mem_HL = 0;
      `mem_PL = 0;
      nvsram_busy = 0;
      wr_status = 0;
      pwr_up;
      INT1 <= (!`mem_HL);
   end

  assign ChipAddress = (hasA0 == 1) ? {A2,A1, A0} : {A2,A1, 1'b0};
  //assign ChipAddress = 3'b000;


// -------------------------------------------------------------------------------------------------------
//    START Bit Detection
// -------------------------------------------------------------------------------------------------------

   always @(negedge SDA) begin
      if (SCL == 1 & nvsram_busy == 0) begin
            STARTTim = $time;
           // if((STARTTim - STOPTim) >= tBUF) begin
            //   if((STARTTim - posSCLTim) >= tSUSTA) begin
                  START_Rcvd <= 1;
                  STOP_Rcvd  <= 0;
                  SLAVE_ADDR_Rcvd  <= 0;
                  RTCSLAVE_ADDR_Rcvd  <= 0;
                  CNTRLREGSLAVE_ADDR_Rcvd  <= 0;
                  ADHI_Rcvd  <= 0;
                  ADLO_Rcvd  <= 0;
                  RTCADDR_Rcvd <= 0;
                  CNTRLREGADDR_Rcvd <= 0;
                  MACK_Rcvd  <= 0;

                  WrCycle <= #1 0;
                  RdCycle <= #1 0;
                  RTCWrCycle <= #1 0;
                  RTCRdCycle <= #1 0;
                  CNTRLREGWrCycle <= #1 0;
                  CNTRLREGRdCycle <= #1 0;
                  comm_nacked <= 'b0;

                  BitCounter <= 0;
             //  end
              // else begin
               //   $display(" WARNING: START ignored (tSUSTA - Setup time for START condition - not respected: %d < tSUSTA) ",(STARTTim - posSCLTim),$time);
              // end
           // end
           // else begin
            //   $display(" WARNING: START ignored (tBUF - Bus free time between STOP and next START condition - not respected: %d < tBUF) ",STARTTim - STOPTim,$time);
           // end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      STOP Bit Detection
// -------------------------------------------------------------------------------------------------------

   always @(posedge SDA) begin
      if (SCL == 1 & nvsram_busy == 0) begin
         START_Rcvd <= 0;
         STOP_Rcvd  <= 1;
         SLAVE_ADDR_Rcvd  <= 0;
         RTCSLAVE_ADDR_Rcvd  <= 0;
         CNTRLREGSLAVE_ADDR_Rcvd  <= 0;
         ADHI_Rcvd  <= 0;
         ADLO_Rcvd  <= 0;
         RTCADDR_Rcvd <= 0;
         CNTRLREGADDR_Rcvd <= 0;
         MACK_Rcvd  <= 0;

         WrCycle <= #1 0;
         RdCycle <= #1 0;
         RTCWrCycle <= #1 0;
         RTCRdCycle <= #1 0;
         CNTRLREGWrCycle <= #1 0;
         CNTRLREGRdCycle <= #1 0;
         comm_nacked <= 'b0;

         BitCounter <= 10;
         STOPTim = $time;
      end
   end

// -------------------------------------------------------------------------------------------------------
//     Input Shift Register
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      if(nvsram_busy == 0) begin
         ShiftRegister[00] <= SDA;
         ShiftRegister[01] <= ShiftRegister[00];
         ShiftRegister[02] <= ShiftRegister[01];
         ShiftRegister[03] <= ShiftRegister[02];
         ShiftRegister[04] <= ShiftRegister[03];
         ShiftRegister[05] <= ShiftRegister[04];
         ShiftRegister[06] <= ShiftRegister[05];
         ShiftRegister[07] <= ShiftRegister[06];
      end
   end

// -------------------------------------------------------------------------------------------------------
//     Input Bit Counter
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      if ((BitCounter < 10) & (nvsram_busy == 0)) BitCounter <= BitCounter + 1;
   end

// -------------------------------------------------------------------------------------------------------
//      Slave Address Register
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL && nvsram_busy == 0) begin
      if (START_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (!WriteActive & (ShiftRegister[07:04] == 4'b1010) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00]))) begin
            if (ShiftRegister[00] == 0) WrCycle <= 1;
            if (ShiftRegister[00] == 1) RdCycle <= 1;

            `ifdef cy1M
               if((hasA0 ==0) && (`addrBits == 17))
               begin
                  StartAddress[16] <= ShiftRegister[01];         // Copy block select bit
                  RdPointer[16]    <= ShiftRegister[01];         // Copy block select bit
               end
               else if(`addrBits == 17)
               begin
                  StartAddress[16] <= 0;
                  RdPointer[16]    <= 0;
               end
            `endif

            SlaveAddress     <= ShiftRegister[07:00];
            SLAVE_ADDR_Rcvd <= 1;
 //           $display("\nSRAM Slave Address %h received\n", ShiftRegister[07:00]);
            if(sleep_mode == 1)
               sleep_mode <= 0;
         end
         else if (!RTCWriteActive & (hasRTC == 1) & (ShiftRegister[07:04] == 4'b1101) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00]))) begin
            if (ShiftRegister[00] == 0) RTCWrCycle <= 1;
            if (ShiftRegister[00] == 1) RTCRdCycle <= 1;

            SlaveAddress     <= ShiftRegister[07:00];

            RTCSLAVE_ADDR_Rcvd <= 1;
            $display("\nRTC Slave Address %h received\n", ShiftRegister[07:00]);
            if(sleep_mode == 1)
               sleep_mode <= 0;
         end
         else if (!CNTRLREGWriteActive & (ShiftRegister[07:04] == 4'b0011) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00]))) begin
            if (ShiftRegister[00] == 0) CNTRLREGWrCycle <= 1;
            if (ShiftRegister[00] == 1) CNTRLREGRdCycle <= 1;

            SlaveAddress     <= ShiftRegister[07:00];

            CNTRLREGSLAVE_ADDR_Rcvd <= 1;
            $display("\nControl Register Slave Address %h received\n", ShiftRegister[07:00]);
            if(sleep_mode == 1)
               sleep_mode <= 0;
         end

         if (!RTCWriteActive & (ShiftRegister[07:04] == 4'b1101) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00])))
         begin
            if(hasRTC == 0)
               $display ("SLAVE ERROR: This is not an RTC device");
         end

         START_Rcvd <= 0;
      end
   end

   assign RdWrBit = SlaveAddress[00];

// -------------------------------------------------------------------------------------------------------
//      Byte Address Register
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL && nvsram_busy == 0) begin
      if (SLAVE_ADDR_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin

            if(`addrBits == 17) begin
               StartAddress[`addrBits-2:08] <= ShiftRegister[07:00];
               RdPointer[`addrBits-2:08]    <= ShiftRegister[07:00];
            end
            else begin
               StartAddress[`addrBits-1:08] <= ShiftRegister[07:00];
               RdPointer[`addrBits-1:08]    <= ShiftRegister[07:00];
            end

            ADHI_Rcvd <= 1;
         end

         WrCounter <= 0;
         WrPointer <= 0;

         SLAVE_ADDR_Rcvd <= 0;
      end
      else if(RTCSLAVE_ADDR_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            RTCStartAddress[07:00] <= ShiftRegister[07:00];
            RTCRdPointer[03:00]    <= ShiftRegister[03:00];

            RTCADDR_Rcvd <= 1;
         end

         RTCWrCounter <= 0;
         RTCWrPointer <= 0;

         RTCSLAVE_ADDR_Rcvd <= 0;
      end
      else if(CNTRLREGSLAVE_ADDR_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            CNTRLREGStartAddress[07:00] <= ShiftRegister[07:00];
            CNTRLREGRdPointer[03:00]    <= ShiftRegister[03:00];

            CNTRLREGADDR_Rcvd <= 1;
         end

         CNTRLREGWrCounter <= 0;
         CNTRLREGWrPointer <= 0;

         CNTRLREGSLAVE_ADDR_Rcvd <= 0;
      end
   end

   always @(negedge SCL) begin
      if (ADHI_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            StartAddress[07:00] <= ShiftRegister[07:00];
            RdPointer[07:00]    <= ShiftRegister[07:00];

            ADLO_Rcvd <= 1;
         end

         WrCounter <= 0;
         WrPointer <= 0;

         ADHI_Rcvd <= 0;
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (ADLO_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            WrDataByte[WrPointer] <= ShiftRegister[07:00];

            WrCounter <= WrCounter + 1;
            WrPointer <= WrPointer + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      RTC Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (RTCADDR_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            RTCWrDataByte[RTCWrPointer] <= ShiftRegister[07:00];

            RTCWrCounter <= RTCWrCounter + 1;
            RTCWrPointer <= RTCWrPointer + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Control Register Write Data Buffer
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (CNTRLREGADDR_Rcvd & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if (RdWrBit == 0) begin
            CNTRLREGWrDataByte[CNTRLREGWrPointer] <= ShiftRegister[07:00];

            if(CNTRLREGWrCounter == 'h0D)
               CNTRLREGWrCounter <= 'h0;
            else
               CNTRLREGWrCounter <= CNTRLREGWrCounter + 1;

            if(CNTRLREGWrPointer == 'h0D)
               CNTRLREGWrPointer <= 'h0;
            else
               CNTRLREGWrPointer <= CNTRLREGWrPointer + 1;
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Acknowledge Generator
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (!WriteActive && !RTCWriteActive && !CNTRLREGWriteActive && (nvsram_busy == 0)) begin
         if (BitCounter == 8) begin
            if ((WrCycle | (START_Rcvd & (ShiftRegister[07:04] == 4'b1010) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00])) )) & !comm_nacked) begin
               SDA_DO <= 0;
               SDA_OE <= 1;
            end
            else if (RTCWrCycle | (START_Rcvd & (ShiftRegister[07:04] == 4'b1101) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00])))) begin
               if(!(RTCSLAVE_ADDR_Rcvd & (ShiftRegister[07:00] > 'h0F)) & !comm_nacked) begin
                  SDA_DO <= 0;
                  SDA_OE <= 1;
               end
               else begin
                  comm_nacked <= 'b1;
               end
            end
            else if ((CNTRLREGWrCycle | (START_Rcvd & (ShiftRegister[07:04] == 4'b0011) & (( hasA0 == 0 & ShiftRegister[03:02] == ChipAddress[02:01]) || ( hasA0 == 1 & ShiftRegister[03:01] == ChipAddress[02:00]))))& !comm_nacked) begin
               if(CNTRLREGStartAddress == 'hAA && CNTRLREGWrCounter == 0 ) begin
                  if (ShiftRegister[7:0] == STORE || ShiftRegister[7:0] == RECALL || ShiftRegister[7:0] == ASENB || ShiftRegister[7:0] == ASDISB || ShiftRegister[7:0] == SLEEP) begin
                     SDA_DO <= 0;
                     SDA_OE <= 1;
                     trigger_nv <= 'b1;
                  end
               end
               else begin
                  if(!(CNTRLREGSLAVE_ADDR_Rcvd & (ShiftRegister[07:00] > 'h0D)) || (CNTRLREGSLAVE_ADDR_Rcvd & ShiftRegister[07:00] == 'hAA)) begin
                     SDA_DO <= 0;
                     SDA_OE <= 1;
                  end
                  else begin
                     comm_nacked <= 'b1;
                  end
               end
            end
            else begin
               comm_nacked <= 'b1;
            end
         end
         if (BitCounter == 9) begin
            BitCounter <= 0;

         if (!RdCycle && !RTCRdCycle && !CNTRLREGRdCycle) begin
             SDA_DO <= 0;
             SDA_OE <= 0;
             trigger_nv <= 'b0;
         end

         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Acknowledge Detect
// -------------------------------------------------------------------------------------------------------

   always @(posedge SCL) begin
      if ((RdCycle || RTCRdCycle || CNTRLREGRdCycle) & (BitCounter == 8) & (nvsram_busy == 0)) begin
         if ((SDA == 0) & (SDA_OE == 0)) MACK_Rcvd <= 1;
      end
   end

   always @(negedge SCL) MACK_Rcvd <= 0;

// -------------------------------------------------------------------------------------------------------
//      Write Cycle Timer
// -------------------------------------------------------------------------------------------------------

   always @(posedge STOP_Rcvd) begin
      if (WrCycle & (WP == 0) & (WrCounter > 0) & (nvsram_busy == 0)) begin
         WriteActive = 1;
         #10;
         WriteActive = 0;
      end
      else if (RTCWrCycle & (WP == 0) & (RTCWrCounter > 0)) begin
         RTCWriteActive = 1;
         #10;
         RTCWriteActive = 0;
      end
      else if (CNTRLREGWrCycle & (WP == 0) & (CNTRLREGWrCounter > 0)) begin
         CNTRLREGWriteActive = 1;
         #10;
         CNTRLREGWriteActive = 0;
      end
   end

   always @(posedge STOP_Rcvd) begin
      #(100.0);
      STOP_Rcvd = 0;
   end

// -------------------------------------------------------------------------------------------------------
//      Write Cycle Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge WriteActive) begin
      if(nvsram_busy == 0) begin
         for (LoopIndex = 0; LoopIndex < WrCounter; LoopIndex = LoopIndex + 1) begin
            if(memProt == 1'b0 || (((StartAddress[`addrBits-1:00] + LoopIndex[06:00]) < addrBegProt) || ((StartAddress[`addrBits-1:00] + LoopIndex[06:00]) > addrEndProt)))
                begin
               MemoryBlock[StartAddress[`addrBits-1:00] + LoopIndex[06:00]] = WrDataByte[LoopIndex[06:00]];
               wr_status = 1;
                end
            else
               $display("WARNING: Write to Block Protected Area");

         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      RTC Write Cycle Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge RTCWriteActive) begin
      if(nvsram_busy == 0) begin
         for (LoopIndex = 0; LoopIndex < RTCWrCounter; LoopIndex = LoopIndex + 1) begin

            RTCBlock[RTCStartAddress[07:00] + LoopIndex[06:00]] = RTCWrDataByte[LoopIndex[06:00]];
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Control Register Write Cycle Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge CNTRLREGWriteActive) begin
      if(nvsram_busy == 0) begin
         CNTRLMEMAddr = CNTRLREGStartAddress[07:00];

         for (LoopIndex = 0; LoopIndex < CNTRLREGWrCounter; LoopIndex = LoopIndex + 1) begin

            if(CNTRLMEMAddr >= 'h0E & !(CNTRLMEMAddr == 'hAA))
               CNTRLMEMAddr = 0;

            if(((CNTRLMEMAddr > 0) & (CNTRLMEMAddr <= 'h8) & (!(CNTRLREGBlock[0] & 'h40))) || (CNTRLMEMAddr == 0) ) begin
               if((CNTRLMEMAddr == 0) && (CNTRLREGBlock[0] & 'h40)) begin
                  CNTRLREGBlock[CNTRLMEMAddr] = CNTRLREGWrDataByte[LoopIndex[06:00]] | 'h40;
               end
               else begin
                  CNTRLREGBlock[CNTRLMEMAddr] = CNTRLREGWrDataByte[LoopIndex[06:00]];
               end
            end
            else if(CNTRLMEMAddr !== 'hAA)
               $display("WARNING: Not Writable Register: Write NOT SUCCESS");

            if(CNTRLMEMAddr == 0)
               displayStatusRegSense;

            CNTRLMEMAddr = CNTRLMEMAddr + 1;

         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      Read Data Multiplexor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (BitCounter == 8 & (nvsram_busy == 0)) begin
         if (WrCycle & ADLO_Rcvd) begin
            RdPointer <= StartAddress + WrPointer + 1;
         end
         else if (RTCWrCycle & RTCADDR_Rcvd) begin
            RTCRdPointer <= RTCStartAddress + RTCWrPointer + 1;
         end
         else if (CNTRLREGWrCycle & CNTRLREGADDR_Rcvd) begin
            CNTRLREGRdPointer <= CNTRLREGStartAddress + CNTRLREGWrPointer + 1;
         end

         if (RdCycle) begin
            RdPointer <= RdPointer + 1;
         end
         if (RTCRdCycle) begin
            RTCRdPointer <= RTCRdPointer + 1;
         end
         if (CNTRLREGRdCycle) begin
            if (CNTRLREGRdPointer == 'h0D)
               CNTRLREGRdPointer <= 'h0;
            else
               CNTRLREGRdPointer <= CNTRLREGRdPointer + 1;
         end
      end
   end

   assign RdDataByte         = MemoryBlock[RdPointer[`addrBits-1:00]];
   assign CNTRLREGRdDataByte = CNTRLREGBlock[CNTRLREGRdPointer[03:00]];

   always @(*) begin
      RTCRdDataByte      = RTCBlock[RTCRdPointer[03:00]];
      if(RTCRdCycle & (RTCRdPointer == 0) & (RTCBlock[0] && 'h40)) begin
         RTCBlock[0] = RTCBlock[0] & 'h1F;
      end

      if(RTCRdPointer == 0)
         INT1 <= (!`mem_HL);

   end

// -------------------------------------------------------------------------------------------------------
//      Read Data Processor
// -------------------------------------------------------------------------------------------------------

   always @(negedge SCL) begin
      if (RdCycle & (nvsram_busy == 0)) begin
         if (BitCounter == 8) begin
            SDA_DO <= 0;
            SDA_OE <= 0;
         end
         else if (BitCounter == 9) begin
            SDA_DO <= RdDataByte[07];

            if (MACK_Rcvd) SDA_OE <= 1;
         end
         else begin
            SDA_DO <= RdDataByte[7-BitCounter];
         end
      end
      else if (RTCRdCycle & (nvsram_busy == 0)) begin
         if (BitCounter == 8) begin
            SDA_DO <= 0;
            SDA_OE <= 0;
         end
         else if (BitCounter == 9) begin
            SDA_DO <= RTCRdDataByte[07];

            if (MACK_Rcvd) SDA_OE <= 1;
         end
         else begin
            SDA_DO <= RTCRdDataByte[7-BitCounter];
         end
      end
      else if (CNTRLREGRdCycle & (nvsram_busy == 0)) begin
         if (BitCounter == 8) begin
            SDA_DO <= 0;
            SDA_OE <= 0;
         end
         else if (BitCounter == 9) begin
            SDA_DO <= CNTRLREGRdDataByte[07];

            if (MACK_Rcvd) SDA_OE <= 1;
         end
         else begin
            SDA_DO <= CNTRLREGRdDataByte[7-BitCounter];
         end
      end
   end

// -------------------------------------------------------------------------------------------------------
//      SDA Data I/O Buffer
// -------------------------------------------------------------------------------------------------------

  // bufif1 (SDA, 1'b0, SDA_DriveEnableDlyd);
   bufif1 (SDA, 1'b0, SDA_DriveEnable);

   assign SDA_DriveEnable = !SDA_DO & SDA_OE;
   //always @(SDA_DriveEnable) SDA_DriveEnableDlyd <= #(tVDDATA) SDA_DriveEnable;

// -------------------------------------------------------------------------------------------------------
//      NV Operations
// -------------------------------------------------------------------------------------------------------
always @(posedge trigger_nv) begin
   if(ShiftRegister[7:0] == STORE) begin
      $display("      STORE operation initiated at %d", $time);
      StatusRegister[0] = 1'b1;
      nvsram_busy = 1;
      #tSTORE storeMem;
      StatusRegister[0] = 1'b0;
      nvsram_busy = 0;
      SDA_OE = 0;
      $display("      STORE operation complete at %d", $time);
   end
   else if(ShiftRegister[7:0] == RECALL) begin
      $display("      RECALL operation initiated at %d", $time);
      StatusRegister[0] = 1'b1;
      nvsram_busy = 1;
      #tRECALL recallMem;
      StatusRegister[0] = 1'b0;
      nvsram_busy = 0;
      SDA_OE = 0;
      $display("      RECALL operation complete at %d", $time);
   end
   else if(ShiftRegister[7:0] == ASENB) begin
      $display("     Enabling AutoStore...");
      StatusRegister[0] = 1'b1;
      nvsram_busy = 1;
      #tSS autostore_en = 1;
      StatusRegister[0] = 1'b0;
      nvsram_busy = 0;
      SDA_OE = 0;
      $display("     AutoStore Enabled");
   end
   else if(ShiftRegister[7:0] == ASDISB) begin
      $display("     Disabling AutoStore...");
      StatusRegister[0] = 1'b1;
      nvsram_busy = 1;
      #tSS autostore_en = 0;
      StatusRegister[0] = 1'b0;
      nvsram_busy = 0;
      SDA_OE = 0;
      $display("     AutoStore Disabled");
   end
   else if(ShiftRegister[7:0] == SLEEP) begin
      $display("     SLEEP operation initiated...");
      StatusRegister[0] = 1'b1;
      nvsram_busy = 1;
      sleep_mode = 1;
      $display("     SLEEP operation complete");
   end
end

// -------------------------------------------------------------------------------------------------------
//      TASKS
// -------------------------------------------------------------------------------------------------------

task storeMem;
begin
   for(i=0; i<`Memblksize; i=i+1)
      nvMemoryBlock[i] = MemoryBlock[i];
   wr_status  = 0;
end
endtask

task recallMem;
begin
   for(i=0; i<`Memblksize; i=i+1)
      MemoryBlock[i] = nvMemoryBlock[i];

   wr_status  = 0;
end
endtask

//always @(posedge power_cycle)
initial begin
    $display(" nvSRAM Power UP ");
    pwr_up;
end

//always @(negedge power_cycle)
//begin
//    $display(" nvSRAM Power DOWN ");
//    pwr_down;
//end

task pwr_down;
begin
    for(j=Vccmax;j>=0;j=j-0.1)
    begin
        #1 Vcc = j;
    end
    Vrtcbat = 2.0;
    Vrtccap = 'hz;
    if(Vrtcbat < BPF_th & !(Vrtcbat == 'hz)) begin
       `mem_BPF = 1;
       $display("WARNING: BPF flag set");
    end
    if(Vrtccap < BPF_th & !(Vrtccap == 'hz)) begin
       `mem_BPF = 1;
       $display("WARNING: BPF flag set");
    end
end
endtask

task pwr_up;
begin
    //for(j=0.0;j<=Vccmax;j=j+0.1)
    //begin
        #1 Vcc = 2.35;
    //end
    Vrtcbat = Vccmax;
    Vrtccap = Vccmax;
end
endtask

task displayStatusRegSense;
begin

   dispStatusReg = CNTRLREGBlock[0];

   $display("*** Status Register %hH (%b): ",dispStatusReg,dispStatusReg);

   //
   // explain status register
   // SR[0]=RDY,SR[1]=WEN,SR[2]=BP0,SR[3]=BP1;SR[6]=SNL;SR[7]=WPEN
   //
    case (dispStatusReg[6])
        1'b0:
                $display("*** Serial number not locked SNL : 0");
        1'b1:
                $display("*** Serial number locked     SNL : 1");
    endcase

    case (dispStatusReg[3:2])
        2'b00: begin
            //    No protection
            memProt = 1'b0;
            addrBegProt = 16'h0000;
            addrEndProt = 16'h0000;
            $display("*** No protection on memory");
            $display("*** Block protect:        no");
        end
        2'b01: begin
            //    Quarter protection
            memProt = 1'b1;
            addrBegProt = addrBegQuarProt;
            addrEndProt = addrMax;
            $display("*** Quarter protection on memory");
            $display("*** Block protect:        Quarter memory (%hH - %hH)",addrBegProt,addrEndProt);
        end
        2'b10: begin
            //    Half protection
            memProt = 1'b1;
            addrBegProt = addrBegHalfProt;
            addrEndProt = addrMax;
            $display("*** Half protection on memory");
            $display("*** Block protect:        Half memory (%hH - %hH)",addrBegProt,addrEndProt);
        end
        2'b11: begin
            //    Full protection
            memProt = 1'b1;
            addrBegProt = 16'h0000;
            addrEndProt = addrMax;
            $display("*** Full protection on memory");
            $display("*** Block protect:        Entire memory (%hH - %hH)",addrBegProt,addrEndProt);
        end
    endcase
end
endtask


//********************* RTC Functionality ******************************
// This part of the code implements the RTC functionality
// RTC buffer in memory is mapped to aliases as mem_sec1 etc
// Interrupt and Flag registers are similarly mapped
//
// RTC CLock: (RTC_clk)
//    RTC_sec1, RTC_sec10 etc are BCD counters incremented on every
//  transition of RTC_clk

always #`rtc_sec_tick
begin
  if ( `mem_R == 1'b0 && `mem_W == 1'b0 ) begin
    `mem_sec1     <= RTC_sec1;
    `mem_sec10    <= RTC_sec10;
    `mem_min1     <= RTC_min1;
    `mem_min10    <= RTC_min10;
    `mem_hours1   <= RTC_hours1;
    `mem_hours10  <= RTC_hours10;
    `mem_days1    <= RTC_days1;
    `mem_days10   <= RTC_days10;
    `mem_months1  <= RTC_months1;
    `mem_months10 <= RTC_months10;
    `mem_years1   <= RTC_years1;
    `mem_years10  <= RTC_years10;
    `mem_dow      <= RTC_dow;
  end

// Matching Alarm
  if (  (`mem_alarm_Msec ||
   (`mem_sec1 == `mem_alarm_sec1 &&
   `mem_sec10 == `mem_alarm_sec10) )&&
   (`mem_alarm_Mmin ||
   (`mem_min1 == `mem_alarm_min1 &&
   `mem_min10 == `mem_alarm_min10) )&&
   (`mem_alarm_Mhours ||
   (`mem_hours1 == `mem_alarm_hours1 &&
   `mem_hours10 == `mem_alarm_hours10) )&&
   (`mem_alarm_Mdays ||
   (`mem_days1 == `mem_alarm_days1 &&
   `mem_days10 == `mem_alarm_days10) )  && (!`mem_alarm_Msec || !`mem_alarm_Mmin || !`mem_alarm_Mhours || !`mem_alarm_Mdays))
  begin
  // Alarm Time Matched!
   $display ("%d Alarm Time Matched   Time: %h%h : %h%h : %h%h ", $time, `mem_hours10,`mem_hours1,`mem_min10,`mem_min1,`mem_sec10,`mem_sec1);
   `mem_AF = 1'b1;
  end
end

// Watchdog Timer Matching
always@(RTC_clk, WDT_rst)
begin
   if (WDT_rst == 1'b1)
   begin
      WDT_counter <= 7'b0;
      WDT_rst <= 1'b0;
      `mem_WDF <= 1'b0;
   end
   else if (WDT_counter == `mem_WDT && `mem_WDT != 5'b00000 && `mem_WDF == 1'b0)
   begin
     `mem_WDF <= 1'b1;
      $display ("%d WatchDog Timer Interrupt %d", $time, `mem_WDT);
   end
   else
      WDT_counter <= WDT_counter + 1;
end

always@(posedge `mem_WDS)
begin
   WDT_rst <= 1'b1;
end

// Interupt is registered and signalled on INT pin depending upon the type of interrupt
// set in the Interrupt Flag
// Interupts need to be enabled for any effect to be seen on INT pin

always@(`mem_WDF or `mem_AF or `mem_PF or `mem_WIE or `mem_AIE or `mem_PFIE)
begin
   if (`mem_WIE &&   `mem_WDF) begin
      int_out <= 1'b1;
   end
   else if (`mem_AIE && `mem_AF) begin
      int_out <= 1'b1;
   end
   else if (`mem_PFIE && `mem_PF) begin
      int_out <= 1'b1;
   end
   else begin
      int_out <= 1'b0;
   end
end

always@(posedge int_out)
begin
   if (!`mem_PL)   // High-Low
   begin
    INT1 <= `mem_HL;
   end
   else
   begin
      INT1 <= `mem_HL;
//      #200000000 INT1 <= (!`mem_HL);  HM
      #2000000 INT1 <= (!`mem_HL);
   end
end

// Setting TIME : Copying the Time from memory to the BCD counters

always@(negedge `mem_W)
begin
 RTC_sec1    <= `mem_sec1;
 RTC_sec10   <= `mem_sec10;
 RTC_min1    <= `mem_min1;
 RTC_min10   <= `mem_min10;
 RTC_hours1  <= `mem_hours1;
 RTC_hours10 <= `mem_hours10;
 RTC_days1   <= `mem_days1;
 RTC_days10  <= `mem_days10;
 RTC_months1 <= `mem_months1;
 RTC_months10<= `mem_months10;
 RTC_years1  <= `mem_years1;
 RTC_years10 <= `mem_years10;
 RTC_dow     <= `mem_dow;
end


// RTC Clock BCD Counters

always #`rtc_sec_tick
begin
   RTC_clk   = ~RTC_clk;   //eg : 32Khz
end

always @(posedge RTC_clk)
begin
  RTC_clk_div_2 = ~RTC_clk_div_2;  // 16Khz
end

always @(posedge RTC_clk_div_2)
begin
  RTC_clk_div_4 = ~RTC_clk_div_4; // 8Khz
end

always @(posedge RTC_clk_div_4)
begin
  RTC_clk_div_8 = ~RTC_clk_div_8;  // 4KHz
end

always @(posedge RTC_clk_div_8)
begin
  RTC_clk_div_16 = ~RTC_clk_div_16; // 2Khz
end

always @(posedge RTC_clk_div_16)
begin
  RTC_clk_div_32 = ~RTC_clk_div_32; // 1KHz
end

always @(posedge RTC_clk_div_32)
begin
  RTC_clk_div_64 = ~RTC_clk_div_64;  // 512Hz
end

always @(posedge RTC_clk_div_64)
begin
  RTC_clk_div_128 = ~RTC_clk_div_128;  // 256Hz
end

always @(posedge RTC_clk_div_128)
begin
  RTC_clk_div_256 = ~RTC_clk_div_256; // 128hz
end

always @(posedge RTC_clk_div_256)
begin
  RTC_clk_div_512 = ~RTC_clk_div_512; // 64Hz
end

always @(posedge RTC_clk_div_512)
begin
  RTC_clk_div_1024 = ~RTC_clk_div_1024;  // 32Hz
end


always @(posedge RTC_clk_div_1024)
begin
  RTC_clk_div_2048 = ~RTC_clk_div_2048;  // 16Hz
end

always @(posedge RTC_clk_div_2048)
begin
  RTC_clk_div_4096 = ~RTC_clk_div_4096;  // 8Hz
end

always @(posedge RTC_clk_div_4096)
begin
  RTC_clk_div_8192 = ~RTC_clk_div_8192; // 4hz
end

always @(posedge RTC_clk_div_8192)
begin
  RTC_clk_div_16384 = ~RTC_clk_div_16384; // 2Hz
end

always @(posedge RTC_clk_div_16384)
begin
  RTC_clk_div_32768 = ~RTC_clk_div_32768;  // 1Hz
end

// BCD clock implementation
always@(RTC_clk)
begin
if (RTC_sec1 != 4'b1001)
RTC_sec1 <= RTC_sec1 + 1;
else
begin
RTC_sec1 <= 4'b0000;

if (RTC_sec10 != 3'b101)
   RTC_sec10 <= RTC_sec10 + 1;
else
begin
    RTC_sec10 <= 3'b000;

    if (RTC_min1 != 4'b1001)
       RTC_min1 <= RTC_min1 + 1;
    else
    begin
       RTC_min1 <= 4'b0000;

       if (RTC_min10 != 3'b101)
          RTC_min10 <= RTC_min10 + 1;
       else
       begin
          RTC_min10 <= 3'b000;

          if ((RTC_hours1 != 4'b1001) && (RTC_hours1 != 4'b0011 || RTC_hours10 != 2'b10))
             RTC_hours1 <= RTC_hours1 + 1;
          else if (RTC_hours1 == 4'b1001)
          begin
              RTC_hours1 <= 4'b0000;
              RTC_hours10 <= RTC_hours10 + 1;
          end
          else if (RTC_hours1 == 4'b0011 && RTC_hours10 == 2'b10) // 24 hours
          begin
              RTC_hours1 <= 4'b0000;
              RTC_hours10 <= 2'b00;

              if (RTC_dow == 3'b111)
                 RTC_dow = 3'b001;
              else
                 RTC_dow     <= RTC_dow + 1;

             if ((RTC_days1 != 4'b1001) && (RTC_days1 != monthdays1 || RTC_days10 != monthdays10))
             begin
                 RTC_days1 <= RTC_days1+1;
             end
             else if ((RTC_days1 == 4'b1001) && (RTC_days1 != monthdays1 || RTC_days10 != monthdays10))
             begin
                 RTC_days1 <= 4'b0000;
                 RTC_days10 <= RTC_days10 + 1;
             end
             else if ((RTC_days1 == monthdays1 && RTC_days10 == monthdays10))
             begin

                RTC_days1 <= 4'b0001;
                RTC_days10  <= 2'b00;

                if ((RTC_months1 != 4'b1001) && (RTC_months10 != 1'b1 || RTC_months1 != 4'b0010))
                   RTC_months1 <= RTC_months1 + 1;
                else if ((RTC_months10 != 1'b1 && RTC_months1 != 4'b0010) || (RTC_months1 == 4'b1001))
                begin
                      RTC_months10 <= 1'b1;
                      RTC_months1  <= 4'b0001;
                end
                else if ((RTC_months1 == 4'b0010 && RTC_months10 == 1'b1))
                begin
                    RTC_months1   <= 4'b0001;
                    RTC_months10 <= 1'b0;

                    if (RTC_years1 != 4'b1001)
                        RTC_years1 <= RTC_years1 +1;
                    else
                    begin
                       RTC_years1 <= 4'b0000;

                       if (RTC_years10 != 4'b100)
                          RTC_years10 <= RTC_years10 +1;
                       else
                       begin
                          RTC_years10 <= 4'b0000;
                       end

                    end
                end

             end
          end
       end
   end
end
end
end

always@(RTC_months1)
begin
if (RTC_months10 == 1'b0)
begin
 if ( (RTC_months1 ==  4'b0001) ||(RTC_months1 ==  4'b0011) || (RTC_months1 ==  4'b0101) ||
        (RTC_months1 ==  4'b0111) || (RTC_months1 ==  4'b1000) )
 begin
     monthdays1 = 4'b0001;
     monthdays10 = 2'b11;
 end
 else if ( (RTC_months1 ==  4'b0100) || (RTC_months1 ==  4'b0110) || (RTC_months1 ==  4'b1001) )
 begin
     monthdays1 = 4'b0000;
     monthdays10 = 2'b11;
 end
 else
 begin
     if  ( ( ( RTC_years10[0] == 1'b0 )  && ( RTC_years1 == 4'b0000 ||  RTC_years1 == 4'b0100 ||  RTC_years1 == 4'b1000))
         || ((RTC_years10[0] == 1'b1 )  && ( RTC_years1 == 4'b0010 ||  RTC_years1 == 4'b0110 )) )
     begin
         monthdays1 = 4'b1001;
         monthdays10 = 2'b10;
     end
     else
     begin
         monthdays1 = 4'b1000;
         monthdays10 = 2'b10;
     end
  end
end
else
begin
 if ( (RTC_months1[0] == 1'b0) )
 begin
     monthdays1 = 4'b0001;
     monthdays10 = 2'b11;
 end
 else
 begin
     monthdays1 = 4'b0000;
     monthdays10 = 2'b11;
 end
end
end

//always@(posedge vccx_hi)
//begin
//   $display("AutoRecall initiated at %f", Vcc);
//   nvsram_busy = 1;
//   HSB_bar1 = 1'b0;
//   recallMem;
//   #tHRECALL  HSB_bar1 = 1'b1;
//   nvsram_busy = 0;
//   SDA_OE = 0;
//   $display("%d AutoRecall Completed", $time);
//end

//always@(posedge vccx_lo)
//begin
//   if(autostore_en == 1 || sleep_mode == 1) begin
//      $display("AutoStore initiated at %f", Vcc);
//      nvsram_busy = 1;
//      HSB_bar1 = 1'b0;
//      storeMem;
//      //#tSTORE     HSB_bar1 = 1'b1;
//      #1     HSB_bar1 = 1'b1;
//      nvsram_busy = 0;
//      SDA_OE = 0;
//      $display("%d AutoStore Completed", $time);
//   end
//end

assign (weak1, strong0 ) HSB_bar = (HSB_bar1 == 1) ? 'b1: 'b0;
wire INT  = (int_out) ? INT1 : (`mem_SQWE == 1 & `mem_CAL == 0) ? ((SQWAVE == 3)? RTC_clk:((SQWAVE == 2)? RTC_clk_div_8:((SQWAVE == 1)? RTC_clk_div_64: RTC_clk_div_32768))) : INT1;

always @(posedge `mem_SQWE)
begin
   if(`mem_SQ0 & `mem_SQ1)
      SQWAVE <= 3;
   else if(!`mem_SQ0 & `mem_SQ1)
      SQWAVE <= 2;
   else if(`mem_SQ0 & !`mem_SQ1)
      SQWAVE <= 1;
   else if(!`mem_SQ0 & !`mem_SQ1)
      SQWAVE <= 0;
end


//Initiate a Hardware STORE operation if atleast one Write operation has happened since the last STORE/RECALL
always@(negedge HSB_bar)
begin
    if(hasHSB == 1) begin
       HSB_bar1 <= 1'b0;
       if ( wr_status == 1 & nvsram_busy == 0 )
       begin

          #`tdelay HSB_bar1 = 1'b0;
          storeMem;
       $display("%d Hardware Store Initiated", $time);
       #tSTORE HSB_bar1 = 1'b1;
       end
       else if (wr_status == 0 & nvsram_busy == 0)
          begin
              $display("%d HSB low: Hardware Store not initiated : No Write has happened since last store", $time);
              #`tdelay HSB_bar1 = 1'b1;
          end
       wr_status = 0;
    end
    else begin
          $display("%d ERROR: HSB PIN NOT PRESENT", $time);
    end
end

/*
// -------------------------------------------------------------------------------------------------------
//      Timing check
// -------------------------------------------------------------------------------------------------------
always @(negedge SCL)
begin
    negSCLTim = $time;
    //if((negSCLTim - STARTTim ) < tHDSTA)
   // begin
     //      START_Rcvd <= 0;
     //      $display(" WARNING: START ignored (tHDSTA - Hold time for START condition - not respected: %d < tHDSTA) ",(negSCLTim - STARTTim ),$time);
   // end
end

always @(posedge SCL)
begin
    posSCLTim = $time;
end

always @(negedge SDA)
    negSDATim = $time;

always @(posedge SDA)
    posSDATim = $time;

specify
   $width(posedge SCL, tHIGH);
   $width(negedge SCL, tLOW);

   $setup(SDA, posedge SCL, tSUDATA);

   $hold(SCL, posedge SDA &&& (SCL == 1), tSUSTO);
   $hold(SDA, posedge SCL, tHDDATA);
   $hold(SCL, negedge SDA &&& (SCL == 1), tHDDATA);
endspecify
*/
endmodule
