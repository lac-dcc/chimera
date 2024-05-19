// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF_RBLOCK_LR16                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF_RBLOCK_LR16( ALUCLK,
                            LR_15_0,
                            RB_15_0,
                            R_15_0,
                            WR );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] RB_15_0;
   input        WR;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] LR_15_0;
   output [15:0] R_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus22;
   wire [15:0] s_logisimBus35;
   wire [15:0] s_logisimBus62;
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
   wire        s_logisimNet30;
   wire        s_logisimNet31;
   wire        s_logisimNet32;
   wire        s_logisimNet33;
   wire        s_logisimNet34;
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
   wire        s_logisimNet57;
   wire        s_logisimNet58;
   wire        s_logisimNet59;
   wire        s_logisimNet6;
   wire        s_logisimNet60;
   wire        s_logisimNet61;
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
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus35[15:0] = RB_15_0;
   assign s_logisimNet25       = ALUCLK;
   assign s_logisimNet3        = WR;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign LR_15_0 = s_logisimBus62[15:0];
   assign R_15_0  = s_logisimBus22[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet61 = ~s_logisimNet3;

   // NOT Gate
   assign s_logisimNet15 = ~s_logisimNet24;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet25),
               .input2(s_logisimNet61),
               .result(s_logisimNet24));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   R81P   R_15_8 (.A(s_logisimNet8),
                  .B(s_logisimNet14),
                  .C(s_logisimNet19),
                  .CP(s_logisimNet25),
                  .D(s_logisimNet7),
                  .E(s_logisimNet58),
                  .F(s_logisimNet34),
                  .G(s_logisimNet32),
                  .H(s_logisimNet33),
                  .QA(s_logisimBus22[15]),
                  .QAN(),
                  .QB(s_logisimBus22[14]),
                  .QBN(),
                  .QC(s_logisimBus22[13]),
                  .QCN(),
                  .QD(s_logisimBus22[12]),
                  .QDN(),
                  .QE(s_logisimBus22[11]),
                  .QEN(),
                  .QF(s_logisimBus22[10]),
                  .QFN(),
                  .QG(s_logisimBus22[9]),
                  .QGN(),
                  .QH(s_logisimBus22[8]),
                  .QHN());

   L8   L_15_8 (.A(s_logisimNet8),
                .B(s_logisimNet14),
                .C(s_logisimNet19),
                .D(s_logisimNet7),
                .E(s_logisimNet58),
                .F(s_logisimNet34),
                .G(s_logisimNet32),
                .H(s_logisimNet33),
                .L(s_logisimNet15),
                .QA(s_logisimBus62[15]),
                .QAN(),
                .QB(s_logisimBus62[14]),
                .QBN(),
                .QC(s_logisimBus62[13]),
                .QCN(),
                .QD(s_logisimBus62[12]),
                .QDN(),
                .QE(s_logisimBus62[11]),
                .QEN(),
                .QF(s_logisimBus62[10]),
                .QFN(),
                .QG(s_logisimBus62[9]),
                .QGN(),
                .QH(s_logisimBus62[8]),
                .QHN());

   MUX24P   MUX_7_4 (.A(s_logisimNet3),
                     .D00(s_logisimBus22[7]),
                     .D01(s_logisimBus22[6]),
                     .D02(s_logisimBus22[5]),
                     .D03(s_logisimBus22[4]),
                     .D10(s_logisimBus35[7]),
                     .D11(s_logisimBus35[6]),
                     .D12(s_logisimBus35[5]),
                     .D13(s_logisimBus35[4]),
                     .Z0(s_logisimNet54),
                     .Z1(s_logisimNet38),
                     .Z2(s_logisimNet53),
                     .Z3(s_logisimNet69));

   MUX24P   MUX_3_0 (.A(s_logisimNet3),
                     .D00(s_logisimBus22[3]),
                     .D01(s_logisimBus22[2]),
                     .D02(s_logisimBus22[1]),
                     .D03(s_logisimBus22[0]),
                     .D10(s_logisimBus35[3]),
                     .D11(s_logisimBus35[2]),
                     .D12(s_logisimBus35[1]),
                     .D13(s_logisimBus35[0]),
                     .Z0(s_logisimNet0),
                     .Z1(s_logisimNet1),
                     .Z2(s_logisimNet2),
                     .Z3(s_logisimNet4));

   R81P   R_7_0 (.A(s_logisimNet54),
                 .B(s_logisimNet38),
                 .C(s_logisimNet53),
                 .CP(s_logisimNet25),
                 .D(s_logisimNet69),
                 .E(s_logisimNet0),
                 .F(s_logisimNet1),
                 .G(s_logisimNet2),
                 .H(s_logisimNet4),
                 .QA(s_logisimBus22[7]),
                 .QAN(),
                 .QB(s_logisimBus22[6]),
                 .QBN(),
                 .QC(s_logisimBus22[5]),
                 .QCN(),
                 .QD(s_logisimBus22[4]),
                 .QDN(),
                 .QE(s_logisimBus22[3]),
                 .QEN(),
                 .QF(s_logisimBus22[2]),
                 .QFN(),
                 .QG(s_logisimBus22[1]),
                 .QGN(),
                 .QH(s_logisimBus22[0]),
                 .QHN());

   L8   L_7_0 (.A(s_logisimNet54),
               .B(s_logisimNet38),
               .C(s_logisimNet53),
               .D(s_logisimNet69),
               .E(s_logisimNet0),
               .F(s_logisimNet1),
               .G(s_logisimNet2),
               .H(s_logisimNet4),
               .L(s_logisimNet15),
               .QA(s_logisimBus62[7]),
               .QAN(),
               .QB(s_logisimBus62[6]),
               .QBN(),
               .QC(s_logisimBus62[5]),
               .QCN(),
               .QD(s_logisimBus62[4]),
               .QDN(),
               .QE(s_logisimBus62[3]),
               .QEN(),
               .QF(s_logisimBus62[2]),
               .QFN(),
               .QG(s_logisimBus62[1]),
               .QGN(),
               .QH(s_logisimBus62[0]),
               .QHN());

   MUX24P   MUX_15_12 (.A(s_logisimNet3),
                       .D00(s_logisimBus22[15]),
                       .D01(s_logisimBus22[14]),
                       .D02(s_logisimBus22[13]),
                       .D03(s_logisimBus22[12]),
                       .D10(s_logisimBus35[15]),
                       .D11(s_logisimBus35[14]),
                       .D12(s_logisimBus35[13]),
                       .D13(s_logisimBus35[12]),
                       .Z0(s_logisimNet8),
                       .Z1(s_logisimNet14),
                       .Z2(s_logisimNet19),
                       .Z3(s_logisimNet7));

   MUX24P   MUX_11_8 (.A(s_logisimNet3),
                      .D00(s_logisimBus22[11]),
                      .D01(s_logisimBus22[10]),
                      .D02(s_logisimBus22[9]),
                      .D03(s_logisimBus22[8]),
                      .D10(s_logisimBus35[11]),
                      .D11(s_logisimBus35[10]),
                      .D12(s_logisimBus35[9]),
                      .D13(s_logisimBus35[8]),
                      .Z0(s_logisimNet58),
                      .Z1(s_logisimNet34),
                      .Z2(s_logisimNet32),
                      .Z3(s_logisimNet33));

endmodule
