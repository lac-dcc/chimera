// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

//--------------------------------------------------------------------
//
// Author:      Omkar Girish Kamath
// Module:      fp_negate
// Date:        Oct 21st, 2023
// Description: Input is a 27 bit custom floating point number and
//              module output is the negative of the input
//--------------------------------------------------------------------
module fp_negate (
                  in,
                  neg_out
                  );


   //--------------------------------------------------------------------
   // Input
   //--------------------------------------------------------------------
   input wire [26:0] in;
   
   //--------------------------------------------------------------------
   // Output
   //--------------------------------------------------------------------
   output wire [26:0] neg_out ;

   //--------------------------------------------------------------------
   // Module contents
   //--------------------------------------------------------------------
   assign neg_out = {~in[26],in[25:0]};
   
endmodule
