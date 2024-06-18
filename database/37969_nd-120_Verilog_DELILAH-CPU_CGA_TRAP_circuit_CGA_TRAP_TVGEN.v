// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_TRAP_TVGEN                                               **
 **                                                                          **
 *****************************************************************************/

module CGA_TRAP_TVGEN( DSTOPN,
                       FTRAPN,
                       IFETCH,
                       IFETCHN,
                       IIND,
                       IINDN,
                       INTRQ,
                       IPCR_1_0,
                       IPCR_1_0_N,
                       IPT_15_9,
                       IPT_15_9_N,
                       IWRITE,
                       IWRITEN,
                       PAN,
                       PONI,
                       PVIOL,
                       RESTR,
                       TCLK,
                       TVEC_3_0,
                       VACC,
                       VTRAPN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       DSTOPN;
   input       FTRAPN;
   input       IFETCH;
   input       IFETCHN;
   input       IIND;
   input       IINDN;
   input       INTRQ;
   input [1:0] IPCR_1_0;
   input [1:0] IPCR_1_0_N;
   input [6:0] IPT_15_9;
   input [6:0] IPT_15_9_N;
   input       IWRITE;
   input       IWRITEN;
   input       PAN;
   input       PONI;
   input       TCLK;
   input       VACC;
   input       VTRAPN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output       PVIOL;
   output       RESTR;
   output [3:0] TVEC_3_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [6:0] s_logisimBus23;
   wire [1:0] s_logisimBus40;
   wire [6:0] s_logisimBus49;
   wire [3:0] s_logisimBus54;
   wire [1:0] s_logisimBus8;
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
   wire       s_logisimNet37;
   wire       s_logisimNet38;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
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
   wire       s_logisimNet55;
   wire       s_logisimNet56;
   wire       s_logisimNet57;
   wire       s_logisimNet58;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus23[6:0] = IPT_15_9;
   assign s_logisimBus40[1:0] = IPCR_1_0_N;
   assign s_logisimBus49[6:0] = IPT_15_9_N;
   assign s_logisimBus8[1:0]  = IPCR_1_0;
   assign s_logisimNet13      = IFETCH;
   assign s_logisimNet15      = TCLK;
   assign s_logisimNet19      = IWRITE;
   assign s_logisimNet24      = IFETCHN;
   assign s_logisimNet34      = VTRAPN;
   assign s_logisimNet36      = DSTOPN;
   assign s_logisimNet38      = IWRITEN;
   assign s_logisimNet42      = IIND;
   assign s_logisimNet44      = PONI;
   assign s_logisimNet5       = IINDN;
   assign s_logisimNet51      = FTRAPN;
   assign s_logisimNet52      = INTRQ;
   assign s_logisimNet57      = PAN;
   assign s_logisimNet6       = VACC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign PVIOL    = s_logisimNet41;
   assign RESTR    = s_logisimNet11;
   assign TVEC_3_0 = s_logisimBus54[3:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet48 = ~s_logisimNet4;

   // NOT Gate
   assign s_logisimNet43 = ~s_logisimNet56;

   // NOT Gate
   assign s_logisimNet29 = ~s_logisimNet46;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   OR_GATE_8_INPUTS #(.BubblesMask(8'hFF))
      GATES_1 (.input1(s_logisimNet4),
               .input2(s_logisimNet32),
               .input3(s_logisimNet47),
               .input4(s_logisimNet22),
               .input5(s_logisimNet21),
               .input6(s_logisimNet12),
               .input7(s_logisimNet14),
               .input8(s_logisimNet17),
               .result(s_logisimNet55));

   OR_GATE_5_INPUTS #(.BubblesMask({1'b1, 4'hF}))
      GATES_2 (.input1(s_logisimNet4),
               .input2(s_logisimNet32),
               .input3(s_logisimNet47),
               .input4(s_logisimNet22),
               .input5(s_logisimNet21),
               .result(s_logisimNet41));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_3 (.input1(s_logisimNet17),
               .input2(s_logisimNet14),
               .input3(s_logisimNet12),
               .result(s_logisimNet53));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      WIPN (.input1(s_logisimNet6),
            .input2(s_logisimNet19),
            .input3(s_logisimBus23[6]),
            .input4(s_logisimBus49[3]),
            .result(s_logisimNet46));

   NAND_GATE #(.BubblesMask(2'b00))
      PGUN (.input1(s_logisimNet6),
            .input2(s_logisimBus49[2]),
            .result(s_logisimNet56));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      RD1N (.input1(s_logisimNet6),
            .input2(s_logisimNet13),
            .input3(s_logisimBus23[4]),
            .input4(s_logisimBus49[1]),
            .input5(s_logisimBus8[1]),
            .result(s_logisimNet10));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      RD2N (.input1(s_logisimNet6),
            .input2(s_logisimNet13),
            .input3(s_logisimBus23[4]),
            .input4(s_logisimBus49[1]),
            .input5(s_logisimBus49[0]),
            .input6(s_logisimBus8[0]),
            .result(s_logisimNet37));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      RD3N (.input1(s_logisimNet6),
            .input2(s_logisimNet13),
            .input3(s_logisimBus23[4]),
            .input4(s_logisimBus49[0]),
            .input5(s_logisimBus8[1]),
            .input6(s_logisimBus8[0]),
            .result(s_logisimNet30));

   OR_GATE_5_INPUTS #(.BubblesMask({1'b1, 4'hF}))
      GATES_9 (.input1(s_logisimNet46),
               .input2(s_logisimNet56),
               .input3(s_logisimNet10),
               .input4(s_logisimNet37),
               .input5(s_logisimNet30),
               .result(s_logisimNet45));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_10 (.input1(s_logisimNet30),
                .input2(s_logisimNet37),
                .input3(s_logisimNet10),
                .result(s_logisimNet58));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_11 (.input1(s_logisimBus40[1]),
                .input2(s_logisimNet44),
                .result(s_logisimNet11));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      PGFN (.input1(s_logisimNet6),
            .input2(s_logisimBus49[6]),
            .input3(s_logisimBus49[5]),
            .input4(s_logisimBus49[4]),
            .result(s_logisimNet4));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      WPVN (.input1(s_logisimNet6),
            .input2(s_logisimNet19),
            .input3(s_logisimNet5),
            .input4(s_logisimNet24),
            .input5(s_logisimBus49[6]),
            .result(s_logisimNet32));

   NAND_GATE_6_INPUTS #(.BubblesMask({2'b00, 4'h0}))
      IPVN (.input1(s_logisimNet6),
            .input2(s_logisimNet38),
            .input3(s_logisimNet42),
            .input4(s_logisimNet24),
            .input5(s_logisimBus49[5]),
            .input6(s_logisimBus49[4]),
            .result(s_logisimNet47));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      FPVN (.input1(s_logisimNet6),
            .input2(s_logisimNet38),
            .input3(s_logisimNet5),
            .input4(s_logisimNet13),
            .input5(s_logisimBus49[4]),
            .result(s_logisimNet22));

   NAND_GATE_5_INPUTS #(.BubblesMask({1'b0, 4'h0}))
      RPVN (.input1(s_logisimNet6),
            .input2(s_logisimNet38),
            .input3(s_logisimNet5),
            .input4(s_logisimNet24),
            .input5(s_logisimBus49[5]),
            .result(s_logisimNet21));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      RV1N (.input1(s_logisimNet6),
            .input2(s_logisimBus23[1]),
            .input3(s_logisimBus40[1]),
            .result(s_logisimNet12));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      RV2N (.input1(s_logisimNet6),
            .input2(s_logisimBus23[0]),
            .input3(s_logisimBus40[1]),
            .input4(s_logisimBus40[0]),
            .result(s_logisimNet14));

   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      RV3N (.input1(s_logisimNet6),
            .input2(s_logisimBus23[1]),
            .input3(s_logisimBus23[0]),
            .input4(s_logisimBus40[0]),
            .result(s_logisimNet17));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_TRAP_TVGEN_P2   TRAP_TVGEN (.DSTOPN(s_logisimNet36),
                                   .FTRAPN(s_logisimNet51),
                                   .IFETCH(s_logisimNet13),
                                   .INTRQ(s_logisimNet52),
                                   .LEV1(s_logisimNet55),
                                   .LEV2(s_logisimNet45),
                                   .PAN(s_logisimNet57),
                                   .PGF(s_logisimNet48),
                                   .PGU(s_logisimNet43),
                                   .PGUN(s_logisimNet56),
                                   .PVIOL(s_logisimNet41),
                                   .RD(s_logisimNet58),
                                   .RV(s_logisimNet53),
                                   .TCLK(s_logisimNet15),
                                   .TVEC_3_0(s_logisimBus54[3:0]),
                                   .VACC(s_logisimNet6),
                                   .VTRAPN(s_logisimNet34),
                                   .WIP(s_logisimNet29),
                                   .WIPN(s_logisimNet46));

endmodule
