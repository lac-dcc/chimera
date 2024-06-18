// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_STACK_BIT12                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_STACK_BIT12( DEEP,
                            LOAD,
                            MCLK,
                            S3,
                            S3N,
                            S4NS3N,
                            S4S3N,
                            SCLKN,
                            STIN,
                            STOUT );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input LOAD;
   input MCLK;
   input S3;
   input S3N;
   input S4NS3N;
   input S4S3N;
   input SCLKN;
   input STIN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output DEEP;
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
   assign s_logisimNet10 = S3N;
   assign s_logisimNet11 = LOAD;
   assign s_logisimNet13 = STIN;
   assign s_logisimNet15 = MCLK;
   assign s_logisimNet16 = SCLKN;
   assign s_logisimNet18 = S3;
   assign s_logisimNet22 = S4S3N;
   assign s_logisimNet9  = S4NS3N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DEEP  = s_logisimNet5;
   assign STOUT = s_logisimNet4;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet2),
               .input2(s_logisimNet22),
               .result(s_logisimNet12));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet4),
               .input2(s_logisimNet9),
               .result(s_logisimNet21));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet10),
               .result(s_logisimNet23));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet18),
               .input2(s_logisimNet6),
               .result(s_logisimNet0));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet10),
               .input2(s_logisimNet7),
               .result(s_logisimNet19));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet18),
               .input2(s_logisimNet7),
               .result(s_logisimNet8));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet10),
               .input2(s_logisimNet17),
               .result(s_logisimNet1));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_8 (.input1(s_logisimNet23),
               .input2(s_logisimNet12),
               .input3(s_logisimNet21),
               .result(s_logisimNet20));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimNet0),
               .input2(s_logisimNet19),
               .result(s_logisimNet14));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet8),
                .input2(s_logisimNet1),
                .result(s_logisimNet3));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_11 (.clock(s_logisimNet15),
                 .d(s_logisimNet13),
                 .preset(1'b0),
                 .q(s_logisimNet2),
                 .qBar(),
                 .reset(1'b0),
                 .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SR44   SR44_2 (.A(s_logisimNet20),
                  .B(s_logisimNet14),
                  .C(s_logisimNet3),
                  .CP(s_logisimNet16),
                  .D(s_logisimNet5),
                  .L(s_logisimNet11),
                  .QA(s_logisimNet4),
                  .QAN(),
                  .QB(),
                  .QBN(s_logisimNet6),
                  .QC(),
                  .QCN(s_logisimNet7),
                  .QD(s_logisimNet5),
                  .QDN(s_logisimNet17),
                  .SI(s_logisimNet2));

endmodule
