// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_PTY_PTYENC                             **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_PTY_PTYENC( DET,
                                         RN,
                                         V_2_0 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [7:0] RN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       DET;
   output [2:0] V_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus15;
   wire [7:0] s_logisimBus24;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet27;
   wire       s_logisimNet28;
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
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
   assign s_logisimBus24[7:0] = RN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign DET   = s_logisimNet1;
   assign V_2_0 = s_logisimBus15[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate: V0
   assign s_logisimBus15[0] = ~s_logisimNet18;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimBus24[6];

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimBus24[4];

   // NOT Gate
   assign s_logisimNet16 = ~s_logisimBus24[2];

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimBus24[7];

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimBus24[5];

   // NOT Gate
   assign s_logisimNet21 = ~s_logisimBus24[3];

   // NOT Gate
   assign s_logisimNet9 = ~s_logisimBus24[1];

   // NOT Gate: V2
   assign s_logisimBus15[2] = ~s_logisimNet29;

   // NOT Gate: V1
   assign s_logisimBus15[1] = ~s_logisimNet26;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NOR_GATE #(.BubblesMask(2'b00))
      NR2 (.input1(s_logisimNet21),
           .input2(s_logisimNet16),
           .result(s_logisimNet2));

   NOR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      NRx (.input1(s_logisimBus24[7]),
           .input2(s_logisimNet23),
           .input3(s_logisimNet20),
           .input4(s_logisimNet10),
           .result(s_logisimNet18));

   NAND_GATE #(.BubblesMask(2'b00))
      ND2 (.input1(s_logisimBus24[6]),
           .input2(s_logisimNet17),
           .result(s_logisimNet23));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      ND3 (.input1(s_logisimBus24[6]),
           .input2(s_logisimBus24[4]),
           .input3(s_logisimNet21),
           .result(s_logisimNet20));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      ND4 (.input1(s_logisimBus24[6]),
           .input2(s_logisimBus24[4]),
           .input3(s_logisimBus24[2]),
           .input4(s_logisimNet9),
           .result(s_logisimNet10));

   OR_GATE_8_INPUTS #(.BubblesMask(8'hFF))
      ND8P (.input1(s_logisimBus24[0]),
            .input2(s_logisimBus24[1]),
            .input3(s_logisimBus24[2]),
            .input4(s_logisimBus24[3]),
            .input5(s_logisimBus24[4]),
            .input6(s_logisimBus24[5]),
            .input7(s_logisimBus24[6]),
            .input8(s_logisimBus24[7]),
            .result(s_logisimNet1));

   NOR_GATE_4_INPUTS #(.BubblesMask(4'h0))
      NR4 (.input1(s_logisimNet0),
           .input2(s_logisimNet17),
           .input3(s_logisimNet11),
           .input4(s_logisimNet6),
           .result(s_logisimNet29));

   OR_GATE #(.BubblesMask(2'b00))
      OR2 (.input1(s_logisimNet6),
           .input2(s_logisimNet11),
           .result(s_logisimNet25));

   NOR_GATE #(.BubblesMask(2'b00))
      O1 (.input1(s_logisimNet25),
          .input2(s_logisimNet28),
          .result(s_logisimNet26));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      NR3 (.input1(s_logisimNet17),
           .input2(s_logisimNet0),
           .input3(s_logisimNet2),
           .result(s_logisimNet28));


endmodule
