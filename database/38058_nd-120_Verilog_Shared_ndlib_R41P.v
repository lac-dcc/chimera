// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : R41P                                                         **
 **                                                                          **
 *****************************************************************************/

module R41P( A,
             B,
             C,
             CP,
             D,
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
   input CP;
   input D;

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
   assign s_logisimNet10 = B;
   assign s_logisimNet11 = C;
   assign s_logisimNet12 = D;
   assign s_logisimNet8  = CP;
   assign s_logisimNet9  = A;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign QA  = s_logisimNet2;
   assign QAN = s_logisimNet3;
   assign QB  = s_logisimNet4;
   assign QBN = s_logisimNet5;
   assign QC  = s_logisimNet6;
   assign QCN = s_logisimNet7;
   assign QD  = s_logisimNet0;
   assign QDN = s_logisimNet1;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet8),
                .d(s_logisimNet9),
                .preset(1'b0),
                .q(s_logisimNet2),
                .qBar(s_logisimNet3),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet8),
                .d(s_logisimNet10),
                .preset(1'b0),
                .q(s_logisimNet4),
                .qBar(s_logisimNet5),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet8),
                .d(s_logisimNet11),
                .preset(1'b0),
                .q(s_logisimNet6),
                .qBar(s_logisimNet7),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet8),
                .d(s_logisimNet12),
                .preset(1'b0),
                .q(s_logisimNet0),
                .qBar(s_logisimNet1),
                .reset(1'b0),
                .tick(1'b1));


endmodule
