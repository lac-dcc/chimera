// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_LA1025                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_LA1025( A10,
                       A1617,
                       A1619,
                       A1819,
                       B1819,
                       B1821,
                       BB10,
                       C10,
                       D1617,
                       E1617,
                       ECCRHIN,
                       F1617,
                       ICA_15_0,
                       LA_23_10,
                       MCLK,
                       PCR_15_0,
                       PCR_15_0_N,
                       SEG_7_0,
                       XPT_1_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        A10;
   input        A1617;
   input        A1619;
   input        A1819;
   input        B1819;
   input        B1821;
   input        BB10;
   input        C10;
   input        D1617;
   input        E1617;
   input        F1617;
   input [15:0] ICA_15_0;
   input        MCLK;
   input [15:0] PCR_15_0;
   input [15:0] PCR_15_0_N;
   input [7:0]  SEG_7_0;
   input [1:0]  XPT_1_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ECCRHIN;
   output [13:0] LA_23_10;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus0;
   wire [13:0] s_logisimBus127;
   wire [15:0] s_logisimBus15;
   wire [1:0]  s_logisimBus37;
   wire [7:0]  s_logisimBus41;
   wire [15:0] s_logisimBus59;
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
   wire        s_logisimNet126;
   wire        s_logisimNet128;
   wire        s_logisimNet129;
   wire        s_logisimNet13;
   wire        s_logisimNet130;
   wire        s_logisimNet131;
   wire        s_logisimNet132;
   wire        s_logisimNet133;
   wire        s_logisimNet134;
   wire        s_logisimNet135;
   wire        s_logisimNet14;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
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
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
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
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
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
   assign s_logisimBus0[15:0]  = ICA_15_0;
   assign s_logisimBus15[15:0] = PCR_15_0;
   assign s_logisimBus37[1:0]  = XPT_1_0;
   assign s_logisimBus41[7:0]  = SEG_7_0;
   assign s_logisimBus59[15:0] = PCR_15_0_N;
   assign s_logisimNet17       = B1821;
   assign s_logisimNet18       = F1617;
   assign s_logisimNet27       = A1619;
   assign s_logisimNet28       = E1617;
   assign s_logisimNet29       = C10;
   assign s_logisimNet38       = A10;
   assign s_logisimNet43       = B1819;
   assign s_logisimNet44       = MCLK;
   assign s_logisimNet45       = D1617;
   assign s_logisimNet56       = A1819;
   assign s_logisimNet57       = BB10;
   assign s_logisimNet7        = A1617;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECCRHIN  = s_logisimNet33;
   assign LA_23_10 = s_logisimBus127[13:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet103 = ~s_logisimBus0[9];

   // NOT Gate
   assign s_logisimNet73 = ~s_logisimBus0[10];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus37[1]),
               .input2(s_logisimNet18),
               .result(s_logisimNet89));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus37[0]),
               .input2(s_logisimNet18),
               .result(s_logisimNet22));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus0[11]),
               .input2(s_logisimNet29),
               .result(s_logisimNet82));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus0[10]),
               .input2(s_logisimNet29),
               .result(s_logisimNet5));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus41[7]),
               .input2(s_logisimNet7),
               .result(s_logisimNet105));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus41[6]),
               .input2(s_logisimNet7),
               .result(s_logisimNet69));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimBus0[15]),
               .input2(s_logisimNet29),
               .result(s_logisimNet99));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimBus0[14]),
               .input2(s_logisimNet29),
               .result(s_logisimNet70));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimBus0[13]),
               .input2(s_logisimNet29),
               .result(s_logisimNet74));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimBus0[12]),
                .input2(s_logisimNet29),
                .result(s_logisimNet23));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimBus41[5]),
                .input2(s_logisimNet17),
                .result(s_logisimNet78));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimBus41[4]),
                .input2(s_logisimNet17),
                .result(s_logisimNet50));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_13 (.input1(s_logisimNet96),
                .input2(s_logisimNet82),
                .result(s_logisimNet46));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_14 (.input1(s_logisimNet119),
                .input2(s_logisimNet5),
                .result(s_logisimNet19));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_15 (.input1(s_logisimNet120),
                .input2(s_logisimNet6),
                .result(s_logisimNet109));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_16 (.input1(s_logisimNet36),
                .input2(s_logisimNet100),
                .result(s_logisimNet20));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_17 (.input1(s_logisimNet35),
                .input2(s_logisimNet99),
                .result(s_logisimNet62));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_18 (.input1(s_logisimNet88),
                .input2(s_logisimNet70),
                .result(s_logisimNet16));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_19 (.input1(s_logisimNet132),
                .input2(s_logisimNet74),
                .result(s_logisimNet95));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_20 (.input1(s_logisimNet53),
                .input2(s_logisimNet23),
                .result(s_logisimNet75));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_21 (.input1(s_logisimNet91),
                .input2(s_logisimNet106),
                .input3(s_logisimNet126),
                .input4(s_logisimNet22),
                .result(s_logisimNet8));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_22 (.input1(s_logisimNet42),
                .input2(s_logisimNet63),
                .input3(s_logisimNet2),
                .input4(s_logisimNet89),
                .result(s_logisimNet116));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_23 (.input1(s_logisimBus127[5]),
                .input2(s_logisimNet49),
                .input3(s_logisimNet47),
                .input4(s_logisimNet111),
                .input5(s_logisimNet3),
                .input6(s_logisimNet97),
                .result(s_logisimNet33));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   A02   ILA17A (.A(s_logisimBus0[7]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[8]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet42));

   A02   ILA17B (.A(s_logisimBus15[12]),
                 .B(s_logisimNet27),
                 .C(s_logisimBus41[1]),
                 .D(s_logisimNet7),
                 .Z(s_logisimNet63));

   A02   ILA17C (.A(s_logisimBus15[10]),
                 .B(s_logisimNet45),
                 .C(s_logisimBus15[8]),
                 .D(s_logisimNet28),
                 .Z(s_logisimNet2));

   A02   ILA16A (.A(s_logisimBus0[6]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[7]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet91));

   A02   ILA16B (.A(s_logisimBus15[11]),
                 .B(s_logisimNet27),
                 .C(s_logisimBus41[0]),
                 .D(s_logisimNet7),
                 .Z(s_logisimNet106));

   A02   ILA16C (.A(s_logisimBus15[9]),
                 .B(s_logisimNet45),
                 .C(s_logisimBus15[7]),
                 .D(s_logisimNet28),
                 .Z(s_logisimNet126));

   A02   ILA10A (.A(s_logisimBus0[0]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[1]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet119));

   A02   ILA19A (.A(s_logisimNet27),
                 .B(s_logisimBus59[14]),
                 .C(s_logisimBus41[3]),
                 .D(s_logisimNet17),
                 .Z(s_logisimNet120));

   A02   ILA15A (.A(s_logisimBus0[5]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[6]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet35));

   A02   ILA18A (.A(s_logisimNet27),
                 .B(s_logisimBus59[13]),
                 .C(s_logisimBus59[9]),
                 .D(s_logisimNet43),
                 .Z(s_logisimNet36));

   A02   ILA18B (.A(s_logisimBus41[2]),
                 .B(s_logisimNet17),
                 .C(s_logisimNet103),
                 .D(s_logisimNet56),
                 .Z(s_logisimNet100));

   A02   ILA14A (.A(s_logisimBus0[4]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[5]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet88));

   A02   ILA13A (.A(s_logisimBus0[3]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[4]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet132));

   A02   ILA12A (.A(s_logisimBus0[2]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[3]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet53));

   A02   ILA11A (.A(s_logisimBus0[1]),
                 .B(s_logisimNet38),
                 .C(s_logisimBus0[2]),
                 .D(s_logisimNet57),
                 .Z(s_logisimNet96));

   A02   ILA19B (.A(s_logisimNet73),
                 .B(s_logisimNet56),
                 .C(s_logisimBus59[10]),
                 .D(s_logisimNet43),
                 .Z(s_logisimNet6));

   R81   R_LA_H (.A(1'b0),
                 .B(1'b0),
                 .C(s_logisimNet105),
                 .CP(s_logisimNet44),
                 .D(s_logisimNet69),
                 .E(s_logisimNet78),
                 .F(s_logisimNet50),
                 .G(s_logisimNet109),
                 .H(s_logisimNet20),
                 .QA(),
                 .QAN(),
                 .QB(),
                 .QBN(),
                 .QC(),
                 .QCN(s_logisimBus127[13]),
                 .QD(),
                 .QDN(s_logisimBus127[12]),
                 .QE(),
                 .QEN(s_logisimBus127[11]),
                 .QF(),
                 .QFN(s_logisimBus127[10]),
                 .QG(s_logisimBus127[9]),
                 .QGN(),
                 .QH(s_logisimBus127[8]),
                 .QHN());

   R81   R_LA_L (.A(s_logisimNet116),
                 .B(s_logisimNet8),
                 .C(s_logisimNet62),
                 .CP(s_logisimNet44),
                 .D(s_logisimNet16),
                 .E(s_logisimNet95),
                 .F(s_logisimNet75),
                 .G(s_logisimNet46),
                 .H(s_logisimNet19),
                 .QA(s_logisimBus127[7]),
                 .QAN(),
                 .QB(s_logisimBus127[6]),
                 .QBN(),
                 .QC(s_logisimBus127[5]),
                 .QCN(),
                 .QD(s_logisimBus127[4]),
                 .QDN(s_logisimNet97),
                 .QE(s_logisimBus127[3]),
                 .QEN(s_logisimNet3),
                 .QF(s_logisimBus127[2]),
                 .QFN(s_logisimNet111),
                 .QG(s_logisimBus127[1]),
                 .QGN(s_logisimNet47),
                 .QH(s_logisimBus127[0]),
                 .QHN(s_logisimNet49));

endmodule
