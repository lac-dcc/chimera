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



// multiplexer
module jelly_bit_selector
        #(
            parameter   SEL_WIDTH     = 4,
            parameter   BIT_WIDTH     = (1 << SEL_WIDTH),
            
            parameter   USE_PRIMITIVE = 0,
            parameter   DEVICE        = "RTL"
        )
        (
            input   wire    [SEL_BITS-1:0]      sel,
            input   wire    [BIT_WIDTH-1:0]     din,
            output  wire                        dout
        );
    
    localparam  SEL_BITS  = SEL_WIDTH > 0 ? SEL_WIDTH : 1;
    
    generate
    if ( SEL_WIDTH <= 0 ) begin : blk_bypass
        assign dout = din;
    end
    else if ( USE_PRIMITIVE && (BIT_WIDTH <= 4) ) begin : blk_mul4
        wire    [1:0]   bit4_sel = sel;
        wire    [3:0]   bit4_din = din;
        jelly_multiplexer4
                #(
                    .DEVICE     (DEVICE)
                )
            i_multiplexer4
                (
                    .o          (dout),
                    .i          (bit4_din),
                    .s          (bit4_sel)
                );
    end
    else if ( USE_PRIMITIVE && (BIT_WIDTH <= 4) ) begin : blk_mul16
        wire    [3:0]   bit16_sel = sel;
        wire    [15:0]  bit16_din = din;
        jelly_multiplexer16
                #(
                    .DEVICE     (DEVICE)
                )
            i_multiplexer16
                (
                    .o          (dout),
                    .i          (bit16_din),
                    .s          (bit16_sel)
                );
    end
    else begin : blk_rtl
        assign dout = din[sel];
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
