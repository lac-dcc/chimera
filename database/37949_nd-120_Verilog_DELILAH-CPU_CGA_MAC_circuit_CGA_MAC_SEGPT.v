// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_SEGPT                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_SEGPT( EXMN,
                      FIDBO_15_0,
                      LLDEXM,
                      LLDPCR,
                      LLDSEG,
                      MCLK,
                      PCR_14_13_10_9_N,
                      PCR_15_7_2_0,
                      PEX,
                      SEGZN,
                      SEG_7_0,
                      VEX,
                      XPT_1_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        EXMN;
   input [15:0] FIDBO_15_0;
   input        LLDEXM;
   input        LLDPCR;
   input        LLDSEG;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] PCR_14_13_10_9_N;
   output [15:0] PCR_15_7_2_0;
   output        PEX;
   output        SEGZN;
   output [7:0]  SEG_7_0;
   output        VEX;
   output [1:0]  XPT_1_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0]  s_logisimBus11;
   wire [15:0] s_logisimBus14;
   wire [15:0] s_logisimBus2;
   wire [7:0]  s_logisimBus21;
   wire [15:0] s_logisimBus24;
   wire [1:0]  s_logisimBus27;
   wire [15:0] s_logisimBus3;
   wire [7:0]  s_logisimBus6;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet20;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus11[0]  = s_logisimNet7;
   assign s_logisimBus11[1]  = s_logisimNet5;
   assign s_logisimBus11[2]  = s_logisimNet12;
   assign s_logisimBus14[0]  = s_logisimNet7;
   assign s_logisimBus14[10] = s_logisimNet10;
   assign s_logisimBus14[11] = s_logisimNet25;
   assign s_logisimBus14[12] = s_logisimNet8;
   assign s_logisimBus14[13] = s_logisimNet23;
   assign s_logisimBus14[14] = s_logisimNet30;
   assign s_logisimBus14[15] = s_logisimNet15;
   assign s_logisimBus14[1]  = s_logisimNet5;
   assign s_logisimBus14[2]  = s_logisimNet12;
   assign s_logisimBus14[7]  = s_logisimNet0;
   assign s_logisimBus14[8]  = s_logisimNet19;
   assign s_logisimBus14[9]  = s_logisimNet20;
   assign s_logisimBus21[0]  = s_logisimNet7;
   assign s_logisimBus21[1]  = s_logisimNet5;
   assign s_logisimBus21[2]  = s_logisimNet12;
   assign s_logisimBus21[3]  = s_logisimNet17;
   assign s_logisimBus21[4]  = s_logisimNet31;
   assign s_logisimBus21[5]  = s_logisimNet18;
   assign s_logisimBus21[6]  = s_logisimNet32;
   assign s_logisimBus21[7]  = s_logisimNet0;
   assign s_logisimNet0      = s_logisimBus24[7];
   assign s_logisimNet10     = s_logisimBus24[10];
   assign s_logisimNet12     = s_logisimBus24[2];
   assign s_logisimNet15     = s_logisimBus24[15];
   assign s_logisimNet17     = s_logisimBus24[3];
   assign s_logisimNet18     = s_logisimBus24[5];
   assign s_logisimNet19     = s_logisimBus24[8];
   assign s_logisimNet20     = s_logisimBus24[9];
   assign s_logisimNet23     = s_logisimBus24[13];
   assign s_logisimNet25     = s_logisimBus24[11];
   assign s_logisimNet30     = s_logisimBus24[14];
   assign s_logisimNet31     = s_logisimBus24[4];
   assign s_logisimNet32     = s_logisimBus24[6];
   assign s_logisimNet5      = s_logisimBus24[1];
   assign s_logisimNet7      = s_logisimBus24[0];
   assign s_logisimNet8      = s_logisimBus24[12];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus24[15:0] = FIDBO_15_0;
   assign s_logisimNet13       = LLDPCR;
   assign s_logisimNet16       = MCLK;
   assign s_logisimNet26       = LLDEXM;
   assign s_logisimNet4        = EXMN;
   assign s_logisimNet9        = LLDSEG;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PCR_14_13_10_9_N = s_logisimBus3[15:0];
   assign PCR_15_7_2_0     = s_logisimBus2[15:0];
   assign PEX              = s_logisimNet29;
   assign SEGZN            = s_logisimNet22;
   assign SEG_7_0          = s_logisimBus6[7:0];
   assign VEX              = s_logisimNet28;
   assign XPT_1_0          = s_logisimBus27[1:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet1 = ~s_logisimNet16;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_MAC_SEGPT_XPT   XPT (.EXMN(s_logisimNet4),
                            .FIDBO_2_0(s_logisimBus11[2:0]),
                            .LLDEXM(s_logisimNet26),
                            .MCLKN(s_logisimNet1),
                            .PEX(s_logisimNet29),
                            .VEX(s_logisimNet28),
                            .XPT_1_0(s_logisimBus27[1:0]));

   CGA_MAC_SEGPT_SEG   SEG (.FIDB_7_0(s_logisimBus21[7:0]),
                            .LLDSEG(s_logisimNet9),
                            .MCLKN(s_logisimNet1),
                            .SEGZN(s_logisimNet22),
                            .SEG_7_0(s_logisimBus6[7:0]));

   CGA_MAC_SEGPT_PCR   PCR (.FIDB_15_7_2_0(s_logisimBus14[15:0]),
                            .LLDPCR(s_logisimNet13),
                            .MCLKN(s_logisimNet1),
                            .PCR_14_13_10_9_N(s_logisimBus3[15:0]),
                            .PCR_15_7_2_0(s_logisimBus2[15:0]));

endmodule
