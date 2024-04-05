
/*----------------------------------------------------------------------------
| `expSize' is size of exponent in usual format.  The recoded exponent size is
| `expSize+1'.  Likewise for `size'.
*----------------------------------------------------------------------------*/

// meanings of op-field values:
// 00:  a*b+c
// 01:  a*b-c
// 10: -a*b+c
// 11: -a*b-c


//*** THIS MODULE IS NOT FULLY OPTIMIZED.

`include "fpu_common.v"
`include "fpu_recoded.vh"

module
 mulAddSubRecodedFloatN( op, a, b, c, roundingMode, out, exceptionFlags );

    parameter expSize = 8;
    parameter sigSize = 24;

    localparam logSigSize = `ceilLog2( sigSize );
    localparam sigSumSize = sigSize * 3 + 3;
    localparam logSigSumSize = `ceilLog2( sigSumSize );
    localparam normSize = sigSize * 2 + 2;
    localparam logNormSize = `ceilLog2( normSize );
    localparam firstNormUnit = 1<<( logNormSize - 2 );
    localparam size = expSize + sigSize;
    localparam minExp = ( 1<<( expSize - 1 ) ) + 3 - sigSize;
    localparam minNormExp = ( 1<<( expSize - 1 ) ) + 2;

    input  [1:0]    op;
    input  [size:0] a, b, c;
    input  [1:0]    roundingMode;
    output [size:0] out;
    output [4:0]    exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire                     signA;
    wire [expSize:0]         expA;
    wire [sigSize-2:0]       fractA;
    wire                     isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [sigSize-1:0]       sigA;
    wire                     signB;
    wire [expSize:0]         expB;
    wire [sigSize-2:0]       fractB;
    wire                     isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [sigSize-1:0]       sigB;
    wire                     opSignC;
    wire [expSize:0]         expC;
    wire [sigSize-2:0]       fractC;
    wire                     isZeroC, isSpecialC, isInfC, isNaNC, isSigNaNC;
    wire [sigSize-1:0]       sigC;
    wire                     roundingMode_nearest_even, roundingMode_minMag;
    wire                     roundingMode_min, roundingMode_max;

    wire                     signProd, isZeroProd;
    wire [expSize+2:0]       sExpAlignedProd;
    wire [sigSize*2-1:0]     sigProd;

    wire                     doSubMags;
    wire [expSize+2:0]       sNatCAlignDist;
    wire                     CAlignDist_floor, CAlignDist_0, isCDominant;
    wire [logSigSumSize-1:0] CAlignDist;
    wire [expSize+2:0]       sExpSum;
    wire [sigSize-1:0]       CExtraMask, negSigC;
    wire [sigSumSize-1:0]    alignedNegSigC;
    wire [sigSumSize-1:0]    sigSum;
    wire [normSize-1:0]      estNormPos_a, estNormPos_b;
    wire [logSigSumSize-1:0] estNormPos_dist;
    wire [normSize-1:0]      estNormNeg_a, estNormNeg_b;
    wire [logSigSumSize-1:0] estNormNeg_dist;
    wire [1:0]               firstReduceSigSum;
    wire [sigSumSize-1:0]    notSigSum;
    wire [1:0]               firstReduceNotSigSum;
    wire [logSigSize-1:0]    CDom_estNormDist;
    wire [sigSize+firstNormUnit+1:0]
                             CDom_firstNormAbsSigSum;
    wire [sigSize+firstNormUnit+1:0]
                             notCDom_pos_firstNormAbsSigSum;
    wire [sigSize+firstNormUnit+2:0]
                             notCDom_neg_cFirstNormAbsSigSum;
    wire                     notCDom_signSigSum, doNegSignSum;
    wire [logSigSumSize-1:0] estNormDist;
    wire [sigSize+firstNormUnit+2:0]
                             cFirstNormAbsSigSum;
    wire                     doIncrSig;
    wire [logNormSize-3:0]   normTo2ShiftDist;
    wire [firstNormUnit-1:0] absSigSumExtraMask;
    wire [sigSize+3:0]       sigX3;
    wire                     sigX3Shift1;
    wire [expSize+2:0]       sExpX3;
    wire                     isZeroY, signY;
    wire [sigSize+2:0]       roundMask, roundPosMask;
    wire                     roundPosBit, anyRoundExtra, allRoundExtra;
    wire                     anyRound, allRound;
    wire                     roundDirectUp, roundUp, roundEven, roundInexact;
    wire [sigSize+1:0]       roundUp_sigY3, sigY3;
    wire [expSize+1:0]       sExpY;
    wire [expSize:0]         expY;
    wire [sigSize-2:0]       fractY;
    wire                     overflowY, totalUnderflowY, underflowY;
    wire                     inexactY;
    wire                     overflowY_roundMagUp;

    wire                     mulSpecial, addSpecial, notSpecial_addZeros;
    wire                     commonCase;
    wire                     notSigNaN_invalid, invalid;
    wire                     overflow, underflow, inexact;
    wire                     notSpecial_isZeroOut, isSatOut;
    wire                     notNaN_isInfOut, isNaNOut;
    wire                     signOut;
    wire [expSize:0]         expOut;
    wire [sigSize-2:0]       fractOut;
    wire [size:0]            out;
    wire [4:0]               exceptionFlags;

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

    assign opSignC = c[size] ^ op[0];
    assign expC    = c[size-1:sigSize-1];
    assign fractC  = c[sigSize-2:0];
    assign isZeroC = ( expC[expSize:expSize-2] == 3'b000 );
    assign isSpecialC = ( expC[expSize:expSize-1] == 2'b11 );
    assign isInfC = isSpecialC & ~ expC[expSize-2];
    assign isNaNC = isSpecialC &   expC[expSize-2];
    assign isSigNaNC = isNaNC & ~ fractC[sigSize-2];
    assign sigC = {~ isZeroC, fractC};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signProd = signA ^ signB ^ op[1];
    assign isZeroProd = isZeroA | isZeroB;
    wire [29-expSize:0] null7;
    assign {null7,sExpAlignedProd} =
        expA + {{3{~ expB[expSize]}}, expB[expSize-1:0]} + (sigSize+3);

    assign sigProd = sigA * sigB;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign doSubMags = signProd ^ opSignC;

    assign sNatCAlignDist = sExpAlignedProd - expC;
    assign CAlignDist_floor = isZeroProd | sNatCAlignDist[expSize+2];
    assign CAlignDist_0 =
        CAlignDist_floor | ( sNatCAlignDist[expSize+1:0] == 0 );
    assign isCDominant =
        ~ isZeroC
            & ( CAlignDist_floor
                    | ( sNatCAlignDist[expSize+1:0] < (sigSize+1) ) );
    wire [31-logSigSumSize:0] null6;
    assign {null6,CAlignDist} =
          CAlignDist_floor ? 0
        : ( sNatCAlignDist[expSize+1:0] < (sigSumSize-1) ) ? sNatCAlignDist
        : (sigSumSize-1);
    assign sExpSum = CAlignDist_floor ? expC : sExpAlignedProd;
//*** USE `sNatCAlignDist'?
    assign CExtraMask[sigSize-1] = (sigSumSize-1) == CAlignDist;
    generate
        genvar i;
        for(i = sigSumSize-2; i >= normSize+1; i = i-1) begin : loop0
            assign CExtraMask[i-(normSize+1)] = i <= CAlignDist;
        end
    endgenerate

    assign negSigC = doSubMags ? ~ sigC : sigC;
    wire [normSize+sigSize-1:0] null5;
    assign {null5,alignedNegSigC} =
        {{{(sigSumSize-1){doSubMags}}, negSigC, {normSize{doSubMags}}}
             >>CAlignDist,
         ( ( sigC & CExtraMask ) != 0 ) ^ doSubMags};

    assign sigSum = alignedNegSigC + ( sigProd<<1 );

    assign estNormPos_a = {doSubMags, alignedNegSigC[normSize-1:1]};
    assign estNormPos_b = sigProd;
    estNormDistPNPosSumS #(sigSize, normSize)
        estNormPosSigSum( estNormPos_a, estNormPos_b, estNormPos_dist );

    assign estNormNeg_a = {1'b1, alignedNegSigC[normSize-1:1]};
    assign estNormNeg_b = sigProd;
    estNormDistPNNegSumS #(sigSize, normSize)
        estNormNegSigSum( estNormNeg_a, estNormNeg_b, estNormNeg_dist );

    assign firstReduceSigSum =
        {( sigSum[normSize-firstNormUnit-1:normSize-firstNormUnit*2] != 0 ),
         ( sigSum[normSize-firstNormUnit*2-1:0] != 0 )};
    assign notSigSum = ~ sigSum;
    assign firstReduceNotSigSum =
        {( notSigSum[normSize-firstNormUnit-1:normSize-firstNormUnit*2] != 0 ),
         ( notSigSum[normSize-firstNormUnit*2-1:0] != 0 )};
//*** USE RESULT OF `CAlignDest - 1' TO TEST FOR ZERO?
    wire [logSigSumSize-logSigSize-1:0] null4;
    assign {null4,CDom_estNormDist} =
        CAlignDist_0 | doSubMags ? CAlignDist : CAlignDist - 1'b1;
    assign CDom_firstNormAbsSigSum =
          ( ~ doSubMags & ~ CDom_estNormDist[logNormSize-2]
            ? {sigSum[sigSumSize-1:normSize-firstNormUnit],
               ( firstReduceSigSum != 0 )}
            : 0
          )
        | ( ~ doSubMags & CDom_estNormDist[logNormSize-2]
            ? {sigSum[sigSumSize-firstNormUnit-1:normSize-firstNormUnit*2],
               firstReduceSigSum[0]}
            : 0
          )
        | ( doSubMags & ~ CDom_estNormDist[logNormSize-2]
            ? {notSigSum[sigSumSize-1:normSize-firstNormUnit],
               ( firstReduceNotSigSum != 0 )}
            : 0
          )
        | ( doSubMags & CDom_estNormDist[logNormSize-2]
            ? {notSigSum[sigSumSize-firstNormUnit-1:normSize-firstNormUnit*2],
               firstReduceNotSigSum[0]}
            : 0
          );
    /*------------------------------------------------------------------------
    | (For this case, bits above `sigSum[normSize]' are never interesting.
    | Also, if there is any significant cancellation, then `sigSum[0]' must
    | equal `doSubMags'.)
    *------------------------------------------------------------------------*/
    wire [sigSize+firstNormUnit+1:0] tmp0, tmp1;
    generate
        if(2 < (normSize-firstNormUnit*3)) begin : tmp00
            assign tmp0 = {sigSum
                       [sigSumSize-firstNormUnit*2-1:normSize-firstNormUnit*3],
                   doSubMags ? ( notSigSum[normSize-firstNormUnit*3-1:1] == 0 )
                       : ( sigSum[normSize-firstNormUnit*3-1:1] != 0 )};
        end else if(firstNormUnit*3 > sigSize*2) begin : tmp01
            assign tmp0 = {sigSum[sigSumSize-firstNormUnit*2-1:1],
                   {(firstNormUnit*3-sigSize*2){doSubMags}}};
        end else begin : tmp02
            assign tmp0 = sigSum[sigSumSize-firstNormUnit*2-1:1];
        end

        if(firstNormUnit*5+1 < sigSumSize) begin : tmp10
            assign tmp1 = ( estNormPos_dist[logNormSize-1:logNormSize-3]
                            == 3'b010 )
                          ? {sigSum[sigSumSize-firstNormUnit*5-1:1],
                             {(firstNormUnit*6-sigSize*2){doSubMags}}} :
                             {sigSize+firstNormUnit+2{1'b0}};
        end else begin : tmp11
            assign tmp1 = {sigSize+firstNormUnit+2{1'b0}};
        end
    endgenerate

    assign notCDom_pos_firstNormAbsSigSum =
          ( ( ( firstNormUnit*5+1 < sigSumSize )
              ? ( estNormPos_dist[logNormSize-1:logNormSize-3] == 3'b011 )
              : ( estNormPos_dist[logNormSize-1:logNormSize-2] == 2'b01 )
            )
            ? {sigSum[normSize:normSize-firstNormUnit*2],
               doSubMags ? ~ firstReduceNotSigSum[0]
                   : firstReduceSigSum[0]}
            : 0
          )
        | ( ( estNormPos_dist[logNormSize-1:logNormSize-2] == 2'b10 )
            ? tmp0 : 0
          )
        | ( ( estNormPos_dist[logNormSize-1:logNormSize-2] == 2'b11 )
            ? {sigSum[sigSumSize-firstNormUnit*3-1:1],
               {(firstNormUnit*4-sigSize*2){doSubMags}}}
            : 0
          )
        | ( ( estNormPos_dist[logNormSize-1:logNormSize-2] == 2'b00 )
            ? {sigSum[sigSumSize-firstNormUnit*4-1:1],
               {(firstNormUnit*5-sigSize*2){doSubMags}}}
            : 0
          )
        | ( tmp1
          );
    /*------------------------------------------------------------------------
    | (For this case, bits above `notSigSum[normSize-1]' are never
    | interesting.  Also, if there is any significant cancellation, then
    | `notSigSum[0]' must be zero.)
    *------------------------------------------------------------------------*/
    wire [sigSize+firstNormUnit+2:0] tmp2, tmp3;
    generate
        if(2 < (normSize-firstNormUnit*3)) begin : tmp20
            assign tmp2 = {notSigSum
                       [sigSumSize-firstNormUnit*2:normSize-firstNormUnit*3],
                   ( notSigSum[normSize-firstNormUnit*3-1:1] != 0 )};
        end else begin : tmp21
            assign tmp2 = notSigSum[sigSumSize-firstNormUnit*2:1]
                      <<(firstNormUnit*3-sigSize*2);
        end

        if(firstNormUnit*5 < sigSumSize) begin : tmp30
            assign tmp3 = ( estNormNeg_dist[logNormSize-1:logNormSize-3]
                            == 3'b010 )
                             ? notSigSum[sigSumSize-firstNormUnit*5:1]
                               <<(firstNormUnit*6-sigSize*2) : 0;
        end else begin : tmp31
            assign tmp3 = 0;
        end
    endgenerate

    assign notCDom_neg_cFirstNormAbsSigSum =
          ( ( ( firstNormUnit*5 < sigSumSize )
              ? ( estNormNeg_dist[logNormSize-1:logNormSize-3] == 3'b011 )
              : ( estNormNeg_dist[logNormSize-1:logNormSize-2] == 2'b01 )
            )
            ? {notSigSum[normSize-1:normSize-firstNormUnit*2],
               firstReduceNotSigSum[0]}
            : 0
          )
        | ( ( estNormNeg_dist[logNormSize-1:logNormSize-2] == 2'b10 )
            ? tmp2
            : 0
          )
        | ( ( estNormNeg_dist[logNormSize-1:logNormSize-2] == 2'b11 )
            ? notSigSum[sigSumSize-firstNormUnit*3:1]
                  <<(firstNormUnit*4-sigSize*2)
            : 0
          )
        | ( ( estNormNeg_dist[logNormSize-1:logNormSize-2] == 2'b00 )
            ? notSigSum[sigSumSize-firstNormUnit*4:1]
                  <<(firstNormUnit*5-sigSize*2)
            : 0
          )
        | ( tmp3
          );
    assign notCDom_signSigSum = sigSum[normSize+1];
    assign doNegSignSum =
        isCDominant ? doSubMags & ~ isZeroC : notCDom_signSigSum;
    assign estNormDist =
          (   isCDominant                        ? CDom_estNormDist : 1'b0 )
        | ( ~ isCDominant & ~ notCDom_signSigSum ? estNormPos_dist  : 1'b0 )
        | ( ~ isCDominant &   notCDom_signSigSum ? estNormNeg_dist  : 1'b0 );
    assign cFirstNormAbsSigSum =
          ( isCDominant ? CDom_firstNormAbsSigSum : 0 )
        | ( ~ isCDominant & ~ notCDom_signSigSum
            ? notCDom_pos_firstNormAbsSigSum
            : 0
          )
        | ( ~ isCDominant & notCDom_signSigSum
            ? notCDom_neg_cFirstNormAbsSigSum
            : 0
          );
    assign doIncrSig = ~ isCDominant & ~ notCDom_signSigSum & doSubMags;
    assign normTo2ShiftDist = ~ estNormDist[logNormSize-3:0];

    generate
        for(i = 0; i <= firstNormUnit-2; i=i+1) begin : loop1
            assign absSigSumExtraMask[firstNormUnit-1-i] =
                estNormDist[logNormSize-3:0] <= i;
        end
    endgenerate
    assign absSigSumExtraMask[0] = 1'b1;

    wire [firstNormUnit-2:0] null3;
    assign {null3,sigX3} =
        {cFirstNormAbsSigSum[sigSize+firstNormUnit+2:1]>>normTo2ShiftDist,
         doIncrSig
         ? ( ( ~ cFirstNormAbsSigSum[firstNormUnit-1:0] & absSigSumExtraMask )
                 == 0 )
         : ( ( cFirstNormAbsSigSum[firstNormUnit-1:0] & absSigSumExtraMask )
                 != 0 )};
    assign sigX3Shift1 = ( sigX3[sigSize+3:sigSize+2] == 0 );
    assign sExpX3 = sExpSum - estNormDist;

    assign isZeroY = ( sigX3[sigSize+3:sigSize+1] == 0 );
    assign signY = ~ isZeroY & ( signProd ^ doNegSignSum );

    generate
        for(i = minExp-1; i <= minNormExp-1; i=i+1) begin : loop2
          assign roundMask[sigSize+1+minExp-i] = sExpX3[expSize+2] | (sExpX3[expSize+1:0] <= i);
        end
    endgenerate
    assign roundMask[2] = sExpX3[expSize+2] | ( sExpX3[expSize+1:0] <= minNormExp ) | sigX3[sigSize+2];
    assign roundMask[1:0] = 2'b11;

    assign roundPosMask = ~ (roundMask>>1) & roundMask;
    assign roundPosBit = ( ( sigX3 & roundPosMask ) != 0 );
    assign anyRoundExtra = ( (   sigX3 & roundMask>>1 ) != 0 );
    assign allRoundExtra = ( ( ~ sigX3 & roundMask>>1 ) == 0 );
    assign anyRound = roundPosBit | anyRoundExtra;
    assign allRound = roundPosBit & allRoundExtra;
    assign roundDirectUp = signY ? roundingMode_min : roundingMode_max;
    assign roundUp =
          ( ~ doIncrSig & roundingMode_nearest_even
                                                & roundPosBit & anyRoundExtra )
        | ( ~ doIncrSig & roundDirectUp             & anyRound    )
        | (   doIncrSig                             & allRound    )
        | (   doIncrSig & roundingMode_nearest_even & roundPosBit )
        | (   doIncrSig & roundDirectUp             & 1'b1        );
    assign roundEven =
        doIncrSig
            ? roundingMode_nearest_even & ~ roundPosBit &   allRoundExtra
            : roundingMode_nearest_even &   roundPosBit & ~ anyRoundExtra;
    assign roundInexact = doIncrSig ? ~ allRound : anyRound;
    assign roundUp_sigY3 = ( sigX3[sigSize+3:2] | {1'b0,roundMask[sigSize+2:2]} ) + 1'b1;
    wire [1:0] null1;
    assign {null1,sigY3} =
          ( ~ roundUp & ~ roundEven ? ( sigX3 & ~ roundMask )>>2         : 1'b0 )
        | ( roundUp                 ? roundUp_sigY3                      : 1'b0 )
        | ( roundEven               ? roundUp_sigY3 & ~ ( roundMask>>1 ) : 1'b0 );
//*** HANDLE DIFFERENTLY?  (NEED TO ACCOUNT FOR ROUND-EVEN ZEROING MSB.)
    wire null0;
    assign {null0,sExpY} =
          ( sigY3[sigSize+1]                  ? sExpX3 + 1'b1 : 1'b0 )
        | ( sigY3[sigSize]                    ? sExpX3        : 1'b0 )
        | ( ( sigY3[sigSize+1:sigSize] == 0 ) ? sExpX3 - 1'b1 : 1'b0 );
    assign expY = sExpY[expSize:0];
    assign fractY = sigX3Shift1 ? sigY3[sigSize-2:0] : sigY3[sigSize-1:1];

    assign overflowY = ( sExpY[expSize+1:expSize-1] == 3'b011 );
//*** HANDLE DIFFERENTLY?  (NEED TO ACCOUNT FOR ROUND-EVEN ZEROING MSB.)
    assign totalUnderflowY = sExpY[expSize+1] | ( sExpY[expSize:0] < minExp );
    assign underflowY =
        ( sExpX3[expSize+2]
              | ( sExpX3[expSize+1:0]
                      <= ( sigX3Shift1 ? minNormExp : (minNormExp-1) ) ) )
            & roundInexact;
    assign inexactY = roundInexact;

    assign overflowY_roundMagUp =
        roundingMode_nearest_even | ( roundingMode_min & signY )
            | ( roundingMode_max & ~ signY );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign mulSpecial = isSpecialA | isSpecialB;
    assign addSpecial = mulSpecial | isSpecialC;
    assign notSpecial_addZeros = isZeroProd & isZeroC;
    assign commonCase = ~ addSpecial & ~ notSpecial_addZeros;

    assign notSigNaN_invalid =
          ( isInfA & isZeroB )
        | ( isZeroA & isInfB )
        | ( ~ isNaNA & ~ isNaNB & ( isInfA | isInfB ) & isInfC & doSubMags );
    assign invalid = isSigNaNA | isSigNaNB | isSigNaNC | notSigNaN_invalid;
    assign overflow = commonCase & overflowY;
    assign underflow = commonCase & underflowY;
    assign inexact = overflow | ( commonCase & inexactY );

    assign notSpecial_isZeroOut =
        notSpecial_addZeros | isZeroY | totalUnderflowY;
    assign isSatOut = overflow & ~ overflowY_roundMagUp;
    assign notNaN_isInfOut =
        isInfA | isInfB | isInfC | ( overflow & overflowY_roundMagUp );
    assign isNaNOut = isNaNA | isNaNB | isNaNC | notSigNaN_invalid;

    assign signOut =
          ( ~ doSubMags                                    & opSignC  )
        | ( ( isNaNA | isNaNB )                            & signProd )
        | ( ~ isNaNA & ~ isNaNB & isNaNC                   & opSignC  )
        | ( mulSpecial & ~ isSpecialC                      & signProd )
        | ( ~ mulSpecial & isSpecialC                      & opSignC  )
        | ( ~ mulSpecial & notSpecial_addZeros & doSubMags & 1'b0     )
        | ( commonCase                                     & signY    );
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

