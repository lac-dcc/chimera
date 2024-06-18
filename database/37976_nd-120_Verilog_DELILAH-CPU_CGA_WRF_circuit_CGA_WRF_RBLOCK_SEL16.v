// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_WRF_RBLOCK_SEL16                                         **
 **                                                                          **
 *****************************************************************************/

module CGA_WRF_RBLOCK_SEL16( EA_15_0,
                             EB_15_0,
                             PA,
                             PB,
                             SI_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] EA_15_0;
   input [15:0] EB_15_0;
   input [15:0] SI_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output PA;
   output PB;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus48;
   wire [15:0] s_logisimBus58;
   wire [15:0] s_logisimBus61;
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
   wire        s_logisimNet62;
   wire        s_logisimNet63;
   wire        s_logisimNet64;
   wire        s_logisimNet65;
   wire        s_logisimNet66;
   wire        s_logisimNet67;
   wire        s_logisimNet68;
   wire        s_logisimNet7;
   wire        s_logisimNet8;
   wire        s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus48[15:0] = EB_15_0;
   assign s_logisimBus58[15:0] = EA_15_0;
   assign s_logisimBus61[15:0] = SI_15_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PA = s_logisimNet30;
   assign PB = s_logisimNet67;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_1 (.input1(s_logisimNet55),
               .input2(s_logisimNet36),
               .input3(s_logisimNet42),
               .input4(s_logisimNet11),
               .input5(s_logisimNet12),
               .input6(s_logisimNet14),
               .input7(s_logisimNet1),
               .input8(s_logisimNet5),
               .result(s_logisimNet30));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_2 (.input1(s_logisimNet40),
               .input2(s_logisimNet15),
               .input3(s_logisimNet3),
               .input4(s_logisimNet33),
               .input5(s_logisimNet62),
               .input6(s_logisimNet45),
               .input7(s_logisimNet31),
               .input8(s_logisimNet41),
               .result(s_logisimNet67));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   A02   A11_10 (.A(s_logisimBus61[11]),
                 .B(s_logisimBus58[11]),
                 .C(s_logisimBus61[10]),
                 .D(s_logisimBus58[10]),
                 .Z(s_logisimNet42));

   A02   A9_8 (.A(s_logisimBus61[9]),
               .B(s_logisimBus58[9]),
               .C(s_logisimBus61[8]),
               .D(s_logisimBus58[8]),
               .Z(s_logisimNet11));

   A02   A7_6 (.A(s_logisimBus61[7]),
               .B(s_logisimBus58[7]),
               .C(s_logisimBus61[6]),
               .D(s_logisimBus58[6]),
               .Z(s_logisimNet12));

   A02   A5_4 (.A(s_logisimBus61[5]),
               .B(s_logisimBus58[5]),
               .C(s_logisimBus61[4]),
               .D(s_logisimBus58[4]),
               .Z(s_logisimNet14));

   A02   A3_2 (.A(s_logisimBus61[3]),
               .B(s_logisimBus58[3]),
               .C(s_logisimBus61[2]),
               .D(s_logisimBus58[2]),
               .Z(s_logisimNet1));

   A02   A1_0 (.A(s_logisimBus61[1]),
               .B(s_logisimBus58[1]),
               .C(s_logisimBus61[0]),
               .D(s_logisimBus58[0]),
               .Z(s_logisimNet5));

   A02   A15_14 (.A(s_logisimBus61[15]),
                 .B(s_logisimBus58[15]),
                 .C(s_logisimBus61[14]),
                 .D(s_logisimBus58[14]),
                 .Z(s_logisimNet55));

   A02   A13_12 (.A(s_logisimBus61[13]),
                 .B(s_logisimBus58[13]),
                 .C(s_logisimBus61[12]),
                 .D(s_logisimBus58[12]),
                 .Z(s_logisimNet36));

   A02   B11_10 (.A(s_logisimBus61[11]),
                 .B(s_logisimBus48[11]),
                 .C(s_logisimBus61[10]),
                 .D(s_logisimBus48[10]),
                 .Z(s_logisimNet3));

   A02   B9_8 (.A(s_logisimBus61[9]),
               .B(s_logisimBus48[9]),
               .C(s_logisimBus61[8]),
               .D(s_logisimBus48[8]),
               .Z(s_logisimNet33));

   A02   B7_6 (.A(s_logisimBus61[7]),
               .B(s_logisimBus48[7]),
               .C(s_logisimBus61[6]),
               .D(s_logisimBus48[6]),
               .Z(s_logisimNet62));

   A02   B5_4 (.A(s_logisimBus61[5]),
               .B(s_logisimBus48[5]),
               .C(s_logisimBus61[4]),
               .D(s_logisimBus48[4]),
               .Z(s_logisimNet45));

   A02   B4_3 (.A(s_logisimBus61[3]),
               .B(s_logisimBus48[3]),
               .C(s_logisimBus61[2]),
               .D(s_logisimBus48[2]),
               .Z(s_logisimNet31));

   A02   B1_0 (.A(s_logisimBus61[1]),
               .B(s_logisimBus48[1]),
               .C(s_logisimBus61[0]),
               .D(s_logisimBus48[0]),
               .Z(s_logisimNet41));

   A02   B15_14 (.A(s_logisimBus61[15]),
                 .B(s_logisimBus48[15]),
                 .C(s_logisimBus61[14]),
                 .D(s_logisimBus48[14]),
                 .Z(s_logisimNet40));

   A02   B13_12 (.A(s_logisimBus61[13]),
                 .B(s_logisimBus48[13]),
                 .C(s_logisimBus61[12]),
                 .D(s_logisimBus48[12]),
                 .Z(s_logisimNet15));

endmodule
