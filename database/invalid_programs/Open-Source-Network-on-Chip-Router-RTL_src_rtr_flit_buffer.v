// $Id: rtr_flit_buffer.v 5188 2012-08-30 00:31:31Z dub $

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
// flit buffer
//==============================================================================

module rtr_flit_buffer
  (clk, reset, push_active, push_valid, push_head, push_tail, push_sel_ivc, 
   push_data, pop_active, pop_valid, pop_sel_ivc, pop_data, pop_tail_ivc, 
   pop_next_header_info, almost_empty_ivc, empty_ivc, full, errors_ivc);
   
`include "c_functions.v"
`include "c_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of VCs
   parameter num_vcs = 4;
   
   // total buffer size per port in flits
   parameter buffer_size = 32;
   
   // width of payload data
   parameter flit_data_width = 64;
   
   // total number of bits of header information encoded in header flit payload
   parameter header_info_width = 8;
   
   // implementation variant for register file
   parameter regfile_type = `REGFILE_TYPE_FF_2D;
   
   // use explicit pipeline register between flit buffer and crossbar?
   parameter explicit_pipeline_register = 1;
   
   // gate buffer write port if bypassing
   // (requires explicit pipeline register; may increase cycle time)
   parameter gate_buffer_write = 0;
   
   // select buffer management scheme
   parameter mgmt_type = `FB_MGMT_TYPE_STATIC;
   
   // improve timing for peek access
   parameter fast_peek = 1;
   
   // use atomic VC allocation
   parameter atomic_vc_allocation = 1;
   
   // allow bypassing through empty FIFO (i.e., empty & push & pop)
   parameter enable_bypass = 0;
   
   parameter reset_type = `RESET_TYPE_ASYNC;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // buffer size per VC in flits
   localparam buffer_size_per_vc = buffer_size / num_vcs;
   
   // address width required for selecting an individual entry
   localparam addr_width = clogb(buffer_size);
   
   // address width required for selecting an individual entry in a VC
   localparam vc_addr_width = clogb(buffer_size_per_vc);
   
   // difference between the two
   localparam addr_pad_width = addr_width - vc_addr_width;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   input clk;
   input reset;

   // activity indicator for insertion
   input push_active;
   
   // insert data
   input push_valid;
   
   // inserting head flit
   input push_head;
   
   // inserting tail flit
   input push_tail;
   
   // VC to insert into
   input [0:num_vcs-1] push_sel_ivc;
   
   // data to be inserted
   input [0:flit_data_width-1] push_data;
   
   // activity indicator for read / removal
   input 		       pop_active;
   
   // read and remove data
   input 		       pop_valid;
   
   // VC to remove from
   input [0:num_vcs-1] 	       pop_sel_ivc;
   
   // read data
   // NOTE: This is valid in the cycle after pop_valid!
   output [0:flit_data_width-1] pop_data;
   wire [0:flit_data_width-1] 	pop_data;
   
   // tail bit for the element to be read next in each VC
   output [0:num_vcs-1] 	pop_tail_ivc;
   wire [0:num_vcs-1] 		pop_tail_ivc;
   
   // peek-ahead at the element in each VC after the one to be read next
   output [0:header_info_width-1] pop_next_header_info;
   wire [0:header_info_width-1]   pop_next_header_info;
   
   // VC state flags
   output [0:num_vcs-1] 	  almost_empty_ivc;
   wire [0:num_vcs-1] 		  almost_empty_ivc;
   output [0:num_vcs-1] 	  empty_ivc;
   wire [0:num_vcs-1] 		  empty_ivc;
   output 			  full;
   wire 			  full;
   
   // internal error conditions detected
   output [0:num_vcs*2-1] 	  errors_ivc;
   wire [0:num_vcs*2-1] 	  errors_ivc;
   
   wire [0:addr_width-1] 	  push_addr;
   wire [0:num_vcs*addr_width-1]  pop_addr_ivc;
   wire [0:num_vcs*addr_width-1]  pop_next_addr_ivc;
   
   generate
      
      //------------------------------------------------------------------------
      // tail flit tracking (atomic)
      //------------------------------------------------------------------------
      
      if(atomic_vc_allocation)
	begin
	   
	   wire [0:num_vcs-1] has_tail_ivc_s, has_tail_ivc_q;
	   assign has_tail_ivc_s
	     = push_valid ?
	       ((has_tail_ivc_q & 
		 ~({num_vcs{push_head}} & push_sel_ivc)) | 
		({num_vcs{push_tail}} & push_sel_ivc)) : 
	       has_tail_ivc_q;
	   c_dff
	     #(.width(num_vcs),
	       .reset_type(reset_type))
	   has_tail_ivcq
	     (.clk(clk),
	      .reset(reset),
	      .active(push_active),
	      .d(has_tail_ivc_s),
	      .q(has_tail_ivc_q));
	   
	   assign pop_tail_ivc = almost_empty_ivc & has_tail_ivc_q;
	   
	end
      
      case(mgmt_type)

	`FB_MGMT_TYPE_STATIC:
	  begin
	     
	     //-----------------------------------------------------------------
	     // tail flit tracking (non-atomic)
	     //-----------------------------------------------------------------
	     
	     wire [0:num_vcs*addr_width-1] push_addr_ivc;
	     
	     if(!atomic_vc_allocation)
	       begin
		  
		  genvar ivc;
		  
		  for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
		    begin:ivcs
		       
		       wire push_sel;
		       assign push_sel = push_sel_ivc[ivc];
		       
		       wire push_valid_sel;
		       assign push_valid_sel = push_valid & push_sel;
		       
		       wire [0:addr_width-1] push_addr;
		       assign push_addr
			 = push_addr_ivc[ivc*addr_width:(ivc+1)*addr_width-1];
		       
		       wire [0:buffer_size_per_vc-1] push_mask;
		       
		       if(buffer_size_per_vc == 1)
			 assign push_mask = 1'b1;
		       else if(buffer_size_per_vc > 1)
			 begin
			    
			    wire [0:vc_addr_width-1] push_vc_addr;
			    assign push_vc_addr
			      = push_addr[addr_pad_width:addr_width-1];
			    
			    c_decode
			      #(.num_ports(buffer_size_per_vc),
				.offset((ivc * buffer_size_per_vc) %
					(1 << vc_addr_width)))
			    push_mask_dec
			      (.data_in(push_vc_addr),
			       .data_out(push_mask));
			    
			 end
		       
		       wire [0:buffer_size_per_vc-1] tail_s, tail_q;
		       assign tail_s
			 = push_valid_sel ? 
			   (({buffer_size_per_vc{push_tail}} & push_mask) | 
			    (tail_q & ~push_mask)) :
			   tail_q;
		       c_dff
			 #(.width(buffer_size_per_vc),
			   .reset_type(reset_type))
		       tailq
			 (.clk(clk),
			  .reset(1'b0),
			  .active(push_active),
			  .d(tail_s),
			  .q(tail_q));
		       
		       wire [0:addr_width-1] 	     pop_addr;
		       assign pop_addr
			 = pop_addr_ivc[ivc*addr_width:(ivc+1)*addr_width-1];
		       
		       wire [0:buffer_size_per_vc-1] pop_mask;
		       
		       if(buffer_size_per_vc == 1)
			 assign pop_mask = 1'b1;
		       else if(buffer_size_per_vc > 1)
			 begin
			    
			    wire [0:vc_addr_width-1] pop_vc_addr;
			    assign pop_vc_addr
			      = pop_addr[addr_pad_width:addr_width-1];
			    
			    c_decode
			      #(.num_ports(buffer_size_per_vc),
				.offset((ivc * buffer_size_per_vc) % 
					(1 << vc_addr_width)))
			    pop_mask_dec
			      (.data_in(pop_vc_addr),
			       .data_out(pop_mask));
			    
			 end
		       
		       wire 			     pop_tail;
		       c_select_1ofn
			 #(.num_ports(buffer_size_per_vc),
			   .width(1))
		       pop_tail_sel
			 (.select(pop_mask),
			  .data_in(tail_q),
			  .data_out(pop_tail));
		       
		       assign pop_tail_ivc[ivc] = pop_tail;
		       
		    end
		  
	       end
	     
	     
	     //-----------------------------------------------------------------
	     // buffer control
	     //-----------------------------------------------------------------
	     
	     wire [0:num_vcs-1] 		     full_ivc;
	     c_samq_ctrl
	       #(.num_queues(num_vcs),
		 .num_slots_per_queue(buffer_size_per_vc),
		 .enable_bypass(enable_bypass),
		 .fast_pop_next_addr(fast_peek),
		 .reset_type(reset_type))
	     samqc
	       (.clk(clk),
		.reset(reset),
		.push_active(push_active),
		.push_valid(push_valid),
		.push_sel_qu(push_sel_ivc),
		.push_addr_qu(push_addr_ivc),
		.pop_active(pop_active),
		.pop_valid(pop_valid),
		.pop_sel_qu(pop_sel_ivc),
		.pop_addr_qu(pop_addr_ivc),
		.pop_next_addr_qu(pop_next_addr_ivc),
		.almost_empty_qu(almost_empty_ivc),
		.empty_qu(empty_ivc),
		.full_qu(full_ivc),
		.errors_qu(errors_ivc));
	     
	     c_select_1ofn
	       #(.num_ports(num_vcs),
		 .width(addr_width))
	     push_addr_sel
	       (.select(push_sel_ivc),
		.data_in(push_addr_ivc),
		.data_out(push_addr));
	     
	     assign full = &full_ivc;
	     
	  end
	
	`FB_MGMT_TYPE_DYNAMIC:
	  begin
	     
	     //-----------------------------------------------------------------
	     // tail flit tracking (non-atomic)
	     //-----------------------------------------------------------------
	     
	     if(!atomic_vc_allocation)
	       begin
		  
		  wire [0:buffer_size-1] push_mask;
		  c_decode
		    #(.num_ports(buffer_size))
		  push_mask_dec
		    (.data_in(push_addr),
		     .data_out(push_mask));
		  
		  wire [0:buffer_size-1] tail_s, tail_q;
		  assign tail_s = push_valid ? 
				  (({buffer_size{push_tail}} & push_mask) | 
				   (tail_q & ~push_mask)) :
				  tail_q;
		  c_dff
		    #(.width(buffer_size),
		      .reset_type(reset_type))
		  tailq
		    (.clk(clk),
		     .reset(1'b0),
		     .active(push_active),
		     .d(tail_s),
		     .q(tail_q));
		  
		  genvar ivc;
		  
		  for(ivc = 0; ivc < num_vcs; ivc = ivc + 1)
		    begin:ivcs
		       
		       wire [0:addr_width-1] pop_addr;
		       assign pop_addr
			 = pop_addr_ivc[ivc*addr_width:(ivc+1)*addr_width-1];
		       
		       wire [0:buffer_size-1] pop_mask;
		       c_decode
			 #(.num_ports(buffer_size))
		       pop_mask_dec
			 (.data_in(pop_addr),
			  .data_out(pop_mask));
		       
		       wire 		      pop_tail;
		       c_select_1ofn
			 #(.num_ports(buffer_size),
			   .width(1))
		       pop_tail_sel
			 (.select(pop_mask),
			  .data_in(tail_q),
			  .data_out(pop_tail));
		       
		       assign pop_tail_ivc[ivc] = pop_tail;
		       
		    end
		  
	       end
	     
	     
	     //-----------------------------------------------------------------
	     // buffer control
	     //-----------------------------------------------------------------
	     
	     c_damq_ctrl
	       #(.num_queues(num_vcs),
		 .num_slots(buffer_size),
		 .enable_bypass(enable_bypass),
		 .fast_pop_next_addr(fast_peek),
		 .reset_type(reset_type))
	     damqc
	       (.clk(clk),
		.reset(reset),
		.push_active(push_active),
		.push_valid(push_valid),
		.push_sel_qu(push_sel_ivc),
		.push_addr(push_addr),
		.pop_active(pop_active),
		.pop_valid(pop_valid),
		.pop_sel_qu(pop_sel_ivc),
		.pop_addr_qu(pop_addr_ivc),
		.pop_next_addr_qu(pop_next_addr_ivc),
		.almost_empty_qu(almost_empty_ivc),
		.empty_qu(empty_ivc),
		.full(full),
		.errors_qu(errors_ivc));
	     
	  end
	
      endcase
      
   endgenerate
   
   
   //---------------------------------------------------------------------------
   // storage
   //---------------------------------------------------------------------------
   
   wire [0:addr_width-1] 		      pop_addr;
   c_select_1ofn
     #(.num_ports(num_vcs),
       .width(addr_width))
   pop_addr_sel
     (.select(pop_sel_ivc),
      .data_in(pop_addr_ivc),
      .data_out(pop_addr));
   
   wire 				      write_active;
   assign write_active = push_active;
   
   wire [0:addr_width-1] 		      write_addr;
   assign write_addr = push_addr;
   
   wire [0:flit_data_width-1] 		      write_data;
   assign write_data = push_data;
   
   wire [0:flit_data_width-1] 		      read_data;
   
   wire 				      write_enable;
   wire [0:addr_width-1] 		      read_addr;
   
   generate
      
      if(explicit_pipeline_register)
	begin
	   
	   wire empty;
	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(1))
	   empty_sel
	     (.select(pop_sel_ivc),
	      .data_in(empty_ivc),
	      .data_out(empty));
	   
	   if(gate_buffer_write)
	     assign write_enable = push_valid & ~(pop_valid & empty);
	   else
	     assign write_enable = push_valid;
	   
	   assign read_addr = pop_addr;
	   
	   wire [0:flit_data_width-1] pop_data_s, pop_data_q;
	   assign pop_data_s
	     = pop_valid ? (empty ? write_data : read_data) : pop_data_q;
	   c_dff
	     #(.width(flit_data_width),
	       .reset_type(reset_type))
	   pop_dataq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(pop_active),
	      .d(pop_data_s),
	      .q(pop_data_q));
	   
	   assign pop_data = pop_data_q;
	   
	end
      else
	begin
	   
	   assign write_enable = push_valid;
	   
	   wire [0:addr_width-1] read_addr_s, read_addr_q;
	   assign read_addr_s = pop_valid ? pop_addr : read_addr_q;
	   c_dff
	     #(.width(addr_width),
	       .reset_type(reset_type))
	   read_addrq
	     (.clk(clk),
	      .reset(1'b0),
	      .active(pop_active),
	      .d(read_addr_s),
	      .q(read_addr_q));
	   
	   assign read_addr = read_addr_q;
	   
	   assign pop_data = read_data;
	   
	end
      
      if(atomic_vc_allocation)
	begin
	   
	   c_regfile
	     #(.depth(buffer_size),
	       .width(flit_data_width),
	       .regfile_type(regfile_type))
	   bf
	     (.clk(clk),
	      .write_active(write_active),
	      .write_enable(write_enable),
	      .write_address(write_addr),
	      .write_data(write_data),
	      .read_address(read_addr),
	      .read_data(read_data));
	   
	   assign pop_next_header_info = {header_info_width{1'bx}};
	   
	end
      else
	begin
	   
	   wire [0:addr_width-1] pop_next_addr;
	   c_select_1ofn
	     #(.num_ports(num_vcs),
	       .width(addr_width))
	   pop_next_addr_sel
	     (.select(pop_sel_ivc),
	      .data_in(pop_next_addr_ivc),
	      .data_out(pop_next_addr));
	   
	   wire [0:flit_data_width-1] pop_next_data;
	   c_regfile
	     #(.depth(buffer_size),
	       .width(flit_data_width),
	       .num_read_ports(2),
	       .regfile_type(regfile_type))
	   bf
	     (.clk(clk),
	      .write_active(write_active),
	      .write_enable(write_enable),
	      .write_address(write_addr),
	      .write_data(write_data),
	      .read_address({read_addr, pop_next_addr}),
	      .read_data({read_data, pop_next_data}));
	   
	   assign pop_next_header_info = pop_next_data[0:header_info_width-1];
	   
	end
      
   endgenerate
   
endmodule
