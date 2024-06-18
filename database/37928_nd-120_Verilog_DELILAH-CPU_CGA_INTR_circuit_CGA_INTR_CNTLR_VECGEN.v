// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN                                        **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN( FIDBO3,
                              FIDBO4,
                              FIDBO_2_0,
                              G,
                              HIDET,
                              HIF,
                              HIGSN,
                              HIVEC_2_0,
                              HIVGES,
                              HX_2_0,
                              HX_2_0_N,
                              LODET,
                              LOF,
                              LOGSN,
                              LOVEC_2_0,
                              LOVGES,
                              LX_2_0,
                              LX_2_0_N,
                              MCLK,
                              MIREQ_15_0_N,
                              N,
                              OESN,
                              PICS_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        FIDBO3;
   input        FIDBO4;
   input [2:0]  FIDBO_2_0;
   input        G;
   input        HIF;
   input        HIGSN;
   input        LOF;
   input        LOGSN;
   input        MCLK;
   input [15:0] MIREQ_15_0_N;
   input        N;
   input        OESN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       HIDET;
   output [2:0] HIVEC_2_0;
   output       HIVGES;
   output [2:0] HX_2_0;
   output [2:0] HX_2_0_N;
   output       LODET;
   output [2:0] LOVEC_2_0;
   output       LOVGES;
   output [2:0] LX_2_0;
   output [2:0] LX_2_0_N;
   output [2:0] PICS_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0]  s_logisimBus1;
   wire [2:0]  s_logisimBus11;
   wire [2:0]  s_logisimBus14;
   wire [2:0]  s_logisimBus15;
   wire [2:0]  s_logisimBus16;
   wire [2:0]  s_logisimBus17;
   wire [2:0]  s_logisimBus18;
   wire [2:0]  s_logisimBus19;
   wire [2:0]  s_logisimBus2;
   wire [2:0]  s_logisimBus3;
   wire [2:0]  s_logisimBus6;
   wire [15:0] s_logisimBus7;
   wire [2:0]  s_logisimBus9;
   wire        s_logisimNet0;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet20;
   wire        s_logisimNet21;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet4;
   wire        s_logisimNet5;
   wire        s_logisimNet8;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus7[15:0] = MIREQ_15_0_N;
   assign s_logisimBus9[2:0]  = FIDBO_2_0;
   assign s_logisimNet0       = MCLK;
   assign s_logisimNet10      = OESN;
   assign s_logisimNet13      = LOF;
   assign s_logisimNet20      = HIF;
   assign s_logisimNet21      = G;
   assign s_logisimNet22      = FIDBO3;
   assign s_logisimNet23      = FIDBO4;
   assign s_logisimNet4       = N;
   assign s_logisimNet5       = HIGSN;
   assign s_logisimNet8       = LOGSN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HIDET     = s_logisimNet25;
   assign HIVEC_2_0 = s_logisimBus3[2:0];
   assign HIVGES    = s_logisimNet24;
   assign HX_2_0    = s_logisimBus16[2:0];
   assign HX_2_0_N  = s_logisimBus18[2:0];
   assign LODET     = s_logisimNet26;
   assign LOVEC_2_0 = s_logisimBus11[2:0];
   assign LOVGES    = s_logisimNet12;
   assign LX_2_0    = s_logisimBus17[2:0];
   assign LX_2_0_N  = s_logisimBus19[2:0];
   assign PICS_2_0  = s_logisimBus15[2:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_VECGEN_VHR   VHR (.HIVEC_2_0(s_logisimBus3[2:0]),
                                    .HX_2_0(s_logisimBus16[2:0]),
                                    .HX_2_0_N(s_logisimBus18[2:0]),
                                    .LOVEC_2_0(s_logisimBus11[2:0]),
                                    .LX_2_0(s_logisimBus17[2:0]),
                                    .LX_2_0_N(s_logisimBus19[2:0]),
                                    .MCLK(s_logisimNet0),
                                    .N(s_logisimNet4));

   CGA_INTR_CNTLR_VECGEN_ISMUX   ISMUX (.FIDBO_2_0(s_logisimBus9[2:0]),
                                        .HIGSN(s_logisimNet5),
                                        .HISIN_2_0(s_logisimBus2[2:0]),
                                        .HISTAT_2_0(s_logisimBus6[2:0]),
                                        .LOGSN(s_logisimNet8),
                                        .LOSIN_2_0(s_logisimBus14[2:0]),
                                        .LOSTAT_2_0(s_logisimBus1[2:0]),
                                        .OESN(s_logisimNet10));

   CGA_INTR_CNTLR_VECGEN_CMP   CMP (.HISTAT_2_0(s_logisimBus6[2:0]),
                                    .HIVEC_2_0(s_logisimBus3[2:0]),
                                    .HIVGES(s_logisimNet24),
                                    .LOSTAT_2_0(s_logisimBus1[2:0]),
                                    .LOVEC_2_0(s_logisimBus11[2:0]),
                                    .LOVGES(s_logisimNet12));

   CGA_INTR_CNTLR_VECGEN_STAT   STAT (.FIDBO3(s_logisimNet22),
                                      .FIDBO4(s_logisimNet23),
                                      .G(s_logisimNet21),
                                      .HIF(s_logisimNet20),
                                      .HISIN_2_0(s_logisimBus2[2:0]),
                                      .HISTAT_2_0(s_logisimBus6[2:0]),
                                      .HIVEC_2_0(s_logisimBus3[2:0]),
                                      .LOF(s_logisimNet13),
                                      .LOSIN_2_0(s_logisimBus14[2:0]),
                                      .LOSTAT_2_0(s_logisimBus1[2:0]),
                                      .LOVEC_2_0(s_logisimBus11[2:0]),
                                      .MCLK(s_logisimNet0));

   CGA_INTR_CNTLR_VECGEN_OSMUX   OSMUX (.HIGSN(s_logisimNet5),
                                        .HISTAT_2_0(s_logisimBus6[2:0]),
                                        .LOGSN(s_logisimNet8),
                                        .LOSTAT_2_0(s_logisimBus1[2:0]),
                                        .OESN(s_logisimNet10),
                                        .PICS_2_0(s_logisimBus15[2:0]));

   CGA_INTR_CNTLR_VECGEN_PTY   PTY (.HIDET(s_logisimNet25),
                                    .HIVEC(s_logisimBus3[2:0]),
                                    .LODET(s_logisimNet26),
                                    .LOVEC(s_logisimBus11[2:0]),
                                    .MIREQ_15_0_N(s_logisimBus7[15:0]));

endmodule
