
/*----------------------------------------------------------------------------
| If `in' is zero, returns `distance' = 31 and `out' = 0.  Otherwise, returns
| normalized `in' in `out' such that `out[31]' is 1.
*----------------------------------------------------------------------------*/

`include "fpu_common.v"

module normalizeN( in, distance, out );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam size = expSize+sigSize;
    localparam logNormSize = `ceilLog2( sigSize );
    localparam normSize = 1 << logNormSize;

    input  [normSize-1:0] in;
    output [logNormSize-1:0]  distance;
    output [normSize-1:0] out;

    generate
        if (expSize == 8 && sigSize == 24) begin : single_precision
            normalize32 n ( .in(in), .distance(distance), .out(out));
        end else if(expSize == 11 && sigSize == 53) begin : double_precision
            normalize64 n ( .in(in), .distance(distance), .out(out));
        end else begin : unknown_precision
        end
    endgenerate

endmodule

