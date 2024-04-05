// $Id: rtr_channel_output.v 5188 2012-08-30 00:31:31Z dub $

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
// channel interface (send side)
//==============================================================================

module rtr_channel_output
  (clk, reset, active, flit_valid_in, flit_head_in, flit_tail_in, flit_data_in, 
   flit_sel_in_ovc, channel_out);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of VCs
   parameter num_vcs = 4;
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // enable link power management
   parameter enable_link_pm = 1;
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // width of link management signals
   localparam link_ctrl_width = enable_link_pm ? 1 : 0;
   
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       (1 + vc_idx_width + 1 + 1) : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       (1 + vc_idx_width + 1) : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (1 + vc_idx_width + 1) : 
       -1;
   
   // channel width
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   input active;
   
   // flit valid indicator
   input flit_valid_in;
   
   // flit is a head flit
   input flit_head_in;
   
   // flit is a tail flit
   input flit_tail_in;
   
   // payload data
   input [0:flit_data_width-1] flit_data_in;
   
   // indicate which VC the current flit (if any) belongs to
   input [0:num_vcs-1] 	       flit_sel_in_ovc;
   
   // outgoing flit control signals
   output [0:channel_width-1]  channel_out;
   wire [0:channel_width-1]    channel_out;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire 		       flit_valid_out;
   
   generate
      
      if(enable_link_pm)
	assign channel_out[0] = active | flit_valid_out;
      
   endgenerate
   
   wire [0:flit_ctrl_width-1]  flit_ctrl_out;
   wire [0:flit_data_width-1]  flit_data_out;
   
   assign channel_out[link_ctrl_width:
		      link_ctrl_width+flit_ctrl_width-1]
     = flit_ctrl_out;
   assign channel_out[link_ctrl_width+flit_ctrl_width:
		      link_ctrl_width+flit_ctrl_width+flit_data_width-1]
     = flit_data_out;
   
   wire [0:flit_data_width-1]  flit_data_s, flit_data_q;
   assign flit_data_s = flit_data_in;
   c_dff
     #(.width(flit_data_width),
       .reset_type(reset_type))
   flit_dataq
     (.clk(clk),
      .reset(1'b0),
      .active(active),
      .d(flit_data_s),
      .q(flit_data_q));
   
   assign flit_data_out = flit_data_q;
   
   generate
      
      case(packet_format)
	
	`PACKET_FORMAT_HEAD_TAIL, 
	`PACKET_FORMAT_TAIL_ONLY, 
	`PACKET_FORMAT_EXPLICIT_LENGTH:
	  begin
	     
	     wire [0:flit_ctrl_width-1] flit_ctrl_s, flit_ctrl_q;
	     
	     assign flit_ctrl_s[0] = flit_valid_in;
	     
	     // NOTE: Because we need to clear it in the cycle after a flit has 
	     // been transmitted, this register currently cannot be included in 
	     // the same clock gating domain as the other registers in this 
	     // module. To change this, we could modify the handshake such that 
	     // edge-based signaling (i.e., transitions) is used for sending 
	     // flits downstream.
	     // Alternatively, we could include the flit_valid_q term in the 
	     // gating expression for all the other registers in this module; 
	     // this would allow us to include flit_validq in the same gating 
	     // domain at the cost of some unnecessary activity. As synthesis 
	     // will probably not create a clock gating domain for just this 
	     // register, it currently will most likely end up being free-
	     // running, so this may actually be a good tradeoff.
	     
	     wire 			flit_valid_active;
	     assign flit_valid_active = active | flit_valid_out;
	     
	     wire 			flit_valid_s, flit_valid_q;
	     assign flit_valid_s = flit_ctrl_s[0];
	     c_dff
	       #(.width(1),
		 .reset_type(reset_type))
	     flit_validq
	       (.clk(clk),
		.reset(reset),
		.active(flit_valid_active),
		.d(flit_valid_s),
		.q(flit_valid_q));
	     
	     assign flit_valid_out = flit_valid_q;
	     assign flit_ctrl_q[0] = flit_valid_q;
	     
	     if(flit_ctrl_width > 1)
	       begin
		  
		  c_dff
		    #(.width(flit_ctrl_width - 1),
		      .reset_type(reset_type))
		  flit_ctrlq
		    (.clk(clk),
		     .reset(1'b0),
		     .active(active),
		     .d(flit_ctrl_s[1:flit_ctrl_width-1]),
		     .q(flit_ctrl_q[1:flit_ctrl_width-1]));
		  
	       end
	     
	     if(num_vcs > 1)
	       begin
		  
		  wire [0:vc_idx_width-1] flit_vc;
		  c_encode
		    #(.num_ports(num_vcs))
		  flit_vc_enc
		    (.data_in(flit_sel_in_ovc),
		     .data_out(flit_vc));
		  
		  assign flit_ctrl_s[1:1+vc_idx_width-1] = flit_vc;
		  
	       end

	     case(packet_format)
	       
	       `PACKET_FORMAT_HEAD_TAIL:
		 begin
		    
		    assign flit_ctrl_s[1+vc_idx_width+0] = flit_head_in;
		    assign flit_ctrl_s[1+vc_idx_width+1] = flit_tail_in;
		    
		 end
	       
	       `PACKET_FORMAT_TAIL_ONLY:
		 begin
		    
		    assign flit_ctrl_s[1+vc_idx_width+0] = flit_tail_in;
		    
		 end
	       
	       `PACKET_FORMAT_EXPLICIT_LENGTH:
		 begin
		    
		    assign flit_ctrl_s[1+vc_idx_width+0] = flit_head_in;
		    
		 end
	       
	     endcase
	     
	     assign flit_ctrl_out = flit_ctrl_q;
	     
	  end
	
      endcase
      
   endgenerate
   
endmodule
