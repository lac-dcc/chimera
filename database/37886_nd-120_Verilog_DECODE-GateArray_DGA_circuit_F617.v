// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : F617                                                         **
 **                                                                          **
 *****************************************************************************/

module F617( H01_D,
             H02_C,
             H03_RB,
             H04_SB,
             N01_Q,
             N02_QB );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input H01_D;
   input H02_C;
   input H03_RB;
   input H04_SB;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output N01_Q;
   output N02_QB;

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

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0 = H04_SB;
   assign s_logisimNet1 = H01_D;
   assign s_logisimNet2 = H02_C;
   assign s_logisimNet3 = H03_RB;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign N01_Q  = s_logisimNet4;
   assign N02_QB = s_logisimNet5;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet7 = ~s_logisimNet0;

   // NOT Gate
   assign s_logisimNet6 = ~s_logisimNet3;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet2),
                .d(s_logisimNet1),
                .preset(s_logisimNet7),
                .q(s_logisimNet4),
                .qBar(s_logisimNet5),
                .reset(s_logisimNet6),
                .tick(1'b1));


endmodule
