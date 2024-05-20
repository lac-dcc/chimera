// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module \$_TBUF_ (input A, input E, output Y);
  sky130_fd_sc_hs__ebufn_2 _TECHMAP_EBUF_N_ (
    .A(A),
    .Z(Y),
    .TE_B(~E));
endmodule