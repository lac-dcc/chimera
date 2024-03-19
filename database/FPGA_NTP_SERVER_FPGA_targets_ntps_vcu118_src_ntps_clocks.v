//======================================================================
//
// ntps_clocks
// -----------
// Submodule for all clocks used to drive the design (i.e. not
// NTP clocks used for time stamping.) This includes clock generators,
// clock control and clock tree allocations.
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

module ntps_clocks(
                   input wire  reset,

                   input wire  sys_clk,
                   output wire clk50,

                   inout wire  i2c_clk,
                   inout wire  i2c_data,
                   output wire i2c_mux_rst_n,
                   output wire si5324_rst_n,

                   output wire PPS_OUT,
                   output wire TEN_MHZ_OUT
                  );


  //----------------------------------------------------------------
  // Instantiations.
  //----------------------------------------------------------------
  // 50 MHz clock generator sys_clk / 4.
  // Instantiates a BUFG.
  clk50_gen clk50_gen_0 (
     .clk200     (sys_clk),
     .clk50      (clk50)
  );


  // Control of the external 10Gb ethernet clock generator
/*  clock_control clock_control_0 (
     .clk50         (clk50),
     .rst           (reset),
     .i2c_clk       (i2c_clk),
     .i2c_data      (i2c_data),
     .i2c_mux_rst_n (i2c_mux_rst_n),
     .si5324_rst_n  (si5324_rst_n)
  );
*/

  //----------------------------------------------------------------
  // pps_test
  // Test pulse and 10 MHz generator.
  //----------------------------------------------------------------
  pps_test pps_test_0 (
    .areset       (reset),
    .clk_in       (sys_clk),
    .PPS_OUT      (PPS_OUT),
    .TEN_MHZ_OUT  (TEN_MHZ_OUT)
  );

endmodule // ntps_clocks

`default_nettype wire

//======================================================================
// EOF ntps_clocks
//======================================================================
