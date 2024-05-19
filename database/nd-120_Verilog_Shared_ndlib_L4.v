// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : L4                                                           **
 **                                                                          **
 *****************************************************************************/

module L4( A,
           B,
           C,
           D,
           L,
           QA,
           QAN,
           QB,
           QBN,
           QC,
           QCN,
           QD,
           QDN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input D;
   input L;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output QA;
   output QAN;
   output QB;
   output QBN;
   output QC;
   output QCN;
   output QD;
   output QDN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0 = A;
   assign s_logisimNet1 = B;
   assign s_logisimNet2 = C;
   assign s_logisimNet3 = D;
   assign s_logisimNet4 = L;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign QA  = s_logisimNet5;
   assign QAN = s_logisimNet6;
   assign QB  = s_logisimNet7;
   assign QBN = s_logisimNet8;
   assign QC  = s_logisimNet9;
   assign QCN = s_logisimNet10;
   assign QD  = s_logisimNet11;
   assign QDN = s_logisimNet12;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   LATCH   L0 (.D(s_logisimNet0),
               .ENABLE(s_logisimNet4),
               .Q(s_logisimNet5),
               .QN(s_logisimNet6));

   LATCH   L1 (.D(s_logisimNet1),
               .ENABLE(s_logisimNet4),
               .Q(s_logisimNet7),
               .QN(s_logisimNet8));

   LATCH   L2 (.D(s_logisimNet2),
               .ENABLE(s_logisimNet4),
               .Q(s_logisimNet9),
               .QN(s_logisimNet10));

   LATCH   L3 (.D(s_logisimNet3),
               .ENABLE(s_logisimNet4),
               .Q(s_logisimNet11),
               .QN(s_logisimNet12));

endmodule
