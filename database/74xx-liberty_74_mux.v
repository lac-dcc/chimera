(* techmap_celltype = "$_MUX4_" *)
module _80_74AC153_mux4 (A, B, C, D, S, T, Y);

input A, B, C, D, S, T;
output Y;

\74AC153_2x1MUX4 _TECHMAP_REPLACE_ (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .S(S),
    .T(T),
    .Y(Y)
);

endmodule

(* techmap_celltype = "$_MUX8_" *)
module _80_74AC151_mux8 (A, B, C, D, E, F, G, H, S, T, U, Y);

input A, B, C, D, E, F, G, H, S, T, U;
output Y;

\74AC151_1x1MUX8 _TECHMAP_REPLACE_ (
    .A(A),
    .B(B),
    .C(C),
    .D(D),
    .E(E),
    .F(F),
    .G(G),
    .H(H),
    .S(S),
    .T(T),
    .U(U),
    .Y(Y)
);

endmodule
