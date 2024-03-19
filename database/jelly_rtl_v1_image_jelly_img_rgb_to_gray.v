// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_rgb_to_gray
        #(
            parameter   USER_WIDTH = 0,
            parameter   DATA_WIDTH = 8,
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [3*DATA_WIDTH-1:0]      s_img_rgb,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [3*DATA_WIDTH-1:0]      m_img_rgb,
            output  wire    [DATA_WIDTH-1:0]        m_img_gray,
            output  wire                            m_img_valid
        );
    
    
    reg                             st0_line_first;
    reg                             st0_line_last;
    reg                             st0_pixel_first;
    reg                             st0_pixel_last;
    reg                             st0_de;
    reg     [USER_BITS-1:0]         st0_user;
    reg     [3*DATA_WIDTH-1:0]      st0_rgb;
    reg     [DATA_WIDTH-1:0]        st0_gray;
    reg                             st0_valid;
    
    reg                             st1_line_first;
    reg                             st1_line_last;
    reg                             st1_pixel_first;
    reg                             st1_pixel_last;
    reg                             st1_de;
    reg     [USER_BITS-1:0]         st1_user;
    reg     [3*DATA_WIDTH-1:0]      st1_rgb;
    reg     [DATA_WIDTH-1:0]        st1_gray;
    reg                             st1_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_line_first  <= 1'bx;
            st0_line_last   <= 1'bx;
            st0_pixel_first <= 1'bx;
            st0_pixel_last  <= 1'bx;
            st0_de          <= 1'bx;
            st0_user        <= {USER_BITS{1'bx}};
            st0_rgb         <= {(3*DATA_WIDTH){1'bx}};
            st0_gray        <= {DATA_WIDTH{1'bx}};
            st0_valid       <= 1'b0;
            
            st1_line_first  <= 1'bx;
            st1_line_last   <= 1'bx;
            st1_pixel_first <= 1'bx;
            st1_pixel_last  <= 1'bx;
            st1_de          <= 1'bx;
            st1_user        <= {USER_BITS{1'bx}};
            st1_rgb         <= {(3*DATA_WIDTH){1'bx}};
            st1_gray        <= {DATA_WIDTH{1'bx}};
            st1_valid       <= 1'b0;
        end
        else if ( cke ) begin
            st0_line_first  <= s_img_line_first;
            st0_line_last   <= s_img_line_last;
            st0_pixel_first <= s_img_pixel_first;
            st0_pixel_last  <= s_img_pixel_last;
            st0_de          <= s_img_de;
            st0_user        <= s_img_user;
            st0_rgb         <= s_img_rgb;
            st0_gray        <= (({1'b0, s_img_rgb[2*DATA_WIDTH +: DATA_WIDTH]} + {1'b0, s_img_rgb[0*DATA_WIDTH +: DATA_WIDTH]}) >> 1);
            st0_valid       <= s_img_valid;
            
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de;
            st1_user        <= st0_user;
            st1_rgb         <= st0_rgb;
            st1_gray        <= (({1'b0, st0_rgb[1*DATA_WIDTH +: DATA_WIDTH]} + {1'b0, st0_gray}) >> 1);
            st1_valid       <= st0_valid;
        end
    end
    
    assign m_img_line_first  = st1_line_first;
    assign m_img_line_last   = st1_line_last;
    assign m_img_pixel_first = st1_pixel_first;
    assign m_img_pixel_last  = st1_pixel_last;
    assign m_img_de          = st1_de;
    assign m_img_user        = st1_user;
    assign m_img_rgb         = st1_rgb;
    assign m_img_gray        = st1_gray;
    assign m_img_valid       = st1_valid;
    
    
endmodule


`default_nettype wire


// end of file
