// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// この手の演算することが多いので定式化する
module jelly_func_shift
        #(
            parameter   IN_WIDTH    = 32,
            parameter   OUT_WIDTH   = 32,
            parameter   SHIFT_LEFT  = 0,    // 負の値もOK
            parameter   SHIFT_RIGHT = 0,    // 負の値もOK
            parameter   ARITHMETIC  = 0,
            parameter   ROUNDUP     = 0
        )
        (
            input   wire    [IN_WIDTH-1:0]  in,
            output  wire    [OUT_WIDTH-1:0] out
        );
    
    localparam  VAL = SHIFT_RIGHT - SHIFT_LEFT;
    
    generate
    if ( ARITHMETIC && VAL >= 0 && ROUNDUP ) begin : blk_sar_roundup
        assign out = ((in + ((1 << VAL) - 1)) >>> VAL);
    end
    else if ( ARITHMETIC && VAL >= 0 && !ROUNDUP ) begin : blk_sar
        assign out = (in >>> VAL);
    end
    else if ( ARITHMETIC && VAL < 0 ) begin : blk_sal
        assign out = (in <<< (-VAL));
    end
    else if ( !ARITHMETIC && VAL >= 0 && ROUNDUP ) begin : blk_slr_roundup
        assign out = ((in + ((1 << VAL) - 1)) >> VAL);
    end
    else if ( !ARITHMETIC && VAL >= 0 && !ROUNDUP ) begin : blk_slr
        assign out = (in >> VAL);
    end
    else if ( !ARITHMETIC && VAL < 0 ) begin : blk_sll
        assign out = (in << (-VAL));
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
