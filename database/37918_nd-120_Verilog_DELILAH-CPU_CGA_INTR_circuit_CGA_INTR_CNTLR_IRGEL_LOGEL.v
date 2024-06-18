// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL_LOGEL                                   **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL_LOGEL( FIDB04,
                                   L,
                                   LIENABN,
                                   LOGAS,
                                   LOGSN,
                                   M,
                                   MCLK,
                                   N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input FIDB04;
   input L;
   input LIENABN;
   input LOGAS;
   input M;
   input MCLK;
   input N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output LOGSN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
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
   assign s_logisimNet10 = FIDB04;
   assign s_logisimNet11 = LOGAS;
   assign s_logisimNet12 = LIENABN;
   assign s_logisimNet2  = M;
   assign s_logisimNet4  = N;
   assign s_logisimNet7  = MCLK;
   assign s_logisimNet8  = L;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LOGSN = s_logisimNet1;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet8;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_1 (.input1(s_logisimNet10),
               .input2(s_logisimNet8),
               .input3(s_logisimNet2),
               .result(s_logisimNet5));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet11),
               .input2(s_logisimNet4),
               .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet12),
               .input2(s_logisimNet4),
               .result(s_logisimNet9));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_4 (.input1(s_logisimNet3),
               .input2(s_logisimNet2),
               .input3(s_logisimNet1),
               .result(s_logisimNet6));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_5 (.input1(s_logisimNet5),
               .input2(s_logisimNet0),
               .input3(s_logisimNet9),
               .input4(s_logisimNet6),
               .result(s_logisimNet13));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet7),
                .d(s_logisimNet13),
                .preset(1'b0),
                .q(s_logisimNet1),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));


endmodule
