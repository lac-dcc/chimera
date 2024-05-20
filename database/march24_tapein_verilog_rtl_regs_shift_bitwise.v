// This program was cloned from: https://github.com/cornell-c2s2/march24_tapein
// License: Apache License 2.0


`ifndef REGS_SHIFT_BITWISE
`define REGS_SHIFT_BITWISE
//------------------------------------------------------------------------
// N-bit bitwise shift register
//------------------------------------------------------------------------
/*
This is a shift register storing `nbits` total bits.

One bit of data can be inputted per clock cycle, gated by the `en` input.
The entire register will be shifted to the left by one bit when this happens.

For example, here is a simulation of a 4 bit register:
```
reset held high
  0000
en high, d = 1
  0001
en high, d = 0
  0010
load_en high, load = 1111
  1111
```

The entire register can be overridden by the `load` input when `load_en` is high.
Data cannot be inputted when `load_en` is high.
*/
module regs_shift_Bitwise #(
  parameter int p_nbits = 8,
  parameter bit p_reset_value = 0
) (
  input  logic               clk,      // Clock input
  input  logic               reset,    // Sync reset input
  input  logic               d,        // One bit data input
  input  logic               en,       // Enable input
  input  logic [p_nbits-1:0] load,     // Directly load data input
  input  logic               load_en,  // Enable load
  output logic [p_nbits-1:0] q         // Data output
);

  always_ff @(posedge clk) begin
    if (reset) begin
      q <= {p_nbits{p_reset_value}};
    end else if (load_en) begin
      q <= load;
    end else if ((~load_en) & en) begin
      q <= {q[p_nbits-2:0], d};
    end else begin
      q <= q;
    end
  end
endmodule

`endif
