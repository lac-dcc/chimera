// $Id: c_prio_sel.v 5188 2012-08-30 00:31:31Z dub $

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
// priority select logic
//==============================================================================

module c_prio_sel
  (priorities, enable, select);
   
`include "c_functions.v"
   
   // number of input ports
   parameter num_ports = 32;
   
   // number of priority levels
   parameter num_priorities = 16;
   
   // width of priority fields
   localparam prio_width = clogb(num_priorities);
   
   // priority values
   input [0:num_ports*prio_width-1] priorities;
   
   // port enable signals
   input [0:num_ports-1] 	    enable;
   
   // vector representing maximum priority ports
   output [0:num_ports-1] 	    select;
   wire [0:num_ports-1] 	    select;
   
   // for each priority bit, list all ports that have this bit set
   wire [0:prio_width*num_ports-1]  prio_ports;
   c_interleave
     #(.width(num_ports*prio_width),
       .num_blocks(num_ports))
   prio_ports_intl
     (.data_in(priorities),
      .data_out(prio_ports));
   
   wire [0:(prio_width+1)*num_ports-1]  mask;
   
   assign mask[0:num_ports-1] = enable;
   
   generate
      
      genvar 				i;
      
      for(i = 0; i < prio_width; i = i + 1)
	begin:is
	   
	   wire [0:num_ports-1] mask_in;
	   assign mask_in = mask[i*num_ports:(i+1)*num_ports-1];
	   
	   wire [0:num_ports-1] prio;
	   assign prio = prio_ports[i*num_ports:(i+1)*num_ports-1];
	   
	   wire [0:num_ports-1] mask_out;
	   assign mask_out = mask_in & (prio | {num_ports{~|(mask_in & prio)}});
	   
	   assign mask[(i+1)*num_ports:(i+2)*num_ports-1] = mask_out;
	   
	end
      
   endgenerate
   
   assign select = mask[prio_width*num_ports:(prio_width+1)*num_ports-1];
   
endmodule
