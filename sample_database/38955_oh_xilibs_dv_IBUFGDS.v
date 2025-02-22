// This program was cloned from: https://github.com/aolofsson/oh
// License: MIT License


module IBUFGDS (/*AUTOARG*/
   // Outputs
   O,
   // Inputs
   I, IB
   );

   parameter DIFF_TERM=0;
   parameter IOSTANDARD=0;

   input I;
   input IB;
   output O;

   assign O = I & ~IB;
   
   
endmodule // IBUFGDS

