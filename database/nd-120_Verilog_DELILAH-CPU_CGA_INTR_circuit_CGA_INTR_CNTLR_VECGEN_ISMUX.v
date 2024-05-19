// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_ISMUX                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_ISMUX( FIDBO_2_0,
                                    HIGSN,
                                    HISIN_2_0,
                                    HISTAT_2_0,
                                    LOGSN,
                                    LOSIN_2_0,
                                    LOSTAT_2_0,
                                    OESN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [2:0] FIDBO_2_0;
   input       HIGSN;
   input [2:0] HISTAT_2_0;
   input       LOGSN;
   input [2:0] LOSTAT_2_0;
   input       OESN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] HISIN_2_0;
   output [2:0] LOSIN_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus11;
   wire [2:0] s_logisimBus17;
   wire [2:0] s_logisimBus27;
   wire [2:0] s_logisimBus28;
   wire [2:0] s_logisimBus30;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
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
   assign s_logisimBus11[2:0] = LOSTAT_2_0;
   assign s_logisimBus27[2:0] = FIDBO_2_0;
   assign s_logisimBus28[2:0] = HISTAT_2_0;
   assign s_logisimNet12      = LOGSN;
   assign s_logisimNet22      = OESN;
   assign s_logisimNet32      = HIGSN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HISIN_2_0 = s_logisimBus30[2:0];
   assign LOSIN_2_0 = s_logisimBus17[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet22;

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimNet9 = ~s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet37),
               .input2(s_logisimNet38),
               .result(s_logisimBus17[2]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_2 (.input1(s_logisimNet20),
               .input2(s_logisimNet21),
               .result(s_logisimBus17[1]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_3 (.input1(s_logisimNet39),
               .input2(s_logisimNet40),
               .result(s_logisimBus17[0]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet33),
               .input2(s_logisimNet34),
               .result(s_logisimBus30[2]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_5 (.input1(s_logisimNet18),
               .input2(s_logisimNet19),
               .result(s_logisimBus30[1]));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_6 (.input1(s_logisimNet35),
               .input2(s_logisimNet36),
               .result(s_logisimBus30[0]));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_7 (.input1(s_logisimNet12),
               .input2(s_logisimNet22),
               .result(s_logisimNet2));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet13),
               .input2(s_logisimNet14),
               .result(s_logisimNet3));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_9 (.input1(s_logisimBus11[2]),
               .input2(s_logisimNet2),
               .result(s_logisimNet37));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_10 (.input1(s_logisimBus27[2]),
                .input2(s_logisimNet9),
                .result(s_logisimNet38));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimBus11[1]),
                .input2(s_logisimNet2),
                .result(s_logisimNet20));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_12 (.input1(s_logisimBus27[1]),
                .input2(s_logisimNet9),
                .result(s_logisimNet21));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_13 (.input1(s_logisimBus11[0]),
                .input2(s_logisimNet2),
                .result(s_logisimNet39));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimBus27[0]),
                .input2(s_logisimNet9),
                .result(s_logisimNet40));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_15 (.input1(s_logisimBus28[2]),
                .input2(s_logisimNet3),
                .result(s_logisimNet33));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_16 (.input1(s_logisimBus27[2]),
                .input2(s_logisimNet1),
                .result(s_logisimNet34));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_17 (.input1(s_logisimBus28[1]),
                .input2(s_logisimNet3),
                .result(s_logisimNet18));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimBus27[1]),
                .input2(s_logisimNet1),
                .result(s_logisimNet19));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_19 (.input1(s_logisimBus28[0]),
                .input2(s_logisimNet3),
                .result(s_logisimNet35));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_20 (.input1(s_logisimBus27[0]),
                .input2(s_logisimNet1),
                .result(s_logisimNet36));


endmodule
