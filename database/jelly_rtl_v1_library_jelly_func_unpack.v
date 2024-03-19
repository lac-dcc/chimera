// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// サイズゼロを許容したパラメータ等のアンパッキング機能(サイズ上限あり)
module jelly_func_unpack
        #(
            parameter   N   = 1,
            parameter   W0  = 0,
            parameter   W1  = 0,
            parameter   W2  = 0,
            parameter   W3  = 0,
            parameter   W4  = 0,
            parameter   W5  = 0,
            parameter   W6  = 0,
            parameter   W7  = 0,
            parameter   W8  = 0,
            parameter   W9  = 0,
            
            // local
            parameter   IN_WIDTH   = N * (W9 + W8 + W7 + W6 + W5 + W4 + W3 + W2 + W1 + W0),
            parameter   OUT0_WIDTH = N * W0,
            parameter   OUT1_WIDTH = N * W1,
            parameter   OUT2_WIDTH = N * W2,
            parameter   OUT3_WIDTH = N * W3,
            parameter   OUT4_WIDTH = N * W4,
            parameter   OUT5_WIDTH = N * W5,
            parameter   OUT6_WIDTH = N * W6,
            parameter   OUT7_WIDTH = N * W7,
            parameter   OUT8_WIDTH = N * W8,
            parameter   OUT9_WIDTH = N * W9,
            parameter   IN_BITS    = IN_WIDTH   > 0 ? IN_WIDTH   : 1,
            parameter   OUT0_BITS  = OUT0_WIDTH > 0 ? OUT0_WIDTH : 1,
            parameter   OUT1_BITS  = OUT1_WIDTH > 0 ? OUT1_WIDTH : 1,
            parameter   OUT2_BITS  = OUT2_WIDTH > 0 ? OUT2_WIDTH : 1,
            parameter   OUT3_BITS  = OUT3_WIDTH > 0 ? OUT3_WIDTH : 1,
            parameter   OUT4_BITS  = OUT4_WIDTH > 0 ? OUT4_WIDTH : 1,
            parameter   OUT5_BITS  = OUT5_WIDTH > 0 ? OUT5_WIDTH : 1,
            parameter   OUT6_BITS  = OUT6_WIDTH > 0 ? OUT6_WIDTH : 1,
            parameter   OUT7_BITS  = OUT7_WIDTH > 0 ? OUT7_WIDTH : 1,
            parameter   OUT8_BITS  = OUT8_WIDTH > 0 ? OUT8_WIDTH : 1,
            parameter   OUT9_BITS  = OUT9_WIDTH > 0 ? OUT9_WIDTH : 1
        )
        (
            input   wire    [IN_BITS-1:0]   in,
            output  wire    [OUT0_BITS-1:0] out0,
            output  wire    [OUT1_BITS-1:0] out1,
            output  wire    [OUT2_BITS-1:0] out2,
            output  wire    [OUT3_BITS-1:0] out3,
            output  wire    [OUT4_BITS-1:0] out4,
            output  wire    [OUT5_BITS-1:0] out5,
            output  wire    [OUT6_BITS-1:0] out6,
            output  wire    [OUT7_BITS-1:0] out7,
            output  wire    [OUT8_BITS-1:0] out8,
            output  wire    [OUT9_BITS-1:0] out9
        );
    
    localparam  [OUT0_BITS:0]   MASK0 = (1 << W0) - 1;
    localparam  [OUT1_BITS:0]   MASK1 = (1 << W1) - 1;
    localparam  [OUT2_BITS:0]   MASK2 = (1 << W2) - 1;
    localparam  [OUT3_BITS:0]   MASK3 = (1 << W3) - 1;
    localparam  [OUT4_BITS:0]   MASK4 = (1 << W4) - 1;
    localparam  [OUT5_BITS:0]   MASK5 = (1 << W5) - 1;
    localparam  [OUT6_BITS:0]   MASK6 = (1 << W6) - 1;
    localparam  [OUT7_BITS:0]   MASK7 = (1 << W7) - 1;
    localparam  [OUT8_BITS:0]   MASK8 = (1 << W8) - 1;
    localparam  [OUT9_BITS:0]   MASK9 = (1 << W9) - 1;
    
    localparam   OUTD0 = W0 > 0 ? W0 : 1;
    localparam   OUTD1 = W1 > 0 ? W1 : 1;
    localparam   OUTD2 = W2 > 0 ? W2 : 1;
    localparam   OUTD3 = W3 > 0 ? W3 : 1;
    localparam   OUTD4 = W4 > 0 ? W4 : 1;
    localparam   OUTD5 = W5 > 0 ? W5 : 1;
    localparam   OUTD6 = W6 > 0 ? W6 : 1;
    localparam   OUTD7 = W7 > 0 ? W7 : 1;
    localparam   OUTD8 = W8 > 0 ? W8 : 1;
    localparam   OUTD9 = W9 > 0 ? W9 : 1;
    
    localparam   IW    = W9 + W8 + W7 + W6 + W5 + W4 + W3 + W2 + W1 + W0;
    localparam   IND   = IW > 0 ? IW : 1;
    
    wire    [N*IND-1:0]     ind;
    wire    [N*OUTD0-1:0]   outd0;
    wire    [N*OUTD1-1:0]   outd1;
    wire    [N*OUTD2-1:0]   outd2;
    wire    [N*OUTD3-1:0]   outd3;
    wire    [N*OUTD4-1:0]   outd4;
    wire    [N*OUTD5-1:0]   outd5;
    wire    [N*OUTD6-1:0]   outd6;
    wire    [N*OUTD7-1:0]   outd7;
    wire    [N*OUTD8-1:0]   outd8;
    wire    [N*OUTD9-1:0]   outd9;
    
    assign ind  = in;
    assign out0 = outd0;
    assign out1 = outd1;
    assign out2 = outd2;
    assign out3 = outd3;
    assign out4 = outd4;
    assign out5 = outd5;
    assign out6 = outd6;
    assign out7 = outd7;
    assign out8 = outd8;
    assign out9 = outd9;
    
    genvar  i;
    generate
    for ( i = 0; i < N; i = i+1 ) begin : loop_pack
        assign outd0[i*OUTD0 +: OUTD0] = (ind[i*IND +: IND] >>                          (0)) & MASK0;
        assign outd1[i*OUTD1 +: OUTD1] = (ind[i*IND +: IND] >>                         (W0)) & MASK1;
        assign outd2[i*OUTD2 +: OUTD2] = (ind[i*IND +: IND] >>                      (W1+W0)) & MASK2;
        assign outd3[i*OUTD3 +: OUTD3] = (ind[i*IND +: IND] >>                   (W2+W1+W0)) & MASK3;
        assign outd4[i*OUTD4 +: OUTD4] = (ind[i*IND +: IND] >>                (W3+W2+W1+W0)) & MASK4;
        assign outd5[i*OUTD5 +: OUTD5] = (ind[i*IND +: IND] >>             (W4+W3+W2+W1+W0)) & MASK5;
        assign outd6[i*OUTD6 +: OUTD6] = (ind[i*IND +: IND] >>          (W5+W4+W3+W2+W1+W0)) & MASK6;
        assign outd7[i*OUTD7 +: OUTD7] = (ind[i*IND +: IND] >>       (W6+W5+W4+W3+W2+W1+W0)) & MASK7;
        assign outd8[i*OUTD8 +: OUTD8] = (ind[i*IND +: IND] >>    (W7+W6+W5+W4+W3+W2+W1+W0)) & MASK8;
        assign outd9[i*OUTD9 +: OUTD9] = (ind[i*IND +: IND] >> (W8+W7+W6+W5+W4+W3+W2+W1+W0)) & MASK9;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
