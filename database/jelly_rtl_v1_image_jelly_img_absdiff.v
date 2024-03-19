// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none

module jelly_img_absdiff
        #(
            parameter   USER_WIDTH    = 0,
            parameter   COMPONENTS    = 1,
            parameter   DATA_WIDTH    = 8,
            parameter   SUMDIFF_WIDTH = 10,
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
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
            input   wire    [USER_BITS-1:0]             s_img_user,
            input   wire    [COMPONENTS*DATA_WIDTH-1:0] s_img_data0,
            input   wire    [COMPONENTS*DATA_WIDTH-1:0] s_img_data1,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_BITS-1:0]             m_img_user,
            output  wire    [COMPONENTS*DATA_WIDTH-1:0] m_img_data0,
            output  wire    [COMPONENTS*DATA_WIDTH-1:0] m_img_data1,
            output  wire    [COMPONENTS*DATA_WIDTH-1:0] m_img_diff,
            output  wire    [SUMDIFF_WIDTH-1:0]         m_img_sumdiff,
            output  wire                                m_img_valid
        );
    
    integer                             i;
    
    reg                                 st0_line_first;
    reg                                 st0_line_last;
    reg                                 st0_pixel_first;
    reg                                 st0_pixel_last;
    reg                                 st0_de;
    reg     [USER_BITS-1:0]             st0_user;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st0_data0;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st0_data1;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st0_diff;
    reg                                 st0_valid;
    
    reg                                 st1_line_first;
    reg                                 st1_line_last;
    reg                                 st1_pixel_first;
    reg                                 st1_pixel_last;
    reg                                 st1_de;
    reg     [USER_BITS-1:0]             st1_user;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st1_data0;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st1_data1;
    reg     [COMPONENTS*DATA_WIDTH-1:0] st1_diff;
    reg     [SUMDIFF_WIDTH-1:0]         st1_sumdiff;
    reg                                 st1_valid;
    reg     [SUMDIFF_WIDTH-1:0]         st1_sum;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_line_first  <= 1'bx;
            st0_line_last   <= 1'bx;
            st0_pixel_first <= 1'bx;
            st0_pixel_last  <= 1'bx;
            st0_de          <= 1'bx;
            st0_user        <= {USER_BITS{1'bx}};
            st0_data0       <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st0_data1       <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st0_diff        <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st0_valid       <= 1'b0;
            
            st1_line_first  <= 1'bx;
            st1_line_last   <= 1'bx;
            st1_pixel_first <= 1'bx;
            st1_pixel_last  <= 1'bx;
            st1_de          <= 1'bx;
            st1_user        <= {USER_BITS{1'bx}};
            st1_data0       <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st1_data1       <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st1_diff        <= {(COMPONENTS*DATA_WIDTH){1'bx}};
            st1_sumdiff     <= {SUMDIFF_WIDTH{1'bx}};
            st1_valid       <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            st0_line_first  <= s_img_line_first;
            st0_line_last   <= s_img_line_last;
            st0_pixel_first <= s_img_pixel_first;
            st0_pixel_last  <= s_img_pixel_last;
            st0_de          <= s_img_de;
            st0_user        <= s_img_user;
            st0_data0       <= s_img_data0;
            st0_data1       <= s_img_data1;
            st0_valid       <= s_img_valid;
            
            for ( i = 0; i < COMPONENTS; i = i+1 ) begin
                if ( s_img_data0[i*DATA_WIDTH +: DATA_WIDTH] > s_img_data1[i*DATA_WIDTH +: DATA_WIDTH] ) begin
                    st0_diff[i*DATA_WIDTH +: DATA_WIDTH] <= s_img_data0[i*DATA_WIDTH +: DATA_WIDTH] - s_img_data1[i*DATA_WIDTH +: DATA_WIDTH];
                end
                else begin
                    st0_diff[i*DATA_WIDTH +: DATA_WIDTH] <= s_img_data1[i*DATA_WIDTH +: DATA_WIDTH] - s_img_data0[i*DATA_WIDTH +: DATA_WIDTH];
                end
            end
            
            
            // stage 1
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de;
            st1_user        <= st0_user;
            st1_data0       <= st0_data0;
            st1_data1       <= st0_data1;
            st1_diff        <= st0_diff;
            st1_valid       <= st0_valid;
            
            st1_sum = 0;
            for ( i = 0; i < COMPONENTS; i = i+1 ) begin
                st1_sum = st1_sum + st0_diff[i*DATA_WIDTH +: DATA_WIDTH];
            end
            st1_sumdiff <= st1_sum;
        end
    end
    
    assign m_img_line_first  = st1_line_first;
    assign m_img_line_last   = st1_line_last;
    assign m_img_pixel_first = st1_pixel_first;
    assign m_img_pixel_last  = st1_pixel_last;
    assign m_img_de          = st1_de;
    assign m_img_user        = st1_user;
    assign m_img_data0       = st1_data0;
    assign m_img_data1       = st1_data1;
    assign m_img_diff        = st1_diff;
    assign m_img_sumdiff     = st1_sumdiff;
    assign m_img_valid       = st1_valid;
    
endmodule


`default_nettype wire


// end of file
