// This program was cloned from: https://github.com/intel/aib-phy-hardware
// License: Apache License 2.0

// SPDX-License-Identifier: Apache-2.0
// Copyright (C) 2019 Intel Corporation. All rights reserved
module cfg_cmn_latch (
  input      din,
  input      clk,
  output reg dout
);

  always @(*)
    if (clk)
      dout <= din;

endmodule
