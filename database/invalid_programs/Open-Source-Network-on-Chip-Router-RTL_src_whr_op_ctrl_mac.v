// $Id: whr_op_ctrl_mac.v 5188 2012-08-30 00:31:31Z dub $

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

module whr_op_ctrl_mac
  (clk, reset, flow_ctrl_in, flit_valid_in, flit_head_in, flit_tail_in, 
   flit_data_in, channel_out, elig, full, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
`include "whr_constants.v"
   
   // total buffer size per port in flits
   parameter buffer_size = 8;
   
   // number of routers in each dimension
   parameter num_routers_per_dim = 4;
   
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
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? 1 :
       -1;
   
   // select whether to exclude full or non-empty VCs from VC allocation
   parameter elig_mask = `ELIG_MASK_NONE;
   
   // generate almost_empty signal early on in clock cycle
   localparam fast_almost_empty
     = flow_ctrl_bypass && (elig_mask == `ELIG_MASK_USED);
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);

   // enable link power management
   parameter enable_link_pm = 1;
   
   // width of link management signals
   localparam link_ctrl_width = enable_link_pm ? 1 : 0;
   
   // width of flit control signals
   localparam flit_ctrl_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       (1 + 1 + 1) : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       (1 + 1) : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (1 + 1) : 
       -1;
   
   // width of flit payload data
   parameter flit_data_width = 64;
   
   // channel width
   localparam channel_width
     = link_ctrl_width + flit_ctrl_width + flit_data_width;
   
   // configure error checking logic
   parameter error_capture_mode = `ERROR_CAPTURE_MODE_NO_HOLD;
   
   // ID of current input port
   parameter port_id = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   // incoming flow control signals
   input [0:flow_ctrl_width-1] flow_ctrl_in;
   
   // grant from allocator module
   input 		       flit_valid_in;
   
   // grant is for head flit
   input 		       flit_head_in;
   
   // grant is for tail flit
   input 		       flit_tail_in;
   
   // incoming flit data
   input [0:flit_data_width-1] flit_data_in;
   
   // outgoing channel
   output [0:channel_width-1]  channel_out;
   wire [0:channel_width-1]    channel_out;
   
   // output is available for allocation
   output 		       elig;
   wire 		       elig;
   
   // output is full
   output 		       full;
   wire 		       full;
   
   // internal error condition detected
   output 		       error;
   wire 		       error;
   
   
   //---------------------------------------------------------------------------
   // input staging
   //---------------------------------------------------------------------------
   
   wire 		       fcs_fc_active;
   
   wire 		       flow_ctrl_active;
   assign flow_ctrl_active = fcs_fc_active;
   
   wire 		       fc_event_valid;
   wire 		       fc_event_sel_ovc;
   rtr_flow_ctrl_input
     #(.num_vcs(1),
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
   // track buffer occupancy
   //---------------------------------------------------------------------------
   
   wire 		       fcs_active;
   assign fcs_active = flit_valid_in | fc_event_valid;
   
   wire 		       fcs_empty;
   wire 		       fcs_almost_full;
   wire 		       fcs_full;
   wire 		       fcs_full_prev;
   wire [0:1] 		       fcs_errors;
   rtr_fc_state
     #(.num_vcs(1),
       .buffer_size(buffer_size),
       .flow_ctrl_type(flow_ctrl_type),
       .flow_ctrl_bypass(flow_ctrl_bypass),
       .mgmt_type(`FB_MGMT_TYPE_STATIC),
       .fast_almost_empty(fast_almost_empty),
       .disable_static_reservations(0),
       .reset_type(reset_type))
   fcs
     (.clk(clk),
      .reset(reset),
      .active(fcs_active),
      .flit_valid(flit_valid_in),
      .flit_head(flit_head_in),
      .flit_tail(flit_tail_in),
      .flit_sel_ovc(1'b1),
      .fc_event_valid(fc_event_valid),
      .fc_event_sel_ovc(1'b1),
      .fc_active(fcs_fc_active),
      .empty_ovc(fcs_empty),
      .almost_full_ovc(fcs_almost_full),
      .full_ovc(fcs_full),
      .full_prev_ovc(fcs_full_prev),
      .errors_ovc(fcs_errors));
   
   assign full = fcs_full;
   
   
   //---------------------------------------------------------------------------
   // track whether this output VC is currently in use
   //---------------------------------------------------------------------------
   
   // NOTE: For the reset condition, we don't have to worry about whether or 
   // not sufficient buffer space is available: If the VC is currently 
   // allocated, these checks would already have been performed at the 
   // beginning of switch allocation; on the other hand, if it is not currently 
   // allocated, 'allocated_q' is zero, and thus the reset condition does not 
   // have any effect.
   
   wire 		       allocated;
   
   wire 		       allocated_s, allocated_q;
   assign allocated_s = allocated;
   c_dff
     #(.width(1),
       .reset_type(reset_type))
   allocatedq
     (.clk(clk),
      .reset(reset),
      .active(fcs_active),
      .d(allocated_s),
      .q(allocated_q));
   
   assign allocated = flit_valid_in ? ~flit_tail_in : allocated_q;
   
   generate
      
      case(elig_mask)
	
	`ELIG_MASK_NONE:
	  assign elig = ~allocated;
	
	`ELIG_MASK_FULL:
	  assign elig = ~allocated & ~fcs_full;
	
	`ELIG_MASK_USED:
	  assign elig = ~allocated & fcs_empty;
	
      endcase
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // output staging
   //---------------------------------------------------------------------------
   
   wire 					 flit_out_active;
   assign flit_out_active = flit_valid_in;
   
   rtr_channel_output
     #(.num_vcs(1),
       .packet_format(packet_format),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   cho
     (.clk(clk),
      .reset(reset),
      .active(flit_out_active),
      .flit_valid_in(flit_valid_in),
      .flit_head_in(flit_head_in),
      .flit_tail_in(flit_tail_in),
      .flit_data_in(flit_data_in),
      .flit_sel_in_ovc(1'b1),
      .channel_out(channel_out));
   
   
   //---------------------------------------------------------------------------
   // error checker logic
   //---------------------------------------------------------------------------
   
   generate
      
      if(error_capture_mode != `ERROR_CAPTURE_MODE_NONE)
	begin
	   
	   wire [0:1] errors_s, errors_q;
	   assign errors_s = fcs_errors;
	   c_err_rpt
	     #(.num_errors(2),
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
