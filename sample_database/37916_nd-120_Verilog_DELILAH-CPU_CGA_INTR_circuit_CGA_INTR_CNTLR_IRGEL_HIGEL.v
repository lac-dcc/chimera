// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL_HIGEL                                   **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL_HIGEL( FIDB03,
                                   HIDET,
                                   HIENABN,
                                   HIGAS,
                                   HIGSN,
                                   L,
                                   LOGASN,
                                   M,
                                   MCLK,
                                   N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input FIDB03;
   input HIDET;
   input HIENABN;
   input HIGAS;
   input L;
   input LOGASN;
   input M;
   input MCLK;
   input N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output HIGSN;

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
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet11 = MCLK;
   assign s_logisimNet14 = HIENABN;
   assign s_logisimNet17 = HIDET;
   assign s_logisimNet18 = FIDB03;
   assign s_logisimNet19 = HIGAS;
   assign s_logisimNet3  = LOGASN;
   assign s_logisimNet4  = L;
   assign s_logisimNet5  = N;
   assign s_logisimNet8  = M;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIGSN = s_logisimNet2;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet17;

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet8;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_logisimNet18),
               .input2(s_logisimNet4),
               .input3(s_logisimNet8),
               .result(s_logisimNet9));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet3),
               .input2(s_logisimNet4),
               .input3(s_logisimNet13),
               .result(s_logisimNet7));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet3),
               .input2(s_logisimNet6),
               .input3(s_logisimNet5),
               .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet19),
               .input2(s_logisimNet5),
               .result(s_logisimNet1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet14),
               .input2(s_logisimNet5),
               .result(s_logisimNet15));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_6 (.input1(s_logisimNet12),
               .input2(s_logisimNet8),
               .input3(s_logisimNet2),
               .result(s_logisimNet10));

   OR_GATE_6_INPUTS #(.BubblesMask({2'b11, 4'hF}))
      GATES_7 (.input1(s_logisimNet9),
               .input2(s_logisimNet7),
               .input3(s_logisimNet0),
               .input4(s_logisimNet1),
               .input5(s_logisimNet15),
               .input6(s_logisimNet10),
               .result(s_logisimNet16));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_8 (.clock(s_logisimNet11),
                .d(s_logisimNet16),
                .preset(1'b0),
                .q(s_logisimNet2),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));


endmodule
