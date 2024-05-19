// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL_HIRL                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL_HIRL( D,
                                  E,
                                  H,
                                  HIDET,
                                  HIENABN,
                                  HIGAS,
                                  HIGSN,
                                  HIPASSALL,
                                  HIRQ,
                                  HIVEC_2_0,
                                  HIVGES,
                                  HVE,
                                  MCLK,
                                  PD,
                                  RDN,
                                  S );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       D;
   input       E;
   input       H;
   input       HIDET;
   input       HIGSN;
   input [2:0] HIVEC_2_0;
   input       HIVGES;
   input       MCLK;
   input       S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output HIENABN;
   output HIGAS;
   output HIPASSALL;
   output HIRQ;
   output HVE;
   output PD;
   output RDN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus3;
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
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
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
   assign s_logisimBus3[2:0] = HIVEC_2_0;
   assign s_logisimNet10     = D;
   assign s_logisimNet11     = HIVGES;
   assign s_logisimNet12     = S;
   assign s_logisimNet16     = HIDET;
   assign s_logisimNet21     = H;
   assign s_logisimNet22     = E;
   assign s_logisimNet5      = MCLK;
   assign s_logisimNet9      = HIGSN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIENABN   = s_logisimNet0;
   assign HIGAS     = s_logisimNet8;
   assign HIPASSALL = s_logisimNet19;
   assign HIRQ      = s_logisimNet15;
   assign HVE       = s_logisimNet6;
   assign PD        = s_logisimNet18;
   assign RDN       = s_logisimNet20;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet8 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimNet6),
               .input2(s_logisimBus3[2]),
               .input3(s_logisimBus3[1]),
               .input4(s_logisimBus3[0]),
               .result(s_logisimNet1));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet16),
               .input2(s_logisimNet11),
               .result(s_logisimNet14));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet11),
               .input2(s_logisimNet16),
               .input3(s_logisimNet7),
               .result(s_logisimNet2));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet9),
               .input2(s_logisimNet14),
               .result(s_logisimNet18));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_5 (.input1(s_logisimNet7),
               .input2(s_logisimNet9),
               .input3(s_logisimNet14),
               .result(s_logisimNet20));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_6 (.input1(s_logisimNet2),
               .input2(s_logisimNet24),
               .result(s_logisimNet15));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_7 (.input1(s_logisimNet2),
               .input2(s_logisimNet12),
               .result(s_logisimNet6));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   STATUS_OVERFLOW_FF (.CLK(s_logisimNet5),
                                 .D(s_logisimNet7),
                                 .Q(s_logisimNet7),
                                 .QN(s_logisimNet0),
                                 .TE(s_logisimNet21),
                                 .TI(s_logisimNet1));

   SCAN_FF   INT_REQ_ENABLE_FF (.CLK(s_logisimNet5),
                                .D(s_logisimNet22),
                                .Q(s_logisimNet4),
                                .QN(s_logisimNet24),
                                .TE(s_logisimNet10),
                                .TI(s_logisimNet4));

endmodule
