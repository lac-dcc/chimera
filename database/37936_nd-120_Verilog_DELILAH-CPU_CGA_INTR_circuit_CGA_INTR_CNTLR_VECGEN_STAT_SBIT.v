// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_INTR_CNTLR_VECGEN_STAT_SBIT                              **
 **                                                                          **
 *****************************************************************************/

module CGA_INTR_CNTLR_VECGEN_STAT_SBIT( CK,
                                        DCDF,
                                        DCDFN,
                                        DCDG,
                                        DCDGN,
                                        GPE,
                                        SIN,
                                        STS,
                                        VINN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CK;
   input DCDF;
   input DCDFN;
   input DCDG;
   input DCDGN;
   input GPE;
   input SIN;
   input VINN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output STS;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;
   wire s_logisimNet5;
   wire s_logisimNet6;
   wire s_logisimNet7;
   wire s_logisimNet8;
   wire s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet10 = VINN;
   assign s_logisimNet11 = DCDGN;
   assign s_logisimNet2  = GPE;
   assign s_logisimNet4  = DCDFN;
   assign s_logisimNet5  = DCDG;
   assign s_logisimNet6  = CK;
   assign s_logisimNet8  = SIN;
   assign s_logisimNet9  = DCDF;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign STS = s_logisimNet3;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NAND_GATE_4_INPUTS #(.BubblesMask(4'h0))
      GATES_1 (.input1(s_logisimNet8),
               .input2(s_logisimNet5),
               .input3(s_logisimNet9),
               .input4(s_logisimNet2),
               .result(s_logisimNet0));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_2 (.input1(s_logisimNet5),
               .input2(s_logisimNet4),
               .input3(s_logisimNet3),
               .result(s_logisimNet12));

   NAND_GATE_3_INPUTS #(.BubblesMask(3'b000))
      GATES_3 (.input1(s_logisimNet10),
               .input2(s_logisimNet2),
               .input3(s_logisimNet11),
               .result(s_logisimNet1));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_4 (.input1(s_logisimNet0),
               .input2(s_logisimNet12),
               .input3(s_logisimNet1),
               .result(s_logisimNet7));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet6),
                .d(s_logisimNet7),
                .preset(1'b0),
                .q(s_logisimNet3),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));


endmodule
