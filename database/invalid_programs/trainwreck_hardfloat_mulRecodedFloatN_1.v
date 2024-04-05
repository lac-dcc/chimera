
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/


//*** THIS MODULE IS NOT FULLY OPTIMIZED.

`include "fpu_common.v"

module mulRecodedFloatN( a, b, roundingMode, out, exceptionFlags );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam size = expSize + sigSize;
    localparam minExp = ( 1<<( expSize - 1 ) ) + 3 - sigSize;
    localparam minNormExp = ( 1<<( expSize - 1 ) ) + 2;

    input  [size:0] a, b;
    input  [1:0]    roundingMode;
    output [size:0] out;
    output [4:0]    exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire                 signA;
    wire [expSize:0]     expA;
    wire [sigSize-2:0]   fractA;
    wire                 isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [sigSize-1:0]   sigA;
    wire                 signB;
    wire [expSize:0]     expB;
    wire [sigSize-2:0]   fractB;
    wire                 isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [sigSize-1:0]   sigB;
    wire                 roundingMode_nearest_even, roundingMode_minMag;
    wire                 roundingMode_min, roundingMode_max;

    wire                 signOut;
    wire [expSize+1:0]   expProd;
    wire [expSize:0]     notNeg_expProd;
    wire [sigSize*2-1:0] sigProd;
    wire                 prodShift1;
    wire [sigSize+2:0]   sigProdX;
    wire [sigSize+2:0]   roundMask, roundPosMask, roundIncr;
    wire [sigSize+3:0]   roundSigProdX;
    wire                 roundPosBit, anyRoundExtra, roundInexact, roundEven;
    wire [sigSize+1:0]   sigProdY;
    wire [expSize+1:0]   sExpY;
    wire [expSize:0]     expY;
    wire [sigSize-2:0]   fractY;
    wire                 overflowY, totalUnderflowY, underflowY, inexactY;
    wire                 overflowY_roundMagUp;

    wire                 mulSpecial, commonCase;
    wire                 notSigNaN_invalid, invalid;
    wire                 overflow, underflow, inexact;
    wire                 notSpecial_isZeroOut, isSatOut;
    wire                 notNaN_isInfOut, isNaNOut;
    wire [expSize:0]     expOut;
    wire [sigSize-2:0]   fractOut;
    wire [size:0]        out;
    wire [4:0]           exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signA  = a[size];
    assign expA   = a[size-1:sigSize-1];
    assign fractA = a[sigSize-2:0];
    assign isZeroA = ( expA[expSize:expSize-2] == 3'b000 );
    assign isSpecialA = ( expA[expSize:expSize-1] == 2'b11 );
    assign isInfA = isSpecialA & ~ expA[expSize-2];
    assign isNaNA = isSpecialA &   expA[expSize-2];
    assign isSigNaNA = isNaNA & ~ fractA[sigSize-2];
    assign sigA = {~ isZeroA, fractA};

    assign signB  = b[size];
    assign expB   = b[size-1:sigSize-1];
    assign fractB = b[sigSize-2:0];
    assign isZeroB = ( expB[expSize:expSize-2] == 3'b000 );
    assign isSpecialB = ( expB[expSize:expSize-1] == 2'b11 );
    assign isInfB = isSpecialB & ~ expB[expSize-2];
    assign isNaNB = isSpecialB &   expB[expSize-2];
    assign isSigNaNB = isNaNB & ~ fractB[sigSize-2];
    assign sigB = {~ isZeroB, fractB};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signOut = signA ^ signB;

    assign expProd = expA + {{2{~ expB[expSize]}}, expB[expSize-1:0]};
    assign notNeg_expProd = expProd[expSize:0];
    assign sigProd = sigA * sigB;
    assign prodShift1 = sigProd[sigSize*2-1];
    assign sigProdX =
        {sigProd[sigSize*2-1:sigSize-2], ( sigProd[sigSize-3:0] != 0 )};

//*** FIRST TWO BITS NEEDED?
    generate
        genvar i;
        for ( i = minExp-2; i <= minNormExp-2; i = i+1) begin : loop
            assign roundMask[sigSize + minExp - i] = notNeg_expProd <= i;
        end
    endgenerate
    assign roundMask[2] =  ( notNeg_expProd <= (minNormExp-1) ) | prodShift1;
    assign roundMask[1:0] = 2'b11;

    assign roundPosMask = ~ (roundMask>>1) & roundMask;
    assign roundIncr =
          ( roundingMode_nearest_even ? roundPosMask : 1'b0 )
        | ( ( signOut ? roundingMode_min : roundingMode_max ) ? roundMask
                : 1'b0 );
    assign roundSigProdX = sigProdX + {1'b0, roundIncr};
    assign roundPosBit = ( ( sigProdX & roundPosMask ) != 0 );
    assign anyRoundExtra = ( ( sigProdX & roundMask>>1 ) != 0 );
    assign roundInexact = roundPosBit | anyRoundExtra;
    assign roundEven =
        roundingMode_nearest_even & roundPosBit & ! anyRoundExtra;
    assign sigProdY =
        roundSigProdX[sigSize+3:2] & ~ ( roundEven ? roundMask[sigSize+2:1] : {1'b0,roundMask[sigSize+2:2]} );
//*** COMPOUND ADD FOR `expProd'?
    assign sExpY = expProd + sigProdY[sigSize+1:sigSize];
    assign expY = sExpY[expSize:0];
    assign fractY = prodShift1 ? sigProdY[sigSize-1:1] : sigProdY[sigSize-2:0];

    assign overflowY = ( sExpY[expSize+1:expSize-1] == 3'b011 );
//*** CHANGE TO USE `expProd'/`notNeg_expProd'?
    assign totalUnderflowY = sExpY[expSize+1] | ( sExpY[expSize:0] < minExp );
    assign underflowY =
//*** REPLACE?:
        totalUnderflowY
//*** USE EARLIER BITS FROM `roundMask'?
            | ( ( notNeg_expProd
                      <= ( prodShift1 ? (minNormExp-2) : (minNormExp-1) ) )
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
          & ~ ( notSpecial_isZeroOut ? 3'b111<<(expSize-2) : 1'b0 )
          & ~ ( isSatOut             ? 3'b010<<(expSize-2) : 1'b0 )
          & ~ ( notNaN_isInfOut      ? 3'b001<<(expSize-2) : 1'b0 )
        ) | ( isSatOut        ? ((2'b11<<(expSize-1))-1'b1) : 1'b0 )
          | ( notNaN_isInfOut ? 3'b110<<(expSize-2)      : 1'b0 )
          | ( isNaNOut        ? 3'b111<<(expSize-2)      : 1'b0 );
    assign fractOut =
        fractY | ( isNaNOut | isSatOut ? {(sigSize-1){1'b1}} : 1'b0 );
    assign out = {signOut, expOut, fractOut};

    assign exceptionFlags = {invalid, 1'b0, overflow, underflow, inexact};

endmodule

