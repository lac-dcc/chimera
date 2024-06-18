// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC                                                      **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC( BR_15_0,
                CD_15_0,
                CMIS_1_0,
                CSCOMM_4_0,
                CSMREQ,
                DOUBLE,
                ECCR,
                FIDBO_15_0,
                ILCSN,
                LA_23_10,
                LSHADOW,
                MCA_9_0,
                MCLK,
                NLCA_15_0,
                PCR_15_0,
                PONI,
                PR_15_0,
                PTM,
                RB_15_0,
                VEX,
                WR3,
                WR7,
                XR_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] BR_15_0;
   input [15:0] CD_15_0;
   input [1:0]  CMIS_1_0;
   input [4:0]  CSCOMM_4_0;
   input        CSMREQ;
   input        DOUBLE;
   input [15:0] FIDBO_15_0;
   input        ILCSN;
   input        MCLK;
   input        PONI;
   input [15:0] PR_15_0;
   input        PTM;
   input [15:0] RB_15_0;
   input        WR3;
   input        WR7;
   input [15:0] XR_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ECCR;
   output [13:0] LA_23_10;
   output        LSHADOW;
   output [9:0]  MCA_9_0;
   output [15:0] NLCA_15_0;
   output [15:0] PCR_15_0;
   output        VEX;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus10;
   wire [1:0]  s_logisimBus12;
   wire [15:0] s_logisimBus17;
   wire [7:0]  s_logisimBus21;
   wire [15:0] s_logisimBus23;
   wire [13:0] s_logisimBus25;
   wire [4:0]  s_logisimBus28;
   wire [15:0] s_logisimBus30;
   wire [15:0] s_logisimBus33;
   wire [15:0] s_logisimBus40;
   wire [1:0]  s_logisimBus42;
   wire [15:0] s_logisimBus44;
   wire [15:0] s_logisimBus47;
   wire [9:0]  s_logisimBus48;
   wire [15:0] s_logisimBus51;
   wire [15:0] s_logisimBus58;
   wire [15:0] s_logisimBus6;
   wire [15:0] s_logisimBus7;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet11;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet2;
   wire        s_logisimNet20;
   wire        s_logisimNet22;
   wire        s_logisimNet24;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet41;
   wire        s_logisimNet43;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet59;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus12[1:0]  = CMIS_1_0;
   assign s_logisimBus17[15:0] = PR_15_0;
   assign s_logisimBus28[4:0]  = CSCOMM_4_0;
   assign s_logisimBus30[15:0] = CD_15_0;
   assign s_logisimBus40[15:0] = RB_15_0;
   assign s_logisimBus47[15:0] = BR_15_0;
   assign s_logisimBus51[15:0] = XR_15_0;
   assign s_logisimBus6[15:0]  = FIDBO_15_0;
   assign s_logisimNet0        = ILCSN;
   assign s_logisimNet2        = MCLK;
   assign s_logisimNet26       = PONI;
   assign s_logisimNet3        = WR7;
   assign s_logisimNet32       = CSMREQ;
   assign s_logisimNet41       = DOUBLE;
   assign s_logisimNet43       = PTM;
   assign s_logisimNet9        = WR3;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECCR      = s_logisimNet11;
   assign LA_23_10  = s_logisimBus25[13:0];
   assign LSHADOW   = s_logisimNet8;
   assign MCA_9_0   = s_logisimBus48[9:0];
   assign NLCA_15_0 = s_logisimBus58[15:0];
   assign PCR_15_0  = s_logisimBus23[15:0];
   assign VEX       = s_logisimNet49;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet31 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet50 = ~s_logisimNet31;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_MAC_AP09   MAC_AP09 (.ADDSEL(s_logisimNet38),
                            .ADD_15_0(s_logisimBus33[15:0]),
                            .CDSEL(s_logisimNet45),
                            .CD_15_0(s_logisimBus30[15:0]),
                            .ECCR(s_logisimNet11),
                            .ECCRHIN(s_logisimNet13),
                            .HOLD(s_logisimNet29),
                            .ICA_15_0(s_logisimBus10[15:0]),
                            .LCA_15_0(s_logisimBus7[15:0]),
                            .MCA_9_0(s_logisimBus48[9:0]),
                            .MCLK(s_logisimNet2),
                            .NLCASEL(s_logisimNet24),
                            .NLCA_15_0(s_logisimBus58[15:0]),
                            .PR_15_0(s_logisimBus17[15:0]),
                            .PSEL(s_logisimNet46));

   CGA_MAC_SEGPT   MAC_SEGPT (.EXMN(s_logisimNet20),
                              .FIDBO_15_0(s_logisimBus6[15:0]),
                              .LLDEXM(s_logisimNet54),
                              .LLDPCR(s_logisimNet34),
                              .LLDSEG(s_logisimNet22),
                              .MCLK(s_logisimNet2),
                              .PCR_14_13_10_9_N(s_logisimBus44[15:0]),
                              .PCR_15_7_2_0(s_logisimBus23[15:0]),
                              .PEX(s_logisimNet39),
                              .SEGZN(s_logisimNet18),
                              .SEG_7_0(s_logisimBus21[7:0]),
                              .VEX(s_logisimNet49),
                              .XPT_1_0(s_logisimBus42[1:0]));

   CGA_MAC_PTSEL   MAC_PTSEL (.MCLK(s_logisimNet2),
                              .PONI(s_logisimNet26),
                              .PTM(s_logisimNet43),
                              .SAPT(s_logisimNet1),
                              .SELPTN(s_logisimNet27),
                              .SPTN(s_logisimNet16));

   CGA_MAC_LASEL   MAC_LASEL (.A10(s_logisimNet57),
                              .A1617(s_logisimNet52),
                              .A1619(s_logisimNet36),
                              .A1819(s_logisimNet53),
                              .B1819(s_logisimNet60),
                              .B1821(s_logisimNet56),
                              .BB10(s_logisimNet61),
                              .C10(s_logisimNet37),
                              .CSMREQ(s_logisimNet32),
                              .D1617(s_logisimNet55),
                              .DOUBLE(s_logisimNet41),
                              .E1617(s_logisimNet59),
                              .EXMN(s_logisimNet20),
                              .F1617(s_logisimNet35),
                              .ICA_15_8(s_logisimBus10[15:0]),
                              .LSHADOW(s_logisimNet8),
                              .MCLK(s_logisimNet2),
                              .PCR_15_7_2_0(s_logisimBus23[15:0]),
                              .PEX(s_logisimNet39),
                              .PONI(s_logisimNet26),
                              .SEGZN(s_logisimNet18),
                              .SELPTN(s_logisimNet27),
                              .VEX(s_logisimNet49));

   CGA_MAC_LA1025   MAC_LA1025 (.A10(s_logisimNet57),
                                .A1617(s_logisimNet52),
                                .A1619(s_logisimNet36),
                                .A1819(s_logisimNet53),
                                .B1819(s_logisimNet60),
                                .B1821(s_logisimNet56),
                                .BB10(s_logisimNet61),
                                .C10(s_logisimNet37),
                                .D1617(s_logisimNet55),
                                .E1617(s_logisimNet59),
                                .ECCRHIN(s_logisimNet13),
                                .F1617(s_logisimNet35),
                                .ICA_15_0(s_logisimBus10[15:0]),
                                .LA_23_10(s_logisimBus25[13:0]),
                                .MCLK(s_logisimNet2),
                                .PCR_15_0(s_logisimBus23[15:0]),
                                .PCR_15_0_N(s_logisimBus44[15:0]),
                                .SEG_7_0(s_logisimBus21[7:0]),
                                .XPT_1_0(s_logisimBus42[1:0]));

   CGA_MAC_DECODE   MAC_DECODE (.ADDSEL(s_logisimNet38),
                                .CDS(s_logisimNet4),
                                .CDSEL(s_logisimNet45),
                                .CSCOMM_4_0(s_logisimBus28[4:0]),
                                .CSMIS_1_0(s_logisimBus12[1:0]),
                                .EXMN(s_logisimNet20),
                                .HOLD(s_logisimNet29),
                                .LCSN(s_logisimNet50),
                                .LLDEXM(s_logisimNet54),
                                .LLDPCR(s_logisimNet34),
                                .LLDSEG(s_logisimNet22),
                                .MCLK(s_logisimNet2),
                                .NLCASEL(s_logisimNet24),
                                .PB(s_logisimNet15),
                                .PLCA(s_logisimNet5),
                                .PRB(s_logisimNet19),
                                .PSEL(s_logisimNet46),
                                .PX(s_logisimNet14),
                                .SAPT(s_logisimNet1),
                                .SPTN(s_logisimNet16),
                                .WR3(s_logisimNet9),
                                .WR7(s_logisimNet3));

   CGA_MAC_ADD   MAC_ADD (.ADD_15_0(s_logisimBus33[15:0]),
                          .BR_15_0(s_logisimBus47[15:0]),
                          .CDS(s_logisimNet4),
                          .CD_15_0(s_logisimBus30[15:0]),
                          .LCA_15_0(s_logisimBus7[15:0]),
                          .PB(s_logisimNet15),
                          .PLCA(s_logisimNet5),
                          .PRB(s_logisimNet19),
                          .PX(s_logisimNet14),
                          .RB_15_0(s_logisimBus40[15:0]),
                          .XR_15_0(s_logisimBus51[15:0]));

endmodule
