// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


module ELVDS_OBUF(
            input   wire    I,
            output  wire    O,
            output  wire    OB
        );

    assign O  = I;
    assign OB = ~I;

endmodule

