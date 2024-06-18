// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_MDCD                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_MDCD( A,
                            B,
                            C,
                            D,
                            E,
                            EPIC,
                            EPICMASKN,
                            G,
                            H,
                            HIF,
                            HIK,
                            HIPASSALL,
                            J,
                            L,
                            LAA_3_0,
                            LOF,
                            LOK,
                            LOPASSALL,
                            M,
                            MCLK,
                            N,
                            OEM,
                            OESN,
                            S );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       EPIC;
   input       HIPASSALL;
   input [3:0] LAA_3_0;
   input       LOPASSALL;
   input       MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output A;
   output B;
   output C;
   output D;
   output E;
   output EPICMASKN;
   output G;
   output H;
   output HIF;
   output HIK;
   output J;
   output L;
   output LOF;
   output LOK;
   output M;
   output N;
   output OEM;
   output OESN;
   output S;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus36;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
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
   wire       s_logisimNet84;
   wire       s_logisimNet85;
   wire       s_logisimNet86;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus36[3:0] = LAA_3_0;
   assign s_logisimNet1       = LOPASSALL;
   assign s_logisimNet10      = HIPASSALL;
   assign s_logisimNet14      = MCLK;
   assign s_logisimNet6       = EPIC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A         = s_logisimNet50;
   assign B         = s_logisimNet70;
   assign C         = s_logisimNet37;
   assign D         = s_logisimNet46;
   assign E         = s_logisimNet65;
   assign EPICMASKN = s_logisimNet19;
   assign G         = s_logisimNet11;
   assign H         = s_logisimNet55;
   assign HIF       = s_logisimNet69;
   assign HIK       = s_logisimNet71;
   assign J         = s_logisimNet86;
   assign L         = s_logisimNet58;
   assign LOF       = s_logisimNet75;
   assign LOK       = s_logisimNet64;
   assign M         = s_logisimNet67;
   assign N         = s_logisimNet43;
   assign OEM       = s_logisimNet79;
   assign OESN      = s_logisimNet83;
   assign S         = s_logisimNet8;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet79 = ~s_logisimNet19;

   // NOT Gate
   assign s_logisimNet50 = ~s_logisimNet49;

   // NOT Gate
   assign s_logisimNet70 = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimNet69 = ~s_logisimNet47;

   // NOT Gate
   assign s_logisimNet75 = ~s_logisimNet54;

   // NOT Gate
   assign s_logisimNet24 = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimNet66 = ~s_logisimNet10;

   // NOT Gate
   assign s_logisimNet30 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet74;

   // NOT Gate
   assign s_logisimNet58 = ~s_logisimNet77;

   // NOT Gate
   assign s_logisimNet86 = ~s_logisimNet27;

   // NOT Gate
   assign s_logisimNet64 = ~s_logisimNet60;

   // NOT Gate
   assign s_logisimNet71 = ~s_logisimNet80;

   // NOT Gate
   assign s_logisimNet59 = ~s_logisimBus36[3];

   // NOT Gate
   assign s_logisimNet48 = ~s_logisimNet13;

   // NOT Gate
   assign s_logisimNet43 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet65 = ~s_logisimNet48;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE_5_INPUTS #(.BubblesMask({1'b1, 4'hF}))
      GATES_1 (.input1(s_logisimNet9),
               .input2(s_logisimNet22),
               .input3(s_logisimNet5),
               .input4(s_logisimNet38),
               .input5(s_logisimNet25),
               .result(s_logisimNet76));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_2 (.input1(s_logisimNet25),
               .input2(s_logisimNet28),
               .input3(s_logisimNet5),
               .result(s_logisimNet73));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_3 (.input1(s_logisimNet22),
               .input2(s_logisimNet5),
               .result(s_logisimNet72));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet0),
               .input2(s_logisimNet33),
               .result(s_logisimNet32));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet76),
               .input2(s_logisimNet6),
               .result(s_logisimNet49));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet72),
               .input2(s_logisimNet6),
               .result(s_logisimNet37));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet32),
               .input2(s_logisimNet6),
               .result(s_logisimNet19));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet73),
               .input2(s_logisimNet6),
               .result(s_logisimNet44));

   NAND_GATE #(.BubblesMask(2'b11))
      GATES_9 (.input1(s_logisimNet23),
               .input2(s_logisimNet24),
               .result(s_logisimNet83));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_10 (.input1(s_logisimNet3),
                .input2(s_logisimNet66),
                .input3(s_logisimNet24),
                .result(s_logisimNet82));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_11 (.input1(s_logisimNet29),
                .input2(s_logisimNet24),
                .result(s_logisimNet34));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_12 (.input1(s_logisimNet3),
                .input2(s_logisimNet30),
                .input3(s_logisimNet24),
                .result(s_logisimNet63));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet12),
                .input2(s_logisimNet85),
                .result(s_logisimNet35));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet1),
                .input2(s_logisimNet43),
                .result(s_logisimNet68));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet82),
                .input2(s_logisimNet34),
                .result(s_logisimNet47));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet34),
                .input2(s_logisimNet63),
                .result(s_logisimNet54));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet18),
                .input2(s_logisimNet85),
                .result(s_logisimNet4));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet10),
                .input2(s_logisimNet43),
                .result(s_logisimNet45));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_19 (.input1(s_logisimNet35),
                .input2(s_logisimNet68),
                .result(s_logisimNet56));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_20 (.input1(s_logisimNet4),
                .input2(s_logisimNet45),
                .result(s_logisimNet40));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_21 (.input1(s_logisimNet9),
                .input2(s_logisimNet3),
                .result(s_logisimNet84));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_22 (.input1(s_logisimNet9),
                .input2(s_logisimNet29),
                .result(s_logisimNet78));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_23 (.input1(s_logisimNet9),
                .input2(s_logisimNet3),
                .result(s_logisimNet42));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_24 (.input1(s_logisimNet84),
                .input2(s_logisimNet6),
                .result(s_logisimNet74));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_25 (.input1(s_logisimNet78),
                .input2(s_logisimNet6),
                .result(s_logisimNet77));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_26 (.input1(s_logisimNet42),
                .input2(s_logisimNet6),
                .result(s_logisimNet67));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_27 (.input1(s_logisimNet9),
                .input2(s_logisimNet17),
                .input3(s_logisimNet21),
                .input4(s_logisimNet0),
                .result(s_logisimNet53));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet53),
                .input2(s_logisimNet6),
                .result(s_logisimNet27));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_29 (.input1(s_logisimNet15),
                .input2(s_logisimNet24),
                .input3(s_logisimNet51),
                .result(s_logisimNet62));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_30 (.input1(s_logisimNet9),
                .input2(s_logisimNet24),
                .result(s_logisimNet20));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_31 (.input1(s_logisimNet17),
                .input2(s_logisimNet24),
                .result(s_logisimNet7));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_32 (.input1(s_logisimNet15),
                .input2(s_logisimNet24),
                .input3(s_logisimNet52),
                .result(s_logisimNet39));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_33 (.input1(s_logisimNet62),
                .input2(s_logisimNet20),
                .input3(s_logisimNet7),
                .result(s_logisimNet80));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_34 (.input1(s_logisimNet7),
                .input2(s_logisimNet20),
                .input3(s_logisimNet39),
                .result(s_logisimNet60));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_35 (.input1(s_logisimNet9),
                .input2(s_logisimNet13),
                .input3(s_logisimNet61),
                .result(s_logisimNet41));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_36 (.input1(s_logisimNet41),
                .input2(s_logisimNet6),
                .result(s_logisimNet46));

   NAND_GATE #(.BubblesMask(2'b11))
      GATES_37 (.input1(s_logisimNet3),
                .input2(s_logisimNet24),
                .result(s_logisimNet8));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_38 (.input1(s_logisimNet9),
                .input2(s_logisimNet17),
                .input3(s_logisimNet15),
                .input4(s_logisimNet3),
                .result(s_logisimNet81));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_39 (.input1(s_logisimNet9),
                .input2(s_logisimNet3),
                .input3(s_logisimNet29),
                .result(s_logisimNet57));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_40 (.input1(s_logisimNet57),
                .input2(s_logisimNet6),
                .result(s_logisimNet55));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_41 (.input1(s_logisimNet81),
                .input2(s_logisimNet6),
                .result(s_logisimNet85));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_42 (.clock(s_logisimNet14),
                 .d(s_logisimNet56),
                 .preset(1'b0),
                 .q(s_logisimNet12),
                 .qBar(s_logisimNet52),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_43 (.clock(s_logisimNet14),
                 .d(s_logisimNet40),
                 .preset(1'b0),
                 .q(s_logisimNet18),
                 .qBar(s_logisimNet51),
                 .reset(1'b0),
                 .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   ND38GLP   GLP_LO (.A(s_logisimBus36[0]),
                     .B(s_logisimBus36[1]),
                     .C(s_logisimBus36[2]),
                     .G(s_logisimNet59),
                     .Z0(s_logisimNet9),
                     .Z1(s_logisimNet17),
                     .Z2(s_logisimNet21),
                     .Z3(s_logisimNet0),
                     .Z4(s_logisimNet15),
                     .Z5(s_logisimNet3),
                     .Z6(s_logisimNet23),
                     .Z7(s_logisimNet33));

   ND38GLP   GLP_HI (.A(s_logisimBus36[0]),
                     .B(s_logisimBus36[1]),
                     .C(s_logisimBus36[2]),
                     .G(s_logisimBus36[3]),
                     .Z0(s_logisimNet22),
                     .Z1(s_logisimNet29),
                     .Z2(s_logisimNet5),
                     .Z3(s_logisimNet28),
                     .Z4(s_logisimNet38),
                     .Z5(s_logisimNet13),
                     .Z6(s_logisimNet25),
                     .Z7(s_logisimNet61));

endmodule
