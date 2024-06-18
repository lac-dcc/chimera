// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_IRSRC                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_IRSRC( BINT10N,
                       BINT11N,
                       BINT12N,
                       BINT13N,
                       BINT15N,
                       EMPIDN,
                       FIDBO_15_0,
                       IOXERRN,
                       IREQ_15_0_N,
                       NORN,
                       PARERRN,
                       POWFAILN,
                       Z );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        BINT10N;
   input        BINT11N;
   input        BINT12N;
   input        BINT13N;
   input        BINT15N;
   input        EMPIDN;
   input [15:0] FIDBO_15_0;
   input        IOXERRN;
   input        NORN;
   input        PARERRN;
   input        POWFAILN;
   input        Z;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] IREQ_15_0_N;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus15;
   wire [15:0] s_logisimBus41;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
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
   wire        s_logisimNet37;
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
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus41[15:0] = FIDBO_15_0;
   assign s_logisimNet22       = IOXERRN;
   assign s_logisimNet23       = BINT12N;
   assign s_logisimNet32       = Z;
   assign s_logisimNet38       = BINT11N;
   assign s_logisimNet39       = POWFAILN;
   assign s_logisimNet49       = BINT10N;
   assign s_logisimNet5        = EMPIDN;
   assign s_logisimNet50       = NORN;
   assign s_logisimNet54       = BINT15N;
   assign s_logisimNet55       = PARERRN;
   assign s_logisimNet56       = BINT13N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign IREQ_15_0_N = s_logisimBus15[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet53 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimNet5;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus41[0]),
               .input2(s_logisimNet0),
               .result(s_logisimNet24));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus41[15]),
               .input2(s_logisimNet0),
               .result(s_logisimNet43));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus41[14]),
               .input2(s_logisimNet0),
               .result(s_logisimBus15[14]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus41[13]),
               .input2(s_logisimNet0),
               .result(s_logisimNet6));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus41[12]),
               .input2(s_logisimNet0),
               .result(s_logisimNet25));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus41[11]),
               .input2(s_logisimNet0),
               .result(s_logisimNet44));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimBus41[10]),
               .input2(s_logisimNet0),
               .result(s_logisimNet51));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimBus41[9]),
               .input2(s_logisimNet0),
               .result(s_logisimBus15[9]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimBus41[8]),
               .input2(s_logisimNet0),
               .result(s_logisimNet26));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimBus41[7]),
                .input2(s_logisimNet0),
                .result(s_logisimBus15[7]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimBus41[6]),
                .input2(s_logisimNet0),
                .result(s_logisimBus15[6]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimBus41[5]),
                .input2(s_logisimNet0),
                .result(s_logisimBus15[5]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimBus41[4]),
                .input2(s_logisimNet0),
                .result(s_logisimBus15[4]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimBus41[3]),
                .input2(s_logisimNet0),
                .result(s_logisimNet45));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimBus41[2]),
                .input2(s_logisimNet0),
                .result(s_logisimNet52));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimBus41[1]),
                .input2(s_logisimNet0),
                .result(s_logisimNet7));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_17 (.input1(s_logisimNet7),
                .input2(s_logisimNet38),
                .result(s_logisimBus15[1]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_18 (.input1(s_logisimNet24),
                .input2(s_logisimNet49),
                .result(s_logisimBus15[0]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_19 (.input1(s_logisimNet43),
                .input2(s_logisimNet54),
                .result(s_logisimBus15[15]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_20 (.input1(s_logisimNet6),
                .input2(s_logisimNet39),
                .result(s_logisimBus15[13]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_21 (.input1(s_logisimNet25),
                .input2(s_logisimNet50),
                .result(s_logisimBus15[12]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_22 (.input1(s_logisimNet44),
                .input2(s_logisimNet55),
                .result(s_logisimBus15[11]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_23 (.input1(s_logisimNet51),
                .input2(s_logisimNet22),
                .result(s_logisimBus15[10]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_24 (.input1(s_logisimNet26),
                .input2(s_logisimNet53),
                .result(s_logisimBus15[8]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_25 (.input1(s_logisimNet45),
                .input2(s_logisimNet56),
                .result(s_logisimBus15[3]));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_26 (.input1(s_logisimNet52),
                .input2(s_logisimNet23),
                .result(s_logisimBus15[2]));


endmodule
