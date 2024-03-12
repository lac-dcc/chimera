// $Id: c_gate_bits.v 5188 2012-08-30 00:31:31Z dub $

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
// generic gate-(op) (i.e., apply binary op to all bits)
//==============================================================================

module c_gate_bits
  (select, data_in, data_out);
   
`include "c_constants.v"
   
   // number of input ports
   parameter num_ports = 1;
   
   // width of each port
   parameter width = 32;
   
   // operator
   parameter op = `BINARY_OP_AND;
   
   // control signal to select active port
   input [0:num_ports-1] select;
   
   // vector of inputs
   input [0:num_ports*width-1] data_in;
   
   // result
   output [0:num_ports*width-1] data_out;
   wire [0:num_ports*width-1] 	data_out;
   
   generate
      
      genvar 			p;
      
      for(p = 0; p < num_ports; p = p + 1)
	begin:ps
	   
	   c_binary_op
	      #(.num_ports(2),
		.width(width),
		.op(op))
	   bop
	      (.data_in({{width{select[p]}}, data_in[p*width:(p+1)*width-1]}),
	       .data_out(data_out[p*width:(p+1)*width-1]));
	   
	end
      
   endgenerate
   
endmodule
