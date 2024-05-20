// This program was cloned from: https://github.com/cascade-artifacts-designs/cascade-chipyard
// License: BSD 3-Clause "New" or "Revised" License

/* verilator lint_off UNOPTFLAT */

module EICG_wrapper(
  output out,
  input en,
  input test_en,
  input in
);

  reg en_latched /*verilator clock_enable*/;

  always @(*) begin
     if (!in) begin
        en_latched = en || test_en;
     end
  end

  assign out = en_latched && in;

endmodule
