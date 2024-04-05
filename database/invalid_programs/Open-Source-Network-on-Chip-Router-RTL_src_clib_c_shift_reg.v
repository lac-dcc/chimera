// $Id: c_shift_reg.v 5188 2012-08-30 00:31:31Z dub $

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
// shift register
//==============================================================================

module c_shift_reg
  (clk, reset, active, data_in, data_out);
   
`include "c_constants.v"
   
   // width of register
   parameter width = 32;
   
   // depth of register (number of levels)
   parameter depth = 2;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   input active;
   
   // data input
   input [0:width-1] data_in;
   
   // data output
   output [0:width-1] data_out;
   wire [0:width-1] data_out;
   
   genvar 	    level;
   
   wire [0:(depth+1)*width-1] data;
   assign data[0:width-1] = data_in;
   
   generate
      
      for(level = 0; level < depth; level = level + 1)
	begin:levels
	   
	   wire [0:width-1] data_s, data_q;
	   assign data_s = data[level*width:(level+1)*width-1];
	   c_dff
	     #(.width(width),
	       .reset_type(reset_type))
	   dataq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(data_s),
	      .q(data_q));
	   
	   assign data[(level+1)*width:(level+2)*width-1] = data_q;
	   
	end
      
   endgenerate
   
   assign data_out = data[depth*width:(depth+1)*width-1];
   
endmodule
