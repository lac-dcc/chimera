
`timescale 1 ns / 1 ps

module IOBUF(
        input   wire    I,
        input   wire    T,
        output  wire    O,
        inout   wire    IO
    );

    assign O  = IO;
    assign IO = T ? 1'bz : I;

endmodule
