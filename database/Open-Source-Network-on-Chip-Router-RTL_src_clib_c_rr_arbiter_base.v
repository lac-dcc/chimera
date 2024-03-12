// $Id: c_rr_arbiter_base.v 5188 2012-08-30 00:31:31Z dub $

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
// round-robin arbiter basic block
//==============================================================================

module c_rr_arbiter_base
  (mask, req, gnt);
   
   // number of input ports
   parameter num_ports = 32;
   
   // priority mask
   input [0:num_ports-1] mask;
   
   // vector of requests
   input [0:num_ports-1] req;
   
   // vector of grants
   output [0:num_ports-1] gnt;
   wire [0:num_ports-1]   gnt;
   
   wire [0:num_ports-1]   req_qual;
   assign req_qual = req & mask;
   
   wire [0:num_ports-1]   gnt_qual;
   c_lod
     #(.width(num_ports))
   gnt_qual_lod
     (.data_in(req_qual),
      .data_out(gnt_qual));
   
   wire [0:num_ports-1]   req_unqual;
   assign req_unqual = req;
   
   wire [0:num_ports-1]   gnt_unqual;
   c_lod
     #(.width(num_ports))
   gnt_unqual_lod
     (.data_in(req_unqual),
      .data_out(gnt_unqual));
   
   assign gnt = (|req_qual) ? gnt_qual : gnt_unqual;
   
endmodule
