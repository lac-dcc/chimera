// $Id: c_prefix_net.v 5188 2012-08-30 00:31:31Z dub $

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
// generic prefix network
//==============================================================================

module c_prefix_net
  (g_in, p_in, g_out, p_out);
   
`include "c_functions.v"
   
   // width of inputs
   parameter width = 16;
   
   // generate wraparound connections
   parameter enable_wraparound = 0;
   
   // number of stages
   localparam depth = clogb(width);
   
   // width rounded up to nearest power of two
   localparam ext_width = (1 << depth);
   
   // generate inputs
   input [0:width-1] g_in;
   
   // propagate inputs
   input [0:width-1] p_in;
   
   // generate outputs
   output [0:width-1] g_out;
   wire [0:width-1]   g_out;
   
   // propagate outputs
   output [0:width-1] p_out;
   wire [0:width-1]   p_out;
   
   genvar 	      level;
   
   wire [0:(depth+1)*ext_width-1] g_int;
   wire [0:(depth+1)*ext_width-1] p_int;
   
   assign g_int[ext_width-width:ext_width-1] = g_in;
   assign p_int[ext_width-width:ext_width-1] = p_in;
   
   generate
      
      if(ext_width > width)
	begin
	   assign g_int[0:ext_width-width-1] = {(ext_width-width){1'b0}};
	   assign p_int[0:ext_width-width-1] = {(ext_width-width){1'b1}};
	end
      
      for(level = 0; level < depth; level = level + 1)
	begin:levels
	   
	   wire [0:ext_width-1] g_in;
	   assign g_in = g_int[level*ext_width:(level+1)*ext_width-1];
	   
	   wire [0:ext_width-1] p_in;
	   assign p_in = p_int[level*ext_width:(level+1)*ext_width-1];
	   
	   wire [0:ext_width-1] g_shifted;
	   assign g_shifted[(1<<level):ext_width-1]
	     = g_in[0:ext_width-(1<<level)-1];
	   if(enable_wraparound)
	     assign g_shifted[0:(1<<level)-1]
	       = g_in[ext_width-(1<<level):ext_width-1];
	   else
	     assign g_shifted[0:(1<<level)-1] = {(1<<level){1'b0}};
	   
	   wire [0:ext_width-1] p_shifted;
	   assign p_shifted[(1<<level):ext_width-1]
	     = p_in[0:ext_width-(1<<level)-1];
	   if(enable_wraparound)
	     assign p_shifted[0:(1<<level)-1]
	       = p_in[ext_width-(1<<level):ext_width-1];
	   else
	     assign p_shifted[0:(1<<level)-1] = {(1<<level){1'b0}};
	   
	   wire [0:ext_width-1] g_out;
	   assign g_out = g_in | p_in & g_shifted;
	   
	   wire [0:ext_width-1] p_out;
	   assign p_out = p_in & p_shifted;
	   
	   assign g_int[(level+1)*ext_width:(level+2)*ext_width-1] = g_out;
	   assign p_int[(level+1)*ext_width:(level+2)*ext_width-1] = p_out;
	   
	end
      
   endgenerate
   
   assign g_out = g_int[(depth+1)*ext_width-width:(depth+1)*ext_width-1];
   assign p_out = p_int[(depth+1)*ext_width-width:(depth+1)*ext_width-1];
   
endmodule
