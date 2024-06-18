// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_OSMUX                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_OSMUX( HIGSN,
                                    HISTAT_2_0,
                                    LOGSN,
                                    LOSTAT_2_0,
                                    OESN,
                                    PICS_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       HIGSN;
   input [2:0] HISTAT_2_0;
   input       LOGSN;
   input [2:0] LOSTAT_2_0;
   input       OESN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] PICS_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus13;
   wire [2:0] s_logisimBus14;
   wire [2:0] s_logisimBus8;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus13[2:0] = HISTAT_2_0;
   assign s_logisimBus14[2:0] = LOSTAT_2_0;
   assign s_logisimNet12      = HIGSN;
   assign s_logisimNet16      = LOGSN;
   assign s_logisimNet6       = OESN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PICS_2_0 = s_logisimBus8[2:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet7),
               .input2(s_logisimNet21),
               .result(s_logisimBus8[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet2),
               .input2(s_logisimBus13[0]),
               .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet4),
               .input2(s_logisimBus14[0]),
               .result(s_logisimNet18));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet0),
               .input2(s_logisimNet18),
               .result(s_logisimBus8[0]));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_5 (.input1(s_logisimNet12),
               .input2(s_logisimNet6),
               .result(s_logisimNet2));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_6 (.input1(s_logisimNet6),
               .input2(s_logisimNet16),
               .result(s_logisimNet4));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet2),
               .input2(s_logisimBus13[2]),
               .result(s_logisimNet5));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet4),
               .input2(s_logisimBus14[2]),
               .result(s_logisimNet22));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_9 (.input1(s_logisimNet5),
               .input2(s_logisimNet22),
               .result(s_logisimBus8[2]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimNet2),
                .input2(s_logisimBus13[1]),
                .result(s_logisimNet7));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimNet4),
                .input2(s_logisimBus14[1]),
                .result(s_logisimNet21));


endmodule
