// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA (Decode Gate Array)                                         **
** DECODE/DGA/PFIFD (FIFO DATA)                                          **
**                                                                       ** 
** Page 11 DECODE - DECODE_DGA_PFIFD Sheet 1 of 1                        **
** SHEET 1 of 1                                                          **
**                                                                       ** 
** Last reviewed: 11-MAY-2024                                            **
** Ronny Hansen                                                          **               
***************************************************************************/


/******************************************************************************
 ** The 13 byte FIFO implemented via 13x8 1 bit D-LATCH F601
 ** Generates the WEU and WEL signals, which is clock signals for the FIFO in DECODE-DGA-PFIFD.
 **
 ** Input signals:
 ** CLEAR    - Active HIGH signal to reset the clock signals.
 ** 
 ** LDPANC_n - Active LOW signal to load data into the FIFO queue for the Panel Controller. 
 **            Comes from the microcode command "COMM,LDPANC"
 **
 ** RMM_n    - Active LOW signal to read data from the FIFO queue for the Panel Controller. 
 **            Comes from the 68705 CPU.
 **
 ** Output signals:
 ** EMP_n   - Active LOW signal to indicate that the FIFO queue is empty
 ** FUL_n   - Active LOW signal to indicate that the FIFO queue is full
 ** WEL[12:0] - Active HIGH signal to clock data into the FIFO queue
 **
 ** WEU[12:0] - Active HIGH signal to clock data into the FIFO queue 
 ** (identical to WEL, I assume added to make the signalstrength better)   
 *****************************************************************************/

 /* NOT IN USE ANYMORE - REPLACED BY FIFO_8BIT.v

module DECODE_DGA_PFIFD( 
   input [7:0]  IDBI_7_0,
   input [12:0] WEL_12_0,
   input [12:0] WEU_12_0,

   output [7:0] AD_7_0   
);


   
   // The wires are defined here                                                 **
   
   wire [12:0] s_weu_12_0;
   wire [12:0] s_wel_12_0;
   wire [7:0]  s_ad_7_0;
   wire [7:0]  s_idbi_7_0;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet117;
   wire        s_logisimNet118;
   wire        s_logisimNet119;
   wire        s_logisimNet12;
   wire        s_logisimNet120;
   wire        s_logisimNet121;
   wire        s_logisimNet122;
   wire        s_logisimNet123;
   wire        s_logisimNet124;
   wire        s_logisimNet125;


   wire        s_logisimNet128;
   wire        s_logisimNet129;
   wire        s_logisimNet13;
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   
   
   
   
   
   wire        s_logisimNet3;
   
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   
   
   
   wire        s_logisimNet6;
   
   

   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet73;
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet77;
   wire        s_logisimNet78;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet9;
   
   
   
   
   // The module functionality is described here                                 **
   

   
   // Here all input connections are defined                                     **
   
   assign s_weu_12_0[12:0]    = WEU_12_0;
   assign s_wel_12_0[12:0]    = WEL_12_0;
   assign s_idbi_7_0[7:0]     = IDBI_7_0;
   
   // Here all output connections are defined                                    **   
   assign AD_7_0 = s_ad_7_0[7:0];
   
   // Here all normal components are defined                                     **
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_wel_12_0[4]),
                .d(s_logisimNet78),
                .preset(1'b0),
                .q(s_logisimNet73),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_wel_12_0[4]),
                .d(s_logisimNet16),
                .preset(1'b0),
                .q(s_logisimNet10),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_weu_12_0[4]),
                .d(s_logisimNet120),
                .preset(1'b0),
                .q(s_logisimNet116),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_weu_12_0[4]),
                .d(s_logisimNet45),
                .preset(1'b0),
                .q(s_logisimNet41),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_weu_12_0[4]),
                .d(s_logisimNet121),
                .preset(1'b0),
                .q(s_logisimNet117),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_weu_12_0[4]),
                .d(s_logisimNet46),
                .preset(1'b0),
                .q(s_logisimNet42),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_wel_12_0[4]),
                .d(s_logisimNet79),
                .preset(1'b0),
                .q(s_logisimNet74),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_8 (.clock(s_wel_12_0[4]),
                .d(s_logisimNet17),
                .preset(1'b0),
                .q(s_logisimNet11),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_9 (.clock(s_wel_12_0[5]),
                .d(s_logisimNet73),
                .preset(1'b0),
                .q(s_logisimNet75),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_10 (.clock(s_wel_12_0[5]),
                 .d(s_logisimNet10),
                 .preset(1'b0),
                 .q(s_logisimNet12),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_11 (.clock(s_weu_12_0[5]),
                 .d(s_logisimNet116),
                 .preset(1'b0),
                 .q(s_logisimNet118),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_12 (.clock(s_weu_12_0[5]),
                 .d(s_logisimNet41),
                 .preset(1'b0),
                 .q(s_logisimNet43),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_13 (.clock(s_weu_12_0[5]),
                 .d(s_logisimNet117),
                 .preset(1'b0),
                 .q(s_logisimNet119),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_14 (.clock(s_weu_12_0[5]),
                 .d(s_logisimNet42),
                 .preset(1'b0),
                 .q(s_logisimNet44),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_15 (.clock(s_wel_12_0[5]),
                 .d(s_logisimNet74),
                 .preset(1'b0),
                 .q(s_logisimNet76),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_16 (.clock(s_wel_12_0[5]),
                 .d(s_logisimNet11),
                 .preset(1'b0),
                 .q(s_logisimNet13),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_17 (.clock(s_wel_12_0[6]),
                 .d(s_logisimNet75),
                 .preset(1'b0),
                 .q(s_logisimNet71),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_18 (.clock(s_wel_12_0[6]),
                 .d(s_logisimNet12),
                 .preset(1'b0),
                 .q(s_logisimNet8),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_19 (.clock(s_weu_12_0[6]),
                 .d(s_logisimNet118),
                 .preset(1'b0),
                 .q(s_logisimNet112),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_20 (.clock(s_weu_12_0[6]),
                 .d(s_logisimNet43),
                 .preset(1'b0),
                 .q(s_logisimNet38),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_21 (.clock(s_weu_12_0[6]),
                 .d(s_logisimNet119),
                 .preset(1'b0),
                 .q(s_logisimNet113),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_22 (.clock(s_weu_12_0[6]),
                 .d(s_logisimNet44),
                 .preset(1'b0),
                 .q(s_logisimNet39),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_23 (.clock(s_wel_12_0[6]),
                 .d(s_logisimNet76),
                 .preset(1'b0),
                 .q(s_logisimNet72),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_24 (.clock(s_wel_12_0[6]),
                 .d(s_logisimNet13),
                 .preset(1'b0),
                 .q(s_logisimNet9),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_25 (.clock(s_wel_12_0[7]),
                 .d(s_logisimNet71),
                 .preset(1'b0),
                 .q(s_logisimNet67),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_26 (.clock(s_wel_12_0[7]),
                 .d(s_logisimNet8),
                 .preset(1'b0),
                 .q(s_logisimNet4),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_27 (.clock(s_weu_12_0[7]),
                 .d(s_logisimNet112),
                 .preset(1'b0),
                 .q(s_logisimNet114),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_28 (.clock(s_weu_12_0[7]),
                 .d(s_logisimNet38),
                 .preset(1'b0),
                 .q(s_logisimNet40),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_29 (.clock(s_weu_12_0[7]),
                 .d(s_logisimNet113),
                 .preset(1'b0),
                 .q(s_logisimNet115),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_30 (.clock(s_weu_12_0[7]),
                 .d(s_logisimNet39),
                 .preset(1'b0),
                 .q(s_logisimNet35),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_31 (.clock(s_wel_12_0[7]),
                 .d(s_logisimNet72),
                 .preset(1'b0),
                 .q(s_logisimNet68),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_32 (.clock(s_wel_12_0[7]),
                 .d(s_logisimNet9),
                 .preset(1'b0),
                 .q(s_logisimNet5),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_33 (.clock(s_wel_12_0[8]),
                 .d(s_logisimNet67),
                 .preset(1'b0),
                 .q(s_logisimNet69),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_34 (.clock(s_wel_12_0[8]),
                 .d(s_logisimNet4),
                 .preset(1'b0),
                 .q(s_logisimNet6),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_35 (.clock(s_weu_12_0[8]),
                 .d(s_logisimNet114),
                 .preset(1'b0),
                 .q(s_logisimNet110),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_36 (.clock(s_weu_12_0[8]),
                 .d(s_logisimNet40),
                 .preset(1'b0),
                 .q(s_logisimNet36),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_37 (.clock(s_weu_12_0[8]),
                 .d(s_logisimNet115),
                 .preset(1'b0),
                 .q(s_logisimNet111),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_38 (.clock(s_weu_12_0[8]),
                 .d(s_logisimNet35),
                 .preset(1'b0),
                 .q(s_logisimNet37),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_39 (.clock(s_wel_12_0[8]),
                 .d(s_logisimNet68),
                 .preset(1'b0),
                 .q(s_logisimNet70),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_40 (.clock(s_wel_12_0[8]),
                 .d(s_logisimNet5),
                 .preset(1'b0),
                 .q(s_logisimNet7),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_41 (.clock(s_wel_12_0[9]),
                 .d(s_logisimNet69),
                 .preset(1'b0),
                 .q(s_logisimNet64),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_42 (.clock(s_wel_12_0[9]),
                 .d(s_logisimNet6),
                 .preset(1'b0),
                 .q(s_logisimNet1),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_43 (.clock(s_weu_12_0[9]),
                 .d(s_logisimNet110),
                 .preset(1'b0),
                 .q(s_logisimNet106),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_44 (.clock(s_weu_12_0[9]),
                 .d(s_logisimNet36),
                 .preset(1'b0),
                 .q(s_logisimNet31),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_45 (.clock(s_weu_12_0[9]),
                 .d(s_logisimNet111),
                 .preset(1'b0),
                 .q(s_logisimNet107),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_46 (.clock(s_weu_12_0[9]),
                 .d(s_logisimNet37),
                 .preset(1'b0),
                 .q(s_logisimNet32),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_47 (.clock(s_wel_12_0[9]),
                 .d(s_logisimNet70),
                 .preset(1'b0),
                 .q(s_logisimNet63),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_48 (.clock(s_wel_12_0[9]),
                 .d(s_logisimNet7),
                 .preset(1'b0),
                 .q(s_logisimNet0),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_49 (.clock(s_wel_12_0[10]),
                 .d(s_logisimNet64),
                 .preset(1'b0),
                 .q(s_logisimNet65),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_50 (.clock(s_wel_12_0[10]),
                 .d(s_logisimNet1),
                 .preset(1'b0),
                 .q(s_logisimNet2),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_51 (.clock(s_weu_12_0[10]),
                 .d(s_logisimNet106),
                 .preset(1'b0),
                 .q(s_logisimNet108),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_52 (.clock(s_weu_12_0[10]),
                 .d(s_logisimNet31),
                 .preset(1'b0),
                 .q(s_logisimNet33),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_53 (.clock(s_weu_12_0[10]),
                 .d(s_logisimNet107),
                 .preset(1'b0),
                 .q(s_logisimNet109),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_54 (.clock(s_weu_12_0[10]),
                 .d(s_logisimNet32),
                 .preset(1'b0),
                 .q(s_logisimNet34),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_55 (.clock(s_wel_12_0[10]),
                 .d(s_logisimNet63),
                 .preset(1'b0),
                 .q(s_logisimNet66),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_56 (.clock(s_wel_12_0[10]),
                 .d(s_logisimNet0),
                 .preset(1'b0),
                 .q(s_logisimNet3),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_57 (.clock(s_wel_12_0[11]),
                 .d(s_logisimNet65),
                 .preset(1'b0),
                 .q(s_logisimNet86),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_58 (.clock(s_wel_12_0[11]),
                 .d(s_logisimNet2),
                 .preset(1'b0),
                 .q(s_logisimNet22),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_59 (.clock(s_weu_12_0[11]),
                 .d(s_logisimNet108),
                 .preset(1'b0),
                 .q(s_logisimNet134),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_60 (.clock(s_weu_12_0[11]),
                 .d(s_logisimNet33),
                 .preset(1'b0),
                 .q(s_logisimNet55),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_61 (.clock(s_weu_12_0[11]),
                 .d(s_logisimNet109),
                 .preset(1'b0),
                 .q(s_logisimNet135),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_62 (.clock(s_weu_12_0[11]),
                 .d(s_logisimNet34),
                 .preset(1'b0),
                 .q(s_logisimNet56),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_63 (.clock(s_wel_12_0[11]),
                 .d(s_logisimNet66),
                 .preset(1'b0),
                 .q(s_logisimNet87),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_64 (.clock(s_wel_12_0[11]),
                 .d(s_logisimNet3),
                 .preset(1'b0),
                 .q(s_logisimNet23),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_65 (.clock(s_wel_12_0[12]),
                 .d(s_logisimNet86),
                 .preset(1'b0),
                 .q(s_ad_7_0[1]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_66 (.clock(s_wel_12_0[12]),
                 .d(s_logisimNet22),
                 .preset(1'b0),
                 .q(s_ad_7_0[0]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_67 (.clock(s_weu_12_0[12]),
                 .d(s_logisimNet134),
                 .preset(1'b0),
                 .q(s_ad_7_0[7]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_68 (.clock(s_weu_12_0[12]),
                 .d(s_logisimNet55),
                 .preset(1'b0),
                 .q(s_ad_7_0[6]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_69 (.clock(s_weu_12_0[12]),
                 .d(s_logisimNet135),
                 .preset(1'b0),
                 .q(s_ad_7_0[5]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_70 (.clock(s_weu_12_0[12]),
                 .d(s_logisimNet56),
                 .preset(1'b0),
                 .q(s_ad_7_0[4]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_71 (.clock(s_wel_12_0[12]),
                 .d(s_logisimNet87),
                 .preset(1'b0),
                 .q(s_ad_7_0[3]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_72 (.clock(s_wel_12_0[12]),
                 .d(s_logisimNet23),
                 .preset(1'b0),
                 .q(s_ad_7_0[2]),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_73 (.clock(s_wel_12_0[0]),
                 .d(s_idbi_7_0[1]),
                 .preset(1'b0),
                 .q(s_logisimNet83),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_74 (.clock(s_wel_12_0[0]),
                 .d(s_idbi_7_0[0]),
                 .preset(1'b0),
                 .q(s_logisimNet20),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_75 (.clock(s_weu_12_0[0]),
                 .d(s_idbi_7_0[7]),
                 .preset(1'b0),
                 .q(s_logisimNet128),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_76 (.clock(s_weu_12_0[0]),
                 .d(s_idbi_7_0[6]),
                 .preset(1'b0),
                 .q(s_logisimNet51),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_77 (.clock(s_weu_12_0[0]),
                 .d(s_idbi_7_0[5]),
                 .preset(1'b0),
                 .q(s_logisimNet129),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_78 (.clock(s_weu_12_0[0]),
                 .d(s_idbi_7_0[4]),
                 .preset(1'b0),
                 .q(s_logisimNet52),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_79 (.clock(s_wel_12_0[0]),
                 .d(s_idbi_7_0[3]),
                 .preset(1'b0),
                 .q(s_logisimNet84),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_80 (.clock(s_wel_12_0[0]),
                 .d(s_idbi_7_0[2]),
                 .preset(1'b0),
                 .q(s_logisimNet21),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_81 (.clock(s_wel_12_0[1]),
                 .d(s_logisimNet83),
                 .preset(1'b0),
                 .q(s_logisimNet80),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_82 (.clock(s_wel_12_0[1]),
                 .d(s_logisimNet20),
                 .preset(1'b0),
                 .q(s_logisimNet18),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_83 (.clock(s_weu_12_0[1]),
                 .d(s_logisimNet128),
                 .preset(1'b0),
                 .q(s_logisimNet122),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_84 (.clock(s_weu_12_0[1]),
                 .d(s_logisimNet51),
                 .preset(1'b0),
                 .q(s_logisimNet47),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_85 (.clock(s_weu_12_0[1]),
                 .d(s_logisimNet129),
                 .preset(1'b0),
                 .q(s_logisimNet123),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_86 (.clock(s_weu_12_0[1]),
                 .d(s_logisimNet52),
                 .preset(1'b0),
                 .q(s_logisimNet48),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_87 (.clock(s_wel_12_0[1]),
                 .d(s_logisimNet84),
                 .preset(1'b0),
                 .q(s_logisimNet81),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_88 (.clock(s_wel_12_0[1]),
                 .d(s_logisimNet21),
                 .preset(1'b0),
                 .q(s_logisimNet19),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_89 (.clock(s_wel_12_0[2]),
                 .d(s_logisimNet80),
                 .preset(1'b0),
                 .q(s_logisimNet77),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_90 (.clock(s_wel_12_0[2]),
                 .d(s_logisimNet18),
                 .preset(1'b0),
                 .q(s_logisimNet14),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_91 (.clock(s_weu_12_0[2]),
                 .d(s_logisimNet122),
                 .preset(1'b0),
                 .q(s_logisimNet124),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_92 (.clock(s_weu_12_0[2]),
                 .d(s_logisimNet47),
                 .preset(1'b0),
                 .q(s_logisimNet49),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_93 (.clock(s_weu_12_0[2]),
                 .d(s_logisimNet123),
                 .preset(1'b0),
                 .q(s_logisimNet125),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_94 (.clock(s_weu_12_0[2]),
                 .d(s_logisimNet48),
                 .preset(1'b0),
                 .q(s_logisimNet50),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_95 (.clock(s_wel_12_0[2]),
                 .d(s_logisimNet81),
                 .preset(1'b0),
                 .q(s_logisimNet82),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_96 (.clock(s_wel_12_0[2]),
                 .d(s_logisimNet19),
                 .preset(1'b0),
                 .q(s_logisimNet15),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_97 (.clock(s_wel_12_0[3]),
                 .d(s_logisimNet77),
                 .preset(1'b0),
                 .q(s_logisimNet78),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_98 (.clock(s_wel_12_0[3]),
                 .d(s_logisimNet14),
                 .preset(1'b0),
                 .q(s_logisimNet16),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_99 (.clock(s_weu_12_0[3]),
                 .d(s_logisimNet124),
                 .preset(1'b0),
                 .q(s_logisimNet120),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_100 (.clock(s_weu_12_0[3]),
                  .d(s_logisimNet49),
                  .preset(1'b0),
                  .q(s_logisimNet45),
                  .qBar(),
                  .reset(1'b0),
                  .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_101 (.clock(s_weu_12_0[3]),
                  .d(s_logisimNet125),
                  .preset(1'b0),
                  .q(s_logisimNet121),
                  .qBar(),
                  .reset(1'b0),
                  .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_102 (.clock(s_weu_12_0[3]),
                  .d(s_logisimNet50),
                  .preset(1'b0),
                  .q(s_logisimNet46),
                  .qBar(),
                  .reset(1'b0),
                  .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_103 (.clock(s_wel_12_0[3]),
                  .d(s_logisimNet82),
                  .preset(1'b0),
                  .q(s_logisimNet79),
                  .qBar(),
                  .reset(1'b0),
                  .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_104 (.clock(s_wel_12_0[3]),
                  .d(s_logisimNet15),
                  .preset(1'b0),
                  .q(s_logisimNet17),
                  .qBar(),
                  .reset(1'b0),
                  .tick(1'b1));


endmodule
*/