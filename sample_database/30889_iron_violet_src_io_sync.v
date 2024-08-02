// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Iron Violet LLC
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// IO Synchronizer
//============================================================================//

`default_nettype none

module io_sync (
  input  wire       CLK,
  input  wire       RST_N,
  input  wire [3:0] SYNC_IN,
  output reg  [1:0] SYNC_OUT,
  output reg        VALID
);

  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
      SYNC_OUT    <= 0;
      VALID       <= 0;
    end else begin
      SYNC_OUT    <= {(SYNC_IN[3] | SYNC_IN[2]), (SYNC_IN[3] | SYNC_IN[1])};
      VALID       <=   SYNC_IN[3] | SYNC_IN[2] |  SYNC_IN[1] | SYNC_IN[0];
    end
  end

endmodule : io_sync
