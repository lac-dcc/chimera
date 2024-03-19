//======================================================================
//
// ntp_clock_select.v
// ------------------
// NTP clock selector. This basically wraps the NTP clock selection
// functionality that existed in the old network_paths.
//
//
// Author: Joachim Strömbergson
//
// Copyright 2020-2021 Netnod Internet Exchange i Sverige AB
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// 3. Neither the name of the copyright holder nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
// LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
// ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

`default_nettype none

module ntp_clock_select (
  input wire            select,

  input wire [63:0]     ntp_time_a,
  input wire 	        ntp_time_upd_a,
  input wire [63:0]     ntp_time_b,
  input wire 	        ntp_time_upd_b,
  input wire 	        ntp_sync_ok_a,
  input wire 	        ntp_sync_ok_b,

  output wire [63:0]    ntp_time,
  output wire 	        ntp_sync_ok,

  input wire 	        clk156,
  input wire 	        reset
);


  //----------------------------------------------------------------
  // Assignments.
  //----------------------------------------------------------------
  assign ntp_sync_ok = (ntp_sync_ok_a & ~select ) |
                       (ntp_sync_ok_b & select);


  //----------------------------------------------------------------
  // tss
  // Time select and clock domain crossing. This should have been
  // a common function for all netwpork paths.
  //----------------------------------------------------------------
  // Time select and clock domain crossing
  time_sel_sync tss(
    .areset         (reset),
    .clk            (clk156),
    .sel            (select),
    .ntp_time_a     (ntp_time_a),
    .ntp_time_upd_a (ntp_time_upd_a),
    .ntp_time_b     (ntp_time_b),
    .ntp_time_upd_b (ntp_time_upd_b),
    .ntp_time       (ntp_time)
  );

endmodule // ntp_clock_select

`default_nettype wire

//======================================================================
// EOF ntp_clock_select.v
//======================================================================
