// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// SPDX-FileCopyrightText: 2022 Lawrie Griffiths
// SPDX-License-Identifier: BSD-2-Clause

// `default_nettype none
module pio_isr (
  input         clk,
  input         penable,
  input         reset,
  input         stalled,
  input [31:0]  din,
  input [4:0]   shift,
  input         dir,
  input         set,
  input         do_shift,
  input [5:0]   bit_count,
  output [31:0] dout,
  output [31:0] push_dout,
  output [5:0]  shift_count_autopush,
  output [5:0]  shift_count
);

  reg [31:0] shift_reg;
  reg [6:0]  count;

  // A shift value of 0 means shift 32
  wire [6:0] shift_val = shift == 0 ? 32 : shift;

  wire [31:0] masked_din = din & ~(32'hFFFFFFFF << shift_val);
  wire [31:0] immediate_shift = dir ?
      /* right */ ((shift_reg >> shift_val) & (32'hFFFFFFFF >> shift_val)) | (masked_din << (32 - shift_val))
      : /* left */ ((shift_reg << shift_val) & (32'hFFFFFFFF << shift_val)) | masked_din;
  always @(posedge clk) begin
    if (reset) begin
      shift_reg <= 0;
      count <= 0; // Empty
    end else if (penable && !stalled) begin
      if (set) begin
        shift_reg <= din;
        count <= bit_count;
      end else if (do_shift) begin
        shift_reg <= immediate_shift;
        count <= (count + shift_val) > 7'd32 ? 7'd32 : count + shift_val;
      end
    end
  end

  assign dout = shift_reg;
  assign push_dout = do_shift ? immediate_shift : shift_reg;
  // count must be made available "early" to comply with timing
  assign shift_count_autopush = ((count + shift_val) > 7'd32) ? 7'd32 : count + shift_val;
  assign shift_count = count;
endmodule

