// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_OUTMUX_IDBS                                          **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_OUTMUX_IDBS( ALUCLK,
                            ALUD2N,
                            CSIDBS_4_0,
                            EA,
                            EAARG,
                            EABARG,
                            EARG,
                            EBARG,
                            EBMG,
                            EDBR,
                            EF,
                            EFIDB,
                            EGPRH,
                            EGPRL,
                            EGPRS,
                            ESTS,
                            ESWAP );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       ALUCLK;
   input       ALUD2N;
   input [4:0] CSIDBS_4_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output EA;
   output EAARG;
   output EABARG;
   output EARG;
   output EBARG;
   output EBMG;
   output EDBR;
   output EF;
   output EFIDB;
   output EGPRH;
   output EGPRL;
   output EGPRS;
   output ESTS;
   output ESWAP;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0] s_logisimBus37;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet24;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
   wire       s_logisimNet47;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus37[4:0] = CSIDBS_4_0;
   assign s_logisimNet16      = ALUCLK;
   assign s_logisimNet34      = ALUD2N;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign EA     = s_logisimNet19;
   assign EAARG  = s_logisimNet47;
   assign EABARG = s_logisimNet40;
   assign EARG   = s_logisimNet3;
   assign EBARG  = s_logisimNet27;
   assign EBMG   = s_logisimNet22;
   assign EDBR   = s_logisimNet36;
   assign EF     = s_logisimNet30;
   assign EFIDB  = s_logisimNet48;
   assign EGPRH  = s_logisimNet28;
   assign EGPRL  = s_logisimNet41;
   assign EGPRS  = s_logisimNet29;
   assign ESTS   = s_logisimNet21;
   assign ESWAP  = s_logisimNet11;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet20 = ~s_logisimNet9;

   // NOT Gate
   assign s_logisimNet47 = ~s_logisimNet31;

   // NOT Gate
   assign s_logisimNet48 = ~s_logisimNet32;

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet42;

   // NOT Gate
   assign s_logisimNet21 = ~s_logisimNet43;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimNet22 = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimNet36 = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimNet14 = ~s_logisimNet34;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet30 = ~s_logisimNet1;

   // NOT Gate
   assign s_logisimNet26 = ~s_logisimBus37[4];

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimBus37[3];

   // NOT Gate
   assign s_logisimNet5 = ~s_logisimBus37[2];

   // NOT Gate
   assign s_logisimNet35 = ~s_logisimBus37[0];

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimBus37[3];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet4),
               .input2(s_logisimNet7),
               .result(s_logisimNet9));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet24),
               .input2(s_logisimNet2),
               .result(s_logisimNet12));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_3 (.input1(s_logisimNet23),
               .input2(s_logisimNet24),
               .input3(s_logisimNet18),
               .input4(s_logisimNet8),
               .input5(s_logisimNet15),
               .input6(s_logisimNet17),
               .input7(s_logisimNet20),
               .input8(s_logisimNet2),
               .result(s_logisimNet33));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet14),
               .input2(s_logisimNet10),
               .result(s_logisimNet0));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet34),
               .input2(s_logisimNet10),
               .result(s_logisimNet1));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet26),
               .input2(s_logisimBus37[3]),
               .result(s_logisimNet38));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_7 (.input1(s_logisimBus37[4]),
               .input2(s_logisimNet6),
               .input3(s_logisimNet5),
               .input4(s_logisimBus37[1]),
               .input5(s_logisimNet35),
               .result(s_logisimNet2));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_8 (.input1(s_logisimNet25),
               .input2(s_logisimNet26),
               .result(s_logisimNet39));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   ND38GLP   IDBS_G2 (.A(s_logisimBus37[0]),
                      .B(s_logisimBus37[1]),
                      .C(s_logisimBus37[2]),
                      .G(s_logisimNet38),
                      .Z0(s_logisimNet4),
                      .Z1(s_logisimNet17),
                      .Z2(),
                      .Z3(),
                      .Z4(s_logisimNet7),
                      .Z5(),
                      .Z6(),
                      .Z7());

   ND38GLP   IDBS_G1 (.A(s_logisimBus37[0]),
                      .B(s_logisimBus37[1]),
                      .C(s_logisimBus37[2]),
                      .G(s_logisimNet39),
                      .Z0(s_logisimNet13),
                      .Z1(s_logisimNet23),
                      .Z2(s_logisimNet24),
                      .Z3(s_logisimNet18),
                      .Z4(s_logisimNet8),
                      .Z5(),
                      .Z6(s_logisimNet15),
                      .Z7());

   R81P   IDBS_R2 (.A(s_logisimNet7),
                   .B(s_logisimNet9),
                   .C(s_logisimNet33),
                   .CP(s_logisimNet16),
                   .D(s_logisimNet12),
                   .E(s_logisimNet2),
                   .F(1'b0),
                   .G(1'b0),
                   .H(1'b0),
                   .QA(s_logisimNet31),
                   .QAN(),
                   .QB(s_logisimNet40),
                   .QBN(),
                   .QC(s_logisimNet32),
                   .QCN(),
                   .QD(s_logisimNet41),
                   .QDN(),
                   .QE(),
                   .QEN(s_logisimNet29),
                   .QF(),
                   .QFN(),
                   .QG(),
                   .QGN(),
                   .QH(),
                   .QHN());

   R81P   IDBS_R1 (.A(s_logisimNet13),
                   .B(s_logisimNet23),
                   .C(s_logisimNet24),
                   .CP(s_logisimNet16),
                   .D(s_logisimNet18),
                   .E(s_logisimNet8),
                   .F(s_logisimNet15),
                   .G(s_logisimNet4),
                   .H(s_logisimNet17),
                   .QA(),
                   .QAN(s_logisimNet10),
                   .QB(s_logisimNet45),
                   .QBN(),
                   .QC(),
                   .QCN(s_logisimNet28),
                   .QD(s_logisimNet46),
                   .QDN(),
                   .QE(s_logisimNet42),
                   .QEN(),
                   .QF(s_logisimNet43),
                   .QFN(),
                   .QG(),
                   .QGN(s_logisimNet27),
                   .QH(s_logisimNet44),
                   .QHN());

endmodule
