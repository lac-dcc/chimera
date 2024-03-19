
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

`define round_nearest_even 2'b00
`define round_minMag       2'b01
`define round_min          2'b10
`define round_max          2'b11

module mulRecodedFloat32( a, b, roundingMode, out, exceptionFlags );

    input  [32:0] a, b;
    input  [1:0]  roundingMode;
    output [32:0] out;
    output [4:0]  exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        signA;
    wire [8:0]  expA;
    wire [22:0] fractA;
    wire        isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [23:0] sigA;
    wire        signB;
    wire [8:0]  expB;
    wire [22:0] fractB;
    wire        isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [23:0] sigB;
    wire        roundingMode_nearest_even, roundingMode_minMag;
    wire        roundingMode_min, roundingMode_max;

    wire        signOut;
    wire [9:0]  sSumExps;
    wire [8:0]  notNeg_sumExps;
    wire [47:0] sigProd;
    wire        prodShift1;
    wire [26:0] sigProdX;
    wire [26:0] roundMask, roundPosMask, roundIncr;
    wire [27:0] roundSigProdX;
    wire        roundPosBit, anyRoundExtra, roundInexact, roundEven;
    wire [25:0] sigProdY;
    wire [9:0]  sExpY;
    wire [8:0]  expY;
    wire [22:0] fractY;
    wire        overflowY, totalUnderflowY, underflowY, inexactY;
    wire        overflowY_roundMagUp;

    wire        mulSpecial, commonCase;
    wire        common_invalid, invalid, overflow, underflow, inexact;
    wire        notSpecial_isZeroOut, isSatOut, notNaN_isInfOut, isNaNOut;
    wire [8:0]  expOut;
    wire [22:0] fractOut;
    wire [32:0] out;
    wire [4:0]  exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signA  = a[32];
    assign expA   = a[31:23];
    assign fractA = a[22:0];
    assign isZeroA = ( expA[8:6] == 3'b000 );
    assign isSpecialA = ( expA[8:7] == 2'b11 );
    assign isInfA = isSpecialA & ~ expA[6];
    assign isNaNA = isSpecialA &   expA[6];
    assign isSigNaNA = isNaNA & ~ fractA[22];
    assign sigA = {~ isZeroA, fractA};

    assign signB  = b[32];
    assign expB   = b[31:23];
    assign fractB = b[22:0];
    assign isZeroB = ( expB[8:6] == 3'b000 );
    assign isSpecialB = ( expB[8:7] == 2'b11 );
    assign isInfB = isSpecialB & ~ expB[6];
    assign isNaNB = isSpecialB &   expB[6];
    assign isSigNaNB = isNaNB & ~ fractB[22];
    assign sigB = {~ isZeroB, fractB};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signOut = signA ^ signB;

    assign sSumExps = expA + {{2{~ expB[8]}}, expB[7:0]};
    assign notNeg_sumExps = sSumExps[8:0];
    assign sigProd = sigA * sigB;
    assign prodShift1 = sigProd[47];
    assign sigProdX = {sigProd[47:22], ( sigProd[21:0] != 0 )};

//*** FIRST TWO BITS NEEDED?
    assign roundMask =
//*** OPTIMIZE.
        {( notNeg_sumExps <= 9'b001101001 ),
         ( notNeg_sumExps <= 9'b001101010 ),
         ( notNeg_sumExps <= 9'b001101011 ),
         ( notNeg_sumExps <= 9'b001101100 ),
         ( notNeg_sumExps <= 9'b001101101 ),
         ( notNeg_sumExps <= 9'b001101110 ),
         ( notNeg_sumExps <= 9'b001101111 ),
         ( notNeg_sumExps <= 9'b001110000 ),
         ( notNeg_sumExps <= 9'b001110001 ),
         ( notNeg_sumExps <= 9'b001110010 ),
         ( notNeg_sumExps <= 9'b001110011 ),
         ( notNeg_sumExps <= 9'b001110100 ),
         ( notNeg_sumExps <= 9'b001110101 ),
         ( notNeg_sumExps <= 9'b001110110 ),
         ( notNeg_sumExps <= 9'b001110111 ),
         ( notNeg_sumExps <= 9'b001111000 ),
         ( notNeg_sumExps <= 9'b001111001 ),
         ( notNeg_sumExps <= 9'b001111010 ),
         ( notNeg_sumExps <= 9'b001111011 ),
         ( notNeg_sumExps <= 9'b001111100 ),
         ( notNeg_sumExps <= 9'b001111101 ),
         ( notNeg_sumExps <= 9'b001111110 ),
         ( notNeg_sumExps <= 9'b001111111 ),
         ( notNeg_sumExps <= 9'b010000000 ),
         ( notNeg_sumExps <= 9'b010000001 ) | prodShift1,
         2'b11};
    assign roundPosMask = ~ {1'b0, roundMask>>1} & roundMask;
    assign roundIncr =
          ( roundingMode_nearest_even ? roundPosMask : 0 )
        | ( ( signOut ? roundingMode_min : roundingMode_max ) ? roundMask
                : 0 );
    assign roundSigProdX = sigProdX + {1'b0, roundIncr};
    assign roundPosBit = ( ( sigProdX & roundPosMask ) != 0 );
    assign anyRoundExtra = ( ( sigProdX & roundMask>>1 ) != 0 );
    assign roundInexact = roundPosBit | anyRoundExtra;
    assign roundEven =
        roundingMode_nearest_even & roundPosBit & ! anyRoundExtra;
    assign sigProdY =
        roundSigProdX>>2 & ~ ( roundEven ? roundMask>>1 : roundMask>>2 );
//*** COMPOUND ADD FOR `sSumExps'?
    assign sExpY = sSumExps + sigProdY[25:24];
    assign expY = sExpY[8:0];
    assign fractY = prodShift1 ? sigProdY[23:1] : sigProdY[22:0];

    assign overflowY = ( sExpY[9:7] == 3'b011 );
//*** CHANGE TO USE `sSumExps'/`notNeg_sumExps'?
    assign totalUnderflowY = sExpY[9] | ( sExpY[8:0] < 9'b001101011 );
    assign underflowY =
//*** REPLACE?:
        totalUnderflowY
//*** USE EARLIER BITS FROM `roundMask'?
            | ( ( notNeg_sumExps
                      <= ( prodShift1 ? 9'b010000000 : 9'b010000001 ) )
                    & roundInexact );
    assign inexactY = roundInexact;

    assign overflowY_roundMagUp =
        roundingMode_nearest_even | ( roundingMode_min & signOut )
            | ( roundingMode_max & ~ signOut );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign mulSpecial = isSpecialA | isSpecialB;
    assign commonCase = ~ mulSpecial & ~ isZeroA & ~ isZeroB;

    assign common_invalid = ( isInfA & isZeroB ) | ( isZeroA & isInfB );
    assign invalid = isSigNaNA | isSigNaNB | common_invalid;
    assign overflow = commonCase & overflowY;
    assign underflow = commonCase & underflowY;
//*** SPEED BY USING `commonCase & totalUnderflowY' INSTEAD OF `underflow'?
    assign inexact = overflow | underflow | ( commonCase & inexactY );

    assign notSpecial_isZeroOut = isZeroA | isZeroB | totalUnderflowY;
    assign isSatOut = overflow & ~ overflowY_roundMagUp;
    assign notNaN_isInfOut =
        isInfA | isInfB | ( overflow & overflowY_roundMagUp );
    assign isNaNOut = isNaNA | isNaNB | common_invalid;

    assign expOut =
        (   expY
          & ~ ( notSpecial_isZeroOut ? 9'b111000000 : 0 )
          & ~ ( isSatOut             ? 9'b010000000 : 0 )
          & ~ ( notNaN_isInfOut      ? 9'b001000000 : 0 )
        ) | ( isSatOut        ? 9'b101111111 : 0 )
          | ( notNaN_isInfOut ? 9'b110000000 : 0 )
          | ( isNaNOut        ? 9'b111000000 : 0 );
    assign fractOut = fractY | ( isNaNOut | isSatOut ? 23'h7FFFFF : 0 );
    assign out = {signOut, expOut, fractOut};

    assign exceptionFlags = {invalid, 1'b0, overflow, underflow, inexact};

endmodule

