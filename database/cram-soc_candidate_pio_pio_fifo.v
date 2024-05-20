// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// SPDX-FileCopyrightText: 2022 Lawrie Griffiths
// SPDX-License-Identifier: BSD-2-Clause

// `default_nettype none
module pio_fifo (
  input             clk,
  input             reset,
  input             push,
  input             pull,
  input [31:0]      din,
  input [1:0]       margin,
  output [31:0]     dout,
  output            empty,
  output            full,
  output            margin_empty,
  output            margin_full,
  output [2:0]      level
);

  reg [31:0] arr [0:3];
  reg [1:0]  first;
  reg [1:0]  next;
  reg [2:0]  count;

  wire do_pull = pull && !empty;
  wire do_push = push && !full;

  always @(posedge clk) begin
    if (reset) begin
      first <= 0;
      next <= 0;
      count <= 0;
    end else begin
      if (do_push) begin
        next <= next + 1;
        arr[next] <= din;
        if (!do_pull) count <= count + 1;
      end
      if (do_pull) begin
        first <= first + 1;
        if (!do_push) count <= count - 1;
      end
    end
  end

  assign empty = count == 0;
  assign margin_empty = (count <= {1'd0, margin});
  assign full = count == 4;
  assign margin_full = (count >= (3'd4 - {1'd0, margin}));
  assign dout = arr[first];
  assign level = count;

endmodule
