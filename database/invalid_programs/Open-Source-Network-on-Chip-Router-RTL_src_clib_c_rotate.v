// $Id: c_rotate.v 5188 2012-08-30 00:31:31Z dub $

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
// rotate bit vector by given amount
//==============================================================================

module c_rotate
  (amount, data_in, data_out);
   
`include "c_functions.v"
`include "c_constants.v"
   
   // width of input data
   parameter width = 8;
   
   // direction in which to rotate
   parameter rotate_dir = `ROTATE_DIR_LEFT;
   
   // width of rotation amount
   localparam amount_width = clogb(width);
   
   // input data
   input [0:width-1] data_in;
   
   // result
   input [0:amount_width-1] amount;
   
   // amount by which to rotate
   output [0:width-1] data_out;
   wire [0:width-1] data_out;
   
   wire [0:(2*width-1)-1] data_dup;
   wire [0:(2*width-1)-1] data_rot;
   
   generate
      
      case (rotate_dir)
	`ROTATE_DIR_LEFT:
	  begin
	     assign data_dup = {data_in, data_in[0:(width-1)-1]};
	     assign data_rot = data_dup << amount;
	     assign data_out = data_rot[0:width-1];
	  end
	`ROTATE_DIR_RIGHT:
	  begin
	     assign data_dup = {data_in[1:width-1], data_in};
	     assign data_rot = data_dup >> amount;
	     assign data_out = data_rot[width-1:(2*width-1)-1];
	  end
      endcase
      
   endgenerate
   
endmodule
