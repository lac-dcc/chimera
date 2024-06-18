// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_APOS_INC                                             **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_APOS_INC( LCA_15_0,
                         NLCA_15_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [15:0] LCA_15_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [15:0] NLCA_15_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [15:0] s_logisimBus32;
   wire [15:0] s_logisimBus44;
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
   wire        s_logisimNet45;
   wire        s_logisimNet46;
   wire        s_logisimNet47;
   wire        s_logisimNet48;
   wire        s_logisimNet49;
   wire        s_logisimNet5;
   wire        s_logisimNet50;
   wire        s_logisimNet51;
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
   assign s_logisimBus32[15:0] = LCA_15_0;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign NLCA_15_0 = s_logisimBus44[15:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet27  =  1'b1;


   // NOT Gate
   assign s_logisimNet5 = ~s_logisimNet45;

   // NOT Gate
   assign s_logisimNet42 = ~s_logisimNet51;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      GATES_1 (.input1(s_logisimBus32[7]),
               .input2(s_logisimBus32[6]),
               .input3(s_logisimBus32[5]),
               .input4(s_logisimBus32[4]),
               .input5(s_logisimBus32[3]),
               .input6(s_logisimBus32[2]),
               .input7(s_logisimBus32[1]),
               .input8(s_logisimBus32[0]),
               .result(s_logisimNet45));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_2 (.input1(s_logisimBus32[12]),
               .input2(s_logisimBus32[11]),
               .input3(s_logisimBus32[10]),
               .input4(s_logisimBus32[9]),
               .input5(s_logisimBus32[8]),
               .input6(s_logisimNet5),
               .result(s_logisimNet51));

   FullAdder #(.extendedBits(2))
      ARITH_3 (.carryIn(1'b0),
               .carryOut(s_logisimNet24),
               .dataA(s_logisimBus32[5]),
               .dataB(s_logisimNet2),
               .result(s_logisimBus44[5]));

   FullAdder #(.extendedBits(2))
      ARITH_4 (.carryIn(1'b0),
               .carryOut(s_logisimNet23),
               .dataA(s_logisimBus32[6]),
               .dataB(s_logisimNet24),
               .result(s_logisimBus44[6]));

   FullAdder #(.extendedBits(2))
      ARITH_5 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus32[7]),
               .dataB(s_logisimNet23),
               .result(s_logisimBus44[7]));

   FullAdder #(.extendedBits(2))
      ARITH_6 (.carryIn(1'b0),
               .carryOut(s_logisimNet34),
               .dataA(s_logisimBus32[8]),
               .dataB(s_logisimNet5),
               .result(s_logisimBus44[8]));

   FullAdder #(.extendedBits(2))
      ARITH_7 (.carryIn(1'b0),
               .carryOut(s_logisimNet8),
               .dataA(s_logisimBus32[9]),
               .dataB(s_logisimNet34),
               .result(s_logisimBus44[9]));

   FullAdder #(.extendedBits(2))
      ARITH_8 (.carryIn(1'b0),
               .carryOut(s_logisimNet1),
               .dataA(s_logisimBus32[10]),
               .dataB(s_logisimNet8),
               .result(s_logisimBus44[10]));

   FullAdder #(.extendedBits(2))
      ARITH_9 (.carryIn(1'b0),
               .carryOut(s_logisimNet3),
               .dataA(s_logisimBus32[11]),
               .dataB(s_logisimNet1),
               .result(s_logisimBus44[11]));

   FullAdder #(.extendedBits(2))
      ARITH_10 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus32[12]),
                .dataB(s_logisimNet3),
                .result(s_logisimBus44[12]));

   FullAdder #(.extendedBits(2))
      ARITH_11 (.carryIn(1'b0),
                .carryOut(s_logisimNet26),
                .dataA(s_logisimBus32[13]),
                .dataB(s_logisimNet42),
                .result(s_logisimBus44[13]));

   FullAdder #(.extendedBits(2))
      ARITH_12 (.carryIn(1'b0),
                .carryOut(s_logisimNet17),
                .dataA(s_logisimBus32[14]),
                .dataB(s_logisimNet26),
                .result(s_logisimBus44[14]));

   FullAdder #(.extendedBits(2))
      ARITH_13 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus32[15]),
                .dataB(s_logisimNet17),
                .result(s_logisimBus44[15]));

   FullAdder #(.extendedBits(2))
      ARITH_14 (.carryIn(1'b0),
                .carryOut(s_logisimNet35),
                .dataA(s_logisimBus32[0]),
                .dataB(s_logisimNet27),
                .result(s_logisimBus44[0]));

   FullAdder #(.extendedBits(2))
      ARITH_15 (.carryIn(1'b0),
                .carryOut(s_logisimNet39),
                .dataA(s_logisimBus32[1]),
                .dataB(s_logisimNet35),
                .result(s_logisimBus44[1]));

   FullAdder #(.extendedBits(2))
      ARITH_16 (.carryIn(1'b0),
                .carryOut(s_logisimNet0),
                .dataA(s_logisimBus32[2]),
                .dataB(s_logisimNet39),
                .result(s_logisimBus44[2]));

   FullAdder #(.extendedBits(2))
      ARITH_17 (.carryIn(1'b0),
                .carryOut(s_logisimNet6),
                .dataA(s_logisimBus32[3]),
                .dataB(s_logisimNet0),
                .result(s_logisimBus44[3]));

   FullAdder #(.extendedBits(2))
      ARITH_18 (.carryIn(1'b0),
                .carryOut(s_logisimNet2),
                .dataA(s_logisimBus32[4]),
                .dataB(s_logisimNet6),
                .result(s_logisimBus44[4]));


endmodule
