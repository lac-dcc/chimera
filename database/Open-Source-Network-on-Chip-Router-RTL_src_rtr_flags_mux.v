// $Id: rtr_flags_mux.v 5188 2012-08-30 00:31:31Z dub $

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
// module for extracting the flags for a given port and packet class
//==============================================================================

module rtr_flags_mux
  (sel_mc, route_op, route_orc, flags_op_opc, flags);
   
`include "c_functions.v"
`include "c_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // width of flags
   parameter width = 1;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   // current message class
   input [0:num_message_classes-1] sel_mc;
   
   // destination port
   input [0:num_ports-1] 	   route_op;
   
   // destination resource class
   input [0:num_resource_classes-1] route_orc;
   
   // bit field of output VC flags of interest
   input [0:num_ports*num_packet_classes*width-1] flags_op_opc;
   
   // subset of bits that we are interested in
   output [0:width-1] 				  flags;
   wire [0:width-1] 				  flags;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire [0:num_packet_classes*width-1] 		  flags_opc;
   c_select_1ofn
     #(.num_ports(num_ports),
       .width(num_packet_classes*width))
   flags_opc_sel
     (.select(route_op),
      .data_in(flags_op_opc),
      .data_out(flags_opc));
   
   wire [0:num_resource_classes*width-1] 	  flags_orc;
   c_select_1ofn
     #(.num_ports(num_message_classes),
       .width(num_resource_classes*width))
   flags_orc_sel
     (.select(sel_mc),
      .data_in(flags_opc),
      .data_out(flags_orc));
   
   c_select_1ofn
     #(.num_ports(num_resource_classes),
       .width(width))
   flags_sel
     (.select(route_orc),
      .data_in(flags_orc),
      .data_out(flags));
   
endmodule
