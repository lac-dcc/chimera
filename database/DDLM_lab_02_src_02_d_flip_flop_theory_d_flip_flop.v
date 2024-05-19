// This program was cloned from: https://github.com/RomeoMe5/DDLM
// License: MIT License


module d_flip_flop
(
    input   clk,
    input   d,
    output  q,
    output  q_n
);
    wire n1;

    d_latch master
    (
        .clk ( ~clk ),
        .d   ( d    ),
        .q   ( n1   )
    );

    d_latch slave
    (
        .clk ( clk ),
        .d   ( n1  ),
        .q   ( q   ),
        .q_n ( q_n )
    );

endmodule
