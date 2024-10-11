// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_IDBCTL_SEL6                                              **
 **                                                                          **
 *****************************************************************************/

module CGA_IDBCTL_SEL6( D,
                        D0,
                        E_PINS,
                        M,
                        PCR,
                        PGS,
                        S,
                        V );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       D;
   input [5:0] E_PINS;
   input       M;
   input       PCR;
   input       PGS;
   input       S;
   input       V;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output D0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [5:0] s_logisimBus19;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus19[5:0] = E_PINS;
   assign s_logisimNet2       = D;
   assign s_logisimNet3       = M;
   assign s_logisimNet4       = V;
   assign s_logisimNet5       = S;
   assign s_logisimNet6       = PCR;
   assign s_logisimNet7       = PGS;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign D0 = s_logisimNet18;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet2),
               .input2(s_logisimBus19[5]),
               .result(s_logisimNet13));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet3),
               .input2(s_logisimBus19[4]),
               .result(s_logisimNet11));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet4),
               .input2(s_logisimBus19[3]),
               .result(s_logisimNet1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet5),
               .input2(s_logisimBus19[2]),
               .result(s_logisimNet15));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet6),
               .input2(s_logisimBus19[1]),
               .result(s_logisimNet12));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet7),
               .input2(s_logisimBus19[0]),
               .result(s_logisimNet17));

   OR_GATE_6_INPUTS #(.BubblesMask({2'b11, 4'hF}))
      GATES_7 (.input1(s_logisimNet13),
               .input2(s_logisimNet11),
               .input3(s_logisimNet1),
               .input4(s_logisimNet15),
               .input5(s_logisimNet12),
               .input6(s_logisimNet17),
               .result(s_logisimNet18));


endmodule
