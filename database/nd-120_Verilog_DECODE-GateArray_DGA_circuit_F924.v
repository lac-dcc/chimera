// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : F924                                                         **
 **                                                                          **
 *****************************************************************************/

module F924( C_H05,
             D0_H01,
             D1_H02,
             D2_H03,
             D3_H04,
             N01_Q0,
             N02_Q1,
             N03_Q2,
             N04_Q3,
             N05_Q0B,
             N06_Q1B,
             N07_Q2B,
             N08_Q3B );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input C_H05;
   input D0_H01;
   input D1_H02;
   input D2_H03;
   input D3_H04;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output N01_Q0;
   output N02_Q1;
   output N03_Q2;
   output N04_Q3;
   output N05_Q0B;
   output N06_Q1B;
   output N07_Q2B;
   output N08_Q3B;

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
   assign s_logisimNet1  = D0_H01;
   assign s_logisimNet10 = C_H05;
   assign s_logisimNet2  = D1_H02;
   assign s_logisimNet3  = D2_H03;
   assign s_logisimNet4  = D3_H04;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign N01_Q0  = s_logisimNet6;
   assign N02_Q1  = s_logisimNet7;
   assign N03_Q2  = s_logisimNet8;
   assign N04_Q3  = s_logisimNet9;
   assign N05_Q0B = s_logisimNet5;
   assign N06_Q1B = s_logisimNet12;
   assign N07_Q2B = s_logisimNet0;
   assign N08_Q3B = s_logisimNet11;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet10),
                .d(s_logisimNet1),
                .preset(1'b0),
                .q(s_logisimNet6),
                .qBar(s_logisimNet5),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet10),
                .d(s_logisimNet2),
                .preset(1'b0),
                .q(s_logisimNet7),
                .qBar(s_logisimNet12),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet10),
                .d(s_logisimNet3),
                .preset(1'b0),
                .q(s_logisimNet8),
                .qBar(s_logisimNet0),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet10),
                .d(s_logisimNet4),
                .preset(1'b0),
                .q(s_logisimNet9),
                .qBar(s_logisimNet11),
                .reset(1'b0),
                .tick(1'b1));


endmodule
