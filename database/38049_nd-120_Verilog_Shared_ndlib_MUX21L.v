// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : MUX21L                                                       **
 **                                                                          **
 *****************************************************************************/

module MUX21L( A,
               B,
               S,
               ZN );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A;
   input B;
   input S;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output ZN;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_logisimNet0;
   wire s_logisimNet1;
   wire s_logisimNet2;
   wire s_logisimNet3;
   wire s_logisimNet4;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet1 = S;
   assign s_logisimNet3 = A;
   assign s_logisimNet4 = B;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ZN = s_logisimNet2;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // NOT Gate
   assign s_logisimNet2 = ~s_logisimNet0;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Multiplexer_2   PLEXERS_1 (
                              .muxIn_0(s_logisimNet3),
                              .muxIn_1(s_logisimNet4),
                              .muxOut(s_logisimNet0),
                              .sel(s_logisimNet1));


endmodule
