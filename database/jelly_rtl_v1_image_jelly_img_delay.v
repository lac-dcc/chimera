// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_delay
        #(
            parameter   USER_WIDTH = 0,
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1,
            
            parameter   LATENCY    = 1,
            parameter   USE_VALID  = 0,
            parameter   INIT_USER  = {USER_BITS{1'bx}}
        )
        (
            input   wire                    reset,
            input   wire                    clk,
            input   wire                    cke,
            
            input   wire                    s_img_line_first,
            input   wire                    s_img_line_last,
            input   wire                    s_img_pixel_first,
            input   wire                    s_img_pixel_last,
            input   wire                    s_img_de,
            input   wire    [USER_BITS-1:0] s_img_user,
            input   wire                    s_img_valid,
            
            output  wire                    m_img_line_first,
            output  wire                    m_img_line_last,
            output  wire                    m_img_pixel_first,
            output  wire                    m_img_pixel_last,
            output  wire                    m_img_de,
            output  wire    [USER_BITS-1:0] m_img_user,
            output  wire                    m_img_valid
        );
    
    wire    [USER_BITS-1:0] delay_user;
    wire                    delay_line_first;
    wire                    delay_line_last;
    wire                    delay_pixel_first;
    wire                    delay_pixel_last;
    wire                    delay_de;
    wire                    delay_valid;
    
    jelly_data_delay
            #(
                .LATENCY        (LATENCY),
                .DATA_WIDTH     (USER_BITS + 6),
                .DATA_INIT      ({INIT_USER, 6'bxxxxx0})
            )
        i_data_delay
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .in_data        ({
                                    s_img_user,
                                    s_img_line_first,
                                    s_img_line_last,
                                    s_img_pixel_first,
                                    s_img_pixel_last,
                                    s_img_de,
                                    s_img_valid
                                }),
                
                .out_data       ({
                                    delay_user,
                                    delay_line_first,
                                    delay_line_last,
                                    delay_pixel_first,
                                    delay_pixel_last,
                                    delay_de,
                                    delay_valid
                                })
            );
    
    generate
    if ( USE_VALID ) begin : blk_use_valid
        assign m_img_line_first  = delay_line_first;
        assign m_img_line_last   = delay_line_last;
        assign m_img_pixel_first = delay_pixel_first;
        assign m_img_pixel_last  = delay_pixel_last;
        assign m_img_de          = delay_de;
        assign m_img_user        = delay_user;
        assign m_img_valid       = delay_valid;
    end
    else begin
        assign m_img_line_first  = delay_valid & delay_line_first;
        assign m_img_line_last   = delay_valid & delay_line_last;
        assign m_img_pixel_first = delay_valid & delay_pixel_first;
        assign m_img_pixel_last  = delay_valid & delay_pixel_last;
        assign m_img_de          = delay_valid & delay_de;
        assign m_img_user        = delay_user;
        assign m_img_valid       = delay_valid;
    end
    endgenerate
    
    
endmodule


`default_nettype wire


// end of file
