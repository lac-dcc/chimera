// $Id: rtr_next_hop_addr.v 5188 2012-08-30 00:31:31Z dub $

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
// module to determine the address of the next hop router
//==============================================================================

module rtr_next_hop_addr
  (router_address, dest_info, lar_info, next_router_address);
   
`include "c_functions.v"
`include "c_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // number of routers in each dimension
   parameter num_routers_per_dim = 4;
   
   // number of dimensions in network
   parameter num_dimensions = 2;
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router = 1;
   
   // connectivity within each dimension
   parameter connectivity = `CONNECTIVITY_LINE;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // width required to select individual resource class
   localparam resource_class_idx_width = clogb(num_resource_classes);
   
   // width required to select individual router in a dimension
   localparam dim_addr_width = clogb(num_routers_per_dim);
   
   // width required to select individual router in network
   localparam router_addr_width = num_dimensions * dim_addr_width;
   
   // width required to select individual node at current router
   localparam node_addr_width = clogb(num_nodes_per_router);
   
   // total number of bits required for storing routing information
   localparam dest_info_width
     = (routing_type == `ROUTING_TYPE_PHASED_DOR) ? 
       (num_resource_classes * router_addr_width + node_addr_width) : 
       -1;
   
   // number of adjacent routers in each dimension
   localparam num_neighbors_per_dim
     = ((connectivity == `CONNECTIVITY_LINE) ||
	(connectivity == `CONNECTIVITY_RING)) ?
       2 :
       (connectivity == `CONNECTIVITY_FULL) ?
       (num_routers_per_dim - 1) :
       -1;
   
   // number of input and output ports on router
   localparam num_ports
     = num_dimensions * num_neighbors_per_dim + num_nodes_per_router;
   
   // width required to select an individual port
   localparam port_idx_width = clogb(num_ports);
   
   // width required for lookahead routing information
   localparam lar_info_width = port_idx_width + resource_class_idx_width;
   
   
   //---------------------------------------------------------------------------
   // interface
   //---------------------------------------------------------------------------
   
   // current router's address
   input [0:router_addr_width-1] router_address;
   
   // routing information
   input [0:dest_info_width-1]  dest_info;
   
   // lookahead routing information
   input [0:lar_info_width-1] lar_info;
   
   // lookahead routing information for next router
   output [0:router_addr_width-1]  next_router_address;
   wire [0:router_addr_width-1]    next_router_address;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire [0:port_idx_width-1] 	   route_port;
   assign route_port = lar_info[0:port_idx_width-1];
   
   generate
      
      case(routing_type)
	
	`ROUTING_TYPE_PHASED_DOR:
	  begin
	     
	     wire [0:num_resource_classes*router_addr_width-1] dest_addr_orc;
	     assign dest_addr_orc
	       = dest_info[0:num_resource_classes*router_addr_width-1];
	     
	     wire [0:router_addr_width-1] 		       dest_addr;
 	     
	     if(num_resource_classes == 1)
	       assign dest_addr = dest_addr_orc;
	     else
	       begin
		  wire [0:resource_class_idx_width-1] route_rcsel;
		  assign route_rcsel
		    = lar_info[port_idx_width:
				    port_idx_width+resource_class_idx_width-1];
		  
		  assign dest_addr
		    = dest_addr_orc[route_rcsel*router_addr_width +: 
				    router_addr_width];
	       end
	     
	     genvar 				      dim;
	     
	     for(dim = 0; dim < num_dimensions; dim = dim + 1)
	       begin:dims
		  
		  wire [0:dim_addr_width-1] curr_dim_addr;
		  assign curr_dim_addr
		    = router_address[dim*dim_addr_width:
				     (dim+1)*dim_addr_width-1];
		  
		  wire [0:dim_addr_width-1] next_dim_addr;
		  
		  case(connectivity)
		    
		    `CONNECTIVITY_LINE, `CONNECTIVITY_RING:
		      begin
			 
			 // The first port in each dimension connects to 
			 // neighbors with smaller addresses, while the second 
			 // one connects to those with larger ones.
			 
			 wire route_down;
			 assign route_down = (route_port == dim*2);
			 
			 wire route_up;
			 assign route_up = (route_port == dim*2+1);
			 
			 case(connectivity)
			   
			   `CONNECTIVITY_LINE:
			     begin
				
				// NOTE: In two's complement, +1 is represented 
				// by a one in the LSB and zeros in all other 
				// bits, while -1 is represented by ones in all 
				// bits (incl. the LSB).
				
				wire [0:dim_addr_width-1] dim_addr_delta;
				assign dim_addr_delta[dim_addr_width-1]
				  = route_down | route_up;
				
				if(dim_addr_width > 1)
				  assign dim_addr_delta[0:dim_addr_width-2]
				    = {(dim_addr_width-1){route_down}};
				
				// Because there are no wraparound links in 
				// line-based topologies, we don't have to 
				// worry about the cases where an underflow or 
				// overflow occurs.
				
				assign next_dim_addr
				  = curr_dim_addr + dim_addr_delta;
				
			     end
			   
			   `CONNECTIVITY_RING:
			     begin
				
				wire [0:dim_addr_width-1] dim_addr_plus1;
				c_incr
				  #(.width(dim_addr_width),
				    .min_value(0),
				    .max_value(num_routers_per_dim-1))
				dim_addr_plus1_incr
				  (.data_in(curr_dim_addr),
				   .data_out(dim_addr_plus1));
				
				wire [0:dim_addr_width-1] dim_addr_minus1;
				c_decr
				  #(.width(dim_addr_width),
				    .min_value(0),
				    .max_value(num_routers_per_dim-1))
				dim_addr_minus1_decr
				  (.data_in(curr_dim_addr),
				   .data_out(dim_addr_minus1));
				
				assign next_dim_addr
				  = route_down ? dim_addr_minus1 :
				    route_up ? dim_addr_plus1 : 
				    curr_dim_addr;
				
			     end
			   
			 endcase
			 
		      end
		    
		    `CONNECTIVITY_FULL:
		      begin
			 
			 wire route_dim;
			 assign route_dim
			   = (route_port >= dim*num_neighbors_per_dim) &&
			     (route_port < (dim+1)*num_neighbors_per_dim);
			 
			 // In a topology with fully connected dimensions,
			 // every hop sets the corresponding part of the 
			 // address to the respective part in of the 
			 // destination address.
			 
			 wire [0:dim_addr_width-1] dest_dim_addr;
			 assign dest_dim_addr
			   = dest_addr[dim*dim_addr_width:
				       (dim+1)*dim_addr_width-1];
			 
			 assign next_dim_addr
			   = route_dim ? dest_dim_addr : curr_dim_addr;

			 // Alternatively, the destination address can be
			 // computed as follows:
			 /*
			 wire [0:port_idx_width-1] port_offset;
			 assign port_offset
			   = route_port - dim*num_neighbors_per_dim;
			 
			 wire [0:dim_addr_width-1] dim_addr_offset;
			 assign dim_addr_offset
			   = port_offset[port_idx_width-dim_addr_width:
					 port_idx_width-1];
			 
			 wire [0:dim_addr_width-1] dim_addr_thresh;
			 assign dim_addr_thresh
			   = num_routers_per_dim - curr_dim_addr;
			 
			 wire 			   wrap;
			 assign wrap = (dim_addr_offset >= dim_addr_thresh);
			 
			 wire [0:dim_addr_width-1] next_dim_addr_nowrap;
			 assign next_dim_addr_nowrap
			   = curr_dim_addr + dim_addr_offset;
			 
			 wire [0:dim_addr_width-1] next_dim_addr_wrap;
			 assign next_dim_addr_wrap
			   = dim_addr_offset - dim_addr_thresh;
			 
			 assign next_dim_addr
			   = wrap ? next_dim_addr_wrap : next_dim_addr_nowrap;
			 */
			 
		      end
		    
		  endcase
		  
		  assign next_router_address[dim*dim_addr_width:
					     (dim+1)*dim_addr_width-1]
		    = next_dim_addr;
		  
	       end
	     
	  end
	
      endcase
      
   endgenerate
   
endmodule
