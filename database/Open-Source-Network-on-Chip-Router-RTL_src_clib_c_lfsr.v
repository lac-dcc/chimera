// $Id: c_lfsr.v 5188 2012-08-30 00:31:31Z dub $

/*
 Copyright (c) 2007-2012, Trustees of The Leland Stanford Junior University
 All rights reserved.

 Redistribution and use in source and binary forms, with or without
 modification, are permitted provided that the following conditions are met:

 Redistributions of source code must retain the above copyright notice, this 
 list of conditions and the following disclaimer.
 Redistributions in binary form must reproduce the above copyright notice, this
 list of conditions and the following disclaimer in the documentation and/or
 other materials provided with the distribution.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE 
 DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR
 ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
*/

//==============================================================================
// generic multi-input linear feedback shift register register
//==============================================================================

module c_lfsr
  (clk, reset, active, load, run, feedback, complete, d, q);
   
`include "c_constants.v"
   
   // width of register (must be greater than one)
   parameter width = 32;
   
   // offset (left index) of register
   parameter offset = 0;
   
   // initial state
   parameter [offset:(offset+width)-1] reset_value = {width{1'b1}};
   
   // how many iterations to perform at once
   parameter iterations = 1;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   input active;
   
   // load data input into signature register
   input load;
   
   // activate signature updates
   input run;
   
   // feedback polynomial(s)
   input [0:width-1] feedback;
   
   // include all-zeros state in state sequence
   input complete;
   
   // data input
   input [offset:(offset+width)-1] d;
   
   // data output
   output [offset:(offset+width)-1] q;
   wire [offset:(offset+width)-1] q;
   
   wire [offset:(offset+width)-1] state_q;
   
   wire [0:width-1] 		  feedback_sum;
   c_fbmult
     #(.width(width),
       .iterations(iterations))
   fbmult
     (.feedback(feedback),
      .complete(complete),
      .data_in(state_q),
      .data_out(feedback_sum));
   
   wire [offset:(offset+width)-1] feedback_value;
   assign feedback_value = {width{~load}} & feedback_sum;
   
   wire [offset:(offset+width)-1] toggle_value;
   assign toggle_value = feedback_value ^ d;
   
   wire [offset:(offset+width)-1] base_value;
   
   generate
      
      if(width == 1)
	begin
	   
	   assign base_value = 1'b0;
	   
	end
      else
	begin
	   
	   assign base_value
	     = {1'b0, {(width-1){~load}} & state_q[offset:(offset+width-1)-1]};
	   
	end
      
   endgenerate
   
   wire [offset:(offset+width)-1] state_s;
   assign state_s = (load | run) ? (base_value ^ toggle_value) : state_q;
   c_dff
     #(.width(width),
       .offset(offset),
       .reset_type(reset_type),
       .reset_value(reset_value))
   stateq
     (.clk(clk),
      .reset(reset),
      .active(active),
      .d(state_s),
      .q(state_q));
   
   assign q = state_q;
   
endmodule
