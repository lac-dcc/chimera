// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : R81P                                                         **
 **                                                                          **
 *****************************************************************************/

module R81P( A,
             B,
             C,
             CP,
             D,
             E,
             F,
             G,
             H,
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
   input CP;
   input D;
   input E;
   input F;
   input G;
   input H;

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
   assign s_logisimNet0  = CP;
   assign s_logisimNet17 = A;
   assign s_logisimNet18 = B;
   assign s_logisimNet19 = C;
   assign s_logisimNet20 = D;
   assign s_logisimNet21 = E;
   assign s_logisimNet22 = F;
   assign s_logisimNet23 = G;
   assign s_logisimNet24 = H;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign QA  = s_logisimNet11;
   assign QAN = s_logisimNet12;
   assign QB  = s_logisimNet13;
   assign QBN = s_logisimNet14;
   assign QC  = s_logisimNet15;
   assign QCN = s_logisimNet16;
   assign QD  = s_logisimNet2;
   assign QDN = s_logisimNet3;
   assign QE  = s_logisimNet4;
   assign QEN = s_logisimNet1;
   assign QF  = s_logisimNet5;
   assign QFN = s_logisimNet6;
   assign QG  = s_logisimNet7;
   assign QGN = s_logisimNet8;
   assign QH  = s_logisimNet9;
   assign QHN = s_logisimNet10;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet0),
                .d(s_logisimNet17),
                .preset(1'b0),
                .q(s_logisimNet11),
                .qBar(s_logisimNet12),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet0),
                .d(s_logisimNet18),
                .preset(1'b0),
                .q(s_logisimNet13),
                .qBar(s_logisimNet14),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet0),
                .d(s_logisimNet19),
                .preset(1'b0),
                .q(s_logisimNet15),
                .qBar(s_logisimNet16),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet0),
                .d(s_logisimNet20),
                .preset(1'b0),
                .q(s_logisimNet2),
                .qBar(s_logisimNet3),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet0),
                .d(s_logisimNet21),
                .preset(1'b0),
                .q(s_logisimNet4),
                .qBar(s_logisimNet1),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet0),
                .d(s_logisimNet22),
                .preset(1'b0),
                .q(s_logisimNet5),
                .qBar(s_logisimNet6),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_logisimNet0),
                .d(s_logisimNet23),
                .preset(1'b0),
                .q(s_logisimNet7),
                .qBar(s_logisimNet8),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_8 (.clock(s_logisimNet0),
                .d(s_logisimNet24),
                .preset(1'b0),
                .q(s_logisimNet9),
                .qBar(s_logisimNet10),
                .reset(1'b0),
                .tick(1'b1));


endmodule
