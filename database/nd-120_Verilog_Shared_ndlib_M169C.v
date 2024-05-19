// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : M169C                                                        **
 **                                                                          **
 *****************************************************************************/

module M169C( A,
              B,
              C,
              CON,
              CP,
              D,
              NL,
              PN,
              QA,
              QB,
              QC,
              QD,
              TN,
              UP );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input CP;
   input D;
   input NL;
   input PN;
   input TN;
   input UP;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output CON;
   output QA;
   output QB;
   output QC;
   output QD;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_logisimNet21;
   wire s_logisimNet22;
   wire s_logisimNet23;
   wire s_logisimNet24;
   wire s_logisimNet25;
   wire s_logisimNet26;
   wire s_logisimNet27;
   wire s_logisimNet28;
   wire s_logisimNet29;
   wire s_logisimNet3;
   wire s_logisimNet30;
   wire s_logisimNet31;
   wire s_logisimNet32;
   wire s_logisimNet33;
   wire s_logisimNet34;
   wire s_logisimNet35;
   wire s_logisimNet36;
   wire s_logisimNet37;
   wire s_logisimNet38;
   wire s_logisimNet39;
   wire s_logisimNet4;
   wire s_logisimNet40;
   wire s_logisimNet41;
   wire s_logisimNet42;
   wire s_logisimNet43;
   wire s_logisimNet44;
   wire s_logisimNet45;
   wire s_logisimNet46;
   wire s_logisimNet47;
   wire s_logisimNet48;
   wire s_logisimNet49;
   wire s_logisimNet5;
   wire s_logisimNet50;
   wire s_logisimNet51;
   wire s_logisimNet52;
   wire s_logisimNet53;
   wire s_logisimNet54;
   wire s_logisimNet55;
   wire s_logisimNet56;
   wire s_logisimNet57;
   wire s_logisimNet58;
   wire s_logisimNet59;
   wire s_logisimNet6;
   wire s_logisimNet60;
   wire s_logisimNet61;
   wire s_logisimNet62;
   wire s_logisimNet63;
   wire s_logisimNet64;
   wire s_logisimNet65;
   wire s_logisimNet66;
   wire s_logisimNet67;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet13 = CP;
   assign s_logisimNet20 = UP;
   assign s_logisimNet32 = TN;
   assign s_logisimNet40 = C;
   assign s_logisimNet47 = A;
   assign s_logisimNet57 = B;
   assign s_logisimNet60 = PN;
   assign s_logisimNet61 = NL;
   assign s_logisimNet62 = D;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CON = s_logisimNet24;
   assign QA  = s_logisimNet65;
   assign QB  = s_logisimNet45;
   assign QC  = s_logisimNet55;
   assign QD  = s_logisimNet53;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimNet13;

   // NOT Gate
   assign s_logisimNet35 = ~s_logisimNet49;

   // NOT Gate
   assign s_logisimNet63 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet59 = ~s_logisimNet66;

   // NOT Gate
   assign s_logisimNet21 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet42 = ~s_logisimNet58;

   // NOT Gate
   assign s_logisimNet67 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet64 = ~s_logisimNet9;

   // NOT Gate
   assign s_logisimNet36 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet65 = ~s_logisimNet28;

   // NOT Gate
   assign s_logisimNet45 = ~s_logisimNet33;

   // NOT Gate
   assign s_logisimNet55 = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimNet53 = ~s_logisimNet41;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet20;

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet61;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet3),
               .input2(s_logisimNet61),
               .result(s_logisimNet50));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet15),
               .input2(s_logisimNet61),
               .result(s_logisimNet8));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet37),
               .input2(s_logisimNet4),
               .result(s_logisimNet48));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet10),
               .input2(s_logisimNet61),
               .result(s_logisimNet54));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_5 (.input1(s_logisimNet37),
               .input2(s_logisimNet4),
               .input3(s_logisimNet17),
               .result(s_logisimNet34));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet23),
               .input2(s_logisimNet61),
               .result(s_logisimNet14));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_7 (.input1(s_logisimNet37),
               .input2(s_logisimNet4),
               .input3(s_logisimNet17),
               .input4(s_logisimNet43),
               .result(s_logisimNet26));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet29),
               .input2(s_logisimNet44),
               .result(s_logisimNet4));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet19),
               .input2(s_logisimNet6),
               .result(s_logisimNet17));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet12),
                .input2(s_logisimNet52),
                .result(s_logisimNet43));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet31),
                .input2(s_logisimNet0),
                .result(s_logisimNet46));

   XOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet50),
                .input2(s_logisimNet37),
                .result(s_logisimNet22));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimNet5),
                .input2(s_logisimNet47),
                .result(s_logisimNet30));

   XOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet8),
                .input2(s_logisimNet48),
                .result(s_logisimNet51));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet5),
                .input2(s_logisimNet57),
                .result(s_logisimNet18));

   XOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimNet54),
                .input2(s_logisimNet34),
                .result(s_logisimNet38));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimNet5),
                .input2(s_logisimNet40),
                .result(s_logisimNet39));

   XOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet14),
                .input2(s_logisimNet26),
                .result(s_logisimNet16));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimNet5),
                .input2(s_logisimNet62),
                .result(s_logisimNet27));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimNet20),
                .input2(s_logisimNet28),
                .result(s_logisimNet29));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_21 (.input1(s_logisimNet11),
                .input2(s_logisimNet3),
                .result(s_logisimNet44));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_22 (.input1(s_logisimNet20),
                .input2(s_logisimNet33),
                .result(s_logisimNet19));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_23 (.input1(s_logisimNet11),
                .input2(s_logisimNet15),
                .result(s_logisimNet6));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_24 (.input1(s_logisimNet20),
                .input2(s_logisimNet7),
                .result(s_logisimNet12));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_25 (.input1(s_logisimNet11),
                .input2(s_logisimNet10),
                .result(s_logisimNet52));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_26 (.input1(s_logisimNet20),
                .input2(s_logisimNet41),
                .result(s_logisimNet31));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_27 (.input1(s_logisimNet11),
                .input2(s_logisimNet23),
                .result(s_logisimNet0));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_28 (.input1(s_logisimNet22),
                .input2(s_logisimNet30),
                .result(s_logisimNet49));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_29 (.input1(s_logisimNet51),
                .input2(s_logisimNet18),
                .result(s_logisimNet66));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_30 (.input1(s_logisimNet38),
                .input2(s_logisimNet39),
                .result(s_logisimNet58));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_31 (.input1(s_logisimNet16),
                .input2(s_logisimNet27),
                .result(s_logisimNet9));

   AND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_32 (.input1(s_logisimNet46),
                .input2(s_logisimNet43),
                .input3(s_logisimNet17),
                .input4(s_logisimNet1),
                .input5(s_logisimNet20),
                .input6(1'b1),
                .result(s_logisimNet56));

   AND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_33 (.input1(s_logisimNet11),
                .input2(s_logisimNet1),
                .input3(s_logisimNet4),
                .input4(s_logisimNet17),
                .input5(s_logisimNet43),
                .input6(s_logisimNet46),
                .result(s_logisimNet2));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_34 (.input1(s_logisimNet56),
                .input2(s_logisimNet2),
                .result(s_logisimNet24));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_35 (.input1(s_logisimNet60),
                .input2(s_logisimNet32),
                .input3(s_logisimNet5),
                .result(s_logisimNet37));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_36 (.clock(s_logisimNet63),
                 .d(s_logisimNet35),
                 .preset(1'b0),
                 .q(s_logisimNet3),
                 .qBar(s_logisimNet28),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_37 (.clock(s_logisimNet21),
                 .d(s_logisimNet59),
                 .preset(1'b0),
                 .q(s_logisimNet15),
                 .qBar(s_logisimNet33),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_38 (.clock(s_logisimNet67),
                 .d(s_logisimNet42),
                 .preset(1'b0),
                 .q(s_logisimNet10),
                 .qBar(s_logisimNet7),
                 .reset(1'b0),
                 .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_39 (.clock(s_logisimNet36),
                 .d(s_logisimNet64),
                 .preset(1'b0),
                 .q(s_logisimNet23),
                 .qBar(s_logisimNet41),
                 .reset(1'b0),
                 .tick(1'b1));


endmodule
