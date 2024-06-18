// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_SEGPT_XPT                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_SEGPT_XPT( EXMN,
                          FIDBO_2_0,
                          LLDEXM,
                          MCLKN,
                          PEX,
                          VEX,
                          XPT_1_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       EXMN;
   input [2:0] FIDBO_2_0;
   input       LLDEXM;
   input       MCLKN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       PEX;
   output       VEX;
   output [1:0] XPT_1_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus1;
   wire [2:0] s_logisimBus2;
   wire       s_logisimNet0;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
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
   assign s_logisimBus2[2:0] = FIDBO_2_0;
   assign s_logisimNet12     = MCLKN;
   assign s_logisimNet13     = LLDEXM;
   assign s_logisimNet15     = EXMN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PEX     = s_logisimNet8;
   assign VEX     = s_logisimNet7;
   assign XPT_1_0 = s_logisimBus1[1:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet15;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet12),
               .input2(s_logisimNet13),
               .result(s_logisimNet14));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet3),
               .input2(s_logisimNet0),
               .result(s_logisimNet7));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet3),
               .result(s_logisimNet8));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   L4   XPT_L (.A(s_logisimBus2[0]),
               .B(s_logisimBus2[1]),
               .C(s_logisimBus2[2]),
               .D(1'b0),
               .L(s_logisimNet14),
               .QA(s_logisimBus1[0]),
               .QAN(),
               .QB(s_logisimBus1[1]),
               .QBN(),
               .QC(s_logisimNet0),
               .QCN(s_logisimNet6),
               .QD(),
               .QDN());

endmodule
