// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_STACK_BIT                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_STACK_BIT( CLK,
                          CLKN,
                          LOAD,
                          S3,
                          S3N,
                          S4NS3N,
                          S4S3N,
                          STIN,
                          STOUT );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input CLKN;
   input LOAD;
   input S3;
   input S3N;
   input S4NS3N;
   input S4S3N;
   input STIN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output STOUT;

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
   assign s_logisimNet11 = S3N;
   assign s_logisimNet15 = S3;
   assign s_logisimNet17 = CLKN;
   assign s_logisimNet19 = S4NS3N;
   assign s_logisimNet21 = CLK;
   assign s_logisimNet22 = STIN;
   assign s_logisimNet5  = LOAD;
   assign s_logisimNet9  = S4S3N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign STOUT = s_logisimNet0;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet10),
               .input2(s_logisimNet9),
               .result(s_logisimNet20));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet0),
               .input2(s_logisimNet19),
               .result(s_logisimNet14));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet11),
               .result(s_logisimNet13));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet15),
               .input2(s_logisimNet6),
               .result(s_logisimNet8));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet11),
               .input2(s_logisimNet1),
               .result(s_logisimNet2));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet15),
               .input2(s_logisimNet1),
               .result(s_logisimNet3));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet11),
               .input2(s_logisimNet12),
               .result(s_logisimNet18));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_8 (.input1(s_logisimNet13),
               .input2(s_logisimNet20),
               .input3(s_logisimNet14),
               .result(s_logisimNet23));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet8),
               .input2(s_logisimNet2),
               .result(s_logisimNet4));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet3),
                .input2(s_logisimNet18),
                .result(s_logisimNet16));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_11 (.clock(s_logisimNet21),
                 .d(s_logisimNet22),
                 .preset(1'b0),
                 .q(s_logisimNet10),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SR44   SR44_1 (.A(s_logisimNet23),
                  .B(s_logisimNet4),
                  .C(s_logisimNet16),
                  .CP(s_logisimNet17),
                  .D(s_logisimNet7),
                  .L(s_logisimNet5),
                  .QA(s_logisimNet0),
                  .QAN(),
                  .QB(),
                  .QBN(s_logisimNet6),
                  .QC(),
                  .QCN(s_logisimNet1),
                  .QD(s_logisimNet7),
                  .QDN(s_logisimNet12),
                  .SI(s_logisimNet10));

endmodule
