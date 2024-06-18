// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_ADD                                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_ADD( ADD_15_0,
                    BR_15_0,
                    CDS,
                    CD_15_0,
                    LCA_15_0,
                    PB,
                    PLCA,
                    PRB,
                    PX,
                    RB_15_0,
                    XR_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] BR_15_0;
   input        CDS;
   input [15:0] CD_15_0;
   input [15:0] LCA_15_0;
   input        PB;
   input        PLCA;
   input        PRB;
   input        PX;
   input [15:0] RB_15_0;
   input [15:0] XR_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] ADD_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0]  s_logisimBus100;
   wire [15:0] s_logisimBus113;
   wire [15:0] s_logisimBus118;
   wire [7:0]  s_logisimBus142;
   wire [15:0] s_logisimBus143;
   wire [15:0] s_logisimBus37;
   wire [15:0] s_logisimBus38;
   wire [15:0] s_logisimBus60;
   wire [15:0] s_logisimBus86;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
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
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet117;
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
   wire        s_logisimNet14;
   wire        s_logisimNet140;
   wire        s_logisimNet141;
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
   wire        s_logisimNet159;
   wire        s_logisimNet16;
   wire        s_logisimNet160;
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
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
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
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus100[0] = s_logisimNet151;
   assign s_logisimBus100[1] = s_logisimNet158;
   assign s_logisimBus100[2] = s_logisimNet111;
   assign s_logisimBus100[3] = s_logisimNet137;
   assign s_logisimBus100[4] = s_logisimNet160;
   assign s_logisimBus100[5] = s_logisimNet70;
   assign s_logisimBus100[6] = s_logisimNet144;
   assign s_logisimBus100[7] = s_logisimNet36;
   assign s_logisimNet111    = s_logisimBus143[2];
   assign s_logisimNet137    = s_logisimBus143[3];
   assign s_logisimNet144    = s_logisimBus143[6];
   assign s_logisimNet151    = s_logisimBus143[0];
   assign s_logisimNet158    = s_logisimBus143[1];
   assign s_logisimNet160    = s_logisimBus143[4];
   assign s_logisimNet36     = s_logisimBus143[7];
   assign s_logisimNet70     = s_logisimBus143[5];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus113[15:0] = XR_15_0;
   assign s_logisimBus118[15:0] = RB_15_0;
   assign s_logisimBus143[15:0] = CD_15_0;
   assign s_logisimBus37[15:0]  = LCA_15_0;
   assign s_logisimBus60[15:0]  = BR_15_0;
   assign s_logisimNet10        = PB;
   assign s_logisimNet2         = PLCA;
   assign s_logisimNet5         = PRB;
   assign s_logisimNet89        = CDS;
   assign s_logisimNet9         = PX;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ADD_15_0 = s_logisimBus38[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet21 = ~s_logisimNet89;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet114),
               .input2(s_logisimNet101),
               .result(s_logisimBus86[0]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_2 (.input1(s_logisimNet66),
               .input2(s_logisimNet15),
               .result(s_logisimBus86[1]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_3 (.input1(s_logisimNet150),
               .input2(s_logisimNet48),
               .result(s_logisimBus86[2]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet104),
               .input2(s_logisimNet72),
               .result(s_logisimBus86[3]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_5 (.input1(s_logisimNet77),
               .input2(s_logisimNet135),
               .result(s_logisimBus86[4]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_6 (.input1(s_logisimNet133),
               .input2(s_logisimNet98),
               .result(s_logisimBus86[5]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_7 (.input1(s_logisimNet19),
               .input2(s_logisimNet6),
               .result(s_logisimBus86[6]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_8 (.input1(s_logisimNet149),
               .input2(s_logisimNet92),
               .result(s_logisimBus86[7]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_9 (.input1(s_logisimNet122),
               .input2(s_logisimNet42),
               .result(s_logisimBus86[8]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_10 (.input1(s_logisimNet23),
                .input2(s_logisimNet53),
                .result(s_logisimBus86[9]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_11 (.input1(s_logisimNet84),
                .input2(s_logisimNet63),
                .result(s_logisimBus86[10]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_12 (.input1(s_logisimNet85),
                .input2(s_logisimNet57),
                .result(s_logisimBus86[11]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_13 (.input1(s_logisimNet107),
                .input2(s_logisimNet24),
                .result(s_logisimBus86[12]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_14 (.input1(s_logisimNet97),
                .input2(s_logisimNet56),
                .result(s_logisimBus86[13]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_15 (.input1(s_logisimNet147),
                .input2(s_logisimNet99),
                .result(s_logisimBus86[14]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_16 (.input1(s_logisimNet52),
                .input2(s_logisimNet51),
                .result(s_logisimBus86[15]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet36),
                .input2(s_logisimNet89),
                .result(s_logisimNet30));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[8]),
                .result(s_logisimNet141));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[9]),
                .result(s_logisimNet96));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet21),
                .input2(1'b1),
                .result(s_logisimNet81));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_21 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[11]),
                .result(s_logisimNet157));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[12]),
                .result(s_logisimNet119));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_23 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[13]),
                .result(s_logisimNet108));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_24 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[14]),
                .result(s_logisimNet8));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_25 (.input1(s_logisimNet21),
                .input2(s_logisimBus143[15]),
                .result(s_logisimNet159));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_26 (.input1(s_logisimNet89),
                .input2(s_logisimNet36),
                .result(s_logisimNet16));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_logisimNet141),
                .input2(s_logisimNet30),
                .result(s_logisimBus142[0]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet96),
                .input2(s_logisimNet30),
                .result(s_logisimBus142[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_29 (.input1(s_logisimNet81),
                .input2(s_logisimNet30),
                .result(s_logisimBus142[2]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_30 (.input1(s_logisimNet157),
                .input2(s_logisimNet30),
                .result(s_logisimBus142[3]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet119),
                .input2(s_logisimNet16),
                .result(s_logisimBus142[4]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_32 (.input1(s_logisimNet108),
                .input2(s_logisimNet16),
                .result(s_logisimBus142[5]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_33 (.input1(s_logisimNet8),
                .input2(s_logisimNet16),
                .result(s_logisimBus142[6]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_34 (.input1(s_logisimNet159),
                .input2(s_logisimNet16),
                .result(s_logisimBus142[7]));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   A02   A02_32 (.A(s_logisimBus113[15]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[15]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet51));

   A02   A02_28 (.A(s_logisimBus113[13]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[13]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet56));

   A02   A02_30 (.A(s_logisimBus113[14]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[14]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet99));

   A02   A02_24 (.A(s_logisimBus113[11]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[11]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet57));

   A02   A02_26 (.A(s_logisimBus113[12]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[12]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet24));

   A02   A02_20 (.A(s_logisimBus113[9]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[9]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet53));

   A02   A02_22 (.A(s_logisimBus113[10]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[10]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet63));

   A02   A02_16 (.A(s_logisimBus113[7]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[7]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet92));

   A02   A02_18 (.A(s_logisimBus113[8]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[8]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet42));

   A02   A02_12 (.A(s_logisimBus113[5]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[5]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet98));

   A02   A02_14 (.A(s_logisimBus113[6]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[6]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet6));

   A02   A02_8 (.A(s_logisimBus113[3]),
                .B(s_logisimNet9),
                .C(s_logisimBus37[3]),
                .D(s_logisimNet2),
                .Z(s_logisimNet72));

   A02   A02_10 (.A(s_logisimBus113[4]),
                 .B(s_logisimNet9),
                 .C(s_logisimBus37[4]),
                 .D(s_logisimNet2),
                 .Z(s_logisimNet135));

   A02   A02_6 (.A(s_logisimBus113[2]),
                .B(s_logisimNet9),
                .C(s_logisimBus37[2]),
                .D(s_logisimNet2),
                .Z(s_logisimNet48));

   A02   A02_4 (.A(s_logisimBus113[1]),
                .B(s_logisimNet9),
                .C(s_logisimBus37[1]),
                .D(s_logisimNet2),
                .Z(s_logisimNet15));

   A02   A02_2 (.A(s_logisimBus113[0]),
                .B(s_logisimNet9),
                .C(s_logisimBus37[0]),
                .D(s_logisimNet2),
                .Z(s_logisimNet101));

   A02   A02_31 (.A(s_logisimBus118[15]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[15]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet52));

   A02   A02_27 (.A(s_logisimBus118[13]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[13]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet97));

   A02   A02_29 (.A(s_logisimBus118[14]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[14]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet147));

   A02   A02_23 (.A(s_logisimBus118[11]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[11]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet85));

   A02   A02_25 (.A(s_logisimBus118[12]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[12]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet107));

   A02   A02_19 (.A(s_logisimBus118[9]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[9]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet23));

   A02   A02_21 (.A(s_logisimBus118[10]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[10]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet84));

   A02   A02_15 (.A(s_logisimBus118[7]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[7]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet149));

   A02   A02_17 (.A(s_logisimBus118[8]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[8]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet122));

   A02   A02_11 (.A(s_logisimBus118[5]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[5]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet133));

   A02   A02_13 (.A(s_logisimBus118[6]),
                 .B(s_logisimNet5),
                 .C(s_logisimBus60[6]),
                 .D(s_logisimNet10),
                 .Z(s_logisimNet19));

   A02   A02_7 (.A(s_logisimBus118[3]),
                .B(s_logisimNet5),
                .C(s_logisimBus60[3]),
                .D(s_logisimNet10),
                .Z(s_logisimNet104));

   A02   A02_9 (.A(s_logisimBus118[4]),
                .B(s_logisimNet5),
                .C(s_logisimBus60[4]),
                .D(s_logisimNet10),
                .Z(s_logisimNet77));

   A02   A02_3 (.A(s_logisimBus118[1]),
                .B(s_logisimNet5),
                .C(s_logisimBus60[1]),
                .D(s_logisimNet10),
                .Z(s_logisimNet66));

   A02   A02_5 (.A(s_logisimBus118[2]),
                .B(s_logisimNet5),
                .C(s_logisimBus60[2]),
                .D(s_logisimNet10),
                .Z(s_logisimNet150));

   A02   A02_1 (.A(s_logisimBus118[0]),
                .B(s_logisimNet5),
                .C(s_logisimBus60[0]),
                .D(s_logisimNet10),
                .Z(s_logisimNet114));

   CGA_MAC_FASTADD   FASTADD (.ADD_15_0(s_logisimBus38[15:0]),
                              .CDE_15_8(s_logisimBus142[7:0]),
                              .CD_7_0(s_logisimBus100[7:0]),
                              .PRP_15_0(s_logisimBus86[15:0]));

endmodule
