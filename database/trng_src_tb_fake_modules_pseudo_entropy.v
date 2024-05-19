// This program was cloned from: https://github.com/secworks/trng
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// pseudo_entropy.v
// ----------------
// Fake pseudo entropy source. This module SHOULD ONLY be used
// during simulation of the Cryptech True Random Number Generator
// (trng). The module DOES NOT provide any real entropy.
//
//
// Author: Joachim Strombergson
// Copyright (c) 2014, Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module pseudo_entropy(
                      input wire           clk,
                      input wire           reset_n,

                      input wire           enable,

                      output wire [31 : 0] raw_entropy,
                      output wire [31 : 0] stats,

                      output wire          enabled,
                      output wire          entropy_syn,
                      output wire [31 : 0] entropy_data,
                      input wire           entropy_ack
                     );


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign enabled      = enable;

  assign raw_entropy  = enable ? 32'h00ff00ff : 32'h00000000;
  assign stats        = enable ? 32'hff00ff00 : 32'h00000000;

  assign entropy_syn  = enable;
  assign entropy_data = enable ? 32'hf1e2d3c4 : 32'h00000000;

endmodule // pseudo_entropy

//======================================================================
// EOF pseudo_entropy.v
//======================================================================
