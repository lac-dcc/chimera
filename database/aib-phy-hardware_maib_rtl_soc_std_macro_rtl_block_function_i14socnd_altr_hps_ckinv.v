// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
//-----------------------------------------------------------------------------
//  Clock inverter macro
//-----------------------------------------------------------------------------

module altr_hps_ckinv (
  clk,
  clk_inv
);

// -------------------
// Port declarations
// -------------------

input clk;
output clk_inv;

// -----
// RTL
// -----

`ifdef ALTR_HPS_INTEL_MACROS_OFF
assign clk_inv = !clk;

`else



`endif

endmodule
