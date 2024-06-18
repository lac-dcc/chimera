// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR( EPIC,
                       EPICMASKN,
                       FIDBO_15_0,
                       HIGSN,
                       IREQ_15_0_N,
                       IRQN,
                       LAA_3_0,
                       LOGSN,
                       MCLK,
                       PD,
                       PICMASK_15_0,
                       PICS_2_0,
                       PICV_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        EPIC;
   input [15:0] FIDBO_15_0;
   input [15:0] IREQ_15_0_N;
   input [3:0]  LAA_3_0;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        EPICMASKN;
   output        HIGSN;
   output        IRQN;
   output        LOGSN;
   output        PD;
   output [15:0] PICMASK_15_0;
   output [2:0]  PICS_2_0;
   output [2:0]  PICV_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0]  s_logisimBus0;
   wire [15:0] s_logisimBus1;
   wire [2:0]  s_logisimBus10;
   wire [15:0] s_logisimBus2;
   wire [2:0]  s_logisimBus20;
   wire [15:0] s_logisimBus21;
   wire [2:0]  s_logisimBus26;
   wire [2:0]  s_logisimBus27;
   wire [2:0]  s_logisimBus28;
   wire [2:0]  s_logisimBus29;
   wire [15:0] s_logisimBus3;
   wire [2:0]  s_logisimBus32;
   wire [15:0] s_logisimBus33;
   wire [2:0]  s_logisimBus42;
   wire [2:0]  s_logisimBus44;
   wire [15:0] s_logisimBus8;
   wire        s_logisimNet11;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
   wire        s_logisimNet19;
   wire        s_logisimNet22;
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet31;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet43;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet54;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus44[0] = s_logisimNet22;
   assign s_logisimBus44[1] = s_logisimNet5;
   assign s_logisimBus44[2] = s_logisimNet46;
   assign s_logisimNet22    = s_logisimBus33[0];
   assign s_logisimNet46    = s_logisimBus33[2];
   assign s_logisimNet5     = s_logisimBus33[1];

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus0[3:0]   = LAA_3_0;
   assign s_logisimBus21[15:0] = IREQ_15_0_N;
   assign s_logisimBus33[15:0] = FIDBO_15_0;
   assign s_logisimNet12       = MCLK;
   assign s_logisimNet45       = EPIC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign EPICMASKN    = s_logisimNet35;
   assign HIGSN        = s_logisimNet31;
   assign IRQN         = s_logisimNet6;
   assign LOGSN        = s_logisimNet11;
   assign PD           = s_logisimNet41;
   assign PICMASK_15_0 = s_logisimBus2[15:0];
   assign PICS_2_0     = s_logisimBus32[2:0];
   assign PICV_2_0     = s_logisimBus42[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet13 = ~s_logisimNet12;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_bus_2 #(.nrOfBits(16))
      PLEXERS_1 (
                 .muxIn_0(s_logisimBus33[15:0]),
                 .muxIn_1(s_logisimBus2[15:0]),
                 .muxOut(s_logisimBus3[15:0]),
                 .sel(s_logisimNet24));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_VECGEN   VECGEN (.FIDBO3(s_logisimBus33[3]),
                                   .FIDBO4(s_logisimBus33[4]),
                                   .FIDBO_2_0(s_logisimBus44[2:0]),
                                   .G(s_logisimNet34),
                                   .HIDET(s_logisimNet50),
                                   .HIF(s_logisimNet23),
                                   .HIGSN(s_logisimNet31),
                                   .HIVEC_2_0(s_logisimBus26[2:0]),
                                   .HIVGES(s_logisimNet9),
                                   .HX_2_0(s_logisimBus27[2:0]),
                                   .HX_2_0_N(s_logisimBus10[2:0]),
                                   .LODET(s_logisimNet19),
                                   .LOF(s_logisimNet38),
                                   .LOGSN(s_logisimNet11),
                                   .LOVEC_2_0(s_logisimBus29[2:0]),
                                   .LOVGES(s_logisimNet51),
                                   .LX_2_0(s_logisimBus28[2:0]),
                                   .LX_2_0_N(s_logisimBus20[2:0]),
                                   .MCLK(s_logisimNet12),
                                   .MIREQ_15_0_N(s_logisimBus1[15:0]),
                                   .N(s_logisimNet47),
                                   .OESN(s_logisimNet54),
                                   .PICS_2_0(s_logisimBus32[2:0]));

   CGA_INTR_CNTLR_CLR   CLR_CLEAR_CONTROL (.CLRQ(s_logisimBus8[15:0]),
                                           .DIN_15_8(s_logisimBus3[15:8]),
                                           .DIN_7_0(s_logisimBus3[7:0]),
                                           .HIK(s_logisimNet49),
                                           .HX_2_0(s_logisimBus27[2:0]),
                                           .HX_2_0_N(s_logisimBus10[2:0]),
                                           .J(s_logisimNet48),
                                           .LOK(s_logisimNet39),
                                           .LX_2_0(s_logisimBus28[2:0]),
                                           .LX_2_0_N(s_logisimBus20[2:0]));

   CGA_INTR_CNTLR_IRGEL   IRGEL (.D(s_logisimNet15),
                                 .E(s_logisimNet16),
                                 .FIDB03(s_logisimBus33[3]),
                                 .FIDB04(s_logisimBus33[4]),
                                 .H(s_logisimNet14),
                                 .HIDET(s_logisimNet50),
                                 .HIGSN(s_logisimNet31),
                                 .HIPASSALL(s_logisimNet43),
                                 .HIVEC_2_0(s_logisimBus26[2:0]),
                                 .HIVGES(s_logisimNet9),
                                 .IRQN(s_logisimNet6),
                                 .L(s_logisimNet40),
                                 .LODET(s_logisimNet19),
                                 .LOGSN(s_logisimNet11),
                                 .LOPASSALL(s_logisimNet7),
                                 .LOVEC_2_0(s_logisimBus29[2:0]),
                                 .LOVGES(s_logisimNet51),
                                 .M(s_logisimNet17),
                                 .MCLK(s_logisimNet12),
                                 .N(s_logisimNet47),
                                 .PD(s_logisimNet41),
                                 .PICV_2_0(s_logisimBus42[2:0]),
                                 .S(s_logisimNet37));

   CGA_INTR_CNTLR_MDCD   MDCD (.A(s_logisimNet36),
                               .B(s_logisimNet25),
                               .C(s_logisimNet18),
                               .D(s_logisimNet15),
                               .E(s_logisimNet16),
                               .EPIC(s_logisimNet45),
                               .EPICMASKN(s_logisimNet35),
                               .G(s_logisimNet34),
                               .H(s_logisimNet14),
                               .HIF(s_logisimNet23),
                               .HIK(s_logisimNet49),
                               .HIPASSALL(s_logisimNet43),
                               .J(s_logisimNet48),
                               .L(s_logisimNet40),
                               .LAA_3_0(s_logisimBus0[3:0]),
                               .LOF(s_logisimNet38),
                               .LOK(s_logisimNet39),
                               .LOPASSALL(s_logisimNet7),
                               .M(s_logisimNet17),
                               .MCLK(s_logisimNet12),
                               .N(s_logisimNet47),
                               .OEM(s_logisimNet24),
                               .OESN(s_logisimNet54),
                               .S(s_logisimNet37));

   CGA_INTR_CNTLR_IRQ   IRQ (.A(s_logisimNet36),
                             .B(s_logisimNet25),
                             .C(s_logisimNet18),
                             .CLRQ_15_0(s_logisimBus8[15:0]),
                             .CPN(s_logisimNet13),
                             .DIN_15_0(s_logisimBus3[15:0]),
                             .IREQ_15_0_N(s_logisimBus21[15:0]),
                             .MCLK(s_logisimNet12),
                             .MIREQ_15_0_N(s_logisimBus1[15:0]),
                             .PICMASK_15_0(s_logisimBus2[15:0]));

endmodule
