// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_AP09                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_AP09( ADDSEL,
                     ADD_15_0,
                     CDSEL,
                     CD_15_0,
                     ECCR,
                     ECCRHIN,
                     HOLD,
                     ICA_15_0,
                     LCA_15_0,
                     MCA_9_0,
                     MCLK,
                     NLCASEL,
                     NLCA_15_0,
                     PR_15_0,
                     PSEL );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ADDSEL;
   input [15:0] ADD_15_0;
   input        CDSEL;
   input [15:0] CD_15_0;
   input        ECCRHIN;
   input        HOLD;
   input        MCLK;
   input        NLCASEL;
   input [15:0] PR_15_0;
   input        PSEL;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ECCR;
   output [15:0] ICA_15_0;
   output [15:0] LCA_15_0;
   output [9:0]  MCA_9_0;
   output [15:0] NLCA_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus114;
   wire [15:0] s_logisimBus14;
   wire [9:0]  s_logisimBus17;
   wire [15:0] s_logisimBus29;
   wire [15:0] s_logisimBus38;
   wire [15:0] s_logisimBus46;
   wire [15:0] s_logisimBus55;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet100;
   wire        s_logisimNet101;
   wire        s_logisimNet102;
   wire        s_logisimNet103;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet109;
   wire        s_logisimNet11;
   wire        s_logisimNet110;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
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
   wire        s_logisimNet126;
   wire        s_logisimNet127;
   wire        s_logisimNet128;
   wire        s_logisimNet129;
   wire        s_logisimNet13;
   wire        s_logisimNet130;
   wire        s_logisimNet131;
   wire        s_logisimNet132;
   wire        s_logisimNet133;
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet136;
   wire        s_logisimNet137;
   wire        s_logisimNet138;
   wire        s_logisimNet139;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
   wire        s_logisimNet142;
   wire        s_logisimNet143;
   wire        s_logisimNet144;
   wire        s_logisimNet145;
   wire        s_logisimNet146;
   wire        s_logisimNet147;
   wire        s_logisimNet148;
   wire        s_logisimNet149;
   wire        s_logisimNet15;
   wire        s_logisimNet150;
   wire        s_logisimNet151;
   wire        s_logisimNet152;
   wire        s_logisimNet153;
   wire        s_logisimNet154;
   wire        s_logisimNet155;
   wire        s_logisimNet156;
   wire        s_logisimNet157;
   wire        s_logisimNet158;
   wire        s_logisimNet16;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
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
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet9;
   wire        s_logisimNet90;
   wire        s_logisimNet91;
   wire        s_logisimNet92;
   wire        s_logisimNet93;
   wire        s_logisimNet94;
   wire        s_logisimNet95;
   wire        s_logisimNet96;
   wire        s_logisimNet97;
   wire        s_logisimNet98;
   wire        s_logisimNet99;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus114[15:0] = ADD_15_0;
   assign s_logisimBus38[15:0]  = CD_15_0;
   assign s_logisimBus46[15:0]  = PR_15_0;
   assign s_logisimNet119       = MCLK;
   assign s_logisimNet135       = ECCRHIN;
   assign s_logisimNet15        = ADDSEL;
   assign s_logisimNet16        = CDSEL;
   assign s_logisimNet3         = PSEL;
   assign s_logisimNet4         = NLCASEL;
   assign s_logisimNet5         = HOLD;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECCR      = s_logisimNet25;
   assign ICA_15_0  = s_logisimBus29[15:0];
   assign LCA_15_0  = s_logisimBus14[15:0];
   assign MCA_9_0   = s_logisimBus17[9:0];
   assign NLCA_15_0 = s_logisimBus55[15:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[2]),
               .result(s_logisimNet7));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[3]),
               .result(s_logisimNet8));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[4]),
               .result(s_logisimNet89));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[5]),
               .result(s_logisimNet90));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[0]),
               .result(s_logisimNet91));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[1]),
               .result(s_logisimNet92));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[6]),
               .result(s_logisimNet94));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[7]),
               .result(s_logisimNet95));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet4),
               .input2(s_logisimBus55[8]),
               .result(s_logisimNet9));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[9]),
                .result(s_logisimNet10));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[10]),
                .result(s_logisimNet96));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[11]),
                .result(s_logisimNet86));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[12]),
                .result(s_logisimNet87));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[13]),
                .result(s_logisimNet88));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[14]),
                .result(s_logisimNet59));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet4),
                .input2(s_logisimBus55[15]),
                .result(s_logisimNet60));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_17 (.input1(s_logisimNet19),
                .input2(s_logisimNet155),
                .input3(s_logisimNet8),
                .result(s_logisimBus29[3]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_18 (.input1(s_logisimNet104),
                .input2(s_logisimNet72),
                .input3(s_logisimNet89),
                .result(s_logisimBus29[4]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_19 (.input1(s_logisimNet106),
                .input2(s_logisimNet75),
                .input3(s_logisimNet90),
                .result(s_logisimBus29[5]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_20 (.input1(s_logisimNet105),
                .input2(s_logisimNet73),
                .input3(s_logisimNet91),
                .result(s_logisimBus29[0]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_21 (.input1(s_logisimNet107),
                .input2(s_logisimNet74),
                .input3(s_logisimNet92),
                .result(s_logisimBus29[1]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_22 (.input1(s_logisimNet20),
                .input2(s_logisimNet156),
                .input3(s_logisimNet7),
                .result(s_logisimBus29[2]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_23 (.input1(s_logisimNet108),
                .input2(s_logisimNet76),
                .input3(s_logisimNet94),
                .result(s_logisimBus29[6]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_24 (.input1(s_logisimNet109),
                .input2(s_logisimNet77),
                .input3(s_logisimNet95),
                .result(s_logisimBus29[7]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_25 (.input1(s_logisimNet23),
                .input2(s_logisimNet157),
                .input3(s_logisimNet9),
                .result(s_logisimBus29[8]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_26 (.input1(s_logisimNet24),
                .input2(s_logisimNet158),
                .input3(s_logisimNet10),
                .result(s_logisimBus29[9]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_27 (.input1(s_logisimNet110),
                .input2(s_logisimNet78),
                .input3(s_logisimNet96),
                .result(s_logisimBus29[10]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_28 (.input1(s_logisimNet101),
                .input2(s_logisimNet79),
                .input3(s_logisimNet86),
                .result(s_logisimBus29[11]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_29 (.input1(s_logisimNet102),
                .input2(s_logisimNet80),
                .input3(s_logisimNet87),
                .result(s_logisimBus29[12]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_30 (.input1(s_logisimNet103),
                .input2(s_logisimNet81),
                .input3(s_logisimNet88),
                .result(s_logisimBus29[13]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_31 (.input1(s_logisimNet146),
                .input2(s_logisimNet142),
                .input3(s_logisimNet59),
                .result(s_logisimBus29[14]));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_32 (.input1(s_logisimNet147),
                .input2(s_logisimNet143),
                .input3(s_logisimNet60),
                .result(s_logisimBus29[15]));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   A02   ICA3A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[3]),
                .D(s_logisimBus14[3]),
                .Z(s_logisimNet19));

   A02   ICA3B (.A(s_logisimNet15),
                .B(s_logisimBus114[3]),
                .C(s_logisimBus38[3]),
                .D(s_logisimNet16),
                .Z(s_logisimNet155));

   A02   ICA4A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[4]),
                .D(s_logisimNet16),
                .Z(s_logisimNet104));

   A02   ICA4B (.A(s_logisimNet15),
                .B(s_logisimBus114[4]),
                .C(s_logisimBus38[4]),
                .D(s_logisimBus14[4]),
                .Z(s_logisimNet72));

   A02   ICA0A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[0]),
                .D(s_logisimBus14[0]),
                .Z(s_logisimNet105));

   A02   ICA5A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[5]),
                .D(s_logisimBus14[5]),
                .Z(s_logisimNet106));

   A02   ICA5B (.A(s_logisimNet15),
                .B(s_logisimBus114[5]),
                .C(s_logisimBus38[5]),
                .D(s_logisimNet16),
                .Z(s_logisimNet75));

   A02   ICA0B (.A(s_logisimNet15),
                .B(s_logisimBus114[0]),
                .C(s_logisimNet16),
                .D(s_logisimBus38[0]),
                .Z(s_logisimNet73));

   A02   ICA1A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[1]),
                .D(s_logisimBus14[1]),
                .Z(s_logisimNet107));

   A02   ICA1B (.A(s_logisimNet15),
                .B(s_logisimBus114[1]),
                .C(s_logisimBus38[1]),
                .D(s_logisimNet16),
                .Z(s_logisimNet74));

   A02   ICA2A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[2]),
                .D(s_logisimBus14[2]),
                .Z(s_logisimNet20));

   A02   ICA2B (.A(s_logisimNet15),
                .B(s_logisimBus114[2]),
                .C(s_logisimBus38[2]),
                .D(s_logisimNet16),
                .Z(s_logisimNet156));

   A02   ICA6A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[6]),
                .D(s_logisimBus14[6]),
                .Z(s_logisimNet108));

   A02   ICA6B (.A(s_logisimNet15),
                .B(s_logisimBus114[6]),
                .C(s_logisimBus38[6]),
                .D(s_logisimNet16),
                .Z(s_logisimNet76));

   A02   ICA7A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[7]),
                .D(s_logisimBus14[7]),
                .Z(s_logisimNet109));

   A02   ICA7B (.A(s_logisimNet15),
                .B(s_logisimBus114[7]),
                .C(s_logisimBus38[7]),
                .D(s_logisimNet16),
                .Z(s_logisimNet77));

   A02   ICA8A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[8]),
                .D(s_logisimBus14[8]),
                .Z(s_logisimNet23));

   A02   ICA8B (.A(s_logisimNet15),
                .B(s_logisimBus114[8]),
                .C(s_logisimBus38[8]),
                .D(s_logisimNet16),
                .Z(s_logisimNet157));

   A02   ICA9A (.A(s_logisimNet5),
                .B(s_logisimNet3),
                .C(s_logisimBus46[9]),
                .D(s_logisimBus14[9]),
                .Z(s_logisimNet24));

   A02   ICA9B (.A(s_logisimNet15),
                .B(s_logisimBus114[9]),
                .C(s_logisimBus38[9]),
                .D(s_logisimNet16),
                .Z(s_logisimNet158));

   A02   ICA10A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[10]),
                 .D(s_logisimBus14[10]),
                 .Z(s_logisimNet110));

   A02   ICA10B (.A(s_logisimNet15),
                 .B(s_logisimBus114[10]),
                 .C(s_logisimBus38[10]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet78));

   A02   ICA11A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[11]),
                 .D(s_logisimBus14[11]),
                 .Z(s_logisimNet101));

   A02   ICA11B (.A(s_logisimNet15),
                 .B(s_logisimBus114[11]),
                 .C(s_logisimBus38[11]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet79));

   A02   ICA12A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[12]),
                 .D(s_logisimBus14[12]),
                 .Z(s_logisimNet102));

   A02   ICA12B (.A(s_logisimNet15),
                 .B(s_logisimBus114[12]),
                 .C(s_logisimBus38[12]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet80));

   A02   ICA13A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[13]),
                 .D(s_logisimBus14[13]),
                 .Z(s_logisimNet103));

   A02   ICA13B (.A(s_logisimNet15),
                 .B(s_logisimBus114[13]),
                 .C(s_logisimBus38[13]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet81));

   A02   ICA14A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[14]),
                 .D(s_logisimBus14[14]),
                 .Z(s_logisimNet146));

   A02   ICA14B (.A(s_logisimNet15),
                 .B(s_logisimBus114[14]),
                 .C(s_logisimBus38[14]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet142));

   A02   ICA15A (.A(s_logisimNet5),
                 .B(s_logisimNet3),
                 .C(s_logisimBus46[15]),
                 .D(s_logisimBus14[15]),
                 .Z(s_logisimNet147));

   A02   ICA15B (.A(s_logisimNet15),
                 .B(s_logisimBus114[15]),
                 .C(s_logisimBus38[15]),
                 .D(s_logisimNet16),
                 .Z(s_logisimNet143));

   CGA_MAC_APOS_CALCA   CALCA (.ECCR(s_logisimNet25),
                               .ECCRHIN(s_logisimNet135),
                               .ICA_15_0(s_logisimBus29[15:0]),
                               .LCA_15_0(s_logisimBus14[15:0]),
                               .MCA_15_0(s_logisimBus17[9:0]),
                               .MCLK(s_logisimNet119));

   CGA_MAC_APOS_INC   AINC (.LCA_15_0(s_logisimBus14[15:0]),
                            .NLCA_15_0(s_logisimBus55[15:0]));

endmodule
