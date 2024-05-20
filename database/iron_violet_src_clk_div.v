// This program was cloned from: https://github.com/johnbentcope/iron_violet
// License: Apache License 2.0

/*
 * Copyright (c) 2023 Iron Violet LLC
 * SPDX-License-Identifier: Apache-2.0
 */

//============================================================================//
// Clock Divider
//============================================================================//

`define default_netname none

module clk_div #(
  parameter  FREQ_IN  = 50_000_000,
  parameter  FREQ_OUT = 10_000
)(
  input      CLK,
  input      RST_N,
  output reg CLK_OUT
);
  parameter DIV = FREQ_IN / FREQ_OUT;
  
  reg [$clog2(DIV)-1:0] cntr;

  // clock counter
  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
      cntr <= 0;
    end else if (cntr >= (DIV-1)) begin
      cntr <= 0;
    end else begin
      cntr <= cntr + 1;
    end
  end

  // divided clock
  always @(posedge CLK or negedge RST_N) begin
    if (!RST_N) begin
      CLK_OUT <= 0;
    end else if (cntr < DIV/2) begin
      CLK_OUT <= 1;
    end else begin
      CLK_OUT <= 0;
    end
  end

endmodule : clk_div  
