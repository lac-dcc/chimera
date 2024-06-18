// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : Comparator                                                   **
 **                                                                          **
 *****************************************************************************/

module Comparator( aEqualsB,
                   aGreaterThanB,
                   aLessThanB,
                   dataA,
                   dataB );

   /*******************************************************************************
   ** Here all module parameters are defined with a dummy value                  **
   *******************************************************************************/
   parameter nrOfBits = 1;
   parameter twosComplement = 1;

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [nrOfBits-1:0] dataA;
   input [nrOfBits-1:0] dataB;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output aEqualsB;
   output aGreaterThanB;
   output aLessThanB;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire s_signedGreater;
   wire s_signedLess;
   wire s_unsignedGreater;
   wire s_unsignedLess;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/
   assign s_signedLess      = ($signed(dataA) < $signed(dataB));
   assign s_unsignedLess    = (dataA < dataB);
   assign s_signedGreater   = ($signed(dataA) > $signed(dataB));
   assign s_unsignedGreater = (dataA > dataB);

   assign aEqualsB      = (dataA == dataB);
   assign aGreaterThanB = (twosComplement==1) ? s_signedGreater : s_unsignedGreater;
   assign aLessThanB    = (twosComplement==1) ? s_signedLess : s_unsignedLess;

endmodule
