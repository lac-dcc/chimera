// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_CONDREG                                              **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_CONDREG( ACONDN,
                        CSBIT_11_0,
                        CSSCOND,
                        FS_6_3,
                        LCC_3_0,
                        LCSN,
                        MCLK,
                        TSEL_3_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [11:0] CSBIT_11_0;
   input        CSSCOND;
   input        LCSN;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       ACONDN;
   output [3:0] FS_6_3;
   output [3:0] LCC_3_0;
   output [3:0] TSEL_3_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0]  s_logisimBus16;
   wire [3:0]  s_logisimBus26;
   wire [11:0] s_logisimBus30;
   wire [3:0]  s_logisimBus33;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus30[11:0] = CSBIT_11_0;
   assign s_logisimNet29       = CSSCOND;
   assign s_logisimNet5        = LCSN;
   assign s_logisimNet7        = MCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ACONDN   = s_logisimNet39;
   assign FS_6_3   = s_logisimBus16[3:0];
   assign LCC_3_0  = s_logisimBus26[3:0];
   assign TSEL_3_0 = s_logisimBus33[3:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet29;

   // NOT Gate
   assign s_logisimBus33[0] = ~s_logisimNet9;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet5),
               .input2(s_logisimNet4),
               .result(s_logisimBus33[3]));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet5),
               .input2(s_logisimNet6),
               .result(s_logisimBus33[2]));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimBus33[2]),
               .input2(s_logisimBus33[1]),
               .result(s_logisimNet36));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet36),
               .input2(s_logisimNet21),
               .result(s_logisimNet18));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet18),
               .input2(s_logisimBus33[3]),
               .result(s_logisimNet39));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet5),
               .input2(s_logisimNet19),
               .result(s_logisimBus33[1]));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimBus33[1]),
               .input2(s_logisimNet9),
               .result(s_logisimNet21));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet5),
               .input2(s_logisimNet17),
               .result(s_logisimNet9));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   CSBIT10 (.CLK(s_logisimNet7),
                      .D(s_logisimBus30[10]),
                      .Q(s_logisimBus26[2]),
                      .QN(),
                      .TE(s_logisimNet1),
                      .TI(s_logisimBus26[2]));

   SCAN_FF   CSBIT9 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[9]),
                     .Q(s_logisimBus26[1]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus26[1]));

   SCAN_FF   CSBIT8 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[8]),
                     .Q(s_logisimBus26[0]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus26[0]));

   SCAN_FF   CSBIT7 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[7]),
                     .Q(),
                     .QN(s_logisimNet4),
                     .TE(s_logisimNet1),
                     .TI(s_logisimNet4));

   SCAN_FF   CSBIT6 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[6]),
                     .Q(s_logisimNet6),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimNet6));

   SCAN_FF   CSBIT5 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[5]),
                     .Q(s_logisimNet19),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimNet19));

   SCAN_FF   CSBIT4 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[4]),
                     .Q(s_logisimNet17),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimNet17));

   SCAN_FF   CSBIT3 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[3]),
                     .Q(s_logisimBus16[3]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus16[3]));

   SCAN_FF   CSBIT2 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[2]),
                     .Q(s_logisimBus16[2]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus16[2]));

   SCAN_FF   CSBIT1 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[1]),
                     .Q(s_logisimBus16[1]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus16[1]));

   SCAN_FF   CSBIT0 (.CLK(s_logisimNet7),
                     .D(s_logisimBus30[0]),
                     .Q(s_logisimBus16[0]),
                     .QN(),
                     .TE(s_logisimNet1),
                     .TI(s_logisimBus16[0]));

   SCAN_FF   CSBIT11 (.CLK(s_logisimNet7),
                      .D(s_logisimBus30[11]),
                      .Q(s_logisimBus26[3]),
                      .QN(),
                      .TE(s_logisimNet1),
                      .TI(s_logisimBus26[3]));

endmodule
