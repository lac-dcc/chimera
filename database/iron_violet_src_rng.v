// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Iron Violet LLC
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// Random Number Generator
//============================================================================//

`default_nettype none

module rng (
  input  wire       CLK,
  input  wire       RST_N,
  output reg  [1:0] RAND
);

  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) RAND <= 0;
    else        RAND <= RAND + 1;
  end

endmodule : rng
