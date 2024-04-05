// $Id: rtr_crossbar_mac.v 5188 2012-08-30 00:31:31Z dub $

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

module rtr_crossbar_mac
  (ctrl_in_op_ip, data_in_ip, data_out_op);
   
`include "c_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of input/output ports
   parameter num_ports = 5;
   
   // width per port
   parameter width = 32;
   
   // select implementation variant
   parameter crossbar_type = `CROSSBAR_TYPE_MUX;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   // crosspoint control signals
   input [0:num_ports*num_ports-1] ctrl_in_op_ip;
   
   // vector of input data
   input [0:num_ports*width-1] 	   data_in_ip;
   
   // vector of output data
   output [0:num_ports*width-1]    data_out_op;
   wire [0:num_ports*width-1] 	   data_out_op;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire [0:num_ports*num_ports-1]  ctrl_in_ip_op;
   c_interleave
     #(.width(num_ports*num_ports),
       .num_blocks(num_ports))
   ctrl_in_ip_op_intl
     (.data_in(ctrl_in_op_ip),
      .data_out(ctrl_in_ip_op));
   
   c_crossbar
     #(.num_in_ports(num_ports),
       .num_out_ports(num_ports),
       .width(width),
       .crossbar_type(crossbar_type))
   xbr
     (.ctrl_ip_op(ctrl_in_ip_op),
      .data_in_ip(data_in_ip),
      .data_out_op(data_out_op));
   
endmodule
