// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_APOS_CALCA                                           **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_APOS_CALCA( ECCR,
                           ECCRHIN,
                           ICA_15_0,
                           LCA_15_0,
                           MCA_15_0,
                           MCLK );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ECCRHIN;
   input [15:0] ICA_15_0;
   input        MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output        ECCR;
   output [15:0] LCA_15_0;
   output [9:0]  MCA_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [9:0]  s_logisimBus38;
   wire [15:0] s_logisimBus4;
   wire [15:0] s_logisimBus58;
   wire [9:0]  s_logisimBus73;
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
   wire        s_logisimNet39;
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
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus4[0]  = s_logisimNet13;
   assign s_logisimBus4[2]  = s_logisimNet11;
   assign s_logisimBus4[3]  = s_logisimNet16;
   assign s_logisimBus4[6]  = s_logisimNet9;
   assign s_logisimBus73[0] = s_logisimNet13;
   assign s_logisimBus73[2] = s_logisimNet11;
   assign s_logisimBus73[3] = s_logisimNet16;
   assign s_logisimBus73[6] = s_logisimNet9;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus58[15:0] = ICA_15_0;
   assign s_logisimNet0        = MCLK;
   assign s_logisimNet54       = ECCRHIN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECCR     = s_logisimNet24;
   assign LCA_15_0 = s_logisimBus4[15:0];
   assign MCA_15_0 = s_logisimBus38[9:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet43 = ~s_logisimNet0;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_1 (.input1(s_logisimBus73[0]),
               .input2(s_logisimBus73[1]),
               .input3(s_logisimBus73[2]),
               .input4(s_logisimBus73[3]),
               .input5(s_logisimBus73[4]),
               .result(s_logisimNet29));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      GATES_2 (.input1(s_logisimBus73[5]),
               .input2(s_logisimBus73[6]),
               .input3(s_logisimBus73[7]),
               .input4(s_logisimBus73[8]),
               .input5(s_logisimBus73[9]),
               .result(s_logisimNet64));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_3 (.input1(s_logisimNet54),
               .input2(s_logisimNet29),
               .input3(s_logisimNet64),
               .result(s_logisimNet24));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   R81   R_LO (.A(s_logisimBus38[0]),
               .B(s_logisimBus38[1]),
               .C(s_logisimBus38[2]),
               .CP(s_logisimNet0),
               .D(s_logisimBus38[3]),
               .E(s_logisimBus38[4]),
               .F(s_logisimBus38[5]),
               .G(s_logisimBus38[6]),
               .H(s_logisimBus38[7]),
               .QA(s_logisimNet13),
               .QAN(),
               .QB(s_logisimBus4[1]),
               .QBN(s_logisimBus73[1]),
               .QC(s_logisimNet11),
               .QCN(),
               .QD(s_logisimNet16),
               .QDN(),
               .QE(s_logisimBus4[4]),
               .QEN(s_logisimBus73[4]),
               .QF(s_logisimBus4[5]),
               .QFN(s_logisimBus73[5]),
               .QG(s_logisimNet9),
               .QGN(),
               .QH(s_logisimBus4[7]),
               .QHN(s_logisimBus73[7]));

   R81   R_HI (.A(s_logisimBus38[8]),
               .B(s_logisimBus38[9]),
               .C(s_logisimNet20),
               .CP(s_logisimNet0),
               .D(s_logisimNet27),
               .E(s_logisimNet25),
               .F(s_logisimNet33),
               .G(s_logisimNet40),
               .H(s_logisimNet36),
               .QA(s_logisimBus4[8]),
               .QAN(s_logisimBus73[8]),
               .QB(s_logisimBus4[9]),
               .QBN(s_logisimBus73[9]),
               .QC(s_logisimBus4[10]),
               .QCN(),
               .QD(s_logisimBus4[11]),
               .QDN(),
               .QE(s_logisimBus4[12]),
               .QEN(),
               .QF(s_logisimBus4[13]),
               .QFN(),
               .QG(s_logisimBus4[14]),
               .QGN(),
               .QH(s_logisimBus4[15]),
               .QHN());

   L8   L_LO (.A(s_logisimBus58[0]),
              .B(s_logisimBus58[1]),
              .C(s_logisimBus58[2]),
              .D(s_logisimBus58[3]),
              .E(s_logisimBus58[4]),
              .F(s_logisimBus58[5]),
              .G(s_logisimBus58[6]),
              .H(s_logisimBus58[7]),
              .L(s_logisimNet43),
              .QA(s_logisimBus38[0]),
              .QAN(),
              .QB(s_logisimBus38[1]),
              .QBN(),
              .QC(s_logisimBus38[2]),
              .QCN(),
              .QD(s_logisimBus38[3]),
              .QDN(),
              .QE(s_logisimBus38[4]),
              .QEN(),
              .QF(s_logisimBus38[5]),
              .QFN(),
              .QG(s_logisimBus38[6]),
              .QGN(),
              .QH(s_logisimBus38[7]),
              .QHN());

   L8   L_HI (.A(s_logisimBus58[8]),
              .B(s_logisimBus58[9]),
              .C(s_logisimBus58[10]),
              .D(s_logisimBus58[11]),
              .E(s_logisimBus58[12]),
              .F(s_logisimBus58[13]),
              .G(s_logisimBus58[14]),
              .H(s_logisimBus58[15]),
              .L(s_logisimNet43),
              .QA(s_logisimBus38[8]),
              .QAN(),
              .QB(s_logisimBus38[9]),
              .QBN(),
              .QC(s_logisimNet20),
              .QCN(),
              .QD(s_logisimNet27),
              .QDN(),
              .QE(s_logisimNet25),
              .QEN(),
              .QF(s_logisimNet33),
              .QFN(),
              .QG(s_logisimNet40),
              .QGN(),
              .QH(s_logisimNet36),
              .QHN());

endmodule
