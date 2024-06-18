// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_CLR                                           **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_CLR( CLRQ,
                           DIN_15_8,
                           DIN_7_0,
                           HIK,
                           HX_2_0,
                           HX_2_0_N,
                           J,
                           LOK,
                           LX_2_0,
                           LX_2_0_N );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [7:0] DIN_15_8;
   input [7:0] DIN_7_0;
   input       HIK;
   input [2:0] HX_2_0;
   input [2:0] HX_2_0_N;
   input       J;
   input       LOK;
   input [2:0] LX_2_0;
   input [2:0] LX_2_0_N;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] CLRQ;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus23;
   wire [2:0]  s_logisimBus25;
   wire [7:0]  s_logisimBus26;
   wire [2:0]  s_logisimBus43;
   wire [7:0]  s_logisimBus44;
   wire [2:0]  s_logisimBus47;
   wire [2:0]  s_logisimBus54;
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
   wire        s_logisimNet22;
   wire        s_logisimNet24;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet53;
   wire        s_logisimNet55;
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
   assign s_logisimBus25[2:0] = HX_2_0;
   assign s_logisimBus26[7:0] = DIN_15_8;
   assign s_logisimBus43[2:0] = LX_2_0;
   assign s_logisimBus44[7:0] = DIN_7_0;
   assign s_logisimBus47[2:0] = HX_2_0_N;
   assign s_logisimBus54[2:0] = LX_2_0_N;
   assign s_logisimNet0       = HIK;
   assign s_logisimNet1       = J;
   assign s_logisimNet16      = LOK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CLRQ = s_logisimBus23[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB3 (.BIT(s_logisimBus23[3]),
                                      .DATA(s_logisimBus44[3]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus43[0]),
                                      .X1(s_logisimBus43[1]),
                                      .X2(s_logisimBus54[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB2 (.BIT(s_logisimBus23[2]),
                                      .DATA(s_logisimBus44[2]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus54[0]),
                                      .X1(s_logisimBus43[1]),
                                      .X2(s_logisimBus54[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB1 (.BIT(s_logisimBus23[1]),
                                      .DATA(s_logisimBus44[1]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus43[0]),
                                      .X1(s_logisimBus54[1]),
                                      .X2(s_logisimBus54[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB0 (.BIT(s_logisimBus23[0]),
                                      .DATA(s_logisimBus44[0]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus54[0]),
                                      .X1(s_logisimBus54[1]),
                                      .X2(s_logisimBus54[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB7 (.BIT(s_logisimBus23[7]),
                                      .DATA(s_logisimBus44[7]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus43[0]),
                                      .X1(s_logisimBus43[1]),
                                      .X2(s_logisimBus43[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB6 (.BIT(s_logisimBus23[6]),
                                      .DATA(s_logisimBus44[6]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus54[0]),
                                      .X1(s_logisimBus43[1]),
                                      .X2(s_logisimBus43[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB5 (.BIT(s_logisimBus23[5]),
                                      .DATA(s_logisimBus44[5]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus43[0]),
                                      .X1(s_logisimBus54[1]),
                                      .X2(s_logisimBus43[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB4 (.BIT(s_logisimBus23[4]),
                                      .DATA(s_logisimBus44[4]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet16),
                                      .X0(s_logisimBus54[0]),
                                      .X1(s_logisimBus54[1]),
                                      .X2(s_logisimBus43[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB11 (.BIT(s_logisimBus23[11]),
                                       .DATA(s_logisimBus26[3]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus25[0]),
                                       .X1(s_logisimBus25[1]),
                                       .X2(s_logisimBus47[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB10 (.BIT(s_logisimBus23[10]),
                                       .DATA(s_logisimBus26[2]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus47[0]),
                                       .X1(s_logisimBus25[1]),
                                       .X2(s_logisimBus47[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB9 (.BIT(s_logisimBus23[9]),
                                      .DATA(s_logisimBus26[1]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet0),
                                      .X0(s_logisimBus25[0]),
                                      .X1(s_logisimBus47[1]),
                                      .X2(s_logisimBus47[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB8 (.BIT(s_logisimBus23[8]),
                                      .DATA(s_logisimBus26[0]),
                                      .DCDJ(s_logisimNet1),
                                      .DCDK(s_logisimNet0),
                                      .X0(s_logisimBus47[0]),
                                      .X1(s_logisimBus47[1]),
                                      .X2(s_logisimBus47[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB15 (.BIT(s_logisimBus23[15]),
                                       .DATA(s_logisimBus26[7]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus25[0]),
                                       .X1(s_logisimBus25[1]),
                                       .X2(s_logisimBus25[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB14 (.BIT(s_logisimBus23[14]),
                                       .DATA(s_logisimBus26[6]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus47[0]),
                                       .X1(s_logisimBus25[1]),
                                       .X2(s_logisimBus25[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB13 (.BIT(s_logisimBus23[13]),
                                       .DATA(s_logisimBus26[5]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus25[0]),
                                       .X1(s_logisimBus47[1]),
                                       .X2(s_logisimBus25[2]));

   CGA_INTR_CNTLR_CLR_CLRBIT   CLRB12 (.BIT(s_logisimBus23[12]),
                                       .DATA(s_logisimBus26[4]),
                                       .DCDJ(s_logisimNet1),
                                       .DCDK(s_logisimNet0),
                                       .X0(s_logisimBus47[0]),
                                       .X1(s_logisimBus47[1]),
                                       .X2(s_logisimBus25[2]));

endmodule
