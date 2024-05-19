// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ_MREQ                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ_MREQ( LREQ_15_0,
                                MIREQ_15_0,
                                PICMASK_15_0_N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] LREQ_15_0;
   input [15:0] PICMASK_15_0_N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] MIREQ_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus32;
   wire [15:0] s_logisimBus48;
   wire [15:0] s_logisimBus50;
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
   wire        s_logisimNet49;
   wire        s_logisimNet5;
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
   assign s_logisimBus32[15:0] = PICMASK_15_0_N;
   assign s_logisimBus48[15:0] = LREQ_15_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign MIREQ_15_0 = s_logisimBus50[15:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus48[2]),
               .input2(s_logisimBus32[2]),
               .result(s_logisimBus50[2]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus48[1]),
               .input2(s_logisimBus32[1]),
               .result(s_logisimBus50[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus48[0]),
               .input2(s_logisimBus32[0]),
               .result(s_logisimBus50[0]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus48[15]),
               .input2(s_logisimBus32[15]),
               .result(s_logisimBus50[15]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus48[14]),
               .input2(s_logisimBus32[14]),
               .result(s_logisimBus50[14]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus48[13]),
               .input2(s_logisimBus32[13]),
               .result(s_logisimBus50[13]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimBus48[12]),
               .input2(s_logisimBus32[12]),
               .result(s_logisimBus50[12]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimBus48[11]),
               .input2(s_logisimBus32[11]),
               .result(s_logisimBus50[11]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimBus48[10]),
               .input2(s_logisimBus32[10]),
               .result(s_logisimBus50[10]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimBus48[9]),
                .input2(s_logisimBus32[9]),
                .result(s_logisimBus50[9]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimBus48[8]),
                .input2(s_logisimBus32[8]),
                .result(s_logisimBus50[8]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimBus48[7]),
                .input2(s_logisimBus32[7]),
                .result(s_logisimBus50[7]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimBus48[6]),
                .input2(s_logisimBus32[6]),
                .result(s_logisimBus50[6]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimBus48[5]),
                .input2(s_logisimBus32[5]),
                .result(s_logisimBus50[5]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimBus48[4]),
                .input2(s_logisimBus32[4]),
                .result(s_logisimBus50[4]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimBus48[3]),
                .input2(s_logisimBus32[3]),
                .result(s_logisimBus50[3]));


endmodule
