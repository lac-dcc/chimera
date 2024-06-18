// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : RMUX_Gates                                                   **
 **                                                                          **
 *****************************************************************************/

module RMUX_Gates( A,
                   D,
                   RA,
                   RD,
                   RN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input D;
   input RA;
   input RD;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output RN;

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

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet3 = A;
   assign s_logisimNet4 = RA;
   assign s_logisimNet5 = D;
   assign s_logisimNet6 = RD;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign RN = s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet3),
               .input2(s_logisimNet4),
               .result(s_logisimNet0));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet5),
               .input2(s_logisimNet6),
               .result(s_logisimNet1));

   NOR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet0),
               .input2(s_logisimNet1),
               .result(s_logisimNet2));


endmodule
