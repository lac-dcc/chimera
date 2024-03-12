// $Id: c_one_hot_filter.v 5188 2012-08-30 00:31:31Z dub $

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
// generic one-hot filter logic
//==============================================================================

module c_one_hot_filter
  (data_in, data_out);
   
`include "c_functions.v"
   
   // width of input vector
   parameter width = 8;
   
   // number of stages
   localparam depth = clogb(width);
   
   // width rounded up to nearest power of two
   localparam ext_width = (1 << depth);
   
   // input data
   input [0:width-1] data_in;
   
   // output data
   output [0:width-1] data_out;
   wire [0:width-1]   data_out;
   
   genvar 	      level;
   
   wire [0:(depth+1)*ext_width-1] a_int;
   wire [0:(depth+1)*ext_width-1] b_int;
   
   assign a_int[ext_width-width:ext_width-1] = data_in;
   assign b_int[ext_width-width:ext_width-1] = data_in;
   
   generate
      
      if(ext_width > width)
	begin
	   assign a_int[0:ext_width-width-1] = {(ext_width-width){1'b0}};
	   assign b_int[0:ext_width-width-1] = {(ext_width-width){1'b0}};
	end
      
      for(level = 0; level < depth; level = level + 1)
	begin:levels
	   
	   wire [0:ext_width-1] a_in;
	   assign a_in = a_int[level*ext_width:(level+1)*ext_width-1];
	   
	   wire [0:ext_width-1] b_in;
	   assign b_in = b_int[level*ext_width:(level+1)*ext_width-1];
	   
	   wire [0:ext_width-1] a_shifted;
	   assign a_shifted = {a_in[ext_width-(1<<level):ext_width-1], 
			       a_in[0:ext_width-(1<<level)-1]};
	   
	   wire [0:ext_width-1] b_shifted;
	   assign b_shifted = {b_in[ext_width-(1<<level):ext_width-1], 
			       b_in[0:ext_width-(1<<level)-1]};
	   
	   wire [0:ext_width-1] a_out;
	   assign a_out = a_in | a_shifted;
	   
	   wire [0:ext_width-1] b_out;
	   assign b_out = b_in & ~a_shifted;
	   
	   assign a_int[(level+1)*ext_width:(level+2)*ext_width-1] = a_out;
	   assign b_int[(level+1)*ext_width:(level+2)*ext_width-1] = b_out;
	   
	end
      
   endgenerate
   
   assign data_out = b_int[(depth+1)*ext_width-width:(depth+1)*ext_width-1];
   
endmodule
