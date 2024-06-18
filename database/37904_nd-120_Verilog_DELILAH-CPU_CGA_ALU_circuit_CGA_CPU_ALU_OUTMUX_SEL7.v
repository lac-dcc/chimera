// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_CPU_ALU_OUTMUX_SEL7                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_CPU_ALU_OUTMUX_SEL7( D,
                                E_6_0,
                                SI_6_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [6:0] E_6_0;
   input [6:0] SI_6_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output D;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [6:0] s_logisimBus0;
   wire [6:0] s_logisimBus1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
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
   assign s_logisimBus0[6:0] = SI_6_0;
   assign s_logisimBus1[6:0] = E_6_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign D = s_logisimNet8;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus0[0]),
               .input2(s_logisimBus1[0]),
               .result(s_logisimNet5));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus0[1]),
               .input2(s_logisimBus1[1]),
               .result(s_logisimNet3));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus0[2]),
               .input2(s_logisimBus1[2]),
               .result(s_logisimNet2));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimBus0[3]),
               .input2(s_logisimBus1[3]),
               .result(s_logisimNet6));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus0[4]),
               .input2(s_logisimBus1[4]),
               .result(s_logisimNet4));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus0[5]),
               .input2(s_logisimBus1[5]),
               .result(s_logisimNet7));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimBus0[6]),
               .input2(s_logisimBus1[6]),
               .result(s_logisimNet23));

   OR_GATE_7_INPUTS #(.BubblesMask({3'b111, 4'hF}))
      GATES_8 (.input1(s_logisimNet5),
               .input2(s_logisimNet3),
               .input3(s_logisimNet2),
               .input4(s_logisimNet6),
               .input5(s_logisimNet4),
               .input6(s_logisimNet7),
               .input7(s_logisimNet23),
               .result(s_logisimNet8));


endmodule
