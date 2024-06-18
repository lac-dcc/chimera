// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_STAT                                   **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_STAT( FIDBO3,
                                   FIDBO4,
                                   G,
                                   HIF,
                                   HISIN_2_0,
                                   HISTAT_2_0,
                                   HIVEC_2_0,
                                   LOF,
                                   LOSIN_2_0,
                                   LOSTAT_2_0,
                                   LOVEC_2_0,
                                   MCLK );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input       FIDBO3;
   input       FIDBO4;
   input       G;
   input       HIF;
   input [2:0] HISIN_2_0;
   input [2:0] HIVEC_2_0;
   input       LOF;
   input [2:0] LOSIN_2_0;
   input [2:0] LOVEC_2_0;
   input       MCLK;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [2:0] HISTAT_2_0;
   output [2:0] LOSTAT_2_0;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus13;
   wire [2:0] s_logisimBus17;
   wire [2:0] s_logisimBus24;
   wire [2:0] s_logisimBus32;
   wire [2:0] s_logisimBus38;
   wire [2:0] s_logisimBus44;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
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
   wire       s_logisimNet30;
   wire       s_logisimNet31;
   wire       s_logisimNet33;
   wire       s_logisimNet34;
   wire       s_logisimNet35;
   wire       s_logisimNet36;
   wire       s_logisimNet37;
   wire       s_logisimNet39;
   wire       s_logisimNet4;
   wire       s_logisimNet40;
   wire       s_logisimNet41;
   wire       s_logisimNet42;
   wire       s_logisimNet43;
   wire       s_logisimNet45;
   wire       s_logisimNet46;
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
   assign s_logisimBus13[2:0] = HIVEC_2_0;
   assign s_logisimBus17[2:0] = HISIN_2_0;
   assign s_logisimBus24[2:0] = LOSIN_2_0;
   assign s_logisimBus32[2:0] = LOVEC_2_0;
   assign s_logisimNet11      = MCLK;
   assign s_logisimNet14      = LOF;
   assign s_logisimNet20      = HIF;
   assign s_logisimNet42      = FIDBO4;
   assign s_logisimNet46      = FIDBO3;
   assign s_logisimNet7       = G;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign HISTAT_2_0 = s_logisimBus38[2:0];
   assign LOSTAT_2_0 = s_logisimBus44[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet14;

   // NOT Gate
   assign s_logisimNet8 = ~s_logisimNet7;

   // NOT Gate
   assign s_logisimNet10 = ~s_logisimNet42;

   // NOT Gate
   assign s_logisimNet15 = ~s_logisimNet20;

   // NOT Gate
   assign s_logisimNet29 = ~s_logisimNet46;

   // NOT Gate
   assign s_logisimNet31 = ~s_logisimBus32[2];

   // NOT Gate
   assign s_logisimNet25 = ~s_logisimBus32[1];

   // NOT Gate
   assign s_logisimNet21 = ~s_logisimBus32[0];

   // NOT Gate
   assign s_logisimNet22 = ~s_logisimBus13[2];

   // NOT Gate
   assign s_logisimNet45 = ~s_logisimBus13[1];

   // NOT Gate
   assign s_logisimNet0 = ~s_logisimBus13[0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimBus32[1]),
               .input2(s_logisimNet21),
               .result(s_logisimNet39));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimBus13[1]),
               .input2(s_logisimNet0),
               .result(s_logisimNet35));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_3 (.input1(s_logisimNet25),
               .input2(s_logisimNet21),
               .result(s_logisimNet40));

   AND_GATE #(.BubblesMask(2'b11))
      GATES_4 (.input1(s_logisimNet45),
               .input2(s_logisimNet0),
               .result(s_logisimNet36));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet22),
               .input2(s_logisimNet36),
               .result(s_logisimNet37));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_6 (.input1(s_logisimNet31),
               .input2(s_logisimNet40),
               .result(s_logisimNet41));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT1_LO (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet39),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet6),
                                               .DCDGN(s_logisimNet10),
                                               .GPE(s_logisimNet14),
                                               .SIN(s_logisimBus24[1]),
                                               .STS(s_logisimBus44[1]),
                                               .VINN(s_logisimNet8));

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT2_HI (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet37),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet15),
                                               .DCDGN(s_logisimNet29),
                                               .GPE(s_logisimNet20),
                                               .SIN(s_logisimBus17[2]),
                                               .STS(s_logisimBus38[2]),
                                               .VINN(s_logisimNet8));

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT0_LO (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet21),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet6),
                                               .DCDGN(s_logisimNet10),
                                               .GPE(s_logisimNet14),
                                               .SIN(s_logisimBus24[0]),
                                               .STS(s_logisimBus44[0]),
                                               .VINN(s_logisimNet8));

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT1_HI (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet35),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet15),
                                               .DCDGN(s_logisimNet29),
                                               .GPE(s_logisimNet20),
                                               .SIN(s_logisimBus17[1]),
                                               .STS(s_logisimBus38[1]),
                                               .VINN(s_logisimNet8));

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT0_HI (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet0),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet15),
                                               .DCDGN(s_logisimNet29),
                                               .GPE(s_logisimNet20),
                                               .SIN(s_logisimBus17[0]),
                                               .STS(s_logisimBus38[0]),
                                               .VINN(s_logisimNet8));

   CGA_INTR_CNTLR_VECGEN_STAT_SBIT   SBIT2_LO (.CK(s_logisimNet11),
                                               .DCDF(s_logisimNet41),
                                               .DCDFN(s_logisimNet7),
                                               .DCDG(s_logisimNet6),
                                               .DCDGN(s_logisimNet10),
                                               .GPE(s_logisimNet14),
                                               .SIN(s_logisimBus24[2]),
                                               .STS(s_logisimBus44[2]),
                                               .VINN(s_logisimNet8));

endmodule
