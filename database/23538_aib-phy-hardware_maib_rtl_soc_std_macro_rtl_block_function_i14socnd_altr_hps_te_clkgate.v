// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
//****************************************************************************************
// (C) 2011 Altera Corporation. All rights reserved.
//
//****************************************************************************************
//-----------------------------------------------------------------------------
//  Gated-clock cell model
//-----------------------------------------------------------------------------


module altr_hps_te_clkgate (
  clk,
  clk_enable_i,
  test_enable_i,
  clk_o
  );

input clk;
input clk_enable_i;
input test_enable_i;

output clk_o;

reg clk_enable_lat;

`ifdef ALTR_HPS_INTEL_MACROS_OFF
always @ (clk or clk_enable_i)
  begin
    if (~clk)
      clk_enable_lat <= clk_enable_i;
  end

assign clk_o = clk & clk_enable_lat;

`else

`endif
endmodule
