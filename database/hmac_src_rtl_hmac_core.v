// This program was cloned from: https://github.com/secworks/hmac
// License: BSD 2-Clause "Simplified" License

//======================================================================
//
// hmac_core.v
// -----------
//
//
// Author: Joachim Strombergson
// Copyright (c) 2018, Assured AB
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

module hmac_core(
                 input wire            clk,
                 input wire            reset_n,

                 input wire            init,
                 input wire            next,
                 input wire            finalize,
                 input wire [5 : 0]    final_len,

                 input wire [255 : 0]  key,

                 input wire [511 : 0]  block,

                 output wire           ready,
                 output wire [127 : 0] tag
                );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  localparam MODE_SHA_256   = 1'h1;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg            sha256_init;
  reg            sha256_next;
  reg  [511 : 0] sha256_block;
  wire           sha256_ready;
  wire [255 : 0] sha256_digest;
  wire           sha256_digest_valid;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------


  //----------------------------------------------------------------
  // core instantiation.
  //----------------------------------------------------------------
  sha256_core sha256(
                     .clk(clk),
                     .reset_n(reset_n),

                     .init(sha256_init),
                     .next(sha256_next),
                     .mode(MODE_SHA_256),

                     .block(sha256_block),

                     .ready(sha256_ready),
                     .digest(sha256_digest),
                     .digest_valid(sha256_digest_valid)
                    );


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with asynchronous
  // active low reset. All registers have write enable.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin : reg_update
      integer i;

      if (!reset_n)
        begin

        end
      else
        begin

        end
    end // reg_update

endmodule // hmac_core

//======================================================================
// EOF hmac_core.v
//======================================================================
