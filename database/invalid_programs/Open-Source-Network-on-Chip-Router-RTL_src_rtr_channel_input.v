// $Id: rtr_channel_input.v 5188 2012-08-30 00:31:31Z dub $

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
// channel interface (receive side)
//==============================================================================

module rtr_channel_input
  (clk, reset, active, channel_in, flit_valid_out, flit_head_out, 
   flit_head_out_ivc, flit_tail_out, flit_tail_out_ivc, flit_data_out, 
   flit_sel_out_ivc);
   
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
   
   // maximum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter max_payload_length = 4;
   
   // minimum payload length (in flits)
   // (note: only used if packet_format==`PACKET_FORMAT_EXPLICIT_LENGTH)
   parameter min_payload_length = 1;
   
   // total number of bits required for routing-related information
   parameter route_info_width = 14;
   
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
   
   // number of bits required to represent all possible payload sizes
   localparam payload_length_width
     = clogb(max_payload_length-min_payload_length+1);
   
   // width of counter for remaining flits
   localparam flit_ctr_width = clogb(max_payload_length);
   
   // total number of bits of header information encoded in header flit payload
   localparam header_info_width
     = (packet_format == `PACKET_FORMAT_HEAD_TAIL) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_TAIL_ONLY) ? 
       route_info_width : 
       (packet_format == `PACKET_FORMAT_EXPLICIT_LENGTH) ? 
       (route_info_width + payload_length_width) : 
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
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;
   input active;
   
   // incoming channel data
   input [0:channel_width-1] channel_in;
   
   // flit valid indicator
   output 		     flit_valid_out;
   wire 		     flit_valid_out;
   
   // flit is head flit
   output 		     flit_head_out;
   wire 		     flit_head_out;
   output [0:num_vcs-1]      flit_head_out_ivc;
   wire [0:num_vcs-1] 	     flit_head_out_ivc;
   
   // flit is tail flit
   output 		     flit_tail_out;
   wire 		     flit_tail_out;
   output [0:num_vcs-1]      flit_tail_out_ivc;
   wire [0:num_vcs-1] 	     flit_tail_out_ivc;
   
   // payload data
   output [0:flit_data_width-1] flit_data_out;
   wire [0:flit_data_width-1] 	flit_data_out;
   
   // indicate which VC the current flit (if any) belongs to
   output [0:num_vcs-1] 	  flit_sel_out_ivc;
   wire [0:num_vcs-1] 		  flit_sel_out_ivc;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire 			  regs_active;
   
   generate
      
      if(enable_link_pm)
	begin
	   
	   wire link_active_s, link_active_q;
	   assign link_active_s = channel_in[0];
	   c_dff
	     #(.width(1),
	       .reset_type(reset_type))
	   link_activeq
	     (.clk(clk),
	      .reset(reset),
	      .active(active),
	      .d(link_active_s),
	      .q(link_active_q));
	   
	   assign regs_active = link_active_q;
	   
	end
      else
	assign regs_active = active;
      
   endgenerate
   
   wire [0:flit_ctrl_width-1] 	  flit_ctrl_in;
   assign flit_ctrl_in = channel_in[link_ctrl_width:
				    link_ctrl_width+flit_ctrl_width-1];
   
   wire [0:flit_data_width-1] 	  flit_data_in;
   assign flit_data_in
     = channel_in[link_ctrl_width+flit_ctrl_width:
		  link_ctrl_width+flit_ctrl_width+flit_data_width-1];
   
   wire [0:flit_data_width-1] 	  flit_data_s, flit_data_q;
   assign flit_data_s = flit_data_in;
   c_dff
     #(.width(flit_data_width),
       .reset_type(reset_type))
   flit_dataq
     (.clk(clk),
      .reset(1'b0),
      .active(regs_active),
      .d(flit_data_s),
      .q(flit_data_q));
   
   assign flit_data_out = flit_data_q;
   
   wire [0:header_info_width-1]   header_info_q;
   assign header_info_q = flit_data_q[0:header_info_width-1];
   
   generate
      
      case(packet_format)
	
	`PACKET_FORMAT_HEAD_TAIL, 
	`PACKET_FORMAT_TAIL_ONLY, 
	`PACKET_FORMAT_EXPLICIT_LENGTH:
	  begin
	     
	     wire [0:flit_ctrl_width-1] flit_ctrl_s, flit_ctrl_q;
	     assign flit_ctrl_s = flit_ctrl_in;
	     
	     wire 			flit_valid_s, flit_valid_q;
	     assign flit_valid_s = flit_ctrl_s[0];
	     c_dff
	       #(.width(1),
		 .reset_type(reset_type))
	     flit_validq
	       (.clk(clk),
		.reset(reset),
		.active(regs_active),
		.d(flit_valid_s),
		.q(flit_valid_q));
	     
	     assign flit_ctrl_q[0] = flit_valid_q;
	     
	     assign flit_valid_out = flit_valid_q;
	     
	     if(flit_ctrl_width > 1)
	       begin
		  
		  c_dff
		  #(.width(flit_ctrl_width - 1),
		    .reset_type(reset_type))
		  flit_ctrlq
		    (.clk(clk),
		     .reset(1'b0),
		     .active(regs_active),
		     .d(flit_ctrl_s[1:flit_ctrl_width-1]),
		     .q(flit_ctrl_q[1:flit_ctrl_width-1]));
		  
	       end
	     
	     if(num_vcs > 1)
	       begin
		  
		  wire [0:vc_idx_width-1] flit_vc_q;
		  assign flit_vc_q = flit_ctrl_q[1:1+vc_idx_width-1];
		  
		  c_decode
		    #(.num_ports(num_vcs))
		  flit_sel_out_ivc_dec
		    (.data_in(flit_vc_q),
		     .data_out(flit_sel_out_ivc));
		  
	       end
	     else
	       assign flit_sel_out_ivc = 1'b1;
	     
	     case(packet_format)
	       
	       `PACKET_FORMAT_HEAD_TAIL:
		 begin
		    
		    assign flit_head_out = flit_ctrl_q[1+vc_idx_width+0];
		    assign flit_head_out_ivc = {num_vcs{flit_head_out}};
		    assign flit_tail_out = flit_ctrl_q[1+vc_idx_width+1];
		    assign flit_tail_out_ivc = {num_vcs{flit_tail_out}};
		    		    
		 end
	       
	       `PACKET_FORMAT_TAIL_ONLY:
		 begin
		    
		    assign flit_tail_out = flit_ctrl_q[1+vc_idx_width+0];
		    assign flit_tail_out_ivc = {num_vcs{flit_tail_out}};
		    
		    genvar ivc;
		    
		    for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
		      begin:ivcs
			 
			 wire [0:num_vcs-1] flit_head_s, flit_head_q;
			 assign flit_head_s
			   = (flit_valid_out & flit_sel_out_ivc[ivc]) ? 
			     flit_tail_out : 
			     flit_head_q;
			 c_dff
			   #(.width(1),
			     .reset_type(reset_type),
			     .reset_value(1'b1))
			 flit_headq
			   (.clk(clk),
			    .reset(reset),
			    .active(regs_active),
			    .d(flit_head_s),
			    .q(flit_head_q));
			 
			 assign flit_head_out_ivc[ivc] = flit_head_q;
			 
		      end
		    
		    c_select_1ofn
		      #(.num_ports(num_vcs),
			.width(1))
		    flit_head_out_sel
		      (.select(flit_sel_out_ivc),
		       .data_in(flit_head_out_ivc),
		       .data_out(flit_head_out));
		    
		 end
	       
	       `PACKET_FORMAT_EXPLICIT_LENGTH:
		 begin
		    
		    assign flit_head_out = flit_ctrl_q[1+vc_idx_width+0];
		    assign flit_head_out_ivc = {num_vcs{flit_head_out}};
		    
		    if(max_payload_length == 0)
		      begin
			 
			 if(max_payload_length == min_payload_length)
			   begin
			      assign flit_tail_out = flit_head_out;
			      assign flit_tail_out_ivc = flit_head_out_ivc;
			   end
			 
			 // synopsys translate_off
			 else
			   begin
			      initial
			      begin
				 $display({"ERROR: The value of the ", 
					   "max_payload_length parameter ", 
					   "(%d) in module %m cannot be ",
					   "smaller than that of the ",
					   "min_payload_length parameter ",
					   "(%d)."},
					  max_payload_length, 
					  min_payload_length);
				 $stop;
			      end
			   end
			 // synopsys translate_on
			 
		      end
		    else if(max_payload_length == 1)
		      begin
			 
			 wire has_payload;
			 
			 if(max_payload_length > min_payload_length)
			   assign has_payload = header_info_q[route_info_width];
			 else if(max_payload_length == min_payload_length)
			   assign has_payload = 1'b1;
			 
			 // synopsys translate_off
			 else
			   begin
			      initial
			      begin
				 $display({"ERROR: The value of the ", 
					   "max_payload_length parameter ",
					   "(%d) in module %m cannot be ",
					   "smaller than that of the ",
					   "min_payload_length parameter ",
					   "(%d)."},
					  max_payload_length,
					  min_payload_length);
				 $stop;
			      end
			   end
			 // synopsys translate_on
			 
			 assign flit_tail_out = ~flit_head_out | ~has_payload;
			 assign flit_tail_out_ivc = {num_vcs{flit_tail_out}};
			 			 
		      end
		    else
		      begin
			 
			 genvar ivc;
			 
			 for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
			   begin:ivcs
			      
			      wire [0:flit_ctr_width-1] flit_ctr_next;
			      wire [0:flit_ctr_width-1] flit_ctr_s, flit_ctr_q;
			      assign flit_ctr_s
				= (flit_valid_out & flit_sel_out_ivc[ivc]) ? 
				  (flit_head_out ? 
				   flit_ctr_next : 
				   (flit_ctr_q - 1'b1)) : 
				  flit_ctr_q;
			      c_dff
				#(.width(flit_ctr_width),
				  .reset_type(reset_type))
			      flit_ctrq
				(.clk(clk),
				 .reset(reset),
				 .active(active),
				 .d(flit_ctr_s),
				 .q(flit_ctr_q));
			      
			      wire 			flit_tail_out;
			      
			      if(max_payload_length > min_payload_length)
				begin
				   
				   wire [0:payload_length_width-1] 
				     payload_length;
				   assign payload_length
				     = header_info_q[route_info_width:
						     route_info_width+
						     payload_length_width-1];
				   
				   assign flit_ctr_next
				     = (min_payload_length - 1) + 
				       payload_length;
				   
				   if(min_payload_length == 0)
				     assign flit_tail_out = flit_head_out ? 
							    ~|payload_length : 
							    ~|flit_ctr_q;
				   else
				     assign flit_tail_out = ~flit_head_out & 
							    ~|flit_ctr_q;
				   
				end
			      else if(max_payload_length == min_payload_length)
				begin
				   assign flit_ctr_next
				     = max_payload_length - 1;
				   assign flit_tail_out
				     = ~flit_head_out & ~|flit_ctr_q;
				end
			      
			      // synopsys translate_off
			      else
				begin
				   initial
				   begin
				      $display({"ERROR: The value of the ", 
						"max_payload_length parameter ",
						"(%d) in module %m cannot be ",
						"smaller than that of the ",
						"min_payload_length ", 
						"parameter (%d)."},
					       max_payload_length,
					       min_payload_length);
				      $stop;
				   end
				end
			      // synopsys translate_on
			      
			      assign flit_tail_out_ivc[ivc] = flit_tail_out;
			      
			   end
			 
			 c_select_1ofn
			   #(.num_ports(num_vcs),
			     .width(1))
			 flit_tail_out_sel
			   (.select(flit_sel_out_ivc),
			    .data_in(flit_tail_out_ivc),
			    .data_out(flit_tail_out));
			 
		      end
		    
		 end
	       
	     endcase
	     
	  end
	
      endcase
      
   endgenerate
   
endmodule
