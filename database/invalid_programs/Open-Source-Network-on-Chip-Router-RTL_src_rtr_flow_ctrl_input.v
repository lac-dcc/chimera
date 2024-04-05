// $Id: rtr_flow_ctrl_input.v 5188 2012-08-30 00:31:31Z dub $

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
// flow control interface (receive side)
//==============================================================================

module rtr_flow_ctrl_input
  (clk, reset, active, flow_ctrl_in, fc_event_valid_out, 
   fc_event_sel_out_ovc);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of VCs
   parameter num_vcs = 4;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   input active;
   
   // incoming flow control data
   input [0:flow_ctrl_width-1] flow_ctrl_in;
   
   // flow control event valid
   output 		       fc_event_valid_out;
   wire 		       fc_event_valid_out;
   
   // flow control event selector
   output [0:num_vcs-1] 	  fc_event_sel_out_ovc;
   wire [0:num_vcs-1] 		  fc_event_sel_out_ovc;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   generate
      
      case(flow_ctrl_type)
	
	`FLOW_CTRL_TYPE_CREDIT:
	  begin
	     
	     wire cred_valid_q;
	     
	     // NOTE: This register needs to be cleared after a credit has been 
	     // received; consequently, we must extend the activity period 
	     // accordingly. As creating a separate clock gating domain for a 
	     // single register is liekly inefficient, this will probably mean 
	     // that it will end up being free-running. If we could change 
	     // things such that credits are transmitted using edge-based 
	     // signaling (i.e., transitions), this could be avoided.
	     
	     wire cred_active;
	     assign cred_active = active | cred_valid_q;
	     
	     wire cred_valid_s;
	     assign cred_valid_s = flow_ctrl_in[0];
	     c_dff
	       #(.width(1),
		 .reset_type(reset_type))
	     cred_validq
	       (.clk(clk),
		.reset(reset),
		.active(cred_active),
		.d(cred_valid_s),
		.q(cred_valid_q));
	     
	     assign fc_event_valid_out = cred_valid_q;
	     
	     if(num_vcs > 1)
	       begin
		  
		  wire [0:vc_idx_width-1] cred_vc_s, cred_vc_q;
		  assign cred_vc_s = flow_ctrl_in[1:vc_idx_width];
		  c_dff
		    #(.width(vc_idx_width),
		      .reset_type(reset_type))
		  cred_vcq
		    (.clk(clk),
		     .reset(1'b0),
		     .active(active),
		     .d(cred_vc_s),
		     .q(cred_vc_q));
		  
		  c_decode
		    #(.num_ports(num_vcs))
		  fc_event_sel_out_ovc_dec
		    (.data_in(cred_vc_q),
		     .data_out(fc_event_sel_out_ovc));
		  
	       end
	     else
	       assign fc_event_sel_out_ovc = 1'b1;
	     
	  end
	
      endcase
      
   endgenerate
   
endmodule
