// $Id: vcr_op_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// output port controller (tracks state of buffers in downstream router)
//==============================================================================

module vcr_op_ctrl_mac
  (clk, reset, flow_ctrl_in, vc_active, vc_gnt_ovc, vc_sel_ovc_ip, 
   vc_sel_ovc_ivc, sw_active, sw_gnt, sw_sel_ip, sw_sel_ivc, flit_head, 
   flit_tail, flit_data, channel_out, almost_full_ovc, full_ovc, elig_ovc, 
   error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "vcr_constants.v"
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // total number of packet classes
   localparam num_packet_classes = num_message_classes * num_resource_classes;
   
   // number of VCs available for each class
   parameter num_vcs_per_class = 1;
   
   // number of VCs
   localparam num_vcs = num_packet_classes * num_vcs_per_class;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // make incoming flow control signals bypass the output VC state tracking 
   // logic
   parameter flow_ctrl_bypass = 1;
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
   // enable link power management
   parameter enable_link_pm = 1;
   
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
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   // channel width
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // EXPERIMENTAL:
   // for dynamic buffer management, only reserve a buffer slot for a VC while 
   // it is active (i.e., while a packet is partially transmitted)
   // (NOTE: This is currently broken!)
   parameter disable_static_reservations = 0;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // generate almost_empty signal early on in clock cycle
   localparam fast_almost_empty
     = flow_ctrl_bypass && (elig_mask == `ELIG_MASK_USED);
   
   // enable speculative switch allocation
   parameter sw_alloc_spec = 1;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // incoming flow control signals
   input [0:flow_ctrl_width-1] flow_ctrl_in;
   
   // VC allocation activity indicator
   input 		       vc_active;
   
   // output VC was granted to an input VC
   input [0:num_vcs-1] 	       vc_gnt_ovc;
   
   // input port that each output VC was granted to
   input [0:num_vcs*num_ports-1] vc_sel_ovc_ip;
   
   // input VC that each output VC was granted to
   input [0:num_vcs*num_vcs-1] 	 vc_sel_ovc_ivc;
   
   // switch allocation activity indicator
   input 			 sw_active;
   
   // was this output granted to an input port?
   input 			 sw_gnt;
   
   // which input port was this output granted to?
   input [0:num_ports-1] 	 sw_sel_ip;
   
   // which input VC was the grant for?
   input [0:num_vcs-1] 		 sw_sel_ivc;
   
   // incoming flit is a head flit
   input 			 flit_head;
   
   // incoming flit is a tail flit
   input 			 flit_tail;
   
   // incoming flit data
   input [0:flit_data_width-1] 	 flit_data;
   
   // outgoing flit control signals
   output [0:channel_width-1] 	 channel_out;
   wire [0:channel_width-1] 	 channel_out;
   
   // which output VC have only a single credit left?
   output [0:num_vcs-1] 	 almost_full_ovc;
   wire [0:num_vcs-1] 		 almost_full_ovc;
   
   // which output VC have no credit left?
   output [0:num_vcs-1] 	 full_ovc;
   wire [0:num_vcs-1] 		 full_ovc;
   
   // output VC is eligible for allocation (i.e., not currently allocated)
   output [0:num_vcs-1] 	 elig_ovc;
   wire [0:num_vcs-1] 		 elig_ovc;
   
   // internal error condition detected
   output 			 error;
   wire 			 error;
   
   
   //---------------------------------------------------------------------------
   // input staging
   //---------------------------------------------------------------------------
   
   wire 			 fc_active;
   
   wire 			 flow_ctrl_active;
   assign flow_ctrl_active = fc_active;
   
   wire 			 fc_event_valid;
   wire [0:num_vcs-1] 		 fc_event_sel_ovc;
   rtr_flow_ctrl_input
     #(.num_vcs(num_vcs),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fci
     (.clk(clk),
      .reset(reset),
      .active(flow_ctrl_active),
      .flow_ctrl_in(flow_ctrl_in),
      .fc_event_valid_out(fc_event_valid),
      .fc_event_sel_out_ovc(fc_event_sel_ovc));
   
   
   //---------------------------------------------------------------------------
   // output VC control logic
   //---------------------------------------------------------------------------
   
   wire 			 gnt_active;
   
   wire 			 flit_valid_s, flit_valid_q;
   assign flit_valid_s = sw_gnt;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_validq
     (.clk(clk),
      .reset(reset),
      .active(gnt_active),
      .d(flit_valid_s),
      .q(flit_valid_q));
   
   assign gnt_active = sw_active | flit_valid_q;
   
   wire 			 flit_head_s, flit_head_q;
   assign flit_head_s = sw_gnt ? flit_head : flit_head_q;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_headq
     (.clk(clk),
      .reset(1'b0),
      .active(sw_active),
      .d(flit_head_s),
      .q(flit_head_q));
   
   wire 			 flit_tail_s, flit_tail_q;
   assign flit_tail_s = sw_gnt ? flit_tail : flit_tail_q;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   flit_tailq
     (.clk(clk),
      .reset(1'b0),
      .active(sw_active),
      .d(flit_tail_s),
      .q(flit_tail_q));
   
   wire [0:num_vcs-1] 		 flit_sel_ovc;
   
   wire 			 flit_sent;
   
   generate
      
      if(sw_alloc_spec)
	assign flit_sent = flit_valid_q & (|flit_sel_ovc);
      else
	assign flit_sent = flit_valid_q;
            
   endgenerate
   
   wire 			 fcs_active;
   assign fcs_active = flit_valid_q | fc_event_valid;
   
   wire [0:num_vcs-1] 		 empty_ovc;
   wire [0:num_vcs-1] 		 full_prev_ovc;
   wire [0:num_vcs*2-1] 	 fcs_errors_ovc;
   rtr_fc_state
     #(.num_vcs(num_vcs),
       .buffer_size(buffer_size),
       .flow_ctrl_type(flow_ctrl_type),
       .flow_ctrl_bypass(flow_ctrl_bypass),
       .mgmt_type(fb_mgmt_type),
       .fast_almost_empty(fast_almost_empty),
       .disable_static_reservations(disable_static_reservations),
       .reset_type(reset_type))
   fcs
     (.clk(clk),
      .reset(reset),
      .active(fcs_active),
      .flit_valid(flit_sent),
      .flit_head(flit_head_q),
      .flit_tail(flit_tail_q),
      .flit_sel_ovc(flit_sel_ovc),
      .fc_event_valid(fc_event_valid),
      .fc_event_sel_ovc(fc_event_sel_ovc),
      .fc_active(fc_active),
      .empty_ovc(empty_ovc),
      .almost_full_ovc(almost_full_ovc),
      .full_ovc(full_ovc),
      .full_prev_ovc(full_prev_ovc),
      .errors_ovc(fcs_errors_ovc));
   
   genvar 			 ovc;
   
   generate
      
      for(ovc = 0; ovc < num_vcs; ovc = ovc + 1)
	begin:ovcs
	   
	   wire vc_gnt;
	   assign vc_gnt = vc_gnt_ovc[ovc];
	   
	   wire [0:num_ports-1] vc_sel_ip;
	   assign vc_sel_ip = vc_sel_ovc_ip[ovc*num_ports:(ovc+1)*num_ports-1];
	   
	   wire [0:num_vcs-1] 	vc_sel_ivc;
	   assign vc_sel_ivc = vc_sel_ovc_ivc[ovc*num_vcs:(ovc+1)*num_vcs-1];
	   
	   wire 		fc_event_sel;
	   assign fc_event_sel = fc_event_sel_ovc[ovc];
	   
	   wire 		empty;
	   assign empty = empty_ovc[ovc];
	   
	   wire 		full;
	   assign full = full_ovc[ovc];
	   
	   wire 		full_prev;
	   assign full_prev = full_prev_ovc[ovc];
	   
	   wire 		flit_sel;
	   wire 		elig;
	   vcr_ovc_ctrl
	     #(.num_vcs(num_vcs),
	       .num_ports(num_ports),
	       .sw_alloc_spec(sw_alloc_spec),
	       .elig_mask(elig_mask),
	       .reset_type(reset_type))
	   ovcc
	     (.clk(clk),
	      .reset(reset),
	      .vc_active(vc_active),
	      .vc_gnt(vc_gnt),
	      .vc_sel_ip(vc_sel_ip),
	      .vc_sel_ivc(vc_sel_ivc),
	      .sw_active(sw_active),
	      .sw_gnt(sw_gnt),
	      .sw_sel_ip(sw_sel_ip),
	      .sw_sel_ivc(sw_sel_ivc),
	      .flit_valid(flit_valid_q),
	      .flit_tail(flit_tail_q),
	      .flit_sel(flit_sel),
	      .elig(elig),
	      .full(full),
	      .full_prev(full_prev),
	      .empty(empty));
	   
	   assign flit_sel_ovc[ovc] = flit_sel;
	   assign elig_ovc[ovc] = elig;
	   
	end
      
   endgenerate
   
   wire 			error_unmatched;
   
   generate
      
      if(sw_alloc_spec)
	assign error_unmatched = 1'b0;
      else
	assign error_unmatched = flit_valid_q & ~|flit_sel_ovc;
      
   endgenerate
   
   wire 			flit_multisel;
   c_multi_hot_det
     #(.width(num_vcs))
   flit_multisel_mhd
     (.data(flit_sel_ovc),
      .multi_hot(flit_multisel));
   
   wire 			error_multimatch;
   assign error_multimatch = flit_valid_q & flit_multisel;
   
   
   //---------------------------------------------------------------------------
   // output staging
   //---------------------------------------------------------------------------
   
   wire 			cho_active;
   assign cho_active = flit_valid_q;
   
   rtr_channel_output
     #(.num_vcs(num_vcs),
       .packet_format(packet_format),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   cho
     (.clk(clk),
      .reset(reset),
      .active(cho_active),
      .flit_valid_in(flit_sent),
      .flit_head_in(flit_head_q),
      .flit_tail_in(flit_tail_q),
      .flit_data_in(flit_data),
      .flit_sel_in_ovc(flit_sel_ovc),
      .channel_out(channel_out));
   
   
   //---------------------------------------------------------------------------
   // error checking
   //---------------------------------------------------------------------------
   
   // synopsys translate_off
   
   always @(posedge clk)
     begin
	
	if(error_unmatched)
	  $display("ERROR: Unmatched flit in module %m.");
	
	if(error_multimatch)
	  $display("ERROR: Multiply matched flit in module %m.");
	
     end
   
   // synopsys translate_on
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:2+num_vcs*2-1] errors_s, errors_q;
	   assign errors_s = {error_unmatched, 
			      error_multimatch, 
			      fcs_errors_ovc};
	   c_err_rpt
	     #(.num_errors(2+num_vcs*2),
	       .capture_mode(error_capture_mode),
	       .reset_type(reset_type))
	   chk
	     (.clk(clk),
	      .reset(reset),
	      .active(1'b1),
	      .errors_in(errors_s),
	      .errors_out(errors_q));
	   
	   assign error = |errors_q;
	   
	end
      else
	assign error = 1'bx;
      
   endgenerate
   
endmodule
