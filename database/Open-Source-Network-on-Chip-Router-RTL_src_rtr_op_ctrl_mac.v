// $Id: rtr_op_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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
// output port controller
//==============================================================================

module rtr_op_ctrl_mac
  (clk, reset, flow_ctrl_in, flit_valid_in, flit_head_in, flit_tail_in, 
   flit_sel_in_ovc, flit_data_in, channel_out, elig_out_ovc, empty_out_ovc, 
   almost_full_out_ovc, full_out_ovc, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
   // number of VCs
   parameter num_vcs = 4;
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // make incoming flow control signals bypass the output VC state tracking 
   // logic
   parameter flow_ctrl_bypass = 1;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // EXPERIMENTAL:
   // for dynamic buffer management, only reserve a buffer slot for a VC while 
   // it is active (i.e., while a packet is partially transmitted)
   // (NOTE: This is currently broken!)
   parameter disable_static_reservations = 0;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // prefer empty VCs over non-empty ones in VC allocation
   parameter vc_alloc_prefer_empty = 0;
   
   // enable link power management
   parameter enable_link_pm = 1;
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
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
   
   // generate almost_empty signal early on in clock cycle
   localparam fast_almost_empty
     = flow_ctrl_bypass && 
       ((elig_mask == `ELIG_MASK_USED) || vc_alloc_prefer_empty);
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   
   // incoming flow control signals
   input [0:flow_ctrl_width-1] flow_ctrl_in;
   
   // incoming flit is valid
   input 		       flit_valid_in;
   
   // incoming flit is a head flit
   input 		       flit_head_in;
   
   // incoming flit is a tail flit
   input 		       flit_tail_in;
   
   // indicate which VC the incoming flit belongs to
   input [0:num_vcs-1] 	       flit_sel_in_ovc;
   
   // incoming flit data
   input [0:flit_data_width-1] flit_data_in;
   
   // outgoing flit control signals
   output [0:channel_width-1]  channel_out;
   wire [0:channel_width-1]    channel_out;
   
   // which output VCs are eligible for VC allocation?
   output [0:num_vcs-1]        elig_out_ovc;
   wire [0:num_vcs-1] 	       elig_out_ovc;
   
   // with output VCs contain no flits?
   output [0:num_vcs-1]        empty_out_ovc;
   wire [0:num_vcs-1] 	       empty_out_ovc;
   
   // which output VC have only a single credit left?
   output [0:num_vcs-1]        almost_full_out_ovc;
   wire [0:num_vcs-1] 	       almost_full_out_ovc;
   
   // which output VCs have no credits left?
   output [0:num_vcs-1]        full_out_ovc;
   wire [0:num_vcs-1] 	       full_out_ovc;
   
   // internal error condition detected
   output 		       error;
   wire 		       error;
   
   
   //---------------------------------------------------------------------------
   // flow control input staging
   //---------------------------------------------------------------------------
   
   wire 		       flow_ctrl_active;
   
   wire 		       fc_event_valid;
   wire [0:num_vcs-1] 	       fc_event_sel_ovc;
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
   // output staging
   //---------------------------------------------------------------------------
   
   wire 		       channel_active;
   assign channel_active = flit_valid_in;
   
   rtr_channel_output
     #(.num_vcs(num_vcs),
       .packet_format(packet_format),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   cho
     (.clk(clk),
      .reset(reset),
      .active(channel_active),
      .flit_valid_in(flit_valid_in),
      .flit_head_in(flit_head_in),
      .flit_tail_in(flit_tail_in),
      .flit_data_in(flit_data_in),
      .flit_sel_in_ovc(flit_sel_in_ovc),
      .channel_out(channel_out));
   
   
   //---------------------------------------------------------------------------
   // VC state tracking
   //---------------------------------------------------------------------------
   
   wire 		       fcs_active;
   assign fcs_active = flit_valid_in | fc_event_valid;
   
   wire 		       fcs_fc_active;
   wire [0:num_vcs-1] 	       fcs_empty_ovc;
   wire [0:num_vcs-1] 	       fcs_almost_full_ovc;
   wire [0:num_vcs-1] 	       fcs_full_ovc;
   wire [0:num_vcs-1] 	       fcs_full_prev_ovc;
   wire [0:num_vcs*2-1]        fcs_errors_ovc;
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
      .flit_valid(flit_valid_in),
      .flit_head(flit_head_in),
      .flit_tail(flit_tail_in),
      .flit_sel_ovc(flit_sel_in_ovc),
      .fc_event_valid(fc_event_valid),
      .fc_event_sel_ovc(fc_event_sel_ovc),
      .fc_active(fcs_fc_active),
      .empty_ovc(fcs_empty_ovc),
      .almost_full_ovc(fcs_almost_full_ovc),
      .full_ovc(fcs_full_ovc),
      .full_prev_ovc(fcs_full_prev_ovc),
      .errors_ovc(fcs_errors_ovc));
   
   assign empty_out_ovc = fcs_empty_ovc;
   assign almost_full_out_ovc = fcs_almost_full_ovc;
   assign full_out_ovc = fcs_full_ovc;
   
   assign flow_ctrl_active = fcs_fc_active;
   
   wire 		       ovc_active;
   assign ovc_active = flit_valid_in;
   
   genvar 		       ovc;
   
   generate
      
      for(ovc = 0; ovc < num_vcs; ovc = ovc + 1)
	begin:ovcs
	   
	   wire flit_sel_in;
	   assign flit_sel_in = flit_sel_in_ovc[ovc];
	   
	   wire flit_valid_sel_in;
	   assign flit_valid_sel_in = flit_valid_in & flit_sel_in;
	   
	   wire fcs_empty;
	   assign fcs_empty = fcs_empty_ovc[ovc];

	   wire fcs_full;
	   assign fcs_full = fcs_full_ovc[ovc];	   
	   
	   
	   //-------------------------------------------------------------------
	   // track whether this output VC is currently in use
	   //-------------------------------------------------------------------
	   
	   // NOTE: For the reset condition, we don't have to worry about 
	   // whether or not sufficient buffer space is available: If the VC is 
	   // currently allocated, these checks would already have been 
	   // performed at the beginning of switch allocation; on the other 
	   // hand, if it is not currently allocated, 'allocated_q' is zero, 
	   // and thus the reset condition does not have any effect.
	   
	   wire allocated;
	   
	   wire allocated_s, allocated_q;
	   assign allocated_s = allocated;
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   allocatedq
	     (.clk(clk),
	      .reset(reset),
	      .active(ovc_active),
	      .d(allocated_s),
	      .q(allocated_q));
	   
	   assign allocated = flit_valid_sel_in ? ~flit_tail_in : allocated_q;
	   
	   wire elig;
	   
	   case(elig_mask)
	     
	     `ELIG_MASK_NONE:
	       assign elig = ~allocated;
	     
	     `ELIG_MASK_FULL:
	       assign elig = ~allocated & ~fcs_full;
	     
	     `ELIG_MASK_USED:
	       assign elig = ~allocated & fcs_empty;
	     
	   endcase
	   
	   assign elig_out_ovc[ovc] = elig;
	   
	end
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // error checking
   //---------------------------------------------------------------------------
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:num_vcs*2-1] errors_s, errors_q;
	   assign errors_s = fcs_errors_ovc;
	   c_err_rpt
	     #(.num_errors(num_vcs*2),
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
