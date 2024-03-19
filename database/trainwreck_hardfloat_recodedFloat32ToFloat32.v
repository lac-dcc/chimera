
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

module recodedFloat32ToFloat32( in, out );

    input  [32:0] in;
    output [31:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        sign;
    wire [8:0]  expIn;
    wire [22:0] fractIn;
    wire        exp01_isHighSubnormalIn;
    wire        isSubnormal, isNormal, isSpecial, isNaN;

    wire [4:0]  denormShiftDist;
    wire [22:0] subnormal_fractOut;
    wire [7:0]  normal_expOut;

    wire [7:0]  expOut;
    wire [22:0] fractOut;
    wire [31:0] out;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign sign    = in[32];
    assign expIn   = in[31:23];
    assign fractIn = in[22:0];
    assign exp01_isHighSubnormalIn = ( expIn[6:0] < 2 );
    assign isSubnormal =
        ( expIn[8:6] == 3'b001 )
            | ( ( expIn[8:7] == 2'b01 ) & exp01_isHighSubnormalIn );
    assign isNormal =
        ( ( expIn[8:7] == 2'b01 ) & ~ exp01_isHighSubnormalIn )
            | ( expIn[8:7] == 2'b10 );
    assign isSpecial = ( expIn[8:7] == 2'b11 );
    assign isNaN = isSpecial & expIn[6];

    assign denormShiftDist = 2 - expIn[4:0];
    assign subnormal_fractOut = {1'b1, fractIn}>>denormShiftDist;
    assign normal_expOut = expIn - 9'b010000001;

    assign expOut =
        ( isNormal ? normal_expOut : 0 ) | ( isSpecial ? 8'b11111111 : 0 );
    assign fractOut =
          ( isSubnormal      ? subnormal_fractOut : 0 )
        | ( isNormal | isNaN ? fractIn            : 0 );
    assign out = {sign, expOut, fractOut};

endmodule

