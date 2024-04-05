
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/


//*** THIS MODULE IS NOT FULLY OPTIMIZED.

`include "fpu_common.v"

module addSubRecodedFloatN( op, a, b, roundingMode, out, exceptionFlags );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam size = expSize + sigSize;
    localparam diffExpSize = `ceilLog2( sigSize + 3 );
    localparam logNormSize = `ceilLog2( sigSize );
    localparam normSize = 1 << logNormSize;

    input           op;
    input  [size:0] a, b;
    input  [1:0]    roundingMode;
    output [size:0] out;
    output [4:0]    exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire                   signA;
    wire [expSize:0]       expA;
    wire [sigSize-2:0]     fractA;
    wire                   isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [sigSize-1:0]     sigA;
    wire                   opSignB;
    wire [expSize:0]       expB;
    wire [sigSize-2:0]     fractB;
    wire                   isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [sigSize-1:0]     sigB;
    wire                   doSubMags;
    wire                   roundingMode_nearest_even, roundingMode_minMag;
    wire                   roundingMode_min, roundingMode_max;

    wire                   hasLargerExpB;
    wire                   signLarger;
    wire [expSize:0]       expLarger;
    wire [sigSize-1:0]     sigLarger, sigSmaller;
    wire [expSize+1:0]     sSubExps;
    wire                   overflowSubExps;
    wire [diffExpSize-1:0] wrapAbsDiffExps, satAbsDiffExps;
    wire                   doCloseSubMags;

    wire [sigSize:0]       close_alignedSigSmaller;
    wire [sigSize+1:0]     close_sSigSum;
    wire                   close_signSigSum, close_pos_isNormalizedSigSum;
    wire                   close_roundInexact, close_roundIncr;
    wire                   close_roundEven;
    wire [sigSize-1:0]     close_negSigSumA;
    wire                   close_sigSumAIncr;
    wire [sigSize-1:0]     close_roundedAbsSigSumAN;
    wire [sigSize:0]       close_roundedAbsSigSum;
    wire [normSize-1:0]    close_norm_in;
    wire [logNormSize-1:0] close_norm_count;
    wire [normSize-1:0]    close_norm_out;
    wire                   close_isZeroY, close_signY;
    wire [expSize:0]       close_expY;
    wire [sigSize-2:0]     close_fractY;

    wire [sigSize-1:0]     far_roundExtraMask;
    wire [sigSize+2:0]     far_alignedSigSmaller;
    wire [sigSize+3:0]     far_negAlignedSigSmaller, far_sigSum;
    wire                   far_sumShift1, far_sumShift0, far_sumShiftM1;
    wire [sigSize:0]       far_fractX;
    wire                   far_roundInexact, far_roundIncr, far_roundEven;
    wire [sigSize-1:0]     far_cFractYN;
    wire                   far_roundCarry;
    wire [expSize:0]       far_expAdjust, far_expY;
    wire [sigSize-2:0]     far_fractY;

    wire                   isZeroY, signY;
    wire [expSize:0]       expY;
    wire [sigSize-2:0]     fractY;
    wire                   overflowY, inexactY, overflowY_roundMagUp;

    wire                   addSpecial, addZeros, commonCase;
    wire                   notSigNaN_invalid, invalid, overflow, inexact;
    wire                   notSpecial_isZeroOut, isSatOut;
    wire                   notNaN_isInfOut, isNaNOut;
    wire                   signOut;
    wire [expSize:0]       expOut;
    wire [sigSize-2:0]     fractOut;
    wire [size:0]          out;
    wire [4:0]             exceptionFlags;

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

    assign opSignB = b[size] ^ op;
    assign expB    = b[size-1:sigSize-1];
    assign fractB  = b[sigSize-2:0];
    assign isZeroB = ( expB[expSize:expSize-2] == 3'b000 );
    assign isSpecialB = ( expB[expSize:expSize-1] == 2'b11 );
    assign isInfB = isSpecialB & ~ expB[expSize-2];
    assign isNaNB = isSpecialB &   expB[expSize-2];
    assign isSigNaNB = isNaNB & ~ fractB[sigSize-2];
    assign sigB = {~ isZeroB, fractB};

    assign doSubMags = signA ^ opSignB;

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    | `satAbsDiffExps' is the distance to shift the significand of the operand
    | with the smaller exponent, maximized to ( 1<<diffExpSize ) - 1.
    *------------------------------------------------------------------------*/
