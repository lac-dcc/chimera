
//*** THIS MODULE HAS NOT BEEN FULLY OPTIMIZED.

//*** DO THIS ANOTHER WAY?
`define round_nearest_even 2'b00
`define round_minMag       2'b01
`define round_min          2'b10
`define round_max          2'b11

module
 mulAddSubRecodedFloat64( op, a, b, c, roundingMode, out, exceptionFlags );

    input  [1:0]  op;
    input  [64:0] a, b, c;
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
    wire         opSignC;
    wire [11:0]  expC;
    wire [51:0]  fractC;
    wire         isZeroC, isSpecialC, isInfC, isNaNC, isSigNaNC;
    wire [52:0]  sigC;
    wire         roundingMode_nearest_even, roundingMode_minMag;
    wire         roundingMode_min, roundingMode_max;

    wire         signProd, isZeroProd;
    wire [13:0]  sExpAlignedProd;
    wire [105:0] sigProd;

    wire         doSubMags;
    wire [13:0]  sNatCAlignDist;
    wire         CAlignDist_floor, CAlignDist_0, isCDominant;
    wire [7:0]   CAlignDist;
    wire [13:0]  sExpSum;
    wire [52:0]  CExtraMask, negSigC;
    wire [161:0] alignedNegSigC;
    wire [161:0] sigSum;
    wire [107:0] estNormPos_a, estNormPos_b;
    wire [7:0]   estNormPos_dist;
    wire [107:0] estNormNeg_a, estNormNeg_b;
    wire [7:0]   estNormNeg_dist;
    wire [1:0]   firstReduceSigSum;
    wire [161:0] notSigSum;
    wire [1:0]   firstReduceNotSigSum;
    wire [5:0]   CDom_estNormDist;
    wire [86:0]  CDom_firstNormAbsSigSum, notCDom_pos_firstNormAbsSigSum;
    wire [87:0]  notCDom_neg_cFirstNormAbsSigSum;
    wire         notCDom_signSigSum, doNegSignSum;
    wire [7:0]   estNormDist;
    wire [87:0]  cFirstNormAbsSigSum;
    wire         doIncrSig;
    wire [4:0]   normTo2ShiftDist;
    wire [31:0]  absSigSumExtraMask;
    wire [56:0]  sigX3;
    wire         sigX3Shift1;
    wire [13:0]  sExpX3;
    wire         isZeroY, signY;
    wire [55:0]  roundMask, roundPosMask;
    wire         roundPosBit, anyRoundExtra, allRoundExtra, anyRound, allRound;
    wire         roundDirectUp, roundUp, roundEven, roundInexact;
    wire [54:0]  roundUp_sigY3, sigY3;
    wire [12:0]  sExpY;
    wire [11:0]  expY;
    wire [51:0]  fractY;
    wire         overflowY, totalUnderflowY, underflowY, inexactY;
    wire         overflowY_roundMagUp;

    wire         mulSpecial, addSpecial, notSpecial_addZeros, commonCase;
    wire         notSigNaN_invalid, invalid, overflow, underflow, inexact;
    wire         notSpecial_isZeroOut, isSatOut, notNaN_isInfOut, isNaNOut;
    wire         signOut;
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

    assign opSignC  = c[64] ^ op;
    assign expC   = c[63:52];
    assign fractC = c[51:0];
    assign isZeroC = ( expC[11:9] == 3'b000 );
    assign isSpecialC = ( expC[11:10] == 2'b11 );
    assign isInfC = isSpecialC & ~ expC[9];
    assign isNaNC = isSpecialC &   expC[9];
    assign isSigNaNC = isNaNC & ~ fractC[51];
    assign sigC = {~ isZeroC, fractC};

    assign roundingMode_nearest_even = ( roundingMode == `round_nearest_even );
    assign roundingMode_minMag       = ( roundingMode == `round_minMag       );
    assign roundingMode_min          = ( roundingMode == `round_min          );
    assign roundingMode_max          = ( roundingMode == `round_max          );

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign signProd = signA ^ signB;
    assign isZeroProd = isZeroA | isZeroB;
    assign sExpAlignedProd = expA + {{3{~ expB[11]}}, expB[10:0]} + 56;

    assign sigProd = sigA * sigB;

    /*------------------------------------------------------------------------
    *------------------------------------------------------------------------*/
    assign doSubMags = signProd ^ opSignC;

    assign sNatCAlignDist = sExpAlignedProd - expC;
    assign CAlignDist_floor = isZeroProd | sNatCAlignDist[13];
    assign CAlignDist_0 = CAlignDist_floor | ( sNatCAlignDist[12:0] == 0 );
    assign isCDominant =
        ~ isZeroC & ( CAlignDist_floor | ( sNatCAlignDist[12:0] < 54 ) );
    assign CAlignDist =
          CAlignDist_floor ? 0
        : ( sNatCAlignDist[12:0] < 161 ) ? sNatCAlignDist
        : 161;
    assign sExpSum = CAlignDist_floor ? expC : sExpAlignedProd;
//*** USE `sNatCAlignDist'?
    assign CExtraMask =
        {( 161 == CAlignDist ), ( 160 <= CAlignDist ),
         ( 159 <= CAlignDist ), ( 158 <= CAlignDist ),
         ( 157 <= CAlignDist ), ( 156 <= CAlignDist ),
         ( 155 <= CAlignDist ), ( 154 <= CAlignDist ),
         ( 153 <= CAlignDist ), ( 152 <= CAlignDist ),
         ( 151 <= CAlignDist ), ( 150 <= CAlignDist ),
         ( 149 <= CAlignDist ), ( 148 <= CAlignDist ),
         ( 147 <= CAlignDist ), ( 146 <= CAlignDist ),
         ( 145 <= CAlignDist ), ( 144 <= CAlignDist ),
         ( 143 <= CAlignDist ), ( 142 <= CAlignDist ),
         ( 141 <= CAlignDist ), ( 140 <= CAlignDist ),
         ( 139 <= CAlignDist ), ( 138 <= CAlignDist ),
         ( 137 <= CAlignDist ), ( 136 <= CAlignDist ),
         ( 135 <= CAlignDist ), ( 134 <= CAlignDist ),
         ( 133 <= CAlignDist ), ( 132 <= CAlignDist ),
         ( 131 <= CAlignDist ), ( 130 <= CAlignDist ),
         ( 129 <= CAlignDist ), ( 128 <= CAlignDist ),
         ( 127 <= CAlignDist ), ( 126 <= CAlignDist ),
         ( 125 <= CAlignDist ), ( 124 <= CAlignDist ),
         ( 123 <= CAlignDist ), ( 122 <= CAlignDist ),
         ( 121 <= CAlignDist ), ( 120 <= CAlignDist ),
         ( 119 <= CAlignDist ), ( 118 <= CAlignDist ),
         ( 117 <= CAlignDist ), ( 116 <= CAlignDist ),
         ( 115 <= CAlignDist ), ( 114 <= CAlignDist ),
         ( 113 <= CAlignDist ), ( 112 <= CAlignDist ),
         ( 111 <= CAlignDist ), ( 110 <= CAlignDist ),
         ( 109 <= CAlignDist )};
    assign negSigC = doSubMags ? ~ sigC : sigC;
    assign alignedNegSigC =
        {{{161{doSubMags}}, negSigC, {108{doSubMags}}}>>CAlignDist,
         ( ( sigC & CExtraMask ) != 0 ) ^ doSubMags};

    assign sigSum = alignedNegSigC + ( sigProd<<1 );

    assign estNormPos_a = {doSubMags, alignedNegSigC[107:1]};
    assign estNormPos_b = sigProd;
    estNormDistP53PosSum108
        estNormPosSigSum( estNormPos_a, estNormPos_b, estNormPos_dist );

    assign estNormNeg_a = {1'b1, alignedNegSigC[107:1]};
    assign estNormNeg_b = sigProd;
    estNormDistP53NegSum108
        estNormNegSigSum( estNormNeg_a, estNormNeg_b, estNormNeg_dist );

    assign firstReduceSigSum = {( sigSum[75:44] != 0 ), ( sigSum[43:0] != 0 )};
    assign notSigSum = ~ sigSum;
    assign firstReduceNotSigSum =
        {( notSigSum[75:44] != 0 ), ( notSigSum[43:0] != 0 )};
//*** USE RESULT OF `CAlignDest - 1' TO TEST FOR ZERO?
    assign CDom_estNormDist =
        CAlignDist_0 | doSubMags ? CAlignDist : CAlignDist - 1;
    assign CDom_firstNormAbsSigSum =
          ( ~ doSubMags & ~ CDom_estNormDist[5]
            ? {sigSum[161:76], ( firstReduceSigSum != 0 )}
            : 0
          )
        | ( ~ doSubMags & CDom_estNormDist[5]
            ? {sigSum[129:44], firstReduceSigSum[0]}
            : 0
          )
        | ( doSubMags & ~ CDom_estNormDist[5]
            ? {notSigSum[161:76], ( firstReduceNotSigSum != 0 )}
            : 0
          )
        | ( doSubMags & CDom_estNormDist[5]
            ? {notSigSum[129:44], firstReduceNotSigSum[0]}
            : 0
          );
    /*------------------------------------------------------------------------
    | (For this case, bits above `sigSum[108]' are never interesting.  Also,
    | if there is any significant cancellation, then `sigSum[0]' must equal
    | `doSubMags'.)
    *------------------------------------------------------------------------*/
    assign notCDom_pos_firstNormAbsSigSum =
          ( ( estNormPos_dist[6:4] == 3'b011 )
            ? {sigSum[108:44],
               doSubMags ? ~ firstReduceNotSigSum[0] : firstReduceSigSum[0]}
            : 0
          )
        | ( ( estNormPos_dist[6:5] == 2'b10 )
            ? {sigSum[97:12],
               doSubMags ? ( notSigSum[11:1] == 0 ) : ( sigSum[11:1] != 0 )}
            : 0
          )
        | ( ( estNormPos_dist[6:5] == 2'b11 ) ? {sigSum[65:1], {22{doSubMags}}}
                : 0 )
        | ( ( estNormPos_dist[6:5] == 2'b00 ) ? {sigSum[33:1], {54{doSubMags}}}
                : 0 )
        | ( ( estNormPos_dist[6:4] == 3'b010 ) ? {sigSum[1], {86{doSubMags}}}
                : 0 );
    /*------------------------------------------------------------------------
    | (For this case, bits above `notSigSum[107]' are never interesting.
    | Also, if there is any significant cancellation, then `notSigSum[0]' must
    | be zero.)
    *------------------------------------------------------------------------*/
    assign notCDom_neg_cFirstNormAbsSigSum =
          ( ( estNormNeg_dist[6:4] == 3'b011 )
            ? {notSigSum[107:44], firstReduceNotSigSum[0]}
            : 0
          )
        | ( ( estNormNeg_dist[6:5] == 2'b10 )
            ? {notSigSum[98:12], ( notSigSum[11:1] != 0 )}
            : 0
          )
        | ( ( estNormNeg_dist[6:5] == 2'b11 )  ? notSigSum[66:1]<<22 : 0 )
        | ( ( estNormNeg_dist[6:5] == 2'b00 )  ? notSigSum[34:1]<<54 : 0 )
        | ( ( estNormNeg_dist[6:4] == 3'b010 ) ? notSigSum[2:1]<<86  : 0 );
    assign notCDom_signSigSum = sigSum[109];
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
    assign normTo2ShiftDist = ~ estNormDist[4:0];
    assign absSigSumExtraMask =
        {( estNormDist[4:0] ==  0 ), ( estNormDist[4:0] <=  1 ),
         ( estNormDist[4:0] <=  2 ), ( estNormDist[4:0] <=  3 ),
         ( estNormDist[4:0] <=  4 ), ( estNormDist[4:0] <=  5 ),
         ( estNormDist[4:0] <=  6 ), ( estNormDist[4:0] <=  7 ),
         ( estNormDist[4:0] <=  8 ), ( estNormDist[4:0] <=  9 ),
         ( estNormDist[4:0] <= 10 ), ( estNormDist[4:0] <= 11 ),
         ( estNormDist[4:0] <= 12 ), ( estNormDist[4:0] <= 13 ),
         ( estNormDist[4:0] <= 14 ), ( estNormDist[4:0] <= 15 ),
         ( estNormDist[4:0] <= 16 ), ( estNormDist[4:0] <= 17 ),
         ( estNormDist[4:0] <= 18 ), ( estNormDist[4:0] <= 19 ),
         ( estNormDist[4:0] <= 20 ), ( estNormDist[4:0] <= 21 ),
         ( estNormDist[4:0] <= 22 ), ( estNormDist[4:0] <= 23 ),
         ( estNormDist[4:0] <= 24 ), ( estNormDist[4:0] <= 25 ),
         ( estNormDist[4:0] <= 26 ), ( estNormDist[4:0] <= 27 ),
         ( estNormDist[4:0] <= 28 ), ( estNormDist[4:0] <= 29 ),
         ( estNormDist[4:0] <= 30 ), 1'b1};
    assign sigX3 =
        {cFirstNormAbsSigSum[87:1]>>normTo2ShiftDist,
         doIncrSig
         ? ( ( ~ cFirstNormAbsSigSum[31:0] & absSigSumExtraMask ) == 0 )
         : ( (   cFirstNormAbsSigSum[31:0] & absSigSumExtraMask ) != 0 )};
    assign sigX3Shift1 = ( sigX3[56:55] == 0 );
    assign sExpX3 = sExpSum - estNormDist;

    assign isZeroY = ( sigX3[56:54] == 0 );
    assign signY = ~ isZeroY & ( signProd ^ doNegSignSum );
    assign roundMask =
          sExpX3[13] ? 56'hFFFFFFFFFFFFFF
        : {( sExpX3[12:0] <= 13'b0001111001101 ),
           ( sExpX3[12:0] <= 13'b0001111001110 ),
           ( sExpX3[12:0] <= 13'b0001111001111 ),
           ( sExpX3[12:0] <= 13'b0001111010000 ),
           ( sExpX3[12:0] <= 13'b0001111010001 ),
           ( sExpX3[12:0] <= 13'b0001111010010 ),
           ( sExpX3[12:0] <= 13'b0001111010011 ),
           ( sExpX3[12:0] <= 13'b0001111010100 ),
           ( sExpX3[12:0] <= 13'b0001111010101 ),
           ( sExpX3[12:0] <= 13'b0001111010110 ),
           ( sExpX3[12:0] <= 13'b0001111010111 ),
           ( sExpX3[12:0] <= 13'b0001111011000 ),
           ( sExpX3[12:0] <= 13'b0001111011001 ),
           ( sExpX3[12:0] <= 13'b0001111011010 ),
           ( sExpX3[12:0] <= 13'b0001111011011 ),
           ( sExpX3[12:0] <= 13'b0001111011100 ),
           ( sExpX3[12:0] <= 13'b0001111011101 ),
           ( sExpX3[12:0] <= 13'b0001111011110 ),
           ( sExpX3[12:0] <= 13'b0001111011111 ),
           ( sExpX3[12:0] <= 13'b0001111100000 ),
           ( sExpX3[12:0] <= 13'b0001111100001 ),
           ( sExpX3[12:0] <= 13'b0001111100010 ),
           ( sExpX3[12:0] <= 13'b0001111100011 ),
           ( sExpX3[12:0] <= 13'b0001111100100 ),
           ( sExpX3[12:0] <= 13'b0001111100101 ),
           ( sExpX3[12:0] <= 13'b0001111100110 ),
           ( sExpX3[12:0] <= 13'b0001111100111 ),
           ( sExpX3[12:0] <= 13'b0001111101000 ),
           ( sExpX3[12:0] <= 13'b0001111101001 ),
           ( sExpX3[12:0] <= 13'b0001111101010 ),
           ( sExpX3[12:0] <= 13'b0001111101011 ),
           ( sExpX3[12:0] <= 13'b0001111101100 ),
           ( sExpX3[12:0] <= 13'b0001111101101 ),
           ( sExpX3[12:0] <= 13'b0001111101110 ),
           ( sExpX3[12:0] <= 13'b0001111101111 ),
           ( sExpX3[12:0] <= 13'b0001111110000 ),
           ( sExpX3[12:0] <= 13'b0001111110001 ),
           ( sExpX3[12:0] <= 13'b0001111110010 ),
           ( sExpX3[12:0] <= 13'b0001111110011 ),
           ( sExpX3[12:0] <= 13'b0001111110100 ),
           ( sExpX3[12:0] <= 13'b0001111110101 ),
           ( sExpX3[12:0] <= 13'b0001111110110 ),
           ( sExpX3[12:0] <= 13'b0001111110111 ),
           ( sExpX3[12:0] <= 13'b0001111111000 ),
           ( sExpX3[12:0] <= 13'b0001111111001 ),
           ( sExpX3[12:0] <= 13'b0001111111010 ),
           ( sExpX3[12:0] <= 13'b0001111111011 ),
           ( sExpX3[12:0] <= 13'b0001111111100 ),
           ( sExpX3[12:0] <= 13'b0001111111101 ),
           ( sExpX3[12:0] <= 13'b0001111111110 ),
           ( sExpX3[12:0] <= 13'b0001111111111 ),
           ( sExpX3[12:0] <= 13'b0010000000000 ),
           ( sExpX3[12:0] <= 13'b0010000000001 ),
           ( sExpX3[12:0] <= 13'b0010000000010 ) | sigX3[55],
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
          ( sigY3[54]             ? sExpX3 + 1 : 0 )
        | ( sigY3[53]             ? sExpX3     : 0 )
        | ( ( sigY3[54:53] == 0 ) ? sExpX3 - 1 : 0 );
    assign expY = sExpY[11:0];
    assign fractY = sigX3Shift1 ? sigY3[51:0] : sigY3[52:1];

    assign overflowY = ( sExpY[12:10] == 3'b011 );
//*** HANDLE DIFFERENTLY?  (NEED TO ACCOUNT FOR ROUND-EVEN ZEROING MSB.)
    assign totalUnderflowY = sExpY[12] | ( sExpY[11:0] < 12'b001111001110 );
    assign underflowY =
        ( sExpX3[13]
              | ( sExpX3[12:0]
                      <= ( sigX3Shift1 ? 13'b0010000000010
                               : 13'b0010000000001 ) ) )
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

