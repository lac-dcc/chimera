// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_ALU_STS                                                  **
 **                                                                          **
 *****************************************************************************/

module CGA_ALU_STS( ALUCLK,
                    CRY,
                    CSTS_1_0,
                    FIDBO_15_0,
                    LDPILN,
                    MI,
                    OVF,
                    STS_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        ALUCLK;
   input        CRY;
   input [1:0]  CSTS_1_0;
   input [15:0] FIDBO_15_0;
   input        LDPILN;
   input        MI;
   input        OVF;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] STS_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0]  s_logisimBus22;
   wire [15:0] s_logisimBus47;
   wire [15:0] s_logisimBus66;
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
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus22[1:0]  = CSTS_1_0;
   assign s_logisimBus66[15:0] = FIDBO_15_0;
   assign s_logisimNet15       = LDPILN;
   assign s_logisimNet2        = ALUCLK;
   assign s_logisimNet39       = OVF;
   assign s_logisimNet42       = MI;
   assign s_logisimNet60       = CRY;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign STS_15_0 = s_logisimBus47[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimBus47[7] = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimBus47[6] = ~s_logisimNet43;

   // NOT Gate
   assign s_logisimBus47[5] = ~s_logisimNet11;

   // NOT Gate
   assign s_logisimBus47[4] = ~s_logisimNet56;

   // NOT Gate
   assign s_logisimBus47[11] = ~s_logisimNet40;

   // NOT Gate
   assign s_logisimBus47[10] = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimBus47[9] = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimBus47[8] = ~s_logisimNet59;

   // NOT Gate
   assign s_logisimBus47[3] = ~s_logisimNet41;

   // NOT Gate
   assign s_logisimBus47[2] = ~s_logisimNet54;

   // NOT Gate
   assign s_logisimBus47[1] = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimBus47[0] = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimBus47[15] = ~s_logisimNet20;

   // NOT Gate
   assign s_logisimBus47[14] = ~s_logisimNet21;

   // NOT Gate
   assign s_logisimBus47[13] = ~s_logisimNet49;

   // NOT Gate
   assign s_logisimBus47[12] = ~s_logisimNet61;

   // NOT Gate
   assign s_logisimNet52 = ~s_logisimNet39;

   // NOT Gate
   assign s_logisimNet31 = ~s_logisimBus22[1];

   // NOT Gate
   assign s_logisimNet12 = ~s_logisimBus22[0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet52),
               .input2(s_logisimNet11),
               .result(s_logisimNet63));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus22[1]),
               .input2(s_logisimBus22[0]),
               .result(s_logisimNet14));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   MUX31LP   STS6_MUX (.A(s_logisimNet31),
                       .B(s_logisimNet12),
                       .D0(s_logisimBus66[6]),
                       .D1(s_logisimNet60),
                       .D2(s_logisimBus47[6]),
                       .ZN(s_logisimNet27));

   MUX31LP   STS5_MUX (.A(s_logisimNet31),
                       .B(s_logisimNet12),
                       .D0(s_logisimBus66[5]),
                       .D1(s_logisimNet63),
                       .D2(s_logisimBus47[5]),
                       .ZN(s_logisimNet19));

   MUX31LP   STS4_MUX (.A(s_logisimNet31),
                       .B(s_logisimNet12),
                       .D0(s_logisimBus66[4]),
                       .D1(s_logisimNet39),
                       .D2(s_logisimBus47[4]),
                       .ZN(s_logisimNet33));

   MUX41P   STS7_MUX (.A(s_logisimNet31),
                      .B(s_logisimNet12),
                      .D0(s_logisimBus66[7]),
                      .D1(s_logisimBus47[7]),
                      .D2(s_logisimNet42),
                      .D3(s_logisimBus47[7]),
                      .Z(s_logisimNet64));

   R41P   STS_REG_MID (.A(s_logisimNet64),
                       .B(s_logisimNet27),
                       .C(s_logisimNet19),
                       .CP(s_logisimNet2),
                       .D(s_logisimNet33),
                       .QA(),
                       .QAN(s_logisimNet46),
                       .QB(s_logisimNet43),
                       .QBN(),
                       .QC(s_logisimNet11),
                       .QCN(),
                       .QD(s_logisimNet56),
                       .QDN());

   SCAN_FF   STS11_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[11]),
                       .Q(),
                       .QN(s_logisimNet40),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[11]));

   SCAN_FF   STS10_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[10]),
                       .Q(),
                       .QN(s_logisimNet6),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[10]));

   SCAN_FF   STS9_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[9]),
                      .Q(),
                      .QN(s_logisimNet44),
                      .TE(s_logisimNet15),
                      .TI(s_logisimBus47[9]));

   SCAN_FF   STS8_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[8]),
                      .Q(),
                      .QN(s_logisimNet59),
                      .TE(s_logisimNet15),
                      .TI(s_logisimBus47[8]));

   SCAN_FF   STS3_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[3]),
                      .Q(),
                      .QN(s_logisimNet41),
                      .TE(s_logisimNet14),
                      .TI(s_logisimBus47[3]));

   SCAN_FF   STS2_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[2]),
                      .Q(),
                      .QN(s_logisimNet54),
                      .TE(s_logisimNet14),
                      .TI(s_logisimBus47[2]));

   SCAN_FF   STS1_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[1]),
                      .Q(),
                      .QN(s_logisimNet7),
                      .TE(s_logisimNet14),
                      .TI(s_logisimBus47[1]));

   SCAN_FF   STS0_FF (.CLK(s_logisimNet2),
                      .D(s_logisimBus66[0]),
                      .Q(),
                      .QN(s_logisimNet45),
                      .TE(s_logisimNet14),
                      .TI(s_logisimBus47[0]));

   SCAN_FF   STS15_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[15]),
                       .Q(),
                       .QN(s_logisimNet20),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[15]));

   SCAN_FF   STS14_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[14]),
                       .Q(),
                       .QN(s_logisimNet21),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[14]));

   SCAN_FF   STS13_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[13]),
                       .Q(),
                       .QN(s_logisimNet49),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[13]));

   SCAN_FF   STS12_FF (.CLK(s_logisimNet2),
                       .D(s_logisimBus66[12]),
                       .Q(),
                       .QN(s_logisimNet61),
                       .TE(s_logisimNet15),
                       .TI(s_logisimBus47[12]));

endmodule
