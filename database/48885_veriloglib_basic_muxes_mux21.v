// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module mux21
(
    input a,
    input b,
    input sel,
    output c
);

    assign c = sel ? a : b;

endmodule