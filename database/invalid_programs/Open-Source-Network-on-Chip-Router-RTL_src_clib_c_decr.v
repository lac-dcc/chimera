// $Id: c_decr.v 5188 2012-08-30 00:31:31Z dub $

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
// generic modulo decrementer (i.e., decrementer with wraparound)
//==============================================================================

module c_decr
  (data_in, data_out);
   
`include "c_functions.v"
   
   parameter width = 3;
   
   parameter [0:width-1] min_value = 0;
   parameter [0:width-1] max_value = (1 << width) - 1;
   
   localparam num_values = max_value - min_value + 1;
   
   localparam swidth = suffix_length(min_value, max_value);
   
   localparam cwidth = clogb(num_values);
   
   // operand inputs
   input [0:width-1] data_in;
   
   // result output
   output [0:width-1] data_out;
   wire [0:width-1]   data_out;
   
   wire 	      wrap;
   
   genvar 	      i;
   
   generate
      
      // all MSBs that are common to min_value and max_value can simply be 
      // copied over from either constant
      for(i = 0; i < (width-swidth); i = i + 1)
	begin:prefix
	   assign data_out[i] = min_value[i];
	end
      
      // the LSBs for a modulo counter, possibly with offset
      if(cwidth > 0)
	begin
	   
	   assign wrap = (data_in[(width-cwidth):width-1] ==
			  min_value[(width-cwidth):width-1]);
	   
	   wire [0:cwidth-1] lsb_decr;
	   assign lsb_decr = data_in[(width-cwidth):width-1] - 1'b1;
	   
	   if((1 << cwidth) == num_values)
	     begin
		
		// if the counter's range is a power of two, we can take 
		// advantage of natural wraparound
		assign data_out[(width-cwidth):width-1] = lsb_decr;
		
	     end
	   else
	     begin
		
		// if the range is not a power of two, we need to implement 
		// explicit wraparound
		assign data_out[(width-cwidth):width-1]
		  = wrap ? max_value[(width-cwidth):width-1] : lsb_decr;
		
	     end
	   
	end
      else
	assign wrap = 1'b1;
      
      // for the remaining range of bit positions (if any), min_value and 
      // max_value differ by one due to the carry-out from the modulo counter 
      // that implements the LSBs; i.e., this range of bits can have two 
      // distinct values
      if(swidth > cwidth)
	begin
	   
	   wire carry;
	   assign carry = ~|data_in[(width-cwidth):width-1];
	   
	   assign data_out[(width-swidth):(width-cwidth)-1]
	     = wrap ? max_value[(width-swidth):(width-cwidth)-1] :
	       carry ? min_value[(width-swidth):(width-cwidth)-1] :
	       data_in[(width-swidth):(width-cwidth)-1];
	   
	end
      
   endgenerate
   
endmodule
