// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL_VMUX                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL_VMUX( HIVEC_2_0,
                                  HVE,
                                  LOVEC_2_0,
                                  LVE,
                                  PICV_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [2:0] HIVEC_2_0;
   input       HVE;
   input [2:0] LOVEC_2_0;
   input       LVE;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] PICV_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus17;
   wire [2:0] s_logisimBus18;
   wire [2:0] s_logisimBus19;
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
   assign s_logisimBus17[2:0] = HIVEC_2_0;
   assign s_logisimBus18[2:0] = LOVEC_2_0;
   assign s_logisimNet0       = LVE;
   assign s_logisimNet7       = HVE;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PICV_2_0 = s_logisimBus19[2:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet9),
               .input2(s_logisimNet10),
               .result(s_logisimBus19[0]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus17[2]),
               .input2(s_logisimNet7),
               .result(s_logisimNet11));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus18[2]),
               .input2(s_logisimNet0),
               .result(s_logisimNet12));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet11),
               .input2(s_logisimNet12),
               .result(s_logisimBus19[2]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimBus17[1]),
               .input2(s_logisimNet7),
               .result(s_logisimNet13));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimBus18[1]),
               .input2(s_logisimNet0),
               .result(s_logisimNet14));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_7 (.input1(s_logisimNet13),
               .input2(s_logisimNet14),
               .result(s_logisimBus19[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimBus17[0]),
               .input2(s_logisimNet7),
               .result(s_logisimNet9));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimBus18[0]),
               .input2(s_logisimNet0),
               .result(s_logisimNet10));


endmodule
