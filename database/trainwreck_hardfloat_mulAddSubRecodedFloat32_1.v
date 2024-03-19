
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

//*** DO THIS ANOTHER WAY?
`define round_nearest_even 2'b00
`define round_minMag       2'b01
`define round_min          2'b10
`define round_max          2'b11

module
 mulAddSubRecodedFloat32( op, a, b, c, roundingMode, out, exceptionFlags );

    input  [1:0]  op;
    input  [32:0] a, b, c;
    input  [1:0]  roundingMode;
    output [32:0] out;
    output [4:0]  exceptionFlags;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    wire         signA;
    wire [8:0]   expA;
    wire [22:0]  fractA;
    wire         isZeroA, isSpecialA, isInfA, isNaNA, isSigNaNA;
    wire [23:0]  sigA;
    wire         signB;
    wire [8:0]   expB;
    wire [22:0]  fractB;
    wire         isZeroB, isSpecialB, isInfB, isNaNB, isSigNaNB;
    wire [23:0]  sigB;
    wire         opSignC;
    wire [8:0]   expC;
    wire [22:0]  fractC;
    wire         isZeroC, isSpecialC, isInfC, isNaNC, isSigNaNC;
    wire [23:0]  sigC;
    wire         roundingMode_nearest_even, roundingMode_minMag;
    wire         roundingMode_min, roundingMode_max;

    wire         signProd, isZeroProd;
    wire [10:0]  sExpAlignedProd;
    wire [47:0]  sigProd;

    wire         doSubMags;
    wire [10:0]  sNatCAlignDist;
    wire         CAlignDist_floor, CAlignDist_0, isCDominant;
    wire [6:0]   CAlignDist;
    wire [10:0]  sExpSum;
    wire [23:0]  CExtraMask, negSigC;
    wire [74:0]  alignedNegSigC;
    wire [74:0]  sigSum;
    wire [49:0]  estNormPos_a, estNormPos_b;
    wire [6:0]   estNormPos_dist;
    wire [49:0]  estNormNeg_a, estNormNeg_b;
    wire [6:0]   estNormNeg_dist;
    wire [1:0]   firstReduceSigSum;
    wire [74:0]  notSigSum;
    wire [1:0]   firstReduceNotSigSum;
    wire [4:0]   CDom_estNormDist;
    wire [41:0]  CDom_firstNormAbsSigSum, notCDom_pos_firstNormAbsSigSum;
    wire [42:0]  notCDom_neg_cFirstNormAbsSigSum;
    wire         notCDom_signSigSum, doNegSignSum;
    wire [6:0]   estNormDist;
    wire [42:0]  cFirstNormAbsSigSum;
    wire         doIncrSig;
    wire [3:0]   normTo2ShiftDist;
    wire [15:0]  absSigSumExtraMask;
    wire [27:0]  sigX3;
    wire         sigX3Shift1;
    wire [10:0]  sExpX3;
    wire         isZeroY, signY;
    wire [26:0]  roundMask, roundPosMask;
    wire         roundPosBit, anyRoundExtra, allRoundExtra, anyRound, allRound;
    wire         roundDirectUp, roundUp, roundEven, roundInexact;
    wire [25:0]  roundUp_sigY3, sigY3;
    wire [9:0]   sExpY;
    wire [8:0]   expY;
    wire [22:0]  fractY;
    wire         overflowY, totalUnderflowY, underflowY, inexactY;
    wire         overflowY_roundMagUp;

    wire         mulSpecial, addSpecial, notSpecial_addZeros, commonCase;
    wire         notSigNaN_invalid, invalid, overflow, underflow, inexact;
    wire         notSpecial_isZeroOut, isSatOut, notNaN_isInfOut, isNaNOut;
    wire         signOut;
    wire [8:0]   expOut;
    wire [22:0]  fractOut;
    wire [32:0]  out;
    wire [4:0]   exceptionFlags;

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

    assign opSignC = c[32] ^ op;
    assign expC    = c[31:23];
    assign fractC  = c[22:0];
    assign isZeroC = ( expC[8:6] == 3'b000 );
    assign isSpecialC = ( expC[8:7] == 2'b11 );
    assign isInfC = isSpecialC & ~ expC[6];
    assign isNaNC = isSpecialC &   expC[6];
    assign isSigNaNC = isNaNC & ~ fractC[22];
    assign sigC = {~ isZeroC, fractC};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signProd = signA ^ signB;
    assign isZeroProd = isZeroA | isZeroB;
    assign sExpAlignedProd = expA + {{3{~ expB[8]}}, expB[7:0]} + 27;

    assign sigProd = sigA * sigB;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign doSubMags = signProd ^ opSignC;

    assign sNatCAlignDist = sExpAlignedProd - expC;
    assign CAlignDist_floor = isZeroProd | sNatCAlignDist[10];
    assign CAlignDist_0 = CAlignDist_floor | ( sNatCAlignDist[9:0] == 0 );
    assign isCDominant =
        ~ isZeroC & ( CAlignDist_floor | ( sNatCAlignDist[9:0] < 25 ) );
    assign CAlignDist =
          CAlignDist_floor ? 0
        : ( sNatCAlignDist[9:0] < 74 ) ? sNatCAlignDist
        : 74;
    assign sExpSum = CAlignDist_floor ? expC : sExpAlignedProd;
//*** USE `sNatCAlignDist'?
    assign CExtraMask =
        {( 74 == CAlignDist ), ( 73 <= CAlignDist ),
         ( 72 <= CAlignDist ), ( 71 <= CAlignDist ),
         ( 70 <= CAlignDist ), ( 69 <= CAlignDist ),
         ( 68 <= CAlignDist ), ( 67 <= CAlignDist ),
         ( 66 <= CAlignDist ), ( 65 <= CAlignDist ),
         ( 64 <= CAlignDist ), ( 63 <= CAlignDist ),
         ( 62 <= CAlignDist ), ( 61 <= CAlignDist ),
         ( 60 <= CAlignDist ), ( 59 <= CAlignDist ),
         ( 58 <= CAlignDist ), ( 57 <= CAlignDist ),
         ( 56 <= CAlignDist ), ( 55 <= CAlignDist ),
         ( 54 <= CAlignDist ), ( 53 <= CAlignDist ),
         ( 52 <= CAlignDist ), ( 51 <= CAlignDist )};
    assign negSigC = doSubMags ? ~ sigC : sigC;
    assign alignedNegSigC =
        {{{74{doSubMags}}, negSigC, {50{doSubMags}}}>>CAlignDist,
         ( ( sigC & CExtraMask ) != 0 ) ^ doSubMags};

    assign sigSum = alignedNegSigC + ( sigProd<<1 );

    assign estNormPos_a = {doSubMags, alignedNegSigC[49:1]};
    assign estNormPos_b = sigProd;
    estNormDistP24PosSum50
        estNormPosSigSum( estNormPos_a, estNormPos_b, estNormPos_dist );

    assign estNormNeg_a = {1'b1, alignedNegSigC[49:1]};
    assign estNormNeg_b = sigProd;
    estNormDistP24NegSum50
        estNormNegSigSum( estNormNeg_a, estNormNeg_b, estNormNeg_dist );

    assign firstReduceSigSum = {( sigSum[33:18] != 0 ), ( sigSum[17:0] != 0 )};
    assign notSigSum = ~ sigSum;
    assign firstReduceNotSigSum =
        {( notSigSum[33:18] != 0 ), ( notSigSum[17:0] != 0 )};
//*** USE RESULT OF `CAlignDest - 1' TO TEST FOR ZERO?
    assign CDom_estNormDist =
        CAlignDist_0 | doSubMags ? CAlignDist : CAlignDist - 1;
    assign CDom_firstNormAbsSigSum =
          ( ~ doSubMags & ~ CDom_estNormDist[4]
            ? {sigSum[74:34], ( firstReduceSigSum != 0 )}
            : 0
          )
        | ( ~ doSubMags & CDom_estNormDist[4]
            ? {sigSum[58:18], firstReduceSigSum[0]}
            : 0
          )
        | ( doSubMags & ~ CDom_estNormDist[4]
            ? {notSigSum[74:34], ( firstReduceNotSigSum != 0 )}
            : 0
          )
        | ( doSubMags & CDom_estNormDist[4]
            ? {notSigSum[58:18], firstReduceNotSigSum[0]}
            : 0
          );
    /*------------------------------------------------------------------------
    | (For this case, bits above `sigSum[50]' are never interesting.  Also,
    | if there is any significant cancellation, then `sigSum[0]' must equal
    | `doSubMags'.)
    *------------------------------------------------------------------------*/
    assign notCDom_pos_firstNormAbsSigSum =
          ( ( estNormPos_dist[5:4] == 2'b01 )
            ? {sigSum[50:18],
               doSubMags ? ~ firstReduceNotSigSum[0] : firstReduceSigSum[0]}
            : 0
          )
        | ( ( estNormPos_dist[5:4] == 2'b10 ) ? sigSum[42:1] : 0 )
        | ( ( estNormPos_dist[5:4] == 2'b11 ) ? {sigSum[26:1], {16{doSubMags}}}
                : 0 )
        | ( ( estNormPos_dist[5:4] == 2'b00 ) ? {sigSum[10:1], {32{doSubMags}}}
                : 0 );
    /*------------------------------------------------------------------------
    | (For this case, bits above `notSigSum[49]' are never interesting.  Also,
    | if there is any significant cancellation, then `notSigSum[0]' must be
    | zero.)
    *------------------------------------------------------------------------*/
    assign notCDom_neg_cFirstNormAbsSigSum =
          ( ( estNormNeg_dist[5:4] == 2'b01 )
            ? {10'b0, notSigSum[49:18], firstReduceNotSigSum[0]}
            : 0
          )
        | ( ( estNormNeg_dist[5:4] == 2'b10 ) ? notSigSum[43:1]     : 0 )
        | ( ( estNormNeg_dist[5:4] == 2'b11 ) ? notSigSum[27:1]<<16 : 0 )
        | ( ( estNormNeg_dist[5:4] == 2'b00 ) ? notSigSum[11:1]<<32 : 0 );
    assign notCDom_signSigSum = sigSum[51];
    assign doNegSignSum =
        isCDominant ? doSubMags & ~ isZeroC : notCDom_signSigSum;
    assign estNormDist =
          (   isCDominant                        ? CDom_estNormDist : 0 )
        | ( ~ isCDominant & ~ notCDom_signSigSum ? estNormPos_dist  : 0 )
        | ( ~ isCDominant &   notCDom_signSigSum ? estNormNeg_dist  : 0 );
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
    assign normTo2ShiftDist = ~ estNormDist[3:0];
    assign absSigSumExtraMask =
        {( estNormDist[3:0] ==  0 ), ( estNormDist[3:0] <=  1 ),
         ( estNormDist[3:0] <=  2 ), ( estNormDist[3:0] <=  3 ),
         ( estNormDist[3:0] <=  4 ), ( estNormDist[3:0] <=  5 ),
         ( estNormDist[3:0] <=  6 ), ( estNormDist[3:0] <=  7 ),
         ( estNormDist[3:0] <=  8 ), ( estNormDist[3:0] <=  9 ),
         ( estNormDist[3:0] <= 10 ), ( estNormDist[3:0] <= 11 ),
         ( estNormDist[3:0] <= 12 ), ( estNormDist[3:0] <= 13 ),
         ( estNormDist[3:0] <= 14 ), 1'b1};
    assign sigX3 =
        {cFirstNormAbsSigSum[42:1]>>normTo2ShiftDist,
         doIncrSig
         ? ( ( ~ cFirstNormAbsSigSum[15:0] & absSigSumExtraMask ) == 0 )
         : ( (   cFirstNormAbsSigSum[15:0] & absSigSumExtraMask ) != 0 )};
    assign sigX3Shift1 = ( sigX3[27:26] == 0 );
    assign sExpX3 = sExpSum - estNormDist;

    assign isZeroY = ( sigX3[27:25] == 0 );
    assign signY = ~ isZeroY & ( signProd ^ doNegSignSum );
    assign roundMask =
          sExpX3[10] ? 27'h7FFFFFF
        : {( sExpX3[9:0] <= 10'b0001101010 ),
           ( sExpX3[9:0] <= 10'b0001101011 ),
           ( sExpX3[9:0] <= 10'b0001101100 ),
           ( sExpX3[9:0] <= 10'b0001101101 ),
           ( sExpX3[9:0] <= 10'b0001101110 ),
           ( sExpX3[9:0] <= 10'b0001101111 ),
           ( sExpX3[9:0] <= 10'b0001110000 ),
           ( sExpX3[9:0] <= 10'b0001110001 ),
           ( sExpX3[9:0] <= 10'b0001110010 ),
           ( sExpX3[9:0] <= 10'b0001110011 ),
           ( sExpX3[9:0] <= 10'b0001110100 ),
           ( sExpX3[9:0] <= 10'b0001110101 ),
           ( sExpX3[9:0] <= 10'b0001110110 ),
           ( sExpX3[9:0] <= 10'b0001110111 ),
           ( sExpX3[9:0] <= 10'b0001111000 ),
           ( sExpX3[9:0] <= 10'b0001111001 ),
           ( sExpX3[9:0] <= 10'b0001111010 ),
           ( sExpX3[9:0] <= 10'b0001111011 ),
           ( sExpX3[9:0] <= 10'b0001111100 ),
           ( sExpX3[9:0] <= 10'b0001111101 ),
           ( sExpX3[9:0] <= 10'b0001111110 ),
           ( sExpX3[9:0] <= 10'b0001111111 ),
           ( sExpX3[9:0] <= 10'b0010000000 ),
           ( sExpX3[9:0] <= 10'b0010000001 ),
           ( sExpX3[9:0] <= 10'b0010000010 ) | sigX3[26],
           2'b11};
    assign roundPosMask = ~ {1'b0, roundMask>>1} & roundMask;
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
        | (   doIncrSig & roundDirectUp             & 1           );
    assign roundEven =
        doIncrSig
            ? roundingMode_nearest_even & ~ roundPosBit &   allRoundExtra
            : roundingMode_nearest_even &   roundPosBit & ~ anyRoundExtra;
    assign roundInexact = doIncrSig ? ~ allRound : anyRound;
    assign roundUp_sigY3 = ( sigX3>>2 | roundMask>>2 ) + 1;
    assign sigY3 =
          ( ~ roundUp & ~ roundEven ? ( sigX3 & ~ roundMask )>>2         : 0 )
        | ( roundUp                 ? roundUp_sigY3                      : 0 )
        | ( roundEven               ? roundUp_sigY3 & ~ ( roundMask>>1 ) : 0 );
//*** HANDLE DIFFERENTLY?  (NEED TO ACCOUNT FOR ROUND-EVEN ZEROING MSB.)
    assign sExpY =
          ( sigY3[25]             ? sExpX3 + 1 : 0 )
        | ( sigY3[24]             ? sExpX3     : 0 )
        | ( ( sigY3[25:24] == 0 ) ? sExpX3 - 1 : 0 );
    assign expY = sExpY[8:0];
    assign fractY = sigX3Shift1 ? sigY3[22:0] : sigY3[23:1];

    assign overflowY = ( sExpY[9:7] == 3'b011 );
//*** HANDLE DIFFERENTLY?  (NEED TO ACCOUNT FOR ROUND-EVEN ZEROING MSB.)
    assign totalUnderflowY = sExpY[9] | ( sExpY[8:0] < 9'b001101011 );
    assign underflowY =
        ( sExpX3[10]
              | ( sExpX3[9:0]
                      <= ( sigX3Shift1 ? 10'b0010000010 : 10'b0010000001 ) ) )
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
        | ( ~ mulSpecial & notSpecial_addZeros & doSubMags & 0        )
        | ( commonCase                                     & signY    );
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

