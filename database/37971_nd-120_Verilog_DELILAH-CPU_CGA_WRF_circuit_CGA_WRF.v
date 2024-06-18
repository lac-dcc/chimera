// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF                                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF( ALUCLK,
                A_15_0,
                BDEST,
                BR_15_0,
                B_15_0,
                EA_15_0,
                LAA_3_0,
                LBA_3_0,
                NLCA_15_0,
                PR_15_0,
                RB_15_0,
                WPN,
                WR3,
                WR7,
                XFETCHN,
                XR_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input        BDEST;
   input [3:0]  LAA_3_0;
   input [3:0]  LBA_3_0;
   input [15:0] NLCA_15_0;
   input [15:0] RB_15_0;
   input        XFETCHN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] A_15_0;
   output [15:0] BR_15_0;
   output [15:0] B_15_0;
   output [15:0] EA_15_0;
   output [15:0] PR_15_0;
   output        WPN;
   output        WR3;
   output        WR7;
   output [15:0] XR_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus100;
   wire [15:0] s_logisimBus109;
   wire [15:0] s_logisimBus110;
   wire [15:0] s_logisimBus117;
   wire [15:0] s_logisimBus12;
   wire [3:0]  s_logisimBus127;
   wire [3:0]  s_logisimBus18;
   wire [15:0] s_logisimBus53;
   wire [15:0] s_logisimBus62;
   wire [15:0] s_logisimBus83;
   wire [15:0] s_logisimBus84;
   wire [15:0] s_logisimBus85;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet101;
   wire        s_logisimNet102;
   wire        s_logisimNet104;
   wire        s_logisimNet105;
   wire        s_logisimNet106;
   wire        s_logisimNet107;
   wire        s_logisimNet108;
   wire        s_logisimNet11;
   wire        s_logisimNet111;
   wire        s_logisimNet112;
   wire        s_logisimNet113;
   wire        s_logisimNet114;
   wire        s_logisimNet115;
   wire        s_logisimNet116;
   wire        s_logisimNet118;
   wire        s_logisimNet119;
   wire        s_logisimNet120;
   wire        s_logisimNet121;
   wire        s_logisimNet122;
   wire        s_logisimNet123;
   wire        s_logisimNet124;
   wire        s_logisimNet125;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
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
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
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
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
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
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet88;
   wire        s_logisimNet89;
   wire        s_logisimNet9;
   wire        s_logisimNet90;
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
   assign s_logisimBus117[15:0] = NLCA_15_0;
   assign s_logisimBus127[3:0]  = LAA_3_0;
   assign s_logisimBus18[3:0]   = LBA_3_0;
   assign s_logisimBus62[15:0]  = RB_15_0;
   assign s_logisimNet17        = BDEST;
   assign s_logisimNet4         = ALUCLK;
   assign s_logisimNet6         = XFETCHN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A_15_0  = s_logisimBus109[15:0];
   assign BR_15_0 = s_logisimBus53[15:0];
   assign B_15_0  = s_logisimBus83[15:0];
   assign EA_15_0 = s_logisimBus100[15:0];
   assign PR_15_0 = s_logisimBus12[15:0];
   assign WPN     = s_logisimNet40;
   assign WR3     = s_logisimBus85[3];
   assign WR7     = s_logisimBus85[7];
   assign XR_15_0 = s_logisimBus84[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimBus85[0] = ~s_logisimNet65;

   // NOT Gate
   assign s_logisimBus85[1] = ~s_logisimNet76;

   // NOT Gate
   assign s_logisimBus85[2] = ~s_logisimNet40;

   // NOT Gate
   assign s_logisimBus85[3] = ~s_logisimNet102;

   // NOT Gate
   assign s_logisimBus85[4] = ~s_logisimNet119;

   // NOT Gate
   assign s_logisimBus85[5] = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimBus85[6] = ~s_logisimNet29;

   // NOT Gate
   assign s_logisimBus85[7] = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimBus85[8] = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimBus85[9] = ~s_logisimNet26;

   // NOT Gate
   assign s_logisimBus85[10] = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimBus85[11] = ~s_logisimNet64;

   // NOT Gate
   assign s_logisimBus85[12] = ~s_logisimNet75;

   // NOT Gate
   assign s_logisimBus85[13] = ~s_logisimNet93;

   // NOT Gate
   assign s_logisimBus85[14] = ~s_logisimNet101;

   // NOT Gate
   assign s_logisimBus85[15] = ~s_logisimNet118;

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimBus127[3];

   // NOT Gate
   assign s_logisimNet27 = ~s_logisimBus18[3];

   // NOT Gate
   assign s_logisimNet112 = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimBus110[8] = ~s_logisimNet66;

   // NOT Gate
   assign s_logisimBus110[9] = ~s_logisimNet94;

   // NOT Gate
   assign s_logisimBus110[10] = ~s_logisimNet120;

   // NOT Gate
   assign s_logisimBus110[11] = ~s_logisimNet30;

   // NOT Gate
   assign s_logisimBus110[12] = ~s_logisimNet67;

   // NOT Gate
   assign s_logisimBus110[13] = ~s_logisimNet95;

   // NOT Gate
   assign s_logisimBus110[14] = ~s_logisimNet121;

   // NOT Gate
   assign s_logisimBus110[15] = ~s_logisimNet31;

   // NOT Gate
   assign s_logisimBus100[0] = ~s_logisimNet78;

   // NOT Gate
   assign s_logisimBus100[1] = ~s_logisimNet104;

   // NOT Gate
   assign s_logisimBus100[2] = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimBus100[3] = ~s_logisimNet47;

   // NOT Gate
   assign s_logisimBus100[4] = ~s_logisimNet79;

   // NOT Gate
   assign s_logisimBus100[5] = ~s_logisimNet105;

   // NOT Gate
   assign s_logisimBus100[6] = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimBus100[7] = ~s_logisimNet48;

   // NOT Gate
   assign s_logisimBus100[8] = ~s_logisimNet49;

   // NOT Gate
   assign s_logisimBus100[9] = ~s_logisimNet80;

   // NOT Gate
   assign s_logisimBus100[10] = ~s_logisimNet106;

   // NOT Gate
   assign s_logisimBus100[11] = ~s_logisimNet9;

   // NOT Gate
   assign s_logisimBus100[12] = ~s_logisimNet50;

   // NOT Gate
   assign s_logisimBus100[13] = ~s_logisimNet81;

   // NOT Gate
   assign s_logisimBus100[14] = ~s_logisimNet107;

   // NOT Gate
   assign s_logisimBus100[15] = ~s_logisimNet10;

   // NOT Gate
   assign s_logisimBus110[0] = ~s_logisimNet96;

   // NOT Gate
   assign s_logisimBus110[1] = ~s_logisimNet122;

   // NOT Gate
   assign s_logisimBus110[2] = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimBus110[3] = ~s_logisimNet68;

   // NOT Gate
   assign s_logisimBus110[4] = ~s_logisimNet97;

   // NOT Gate
   assign s_logisimBus110[5] = ~s_logisimNet123;

   // NOT Gate
   assign s_logisimBus110[6] = ~s_logisimNet33;

   // NOT Gate
   assign s_logisimBus110[7] = ~s_logisimNet69;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[0]),
               .result(s_logisimNet65));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[1]),
               .result(s_logisimNet76));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[2]),
               .result(s_logisimNet40));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[3]),
               .result(s_logisimNet102));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[4]),
               .result(s_logisimNet119));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[5]),
               .result(s_logisimNet3));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[6]),
               .result(s_logisimNet29));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[7]),
               .result(s_logisimNet46));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet17),
               .input2(s_logisimBus110[8]),
               .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[9]),
                .result(s_logisimNet26));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[10]),
                .result(s_logisimNet45));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[11]),
                .result(s_logisimNet64));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[12]),
                .result(s_logisimNet75));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[13]),
                .result(s_logisimNet93));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[14]),
                .result(s_logisimNet101));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet17),
                .input2(s_logisimBus110[15]),
                .result(s_logisimNet118));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_WRF_RBLOCK   RBLOCK (.ALUCLK(s_logisimNet4),
                            .ALUCLKN(s_logisimNet112),
                            .A_15_0(s_logisimBus109[15:0]),
                            .BR_15_0(s_logisimBus53[15:0]),
                            .B_15_0(s_logisimBus83[15:0]),
                            .EA_15_0(s_logisimBus100[15:0]),
                            .EB_15_0(s_logisimBus110[15:0]),
                            .NLCA_15_0(s_logisimBus117[15:0]),
                            .PR_15_0(s_logisimBus12[15:0]),
                            .RB_15_0(s_logisimBus62[15:0]),
                            .WR_15_0(s_logisimBus85[15:0]),
                            .XFETCHN(s_logisimNet6),
                            .XR_15_0(s_logisimBus84[15:0]));

   ND38GLP   LBA_HI (.A(s_logisimBus18[0]),
                     .B(s_logisimBus18[1]),
                     .C(s_logisimBus18[2]),
                     .G(s_logisimBus18[3]),
                     .Z0(s_logisimNet66),
                     .Z1(s_logisimNet94),
                     .Z2(s_logisimNet120),
                     .Z3(s_logisimNet30),
                     .Z4(s_logisimNet67),
                     .Z5(s_logisimNet95),
                     .Z6(s_logisimNet121),
                     .Z7(s_logisimNet31));

   ND38GLP   LAA_LO (.A(s_logisimBus127[0]),
                     .B(s_logisimBus127[1]),
                     .C(s_logisimBus127[2]),
                     .G(s_logisimNet2),
                     .Z0(s_logisimNet78),
                     .Z1(s_logisimNet104),
                     .Z2(s_logisimNet7),
                     .Z3(s_logisimNet47),
                     .Z4(s_logisimNet79),
                     .Z5(s_logisimNet105),
                     .Z6(s_logisimNet8),
                     .Z7(s_logisimNet48));

   ND38GLP   LAA_HI (.A(s_logisimBus127[0]),
                     .B(s_logisimBus127[1]),
                     .C(s_logisimBus127[2]),
                     .G(s_logisimBus127[3]),
                     .Z0(s_logisimNet49),
                     .Z1(s_logisimNet80),
                     .Z2(s_logisimNet106),
                     .Z3(s_logisimNet9),
                     .Z4(s_logisimNet50),
                     .Z5(s_logisimNet81),
                     .Z6(s_logisimNet107),
                     .Z7(s_logisimNet10));

   ND38GLP   LBA_LO (.A(s_logisimBus18[0]),
                     .B(s_logisimBus18[1]),
                     .C(s_logisimBus18[2]),
                     .G(s_logisimNet27),
                     .Z0(s_logisimNet96),
                     .Z1(s_logisimNet122),
                     .Z2(s_logisimNet32),
                     .Z3(s_logisimNet68),
                     .Z4(s_logisimNet97),
                     .Z5(s_logisimNet123),
                     .Z6(s_logisimNet33),
                     .Z7(s_logisimNet69));

endmodule
