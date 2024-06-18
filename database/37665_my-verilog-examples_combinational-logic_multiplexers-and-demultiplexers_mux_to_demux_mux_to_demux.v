// This program was cloned from: https://github.com/JeffDeCola/my-verilog-examples
// License: MIT License

// Combining the mux-4x1 to the demux-1x4 to prove the input will equal
// the output (for the selected output).

module mux_to_demux_structural(
    input           a1, b1, c1, d1,      // 4 Inputs
    input           [1:0] sel1,          // Select
    input           [1:0] sel2,          // Select
    output          a2, b2, c2, d2);     // 4 Outputs

    wire  y;

    // 4x1 MULTIPLEXER
    mux_4x1_behavioral MUX_4X1 (
        .a(a1), .b(b1), .c(c1), .d(d1),
        .sel(sel1),
        .y(y)
    );

    // 1x4 DEMULTIPLEXER
    demux_1x4_behavioral DEMUX_1X4 (
        .y(y),
        .sel(sel2),
        .a(a2), .b(b2), .c(c2), .d(d2)
    );

endmodule
