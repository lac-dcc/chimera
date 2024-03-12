// $Id: c_prefix_arbiter_base.v 5188 2012-08-30 00:31:31Z dub $

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
// prefix tree based round-robin arbiter basic block
//==============================================================================

module c_prefix_arbiter_base
  (prio_port, req, gnt);
   
   // number of input ports
   parameter num_ports = 32;
   
   // port priority pointer
   input [0:num_ports-1] prio_port;
   
   // vector of requests
   input [0:num_ports-1] req;
   
   // vector of grants
   output [0:num_ports-1] gnt;
   wire [0:num_ports-1]   gnt;
   
   wire [0:num_ports-1]   g_in;
   assign g_in = prio_port;
   
   wire [0:num_ports-1]   p_in;
   assign p_in = ~{req[num_ports-1], req[0:num_ports-2]};
   
   wire [0:num_ports-1]   g_out;
   wire [0:num_ports-1]   p_out;
   c_prefix_net
     #(.width(num_ports),
       .enable_wraparound(1))
   g_out_pn
     (.g_in(g_in),
      .p_in(p_in),
      .g_out(g_out),
      .p_out(p_out));
   
   assign gnt = req & g_out;
   
endmodule
