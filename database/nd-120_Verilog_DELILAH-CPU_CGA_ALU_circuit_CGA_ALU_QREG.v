// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_QREG                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_QREG( ALUCLK,
                     F_15_0,
                     QLI,
                     QSEL_1_0,
                     Q_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] F_15_0;
   input        QLI;
   input [1:0]  QSEL_1_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] Q_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus11;
   wire [1:0]  s_logisimBus19;
   wire [15:0] s_logisimBus31;
   wire        s_logisimNet0;
   wire        s_logisimNet1;
   wire        s_logisimNet10;
   wire        s_logisimNet12;
   wire        s_logisimNet13;
   wire        s_logisimNet14;
   wire        s_logisimNet15;
   wire        s_logisimNet16;
   wire        s_logisimNet17;
   wire        s_logisimNet18;
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
   wire        s_logisimNet55;
   wire        s_logisimNet56;
   wire        s_logisimNet6;
   wire        s_logisimNet7;
   wire        s_logisimNet8;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus19[1:0]  = QSEL_1_0;
   assign s_logisimBus31[15:0] = F_15_0;
   assign s_logisimNet12       = ALUCLK;
   assign s_logisimNet21       = QLI;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Q_15_0 = s_logisimBus11[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX41P   MUXQ15 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[7]),
                    .D1(s_logisimBus31[15]),
                    .D2(s_logisimBus11[6]),
                    .D3(s_logisimBus11[8]),
                    .Z(s_logisimNet20));

   MUX41P   MUXQ10 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[2]),
                    .D1(s_logisimBus31[10]),
                    .D2(s_logisimBus11[1]),
                    .D3(s_logisimBus11[3]),
                    .Z(s_logisimNet6));

   MUX41P   MUXQ9 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[1]),
                   .D1(s_logisimBus31[9]),
                   .D2(s_logisimBus11[0]),
                   .D3(s_logisimBus11[2]),
                   .Z(s_logisimNet0));

   MUX41P   MUXQ8 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[0]),
                   .D1(s_logisimBus31[8]),
                   .D2(s_logisimBus11[15]),
                   .D3(s_logisimBus11[1]),
                   .Z(s_logisimNet10));

   MUX41P   MUXQ7 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[15]),
                   .D1(s_logisimBus31[7]),
                   .D2(s_logisimBus11[14]),
                   .D3(s_logisimBus11[0]),
                   .Z(s_logisimNet7));

   MUX41P   MUXQ6 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[14]),
                   .D1(s_logisimBus31[6]),
                   .D2(s_logisimBus11[13]),
                   .D3(s_logisimBus11[15]),
                   .Z(s_logisimNet15));

   MUX41P   MUXQ5 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[13]),
                   .D1(s_logisimBus31[5]),
                   .D2(s_logisimBus11[12]),
                   .D3(s_logisimBus11[14]),
                   .Z(s_logisimNet30));

   MUX41P   MUXQ4 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[12]),
                   .D1(s_logisimBus31[4]),
                   .D2(s_logisimBus11[11]),
                   .D3(s_logisimBus11[13]),
                   .Z(s_logisimNet4));

   MUX41P   MUXQ3 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[11]),
                   .D1(s_logisimBus31[3]),
                   .D2(s_logisimBus11[10]),
                   .D3(s_logisimBus11[12]),
                   .Z(s_logisimNet13));

   MUX41P   MUXQ2 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[10]),
                   .D1(s_logisimBus31[2]),
                   .D2(s_logisimBus11[9]),
                   .D3(s_logisimBus11[11]),
                   .Z(s_logisimNet17));

   MUX41P   MUXQ1 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[9]),
                   .D1(s_logisimBus31[1]),
                   .D2(s_logisimBus11[8]),
                   .D3(s_logisimBus11[10]),
                   .Z(s_logisimNet14));

   MUX41P   MUXQ14 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[6]),
                    .D1(s_logisimBus31[14]),
                    .D2(s_logisimBus11[5]),
                    .D3(s_logisimBus11[7]),
                    .Z(s_logisimNet3));

   MUX41P   MUXQ0 (.A(s_logisimBus19[0]),
                   .B(s_logisimBus19[1]),
                   .D0(s_logisimBus11[8]),
                   .D1(s_logisimBus31[0]),
                   .D2(s_logisimNet21),
                   .D3(s_logisimBus11[9]),
                   .Z(s_logisimNet5));

   MUX41P   MUXQ13 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[5]),
                    .D1(s_logisimBus31[13]),
                    .D2(s_logisimBus11[4]),
                    .D3(s_logisimBus11[6]),
                    .Z(s_logisimNet18));

   MUX41P   MUXQ12 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[4]),
                    .D1(s_logisimBus31[12]),
                    .D2(s_logisimBus11[3]),
                    .D3(s_logisimBus11[5]),
                    .Z(s_logisimNet32));

   MUX41P   MUXQ11 (.A(s_logisimBus19[0]),
                    .B(s_logisimBus19[1]),
                    .D0(s_logisimBus11[3]),
                    .D1(s_logisimBus31[11]),
                    .D2(s_logisimBus11[2]),
                    .D3(s_logisimBus11[4]),
                    .Z(s_logisimNet8));

   R81P   REG_Q_LO (.A(s_logisimNet7),
                    .B(s_logisimNet15),
                    .C(s_logisimNet30),
                    .CP(s_logisimNet12),
                    .D(s_logisimNet4),
                    .E(s_logisimNet13),
                    .F(s_logisimNet17),
                    .G(s_logisimNet14),
                    .H(s_logisimNet5),
                    .QA(s_logisimBus11[15]),
                    .QAN(),
                    .QB(s_logisimBus11[14]),
                    .QBN(),
                    .QC(s_logisimBus11[13]),
                    .QCN(),
                    .QD(s_logisimBus11[12]),
                    .QDN(),
                    .QE(s_logisimBus11[11]),
                    .QEN(),
                    .QF(s_logisimBus11[10]),
                    .QFN(),
                    .QG(s_logisimBus11[9]),
                    .QGN(),
                    .QH(s_logisimBus11[8]),
                    .QHN());

   R81P   REG_Q_HI (.A(s_logisimNet20),
                    .B(s_logisimNet3),
                    .C(s_logisimNet18),
                    .CP(s_logisimNet12),
                    .D(s_logisimNet32),
                    .E(s_logisimNet8),
                    .F(s_logisimNet6),
                    .G(s_logisimNet0),
                    .H(s_logisimNet10),
                    .QA(s_logisimBus11[7]),
                    .QAN(),
                    .QB(s_logisimBus11[6]),
                    .QBN(),
                    .QC(s_logisimBus11[5]),
                    .QCN(),
                    .QD(s_logisimBus11[4]),
                    .QDN(),
                    .QE(s_logisimBus11[3]),
                    .QEN(),
                    .QF(s_logisimBus11[2]),
                    .QFN(),
                    .QG(s_logisimBus11[1]),
                    .QGN(),
                    .QH(s_logisimBus11[0]),
                    .QHN());

endmodule
