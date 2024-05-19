// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF_RBLOCK_PREG                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF_RBLOCK_PREG( ALUCLK,
                            ALUCLKN,
                            NLCA_15_0,
                            PR_15_0,
                            P_15_0,
                            RB_15_0,
                            WR2,
                            XFETCHN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input        ALUCLKN;
   input [15:0] NLCA_15_0;
   input [15:0] RB_15_0;
   input        WR2;
   input        XFETCHN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] PR_15_0;
   output [15:0] P_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus39;
   wire [15:0] s_logisimBus40;
   wire [15:0] s_logisimBus58;
   wire [15:0] s_logisimBus88;
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
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
   wire        s_logisimNet35;
   wire        s_logisimNet36;
   wire        s_logisimNet37;
   wire        s_logisimNet38;
   wire        s_logisimNet4;
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
   wire        s_logisimNet57;
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
   wire        s_logisimNet74;
   wire        s_logisimNet75;
   wire        s_logisimNet76;
   wire        s_logisimNet77;
   wire        s_logisimNet78;
   wire        s_logisimNet79;
   wire        s_logisimNet8;
   wire        s_logisimNet80;
   wire        s_logisimNet81;
   wire        s_logisimNet82;
   wire        s_logisimNet83;
   wire        s_logisimNet84;
   wire        s_logisimNet85;
   wire        s_logisimNet86;
   wire        s_logisimNet87;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus39[15:0] = RB_15_0;
   assign s_logisimBus88[15:0] = NLCA_15_0;
   assign s_logisimNet15       = WR2;
   assign s_logisimNet27       = ALUCLK;
   assign s_logisimNet5        = ALUCLKN;
   assign s_logisimNet55       = XFETCHN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PR_15_0 = s_logisimBus40[15:0];
   assign P_15_0  = s_logisimBus58[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet55;

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX31LP   R0 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[0]),
                 .D1(s_logisimBus88[0]),
                 .D2(s_logisimBus39[0]),
                 .ZN(s_logisimNet87));

   MUX31LP   R1 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[1]),
                 .D1(s_logisimBus88[1]),
                 .D2(s_logisimBus39[1]),
                 .ZN(s_logisimNet54));

   MUX31LP   R2 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[2]),
                 .D1(s_logisimBus88[2]),
                 .D2(s_logisimBus39[2]),
                 .ZN(s_logisimNet75));

   MUX31LP   R3 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[3]),
                 .D1(s_logisimBus88[3]),
                 .D2(s_logisimBus39[3]),
                 .ZN(s_logisimNet77));

   MUX31LP   R4 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[4]),
                 .D1(s_logisimBus88[4]),
                 .D2(s_logisimBus39[4]),
                 .ZN(s_logisimNet66));

   MUX31LP   R5 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[5]),
                 .D1(s_logisimBus88[5]),
                 .D2(s_logisimBus39[5]),
                 .ZN(s_logisimNet49));

   MUX31LP   R6 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[6]),
                 .D1(s_logisimBus88[6]),
                 .D2(s_logisimBus39[6]),
                 .ZN(s_logisimNet10));

   MUX31LP   R7 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[7]),
                 .D1(s_logisimBus88[7]),
                 .D2(s_logisimBus39[7]),
                 .ZN(s_logisimNet79));

   R81P   R_P_0_7 (.A(s_logisimNet87),
                   .B(s_logisimNet54),
                   .C(s_logisimNet75),
                   .CP(s_logisimNet27),
                   .D(s_logisimNet77),
                   .E(s_logisimNet66),
                   .F(s_logisimNet49),
                   .G(s_logisimNet10),
                   .H(s_logisimNet79),
                   .QA(),
                   .QAN(s_logisimBus58[0]),
                   .QB(),
                   .QBN(s_logisimBus58[1]),
                   .QC(),
                   .QCN(s_logisimBus58[2]),
                   .QD(),
                   .QDN(s_logisimBus58[3]),
                   .QE(),
                   .QEN(s_logisimBus58[4]),
                   .QF(),
                   .QFN(s_logisimBus58[5]),
                   .QG(),
                   .QGN(s_logisimBus58[6]),
                   .QH(),
                   .QHN(s_logisimBus58[7]));

   L8   L_PR_7_0 (.A(s_logisimNet87),
                  .B(s_logisimNet54),
                  .C(s_logisimNet75),
                  .D(s_logisimNet77),
                  .E(s_logisimNet66),
                  .F(s_logisimNet49),
                  .G(s_logisimNet10),
                  .H(s_logisimNet79),
                  .L(s_logisimNet5),
                  .QA(),
                  .QAN(s_logisimBus40[0]),
                  .QB(),
                  .QBN(s_logisimBus40[1]),
                  .QC(),
                  .QCN(s_logisimBus40[2]),
                  .QD(),
                  .QDN(s_logisimBus40[3]),
                  .QE(),
                  .QEN(s_logisimBus40[4]),
                  .QF(),
                  .QFN(s_logisimBus40[5]),
                  .QG(),
                  .QGN(s_logisimBus40[6]),
                  .QH(),
                  .QHN(s_logisimBus40[7]));

   MUX31LP   R8 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[8]),
                 .D1(s_logisimBus88[8]),
                 .D2(s_logisimBus39[8]),
                 .ZN(s_logisimNet0));

   MUX31LP   R9 (.A(s_logisimNet20),
                 .B(s_logisimNet15),
                 .D0(s_logisimBus58[9]),
                 .D1(s_logisimBus88[9]),
                 .D2(s_logisimBus39[9]),
                 .ZN(s_logisimNet23));

   MUX31LP   R10 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[10]),
                  .D1(s_logisimBus88[10]),
                  .D2(s_logisimBus39[10]),
                  .ZN(s_logisimNet85));

   MUX31LP   R11 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[11]),
                  .D1(s_logisimBus88[11]),
                  .D2(s_logisimBus39[11]),
                  .ZN(s_logisimNet84));

   MUX31LP   R12 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[12]),
                  .D1(s_logisimBus88[12]),
                  .D2(s_logisimBus39[12]),
                  .ZN(s_logisimNet8));

   MUX31LP   R13 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[13]),
                  .D1(s_logisimBus88[13]),
                  .D2(s_logisimBus39[13]),
                  .ZN(s_logisimNet37));

   MUX31LP   R14 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[14]),
                  .D1(s_logisimBus88[14]),
                  .D2(s_logisimBus39[14]),
                  .ZN(s_logisimNet24));

   MUX31LP   R15 (.A(s_logisimNet20),
                  .B(s_logisimNet15),
                  .D0(s_logisimBus58[15]),
                  .D1(s_logisimBus88[15]),
                  .D2(s_logisimBus39[15]),
                  .ZN(s_logisimNet65));

   R81P   R_P_8_15 (.A(s_logisimNet0),
                    .B(s_logisimNet23),
                    .C(s_logisimNet85),
                    .CP(s_logisimNet27),
                    .D(s_logisimNet84),
                    .E(s_logisimNet8),
                    .F(s_logisimNet37),
                    .G(s_logisimNet24),
                    .H(s_logisimNet65),
                    .QA(),
                    .QAN(s_logisimBus58[8]),
                    .QB(),
                    .QBN(s_logisimBus58[9]),
                    .QC(),
                    .QCN(s_logisimBus58[10]),
                    .QD(),
                    .QDN(s_logisimBus58[11]),
                    .QE(),
                    .QEN(s_logisimBus58[12]),
                    .QF(),
                    .QFN(s_logisimBus58[13]),
                    .QG(),
                    .QGN(s_logisimBus58[14]),
                    .QH(),
                    .QHN(s_logisimBus58[15]));

   L8   L_PR_8_15 (.A(s_logisimNet0),
                   .B(s_logisimNet23),
                   .C(s_logisimNet85),
                   .D(s_logisimNet84),
                   .E(s_logisimNet8),
                   .F(s_logisimNet37),
                   .G(s_logisimNet24),
                   .H(s_logisimNet65),
                   .L(s_logisimNet5),
                   .QA(),
                   .QAN(s_logisimBus40[8]),
                   .QB(),
                   .QBN(s_logisimBus40[9]),
                   .QC(),
                   .QCN(s_logisimBus40[10]),
                   .QD(),
                   .QDN(s_logisimBus40[11]),
                   .QE(),
                   .QEN(s_logisimBus40[12]),
                   .QF(),
                   .QFN(s_logisimBus40[13]),
                   .QG(),
                   .QGN(s_logisimBus40[14]),
                   .QH(),
                   .QHN(s_logisimBus40[15]));

endmodule
