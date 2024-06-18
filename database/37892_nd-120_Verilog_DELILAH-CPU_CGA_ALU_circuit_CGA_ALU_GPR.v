// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_GPR                                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_GPR( ALUCLK,
                    CD_15_0,
                    DGPR0N,
                    FIDBO_15_0,
                    GPRC_2_0,
                    GPRLI,
                    GPR_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] CD_15_0;
   input [15:0] FIDBO_15_0;
   input [2:0]  GPRC_2_0;
   input        GPRLI;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        DGPR0N;
   output [15:0] GPR_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus31;
   wire [15:0] s_logisimBus46;
   wire [2:0]  s_logisimBus53;
   wire [15:0] s_logisimBus74;
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
   wire        s_logisimNet23;
   wire        s_logisimNet24;
   wire        s_logisimNet25;
   wire        s_logisimNet26;
   wire        s_logisimNet27;
   wire        s_logisimNet28;
   wire        s_logisimNet29;
   wire        s_logisimNet3;
   wire        s_logisimNet30;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet39;
   wire        s_logisimNet4;
   wire        s_logisimNet40;
   wire        s_logisimNet41;
   wire        s_logisimNet42;
   wire        s_logisimNet43;
   wire        s_logisimNet44;
   wire        s_logisimNet45;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
   wire        s_logisimNet52;
   wire        s_logisimNet54;
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet69;
   wire        s_logisimNet7;
   wire        s_logisimNet70;
   wire        s_logisimNet71;
   wire        s_logisimNet72;
   wire        s_logisimNet73;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus31[15:0] = CD_15_0;
   assign s_logisimBus53[2:0]  = GPRC_2_0;
   assign s_logisimBus74[15:0] = FIDBO_15_0;
   assign s_logisimNet22       = ALUCLK;
   assign s_logisimNet42       = GPRLI;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DGPR0N   = s_logisimNet62;
   assign GPR_15_0 = s_logisimBus46[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet27  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet22),
                .d(s_logisimNet62),
                .preset(1'b0),
                .q(),
                .qBar(s_logisimBus46[0]),
                .reset(1'b0),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX41P   GPR12M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[12]),
                    .D1(s_logisimBus31[12]),
                    .D2(s_logisimBus46[13]),
                    .D3(s_logisimBus46[11]),
                    .Z(s_logisimNet48));

   MUX41P   GPR11M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[11]),
                    .D1(s_logisimBus31[11]),
                    .D2(s_logisimBus46[12]),
                    .D3(s_logisimBus46[10]),
                    .Z(s_logisimNet72));

   MUX41P   GPR10M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[10]),
                    .D1(s_logisimBus31[10]),
                    .D2(s_logisimBus46[11]),
                    .D3(s_logisimBus46[9]),
                    .Z(s_logisimNet61));

   MUX41P   GPR9M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[9]),
                   .D1(s_logisimBus31[9]),
                   .D2(s_logisimBus46[10]),
                   .D3(s_logisimBus46[8]),
                   .Z(s_logisimNet49));

   MUX41P   GPR8M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[8]),
                   .D1(s_logisimBus31[8]),
                   .D2(s_logisimBus46[9]),
                   .D3(s_logisimBus46[7]),
                   .Z(s_logisimNet70));

   MUX41P   GPR7M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[7]),
                   .D1(s_logisimBus31[7]),
                   .D2(s_logisimBus46[8]),
                   .D3(s_logisimBus46[6]),
                   .Z(s_logisimNet58));

   MUX41P   GPR6M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[6]),
                   .D1(s_logisimBus31[6]),
                   .D2(s_logisimBus46[7]),
                   .D3(s_logisimBus46[5]),
                   .Z(s_logisimNet19));

   MUX41P   GPR5M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[5]),
                   .D1(s_logisimBus31[5]),
                   .D2(s_logisimBus46[6]),
                   .D3(s_logisimBus46[4]),
                   .Z(s_logisimNet71));

   MUX41P   GPR4M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[4]),
                   .D1(s_logisimBus31[4]),
                   .D2(s_logisimBus46[5]),
                   .D3(s_logisimBus46[3]),
                   .Z(s_logisimNet59));

   MUX41P   GPR3M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[3]),
                   .D1(s_logisimBus31[3]),
                   .D2(s_logisimBus46[4]),
                   .D3(s_logisimBus46[2]),
                   .Z(s_logisimNet20));

   MUX41P   GPR2M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[2]),
                   .D1(s_logisimBus31[2]),
                   .D2(s_logisimBus46[3]),
                   .D3(s_logisimBus46[1]),
                   .Z(s_logisimNet64));

   MUX41P   GPR1M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[1]),
                   .D1(s_logisimBus31[1]),
                   .D2(s_logisimBus46[2]),
                   .D3(s_logisimBus46[0]),
                   .Z(s_logisimNet60));

   MUX41P   GPR0M (.A(s_logisimBus53[0]),
                   .B(s_logisimBus53[1]),
                   .D0(s_logisimBus74[0]),
                   .D1(s_logisimBus31[0]),
                   .D2(s_logisimBus46[1]),
                   .D3(s_logisimNet42),
                   .Z(s_logisimNet21));

   MUX41P   GPR15M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[15]),
                    .D1(s_logisimBus31[15]),
                    .D2(s_logisimNet27),
                    .D3(s_logisimBus46[14]),
                    .Z(s_logisimNet50));

   MUX41P   GPR14M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[14]),
                    .D1(s_logisimBus31[14]),
                    .D2(s_logisimBus46[15]),
                    .D3(s_logisimBus46[13]),
                    .Z(s_logisimNet73));

   MUX41P   GPR13M (.A(s_logisimBus53[0]),
                    .B(s_logisimBus53[1]),
                    .D0(s_logisimBus74[13]),
                    .D1(s_logisimBus31[13]),
                    .D2(s_logisimBus46[14]),
                    .D3(s_logisimBus46[12]),
                    .Z(s_logisimNet68));

   SCAN_FF   GPR12FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet48),
                      .Q(s_logisimBus46[12]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[12]));

   SCAN_FF   GPR11FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet72),
                      .Q(s_logisimBus46[11]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[11]));

   SCAN_FF   GPR10FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet61),
                      .Q(s_logisimBus46[10]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[10]));

   SCAN_FF   GPR9FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet49),
                     .Q(s_logisimBus46[9]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[9]));

   SCAN_FF   GPR8FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet70),
                     .Q(s_logisimBus46[8]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[8]));

   SCAN_FF   GPR7FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet58),
                     .Q(s_logisimBus46[7]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[7]));

   SCAN_FF   GPR6FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet19),
                     .Q(s_logisimBus46[6]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[6]));

   SCAN_FF   GPR5FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet71),
                     .Q(s_logisimBus46[5]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[5]));

   SCAN_FF   GPR4FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet59),
                     .Q(s_logisimBus46[4]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[4]));

   SCAN_FF   GPR3FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet20),
                     .Q(s_logisimBus46[3]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[3]));

   SCAN_FF   GPR2FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet64),
                     .Q(s_logisimBus46[2]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[2]));

   SCAN_FF   GPR1FF (.CLK(s_logisimNet22),
                     .D(s_logisimNet60),
                     .Q(s_logisimBus46[1]),
                     .QN(),
                     .TE(s_logisimBus53[2]),
                     .TI(s_logisimBus46[1]));

   MUX21LP   GPR0M21 (.A(s_logisimNet21),
                      .B(s_logisimBus46[0]),
                      .S(s_logisimBus53[2]),
                      .ZN(s_logisimNet62));

   SCAN_FF   GPR15FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet50),
                      .Q(s_logisimBus46[15]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[15]));

   SCAN_FF   GPR14FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet73),
                      .Q(s_logisimBus46[14]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[14]));

   SCAN_FF   GPR13FF (.CLK(s_logisimNet22),
                      .D(s_logisimNet68),
                      .Q(s_logisimBus46[13]),
                      .QN(),
                      .TE(s_logisimBus53[2]),
                      .TI(s_logisimBus46[13]));

endmodule
