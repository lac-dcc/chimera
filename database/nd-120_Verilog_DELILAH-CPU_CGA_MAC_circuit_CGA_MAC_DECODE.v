// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_DECODE                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_DECODE( ADDSEL,
                       CDS,
                       CDSEL,
                       CSCOMM_4_0,
                       CSMIS_1_0,
                       EXMN,
                       HOLD,
                       LCSN,
                       LLDEXM,
                       LLDPCR,
                       LLDSEG,
                       MCLK,
                       NLCASEL,
                       PB,
                       PLCA,
                       PRB,
                       PSEL,
                       PX,
                       SAPT,
                       SPTN,
                       WR3,
                       WR7 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [4:0] CSCOMM_4_0;
   input [1:0] CSMIS_1_0;
   input       LCSN;
   input       MCLK;
   input       WR3;
   input       WR7;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output ADDSEL;
   output CDS;
   output CDSEL;
   output EXMN;
   output HOLD;
   output LLDEXM;
   output LLDPCR;
   output LLDSEG;
   output NLCASEL;
   output PB;
   output PLCA;
   output PRB;
   output PSEL;
   output PX;
   output SAPT;
   output SPTN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus45;
   wire [4:0] s_logisimBus84;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet100;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
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
   wire       s_logisimNet46;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
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
   wire       s_logisimNet85;
   wire       s_logisimNet86;
   wire       s_logisimNet87;
   wire       s_logisimNet88;
   wire       s_logisimNet89;
   wire       s_logisimNet9;
   wire       s_logisimNet90;
   wire       s_logisimNet91;
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
   assign s_logisimBus45[1:0] = CSMIS_1_0;
   assign s_logisimBus84[4:0] = CSCOMM_4_0;
   assign s_logisimNet32      = WR3;
   assign s_logisimNet50      = MCLK;
   assign s_logisimNet58      = LCSN;
   assign s_logisimNet72      = WR7;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ADDSEL  = s_logisimNet100;
   assign CDS     = s_logisimNet66;
   assign CDSEL   = s_logisimNet99;
   assign EXMN    = s_logisimNet95;
   assign HOLD    = s_logisimNet73;
   assign LLDEXM  = s_logisimNet30;
   assign LLDPCR  = s_logisimNet85;
   assign LLDSEG  = s_logisimNet63;
   assign NLCASEL = s_logisimNet10;
   assign PB      = s_logisimNet61;
   assign PLCA    = s_logisimNet78;
   assign PRB     = s_logisimNet97;
   assign PSEL    = s_logisimNet57;
   assign PX      = s_logisimNet98;
   assign SAPT    = s_logisimNet79;
   assign SPTN    = s_logisimNet77;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet61 = ~s_logisimNet60;

   // NOT Gate
   assign s_logisimNet98 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet97 = ~s_logisimNet31;

   // NOT Gate
   assign s_logisimNet99 = ~s_logisimNet39;

   // NOT Gate
   assign s_logisimNet100 = ~s_logisimNet81;

   // NOT Gate
   assign s_logisimNet10 = ~s_logisimNet9;

   // NOT Gate
   assign s_logisimNet73 = ~s_logisimNet21;

   // NOT Gate
   assign s_logisimNet78 = ~s_logisimNet51;

   // NOT Gate
   assign s_logisimNet49 = ~s_logisimNet72;

   // NOT Gate
   assign s_logisimNet91 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet57 = ~s_logisimNet42;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimBus84[0];

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimBus84[1];

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimBus84[2];

   // NOT Gate
   assign s_logisimNet18 = ~s_logisimBus84[3];

   // NOT Gate
   assign s_logisimNet33 = ~s_logisimBus84[4];

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimBus45[0];

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimBus45[1];

   // NOT Gate
   assign s_logisimNet22 = ~s_logisimNet5;

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet14;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet18;

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet33;

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet25;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimNet0),
               .input2(s_logisimNet22),
               .input3(s_logisimNet13),
               .input4(s_logisimNet7),
               .result(s_logisimNet68));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_2 (.input1(s_logisimNet91),
               .input2(s_logisimNet20),
               .input3(s_logisimNet25),
               .input4(s_logisimNet5),
               .result(s_logisimNet60));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet11),
               .input2(s_logisimNet13),
               .result(s_logisimNet55));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_4 (.input1(s_logisimNet11),
               .input2(s_logisimNet0),
               .input3(s_logisimNet22),
               .result(s_logisimNet29));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_5 (.input1(s_logisimNet11),
               .input2(s_logisimNet25),
               .input3(s_logisimNet33),
               .result(s_logisimNet67));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_6 (.input1(s_logisimNet18),
               .input2(s_logisimNet0),
               .input3(s_logisimNet22),
               .result(s_logisimNet35));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_7 (.input1(s_logisimNet49),
               .input2(s_logisimNet20),
               .input3(s_logisimNet35),
               .input4(s_logisimNet38),
               .result(s_logisimNet1));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_8 (.input1(s_logisimNet20),
               .input2(s_logisimNet2),
               .input3(s_logisimNet25),
               .input4(s_logisimNet5),
               .input5(s_logisimNet6),
               .input6(s_logisimNet0),
               .result(s_logisimNet46));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet5),
               .input2(s_logisimNet25),
               .result(s_logisimNet38));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_10 (.input1(s_logisimNet20),
                .input2(s_logisimNet2),
                .input3(s_logisimNet25),
                .input4(s_logisimNet14),
                .input5(s_logisimNet12),
                .input6(s_logisimNet11),
                .result(s_logisimNet4));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_11 (.input1(s_logisimNet25),
                .input2(s_logisimNet22),
                .input3(s_logisimNet0),
                .input4(s_logisimNet11),
                .input5(s_logisimNet2),
                .result(s_logisimNet87));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_12 (.input1(s_logisimNet46),
                .input2(s_logisimNet4),
                .input3(s_logisimNet87),
                .input4(s_logisimNet64),
                .input5(s_logisimNet62),
                .result(s_logisimNet79));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_13 (.input1(s_logisimNet35),
                .input2(s_logisimNet38),
                .input3(s_logisimNet72),
                .input4(s_logisimNet20),
                .result(s_logisimNet96));

   NOR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_14 (.input1(s_logisimNet96),
                .input2(s_logisimNet82),
                .input3(s_logisimNet52),
                .input4(s_logisimNet80),
                .result(s_logisimNet31));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_15 (.input1(s_logisimNet13),
                .input2(s_logisimNet5),
                .input3(s_logisimNet0),
                .input4(s_logisimNet11),
                .input5(s_logisimNet2),
                .result(s_logisimNet64));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_16 (.input1(s_logisimNet32),
                .input2(s_logisimNet20),
                .input3(s_logisimNet25),
                .input4(s_logisimNet5),
                .result(s_logisimNet82));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_17 (.input1(s_logisimNet20),
                .input2(s_logisimNet5),
                .input3(s_logisimNet0),
                .input4(s_logisimNet11),
                .input5(s_logisimNet2),
                .result(s_logisimNet62));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_18 (.input1(s_logisimNet22),
                .input2(s_logisimNet12),
                .input3(s_logisimNet7),
                .result(s_logisimNet52));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_19 (.input1(s_logisimNet22),
                .input2(s_logisimNet11),
                .input3(s_logisimNet7),
                .result(s_logisimNet80));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet18),
                .input2(s_logisimNet14),
                .result(s_logisimNet26));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_21 (.input1(s_logisimNet7),
                .input2(s_logisimNet13),
                .input3(s_logisimNet5),
                .input4(s_logisimNet6),
                .input5(s_logisimNet12),
                .input6(s_logisimNet2),
                .result(s_logisimNet17));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet11),
                .input2(s_logisimNet12),
                .result(s_logisimNet54));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_23 (.input1(s_logisimNet7),
                .input2(s_logisimNet13),
                .input3(s_logisimNet5),
                .input4(s_logisimNet11),
                .input5(s_logisimNet2),
                .result(s_logisimNet44));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_24 (.input1(s_logisimNet18),
                .input2(s_logisimNet0),
                .input3(s_logisimNet13),
                .input4(s_logisimNet5),
                .result(s_logisimNet23));

   NOR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_25 (.input1(s_logisimNet17),
                .input2(s_logisimNet44),
                .input3(s_logisimNet74),
                .input4(s_logisimNet89),
                .result(s_logisimNet39));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_26 (.input1(s_logisimNet2),
                .input2(s_logisimNet14),
                .input3(s_logisimNet0),
                .input4(s_logisimNet18),
                .result(s_logisimNet74));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_27 (.input1(s_logisimNet26),
                .input2(s_logisimNet2),
                .input3(s_logisimNet54),
                .input4(s_logisimNet23),
                .input5(s_logisimNet71),
                .input6(s_logisimNet56),
                .input7(s_logisimNet8),
                .input8(s_logisimNet53),
                .result(s_logisimNet81));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_28 (.input1(s_logisimNet7),
                .input2(s_logisimNet12),
                .input3(s_logisimNet6),
                .input4(s_logisimNet13),
                .result(s_logisimNet71));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_29 (.input1(s_logisimNet11),
                .input2(s_logisimNet5),
                .input3(s_logisimNet13),
                .input4(s_logisimNet7),
                .result(s_logisimNet56));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_30 (.input1(s_logisimNet2),
                .input2(s_logisimNet12),
                .input3(s_logisimNet11),
                .result(s_logisimNet89));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_31 (.input1(s_logisimNet11),
                .input2(s_logisimNet22),
                .input3(s_logisimNet13),
                .result(s_logisimNet8));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_32 (.input1(s_logisimNet12),
                .input2(s_logisimNet6),
                .input3(s_logisimNet22),
                .input4(s_logisimNet13),
                .result(s_logisimNet53));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_33 (.input1(s_logisimNet11),
                .input2(s_logisimNet22),
                .input3(s_logisimNet0),
                .input4(s_logisimNet13),
                .input5(s_logisimNet2),
                .input6(s_logisimNet28),
                .result(s_logisimNet9));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_34 (.input1(s_logisimNet13),
                .input2(s_logisimNet7),
                .input3(s_logisimNet6),
                .result(s_logisimNet28));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_35 (.input1(s_logisimNet2),
                .input2(s_logisimNet93),
                .result(s_logisimNet21));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_36 (.input1(s_logisimNet0),
                .input2(s_logisimNet6),
                .input3(s_logisimNet13),
                .input4(s_logisimNet70),
                .input5(s_logisimNet3),
                .input6(s_logisimNet34),
                .result(s_logisimNet93));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_37 (.input1(s_logisimNet13),
                .input2(s_logisimNet20),
                .result(s_logisimNet70));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_38 (.input1(s_logisimNet18),
                .input2(s_logisimNet22),
                .input3(s_logisimNet13),
                .result(s_logisimNet3));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_39 (.input1(s_logisimNet11),
                .input2(s_logisimNet5),
                .input3(s_logisimNet13),
                .result(s_logisimNet34));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_40 (.input1(s_logisimNet20),
                .input2(s_logisimNet22),
                .input3(s_logisimNet11),
                .result(s_logisimNet43));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_41 (.input1(s_logisimNet43),
                .input2(s_logisimNet69),
                .result(s_logisimNet66));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_42 (.input1(s_logisimNet20),
                .input2(s_logisimNet22),
                .input3(s_logisimNet12),
                .input4(s_logisimNet18),
                .result(s_logisimNet69));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_43 (.input1(s_logisimNet20),
                .input2(s_logisimNet13),
                .input3(s_logisimNet14),
                .input4(s_logisimNet12),
                .input5(s_logisimNet11),
                .input6(s_logisimNet2),
                .result(s_logisimNet95));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_44 (.input1(s_logisimNet20),
                .input2(s_logisimNet5),
                .result(s_logisimNet76));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_45 (.input1(s_logisimNet0),
                .input2(s_logisimNet14),
                .result(s_logisimNet47));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_46 (.input1(s_logisimNet11),
                .input2(s_logisimNet22),
                .result(s_logisimNet36));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_47 (.input1(s_logisimNet76),
                .input2(s_logisimNet36),
                .input3(s_logisimNet48),
                .result(s_logisimNet51));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_48 (.input1(s_logisimNet0),
                .input2(s_logisimNet6),
                .input3(s_logisimNet22),
                .result(s_logisimNet40));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_49 (.input1(s_logisimNet12),
                .input2(s_logisimNet22),
                .result(s_logisimNet48));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_50 (.input1(s_logisimNet25),
                .input2(s_logisimNet6),
                .result(s_logisimNet86));

   NAND_GATE_7_INPUTS #(.BubblesMask({3'b000, 4'h0}))
      GATES_51 (.input1(s_logisimNet47),
                .input2(s_logisimNet40),
                .input3(s_logisimNet86),
                .input4(s_logisimNet18),
                .input5(s_logisimNet27),
                .input6(s_logisimNet24),
                .input7(s_logisimNet2),
                .result(s_logisimNet42));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_52 (.input1(s_logisimNet0),
                .input2(s_logisimNet13),
                .input3(s_logisimNet7),
                .result(s_logisimNet27));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_53 (.input1(s_logisimNet12),
                .input2(s_logisimNet6),
                .input3(s_logisimNet5),
                .result(s_logisimNet24));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_54 (.input1(s_logisimNet58),
                .input2(s_logisimNet20),
                .input3(s_logisimNet13),
                .input4(s_logisimNet22),
                .input5(s_logisimNet14),
                .input6(s_logisimNet0),
                .input7(s_logisimNet18),
                .input8(s_logisimNet2),
                .result(s_logisimNet75));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_55 (.input1(s_logisimNet58),
                .input2(s_logisimNet7),
                .input3(s_logisimNet25),
                .input4(s_logisimNet5),
                .input5(s_logisimNet14),
                .input6(s_logisimNet0),
                .input7(s_logisimNet18),
                .input8(s_logisimNet2),
                .result(s_logisimNet90));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_56 (.input1(s_logisimNet18),
                .input2(s_logisimNet0),
                .input3(s_logisimNet14),
                .result(s_logisimNet59));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_57 (.input1(s_logisimNet11),
                .input2(s_logisimNet12),
                .input3(s_logisimNet6),
                .result(s_logisimNet15));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_58 (.input1(s_logisimNet58),
                .input2(s_logisimNet33),
                .input3(s_logisimNet18),
                .input4(s_logisimNet12),
                .input5(s_logisimNet6),
                .input6(s_logisimNet5),
                .input7(s_logisimNet13),
                .input8(s_logisimNet20),
                .result(s_logisimNet92));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_59 (.input1(s_logisimNet0),
                .input2(s_logisimNet25),
                .input3(s_logisimNet20),
                .result(s_logisimNet16));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_60 (.input1(s_logisimNet59),
                .input2(s_logisimNet15),
                .input3(s_logisimNet2),
                .input4(s_logisimNet16),
                .input5(s_logisimNet68),
                .input6(s_logisimNet55),
                .input7(s_logisimNet29),
                .input8(s_logisimNet67),
                .result(s_logisimNet77));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   R41P   DECODE_R41 (.A(s_logisimNet75),
                      .B(s_logisimNet90),
                      .C(s_logisimNet92),
                      .CP(s_logisimNet50),
                      .D(1'b0),
                      .QA(),
                      .QAN(s_logisimNet30),
                      .QB(),
                      .QBN(s_logisimNet63),
                      .QC(),
                      .QCN(s_logisimNet85),
                      .QD(),
                      .QDN());

endmodule
