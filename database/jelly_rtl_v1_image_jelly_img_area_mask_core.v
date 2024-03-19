// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_area_mask_core
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 8,
            parameter   X_WIDTH      = 14,
            parameter   Y_WIDTH      = 14,
            parameter   USE_VALID    = 0,
            
            parameter   XY_WIDTH     = X_WIDTH > Y_WIDTH ? X_WIDTH : Y_WIDTH,
            parameter   RADIUS_WIDTH = 2 * XY_WIDTH,
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            enable,
            
            input   wire     [DATA_WIDTH-1:0]       mask_value0,
            input   wire     [DATA_WIDTH-1:0]       mask_value1,
            input   wire                            mask_or,
            input   wire                            mask_inv,
            input   wire                            mask_en0,
            input   wire                            mask_en1,
            
            input   wire                            thresh_en,
            input   wire                            thresh_inv,
            input   wire     [DATA_WIDTH-1:0]       thresh_value,
            
            input   wire                            rect_en,
            input   wire                            rect_inv,
            input   wire     [X_WIDTH-1:0]          rect_left,
            input   wire     [X_WIDTH-1:0]          rect_right,
            input   wire     [Y_WIDTH-1:0]          rect_top,
            input   wire     [Y_WIDTH-1:0]          rect_bottom,
            
            input   wire                            circle_en,
            input   wire                            circle_inv,
            input   wire     [X_WIDTH-1:0]          circle_x,
            input   wire     [Y_WIDTH-1:0]          circle_y,
            input   wire     [RADIUS_WIDTH-1:0]     circle_radius2,   // 半径の2乗
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [DATA_WIDTH-1:0]        s_img_data,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_data,
            output  wire    [DATA_WIDTH-1:0]        m_img_masked_data,
            output  wire                            m_img_mask,
            output  wire                            m_img_valid
        );
    
    
     // processing
    reg     [DATA_WIDTH-1:0]        st0_data;
    reg     [X_WIDTH-1:0]           st0_x;
    reg     [Y_WIDTH-1:0]           st0_y;
    
    reg     [DATA_WIDTH-1:0]        st1_data;
    reg                             st1_rect;
    reg     [X_WIDTH-1:0]           st1_circle_x;
    reg     [Y_WIDTH-1:0]           st1_circle_y;
    
    reg     [DATA_WIDTH-1:0]        st2_data;
    reg                             st2_rect;
    reg     [2*X_WIDTH-1:0]         st2_circle_x;
    reg     [2*Y_WIDTH-1:0]         st2_circle_y;
    
    reg     [DATA_WIDTH-1:0]        st3_data;
    reg                             st3_rect;
    reg     [RADIUS_WIDTH:0]        st3_circle;
    
    reg     [DATA_WIDTH-1:0]        st4_data;
    reg                             st4_rect;
    reg                             st4_circle;
    reg                             st4_thresh;
    
    reg     [DATA_WIDTH-1:0]        st5_data;
    reg                             st5_rect;
    reg                             st5_circle;
    reg                             st5_thresh;
    
    reg     [DATA_WIDTH-1:0]        st6_data;
    reg                             st6_mask;
    
    reg     [DATA_WIDTH-1:0]        st7_data;
    reg     [DATA_WIDTH-1:0]        st7_masked_data;
    reg                             st7_mask;
    
    always @(posedge clk) begin
        if ( cke ) begin
            // stage 0
            st0_data  <= s_img_data;
            if ( s_img_valid ) begin
                st0_x <= st0_x + s_img_de;
                if ( s_img_pixel_first ) begin
                    st0_x <= 0;
                    st0_y <= st0_y + 1;
                    if ( s_img_line_first ) begin
                        st0_y <= 0;
                    end
                end
            end
            
            // stage 1
            st1_data     <= st0_data;
            st1_circle_x <= st0_x > circle_x ? st0_x - circle_x : circle_x - st0_x;
            st1_circle_y <= st0_y > circle_y ? st0_y - circle_y : circle_y - st0_y;
            st1_rect     <= (st0_x >= rect_left && st0_x <= rect_right
                            && st0_y >= rect_top && st0_y <= rect_bottom);
            
            // stage 2
            st2_data     <= st1_data;
            st2_circle_x <= st1_circle_x * st1_circle_x;
            st2_circle_y <= st1_circle_y * st1_circle_y;
            st2_rect     <= st1_rect;
            
            // stage 3
            st3_data     <= st2_data;
            st3_circle   <= st2_circle_x + st2_circle_y;
            st3_rect     <= st2_rect;
            
            // stage 4
            st4_data     <= st3_data;
            st4_circle   <= (st3_circle < circle_radius2);
            st4_rect     <= st3_rect;
            st4_thresh   <= (st3_data > thresh_value);
            
            // stage 5
            st5_data     <= st4_data;
            st5_rect     <= rect_en   ? (st4_rect   ^ rect_inv)   : ~mask_or;
            st5_circle   <= circle_en ? (st4_circle ^ circle_inv) : ~mask_or;
            st5_thresh   <= thresh_en ? (st4_thresh ^ thresh_inv) : ~mask_or;
            
            // stage 6
            st6_data     <= st5_data;
            st6_mask     <= (mask_or ? (st5_rect | st5_circle | st5_thresh) : (st5_rect & st5_circle & st5_thresh)) ^ mask_inv;
            
            // stage 7
            st7_data        <= st6_data;
            st7_masked_data <= st6_data;
            st7_mask        <= 1'b0;
            if ( enable ) begin
                if ( mask_en0 & ~st6_mask ) begin
                    st7_masked_data <= mask_value0;
                end
                if ( mask_en1 & st6_mask ) begin
                    st7_masked_data <= mask_value1;
                end
                st7_mask  <= st6_mask;
            end
        end
    end
    
    
    
    assign m_img_data        = st7_data;
    assign m_img_masked_data = st7_masked_data;
    assign m_img_mask        = st7_mask;
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (8),
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
