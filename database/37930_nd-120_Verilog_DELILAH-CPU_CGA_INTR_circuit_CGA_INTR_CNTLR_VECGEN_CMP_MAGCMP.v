// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_CMP_MAGCMP                             **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_CMP_MAGCMP( S_2_0,
                                         VGES,
                                         V_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [2:0] S_2_0;
   input [2:0] V_2_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output VGES;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus17;
   wire [2:0] s_logisimBus18;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
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
   assign s_logisimBus17[2:0] = S_2_0;
   assign s_logisimBus18[2:0] = V_2_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign VGES = s_logisimNet9;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimBus18[1];

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimBus18[2];

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimBus17[1];

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimBus18[0];

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimBus17[2];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimNet16),
               .input2(s_logisimBus17[0]),
               .input3(s_logisimNet7),
               .input4(s_logisimNet2),
               .result(s_logisimNet13));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet2),
               .input2(s_logisimNet5),
               .input3(s_logisimBus17[1]),
               .result(s_logisimNet1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimBus17[2]),
               .result(s_logisimNet14));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_4 (.input1(s_logisimNet13),
               .input2(s_logisimNet1),
               .input3(s_logisimNet14),
               .result(s_logisimNet9));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus18[1]),
               .input2(s_logisimNet12),
               .result(s_logisimNet16));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus18[2]),
               .input2(s_logisimNet3),
               .result(s_logisimNet2));


endmodule
