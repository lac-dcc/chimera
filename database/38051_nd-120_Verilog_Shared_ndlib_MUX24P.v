// This program was cloned from: https://github.com/RonnyA/nd-120
// License: MIT License

module MUX24P(
    input A,
    input D00, D01, D02, D03,
    input D10, D11, D12, D13,
    output Z0, Z1, Z2, Z3
);

    // Instantiating four 2-to-1 multiplexers
    Multiplexer_2 PLEXER_1 (
        .muxIn_0(D00),
        .muxIn_1(D10),
        .muxOut(Z0),
        .sel(A)
    );

    Multiplexer_2 PLEXER_2 (
        .muxIn_0(D01),
        .muxIn_1(D11),
        .muxOut(Z1),
        .sel(A)
    );

    Multiplexer_2 PLEXER_3 (
        .muxIn_0(D02),
        .muxIn_1(D12),
        .muxOut(Z2),
        .sel(A)
    );

    Multiplexer_2 PLEXER_4 (
        .muxIn_0(D03),
        .muxIn_1(D13),
        .muxOut(Z3),
        .sel(A)
    );

endmodule
