// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : F714                                                         **
 **                                                                          **
 *****************************************************************************/

module F714( H01_T,
             H02_R,
             H03_S,
             N01_Q,
             N02_QB );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input H01_T;
   input H02_R;
   input H03_S;

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

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet2 = H02_R;
   assign s_logisimNet4 = H01_T;
   assign s_logisimNet5 = H03_S;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign N01_Q  = s_logisimNet0;
   assign N02_QB = s_logisimNet1;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet3 = ~s_logisimNet4;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   T_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet4),
                .preset(s_logisimNet5),
                .q(s_logisimNet0),
                .qBar(s_logisimNet1),
                .reset(s_logisimNet2),
                .t(s_logisimNet3),
                .tick(1'b1));


endmodule
