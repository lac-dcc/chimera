// $Id: c_crossbar.v 5188 2012-08-30 00:31:31Z dub $

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
// configurable crossbar module
//==============================================================================

module c_crossbar
  (ctrl_ip_op, data_in_ip, data_out_op);
   
`include "c_constants.v"
   
   // number of input/output ports
   parameter num_in_ports = 5;
   parameter num_out_ports = 5;
   
   // width per port
   parameter width = 32;
   
   // select implementation variant
   parameter crossbar_type = `CROSSBAR_TYPE_MUX;
   
   // control signals (request matrix)
   input [0:num_in_ports*num_out_ports-1] ctrl_ip_op;
   
   // vector of input data
   input [0:num_in_ports*width-1] data_in_ip;
   
   // vector of output data
   output [0:num_out_ports*width-1] data_out_op;
   wire [0:num_out_ports*width-1] data_out_op;
   
   wire [0:num_out_ports*num_in_ports-1] ctrl_op_ip;
   c_interleave
     #(.width(num_in_ports*num_out_ports),
       .num_blocks(num_in_ports))
   ctrl_intl
     (.data_in(ctrl_ip_op),
      .data_out(ctrl_op_ip));
   
   generate
      
      genvar 				 op;
      for(op = 0; op < num_out_ports; op = op + 1)
	begin:ops
	   
	   wire [0:width-1] data_out;
	   
	   genvar 	    ip;
	   
	   case(crossbar_type)
	     
	     `CROSSBAR_TYPE_TRISTATE:
	       begin
		  
		  for(ip = 0; ip < num_in_ports; ip = ip + 1)
		    begin:tristate_ips
		       
		       wire [0:width-1] in;
		       assign in = data_in_ip[ip*width:(ip+1)*width-1];
		       
		       wire 		ctrl;
		       assign ctrl = ctrl_op_ip[op*num_in_ports+ip];
		       
		       assign data_out = ctrl ? in : {width{1'bz}};
		       
		    end
		  
	       end
	     
	     `CROSSBAR_TYPE_MUX:
	       begin
		  
		  wire [0:num_in_ports-1] ctrl_ip;
		  assign ctrl_ip
		    = ctrl_op_ip[op*num_in_ports:(op+1)*num_in_ports-1];
		  
		  c_select_1ofn
		    #(.width(width),
		      .num_ports(num_in_ports))
		  out_mux
		    (.select(ctrl_ip),
		     .data_in(data_in_ip),
		     .data_out(data_out));
		  
	       end
	     
	     `CROSSBAR_TYPE_DIST_MUX:
	       begin
		  
		  wire [0:num_in_ports*width-1] data;
		  assign data[0:width-1] = data_in_ip[0:width-1];
		  
		  for(ip = 1; ip < num_in_ports; ip = ip + 1)
		    begin:dist_mux_ips
		       
		       wire [0:width-1] in;
		       assign in = data_in_ip[ip*width:(ip+1)*width-1];
		       
		       wire [0:width-1] thru;
		       assign thru = data[(ip-1)*width:ip*width-1];
		       
		       wire 		ctrl;
		       assign ctrl = ctrl_op_ip[op*num_in_ports+ip];
		       
		       wire [0:width-1] out;
		       assign out = ctrl ? in : thru;
		       
		       assign data[ip*width:(ip+1)*width-1] = out;
		       
		    end
		  
		  assign data_out
		    = data[(num_in_ports-1)*width:num_in_ports*width-1];
		  
	       end
	     
	   endcase
	   
	   assign data_out_op[op*width:(op+1)*width-1] = data_out;
	   
	end
      
   endgenerate
   
endmodule
