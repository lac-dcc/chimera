// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_dnn_maxpol
        #(
            parameter   C          = 1,
            parameter   N          = 2,
            parameter   M          = 2,
            parameter   NC         = N-1,// (N-1) / 2,
            parameter   MC         = M-1,// (M-1) / 2,
            parameter   USER_WIDTH = 0,
            parameter   MAX_X_NUM  = 4096,
            parameter   RAM_TYPE   = "block",
            
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
            input   wire    [C-1:0]                 s_img_data,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [C-1:0]                 m_img_data,
            output  wire                            m_img_valid
        );
    
    
    wire                            img_blk_line_first;
    wire                            img_blk_line_last;
    wire                            img_blk_pixel_first;
    wire                            img_blk_pixel_last;
    wire                            img_blk_de;
    wire    [USER_BITS-1:0]         img_blk_user;
    wire    [N*M*C-1:0]             img_blk_data;
    wire                            img_blk_valid;
    
    jelly_img_blk_buffer
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (C),
                .PIXEL_NUM          (N),
                .LINE_NUM           (N),
                .PIXEL_CENTER       (NC),
                .LINE_CENTER        (MC),
                .MAX_X_NUM          (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .BORDER_MODE        ("REFLECT_101"),
                .BORDER_VALUE       ({C{1'b0}})
            )
        i_img_blk_buffer
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
                .s_img_data         (s_img_data),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (img_blk_line_first),
                .m_img_line_last    (img_blk_line_last),
                .m_img_pixel_first  (img_blk_pixel_first),
                .m_img_pixel_last   (img_blk_pixel_last),
                .m_img_de           (img_blk_de),
                .m_img_user         (img_blk_user),
                .m_img_data         (img_blk_data),
                .m_img_valid        (img_blk_valid)
            );
    
    
    localparam N_WIDTH  = (N <=   2) ? 1 :
                          (N <=   4) ? 2 :
                          (N <=   8) ? 3 :
                          (N <=  16) ? 4 :
                          (N <=  32) ? 5 :
                          (N <=  64) ? 6 :
                          (N <= 128) ? 7 : 8;
    
    localparam M_WIDTH  = (M <=   2) ? 1 :
                          (M <=   4) ? 2 :
                          (M <=   8) ? 3 :
                          (M <=  16) ? 4 :
                          (M <=  32) ? 5 :
                          (M <=  64) ? 6 :
                          (M <= 128) ? 7 : 8;
    
    
    // max
    integer                         i, j, k;
    
    reg     [N_WIDTH-1:0]           st0_n_count;
    reg     [M_WIDTH-1:0]           st0_m_count;
    reg                             st0_line_first;
    reg                             st0_line_last;
    reg                             st0_pixel_first;
    reg                             st0_pixel_last;
    reg                             st0_de;
    reg     [USER_BITS-1:0]         st0_user;
    reg     [C-1:0]                 st0_data;
    reg                             st0_valid;
    
    reg                             st1_line_first;
    reg                             st1_line_last;
    reg                             st1_pixel_first;
    reg                             st1_pixel_last;
    reg                             st1_de;
    reg     [USER_BITS-1:0]         st1_user;
    reg     [C-1:0]                 st1_data;
    reg                             st1_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            st0_n_count     <= {N_WIDTH{1'bx}};
            st0_m_count     <= {M_WIDTH{1'bx}};
            st0_line_first  <= 1'bx;
            st0_line_last   <= 1'bx;
            st0_pixel_first <= 1'bx;
            st0_pixel_last  <= 1'bx;
            st0_de          <= 1'bx;
            st0_user        <= {USER_BITS{1'bx}};
            st0_data        <= {C{1'bx}};
            st0_valid       <= 1'b0;
            
            st1_line_first  <= 1'bx;
            st1_line_last   <= 1'bx;
            st1_pixel_first <= 1'bx;
            st1_pixel_last  <= 1'bx;
            st1_de          <= 1'bx;
            st1_user        <= {USER_BITS{1'bx}};
            st1_data        <= {C{1'bx}};
            st1_valid       <= 1'b0;
        end
        else if ( cke ) begin
            // stage 0
            if ( img_blk_valid && img_blk_line_first ) begin
                st0_n_count <= {N_WIDTH{1'b0}};
            end
            else begin
                if ( img_blk_valid && img_blk_pixel_first ) begin
                    st0_n_count <= st0_n_count + 1;
                    if ( st0_n_count == (N - 1) ) begin
                        st0_n_count <= {N_WIDTH{1'b0}};
                    end
                end
            end
            
            if ( img_blk_valid && img_blk_pixel_first ) begin
                st0_m_count <= {M_WIDTH{1'b0}};
            end
            else begin
                if ( img_blk_valid && img_blk_de ) begin
                    st0_m_count <= st0_m_count + 1;
                    if ( st0_m_count == (M - 1) ) begin
                        st0_m_count <= {M_WIDTH{1'b0}};
                    end
                end
            end
            
            st0_line_first  <= img_blk_line_first;
            st0_line_last   <= img_blk_line_last;
            st0_pixel_first <= img_blk_pixel_first;
            st0_pixel_last  <= img_blk_pixel_last;
            st0_de          <= img_blk_de;
            st0_user        <= img_blk_user;
            st0_valid       <= img_blk_valid;
            
            for ( i = 0; i < C; i = i+1 ) begin
                st0_data[i] <= 1'b0;
                for ( j = 0; j < N; j = j+1 ) begin
                    for ( k = 0; k < M; k = k+1 ) begin
                        if ( img_blk_data[(j*M + k)*C + i] ) begin
                            st0_data[i] <= 1'b1;
                        end
                    end
                end
            end
            
            // stage 1
            st1_line_first  <= st0_line_first;
            st1_line_last   <= st0_line_last;
            st1_pixel_first <= st0_pixel_first;
            st1_pixel_last  <= st0_pixel_last;
            st1_de          <= st0_de && (st0_n_count == NC && st0_m_count == MC);
            st1_user        <= st0_user;
            st1_data        <= st0_data;
            st1_valid       <= st0_valid;
            
        end
    end
    
    
    assign m_img_line_first  = st1_line_first;
    assign m_img_line_last   = st1_line_last;
    assign m_img_pixel_first = st1_pixel_first;
    assign m_img_pixel_last  = st1_pixel_last;
    assign m_img_de          = st1_de;
    assign m_img_user        = st1_user;
    assign m_img_data        = st1_data;
    assign m_img_valid       = st1_valid;
    
    
endmodule


`default_nettype wire


// end of file
