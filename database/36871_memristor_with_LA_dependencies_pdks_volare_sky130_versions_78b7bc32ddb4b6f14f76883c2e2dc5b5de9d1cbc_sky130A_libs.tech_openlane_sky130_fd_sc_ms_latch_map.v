// This program was cloned from: https://github.com/MdOmarFaruque/memristor_with_LA
// License: Apache License 2.0

module \$_DLATCH_P_ (input E, input D, output Q);
  sky130_fd_sc_ms__dlxtp_1 _TECHMAP_DLATCH_P (
    //# {{data|Data Signals}}
    .D(D),
    .Q(Q),

    //# {{clocks|Clocking}}
    .GATE(E)
  );
endmodule

module \$_DLATCH_N_ (input E, input D, output Q);
  sky130_fd_sc_ms__dlxtn_1 _TECHMAP_DLATCH_N (
    //# {{data|Data Signals}}
    .D(D),
    .Q(Q),

    //# {{clocks|Clocking}}
    .GATE_N(E)
  );
endmodule
