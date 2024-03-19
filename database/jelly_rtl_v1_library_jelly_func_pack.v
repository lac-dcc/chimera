// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// サイズゼロを許容したパラメータ等のパッキング機能(サイズ上限あり)
module jelly_func_pack
        #(
            parameter   N  = 1,
            parameter   W0 = 0,
            parameter   W1 = 0,
            parameter   W2 = 0,
            parameter   W3 = 0,
            parameter   W4 = 0,
            parameter   W5 = 0,
            parameter   W6 = 0,
            parameter   W7 = 0,
            parameter   W8 = 0,
            parameter   W9 = 0,
            
            // local
            parameter   IN0_WIDTH = N * W0,
            parameter   IN1_WIDTH = N * W1,
            parameter   IN2_WIDTH = N * W2,
            parameter   IN3_WIDTH = N * W3,
            parameter   IN4_WIDTH = N * W4,
            parameter   IN5_WIDTH = N * W5,
            parameter   IN6_WIDTH = N * W6,
            parameter   IN7_WIDTH = N * W7,
            parameter   IN8_WIDTH = N * W8,
            parameter   IN9_WIDTH = N * W9,
            parameter   OUT_WIDTH = N * (W9 + W8 + W7 + W6 + W5 + W4 + W3 + W2 + W1 + W0),
            parameter   IN0_BITS = IN0_WIDTH > 0 ? IN0_WIDTH : 1,
            parameter   IN1_BITS = IN1_WIDTH > 0 ? IN1_WIDTH : 1,
            parameter   IN2_BITS = IN2_WIDTH > 0 ? IN2_WIDTH : 1,
            parameter   IN3_BITS = IN3_WIDTH > 0 ? IN3_WIDTH : 1,
            parameter   IN4_BITS = IN4_WIDTH > 0 ? IN4_WIDTH : 1,
            parameter   IN5_BITS = IN5_WIDTH > 0 ? IN5_WIDTH : 1,
            parameter   IN6_BITS = IN6_WIDTH > 0 ? IN6_WIDTH : 1,
            parameter   IN7_BITS = IN7_WIDTH > 0 ? IN7_WIDTH : 1,
            parameter   IN8_BITS = IN8_WIDTH > 0 ? IN8_WIDTH : 1,
            parameter   IN9_BITS = IN9_WIDTH > 0 ? IN9_WIDTH : 1,
            parameter   OUT_BITS = OUT_WIDTH > 0 ? OUT_WIDTH : 1
        )
        (
            input   wire    [IN0_BITS-1:0]  in0,
            input   wire    [IN1_BITS-1:0]  in1,
            input   wire    [IN2_BITS-1:0]  in2,
            input   wire    [IN3_BITS-1:0]  in3,
            input   wire    [IN4_BITS-1:0]  in4,
            input   wire    [IN5_BITS-1:0]  in5,
            input   wire    [IN6_BITS-1:0]  in6,
            input   wire    [IN7_BITS-1:0]  in7,
            input   wire    [IN8_BITS-1:0]  in8,
            input   wire    [IN9_BITS-1:0]  in9,
            output  wire    [OUT_BITS-1:0]  out
        );
    
    localparam  [IN0_BITS:0]  MASK0 = (1 << W0) - 1;
    localparam  [IN1_BITS:0]  MASK1 = (1 << W1) - 1;
    localparam  [IN2_BITS:0]  MASK2 = (1 << W2) - 1;
    localparam  [IN3_BITS:0]  MASK3 = (1 << W3) - 1;
    localparam  [IN4_BITS:0]  MASK4 = (1 << W4) - 1;
    localparam  [IN5_BITS:0]  MASK5 = (1 << W5) - 1;
    localparam  [IN6_BITS:0]  MASK6 = (1 << W6) - 1;
    localparam  [IN7_BITS:0]  MASK7 = (1 << W7) - 1;
    localparam  [IN8_BITS:0]  MASK8 = (1 << W8) - 1;
    localparam  [IN9_BITS:0]  MASK9 = (1 << W9) - 1;
    
    localparam IND0 = W0 > 0 ? W0 : 1;
    localparam IND1 = W1 > 0 ? W1 : 1;
    localparam IND2 = W2 > 0 ? W2 : 1;
    localparam IND3 = W3 > 0 ? W3 : 1;
    localparam IND4 = W4 > 0 ? W4 : 1;
    localparam IND5 = W5 > 0 ? W5 : 1;
    localparam IND6 = W6 > 0 ? W6 : 1;
    localparam IND7 = W7 > 0 ? W7 : 1;
    localparam IND8 = W8 > 0 ? W8 : 1;
    localparam IND9 = W9 > 0 ? W9 : 1;
    
    localparam OW   = W9 + W8 + W7 + W6 + W5 + W4 + W3 + W2 + W1 + W0;
    localparam OUTD = OW > 0 ? OW : 1;
    
    wire    [N*IND0-1:0]  ind0;
    wire    [N*IND1-1:0]  ind1;
    wire    [N*IND2-1:0]  ind2;
    wire    [N*IND3-1:0]  ind3;
    wire    [N*IND4-1:0]  ind4;
    wire    [N*IND5-1:0]  ind5;
    wire    [N*IND6-1:0]  ind6;
    wire    [N*IND7-1:0]  ind7;
    wire    [N*IND8-1:0]  ind8;
    wire    [N*IND9-1:0]  ind9;
    wire    [N*OUTD-1:0]  outd;
    
    assign ind0 = in0;
    assign ind1 = in1;
    assign ind2 = in2;
    assign ind3 = in3;
    assign ind4 = in4;
    assign ind5 = in5;
    assign ind6 = in6;
    assign ind7 = in7;
    assign ind8 = in8;
    assign ind9 = in9;
    assign out  = outd;
    
    
    genvar  i;
    generate
    for ( i = 0; i < N; i = i+1 ) begin : loop_pack
        assign outd[i*OUTD +: OUTD] = ((ind0[i*IND0 +: IND0] & MASK0) <<                          (0))
                                    | ((ind1[i*IND1 +: IND1] & MASK1) <<                         (W0))
                                    | ((ind2[i*IND2 +: IND2] & MASK2) <<                      (W1+W0))
                                    | ((ind3[i*IND3 +: IND3] & MASK3) <<                   (W2+W1+W0))
                                    | ((ind4[i*IND4 +: IND4] & MASK4) <<                (W3+W2+W1+W0))
                                    | ((ind5[i*IND5 +: IND5] & MASK5) <<             (W4+W3+W2+W1+W0))
                                    | ((ind6[i*IND6 +: IND6] & MASK6) <<          (W5+W4+W3+W2+W1+W0))
                                    | ((ind7[i*IND7 +: IND7] & MASK7) <<       (W6+W5+W4+W3+W2+W1+W0))
                                    | ((ind8[i*IND8 +: IND8] & MASK8) <<    (W7+W6+W5+W4+W3+W2+W1+W0))
                                    | ((ind9[i*IND9 +: IND9] & MASK9) << (W8+W7+W6+W5+W4+W3+W2+W1+W0));
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
