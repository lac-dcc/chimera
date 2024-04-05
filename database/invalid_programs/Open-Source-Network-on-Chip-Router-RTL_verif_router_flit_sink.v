// $Id: flit_sink.v 5188 2012-08-30 00:31:31Z dub $

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

module flit_sink
  (clk, reset, channel, flow_ctrl, error);
   
`include "c_functions.v"
`include "c_constants.v"
`include "rtr_constants.v"
   
   parameter initial_seed = 0;
   
   // flit consumption rate (percentage of cycles)
   parameter consume_rate = 50;
   
   // total buffer size per port in flits
   parameter buffer_size = 64;
   
   // number of VCs
   parameter num_vcs = 8;
   
   // width required to select individual VC
   localparam vc_idx_width = clogb(num_vcs);
   
   // buffer size per VC in flits
   localparam buffer_size_per_vc = buffer_size / num_vcs;
   
   // width required to express number of flits in a VC
   localparam flit_count_width = clogb(buffer_size_per_vc + 1);
   
   // select packet format
   parameter packet_format = `PACKET_FORMAT_EXPLICIT_LENGTH;
   
   // select type of flow control
   parameter flow_ctrl_type = `FLOW_CTRL_TYPE_CREDIT;
   
   // width of flow control signals
   localparam flow_ctrl_width
     = (flow_ctrl_type == `FLOW_CTRL_TYPE_CREDIT) ? (1 + vc_idx_width) :
       -1;
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);
   
   // total number of bits required for routing-related information
   parameter route_info_width = 14;
   
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
   
   // select implementation variant for flit buffer register file
   parameter fb_regfile_type = `REGFILE_TYPE_FF_2D;
   
   // select flit buffer management scheme
   parameter fb_mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // use atomic VC allocation
   parameter atomic_vc_allocation = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   input clk;
   input reset;
   
   input [0:channel_width-1] channel;
   
   output [0:flow_ctrl_width-1] flow_ctrl;
   wire [0:flow_ctrl_width-1] 	flow_ctrl;
   
   output 			error;
   wire 			error;
   
   integer 			seed = initial_seed;
   
   wire 			flit_valid;
   wire 			flit_head;
   wire [0:num_vcs-1] 		flit_head_ivc;
   wire 			flit_tail;
   wire [0:num_vcs-1] 		flit_tail_ivc;
   wire [0:flit_data_width-1] 	flit_data;
   wire [0:num_vcs-1] 		flit_sel_ivc;
   rtr_channel_input
     #(.num_vcs(num_vcs),
       .packet_format(packet_format),
       .max_payload_length(max_payload_length),
       .min_payload_length(min_payload_length),
       .route_info_width(route_info_width),
       .enable_link_pm(enable_link_pm),
       .flit_data_width(flit_data_width),
       .reset_type(reset_type))
   chi
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .channel_in(channel),
      .flit_valid_out(flit_valid),
      .flit_head_out(flit_head),
      .flit_head_out_ivc(flit_head_ivc),
      .flit_tail_out(flit_tail),
      .flit_tail_out_ivc(flit_tail_ivc),
      .flit_data_out(flit_data),
      .flit_sel_out_ivc(flit_sel_ivc));
   
   reg 				consume;
   
   always @(posedge clk, posedge reset)
     begin
	consume <= $dist_uniform(seed, 0, 99) < consume_rate;
     end
   
   wire [0:num_vcs-1] empty_ivc;
   
   wire [0:num_vcs-1] req_ivc;
   assign req_ivc = ({num_vcs{flit_valid}} & flit_sel_ivc) | ~empty_ivc;
   
   wire 	      gnt;
   assign gnt = |req_ivc & consume;
   
   wire 	      update;
   assign update = gnt;
   
   wire [0:num_vcs-1] gnt_ivc;
   c_arbiter
     #(.num_ports(num_vcs),
       .num_priorities(1),
       .arbiter_type(`ARBITER_TYPE_MATRIX),
       .reset_type(reset_type))
   gnt_ivc_arb
     (.clk(clk),
      .reset(reset),
      .update(update),
      .active(1'b1),
      .req_pr(req_ivc),
      .gnt_pr(gnt_ivc),
      .gnt());
   
   wire [0:num_vcs*2-1] errors_ivc;
   rtr_flit_buffer
     #(.num_vcs(num_vcs),
       .buffer_size(buffer_size),
       .flit_data_width(flit_data_width),
       .header_info_width(flit_data_width),
       .regfile_type(fb_regfile_type),
       .explicit_pipeline_register(0),
       .gate_buffer_write(0),
       .mgmt_type(fb_mgmt_type),
       .atomic_vc_allocation(atomic_vc_allocation),
       .enable_bypass(1),
       .reset_type(reset_type))
   fb
     (.clk(clk),
      .reset(reset),
      .push_active(1'b1),
      .push_valid(flit_valid),
      .push_sel_ivc(flit_sel_ivc),
      .push_head(flit_head),
      .push_tail(flit_tail),
      .push_data(flit_data),
      .pop_active(1'b1),
      .pop_valid(gnt),
      .pop_sel_ivc(gnt_ivc),
      .pop_data(),
      .pop_tail_ivc(),
      .pop_next_header_info(),
      .almost_empty_ivc(),
      .empty_ivc(empty_ivc),
      .full(),
      .errors_ivc(errors_ivc));
   
   rtr_flow_ctrl_output
     #(.num_vcs(num_vcs),
       .flow_ctrl_type(flow_ctrl_type),
       .reset_type(reset_type))
   fco
     (.clk(clk),
      .reset(reset),
      .active(1'b1),
      .fc_event_valid_in(update),
      .fc_event_sel_in_ivc(gnt_ivc),
      .flow_ctrl_out(flow_ctrl));
   
   assign error = |errors_ivc;
   
endmodule
