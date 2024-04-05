
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/

`include "fpu_common.v"
//*** THIS MODULE IS NOT FULLY OPTIMIZED.

module recodedFloatNToFloatN( in, out );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam size = expSize + sigSize;
    localparam logDenormSize = `ceilLog2( sigSize );

    input  [size:0]   in;
    output [size-1:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire                     sign;
    wire [expSize:0]         expIn;
    wire [sigSize-2:0]       fractIn;
    wire                     exp01_isHighSubnormalIn;
    wire                     isSubnormal, isNormal, isSpecial, isNaN;

    wire [logDenormSize-1:0] denormShiftCount;
    wire [sigSize-2:0]       subnormal_fractOut;
    wire [expSize-1:0]       normal_expOut;

    wire [expSize-1:0]       expOut;
    wire [sigSize-2:0]       fractOut;
    wire [size-1:0]          out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign sign    = in[size];
    assign expIn   = in[size-1:sigSize-1];
    assign fractIn = in[sigSize-2:0];
    assign exp01_isHighSubnormalIn = ( expIn[expSize-2:0] < 2 );
    assign isSubnormal =
        ( expIn[expSize:expSize-2] == 3'b001 )
            | ( ( expIn[expSize:expSize-1] == 2'b01 )
                      & exp01_isHighSubnormalIn );
    assign isNormal =
        ( ( expIn[expSize:expSize-1] == 2'b01 ) & ~ exp01_isHighSubnormalIn )
            | ( expIn[expSize:expSize-1] == 2'b10 );
    assign isSpecial = ( expIn[expSize:expSize-1] == 2'b11 );
    assign isNaN = isSpecial & expIn[expSize-2];

    assign denormShiftCount = 2'd2 - expIn[logDenormSize-1:0];

    wire null0;
    assign {null0,subnormal_fractOut} = {1'b1, fractIn}>>denormShiftCount;

    wire null1;
    assign {null1,normal_expOut} = expIn - ( ( 1'b1<<( expSize - 1 ) ) + 1'b1 );

    assign expOut =
        ( isNormal ? normal_expOut : 1'b0 ) | ( isSpecial ? {expSize{1'b1}} : 1'b0 );
    assign fractOut =
          ( isSubnormal      ? subnormal_fractOut : 1'b0 )
        | ( isNormal | isNaN ? fractIn            : 1'b0 );
    assign out = {sign, expOut, fractOut};

endmodule

