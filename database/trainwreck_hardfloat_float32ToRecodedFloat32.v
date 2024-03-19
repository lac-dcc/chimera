
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

module float32ToRecodedFloat32( in, out );

    input  [31:0] in;
    output [32:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        sign;
    wire [7:0]  expIn;
    wire [22:0] fractIn;
    wire        isZeroExpIn, isZeroFractIn, isZeroOrSubnormal;
    wire        isZero, isSubnormal, isNormalOrSpecial;

    wire [31:0] norm_in;
    wire [4:0]  norm_count;
    wire [31:0] norm_out;
    wire [22:0] normalizedFract;
    wire [8:0]  commonExp, expAdjust, adjustedCommonExp;
    wire        isNaN;

    wire [8:0]  expOut;
    wire [22:0] fractOut;
    wire [32:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign sign    = in[31];
    assign expIn   = in[30:23];
    assign fractIn = in[22:0];
    assign isZeroExpIn = ( expIn == 0 );
    assign isZeroFractIn = ( fractIn == 0 );
    assign isZeroOrSubnormal = isZeroExpIn;
    assign isZero      = isZeroOrSubnormal &   isZeroFractIn;
    assign isSubnormal = isZeroOrSubnormal & ~ isZeroFractIn;
    assign isNormalOrSpecial = ~ isZeroExpIn;

    assign norm_in = {fractIn, 9'b0};
    normalize32 normalizeFract( norm_in, norm_count, norm_out );
    assign normalizedFract = norm_out[30:8];
    assign commonExp =
          ( isSubnormal       ? {4'b1111, ~ norm_count} : 0 )
        | ( isNormalOrSpecial ? expIn                   : 0 );
    assign expAdjust = isZero ? 0 : 9'b010000001;
    assign adjustedCommonExp = commonExp + expAdjust + isSubnormal;
    assign isNaN = ( adjustedCommonExp[8:7] == 2'b11 ) & ~ isZeroFractIn;

    assign expOut = adjustedCommonExp | isNaN<<6;
    assign fractOut = isZeroOrSubnormal ? normalizedFract : fractIn;
    assign out = {sign, expOut, fractOut};

endmodule

