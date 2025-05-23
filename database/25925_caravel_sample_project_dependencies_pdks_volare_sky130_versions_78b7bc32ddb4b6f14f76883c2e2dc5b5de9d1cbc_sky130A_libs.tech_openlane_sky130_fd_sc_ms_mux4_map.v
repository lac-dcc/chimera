// This program was cloned from: https://github.com/hl271/caravel_sample_project
// License: Apache License 2.0

module \$_MUX4_ (
    output Y,
    input A,
    input B,
    input C,
    input D,
    input S,
    input T
    );
  sky130_fd_sc_ms__mux4_1 _TECHMAP_MUX4 (
      .X(Y),
      .A0(A),
      .A1(B),
      .A2(C),
      .A3(D),
      .S0(S),
      .S1(T)
  );
endmodule