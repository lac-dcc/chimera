// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ps / 1 ps


module IOBUF
        (
            inout   wire    IO, 
            input   wire    I,
            output  wire    O,
            input   wire    T
        );

    assign O = T ? 1'bz : I;

endmodule

