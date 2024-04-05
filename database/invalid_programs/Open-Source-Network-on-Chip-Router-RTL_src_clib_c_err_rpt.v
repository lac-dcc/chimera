// $Id: c_err_rpt.v 5188 2012-08-30 00:31:31Z dub $

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
// error reporting module
//==============================================================================

module c_err_rpt
  (clk, reset, active, errors_in, errors_out);
   
`include "c_constants.v"
   
   // number of error inputs
   parameter num_errors = 1;
   
   // select mode of operation
   parameter capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;

   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   input clk;
   input reset;
   input active;
   
   // raw error inputs
   input [0:num_errors-1] errors_in;
   
   // registered and potentially held error outputs
   output [0:num_errors-1] errors_out;
   wire [0:num_errors-1] errors_out;
   
   generate
      
      if(capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:num_errors-1] errors_s, errors_q;
	   
	   case(capture_mode)
	     
	     `ERROR_CAPTURE_MODE_NO_HOLD:
	       begin
		  assign errors_s = errors_in;
	       end
	     
	     `ERROR_CAPTURE_MODE_HOLD_FIRST:
	       begin
		  assign errors_s = ~|errors_q ? errors_in : errors_q;
	       end
	     
	     `ERROR_CAPTURE_MODE_HOLD_ALL:
	       begin
		  assign errors_s = errors_q | errors_in;
	       end
	     
	   endcase
	   
	   c_dff
	     #(.width(num_errors),
	       .reset_type(reset_type))
	   errorsq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(errors_s),
	      .q(errors_q));
	   
	   assign errors_out = errors_q;
	   
	end
      else
	assign errors_out = {num_errors{1'b0}};
      
   endgenerate
   
endmodule
