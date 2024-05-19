// This program was cloned from: https://github.com/lnis-uofu/LSOracle
// License: MIT License

module $_DLATCH_P_(input E, input D, output Q);
    DFFQ1_HPNW4 _TECHMAP_REPLACE_ (
        .D(D),
        .CK(E),
        .Q(Q)
        );
endmodule

module $_DLATCH_N_(input E, input D, output Q);
    DFFQ1_HPNW4 _TECHMAP_REPLACE_ (
        .D(D),
        .CK(E),
        .Q(Q)
        );
endmodule
