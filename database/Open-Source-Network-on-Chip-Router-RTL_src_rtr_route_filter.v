// $Id: rtr_route_filter.v 5188 2012-08-30 00:31:31Z dub $

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
// module to generate a mask of legal output port and resource class requests 
// based on routing restrictions
//==============================================================================

module rtr_route_filter
  (clk, route_valid, route_in_op, route_in_orc, route_out_op, route_out_orc, 
   errors);
   
`include "c_constants.v"
`include "rtr_constants.v"
   
   
   //---------------------------------------------------------------------------
   // parameters
   //---------------------------------------------------------------------------
   
   // number of message classes (e.g. request, reply)
   parameter num_message_classes = 2;
   
   // nuber of resource classes (e.g. minimal, adaptive)
   parameter num_resource_classes = 2;
   
   // number of VCs available for each class
   parameter num_vcs_per_class = 1;
   
   // number of input and output ports on router
   parameter num_ports = 5;
   
   // number of adjacent routers in each dimension
   parameter num_neighbors_per_dim = 2;
   
   // number of nodes per router (a.k.a. consentration factor)
   parameter num_nodes_per_router = 4;
   
   // filter out illegal destination ports
   // (the intent is to allow synthesis to optimize away the logic associated 
   // with such turns)
   parameter restrict_turns = 1;
   
   // connectivity within each dimension
   parameter connectivity = `CONNECTIVITY_LINE;
   
   // select routing function type
   parameter routing_type = `ROUTING_TYPE_PHASED_DOR;
   
   // select order of dimension traversal
   parameter dim_order = `DIM_ORDER_ASCENDING;
   
   // ID of current input port
   parameter port_id = 0;
   
   // ID of current input VC
   parameter vc_id = 0;
   
   
   //---------------------------------------------------------------------------
   // derived parameters
   //---------------------------------------------------------------------------
   
   // current message class
   localparam message_class
     = (vc_id / (num_resource_classes*num_vcs_per_class)) % num_message_classes;
   
   // current resource class
   localparam resource_class
     = (vc_id / num_vcs_per_class) % num_resource_classes;
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   input clk;
   
   // route information is valid
   input route_valid;
   
   // raw output port
   input [0:num_ports-1] route_in_op;
   
   // raw output resource class
   input [0:num_resource_classes-1] route_in_orc;
   
   // filtered output port
   output [0:num_ports-1] 	    route_out_op;
   wire [0:num_ports-1] 	    route_out_op;
   
   // filtered output resource class
   output [0:num_resource_classes-1] route_out_orc;
   wire [0:num_resource_classes-1]   route_out_orc;
   
   // internal error condition detected
   output [0:1] 		     errors;
   wire [0:1] 			     errors;   
   
   
   //---------------------------------------------------------------------------
   // implementation
   //---------------------------------------------------------------------------
   
   wire [0:num_ports-1] 	     error_op;
   
   genvar 			     op;
   
   generate
      
      for(op = 0; op < num_ports; op = op + 1)
	begin:ops
	   
	   case(routing_type)
	     
	     `ROUTING_TYPE_PHASED_DOR:
	       begin
		  
		  // handle network ports
		  if(op < (num_ports - num_nodes_per_router))
		    begin
		       
		       if(
			  
			  // for line and ring connectivity, packets can only
			  // turn back when they reach an intermediate node;
			  // however, when they reach the last intermediate
			  // node, they have reached their destination, and 
			  // thus cannot turn back
			  
			  (((connectivity == `CONNECTIVITY_LINE) || 
			    (connectivity == `CONNECTIVITY_RING)) &&
			   
			   (op == port_id) &&
			   
			   (resource_class == (num_resource_classes - 1))) || 
			  
			  // likewise, for full connectivity, packets only ever
			  // take two successive steps in the same dimension
			  // when an intermediate node is reached; once again,
			  // this cannot happen in the last resource class
			  
			  ((connectivity == `CONNECTIVITY_FULL) &&
			   
			   ((op / num_neighbors_per_dim) == 
			    (port_id / num_neighbors_per_dim)) &&
			   
			   (resource_class == (num_resource_classes - 1))) ||
			  
			  // more generally, once a dimension has been visited,
			  // ports associated with that dimension will not be
			  // requested again until after an intermediate node 
			  // is reached; again, this cannot happen in the last
			  // resource class; also, this only applies for 
			  // network (i.e., not injection/ejection) ports
			  
			  (((((dim_order == `DIM_ORDER_ASCENDING) || 
			      ((dim_order == `DIM_ORDER_BY_CLASS) && 
			       ((message_class % 2) == 0))) && 
			     
			     ((op / num_neighbors_per_dim) < 
			      (port_id / num_neighbors_per_dim))) || 
			    
			    (((dim_order == `DIM_ORDER_DESCENDING) || 
			      (dim_order == `DIM_ORDER_BY_CLASS) && 
			      ((message_class % 2) == 1)) && 
			     
			     ((op / num_neighbors_per_dim) > 
			      (port_id / num_neighbors_per_dim)))) && 
			   
			   (resource_class == (num_resource_classes - 1)) && 
			   
			   (port_id < (num_ports - num_nodes_per_router))))
			 
			 begin
			    assign route_out_op[op] = 1'b0;
			    assign error_op[op] = route_in_op[op];
			 end
		       else
			 begin
			    assign route_out_op[op] = route_in_op[op];
			    assign error_op[op] = 1'b0;
			 end
		       
		    end
		  
		  // handle injection/ejection ports
		  else
		    begin
		       
		       // a packet coming in on an injection/ejection port 
		       // should never exit the router on the same port
		       if(op == port_id)
			 begin
			    assign route_out_op[op] = 1'b0;
			    assign error_op[op] = route_in_op[op];
			 end
		       else
			 begin
			    assign route_out_op[op] = route_in_op[op];
			    assign error_op[op] = 1'b0;
			 end
		    end
		  
	       end
	     
	   endcase
	   
	end
      
   endgenerate
   
   wire [0:num_resource_classes-1] error_orc;
   
   generate
      
      if(num_resource_classes == 1)
	begin
	   assign route_out_orc = 1'b1;
	   assign error_orc = ~route_out_orc;
	end
      else if(num_resource_classes > 1)
	begin
	   
	   genvar orc;
	   
	   for(orc = 0; orc < num_resource_classes; orc = orc + 1)
	     begin:orcs
		
		case(routing_type)
		  
		  `ROUTING_TYPE_PHASED_DOR:
		    begin
		       
		       // at each hop, packets can either stay in the same 
		       // resource class or advance to the next one
		       if((orc == resource_class) || 
			  (orc == (resource_class + 1)))
			 begin
			    assign route_out_orc[orc] = route_in_orc[orc];
			    assign error_orc[orc] = 1'b0;
			 end
		       else
			 begin
			    assign route_out_orc[orc] = 1'b0;
			    assign error_orc[orc] = route_in_orc[orc];
			 end
		       
		    end
		  
		endcase
		
	     end
	   
	end
      
   endgenerate
   
   wire error_invalid_port;
   assign error_invalid_port = route_valid & ((|error_op) | (~|route_in_op));
   
   wire error_invalid_class;
   assign error_invalid_class = route_valid & ((|error_orc) | (~|route_in_orc));
   
   // synopsys translate_off
   always @(posedge clk)
     begin
	
	if(error_invalid_port)
	  $display({"ERROR: Received flit's destination port violates ",
		    "constraints in module %m."});
	
	if(error_invalid_class)
	  $display({"ERROR: Received flit's destination class violates ",
		    "constraints in module %m."});
	
     end
   
   // synopsys translate_on
   
   assign errors[0] = error_invalid_port;
   assign errors[1] = error_invalid_class;
   
endmodule
