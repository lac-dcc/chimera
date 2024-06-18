// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module \$_MUX_ (
    output Y,
    input A,
    input B,
    input S
    );
  sky130_fd_sc_hdll__mux2_1 _TECHMAP_MUX (
      .X(Y),
      .A0(A),
      .A1(B),
      .S(S)
  );
endmodule