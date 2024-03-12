// $Id: c_functions.v 5188 2012-08-30 00:31:31Z dub $

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
// global function definitions
//==============================================================================

// compute ceiling of binary logarithm
function integer clogb(input integer argument);
   integer 		     i;
   begin
      clogb = 0;
      for(i = argument - 1; i > 0; i = i >> 1)
	clogb = clogb + 1;
   end
endfunction

// compute ceiling of base-th root of argument
function integer croot(input integer argument, input integer base);
   integer i;
   integer j;
   begin
      croot = 0;
      i = 0;
      while(i < argument)
	begin
	   croot = croot + 1;
	   i = 1;
	   for(j = 0; j < base; j = j + 1)
	     i = i * croot;
	end
   end
endfunction

// population count (count ones)
function integer pop_count(input integer argument);
   integer i;
   begin
      pop_count = 0;
      for(i = argument; i > 0; i = i >> 1)
	pop_count = pop_count + (i & 1);
   end
endfunction

// compute the length of the longest disjoint suffix among two values
function integer suffix_length(input integer value1, input integer value2);
   integer v1, v2;
   begin
      v1 = value1;
      v2 = value2;
      suffix_length = 0;
      while(v1 != v2)
	begin
	   suffix_length = suffix_length + 1;
	   v1 = v1 >> 1;
	   v2 = v2 >> 1;
	end
   end
endfunction
