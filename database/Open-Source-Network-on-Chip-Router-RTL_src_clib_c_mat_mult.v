// $Id: c_mat_mult.v 5188 2012-08-30 00:31:31Z dub $

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
// matrix multiplication
//==============================================================================

module c_mat_mult
  (input_a, input_b, result);
   
`include "c_constants.v"
   
   // matrix dimensions
   parameter dim1_width = 1;
   parameter dim2_width = 1;
   parameter dim3_width = 1;
   
   // multiplication operator
   parameter prod_op = `BINARY_OP_AND;
   
   // addition operator
   parameter sum_op = `BINARY_OP_XOR;
   
   // first input matrix
   input [0:dim1_width*dim2_width-1] input_a;
   
   // second input matrix
   input [0:dim2_width*dim3_width-1] input_b;
   
   output [0:dim1_width*dim3_width-1] result;
   wire [0:dim1_width*dim3_width-1] result;
   
   generate
      
      genvar 			    row;
      
      for(row = 0; row < dim1_width; row = row + 1)
	begin:rows
	   
	   genvar col;
	   
	   for(col = 0; col < dim3_width; col = col + 1)
	     begin:cols
		
		wire [0:dim2_width-1] products;
		
		genvar 		      idx;
		
		for(idx = 0; idx < dim2_width; idx = idx + 1)
		  begin:idxs
		     
		     c_binary_op
			  #(.num_ports(2),
			    .width(1),
			    .op(prod_op))
		     prod
			  (.data_in({input_a[row*dim2_width+idx], 
				     input_b[idx*dim3_width+col]}),
			   .data_out(products[idx]));
		     
		  end
		
		c_binary_op
		  #(.num_ports(dim2_width),
		    .width(1),
		    .op(sum_op))
		sum
		  (.data_in(products),
		   .data_out(result[row*dim3_width+col]));
		
	     end
	   
	end
      
   endgenerate
   
endmodule
