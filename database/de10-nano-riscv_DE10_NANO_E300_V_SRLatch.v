// This program was cloned from: https://github.com/thinkoco/de10-nano-riscv
// License: Apache License 2.0

// See LICENSE for license details.
module SRLatch (
  input set,
  input reset,
  output q
);

  reg latch;

  // synopsys async_set_reset "set"
  // synopsys one_hot "set, reset"
  always @(set or reset)
  begin
    if (set)
      latch <= 1'b1;
    else if (reset)
      latch <= 1'b0;
  end

  assign q = latch;

endmodule
