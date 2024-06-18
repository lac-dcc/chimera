// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : SCAN_FF                                                      **
 **                                                                          **
 *****************************************************************************/

module SCAN_FF( CLK,
                D,
                Q,
                QN,
                TE,
                TI );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input D;
   input TE;
   input TI;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output Q;
   output QN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
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
   assign s_logisimNet0 = TE;
   assign s_logisimNet3 = CLK;
   assign s_logisimNet7 = D;
   assign s_logisimNet8 = TI;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign Q  = s_logisimNet5;
   assign QN = s_logisimNet6;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet9 = ~s_logisimNet0;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet7),
               .input2(s_logisimNet9),
               .result(s_logisimNet1));

   AND_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet0),
               .input2(s_logisimNet8),
               .result(s_logisimNet2));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet1),
               .input2(s_logisimNet2),
               .result(s_logisimNet4));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet3),
                .d(s_logisimNet4),
                .preset(1'b0),
                .q(s_logisimNet5),
                .qBar(s_logisimNet6),
                .reset(1'b0),
                .tick(1'b1));


endmodule
