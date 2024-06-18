// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : SR44                                                         **
 **                                                                          **
 *****************************************************************************/

module SR44( A,
             B,
             C,
             CP,
             D,
             L,
             QA,
             QAN,
             QB,
             QBN,
             QC,
             QCN,
             QD,
             QDN,
             SI );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input C;
   input CP;
   input D;
   input L;
   input SI;

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
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
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
   assign s_logisimNet15 = B;
   assign s_logisimNet16 = D;
   assign s_logisimNet2  = CP;
   assign s_logisimNet4  = SI;
   assign s_logisimNet5  = L;
   assign s_logisimNet8  = C;
   assign s_logisimNet9  = A;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign QA  = s_logisimNet0;
   assign QAN = s_logisimNet17;
   assign QB  = s_logisimNet3;
   assign QBN = s_logisimNet10;
   assign QC  = s_logisimNet1;
   assign QCN = s_logisimNet18;
   assign QD  = s_logisimNet11;
   assign QDN = s_logisimNet12;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_2   PLEXERS_1 (
                              .muxIn_0(s_logisimNet4),
                              .muxIn_1(s_logisimNet9),
                              .muxOut(s_logisimNet6),
                              .sel(s_logisimNet5));

   Multiplexer_2   PLEXERS_2 (
                              .muxIn_0(s_logisimNet0),
                              .muxIn_1(s_logisimNet15),
                              .muxOut(s_logisimNet13),
                              .sel(s_logisimNet5));

   Multiplexer_2   PLEXERS_3 (
                              .muxIn_0(s_logisimNet3),
                              .muxIn_1(s_logisimNet8),
                              .muxOut(s_logisimNet7),
                              .sel(s_logisimNet5));

   Multiplexer_2   PLEXERS_4 (
                              .muxIn_0(s_logisimNet1),
                              .muxIn_1(s_logisimNet16),
                              .muxOut(s_logisimNet14),
                              .sel(s_logisimNet5));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet2),
                .d(s_logisimNet6),
                .preset(1'b0),
                .q(s_logisimNet0),
                .qBar(s_logisimNet17),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet2),
                .d(s_logisimNet13),
                .preset(1'b0),
                .q(s_logisimNet3),
                .qBar(s_logisimNet10),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_logisimNet2),
                .d(s_logisimNet7),
                .preset(1'b0),
                .q(s_logisimNet1),
                .qBar(s_logisimNet18),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_8 (.clock(s_logisimNet2),
                .d(s_logisimNet14),
                .preset(1'b0),
                .q(s_logisimNet11),
                .qBar(s_logisimNet12),
                .reset(1'b0),
                .tick(1'b1));


endmodule
