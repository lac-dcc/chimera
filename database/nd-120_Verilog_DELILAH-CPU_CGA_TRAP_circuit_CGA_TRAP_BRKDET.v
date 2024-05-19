// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TRAP_BRKDET                                              **
 **                                                                          **
 *****************************************************************************/

module CGA_TRAP_BRKDET( BRKN,
                        CBRKN,
                        ETRAPN,
                        FTRAPN,
                        IFETCH,
                        IFETCHN,
                        IINDN,
                        INTRQ,
                        IPCR_1_0,
                        IPCR_1_0_N,
                        IPT_15_9,
                        IPT_15_9_N,
                        IWRITE,
                        IWRITEN,
                        TRAPN,
                        VACC,
                        VTRAPN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       CBRKN;
   input       ETRAPN;
   input       FTRAPN;
   input       IFETCH;
   input       IFETCHN;
   input       IINDN;
   input       INTRQ;
   input [1:0] IPCR_1_0;
   input [1:0] IPCR_1_0_N;
   input [6:0] IPT_15_9;
   input [6:0] IPT_15_9_N;
   input       IWRITE;
   input       IWRITEN;
   input       VACC;
   input       VTRAPN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output BRKN;
   output TRAPN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [1:0] s_logisimBus12;
   wire [6:0] s_logisimBus28;
   wire [1:0] s_logisimBus49;
   wire [6:0] s_logisimBus55;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
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
   wire       s_logisimNet29;
   wire       s_logisimNet3;
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
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
   wire       s_logisimNet5;
   wire       s_logisimNet50;
   wire       s_logisimNet51;
   wire       s_logisimNet52;
   wire       s_logisimNet53;
   wire       s_logisimNet54;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   wire       s_logisimNet58;
   wire       s_logisimNet59;
   wire       s_logisimNet6;
   wire       s_logisimNet60;
   wire       s_logisimNet61;
   wire       s_logisimNet62;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus12[1:0] = IPCR_1_0;
   assign s_logisimBus28[6:0] = IPT_15_9;
   assign s_logisimBus49[1:0] = IPCR_1_0_N;
   assign s_logisimBus55[6:0] = IPT_15_9_N;
   assign s_logisimNet0       = IWRITEN;
   assign s_logisimNet1       = IFETCHN;
   assign s_logisimNet11      = VACC;
   assign s_logisimNet3       = CBRKN;
   assign s_logisimNet33      = INTRQ;
   assign s_logisimNet38      = ETRAPN;
   assign s_logisimNet40      = IINDN;
   assign s_logisimNet44      = VTRAPN;
   assign s_logisimNet51      = IWRITE;
   assign s_logisimNet57      = FTRAPN;
   assign s_logisimNet6       = IFETCH;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign BRKN  = s_logisimNet16;
   assign TRAPN = s_logisimNet36;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet24 = ~s_logisimNet44;

   // NOT Gate
   assign s_logisimNet59 = ~s_logisimNet3;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      IPV (.input1(s_logisimNet11),
           .input2(s_logisimBus55[5]),
           .input3(s_logisimBus55[4]),
           .result(s_logisimNet13));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet11),
               .input2(s_logisimNet51),
               .result(s_logisimNet42));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      WIP (.input1(s_logisimNet42),
           .input2(s_logisimBus28[6]),
           .input3(s_logisimBus28[3]),
           .result(s_logisimNet41));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_4 (.input1(s_logisimNet11),
               .input2(s_logisimNet6),
               .input3(s_logisimBus12[0]),
               .result(s_logisimNet32));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_5 (.input1(s_logisimNet13),
               .input2(s_logisimNet41),
               .input3(s_logisimNet23),
               .input4(s_logisimNet34),
               .result(s_logisimNet14));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      RD2 (.input1(s_logisimNet32),
           .input2(s_logisimBus55[1]),
           .input3(s_logisimBus55[0]),
           .result(s_logisimNet23));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_7 (.input1(s_logisimNet11),
               .input2(s_logisimBus49[0]),
               .result(s_logisimNet2));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      RV3 (.input1(s_logisimNet2),
           .input2(s_logisimBus28[1]),
           .input3(s_logisimBus28[0]),
           .result(s_logisimNet34));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      PGF (.input1(s_logisimNet11),
           .input2(s_logisimBus55[6]),
           .input3(s_logisimBus55[5]),
           .input4(s_logisimBus55[4]),
           .result(s_logisimNet54));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_10 (.input1(s_logisimNet54),
                .input2(s_logisimNet47),
                .input3(s_logisimNet53),
                .input4(s_logisimNet50),
                .result(s_logisimNet43));

   NAND_GATE #(.BubblesMask(2'b00))
      INTR (.input1(s_logisimNet6),
            .input2(s_logisimNet33),
            .result(s_logisimNet47));

   NOR_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_12 (.input1(s_logisimNet43),
                .input2(s_logisimNet14),
                .input3(s_logisimNet52),
                .result(s_logisimNet61));

   NOR_GATE #(.BubblesMask(2'b11))
      GATES_13 (.input1(s_logisimNet61),
                .input2(s_logisimNet3),
                .result(s_logisimNet16));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_14 (.input1(s_logisimNet24),
                .input2(s_logisimNet11),
                .result(s_logisimNet53));

   NAND_GATE #(.BubblesMask(2'b11))
      GATES_15 (.input1(s_logisimNet57),
                .input2(s_logisimNet1),
                .result(s_logisimNet50));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_16 (.input1(s_logisimNet16),
                .input2(s_logisimNet59),
                .input3(s_logisimNet38),
                .result(s_logisimNet36));

   AND_GATE #(.BubblesMask(2'b00))
      AN2_1 (.input1(s_logisimNet11),
             .input2(s_logisimNet51),
             .result(s_logisimNet48));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_18 (.input1(s_logisimNet11),
                .input2(s_logisimNet6),
                .result(s_logisimNet56));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_19 (.input1(s_logisimNet11),
                .input2(s_logisimNet0),
                .input3(s_logisimNet40),
                .input4(s_logisimNet1),
                .result(s_logisimNet62));

   OR_GATE_4_INPUTS #(.BubblesMask(4'hF))
      GATES_20 (.input1(s_logisimNet35),
                .input2(s_logisimNet45),
                .input3(s_logisimNet15),
                .input4(s_logisimNet58),
                .result(s_logisimNet52));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_21 (.input1(s_logisimNet11),
                .input2(s_logisimNet6),
                .input3(s_logisimBus12[1]),
                .result(s_logisimNet29));

   AND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_22 (.input1(s_logisimNet11),
                .input2(s_logisimNet6),
                .input3(s_logisimBus12[1]),
                .input4(s_logisimBus12[0]),
                .result(s_logisimNet19));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_23 (.input1(s_logisimNet11),
                .input2(s_logisimBus49[1]),
                .result(s_logisimNet21));

   AND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_24 (.input1(s_logisimNet11),
                .input2(s_logisimBus49[1]),
                .input3(s_logisimBus49[0]),
                .result(s_logisimNet22));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   A02   A02_1 (.A(s_logisimBus55[4]),
                .B(s_logisimNet56),
                .C(s_logisimBus55[6]),
                .D(s_logisimNet48),
                .Z(s_logisimNet35));

   A02   A02_2 (.A(s_logisimBus55[2]),
                .B(s_logisimNet11),
                .C(s_logisimBus55[5]),
                .D(s_logisimNet62),
                .Z(s_logisimNet45));

   A02   A02_3 (.A(s_logisimBus55[0]),
                .B(s_logisimNet19),
                .C(s_logisimBus55[1]),
                .D(s_logisimNet29),
                .Z(s_logisimNet15));

   A02   A02_4 (.A(s_logisimBus28[0]),
                .B(s_logisimNet22),
                .C(s_logisimBus28[1]),
                .D(s_logisimNet21),
                .Z(s_logisimNet58));

endmodule
