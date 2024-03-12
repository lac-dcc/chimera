// $Id: rtr_constants.v 5188 2012-08-30 00:31:31Z dub $

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
// router related constant definitions
//==============================================================================


//------------------------------------------------------------------------------
// network topologies
//------------------------------------------------------------------------------

// mesh
`define TOPOLOGY_MESH  0

// torus
`define TOPOLOGY_TORUS 1

// flattened butterfly
`define TOPOLOGY_FBFLY 2

`define TOPOLOGY_LAST  `TOPOLOGY_FBFLY


//------------------------------------------------------------------------------
// what does connectivity look like within a dimension?
//------------------------------------------------------------------------------

// nodes are connected to their neighbors with no wraparound (e.g. mesh)
`define CONNECTIVITY_LINE 0

// nodes are connected to their neighbors with wraparound (e.g. torus)
`define CONNECTIVITY_RING 1

// nodes are fully connected (e.g. flattened butterfly)
`define CONNECTIVITY_FULL 2

`define CONNECTIVITY_LAST `CONNECTIVITY_FULL


//------------------------------------------------------------------------------
// router implementations
//------------------------------------------------------------------------------

// wormhole router
`define ROUTER_TYPE_WORMHOLE 0

// virtual channel router
`define ROUTER_TYPE_VC       1

// router with combined VC and switch allocation
`define ROUTER_TYPE_COMBINED 2

`define ROUTER_TYPE_LAST `ROUTER_TYPE_COMBINED


//------------------------------------------------------------------------------
// routing function types
//------------------------------------------------------------------------------

// dimension-order routing (using multiple phases if num_resource_classes > 1)
`define ROUTING_TYPE_PHASED_DOR 0

`define ROUTING_TYPE_LAST `ROUTING_TYPE_PHASED_DOR


//------------------------------------------------------------------------------
// dimension order
//------------------------------------------------------------------------------

// traverse dimensions in ascending order
`define DIM_ORDER_ASCENDING  0

// traverse dimensions in descending order
`define DIM_ORDER_DESCENDING 1

// order of dimension traversal depends on message class
`define DIM_ORDER_BY_CLASS   2

`define DIM_ORDER_LAST `DIM_ORDER_BY_CLASS


//------------------------------------------------------------------------------
// packet formats
//------------------------------------------------------------------------------

// packets are delimited by head and tail bits
`define PACKET_FORMAT_HEAD_TAIL       0

// the last flit in each packet is marked by having its tail bit set; head bits 
// are inferred by checking if the preceding flit was a tail flit
`define PACKET_FORMAT_TAIL_ONLY       1

// head flits are identified by header bit, and contain encoded packet length
`define PACKET_FORMAT_EXPLICIT_LENGTH 2

`define PACKET_FORMAT_LAST `PACKET_FORMAT_EXPLICIT_LENGTH


//------------------------------------------------------------------------------
// flow control types
//------------------------------------------------------------------------------

// credit-based flow control
`define FLOW_CTRL_TYPE_CREDIT 0

`define FLOW_CTRL_TYPE_LAST `FLOW_CTRL_TYPE_CREDIT


//------------------------------------------------------------------------------
// VC allocation masking
//------------------------------------------------------------------------------

// no masking
`define ELIG_MASK_NONE 0

// mask VCs that have no buffer space available
`define ELIG_MASK_FULL 1

// mask VCs that are not completely empty
`define ELIG_MASK_USED 2

`define ELIG_MASK_LAST `ELIG_MASK_USED


//------------------------------------------------------------------------------
// flit buffer management schemes
//------------------------------------------------------------------------------

// statically partitioned
`define FB_MGMT_TYPE_STATIC  0

// dynamically managed
`define FB_MGMT_TYPE_DYNAMIC 1

`define FB_MGMT_TYPE_LAST    `FB_MGMT_TYPE_DYNAMIC
