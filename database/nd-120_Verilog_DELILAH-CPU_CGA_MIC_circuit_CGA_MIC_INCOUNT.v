// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MIC_INCOUNT                                              **
 **                                                                          **
 *****************************************************************************/

module CGA_MIC_INCOUNT( CD0,
                        CD1,
                        CSWAN0,
                        CSWAN1,
                        EC,
                        LWCAN,
                        MCLK,
                        MRN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CD0;
   input CD1;
   input EC;
   input LWCAN;
   input MCLK;
   input MRN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output CSWAN0;
   output CSWAN1;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet10;
   wire s_logisimNet11;
   wire s_logisimNet12;
   wire s_logisimNet13;
   wire s_logisimNet14;
   wire s_logisimNet15;
   wire s_logisimNet16;
   wire s_logisimNet17;
   wire s_logisimNet18;
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
   assign s_logisimNet1  = MCLK;
   assign s_logisimNet12 = CD0;
   assign s_logisimNet2  = MRN;
   assign s_logisimNet4  = CD1;
   assign s_logisimNet5  = LWCAN;
   assign s_logisimNet7  = EC;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign CSWAN0 = s_logisimNet16;
   assign CSWAN1 = s_logisimNet14;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet18 = ~s_logisimNet6;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet13;

   // NOT Gate
   assign s_logisimNet10 = ~s_logisimNet2;

   // NOT Gate
   assign s_logisimNet17 = ~s_logisimNet2;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   XOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet7),
               .input2(s_logisimNet0),
               .result(s_logisimNet15));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet0),
               .input2(s_logisimNet7),
               .result(s_logisimNet3));

   XNOR_GATE_ONEHOT #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet3),
               .input2(s_logisimNet9),
               .result(s_logisimNet8));

   Multiplexer_2   PLEXERS_4 (
                              .muxIn_0(s_logisimNet12),
                              .muxIn_1(s_logisimNet15),
                              .muxOut(s_logisimNet6),
                              .sel(s_logisimNet5));

   Multiplexer_2   PLEXERS_5 (
                              .muxIn_0(s_logisimNet4),
                              .muxIn_1(s_logisimNet8),
                              .muxOut(s_logisimNet13),
                              .sel(s_logisimNet5));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet1),
                .d(s_logisimNet18),
                .preset(s_logisimNet10),
                .q(s_logisimNet16),
                .qBar(s_logisimNet0),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_logisimNet1),
                .d(s_logisimNet11),
                .preset(s_logisimNet17),
                .q(s_logisimNet14),
                .qBar(s_logisimNet9),
                .reset(1'b0),
                .tick(1'b1));


endmodule
