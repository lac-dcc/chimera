// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : CGA_MAC_PTSEL                                                **
 **                                                                          **
 *****************************************************************************/

module CGA_MAC_PTSEL( MCLK,
                      PONI,
                      PTM,
                      SAPT,
                      SELPTN,
                      SPTN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input MCLK;
   input PONI;
   input PTM;
   input SAPT;
   input SPTN;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output SELPTN;

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
   assign s_logisimNet0  = SAPT;
   assign s_logisimNet10 = MCLK;
   assign s_logisimNet4  = PTM;
   assign s_logisimNet5  = PONI;
   assign s_logisimNet8  = SPTN;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign SELPTN = s_logisimNet3;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Ground
   assign  s_logisimNet9  =  1'b0;


   // NOT Gate
   assign s_logisimNet12 = ~s_logisimNet8;

   // NOT Gate
   assign s_logisimNet11 = ~s_logisimNet6;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   NOR_GATE #(.BubblesMask(2'b11))
      GATES_1 (.input1(s_logisimNet4),
               .input2(s_logisimNet5),
               .result(s_logisimNet6));

   OR_GATE #(.BubblesMask(2'b11))
      GATES_2 (.input1(s_logisimNet8),
               .input2(s_logisimNet7),
               .result(s_logisimNet1));

   OR_GATE_3_INPUTS #(.BubblesMask(3'b111))
      GATES_3 (.input1(s_logisimNet0),
               .input2(s_logisimNet5),
               .input3(s_logisimNet4),
               .result(s_logisimNet2));

   NAND_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet1),
               .input2(s_logisimNet2),
               .result(s_logisimNet3));

   J_K_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet10),
                .j(s_logisimNet12),
                .k(s_logisimNet0),
                .preset(s_logisimNet11),
                .q(),
                .qBar(s_logisimNet7),
                .reset(s_logisimNet9),
                .tick(1'b1));


endmodule
