// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_colormap_core
        #(
            parameter   COLORMAP   = "JET",   // "HSV"
            parameter   USER_WIDTH = 0,
            parameter   USE_VALID  = 0,
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        s_img_line_first,
            input   wire                        s_img_line_last,
            input   wire                        s_img_pixel_first,
            input   wire                        s_img_pixel_last,
            input   wire                        s_img_de,
            input   wire    [USER_BITS-1:0]     s_img_user,
            input   wire    [7:0]               s_img_data,
            input   wire                        s_img_valid,
            
            output  wire                        m_img_line_first,
            output  wire                        m_img_line_last,
            output  wire                        m_img_pixel_first,
            output  wire                        m_img_pixel_last,
            output  wire                        m_img_de,
            output  wire    [USER_BITS-1:0]     m_img_user,
            output  wire    [23:0]              m_img_data,
            output  wire                        m_img_valid
        );
    
    
    jelly_colormap
            #(
                .COLORMAP           (COLORMAP)
            )
        i_colormap
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             (1'b0),
                .s_data             (s_img_data),
                .s_valid            (s_img_valid),
                .s_ready            (),
                
                .m_user             (),
                .m_data             (),
                .m_color            (m_img_data),
                .m_valid            (),
                .m_ready            (1'b1)
            );
    
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (1),
                .USE_VALID          (USE_VALID)
            )
        i_img_delay
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_img_line_first   (s_img_line_first),
                .s_img_line_last    (s_img_line_last),
                .s_img_pixel_first  (s_img_pixel_first),
                .s_img_pixel_last   (s_img_pixel_last),
                .s_img_de           (s_img_de),
                .s_img_user         (s_img_user),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (m_img_line_first),
                .m_img_line_last    (m_img_line_last),
                .m_img_pixel_first  (m_img_pixel_first),
                .m_img_pixel_last   (m_img_pixel_last),
                .m_img_de           (m_img_de),
                .m_img_user         (m_img_user),
                .m_img_valid        (m_img_valid)
            );
    
    
endmodule


`default_nettype wire


// end of file
