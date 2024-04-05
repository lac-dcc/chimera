// $Id: c_fbmult.v 5188 2012-08-30 00:31:31Z dub $

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
// generic feedback multiplier for multi-input LFSRs
//==============================================================================

module c_fbmult
  (feedback, complete, data_in, data_out);
   
`include "c_constants.v"
   
   // width of register (must be greater than one)
   parameter width = 32;
   
   // how many iterations to perform at once
   parameter iterations = 1;
   
   // feedback polynomial(s)
   input [0:width-1] feedback;
   
   // include all-zeros state in state sequence
   input complete;
   
   // data input
   input [0:width-1] data_in;
   
   // data output
   output [0:width-1] data_out;
   wire [0:width-1] data_out;
   
   wire [0:width-1] feedback_seeds;
   wire [0:width*width-1] iter_matrix_noshift_transposed;
   
   generate
      
      if(width == 1)
	begin
	   
	   assign feedback_seeds = complete ^ data_in;
	   
	   assign iter_matrix_noshift_transposed = feedback;
	   
	end
      else
	begin
	   
	   assign feedback_seeds[0:(width-1)-1] = data_in[0:(width-1)-1];
	   assign feedback_seeds[width-1]
		    = (~|data_in[0:(width-1)-1] & complete) ^ data_in[width-1];
	   
	   assign iter_matrix_noshift_transposed
	     = {{((width-1)*width){1'b0}}, feedback};
	   
	end
      
   endgenerate
   
   wire [0:width*width-1] iter_matrix_noshift;
   c_interleave
     #(.width(width*width),
       .num_blocks(width))
   iter_matrix_noshift_intl
     (.data_in(iter_matrix_noshift_transposed),
      .data_out(iter_matrix_noshift));
   
   wire [0:width*width-1] initial_matrix;
   
   wire [0:(iterations+1)*width*width-1] matrices;
   assign matrices[0:width*width-1] = initial_matrix;
   
   wire [0:width*width-1] 		 feedback_matrix;
   assign feedback_matrix
     = matrices[iterations*width*width:(iterations+1)*width*width-1];
   
   wire [0:width*width-1] 		 iter_matrix;
   wire [0:width*width-1] 		 feedback_matrix_noshift;
   
   generate
      
      genvar 				 row;
      
      for(row = 0; row < width; row = row + 1)
	begin:rows
	   
	   genvar col;
	   
	   for(col = 0; col < width; col = col + 1)
	     begin:cols
		
		wire invert;
		assign invert = (row == (col + 1));
		
		assign iter_matrix[row*width+col]
			 = iter_matrix_noshift[row*width+col] ^ invert;
		
		assign feedback_matrix_noshift[row*width+col]
			 = feedback_matrix[row*width+col] ^ invert;
		
		wire sethi;
		assign sethi = (row == col);
		
		assign initial_matrix[row*width+col] = sethi;
		
	     end
	   
	end
      
      genvar 	     iter;
      
      for(iter = 0; iter < iterations; iter = iter+1)
	begin:iters
	   
	   wire [0:width*width-1] in_matrix;
	   assign in_matrix = matrices[iter*width*width:(iter+1)*width*width-1];
	   
	   wire [0:width*width-1] out_matrix;
	   c_mat_mult
	     #(.dim1_width(width),
	       .dim2_width(width),
	       .dim3_width(width))
	   out_matrix_mmult
	     (.input_a(iter_matrix),
	      .input_b(in_matrix),
	      .result(out_matrix));
	   
	   assign matrices[(iter+1)*width*width:(iter+2)*width*width-1]
		    = out_matrix;
	   
	end
      
   endgenerate
   
   wire [0:width-1] 		  feedback_sum;
   c_mat_mult
     #(.dim1_width(width),
       .dim2_width(width),
       .dim3_width(1))
   feedback_sum_mmult
     (.input_a(feedback_matrix_noshift),
      .input_b(feedback_seeds),
      .result(feedback_sum));
   
   assign data_out = feedback_sum;
   
endmodule
