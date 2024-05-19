// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module IOBUF
        (
            input   wire    I,
            output  wire    O,
            input   wire    T,
            inout   wire    IO
        );

    assign IO = T ? 1'bz : I;
    assign O  = IO;

endmodule

