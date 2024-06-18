// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_MASEL_REPEAT                                         **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_MASEL_REPEAT( IW_12_0,
                             MCLK,
                             MPN,
                             REP_12_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        MCLK;
   input        MPN;
   input [12:0] REP_12_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [12:0] IW_12_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [12:0] s_logisimBus22;
   wire [12:0] s_logisimBus30;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus30[12:0] = REP_12_0;
   assign s_logisimNet29       = MPN;
   assign s_logisimNet6        = MCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign IW_12_0 = s_logisimBus22[12:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet29;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF8 (.clock(s_logisimNet6),
             .d(s_logisimBus30[8]),
             .preset(1'b0),
             .q(s_logisimBus22[8]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF7 (.clock(s_logisimNet6),
             .d(s_logisimBus30[7]),
             .preset(1'b0),
             .q(s_logisimBus22[7]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF6 (.clock(s_logisimNet6),
             .d(s_logisimBus30[6]),
             .preset(1'b0),
             .q(s_logisimBus22[6]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF5 (.clock(s_logisimNet6),
             .d(s_logisimBus30[5]),
             .preset(1'b0),
             .q(s_logisimBus22[5]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF4 (.clock(s_logisimNet6),
             .d(s_logisimBus30[4]),
             .preset(1'b0),
             .q(s_logisimBus22[4]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF3 (.clock(s_logisimNet6),
             .d(s_logisimBus30[3]),
             .preset(1'b0),
             .q(s_logisimBus22[3]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF2 (.clock(s_logisimNet6),
             .d(s_logisimBus30[2]),
             .preset(1'b0),
             .q(s_logisimBus22[2]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF1 (.clock(s_logisimNet6),
             .d(s_logisimBus30[1]),
             .preset(1'b0),
             .q(s_logisimBus22[1]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF0 (.clock(s_logisimNet6),
             .d(s_logisimBus30[0]),
             .preset(1'b0),
             .q(s_logisimBus22[0]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF12 (.clock(s_logisimNet6),
              .d(s_logisimBus30[12]),
              .preset(1'b0),
              .q(s_logisimBus22[12]),
              .qBar(),
              .reset(s_logisimNet3),
              .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF11 (.clock(s_logisimNet6),
              .d(s_logisimBus30[11]),
              .preset(1'b0),
              .q(s_logisimBus22[11]),
              .qBar(),
              .reset(s_logisimNet3),
              .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF10 (.clock(s_logisimNet6),
              .d(s_logisimBus30[10]),
              .preset(1'b0),
              .q(s_logisimBus22[10]),
              .qBar(),
              .reset(s_logisimNet3),
              .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      IWFF9 (.clock(s_logisimNet6),
             .d(s_logisimBus30[9]),
             .preset(1'b0),
             .q(s_logisimBus22[9]),
             .qBar(),
             .reset(s_logisimNet3),
             .tick(1'b1));


endmodule
