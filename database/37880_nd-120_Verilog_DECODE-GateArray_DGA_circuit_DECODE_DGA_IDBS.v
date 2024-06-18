// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/**************************************************************************
** ND120 DGA (Decode Gate Array)                                         **
** DECODE/DGA/IDBS                                                       **
**                                                                       **
** Page 14 DECODE - DECODE_DGA_IDBS Sheet 1 of 2                         **
** Page 15 DECODE - DECODE_DGA_IDBS Sheet 2 of 2                         **
**                                                                       **
** Last reviewed: 11-MAY-2024                                            **
** Ronny Hansen                                                          **
***************************************************************************/

module DECODE_DGA_IDBS( 
   input       CLK0,
   input       CLK1,
   input [4:0] CSIDBS_4_0,
   input       LCSN,
   input       STAT3,
   input       STAT4,

   output ECSRN,
   output EDON,
   output EIORN,
   output EPANN,
   output EPANSN,
   output EPEAN,
   output EPESN,
   output PRQN,
   output RINRN,
   output RUARTN,
   output TRAALDN,
   output VAL 
);
   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [4:0] s_logisimBus47;
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
   
   wire       s_logisimNet36;
   
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   
   wire       s_logisimNet44;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
   wire       s_logisimNet48;
   wire       s_logisimNet49;
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   
   
   wire       s_logisimNet53;
   wire       s_logisimNet54;
   wire       s_logisimNet55;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   wire       s_logisimNet58;
   wire       s_logisimNet59;
   wire       s_logisimNet6;
   wire       s_logisimNet60;
   wire       s_logisimNet61;
   wire       s_logisimNet62;
   wire       s_logisimNet63;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus47[4:0] = CSIDBS_4_0;
   assign s_logisimNet29      = CLK1;
   assign s_logisimNet39      = CLK0;
   assign s_logisimNet4       = STAT4;
   assign s_logisimNet54      = LCSN;
   assign s_logisimNet7       = STAT3;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ECSRN   = s_logisimNet46;
   assign EDON    = s_logisimNet21;
   assign EIORN   = s_logisimNet45;
   assign EPANN   = s_logisimNet55;
   assign EPANSN  = s_logisimNet41;
   assign EPEAN   = s_logisimNet56;
   assign EPESN   = s_logisimNet58;
   assign PRQN    = s_logisimNet57;
   assign RINRN   = s_logisimNet1;
   assign RUARTN  = s_logisimNet32;
   assign TRAALDN = s_logisimNet23;
   assign VAL     = s_logisimNet10;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Power
   assign  s_logisimNet48  =  1'b1;


   // NOT Gate
   assign s_logisimNet33 = ~s_logisimBus47[0];

   // NOT Gate
   assign s_logisimNet49 = ~s_logisimBus47[1];

   // NOT Gate
   assign s_logisimNet59 = ~s_logisimBus47[2];

   // NOT Gate
   assign s_logisimNet61 = ~s_logisimBus47[3];

   // NOT Gate
   assign s_logisimNet38 = ~s_logisimBus47[4];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NOR_GATE #(.BubblesMask(2'b00))
      A284 (.input1(s_logisimNet17),
            .input2(s_logisimNet40),
            .result(s_logisimNet42));

   NOR_GATE #(.BubblesMask(2'b00))
      A285 (.input1(s_logisimNet19),
            .input2(s_logisimNet15),
            .result(s_logisimNet63));

   NOR_GATE #(.BubblesMask(2'b00))
      A283 (.input1(s_logisimNet18),
            .input2(s_logisimNet36),
            .result(s_logisimNet20));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      A286 (.input1(s_logisimNet2),
            .input2(s_logisimNet4),
            .input3(s_logisimNet54),
            .result(s_logisimNet22));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A264 (.input1(s_logisimNet38),
            .input2(s_logisimNet61),
            .input3(s_logisimNet59),
            .input4(s_logisimNet54),
            .result(s_logisimNet9));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A262 (.input1(s_logisimBus47[4]),
            .input2(s_logisimNet61),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimNet33),
            .input6(s_logisimNet54),
            .result(s_logisimNet44));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A263 (.input1(s_logisimNet38),
            .input2(s_logisimNet61),
            .input3(s_logisimNet33),
            .input4(s_logisimNet54),
            .result(s_logisimNet28));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A258 (.input1(s_logisimBus47[4]),
            .input2(s_logisimNet61),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimBus47[0]),
            .input6(s_logisimNet54),
            .result(s_logisimNet25));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A250 (.input1(s_logisimNet38),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimNet49),
            .input4(s_logisimNet54),
            .result(s_logisimNet0));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      A256 (.input1(s_logisimNet61),
            .input2(s_logisimNet59),
            .input3(s_logisimBus47[1]),
            .input4(s_logisimNet54),
            .result(s_logisimNet27));

   NAND_GATE_8_INPUTS #(.BubblesMask(8'h00))
      A249 (.input1(s_logisimNet9),
            .input2(s_logisimNet28),
            .input3(s_logisimNet0),
            .input4(s_logisimNet27),
            .input5(s_logisimNet12),
            .input6(s_logisimNet6),
            .input7(s_logisimNet16),
            .input8(s_logisimNet60),
            .result(s_logisimNet8));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A265 (.input1(s_logisimBus47[4]),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimNet49),
            .input5(s_logisimBus47[0]),
            .input6(s_logisimNet54),
            .result(s_logisimNet13));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A261 (.input1(s_logisimBus47[4]),
            .input2(s_logisimNet61),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimNet49),
            .input5(s_logisimBus47[0]),
            .input6(s_logisimNet54),
            .result(s_logisimNet12));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A260 (.input1(s_logisimBus47[4]),
            .input2(s_logisimNet61),
            .input3(s_logisimNet59),
            .input4(s_logisimNet49),
            .input5(s_logisimNet54),
            .result(s_logisimNet34));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      A269 (.input1(s_logisimBus47[3]),
            .input2(s_logisimNet59),
            .input3(s_logisimNet49),
            .input4(s_logisimBus47[0]),
            .input5(s_logisimNet54),
            .result(s_logisimNet6));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A255 (.input1(s_logisimBus47[4]),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimNet33),
            .input6(s_logisimNet54),
            .result(s_logisimNet16));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A251 (.input1(s_logisimNet38),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimNet59),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimNet33),
            .input6(s_logisimNet54),
            .result(s_logisimNet30));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_18 (.input1(s_logisimBus47[4]),
                .input2(s_logisimNet61),
                .input3(s_logisimNet59),
                .input4(s_logisimNet49),
                .input5(s_logisimBus47[0]),
                .input6(s_logisimNet54),
                .result(s_logisimNet3));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A252 (.input1(s_logisimNet38),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimNet59),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimBus47[0]),
            .input6(s_logisimNet54),
            .result(s_logisimNet62));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      GATES_20 (.input1(s_logisimBus47[4]),
                .input2(s_logisimBus47[3]),
                .input3(s_logisimBus47[2]),
                .input4(s_logisimBus47[1]),
                .input5(s_logisimBus47[0]),
                .input6(s_logisimNet54),
                .result(s_logisimNet14));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A253 (.input1(s_logisimNet38),
            .input2(s_logisimBus47[3]),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimBus47[1]),
            .input5(s_logisimNet33),
            .input6(s_logisimNet54),
            .result(s_logisimNet11));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      A254 (.input1(s_logisimBus47[4]),
            .input2(s_logisimNet61),
            .input3(s_logisimBus47[2]),
            .input4(s_logisimNet49),
            .input5(s_logisimNet33),
            .input6(s_logisimNet54),
            .result(s_logisimNet50));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_23 (.input1(s_logisimNet10),
                .input2(s_logisimNet4),
                .input3(s_logisimNet53),
                .input4(s_logisimNet54),
                .result(s_logisimNet17));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_24 (.input1(s_logisimNet60),
                .input2(s_logisimNet4),
                .input3(s_logisimNet54),
                .input4(s_logisimNet26),
                .result(s_logisimNet40));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_25 (.input1(s_logisimNet5),
                .input2(s_logisimNet7),
                .input3(s_logisimNet54),
                .result(s_logisimNet19));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_26 (.input1(s_logisimNet7),
                .input2(s_logisimNet54),
                .input3(s_logisimNet31),
                .result(s_logisimNet15));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_27 (.input1(s_logisimNet7),
                .input2(s_logisimNet24),
                .input3(s_logisimNet34),
                .input4(s_logisimNet54),
                .result(s_logisimNet18));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_28 (.input1(s_logisimNet60),
                .input2(s_logisimNet34),
                .input3(s_logisimNet31),
                .input4(s_logisimNet54),
                .result(s_logisimNet36));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   F924   A282 (.C_H05(s_logisimNet29),
                .D0_H01(s_logisimNet22),
                .D1_H02(s_logisimNet42),
                .D2_H03(s_logisimNet63),
                .D3_H04(s_logisimNet20),
                .N01_Q0(),
                .N02_Q1(s_logisimNet2),
                .N03_Q2(s_logisimNet24),
                .N04_Q3(s_logisimNet57),
                .N05_Q0B(s_logisimNet10),
                .N06_Q1B(s_logisimNet26),
                .N07_Q2B(s_logisimNet5),
                .N08_Q3B(s_logisimNet31));

   F091   A277 (.N01(s_logisimNet60),
                .N02());

   F924   A259 (.C_H05(s_logisimNet29),
                .D0_H01(s_logisimNet34),
                .D1_H02(s_logisimNet13),
                .D2_H03(s_logisimNet25),
                .D3_H04(s_logisimNet44),
                .N01_Q0(s_logisimNet41),
                .N02_Q1(s_logisimNet1),
                .N03_Q2(s_logisimNet55),
                .N04_Q3(s_logisimNet23),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(),
                .N08_Q3B());

   F924   A248 (.C_H05(s_logisimNet39),
                .D0_H01(s_logisimNet50),
                .D1_H02(s_logisimNet11),
                .D2_H03(s_logisimNet62),
                .D3_H04(s_logisimNet30),
                .N01_Q0(s_logisimNet46),
                .N02_Q1(s_logisimNet45),
                .N03_Q2(s_logisimNet58),
                .N04_Q3(s_logisimNet56),
                .N05_Q0B(),
                .N06_Q1B(),
                .N07_Q2B(),
                .N08_Q3B());

   F924   A275 (.C_H05(s_logisimNet39),
                .D0_H01(s_logisimNet48),
                .D1_H02(s_logisimNet8),
                .D2_H03(s_logisimNet14),
                .D3_H04(s_logisimNet3),
                .N01_Q0(),
                .N02_Q1(),
                .N03_Q2(s_logisimNet32),
                .N04_Q3(),
                .N05_Q0B(),
                .N06_Q1B(s_logisimNet21),
                .N07_Q2B(),
                .N08_Q3B(s_logisimNet53));

endmodule
