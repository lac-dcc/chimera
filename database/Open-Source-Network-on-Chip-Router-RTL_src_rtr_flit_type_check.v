// $Id: rtr_flit_type_check.v 5188 2012-08-30 00:31:31Z dub $

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
// flit type checker module
//==============================================================================

module rtr_flit_type_check
  (clk, reset, active, flit_valid, flit_head, flit_tail, error);
   
`include "c_constants.v"
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   input active;
   
   input flit_valid;
   input flit_head;
   input flit_tail;
   
   output error;
   wire   error;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire   packet_active_s, packet_active_q;
   assign packet_active_s = flit_valid ? 
			    ((packet_active_q | flit_head) & ~flit_tail) :
			    packet_active_q;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   packet_activeq
     (.clk(clk),
      .reset(reset),
      .active(active),
      .d(packet_active_s),
      .q(packet_active_q));
   
   assign error = flit_valid & (flit_head ~^ packet_active_q);
   
   // synopsys translate_off
   always @(posedge clk)
     begin
	
	if(error)
	  $display("ERROR: Received flit with unexpected type in module %m.");
	
     end
   // synopsys translate_on
   
endmodule
