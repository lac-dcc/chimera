// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_VHR                                    **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_VHR( HIVEC_2_0,
                                  HX_2_0,
                                  HX_2_0_N,
                                  LOVEC_2_0,
                                  LX_2_0,
                                  LX_2_0_N,
                                  MCLK,
                                  N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [2:0] HIVEC_2_0;
   input [2:0] LOVEC_2_0;
   input       MCLK;
   input       N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] HX_2_0;
   output [2:0] HX_2_0_N;
   output [2:0] LX_2_0;
   output [2:0] LX_2_0_N;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus13;
   wire [2:0] s_logisimBus17;
   wire [2:0] s_logisimBus20;
   wire [2:0] s_logisimBus23;
   wire [2:0] s_logisimBus25;
   wire [2:0] s_logisimBus5;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet24;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
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
   assign s_logisimBus17[2:0] = LOVEC_2_0;
   assign s_logisimBus5[2:0]  = HIVEC_2_0;
   assign s_logisimNet11      = N;
   assign s_logisimNet12      = MCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HX_2_0   = s_logisimBus13[2:0];
   assign HX_2_0_N = s_logisimBus23[2:0];
   assign LX_2_0   = s_logisimBus25[2:0];
   assign LX_2_0_N = s_logisimBus20[2:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   SCAN_FF   HX1 (.CLK(s_logisimNet12),
                  .D(s_logisimBus5[1]),
                  .Q(s_logisimBus13[1]),
                  .QN(s_logisimBus23[1]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus13[1]));

   SCAN_FF   HX2 (.CLK(s_logisimNet12),
                  .D(s_logisimBus5[2]),
                  .Q(s_logisimBus13[2]),
                  .QN(s_logisimBus23[2]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus13[2]));

   SCAN_FF   LX1 (.CLK(s_logisimNet12),
                  .D(s_logisimBus17[1]),
                  .Q(s_logisimBus25[1]),
                  .QN(s_logisimBus20[1]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus25[1]));

   SCAN_FF   HX0 (.CLK(s_logisimNet12),
                  .D(s_logisimBus5[0]),
                  .Q(s_logisimBus13[0]),
                  .QN(s_logisimBus23[0]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus13[0]));

   SCAN_FF   LX2 (.CLK(s_logisimNet12),
                  .D(s_logisimBus17[2]),
                  .Q(s_logisimBus25[2]),
                  .QN(s_logisimBus20[2]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus25[2]));

   SCAN_FF   LX0 (.CLK(s_logisimNet12),
                  .D(s_logisimBus17[0]),
                  .Q(s_logisimBus25[0]),
                  .QN(s_logisimBus20[0]),
                  .TE(s_logisimNet11),
                  .TI(s_logisimBus25[0]));

endmodule
