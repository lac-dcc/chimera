// $Id: c_one_hot_therm_conv.v 5188 2012-08-30 00:31:31Z dub $

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
// converter from one-hot to thermometer-style encoding
//==============================================================================

module c_one_hot_therm_conv
  (data_in, data_out);
   
`include "c_functions.v"
   
   // number of input ports (i.e., decoded width)
   parameter width = 8;
   
   // number of stages
   localparam depth = clogb(width);
   
   // one-hot input data
   input [0:width-1] data_in;
   
   // thermometer-style encoded output data
   output [0:width-1] data_out;
   wire [0:width-1]   data_out;
   
   genvar 	      level;
   
   wire [0:(depth+1)*width-1] data_int;
   assign data_int[0:width-1] = data_in;
   
   generate
      
      for(level = 0; level < depth; level = level + 1)
	begin:levels
	   
	   wire [0:width-1] data_in;
	   assign data_in = data_int[level*width:(level+1)*width-1];
	   
	   wire [0:width-1] data_shifted;
	   assign data_shifted
	     = {{(1<<level){1'b0}}, data_in[0:width-(1<<level)-1]};
	   
	   wire [0:width-1] data_out;
	   assign data_out = data_in | data_shifted;
	   
	   assign data_int[(level+1)*width:(level+2)*width-1] = data_out;
	   
	end
      
   endgenerate
   
   assign data_out = data_int[depth*width:(depth+1)*width-1];
   
endmodule
