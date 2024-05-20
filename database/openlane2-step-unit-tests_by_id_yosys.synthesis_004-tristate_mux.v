// This program was cloned from: https://github.com/efabless/openlane2-step-unit-tests
// License: Apache License 2.0

module mux(
    input A0,
    input A1,
    input S,
    output X0,
    output X1,
    output X2
);
    sky130_fd_sc_hd__ebufn_2 a0 (
        .A(A0),
        .TE_B(~S),
        .Z(X0)
    );
    
    sky130_fd_sc_hd__ebufn_2 a1 (
        .A(A1),
        .TE_B(S),
        .Z(X0)
    );

    (* keep *)
    mux2 mux (
        .A0(A0),
        .A1(A1),
        .S(S),
        .X(X1)
    );
endmodule

module mux2(input A0, A1, S, output X);
    wire k;
    assign k = S ? A0 : 1'bz;
    assign k = ~S ? A1 : 1'bz;
    assign X = k;
endmodule
