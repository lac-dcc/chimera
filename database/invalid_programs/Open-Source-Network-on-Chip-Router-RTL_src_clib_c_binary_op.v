// $Id: c_binary_op.v 5188 2012-08-30 00:31:31Z dub $

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
// n-input generic binary operator
//==============================================================================

module c_binary_op
  (data_in, data_out);
   
`include "c_constants.v"

   // number of inputs
   parameter num_ports = 2;
   
   // width of each input
   parameter width = 1;
   
   // select operator
   parameter op = `BINARY_OP_XOR;
   
   // vector of inputs
   input [0:width*num_ports-1] data_in;
   
   // result
   output [0:width-1] data_out;
   wire [0:width-1] data_out;
   
   generate
      
      genvar 	    i;
      for(i = 0; i < width; i = i + 1)
	begin:bit_positions
	   
	   wire [0:num_ports-1] data;
	   
	   genvar 		j;
	   for(j = 0; j < num_ports; j = j + 1)
	     begin:input_ports
		assign data[j] = data_in[j*width+i];
	     end
	   
	   case(op)
	     
	     `BINARY_OP_AND:
	       assign data_out[i] = &data;
	     
	     `BINARY_OP_NAND:
	       assign data_out[i] = ~&data;
	     
	     `BINARY_OP_OR:
	       assign data_out[i] = |data;
	     
	     `BINARY_OP_NOR:
	       assign data_out[i] = ~|data;
	     
	     `BINARY_OP_XOR:
	       assign data_out[i] = ^data;
	     
	     `BINARY_OP_XNOR:
	       assign data_out[i] = ~^data;
	     
	   endcase
	   
	end
      
   endgenerate
   
endmodule
