
//*** THIS MODULE IS NOT FULLY OPTIMIZED.

//*** DO THIS ANOTHER WAY?
`define round_nearest_even 2'b00
`define round_minMag       2'b01
`define round_min          2'b10
`define round_max          2'b11

module mulRecodedFloat64( a, b, roundingMode, out, exceptionFlags );

    input  [64:0] a, b;
    input  [1:0]  roundingMode;
    output [64:0] out;
    output [4:0]  exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire         signA;
    wire [11:0]  expA;
    wire [51:0]  fractA;
    wire         isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [52:0]  sigA;
    wire         signB;
    wire [11:0]  expB;
    wire [51:0]  fractB;
    wire         isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [52:0]  sigB;
    wire         roundingMode_nearest_even, roundingMode_minMag;
    wire         roundingMode_min, roundingMode_max;

    wire         signOut;
    wire [12:0]  expProd;
    wire [11:0]  notNeg_expProd;
    wire [105:0] sigProd;
    wire         prodShift1;
    wire [55:0]  sigProdX;
    wire [55:0]  roundMask, roundPosMask, roundIncr;
    wire [56:0]  roundSigProdX;
    wire         roundPosBit, anyRoundExtra, roundInexact, roundEven;
    wire [54:0]  sigProdY;
    wire [12:0]  sExpY;
    wire [11:0]  expY;
    wire [51:0]  fractY;
    wire         overflowY, totalUnderflowY, underflowY, inexactY;
    wire         overflowY_roundMagUp;

    wire         mulSpecial, commonCase;
    wire         notSigNaN_invalid, invalid, overflow, underflow, inexact;
    wire         notSpecial_isZeroOut, isSatOut, notNaN_isInfOut, isNaNOut;
    wire [11:0]  expOut;
    wire [51:0]  fractOut;
    wire [64:0]  out;
    wire [4:0]   exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signA  = a[64];
    assign expA   = a[63:52];
    assign fractA = a[51:0];
    assign isZeroA = ( expA[11:9] == 3'b000 );
    assign isSpecialA = ( expA[11:10] == 2'b11 );
    assign isInfA = isSpecialA & ~ expA[9];
    assign isNaNA = isSpecialA &   expA[9];
    assign isSigNaNA = isNaNA & ~ fractA[51];
    assign sigA = {~ isZeroA, fractA};

    assign signB  = b[64];
    assign expB   = b[63:52];
    assign fractB = b[51:0];
    assign isZeroB = ( expB[11:9] == 3'b000 );
    assign isSpecialB = ( expB[11:10] == 2'b11 );
    assign isInfB = isSpecialB & ~ expB[9];
    assign isNaNB = isSpecialB &   expB[9];
    assign isSigNaNB = isNaNB & ~ fractB[51];
    assign sigB = {~ isZeroB, fractB};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signOut = signA ^ signB;

    assign expProd = expA + {{2{~ expB[11]}}, expB[10:0]};
    assign notNeg_expProd = expProd[11:0];
    assign sigProd = sigA * sigB;
    assign prodShift1 = sigProd[105];
    assign sigProdX = {sigProd[105:51], ( sigProd[50:0] != 0 )};

//*** FIRST TWO BITS NEEDED?
    assign roundMask =
        {( notNeg_expProd <= 12'b001111001100 ),
         ( notNeg_expProd <= 12'b001111001101 ),
         ( notNeg_expProd <= 12'b001111001110 ),
         ( notNeg_expProd <= 12'b001111001111 ),
         ( notNeg_expProd <= 12'b001111010000 ),
         ( notNeg_expProd <= 12'b001111010001 ),
         ( notNeg_expProd <= 12'b001111010010 ),
         ( notNeg_expProd <= 12'b001111010011 ),
         ( notNeg_expProd <= 12'b001111010100 ),
         ( notNeg_expProd <= 12'b001111010101 ),
         ( notNeg_expProd <= 12'b001111010110 ),
         ( notNeg_expProd <= 12'b001111010111 ),
         ( notNeg_expProd <= 12'b001111011000 ),
         ( notNeg_expProd <= 12'b001111011001 ),
         ( notNeg_expProd <= 12'b001111011010 ),
         ( notNeg_expProd <= 12'b001111011011 ),
         ( notNeg_expProd <= 12'b001111011100 ),
         ( notNeg_expProd <= 12'b001111011101 ),
         ( notNeg_expProd <= 12'b001111011110 ),
         ( notNeg_expProd <= 12'b001111011111 ),
         ( notNeg_expProd <= 12'b001111100000 ),
         ( notNeg_expProd <= 12'b001111100001 ),
         ( notNeg_expProd <= 12'b001111100010 ),
         ( notNeg_expProd <= 12'b001111100011 ),
         ( notNeg_expProd <= 12'b001111100100 ),
         ( notNeg_expProd <= 12'b001111100101 ),
         ( notNeg_expProd <= 12'b001111100110 ),
         ( notNeg_expProd <= 12'b001111100111 ),
         ( notNeg_expProd <= 12'b001111101000 ),
         ( notNeg_expProd <= 12'b001111101001 ),
         ( notNeg_expProd <= 12'b001111101010 ),
         ( notNeg_expProd <= 12'b001111101011 ),
         ( notNeg_expProd <= 12'b001111101100 ),
         ( notNeg_expProd <= 12'b001111101101 ),
         ( notNeg_expProd <= 12'b001111101110 ),
         ( notNeg_expProd <= 12'b001111101111 ),
         ( notNeg_expProd <= 12'b001111110000 ),
         ( notNeg_expProd <= 12'b001111110001 ),
         ( notNeg_expProd <= 12'b001111110010 ),
         ( notNeg_expProd <= 12'b001111110011 ),
         ( notNeg_expProd <= 12'b001111110100 ),
         ( notNeg_expProd <= 12'b001111110101 ),
         ( notNeg_expProd <= 12'b001111110110 ),
         ( notNeg_expProd <= 12'b001111110111 ),
         ( notNeg_expProd <= 12'b001111111000 ),
         ( notNeg_expProd <= 12'b001111111001 ),
         ( notNeg_expProd <= 12'b001111111010 ),
         ( notNeg_expProd <= 12'b001111111011 ),
         ( notNeg_expProd <= 12'b001111111100 ),
         ( notNeg_expProd <= 12'b001111111101 ),
         ( notNeg_expProd <= 12'b001111111110 ),
         ( notNeg_expProd <= 12'b001111111111 ),
         ( notNeg_expProd <= 12'b010000000000 ),
         ( notNeg_expProd <= 12'b010000000001 ) | prodShift1,
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
//*** COMPOUND ADD FOR `expProd'?
    assign sExpY = expProd + sigProdY[54:53];
    assign expY = sExpY[11:0];
    assign fractY = prodShift1 ? sigProdY[52:1] : sigProdY[51:0];

    assign overflowY = ( sExpY[12:10] == 3'b011 );
//*** CHANGE TO USE `expProd'/`notNeg_expProd'?
    assign totalUnderflowY = sExpY[12] | ( sExpY[11:0] < 12'b001111001110 );
    assign underflowY =
//*** REPLACE?:
        totalUnderflowY
//*** USE EARLIER BITS FROM `roundMask'?
            | ( ( notNeg_expProd
                      <= ( prodShift1 ? 12'b010000000000 : 12'b010000000001 ) )
                    & roundInexact );
    assign inexactY = roundInexact;

    assign overflowY_roundMagUp =
        roundingMode_nearest_even | ( roundingMode_min & signOut )
            | ( roundingMode_max & ~ signOut );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign mulSpecial = isSpecialA | isSpecialB;
    assign commonCase = ~ mulSpecial & ~ isZeroA & ~ isZeroB;

    assign notSigNaN_invalid = ( isInfA & isZeroB ) | ( isZeroA & isInfB );
    assign invalid = isSigNaNA | isSigNaNB | notSigNaN_invalid;
    assign overflow = commonCase & overflowY;
    assign underflow = commonCase & underflowY;
//*** SPEED BY USING `commonCase & totalUnderflowY' INSTEAD OF `underflow'?
    assign inexact = overflow | underflow | ( commonCase & inexactY );

    assign notSpecial_isZeroOut = isZeroA | isZeroB | totalUnderflowY;
    assign isSatOut = overflow & ~ overflowY_roundMagUp;
    assign notNaN_isInfOut =
        isInfA | isInfB | ( overflow & overflowY_roundMagUp );
    assign isNaNOut = isNaNA | isNaNB | notSigNaN_invalid;

    assign expOut =
        (   expY
          & ~ ( notSpecial_isZeroOut ? 12'b111000000000 : 0 )
          & ~ ( isSatOut             ? 12'b010000000000 : 0 )
          & ~ ( notNaN_isInfOut      ? 12'b001000000000 : 0 )
        ) | ( isSatOut        ? 12'b101111111111 : 0 )
          | ( notNaN_isInfOut ? 12'b110000000000 : 0 )
          | ( isNaNOut        ? 12'b111000000000 : 0 );
    assign fractOut = fractY | ( isNaNOut | isSatOut ? 52'hFFFFFFFFFFFFF : 0 );
    assign out = {signOut, expOut, fractOut};

    assign exceptionFlags = {invalid, 1'b0, overflow, underflow, inexact};

endmodule

