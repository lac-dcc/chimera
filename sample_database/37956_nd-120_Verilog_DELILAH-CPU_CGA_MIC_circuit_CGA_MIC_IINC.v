// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_IINC                                                 **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_IINC( CIN,
                     IW_12_0,
                     NEXT_12_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input        CIN;
   input [12:0] IW_12_0;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [12:0] NEXT_12_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [12:0] s_logisimBus42;
   wire [12:0] s_logisimBus5;
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
   assign s_logisimBus42[12:0] = IW_12_0;
   assign s_logisimNet31       = CIN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign NEXT_12_0 = s_logisimBus5[12:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet30 = ~s_logisimNet25;

   // NOT Gate
   assign s_logisimNet19 = ~s_logisimNet24;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_1 (.input1(s_logisimBus42[4]),
               .input2(s_logisimBus42[3]),
               .input3(s_logisimBus42[2]),
               .input4(s_logisimBus42[1]),
               .input5(s_logisimBus42[0]),
               .input6(s_logisimNet31),
               .result(s_logisimNet25));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_2 (.input1(s_logisimBus42[9]),
               .input2(s_logisimBus42[8]),
               .input3(s_logisimBus42[7]),
               .input4(s_logisimBus42[6]),
               .input5(s_logisimBus42[5]),
               .input6(s_logisimNet30),
               .result(s_logisimNet24));

   FullAdder #(.extendedBits(2))
      ARITH_3 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus42[4]),
               .dataB(s_logisimNet32),
               .result(s_logisimBus5[4]));

   FullAdder #(.extendedBits(2))
      ARITH_4 (.carryIn(1'b0),
               .carryOut(s_logisimNet18),
               .dataA(s_logisimBus42[5]),
               .dataB(s_logisimNet30),
               .result(s_logisimBus5[5]));

   FullAdder #(.extendedBits(2))
      ARITH_5 (.carryIn(1'b0),
               .carryOut(s_logisimNet9),
               .dataA(s_logisimBus42[6]),
               .dataB(s_logisimNet18),
               .result(s_logisimBus5[6]));

   FullAdder #(.extendedBits(2))
      ARITH_6 (.carryIn(1'b0),
               .carryOut(s_logisimNet0),
               .dataA(s_logisimBus42[7]),
               .dataB(s_logisimNet9),
               .result(s_logisimBus5[7]));

   FullAdder #(.extendedBits(2))
      ARITH_7 (.carryIn(1'b0),
               .carryOut(s_logisimNet4),
               .dataA(s_logisimBus42[8]),
               .dataB(s_logisimNet0),
               .result(s_logisimBus5[8]));

   FullAdder #(.extendedBits(2))
      ARITH_8 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus42[9]),
               .dataB(s_logisimNet4),
               .result(s_logisimBus5[9]));

   FullAdder #(.extendedBits(2))
      ARITH_9 (.carryIn(1'b0),
               .carryOut(s_logisimNet13),
               .dataA(s_logisimBus42[10]),
               .dataB(s_logisimNet19),
               .result(s_logisimBus5[10]));

   FullAdder #(.extendedBits(2))
      ARITH_10 (.carryIn(1'b0),
                .carryOut(s_logisimNet7),
                .dataA(s_logisimBus42[11]),
                .dataB(s_logisimNet13),
                .result(s_logisimBus5[11]));

   FullAdder #(.extendedBits(2))
      ARITH_11 (.carryIn(1'b0),
                .carryOut(),
                .dataA(s_logisimBus42[12]),
                .dataB(s_logisimNet7),
                .result(s_logisimBus5[12]));

   FullAdder #(.extendedBits(2))
      ARITH_12 (.carryIn(1'b0),
                .carryOut(s_logisimNet10),
                .dataA(s_logisimBus42[0]),
                .dataB(s_logisimNet31),
                .result(s_logisimBus5[0]));

   FullAdder #(.extendedBits(2))
      ARITH_13 (.carryIn(1'b0),
                .carryOut(s_logisimNet38),
                .dataA(s_logisimBus42[1]),
                .dataB(s_logisimNet10),
                .result(s_logisimBus5[1]));

   FullAdder #(.extendedBits(2))
      ARITH_14 (.carryIn(1'b0),
                .carryOut(s_logisimNet23),
                .dataA(s_logisimBus42[2]),
                .dataB(s_logisimNet38),
                .result(s_logisimBus5[2]));

   FullAdder #(.extendedBits(2))
      ARITH_15 (.carryIn(1'b0),
                .carryOut(s_logisimNet32),
                .dataA(s_logisimBus42[3]),
                .dataB(s_logisimNet23),
                .result(s_logisimBus5[3]));


endmodule
