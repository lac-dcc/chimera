`include "marco.h"

module LDEXT(DR,Op,BE,out);

    input  [31:0] DR;
    input         Op;
    input   [3:0] BE;
    output [31:0] out;

    wire [`LOBYTE] BYTE;
    wire [`LOHALF] HALF;

    assign BYTE = DR[`LOBYTE];
    assign HALF = DR[`LOHALF];

    EXT #(8,32) BYTEEXT(
        .Op(Op),
        .in(BYTE)
    );
    EXT #(16,32) HALFEXT(
        .Op(Op),
        .in(HALF)
    );

    wire [1:0] MUXA;
    assign MUXA = (BE == 4'b1111) ? 0 :
                  (BE == 4'b1100) ? 1 :
                  (BE == 4'b1000) ? 2 :
                                    3 ;
    MUX4 LDEXTMUX(
        .in_0(DR),
        .in_1(HALFEXT.out),
        .in_2(BYTEEXT.out),
        .A(MUXA),
        .Q(out)
    );

endmodule
