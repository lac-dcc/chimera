// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : L8                                                           **
 **                                                                          **
 *****************************************************************************/

module L8( A,
           B,
           C,
           D,
           E,
           F,
           G,
           H,
           L,
           QA,
           QAN,
           QB,
           QBN,
           QC,
           QCN,
           QD,
           QDN,
           QE,
           QEN,
           QF,
           QFN,
           QG,
           QGN,
           QH,
           QHN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input D;
   input E;
   input F;
   input G;
   input H;
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
   output QE;
   output QEN;
   output QF;
   output QFN;
   output QG;
   output QGN;
   output QH;
   output QHN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
   wire s_logisimNet19;
   wire s_logisimNet2;
   wire s_logisimNet20;
   wire s_logisimNet21;
   wire s_logisimNet22;
   wire s_logisimNet23;
   wire s_logisimNet24;
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
   assign s_logisimNet0 = H;
   assign s_logisimNet1 = A;
   assign s_logisimNet2 = B;
   assign s_logisimNet3 = C;
   assign s_logisimNet4 = D;
   assign s_logisimNet5 = E;
   assign s_logisimNet6 = F;
   assign s_logisimNet7 = G;
   assign s_logisimNet9 = L;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign QA  = s_logisimNet24;
   assign QAN = s_logisimNet8;
   assign QB  = s_logisimNet22;
   assign QBN = s_logisimNet23;
   assign QC  = s_logisimNet20;
   assign QCN = s_logisimNet21;
   assign QD  = s_logisimNet18;
   assign QDN = s_logisimNet19;
   assign QE  = s_logisimNet16;
   assign QEN = s_logisimNet17;
   assign QF  = s_logisimNet14;
   assign QFN = s_logisimNet15;
   assign QG  = s_logisimNet12;
   assign QGN = s_logisimNet13;
   assign QH  = s_logisimNet10;
   assign QHN = s_logisimNet11;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   LATCH   L7 (.D(s_logisimNet0),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet10),
               .QN(s_logisimNet11));

   LATCH   L0 (.D(s_logisimNet1),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet24),
               .QN(s_logisimNet8));

   LATCH   L1 (.D(s_logisimNet2),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet22),
               .QN(s_logisimNet23));

   LATCH   L2 (.D(s_logisimNet3),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet20),
               .QN(s_logisimNet21));

   LATCH   L3 (.D(s_logisimNet4),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet18),
               .QN(s_logisimNet19));

   LATCH   L4 (.D(s_logisimNet5),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet16),
               .QN(s_logisimNet17));

   LATCH   L5 (.D(s_logisimNet6),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet14),
               .QN(s_logisimNet15));

   LATCH   L6 (.D(s_logisimNet7),
               .ENABLE(s_logisimNet9),
               .Q(s_logisimNet12),
               .QN(s_logisimNet13));

endmodule
