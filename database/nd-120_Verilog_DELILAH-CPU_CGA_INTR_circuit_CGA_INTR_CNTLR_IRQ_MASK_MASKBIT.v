// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRQ_MASK_MASKBIT                              **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRQ_MASK_MASKBIT( CLOCK,
                                        DATAIN,
                                        DCDA,
                                        DCDB,
                                        DCDCN,
                                        MSK,
                                        MSKN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLOCK;
   input DATAIN;
   input DCDA;
   input DCDB;
   input DCDCN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output MSK;
   output MSKN;

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
   assign s_logisimNet0  = DCDCN;
   assign s_logisimNet10 = DATAIN;
   assign s_logisimNet4  = CLOCK;
   assign s_logisimNet7  = DCDB;
   assign s_logisimNet9  = DCDA;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign MSK  = s_logisimNet6;
   assign MSKN = s_logisimNet1;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet6),
               .input2(s_logisimNet9),
               .result(s_logisimNet3));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet10),
               .input2(s_logisimNet7),
               .result(s_logisimNet11));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet7),
               .input2(s_logisimNet1),
               .input3(s_logisimNet0),
               .result(s_logisimNet5));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_4 (.input1(s_logisimNet3),
               .input2(s_logisimNet11),
               .input3(s_logisimNet5),
               .result(s_logisimNet2));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet2),
               .input2(s_logisimNet0),
               .result(s_logisimNet8));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet4),
                .d(s_logisimNet8),
                .preset(1'b0),
                .q(s_logisimNet1),
                .qBar(s_logisimNet6),
                .reset(1'b0),
                .tick(1'b1));


endmodule
