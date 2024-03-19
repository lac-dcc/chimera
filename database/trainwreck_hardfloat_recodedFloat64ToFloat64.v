
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

module recodedFloat64ToFloat64( in, out );

    input  [64:0] in;
    output [63:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        sign;
    wire [11:0] expIn;
    wire [51:0] fractIn;
    wire        exp01_isHighSubnormalIn;
    wire        isSubnormal, isNormal, isSpecial, isNaN;

    wire [5:0]  denormShiftCount;
    wire [51:0] subnormal_fractOut;
    wire [10:0] normal_expOut;

    wire [10:0] expOut;
    wire [51:0] fractOut;
    wire [63:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign sign    = in[64];
    assign expIn   = in[63:52];
    assign fractIn = in[51:0];
    assign exp01_isHighSubnormalIn = ( expIn[9:0] < 2 );
    assign isSubnormal =
        ( expIn[11:9] == 3'b001 )
            | ( ( expIn[11:10] == 2'b01 ) & exp01_isHighSubnormalIn );
    assign isNormal =
        ( ( expIn[11:10] == 2'b01 ) & ~ exp01_isHighSubnormalIn )
            | ( expIn[11:10] == 2'b10 );
    assign isSpecial = ( expIn[11:10] == 2'b11 );
    assign isNaN = isSpecial & expIn[9];

    assign denormShiftCount = 2 - expIn[5:0];
    assign subnormal_fractOut = {1'b1, fractIn}>>denormShiftCount;
    assign normal_expOut = expIn - 12'b010000000001;

    assign expOut =
        ( isNormal ? normal_expOut : 0 ) | ( isSpecial ? 11'b11111111111 : 0 );
    assign fractOut =
          ( isSubnormal      ? subnormal_fractOut : 0 )
        | ( isNormal | isNaN ? fractIn            : 0 );
    assign out = {sign, expOut, fractOut};

endmodule

