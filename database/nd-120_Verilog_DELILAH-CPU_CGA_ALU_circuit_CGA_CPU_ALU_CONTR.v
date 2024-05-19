// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_CPU_ALU_CONTR                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_CPU_ALU_CONTR( ALUCLK,
                          ALUD2N,
                          ALUI4,
                          ALUI7,
                          ALUI8N,
                          BDEST,
                          CD_10_9,
                          CI,
                          CRY,
                          CSALUI_8_0,
                          CSALUM_1_0,
                          CSCINSEL_1_0,
                          CSMIS_1_0,
                          CSSST_1_0,
                          CSTS_1_0,
                          DGPR0N,
                          F0,
                          F15,
                          FSEL,
                          GPR0,
                          GPRC_2_0,
                          GPRLI,
                          LCZN,
                          LDGPRN,
                          LDIRV,
                          LOG,
                          MI,
                          Q0,
                          Q15,
                          QLI,
                          QSEL_1_0,
                          RA,
                          RD,
                          RLI,
                          RRI,
                          RSN,
                          SA,
                          SB,
                          STS6,
                          STS7,
                          UPN,
                          XFETCHN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       ALUCLK;
   input [1:0] CD_10_9;
   input       CRY;
   input [8:0] CSALUI_8_0;
   input [1:0] CSALUM_1_0;
   input [1:0] CSCINSEL_1_0;
   input [1:0] CSMIS_1_0;
   input [1:0] CSSST_1_0;
   input       DGPR0N;
   input       F0;
   input       F15;
   input       GPR0;
   input       LCZN;
   input       LDGPRN;
   input       LDIRV;
   input       Q0;
   input       Q15;
   input       STS6;
   input       STS7;
   input       UPN;
   input       XFETCHN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       ALUD2N;
   output       ALUI4;
   output       ALUI7;
   output       ALUI8N;
   output       BDEST;
   output       CI;
   output [1:0] CSTS_1_0;
   output       FSEL;
   output [2:0] GPRC_2_0;
   output       GPRLI;
   output       LOG;
   output       MI;
   output       QLI;
   output [1:0] QSEL_1_0;
   output       RA;
   output       RD;
   output       RLI;
   output       RRI;
   output       RSN;
   output       SA;
   output       SB;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   
   wire [1:0] s_logisimBus130;
   wire [1:0] s_logisimBus136;
   wire [1:0] s_logisimBus152;
   wire [1:0] s_logisimBus22;
   wire [1:0] s_logisimBus46;
   wire [1:0] s_logisimBus5;
   wire [1:0] s_logisimBus87;
   wire [8:0] s_logisimBus91;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet100;
   wire       s_logisimNet101;
   wire       s_logisimNet102;
   wire       s_logisimNet103;
   wire       s_logisimNet104;
   wire       s_logisimNet105;
   wire       s_logisimNet106;
   wire       s_logisimNet107;
   wire       s_logisimNet108;
   wire       s_logisimNet109;
   wire       s_logisimNet11;
   wire       s_logisimNet110;
   wire       s_logisimNet111;
   wire       s_logisimNet112;
   wire       s_logisimNet113;
   wire       s_logisimNet114;
   wire       s_logisimNet115;
   wire       s_logisimNet116;
   wire       s_logisimNet117;
   wire       s_logisimNet118;
   wire       s_logisimNet12;
   wire       s_logisimNet120;
   wire       s_logisimNet121;
   wire       s_logisimNet122;
   wire       s_logisimNet123;
   wire       s_logisimNet124;
   wire       s_logisimNet125;
   wire       s_logisimNet126;
   wire       s_logisimNet127;
   wire       s_logisimNet128;
   wire       s_logisimNet13;
   wire       s_logisimNet131;
   wire       s_logisimNet132;
   wire       s_logisimNet133;
   wire       s_logisimNet134;
   wire       s_logisimNet135;
   wire       s_logisimNet137;
   wire       s_logisimNet138;
   wire       s_logisimNet139;
   wire       s_logisimNet14;
   wire       s_logisimNet140;
   wire       s_logisimNet141;
   wire       s_logisimNet142;
   wire       s_logisimNet143;
   wire       s_logisimNet144;
   wire       s_logisimNet145;
   wire       s_logisimNet146;
   wire       s_logisimNet147;
   wire       s_logisimNet148;
   wire       s_logisimNet149;
   wire       s_logisimNet15;
   wire       s_logisimNet150;
   wire       s_logisimNet151;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet54;
   wire       s_logisimNet55;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   wire       s_logisimNet58;
   wire       s_logisimNet59;
   wire       s_logisimNet6;
   wire       s_logisimNet60;
   wire       s_logisimNet61;
   wire       s_logisimNet62;
   wire       s_logisimNet63;
   wire       s_logisimNet64;
   wire       s_logisimNet65;
   wire       s_logisimNet66;
   wire       s_logisimNet67;
   wire       s_logisimNet68;
   wire       s_logisimNet69;
   wire       s_logisimNet7;
   wire       s_logisimNet70;
   wire       s_logisimNet71;
   wire       s_logisimNet72;
   wire       s_logisimNet73;
   wire       s_logisimNet74;
   wire       s_logisimNet75;
   wire       s_logisimNet76;
   wire       s_logisimNet77;
   wire       s_logisimNet78;
   wire       s_logisimNet79;
   wire       s_logisimNet8;
   wire       s_logisimNet80;
   wire       s_logisimNet81;
   wire       s_logisimNet82;
   wire       s_logisimNet83;
   wire       s_logisimNet84;
   wire       s_logisimNet86;
   wire       s_logisimNet88;
   wire       s_logisimNet89;
   wire       s_logisimNet9;
   wire       s_logisimNet90;
   wire       s_logisimNet92;
   wire       s_logisimNet93;
   wire       s_logisimNet94;
   wire       s_logisimNet95;
   wire       s_logisimNet96;
   wire       s_logisimNet97;
   wire       s_logisimNet98;
   wire       s_logisimNet99;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus130[1:0] = CSSST_1_0;
   assign s_logisimBus136[1:0] = CSALUM_1_0;
   assign s_logisimBus22[1:0]  = CD_10_9;
   assign s_logisimBus46[1:0]  = CSMIS_1_0;
   assign s_logisimBus5[1:0]   = CSCINSEL_1_0;
   assign s_logisimBus91[8:0]  = CSALUI_8_0;
   assign s_logisimNet104      = LCZN;
   assign s_logisimNet111      = STS6;
   assign s_logisimNet147      = CRY;
   assign s_logisimNet15       = LDGPRN;
   assign s_logisimNet35       = STS7;
   assign s_logisimNet36       = F0;
   assign s_logisimNet44       = Q0;
   assign s_logisimNet45       = F15;
   assign s_logisimNet47       = Q15;
   assign s_logisimNet52       = XFETCHN;
   assign s_logisimNet60       = DGPR0N;
   assign s_logisimNet68       = ALUCLK;
   assign s_logisimNet9        = UPN;
   assign s_logisimNet96       = LDIRV;
   assign s_logisimNet97       = GPR0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ALUD2N   = s_logisimNet107;
   assign ALUI4    = s_logisimNet40;
   assign ALUI7    = s_logisimNet141;
   assign ALUI8N   = s_logisimNet140;
   assign BDEST    = s_logisimNet105;
   assign CI       = s_logisimNet148;
   assign CSTS_1_0 = s_logisimBus152[1:0];
   assign FSEL     = s_logisimNet118;
   assign GPRC_2_0 = {~s_logisimNet144, ~s_logisimNet33, ~s_logisimNet65};
   assign GPRLI    = s_logisimNet2;
   assign LOG      = s_logisimNet79;
   assign MI       = s_logisimNet86;
   assign QLI      = s_logisimNet78;
   assign QSEL_1_0 = s_logisimBus87[1:0];
   assign RA       = s_logisimNet150;
   assign RD       = s_logisimNet50;
   assign RLI      = s_logisimNet75;
   assign RRI      = s_logisimNet70;
   assign RSN      = s_logisimNet132;
   assign SA       = s_logisimNet74;
   assign SB       = s_logisimNet23;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet112  =  1'b0;


   // NOT Gate
   assign s_logisimNet7 = ~s_logisimBus91[3];

   // NOT Gate
   assign s_logisimNet77 = ~s_logisimBus91[2];

   // NOT Gate
   assign s_logisimNet146 = ~s_logisimBus91[0];

   // NOT Gate
   assign s_logisimNet63 = ~s_logisimBus91[4];

   // NOT Gate
   assign s_logisimBus87[1] = ~s_logisimNet69;

   // NOT Gate
   assign s_logisimBus87[0] = ~s_logisimNet37;

   // NOT Gate
   assign s_logisimNet132 = ~s_logisimNet142;

   // NOT Gate
   assign s_logisimNet118 = ~s_logisimNet131;

   // NOT Gate
   assign s_logisimNet79 = ~s_logisimNet83;

   // NOT Gate
   assign s_logisimNet40 = ~s_logisimNet61;

   // NOT Gate
   assign s_logisimNet23 = ~s_logisimNet49;

   // NOT Gate
   assign s_logisimNet74 = ~s_logisimNet92;

   // NOT Gate
   assign s_logisimNet150 = ~s_logisimNet19;

   // NOT Gate
   assign s_logisimNet50 = ~s_logisimNet72;


   // NOT Gate
   assign s_logisimNet51 = ~s_logisimBus136[0];

   // Ground
   assign  s_logisimNet82  =  1'b0;


   // NOT Gate
   assign s_logisimNet141 = ~s_logisimNet135;

   // NOT Gate
   assign s_logisimNet140 = ~s_logisimNet12;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet18;

   // NOT Gate
   assign s_logisimNet134 = ~s_logisimNet141;

   // NOT Gate
   assign s_logisimNet105 = ~s_logisimNet93;

   // Power
   assign  s_logisimNet123  =  1'b1;


   
   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus136[1]),
               .input2(s_logisimBus136[0]),
               .result(s_logisimNet31));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus136[1]),
               .input2(s_logisimNet51),
               .result(s_logisimNet76));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus136[1]),
               .input2(s_logisimNet51),
               .result(s_logisimNet57));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus91[2]),
               .input2(s_logisimBus91[0]),
               .result(s_logisimNet20));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus91[2]),
               .input2(s_logisimNet89),
               .result(s_logisimNet10));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet77),
               .input2(s_logisimBus91[0]),
               .result(s_logisimNet127));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet89),
               .input2(s_logisimNet77),
               .result(s_logisimNet8));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet89),
               .input2(s_logisimNet146),
               .result(s_logisimNet1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet141),
               .input2(s_logisimNet45),
               .result(s_logisimNet120));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_10 (.input1(s_logisimNet134),
                .input2(s_logisimNet98),
                .input3(s_logisimNet44),
                .result(s_logisimNet90));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_11 (.input1(s_logisimNet134),
                .input2(s_logisimNet151),
                .input3(s_logisimNet36),
                .result(s_logisimNet54));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_12 (.input1(s_logisimNet17),
                .input2(s_logisimBus91[5]),
                .input3(s_logisimNet112),
                .result(s_logisimNet95));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet20),
                .input2(s_logisimNet10),
                .result(s_logisimNet113));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet10),
                .input2(s_logisimNet127),
                .result(s_logisimNet55));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet1),
                .input2(s_logisimBus91[2]),
                .result(s_logisimNet26));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(1'b1),
                .input2(s_logisimNet36),
                .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet44),
                .input2(s_logisimNet98),
                .result(s_logisimNet21));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet98),
                .input2(s_logisimNet47),
                .result(s_logisimNet58));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_19 (.input1(s_logisimNet120),
                .input2(s_logisimNet90),
                .input3(s_logisimNet54),
                .result(s_logisimNet86));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_20 (.input1(s_logisimNet110),
                .input2(s_logisimNet114),
                .input3(s_logisimNet151),
                .result(s_logisimNet137));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_21 (.input1(s_logisimNet108),
                .input2(s_logisimNet28),
                .result(s_logisimNet25));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet114),
                .input2(s_logisimNet28),
                .result(s_logisimNet56));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_23 (.input1(s_logisimNet0),
                .input2(s_logisimNet21),
                .result(s_logisimNet101));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_24 (.input1(s_logisimNet110),
                .input2(s_logisimNet108),
                .result(s_logisimNet121));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_25 (.input1(s_logisimNet98),
                .input2(s_logisimNet141),
                .input3(s_logisimNet140),
                .result(s_logisimNet107));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_26 (.input1(s_logisimNet98),
                .input2(s_logisimNet12),
                .result(s_logisimNet69));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_logisimNet98),
                .input2(s_logisimNet134),
                .result(s_logisimNet37));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet35),
                .input2(s_logisimNet147),
                .result(s_logisimNet41));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_29 (.input1(s_logisimNet35),
                .input2(s_logisimNet97),
                .result(s_logisimNet100));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_30 (.input1(s_logisimNet97),
                .input2(s_logisimNet147),
                .result(s_logisimNet48));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet147),
                .input2(s_logisimNet137),
                .result(s_logisimNet66));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_32 (.input1(s_logisimNet101),
                .input2(s_logisimNet25),
                .result(s_logisimNet24));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_33 (.input1(s_logisimNet45),
                .input2(s_logisimNet56),
                .result(s_logisimNet102));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_34 (.input1(s_logisimNet45),
                .input2(s_logisimNet25),
                .result(s_logisimNet149));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_35 (.input1(s_logisimNet35),
                .input2(s_logisimNet121),
                .result(s_logisimNet27));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_36 (.input1(s_logisimNet27),
                .input2(s_logisimNet149),
                .result(s_logisimNet78));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_37 (.input1(s_logisimNet27),
                .input2(s_logisimNet66),
                .input3(s_logisimNet24),
                .input4(s_logisimNet102),
                .result(s_logisimNet70));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_38 (.input1(s_logisimNet41),
                .input2(s_logisimNet100),
                .input3(s_logisimNet48),
                .result(s_logisimNet2));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_39 (.input1(s_logisimNet78),
                .input2(s_logisimNet151),
                .result(s_logisimNet125));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_40 (.input1(s_logisimNet125),
                .input2(s_logisimNet58),
                .result(s_logisimNet75));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_41 (.input1(s_logisimNet52),
                .input2(s_logisimNet134),
                .result(s_logisimNet84));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_42 (.input1(s_logisimNet84),
                .input2(s_logisimNet15),
                .result(s_logisimNet65));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_43 (.input1(s_logisimNet15),
                .input2(s_logisimNet52),
                .result(s_logisimNet33));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_44 (.input1( ~s_logisimNet33),
                .input2(s_logisimNet140),
                .result(s_logisimNet144));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_45 (.clock(s_logisimNet68),
                 .d(s_logisimBus91[6]),
                 .preset(1'b0),
                 .q(s_logisimNet151),
                 .qBar(s_logisimNet98),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_46 (.clock(s_logisimNet96),
                 .d(s_logisimBus22[1]),
                 .preset(1'b0),
                 .q(s_logisimNet6),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_47 (.clock(s_logisimNet96),
                 .d(s_logisimBus22[0]),
                 .preset(1'b0),
                 .q(s_logisimNet38),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_48 (.input1(s_logisimNet39),
                .input2(s_logisimNet80),
                .result(s_logisimBus152[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_49 (.input1(s_logisimNet12),
                .input2(s_logisimNet31),
                .result(s_logisimNet80));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_50 (.input1(s_logisimNet81),
                .input2(s_logisimNet103),
                .result(s_logisimNet42));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_51 (.clock(s_logisimNet68),
                 .d(s_logisimNet42),
                 .preset(1'b0),
                 .q(s_logisimNet93),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_52 (.input1(s_logisimNet139),
                .input2(s_logisimBus91[5]),
                .result(s_logisimNet71));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_53 (.input1(s_logisimNet63),
                .input2(s_logisimNet139),
                .result(s_logisimNet88));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_54 (.input1(s_logisimNet88),
                .input2(s_logisimNet71),
                .result(s_logisimNet34));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_55 (.input1(s_logisimBus91[5]),
                .input2(s_logisimBus91[4]),
                .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_56 (.input1(s_logisimNet139),
                .input2(s_logisimBus91[4]),
                .result(s_logisimNet17));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX21LP   CSMIS1_MUX (.A(s_logisimBus46[1]),
                         .B(s_logisimNet6),
                         .S(s_logisimNet31),
                         .ZN(s_logisimNet94));

   MUX21LP   CSMIS0_MUX (.A(s_logisimBus46[0]),
                         .B(s_logisimNet38),
                         .S(s_logisimNet31),
                         .ZN(s_logisimNet67));

   MUX21LP   CSALUI7_MUX (.A(s_logisimBus91[7]),
                          .B(s_logisimNet9),
                          .S(s_logisimNet31),
                          .ZN(s_logisimNet81));

   MUX21LP   CSALUI8_MUX (.A(s_logisimBus91[8]),
                          .B(s_logisimNet104),
                          .S(s_logisimNet31),
                          .ZN(s_logisimNet103));

   MUX21LP   ALUI3_MUX (.A(s_logisimNet60),
                        .B(s_logisimNet7),
                        .S(s_logisimNet57),
                        .ZN(s_logisimNet139));

   MUX21LP   ALUI1N_MUX (.A(s_logisimBus91[1]),
                         .B(s_logisimNet60),
                         .S(s_logisimNet76),
                         .ZN(s_logisimNet89));

   R41P   REG_RFLA4 (.A(s_logisimNet34),
                     .B(s_logisimNet13),
                     .C(s_logisimNet95),
                     .CP(s_logisimNet68),
                     .D(s_logisimBus91[4]),
                     .QA(s_logisimNet142),
                     .QAN(),
                     .QB(),
                     .QBN(s_logisimNet131),
                     .QC(s_logisimNet83),
                     .QCN(),
                     .QD(),
                     .QDN(s_logisimNet61));

   R41P   REG_BAAD (.A(s_logisimNet113),
                    .B(s_logisimNet55),
                    .C(s_logisimNet8),
                    .CP(s_logisimNet68),
                    .D(s_logisimNet26),
                    .QA(),
                    .QAN(s_logisimNet49),
                    .QB(),
                    .QBN(s_logisimNet92),
                    .QC(s_logisimNet19),
                    .QCN(),
                    .QD(s_logisimNet72),
                    .QDN());

   R81   CONTR_REG (.A(s_logisimNet94),
                    .B(s_logisimNet67),
                    .C(s_logisimNet81),
                    .CP(s_logisimNet68),
                    .D(s_logisimNet103),
                    .E(s_logisimBus130[0]),
                    .F(s_logisimBus130[1]),
                    .G(s_logisimBus5[0]),
                    .H(s_logisimBus5[1]),
                    .QA(s_logisimNet110),
                    .QAN(s_logisimNet28),
                    .QB(s_logisimNet108),
                    .QBN(s_logisimNet114),
                    .QC(s_logisimNet135),
                    .QCN(),
                    .QD(s_logisimNet18),
                    .QDN(),
                    .QE(s_logisimBus152[0]),
                    .QEN(),
                    .QF(),
                    .QFN(s_logisimNet39),
                    .QG(s_logisimNet16),
                    .QGN(),
                    .QH(s_logisimNet11),
                    .QHN());

   MUX41P   CI_SEL_MUX (.A(s_logisimNet16),
                        .B(s_logisimNet11),
                        .D0(s_logisimNet82),
                        .D1(s_logisimNet123),
                        .D2(s_logisimNet111),
                        .D3(s_logisimNet97),
                        .Z(s_logisimNet148));

endmodule
