
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

module float64ToRecodedFloat64( in, out );

    input  [63:0] in;
    output [64:0]   out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        sign;
    wire [10:0] expIn;
    wire [51:0] fractIn;
    wire        isZeroExpIn, isZeroFractIn, isZeroOrSubnormal;
    wire        isZero, isSubnormal, isNormalOrSpecial;

    wire [63:0] norm_in;
    wire [5:0]  norm_count;
    wire [63:0] norm_out;
    wire [51:0] normalizedFract;
    wire [11:0] commonExp, expAdjust, adjustedCommonExp;
    wire        isNaN;

    wire [11:0] expOut;
    wire [51:0] fractOut;
    wire [64:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign sign    = in[63];
    assign expIn   = in[62:52];
    assign fractIn = in[51:0];
    assign isZeroExpIn = ( expIn == 0 );
    assign isZeroFractIn = ( fractIn == 0 );
    assign isZeroOrSubnormal = isZeroExpIn;
    assign isZero      = isZeroOrSubnormal &   isZeroFractIn;
    assign isSubnormal = isZeroOrSubnormal & ~ isZeroFractIn;
    assign isNormalOrSpecial = ~ isZeroExpIn;

    assign norm_in = {fractIn, 12'b0};
    normalize64 normalizeFract( norm_in, norm_count, norm_out );
    assign normalizedFract = norm_out[62:11];
    assign commonExp =
          ( isSubnormal       ? {6'b111111, ~ norm_count} : 0 )
        | ( isNormalOrSpecial ? expIn                     : 0 );
    assign expAdjust = isZero ? 0 : 12'b010000000001;
    assign adjustedCommonExp = commonExp + expAdjust + isSubnormal;
    assign isNaN = ( adjustedCommonExp[11:10] == 2'b11 ) & ~ isZeroFractIn;

    assign expOut = adjustedCommonExp | isNaN<<9;
    assign fractOut = isZeroOrSubnormal ? normalizedFract : fractIn;
    assign out = {sign, expOut, fractOut};

endmodule

