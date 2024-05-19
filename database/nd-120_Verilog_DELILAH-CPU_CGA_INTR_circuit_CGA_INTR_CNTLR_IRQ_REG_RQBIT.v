// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ_REG_RQBIT                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ_REG_RQBIT( CLR,
                                     CP,
                                     CPN,
                                     INR,
                                     PN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLR;
   input CP;
   input CPN;
   input PN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output INR;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
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
   assign s_logisimNet0  = CLR;
   assign s_logisimNet1  = CP;
   assign s_logisimNet10 = PN;
   assign s_logisimNet8  = CPN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign INR = s_logisimNet11;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet4 = ~s_logisimNet10;

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet4),
               .input2(s_logisimNet5),
               .result(s_logisimNet6));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet6),
               .input2(s_logisimNet7),
               .result(s_logisimNet2));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet3),
               .result(s_logisimNet9));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet8),
               .input2(s_logisimNet0),
               .result(s_logisimNet7));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet1),
                .d(s_logisimNet9),
                .preset(1'b0),
                .q(),
                .qBar(s_logisimNet11),
                .reset(1'b0),
                .tick(1'b1));


endmodule
