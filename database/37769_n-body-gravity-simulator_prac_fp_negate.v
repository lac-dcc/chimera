// This program was cloned from: https://github.com/aniketuppin/n-body-gravity-simulator
// License: Apache License 2.0

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
   assign neg_out = {~neg_out[26],neg_out[25:0]};
   
endmodule
