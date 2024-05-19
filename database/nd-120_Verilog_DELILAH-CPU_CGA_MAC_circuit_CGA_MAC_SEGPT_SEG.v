// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_SEGPT_SEG                                            **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_SEGPT_SEG( FIDB_7_0,
                          LLDSEG,
                          MCLKN,
                          SEGZN,
                          SEG_7_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [7:0] FIDB_7_0;
   input       LLDSEG;
   input       MCLKN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       SEGZN;
   output [7:0] SEG_7_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus3;
   wire [7:0] s_logisimBus36;
   wire [7:0] s_logisimBus4;
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
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet37;
   wire       s_logisimNet38;
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
   assign s_logisimBus3[7:0] = FIDB_7_0;
   assign s_logisimNet26     = MCLKN;
   assign s_logisimNet27     = LLDSEG;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign SEGZN   = s_logisimNet13;
   assign SEG_7_0 = s_logisimBus4[7:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_1 (.input1(s_logisimBus36[0]),
               .input2(s_logisimBus36[1]),
               .input3(s_logisimBus36[2]),
               .input4(s_logisimBus36[3]),
               .input5(s_logisimBus36[4]),
               .input6(s_logisimBus36[5]),
               .input7(s_logisimBus36[6]),
               .input8(s_logisimBus36[7]),
               .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet26),
               .input2(s_logisimNet27),
               .result(s_logisimNet0));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   L8   SEG_L (.A(s_logisimBus3[0]),
               .B(s_logisimBus3[1]),
               .C(s_logisimBus3[2]),
               .D(s_logisimBus3[3]),
               .E(s_logisimBus3[4]),
               .F(s_logisimBus3[5]),
               .G(s_logisimBus3[6]),
               .H(s_logisimBus3[7]),
               .L(s_logisimNet0),
               .QA(s_logisimBus4[0]),
               .QAN(s_logisimBus36[0]),
               .QB(s_logisimBus4[1]),
               .QBN(s_logisimBus36[1]),
               .QC(s_logisimBus4[2]),
               .QCN(s_logisimBus36[2]),
               .QD(s_logisimBus4[3]),
               .QDN(s_logisimBus36[3]),
               .QE(s_logisimBus4[4]),
               .QEN(s_logisimBus36[4]),
               .QF(s_logisimBus4[5]),
               .QFN(s_logisimBus36[5]),
               .QG(s_logisimBus4[6]),
               .QGN(s_logisimBus36[6]),
               .QH(s_logisimBus4[7]),
               .QHN(s_logisimBus36[7]));

endmodule
