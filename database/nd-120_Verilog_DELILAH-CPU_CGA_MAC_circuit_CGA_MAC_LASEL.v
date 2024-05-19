// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_LASEL                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_LASEL( A10,
                      A1617,
                      A1619,
                      A1819,
                      B1819,
                      B1821,
                      BB10,
                      C10,
                      CSMREQ,
                      D1617,
                      DOUBLE,
                      E1617,
                      EXMN,
                      F1617,
                      ICA_15_8,
                      LSHADOW,
                      MCLK,
                      PCR_15_7_2_0,
                      PEX,
                      PONI,
                      SEGZN,
                      SELPTN,
                      VEX );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        CSMREQ;
   input        DOUBLE;
   input        EXMN;
   input [15:0] ICA_15_8;
   input        MCLK;
   input [15:0] PCR_15_7_2_0;
   input        PEX;
   input        PONI;
   input        SEGZN;
   input        SELPTN;
   input        VEX;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output A10;
   output A1617;
   output A1619;
   output A1819;
   output B1819;
   output B1821;
   output BB10;
   output C10;
   output D1617;
   output E1617;
   output F1617;
   output LSHADOW;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus5;
   wire [15:0] s_logisimBus6;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
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
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus5[15:0] = ICA_15_8;
   assign s_logisimBus6[15:0] = PCR_15_7_2_0;
   assign s_logisimNet23      = CSMREQ;
   assign s_logisimNet24      = SELPTN;
   assign s_logisimNet25      = DOUBLE;
   assign s_logisimNet3       = EXMN;
   assign s_logisimNet37      = SEGZN;
   assign s_logisimNet4       = PONI;
   assign s_logisimNet42      = MCLK;
   assign s_logisimNet45      = VEX;
   assign s_logisimNet56      = PEX;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A10     = s_logisimNet19;
   assign A1617   = s_logisimNet52;
   assign A1619   = s_logisimNet21;
   assign A1819   = s_logisimNet50;
   assign B1819   = s_logisimNet20;
   assign B1821   = s_logisimNet51;
   assign BB10    = s_logisimNet40;
   assign C10     = s_logisimNet49;
   assign D1617   = s_logisimNet53;
   assign E1617   = s_logisimNet54;
   assign F1617   = s_logisimNet55;
   assign LSHADOW = s_logisimNet39;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet7  =  1'b1;


   // NOT Gate
   assign s_logisimNet44 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimNet43 = ~s_logisimNet12;

   // NOT Gate
   assign s_logisimNet22 = ~s_logisimNet2;

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet29 = ~s_logisimBus6[2];

   // NOT Gate
   assign s_logisimNet46 = ~s_logisimNet56;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet31;

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet14;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet24;

   // NOT Gate
   assign s_logisimNet8 = ~s_logisimNet35;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet14),
               .input2(s_logisimNet22),
               .result(s_logisimNet50));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet1),
               .input2(s_logisimNet44),
               .result(s_logisimNet51));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_3 (.input1(s_logisimNet1),
               .input2(s_logisimNet24),
               .input3(s_logisimNet8),
               .input4(s_logisimNet22),
               .result(s_logisimNet20));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_4 (.input1(s_logisimNet1),
               .input2(s_logisimNet8),
               .input3(s_logisimNet11),
               .input4(s_logisimNet22),
               .result(s_logisimNet21));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet14),
               .input2(s_logisimNet43),
               .result(s_logisimNet19));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet14),
               .input2(s_logisimNet12),
               .result(s_logisimNet40));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet1),
               .input2(s_logisimNet7),
               .result(s_logisimNet49));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet1),
               .input2(s_logisimNet56),
               .result(s_logisimNet52));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_9 (.input1(s_logisimNet1),
               .input2(s_logisimNet2),
               .input3(s_logisimNet11),
               .input4(s_logisimNet8),
               .result(s_logisimNet53));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_10 (.input1(s_logisimNet1),
                .input2(s_logisimNet8),
                .input3(s_logisimNet24),
                .result(s_logisimNet54));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet1),
                .input2(s_logisimNet45),
                .result(s_logisimNet55));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimNet16),
                .input2(s_logisimNet29),
                .result(s_logisimNet12));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimBus6[2]),
                .input2(s_logisimNet25),
                .result(s_logisimNet2));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimBus5[10]),
                .input2(s_logisimBus5[9]),
                .result(s_logisimNet48));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimNet12),
                .input2(s_logisimBus5[8]),
                .result(s_logisimNet33));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_16 (.input1(s_logisimBus5[15]),
                .input2(s_logisimBus5[14]),
                .input3(s_logisimBus5[13]),
                .input4(s_logisimBus5[12]),
                .input5(s_logisimBus5[11]),
                .result(s_logisimNet13));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimBus6[1]),
                .input2(s_logisimBus6[0]),
                .result(s_logisimNet34));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_18 (.input1(s_logisimNet33),
                .input2(s_logisimNet13),
                .result(s_logisimNet38));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_19 (.input1(s_logisimNet34),
                .input2(s_logisimNet4),
                .input3(s_logisimNet46),
                .result(s_logisimNet26));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_20 (.input1(s_logisimNet56),
                .input2(s_logisimNet37),
                .result(s_logisimNet30));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_21 (.input1(s_logisimNet2),
                .input2(s_logisimNet48),
                .result(s_logisimNet47));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_22 (.input1(s_logisimNet47),
                .input2(s_logisimNet38),
                .input3(s_logisimNet23),
                .input4(s_logisimNet26),
                .input5(s_logisimNet30),
                .result(s_logisimNet31));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_23 (.input1(s_logisimNet3),
                .input2(s_logisimNet23),
                .input3(s_logisimNet4),
                .result(s_logisimNet35));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_24 (.clock(s_logisimNet42),
                 .d(s_logisimNet1),
                 .preset(1'b0),
                 .q(),
                 .qBar(s_logisimNet39),
                 .reset(1'b0),
                 .tick(1'b1));


endmodule
