// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none

// XY Sum of squares
module jelly_img_xy_ss
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 8,
            parameter   USE_VALID    = 0,
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire            [USER_BITS-1:0]     s_img_user,
            input   wire    signed  [DATA_WIDTH-1:0]    s_img_x,
            input   wire    signed  [DATA_WIDTH-1:0]    s_img_y,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire            [USER_BITS-1:0]     m_img_user,
            output  wire    signed  [DATA_WIDTH-1:0]    m_img_x,
            output  wire    signed  [DATA_WIDTH-1:0]    m_img_y,
            output  wire            [2*DATA_WIDTH-1:0]  m_img_ss,
            output  wire                                m_img_valid
        );
    
    
    reg     signed  [DATA_WIDTH-1:0]    st0_x;
    reg     signed  [DATA_WIDTH-1:0]    st0_y;
    
    reg     signed  [DATA_WIDTH-1:0]    st1_x;
    reg     signed  [DATA_WIDTH-1:0]    st1_y;
    reg     signed  [2*DATA_WIDTH-1:0]  st1_xx;
    reg     signed  [2*DATA_WIDTH-1:0]  st1_yy;
    
    reg     signed  [DATA_WIDTH-1:0]    st2_x;
    reg     signed  [DATA_WIDTH-1:0]    st2_y;
    reg             [2*DATA_WIDTH-1:0]  st2_ss;
    
    always @(posedge clk) begin
        if ( cke ) begin
            st0_x  <= s_img_x;
            st0_y  <= s_img_y;
            
            st1_x  <= st0_x;
            st1_y  <= st0_y;
            st1_xx <= st0_x * st0_x;
            st1_yy <= st0_y * st0_y;
            
            st2_x  <= st1_x;
            st2_y  <= st1_y;
            st2_ss <= st1_xx + st1_yy;
        end
    end
    
    assign m_img_x  = st2_x;
    assign m_img_y  = st2_y;
    assign m_img_ss = st2_ss;
    
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (3),
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
