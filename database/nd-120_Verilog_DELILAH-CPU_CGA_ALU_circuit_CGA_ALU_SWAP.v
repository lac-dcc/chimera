// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_SWAP                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_SWAP( ALUCLK,
                     FIDBO_15_0,
                     SW_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input [15:0] FIDBO_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] SW_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus1;
   wire [15:0] s_logisimBus36;
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
   wire        s_logisimNet5;
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
   assign s_logisimBus1[15:0] = FIDBO_15_0;
   assign s_logisimNet35      = ALUCLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign SW_15_0 = s_logisimBus36[15:0];

   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   R81   SWAP_LO_REG (.A(s_logisimBus1[15]),
                      .B(s_logisimBus1[14]),
                      .C(s_logisimBus1[13]),
                      .CP(s_logisimNet35),
                      .D(s_logisimBus1[12]),
                      .E(s_logisimBus1[11]),
                      .F(s_logisimBus1[10]),
                      .G(s_logisimBus1[9]),
                      .H(s_logisimBus1[8]),
                      .QA(s_logisimBus36[7]),
                      .QAN(),
                      .QB(s_logisimBus36[6]),
                      .QBN(),
                      .QC(s_logisimBus36[5]),
                      .QCN(),
                      .QD(s_logisimBus36[4]),
                      .QDN(),
                      .QE(s_logisimBus36[3]),
                      .QEN(),
                      .QF(s_logisimBus36[2]),
                      .QFN(),
                      .QG(s_logisimBus36[1]),
                      .QGN(),
                      .QH(s_logisimBus36[0]),
                      .QHN());

   R81   SWAP_HI_REG (.A(s_logisimBus1[7]),
                      .B(s_logisimBus1[6]),
                      .C(s_logisimBus1[5]),
                      .CP(s_logisimNet35),
                      .D(s_logisimBus1[4]),
                      .E(s_logisimBus1[3]),
                      .F(s_logisimBus1[2]),
                      .G(s_logisimBus1[1]),
                      .H(s_logisimBus1[0]),
                      .QA(s_logisimBus36[15]),
                      .QAN(),
                      .QB(s_logisimBus36[14]),
                      .QBN(),
                      .QC(s_logisimBus36[13]),
                      .QCN(),
                      .QD(s_logisimBus36[12]),
                      .QDN(),
                      .QE(s_logisimBus36[11]),
                      .QEN(),
                      .QF(s_logisimBus36[10]),
                      .QFN(),
                      .QG(s_logisimBus36[9]),
                      .QGN(),
                      .QH(s_logisimBus36[8]),
                      .QHN());

endmodule
