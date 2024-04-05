
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/


//*** THIS MODULE IS NOT FULLY OPTIMIZED.

`include "fpu_common.v"

module compareRecodedFloatN( a, b, less, equal, unordered, exceptionFlags );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam size = expSize+sigSize;

    input  [size:0] a, b;
    output less;
    output equal;
    output unordered;
    output [4:0] exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire magsLess, magsEqual;
    wire sigsLess, sigsEqual;
    wire expsLess, expsEqual;
    wire zeroA;
    wire isNaNA, isNaNB;
    wire isSigNaNA, isSigNaNB;
    wire unord;
    wire invalid;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/

    assign zeroA = a[size-1:0] == 0;
    assign sigsLess = a[sigSize-2:0] < b[sigSize-2:0];
    assign sigsEqual = a[sigSize-2:0] == b[sigSize-2:0];
    assign expsLess = a[size-1:sigSize-1] < b[size-1:sigSize-1];
    assign expsEqual = a[size-1:sigSize-1] == b[size-1:sigSize-1];

    assign magsLess = expsLess | (expsEqual & sigsLess);
    assign magsEqual = expsEqual & sigsEqual;

    assign isNaNA = a[size-1:size-3] == 3'b111;
    assign isNaNB = b[size-1:size-3] == 3'b111;
    assign isSigNaNA = isNaNA & ~a[sigSize-2];
    assign isSigNaNB = isNaNA & ~a[sigSize-2];
    assign unord = isNaNA | isNaNB;
    assign invalid = isSigNaNA | isSigNaNB;

    assign equal = ~unord & magsEqual & (zeroA | (a[size] == b[size]));
    assign less = ~unord & ((b[size] < a[size]) | ((a[size] == b[size]) & ~magsEqual & (a[size] ^ magsLess)));
    assign unordered = unord;

    assign exceptionFlags = {invalid, 1'b0, 1'b0, 1'b0, 1'b0};

endmodule

