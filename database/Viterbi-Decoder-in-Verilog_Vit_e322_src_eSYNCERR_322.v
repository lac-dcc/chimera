/*============================================================================
   module eSYNCERR_322.v

   Out of Synch Error Detector for  (3,2,2) Viterbi decoder.
   
===========================================================================*/
`timescale 1 ns/1 ns


module eSYNCERR_322  (error, stage, we, metric, reset, clock);


   output error;

   input [3:0] stage;
   input [2:0] metric;
   input       we;
   input       reset;
   input       clock;
   reg 	       error;
   

always @(posedge clock or posedge reset)
  begin
     if (reset)
       error <=1'b0;
     else
       begin
          if (we && stage >=4'b0011 && metric >4'b1000)
            error <=1'b1;
	  else
	    error <=1'b0;
       end
  end



endmodule 
