// $Id: c_diag_op.v 5188 2012-08-30 00:31:31Z dub $

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
// perform binary operation across diagonals of a matrix
//==============================================================================

module c_diag_op
  (data_in, data_out);
   
   // input width
   parameter width = 1;
   
   // select operator
   parameter op = `BINARY_OP_XOR;
   
   // vector of inputs
   input [0:width*width-1] data_in;
   
   // result
   output [0:width-1] 	   data_out;
   wire [0:width-1] 	   data_out;
   
   generate
      
      genvar 		   diag;
      
      for(diag = 0; diag < width; diag = diag + 1)
	begin:diags
	   
	   wire [0:width-1] diag_elems;
	   
	   genvar 	    row;
	   
	   for(row = 0; row < width; row = row + 1)
	     begin:rows
		assign diag_elems[row]
		  = data_in[row*width+(width+diag-row)%width];
	     end
	   
	   wire op_elem;
	   
	   c_binary_op
	     #(.num_ports(width),
	       .width(1),
	       .op(op))
	   op_elem_bop
	     (.data_in(diag_elems),
	      .data_out(op_elem));
	   
	   assign data_out[diag] = op_elem;
	   
	end
      
   endgenerate
   
endmodule
