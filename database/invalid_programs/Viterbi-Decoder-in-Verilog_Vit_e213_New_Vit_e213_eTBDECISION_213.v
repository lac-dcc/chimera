/*=================================================================
   module eTBDECISION_213.v

   Traceback Decision Unit for (2,1,3) decoder

   Determine pointer to initial state for traceback
   by finding the state with minimum accumulated metric

   John O'Shea, joshea@emc.com
==================================================================*/

`timescale 1 ns/1 ns

module eTBDECISION_213 (best_state,
                        in0, in1, in2, in3, in4, in5, in6, in7,
                        be, clock, reset);


`include "params_e213.inc.v"

   output [`m-1:0] best_state;
		
   input [`W-1:0]  in0;
   input [`W-1:0]  in1;
   input [`W-1:0]  in2;
   input [`W-1:0]  in3;
   input [`W-1:0]  in4;
   input [`W-1:0]  in5;
   input [`W-1:0]  in6;
   input [`W-1:0]  in7;
   input           be;
   input           clock;
   input           reset;

   reg [`m-1:0]    best_state;
   reg [`m-1:0]    min_state;
   reg [`W-1:0]    min_01;
   reg [`W-1:0]    min_23;
   reg [`W-1:0]    min_45;
   reg [`W-1:0]    min_67;
   reg [`W-1:0]    min_0123;
   reg [`W-1:0]    min_4567;
   reg [`W-1:0]    min_metric;   



always @(in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7)
  begin
     if (in0 <=in1)
       min_01=in0;
     else
       min_01=in1;
      
     if (in2 <=in3)
       min_23=in2;
     else
       min_23=in3;
      
     if (in4 <=in5)
       min_45=in4;
     else
       min_45=in5;
      
     if (in6 <=in7)
       min_67=in6;
     else
       min_67=in7;
      
     if (min_01 <= min_23)
       min_0123 = min_01;
     else
       min_0123 = min_23;

     if (min_45 <= min_67)
       min_4567 = min_45;
     else
       min_4567 = min_67;

     if (min_0123 <= min_4567)
       min_metric = min_0123;
     else
       min_metric = min_4567;
  end 
   

always @ (in0 or in1 or in2 or in3 or in4 or in5 or in6 or in7 or min_metric)
  begin
     if (in0==min_metric)
       min_state = 3'b000;
     else if (in1==min_metric)
       min_state = 3'b001;
     else if (in2==min_metric)
       min_state = 3'b010;
     else if (in3==min_metric)
       min_state = 3'b011;
     else if (in4==min_metric)
       min_state = 3'b100;
     else if (in5==min_metric)
       min_state = 3'b101;
     else if (in6==min_metric)
       min_state = 3'b110;
     else 
       min_state = 3'b111;
  end

always @(posedge clock or posedge reset)
   begin
      if (reset)
         best_state <=0;
      else if (be)
         best_state <=min_state;
   end


endmodule


