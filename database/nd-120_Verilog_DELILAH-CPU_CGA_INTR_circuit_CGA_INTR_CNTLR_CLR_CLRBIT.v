// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_CLR_CLRBIT                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_CLR_CLRBIT( BIT,
                                  DATA,
                                  DCDJ,
                                  DCDK,
                                  X0,
                                  X1,
                                  X2 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input DATA;
   input DCDJ;
   input DCDK;
   input X0;
   input X1;
   input X2;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output BIT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
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
   assign s_logisimNet0 = DCDJ;
   assign s_logisimNet1 = DCDK;
   assign s_logisimNet2 = X2;
   assign s_logisimNet6 = X0;
   assign s_logisimNet7 = X1;
   assign s_logisimNet8 = DATA;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BIT = s_logisimNet4;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet0),
               .input2(s_logisimNet1),
               .result(s_logisimNet5));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet0),
               .input2(s_logisimNet8),
               .result(s_logisimNet9));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_3 (.input1(s_logisimNet1),
               .input2(s_logisimNet6),
               .input3(s_logisimNet7),
               .input4(s_logisimNet2),
               .result(s_logisimNet3));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_4 (.input1(s_logisimNet5),
               .input2(s_logisimNet9),
               .input3(s_logisimNet3),
               .result(s_logisimNet4));


endmodule
