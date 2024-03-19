
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

//*** DO THIS ANOTHER WAY?
`define round_nearest_even 2'b00
`define round_minMag       2'b01
`define round_min          2'b10
`define round_max          2'b11

module addSubRecodedFloat64( op, a, b, roundingMode, out, exceptionFlags );

    input         op;
    input  [64:0] a, b;
    input  [1:0]  roundingMode;
    output [64:0] out;
    output [4:0]  exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire        signA;
    wire [11:0] expA;
    wire [51:0] fractA;
    wire        isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [52:0] sigA;
    wire        opSignB;
    wire [11:0] expB;
    wire [51:0] fractB;
    wire        isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [52:0] sigB;
    wire        roundingMode_nearest_even, roundingMode_minMag;
    wire        roundingMode_min, roundingMode_max;

    wire        hasLargerExpB;
    wire        signLarger;
    wire [11:0] expLarger;
    wire [52:0] sigLarger, sigSmaller;
    wire        eqOpSigns;
    wire [12:0] sSubExps;
    wire        overflowSubExps;
    wire [5:0]  wrapAbsDiffExps, satAbsDiffExps;
    wire        doCloseSubMags;

    wire [53:0] close_alignedSigSmaller;
    wire [54:0] close_sSigSum;
    wire        close_signSigSum, close_pos_isNormalizedSigSum;
    wire        close_roundInexact, close_roundIncr, close_roundEven;
    wire [52:0] close_negSigSumA;
    wire        close_sigSumAIncr;
    wire [52:0] close_roundedAbsSigSumAN;
    wire [53:0] close_roundedAbsSigSum;
    wire [63:0] close_norm_in;
    wire [5:0]  close_norm_count;
    wire [63:0] close_norm_out;
    wire        close_isZeroY, close_signY;
    wire [11:0] close_expY;
    wire [51:0] close_fractY;

    wire [52:0] far_roundExtraMask;
    wire [55:0] far_alignedSigSmaller;
    wire [56:0] far_negAlignedSigSmaller;
    wire        far_sigSumIncr;
    wire [56:0] far_sigSum;
    wire        far_sumShift1, far_sumShift0, far_sumShiftM1;
    wire [53:0] far_fractX;
    wire        far_roundInexact, far_roundIncr, far_roundEven;
    wire [52:0] far_cFractYN;
    wire        far_roundCarry;
    wire [11:0] far_expAdjust, far_expY;
    wire [51:0] far_fractY;

    wire        isZeroY, signY;
    wire [11:0] expY;
    wire [51:0] fractY;
    wire        overflowY, inexactY, overflowY_roundMagUp;

    wire        addSpecial, addZeros, commonCase;
    wire        common_invalid, invalid, overflow, inexact;
    wire        notSpecial_isZeroOut, isSatOut, notNaN_isInfOut, isNaNOut;
    wire        signOut;
    wire [11:0] expOut;
    wire [51:0] fractOut;
    wire [64:0] out;
    wire [4:0]  exceptionFlags;

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

    assign opSignB = op ^ b[64];
    assign expB    = b[63:52];
    assign fractB  = b[51:0];
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
    | `satAbsDiffExps' is the distance to shift the significand of the operand
    | with the smaller exponent, maximized to 63.
    *------------------------------------------------------------------------*/
//*** USE SIGN FROM `sSubExps'?
    assign hasLargerExpB = ( expA < expB );
    assign signLarger = hasLargerExpB ? opSignB : signA;
    assign expLarger  = hasLargerExpB ? expB    : expA;
    assign sigLarger  = hasLargerExpB ? sigB    : sigA;
    assign sigSmaller = hasLargerExpB ? sigA    : sigB;

    assign eqOpSigns = ( signA == opSignB );
    assign sSubExps = {1'b0, expA} - expB;
//*** IMPROVE?
    assign overflowSubExps =
          ( sSubExps[12:6] != 0 )
        & ( ( sSubExps[12:6] != 7'b1111111 ) | ( sSubExps[5:0] == 0 ) );
    assign wrapAbsDiffExps =
        hasLargerExpB ? expB[5:0] - expA[5:0] : sSubExps[5:0];
    assign satAbsDiffExps = wrapAbsDiffExps | ( overflowSubExps ? 63 : 0 );
    assign doCloseSubMags =
        ~ eqOpSigns & ~ overflowSubExps & ( wrapAbsDiffExps <= 1 );

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
    assign close_signSigSum = close_sSigSum[54];
    assign close_pos_isNormalizedSigSum = close_sSigSum[53];
    assign close_roundInexact =
        close_sSigSum[0] & close_pos_isNormalizedSigSum;
    assign close_roundIncr =
        close_roundInexact
            & (   ( roundingMode_nearest_even & 1            )
                | ( roundingMode_minMag       & 0            )
                | ( roundingMode_min          &   signLarger )
                | ( roundingMode_max          & ~ signLarger )
              );
    assign close_roundEven = roundingMode_nearest_even & close_roundInexact;
    assign close_negSigSumA =
        close_signSigSum ? ~ close_sSigSum[53:1] : close_sSigSum[53:1];
    assign close_sigSumAIncr = close_signSigSum | close_roundIncr;
    assign close_roundedAbsSigSumAN = close_negSigSumA + close_sigSumAIncr;
    assign close_roundedAbsSigSum =
        {close_roundedAbsSigSumAN[52:1],
         close_roundedAbsSigSumAN[0] & ~ close_roundEven,
         close_sSigSum[0] & ~ close_pos_isNormalizedSigSum};
    assign close_norm_in = {close_roundedAbsSigSum, 10'b0};
    normalize64
        close_normalizeSigSum(
            close_norm_in, close_norm_count, close_norm_out );
    assign close_isZeroY = ~ close_norm_out[63];
    assign close_signY = ~ close_isZeroY & ( signLarger ^ close_signSigSum );
//*** COMBINE EXP ADJUST ADDERS FOR CLOSE AND FAR PATHS?
    assign close_expY = expLarger - close_norm_count;
    assign close_fractY = close_norm_out[62:11];

    /*------------------------------------------------------------------------
    | The far/add case.
    |   `far_sigSum' has two integer bits and a value in the range (1/2, 4).
    *------------------------------------------------------------------------*/
//*** MASK SIGS TO SAVE ENERGY?  (ALSO EMPLOY LATER WHEN MERGING TWO PATHS.)
//*** BREAK UP COMPUTATION OF EXTRA MASK?
    assign far_roundExtraMask =
        {( 55 <= satAbsDiffExps ), ( 54 <= satAbsDiffExps ),
         ( 53 <= satAbsDiffExps ), ( 52 <= satAbsDiffExps ),
         ( 51 <= satAbsDiffExps ), ( 50 <= satAbsDiffExps ),
         ( 49 <= satAbsDiffExps ), ( 48 <= satAbsDiffExps ),
         ( 47 <= satAbsDiffExps ), ( 46 <= satAbsDiffExps ),
         ( 45 <= satAbsDiffExps ), ( 44 <= satAbsDiffExps ),
         ( 43 <= satAbsDiffExps ), ( 42 <= satAbsDiffExps ),
         ( 41 <= satAbsDiffExps ), ( 40 <= satAbsDiffExps ),
         ( 39 <= satAbsDiffExps ), ( 38 <= satAbsDiffExps ),
         ( 37 <= satAbsDiffExps ), ( 36 <= satAbsDiffExps ),
         ( 35 <= satAbsDiffExps ), ( 34 <= satAbsDiffExps ),
         ( 33 <= satAbsDiffExps ), ( 32 <= satAbsDiffExps ),
         ( 31 <= satAbsDiffExps ), ( 30 <= satAbsDiffExps ),
         ( 29 <= satAbsDiffExps ), ( 28 <= satAbsDiffExps ),
         ( 27 <= satAbsDiffExps ), ( 26 <= satAbsDiffExps ),
         ( 25 <= satAbsDiffExps ), ( 24 <= satAbsDiffExps ),
         ( 23 <= satAbsDiffExps ), ( 22 <= satAbsDiffExps ),
         ( 21 <= satAbsDiffExps ), ( 20 <= satAbsDiffExps ),
         ( 19 <= satAbsDiffExps ), ( 18 <= satAbsDiffExps ),
         ( 17 <= satAbsDiffExps ), ( 16 <= satAbsDiffExps ),
         ( 15 <= satAbsDiffExps ), ( 14 <= satAbsDiffExps ),
         ( 13 <= satAbsDiffExps ), ( 12 <= satAbsDiffExps ),
         ( 11 <= satAbsDiffExps ), ( 10 <= satAbsDiffExps ),
         (  9 <= satAbsDiffExps ), (  8 <= satAbsDiffExps ),
         (  7 <= satAbsDiffExps ), (  6 <= satAbsDiffExps ),
         (  5 <= satAbsDiffExps ), (  4 <= satAbsDiffExps ),
         (  3 <= satAbsDiffExps )};
//*** USE `wrapAbsDiffExps' AND MASK RESULT?
    assign far_alignedSigSmaller =
        {{sigSmaller, 2'b0}>>satAbsDiffExps,
         ( ( sigSmaller & far_roundExtraMask ) != 0 )};
    assign far_negAlignedSigSmaller =
        eqOpSigns ? {1'b0, far_alignedSigSmaller}
            : {1'b1, ~ far_alignedSigSmaller};
    assign far_sigSumIncr = ~ eqOpSigns;
    assign far_sigSum =
        {1'b0, sigLarger, 3'b0} + far_negAlignedSigSmaller + far_sigSumIncr;
    assign far_sumShift1  = far_sigSum[56];
    assign far_sumShift0  = ( far_sigSum[56:55] == 2'b01 );
    assign far_sumShiftM1 = ( far_sigSum[56:55] == 2'b00 );
    assign far_fractX =
          ( far_sumShift1 ? {far_sigSum[55:3], ( far_sigSum[2:0] != 0 )} : 0 )
        | ( far_sumShift0 ? {far_sigSum[54:2], ( far_sigSum[1:0] != 0 )} : 0 )
        | ( far_sumShiftM1 ? far_sigSum[53:0]                            : 0 );

    assign far_roundInexact = ( far_fractX[1:0] != 0 );
    assign far_roundIncr =
          ( roundingMode_nearest_even & far_fractX[1]                   )
        | ( roundingMode_minMag       & 0                               )
        | ( roundingMode_min          &   signLarger & far_roundInexact )
        | ( roundingMode_max          & ~ signLarger & far_roundInexact );
    assign far_roundEven =
        roundingMode_nearest_even & ( far_fractX[1:0] == 2'b10 );
    assign far_cFractYN = ( far_fractX>>2 ) + far_roundIncr;
    assign far_roundCarry = far_cFractYN[52];
//*** COMBINE EXP ADJUST ADDERS FOR CLOSE AND FAR PATHS?
    assign far_expAdjust =
          ( far_sumShift1 | ( far_sumShift0 & far_roundCarry ) ? 1       : 0 )
        | ( far_sumShiftM1 & ~ far_roundCarry         ? 12'b111111111111 : 0 );
    assign far_expY = expLarger + far_expAdjust;
    assign far_fractY =
        {far_cFractYN[51:1], far_cFractYN[0] & ~ far_roundEven};

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign isZeroY = doCloseSubMags & close_isZeroY;
    assign signY  = doCloseSubMags ? close_signY  : signLarger;
    assign expY   = doCloseSubMags ? close_expY   : far_expY;
    assign fractY = doCloseSubMags ? close_fractY : far_fractY;
    assign overflowY = ~ doCloseSubMags & ( far_expY[11:10] == 2'b11 );
    assign inexactY = doCloseSubMags ? close_roundInexact : far_roundInexact;

    assign overflowY_roundMagUp =
        roundingMode_nearest_even | ( roundingMode_min & signLarger )
            | ( roundingMode_max & ~ signLarger );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign addSpecial = isSpecialA | isSpecialB;
    assign addZeros = isZeroA & isZeroB;
    assign commonCase = ~ addSpecial & ~ addZeros;

    assign common_invalid = isInfA & isInfB & ~ eqOpSigns;
    assign invalid = isSigNaNA | isSigNaNB | common_invalid;
    assign overflow = commonCase & overflowY;
    assign inexact = overflow | ( commonCase & inexactY );

    assign notSpecial_isZeroOut = addZeros | isZeroY;
    assign isSatOut = overflow & ~ overflowY_roundMagUp;
    assign notNaN_isInfOut =
        isInfA | isInfB | ( overflow & overflowY_roundMagUp );
    assign isNaNOut = isNaNA | isNaNB | common_invalid;

    assign signOut =
          ( eqOpSigns              & signA   )
        | ( isNaNA                 & signA   )
        | ( ~ isNaNA & isNaNB      & opSignB )
        | ( isInfA & ~ isSpecialB  & signA   )
        | ( ~ isSpecialA & isInfB  & opSignB )
        | ( invalid                & 0       )
        | ( addZeros & ~ eqOpSigns & 0       )
        | ( commonCase             & signY   );
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

    assign exceptionFlags = {invalid, 1'b0, overflow, 1'b0, inexact};

endmodule

