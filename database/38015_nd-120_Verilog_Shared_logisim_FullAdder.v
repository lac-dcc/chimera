// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : FullAdder                                                    **
 **                                                                          **
 *****************************************************************************/

module FullAdder( carryIn,
                  carryOut,
                  dataA,
                  dataB,
                  result );

   /*******************************************************************************
   ** Here all module parameters are defined with a dummy value                  **
   *******************************************************************************/
   parameter extendedBits = 1;

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input carryIn;
   input dataA;
   input dataB;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output carryOut;
   output result;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [extendedBits-1:0] s_extendedDataA;
   wire [extendedBits-1:0] s_extendedDataB;
   wire [extendedBits-1:0] s_sumResult;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/
   assign   {carryOut, result} = dataA + dataB + carryIn;

endmodule
