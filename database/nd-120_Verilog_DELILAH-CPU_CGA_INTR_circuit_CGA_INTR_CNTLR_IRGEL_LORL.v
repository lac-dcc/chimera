// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_IRGEL_LORL                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_IRGEL_LORL( D,
                                  E,
                                  LIENABN,
                                  LIRQ,
                                  LODET,
                                  LOGAS,
                                  LOGASN,
                                  LOPASSALL,
                                  LOVEC_2_0,
                                  LOVGES,
                                  LVE,
                                  MCLK,
                                  RDN,
                                  S );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       D;
   input       E;
   input       LODET;
   input [2:0] LOVEC_2_0;
   input       LOVGES;
   input       MCLK;
   input       RDN;
   input       S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output LIENABN;
   output LIRQ;
   output LOGAS;
   output LOGASN;
   output LOPASSALL;
   output LVE;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus4;
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
   wire       s_logisimNet3;
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
   assign s_logisimBus4[2:0] = LOVEC_2_0;
   assign s_logisimNet0      = D;
   assign s_logisimNet1      = RDN;
   assign s_logisimNet10     = E;
   assign s_logisimNet11     = MCLK;
   assign s_logisimNet7      = LODET;
   assign s_logisimNet8      = S;
   assign s_logisimNet9      = LOVGES;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LIENABN   = s_logisimNet19;
   assign LIRQ      = s_logisimNet17;
   assign LOGAS     = s_logisimNet16;
   assign LOGASN    = s_logisimNet15;
   assign LOPASSALL = s_logisimNet14;
   assign LVE       = s_logisimNet3;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimNet15;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet5;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimNet3),
               .input2(s_logisimBus4[2]),
               .input3(s_logisimBus4[1]),
               .input4(s_logisimBus4[0]),
               .result(s_logisimNet15));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet1),
               .input2(s_logisimNet7),
               .input3(s_logisimNet9),
               .result(s_logisimNet5));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_3 (.input1(s_logisimNet5),
               .input2(s_logisimNet12),
               .result(s_logisimNet17));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet5),
               .input2(s_logisimNet8),
               .result(s_logisimNet3));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   INT_REQ_ENABLE_FF (.CLK(s_logisimNet11),
                                .D(s_logisimNet10),
                                .Q(s_logisimNet6),
                                .QN(s_logisimNet12),
                                .TE(s_logisimNet0),
                                .TI(s_logisimNet6));

endmodule