//*** USE SIGN FROM `sSubExps'?
    assign hasLargerExpB = ( expA < expB );
    assign signLarger = hasLargerExpB ? opSignB : signA;
    assign expLarger  = hasLargerExpB ? expB    : expA;
    assign sigLarger  = hasLargerExpB ? sigB    : sigA;
    assign sigSmaller = hasLargerExpB ? sigA    : sigB;

    assign sSubExps = {1'b0, expA} - expB;
//*** IMPROVE?
    assign overflowSubExps =
          ( sSubExps[expSize+1:diffExpSize] != 0 )
        & (   ( sSubExps[expSize+1:diffExpSize]
                    != {(expSize-diffExpSize+2){1'b1}} )
            | ( sSubExps[diffExpSize-1:0] == 0 )
          );
    assign wrapAbsDiffExps =
        hasLargerExpB ? expB[diffExpSize-1:0] - expA[diffExpSize-1:0]
            : sSubExps[diffExpSize-1:0];
    assign satAbsDiffExps =
        wrapAbsDiffExps | ( overflowSubExps ? {diffExpSize{1'b1}} : 1'b0 );
    assign doCloseSubMags =
        doSubMags & ~ overflowSubExps & ( wrapAbsDiffExps <= 1 );

    /*------------------------------------------------------------------------
    | The close-subtract case.
    |   If the difference significand < 1, it must be exact (when normalized).
    | If it is < 0 (negative), the round bit will in fact be 0.  If the
    | difference significand is > 1, it may be inexact, but the rounding
    | increment cannot carry out (because that would give a rounded difference
    | >= 2, which is impossibly large).  Hence, the rounding increment can
    | be done before normalization.  (A significand >= 1 is unaffected by
    | normalization, whether done before or after rounding.)  The increment
    | for negation and for rounding are combined before normalization.
    *------------------------------------------------------------------------*/
//*** MASK SIGS TO SAVE ENERGY?  (ALSO EMPLOY LATER WHEN MERGING TWO PATHS.)
    assign close_alignedSigSmaller =
        ( expA[0] == expB[0] ) ? {sigSmaller, 1'b0} : {1'b0, sigSmaller};
    assign close_sSigSum = {1'b0, sigLarger, 1'b0} - close_alignedSigSmaller;
    assign close_signSigSum = close_sSigSum[sigSize+1];
    assign close_pos_isNormalizedSigSum = close_sSigSum[sigSize];
    assign close_roundInexact =
        close_sSigSum[0] & close_pos_isNormalizedSigSum;
    assign close_roundIncr =
        close_roundInexact
            & (   ( roundingMode_nearest_even & 1'b1         )
                | ( roundingMode_minMag       & 1'b0         )
                | ( roundingMode_min          &   signLarger )
                | ( roundingMode_max          & ~ signLarger )
              );
    assign close_roundEven = roundingMode_nearest_even & close_roundInexact;
    assign close_negSigSumA =
        close_signSigSum ? ~ close_sSigSum[sigSize:1]
            : close_sSigSum[sigSize:1];
    assign close_sigSumAIncr = close_signSigSum | close_roundIncr;
    assign close_roundedAbsSigSumAN = close_negSigSumA + close_sigSumAIncr;
    assign close_roundedAbsSigSum =
        {close_roundedAbsSigSumAN[sigSize-1:1],
         close_roundedAbsSigSumAN[0] & ~ close_roundEven,
         close_sSigSum[0] & ~ close_pos_isNormalizedSigSum};
    assign close_norm_in = {close_roundedAbsSigSum, {(normSize-sigSize-1){1'b0}}};
    normalizeN #(expSize, sigSize)
        close_normalizeSigSum(
            close_norm_in, close_norm_count, close_norm_out );
    assign close_isZeroY = ~ close_norm_out[normSize-1];
    assign close_signY = ~ close_isZeroY & ( signLarger ^ close_signSigSum );
//*** COMBINE EXP ADJUST ADDERS FOR CLOSE AND FAR PATHS?
    assign close_expY = expLarger - close_norm_count;
    assign close_fractY = close_norm_out[normSize-2:normSize-sigSize];

    /*------------------------------------------------------------------------
    | The far/add case.
    |   `far_sigSum' has two integer bits and a value in the range (1/2, 4).
    *------------------------------------------------------------------------*/
//*** MASK SIGS TO SAVE ENERGY?  (ALSO EMPLOY LATER WHEN MERGING TWO PATHS.)
//*** BREAK UP COMPUTATION OF EXTRA MASK?
    generate
        genvar i;
        for(i = sigSize+2; i >= 3; i = i-1) begin : loop
            assign far_roundExtraMask[i-3] = i <= satAbsDiffExps;
        end
    endgenerate
//*** USE `wrapAbsDiffExps' AND MASK RESULT?
    assign far_alignedSigSmaller =
        {{sigSmaller, 2'b0}>>satAbsDiffExps,
         ( ( sigSmaller & far_roundExtraMask ) != 0 )};
    assign far_negAlignedSigSmaller =
        doSubMags ? {1'b1, ~ far_alignedSigSmaller}
            : {1'b0, far_alignedSigSmaller};
    assign far_sigSum =
        {1'b0, sigLarger, 3'b0} + far_negAlignedSigSmaller + doSubMags;
    assign far_sumShift1  = far_sigSum[sigSize+3];
    assign far_sumShift0  = ( far_sigSum[sigSize+3:sigSize+2] == 2'b01 );
    assign far_sumShiftM1 = ( far_sigSum[sigSize+3:sigSize+2] == 2'b00 );
    assign far_fractX =
          ( far_sumShift1 ? {far_sigSum[sigSize+2:3], ( far_sigSum[2:0] != 0 )}
                : 1'b0 )
        | ( far_sumShift0
                ? {far_sigSum[sigSize+1:2], ( far_sigSum[1:0] != 0 )}
                : 1'b0 )
        | ( far_sumShiftM1 ? far_sigSum[sigSize:0] : 1'b0 );

    assign far_roundInexact = ( far_fractX[1:0] != 0 );
    assign far_roundIncr =
          ( roundingMode_nearest_even & far_fractX[1]                   )
        | ( roundingMode_minMag       & 1'b0                            )
        | ( roundingMode_min          &   signLarger & far_roundInexact )
        | ( roundingMode_max          & ~ signLarger & far_roundInexact );
    assign far_roundEven =
        roundingMode_nearest_even & ( far_fractX[1:0] == 2'b10 );
    assign far_cFractYN = ( far_fractX[sigSize:2] ) + far_roundIncr;
    assign far_roundCarry = far_cFractYN[sigSize-1];
//*** COMBINE EXP ADJUST ADDERS FOR CLOSE AND FAR PATHS?
    assign far_expAdjust =
          ( far_sumShift1 | ( far_sumShift0 & far_roundCarry ) ? 1'b1    : 1'b0 )
        | ( far_sumShiftM1 & ~ far_roundCarry      ? {(expSize+1){1'b1}} : 1'b0 );
    assign far_expY = expLarger + far_expAdjust;
    assign far_fractY =
        {far_cFractYN[sigSize-2:1], far_cFractYN[0] & ~ far_roundEven};

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign isZeroY = doCloseSubMags & close_isZeroY;
    assign signY  = doCloseSubMags ? close_signY  : signLarger;
    assign expY   = doCloseSubMags ? close_expY   : far_expY;
    assign fractY = doCloseSubMags ? close_fractY : far_fractY;
    assign overflowY =
        ~ doCloseSubMags & ( far_expY[expSize:expSize-1] == 2'b11 );
    assign inexactY = doCloseSubMags ? close_roundInexact : far_roundInexact;

    assign overflowY_roundMagUp =
        roundingMode_nearest_even | ( roundingMode_min & signLarger )
            | ( roundingMode_max & ~ signLarger );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign addSpecial = isSpecialA | isSpecialB;
    assign addZeros = isZeroA & isZeroB;
    assign commonCase = ~ addSpecial & ~ addZeros;

    assign notSigNaN_invalid = isInfA & isInfB & doSubMags;
    assign invalid = isSigNaNA | isSigNaNB | notSigNaN_invalid;
    assign overflow = commonCase & overflowY;
    assign inexact = overflow | ( commonCase & inexactY );

    assign notSpecial_isZeroOut = addZeros | isZeroY;
    assign isSatOut = overflow & ~ overflowY_roundMagUp;
    assign notNaN_isInfOut =
        isInfA | isInfB | ( overflow & overflowY_roundMagUp );
    assign isNaNOut = isNaNA | isNaNB | notSigNaN_invalid;

    assign signOut =
          ( ~ doSubMags               & signA   )
        | ( isNaNA                    & signA   )
        | ( ~ isNaNA & isNaNB         & opSignB )
        | ( isSpecialA & ~ isSpecialB & signA   )
        | ( ~ isSpecialA & isSpecialB & opSignB )
        | ( addZeros & doSubMags      & 1'b0    )
        | ( commonCase                & signY   );
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

    assign exceptionFlags = {invalid, 1'b0, overflow, 1'b0, inexact};

endmodule

