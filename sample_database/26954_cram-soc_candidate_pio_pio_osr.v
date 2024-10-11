// This program was cloned from: https://github.com/buncram/cram-soc
// License: CERN Open Hardware Licence Version 2 - Weakly Reciprocal

// SPDX-FileCopyrightText: 2022 Lawrie Griffiths
// SPDX-License-Identifier: BSD-2-Clause

// `default_nettype none
module pio_osr (
  input         clk,
  input         penable,
  input         reset,
  input         restart,
  input         stalled,
  input [31:0]  din,
  input [4:0]   shift,
  input         dir,   // 0 - left, 1 - right
  input         set,
  input         do_shift,
  output [31:0] dout,
  output [5:0]  shift_count,
  output [5:0]  shift_count_lookahead
);

  reg [31:0] shift_reg;
  reg [6:0]  count; // 1 extra bit width so we can capture the overflow on count + shift_val in case of 32 + 32

  // A shift value of 0 means shift 32
  wire [6:0] shift_val = shift == 0 ? 32 : shift;
  // Calculate the 64-bit value of the shift register after a shift
  wire [63:0] shift64 = dir ? {shift_reg, 32'b0} >> shift_val : {32'b0, shift_reg} << shift_val;
  // Calculate the right-aligned shifted out value
  wire [31:0] shift_out = dir ? (shift64[31:0] >> (32 - shift_val)) : shift64[63:32];
  // Calculate the new shift register value after a shift
  wire [31:0] new_shift = dir ? shift64[63:32] : shift64[31:0];

  always @(posedge clk) begin
    if (reset || restart) begin
      if (reset) begin
        // shift_reg is *not* affected by restart
        shift_reg <= 0;
      end
      count <= 32;  // Empty (read to trigger auto-pull)
    end else if (penable && !stalled) begin
       if (set) begin
         shift_reg <= din;
         // NB: it is the case that on autopull count is set to 0, even if a shift is applied
         count <= 0;
       end else if (do_shift) begin
         shift_reg <= new_shift;
         count <= (count + shift_val) > 7'd32 ? 7'd32 : count + shift_val;
       end
    end
  end

  // The output value is the amount shifted out if do_shift ia active otherwise the current shift register
  assign dout = (do_shift ? shift_out & ~(32'hFFFFFFFF << shift_val) : shift_reg);
  assign shift_count = count;
  // This provides a "lookahead" count value to trigger an autopull if the current out instruction would empty the FIFO
  assign shift_count_lookahead = do_shift ? ((count + shift_val) > 7'd32 ? 7'd32 : count + shift_val) : count;

endmodule
