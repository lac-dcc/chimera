// This program was cloned from: https://github.com/MdOmarFaruque/memristor_with_LA
// License: Apache License 2.0

module \$_MUX_ (
    output Y,
    input A,
    input B,
    input S
    );
  sky130_fd_sc_ls__mux2_1 _TECHMAP_MUX (
      .X(Y),
      .A0(A),
      .A1(B),
      .S(S)
  );
endmodule