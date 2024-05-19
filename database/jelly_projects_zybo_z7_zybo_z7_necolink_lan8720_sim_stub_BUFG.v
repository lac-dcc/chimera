// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

`timescale 1 ns / 1 ps

module BUFG(
        input   wire    I,
        output  wire    O
    );

    assign O  = I;

endmodule
