// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

// See LICENSE file for license details.
(* keep_hierarchy = "yes" *) module PowerOnResetFPGAOnly(
  input clock,
  (* dont_touch = "true" *) output power_on_reset
);
  reg reset;
  assign power_on_reset = reset;

  initial begin
     reset <= 1'b1;
  end

  always @(posedge clock) begin
     reset <= 1'b0;
  end
endmodule
