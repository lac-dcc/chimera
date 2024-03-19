// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_pixel_buffer
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 31*8,
            parameter   PIXEL_NUM    = 31,
            parameter   PIXEL_CENTER = PIXEL_NUM / 2,
            parameter   BORDER_MODE  = "REPLICATE",         // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            parameter   BORDER_VALUE = {DATA_WIDTH{1'b0}},  // BORDER_MODE == "CONSTANT"
            parameter   ENDIAN       = 0,                   // 0: little, 1:big
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            // slave (input)
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire    [USER_BITS-1:0]             s_img_user,
            input   wire    [DATA_WIDTH-1:0]            s_img_data,
            input   wire                                s_img_valid,
            
            // master (output)
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire    [USER_BITS-1:0]             m_img_user,
            output  wire    [PIXEL_NUM*DATA_WIDTH-1:0]  m_img_data,
            output  wire                                m_img_valid
        );
    
    localparam  CENTER      = ENDIAN ? PIXEL_CENTER : PIXEL_NUM-1 - PIXEL_CENTER;
    localparam  REFLECT_NUM = (CENTER > 0 ? CENTER+1 : 1) + 1;
    
    genvar      i;
    integer     j, k;
    
    wire    ss_img_line_first  = s_img_valid & s_img_line_first;
    wire    ss_img_line_last   = s_img_valid & s_img_line_last;
    wire    ss_img_pixel_first = s_img_valid & s_img_pixel_first;
    wire    ss_img_pixel_last  = s_img_valid & s_img_pixel_last;
    wire    ss_img_de          = s_img_valid & s_img_de;
    
    generate
    if ( PIXEL_NUM > 1 ) begin : blk_border
        reg     [CENTER-1:0]                    st0_buf_line_first;
        reg     [CENTER-1:0]                    st0_buf_line_last;
        reg     [CENTER-1:0]                    st0_buf_pixel_first;
        reg     [CENTER-1:0]                    st0_buf_pixel_last;
        reg     [CENTER-1:0]                    st0_buf_de;
        reg     [(CENTER+1)*USER_BITS-1:0]      st0_buf_user;
        reg     [(PIXEL_NUM-1)*DATA_WIDTH-1:0]  st0_buf_data;
        reg     [CENTER-1:0]                    st0_buf_valid;
        wire    [CENTER:0]                      st0_line_first  = {st0_buf_line_first,  ss_img_line_first};
        wire    [CENTER:0]                      st0_line_last   = {st0_buf_line_last,   ss_img_line_last};
        wire    [CENTER:0]                      st0_pixel_first = {st0_buf_pixel_first, ss_img_pixel_first};
        wire    [CENTER:0]                      st0_pixel_last  = {st0_buf_pixel_last,  ss_img_pixel_last};
        wire    [CENTER:0]                      st0_de          = {st0_buf_de,          ss_img_de};
        wire    [(CENTER+1)*USER_BITS-1:0]      st0_user        = {st0_buf_user,        s_img_user};
        wire    [PIXEL_NUM*DATA_WIDTH-1:0]      st0_data        = {st0_buf_data,        s_img_data};
        wire    [CENTER:0]                      st0_valid       = {st0_buf_valid,       s_img_valid};
        
        reg     [REFLECT_NUM*DATA_WIDTH-1:0]    st0_reflect;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st0_buf_line_first  <= {((PIXEL_NUM-1)){1'b0}};
                st0_buf_line_last   <= {((PIXEL_NUM-1)){1'b0}};
                st0_buf_pixel_first <= {((PIXEL_NUM-1)){1'b0}};
                st0_buf_pixel_last  <= {((PIXEL_NUM-1)){1'b0}};
                st0_buf_de          <= {((PIXEL_NUM-1)){1'b0}};
                st0_buf_user        <= {((CENTER+1)*USER_BITS){1'bx}};
                st0_buf_data        <= {((PIXEL_NUM-1)*DATA_WIDTH){1'bx}};
                st0_buf_valid       <= {((PIXEL_NUM-1)){1'b0}};
            end
            else if ( cke ) begin
                st0_buf_line_first  <= {st0_buf_line_first,  s_img_line_first};
                st0_buf_line_last   <= {st0_buf_line_last,   s_img_line_last};
                st0_buf_pixel_first <= {st0_buf_pixel_first, s_img_pixel_first};
                st0_buf_pixel_last  <= {st0_buf_pixel_last,  s_img_pixel_last};
                st0_buf_de          <= {st0_buf_de,          s_img_de};
                st0_buf_user        <= {st0_buf_user,        s_img_user};
                st0_buf_data        <= {st0_buf_data,        s_img_data};
                st0_buf_valid       <= {st0_buf_valid,       s_img_valid};
                
                st0_reflect <= (st0_reflect >> DATA_WIDTH);
                if ( st0_pixel_last[0] ) begin
                    st0_reflect <= st0_data;
                end
            end
        end
        
        
        reg                                 st1_line_first;
        reg                                 st1_line_last;
        reg                                 st1_pixel_first;
        reg                                 st1_pixel_last;
        reg                                 st1_de;
        reg     [USER_BITS-1:0]             st1_user;
        reg     [PIXEL_NUM*DATA_WIDTH-1:0]  st1_data;
        reg                                 st1_last_en;
        reg                                 st1_valid;
        
        always @(posedge clk) begin
            if ( reset ) begin
                st1_line_first  <= 1'b0;
                st1_line_last   <= 1'b0;
                st1_pixel_first <= 1'b0;
                st1_pixel_last  <= 1'b0;
                st1_de          <= 1'b0;
                st1_user        <= {USER_BITS{1'bx}};
                st1_data        <= {(PIXEL_NUM*DATA_WIDTH){1'bx}};
                st1_last_en     <= 1'bx;
                st1_valid       <= 1'b0;
            end
            else if ( cke ) begin
                st1_line_first  <= st0_line_first[CENTER];
                st1_line_last   <= st0_line_last[CENTER];
                st1_pixel_first <= st0_pixel_first[CENTER];
                st1_pixel_last  <= st0_pixel_last[CENTER];
                st1_de          <= st0_de[CENTER];
                st1_user        <= st0_user[CENTER*USER_BITS +: USER_BITS];
                st1_valid       <= st0_valid[CENTER];
                if ( st0_pixel_first[CENTER] ) begin
                    st1_data  <= st0_data;
                end
                else begin
                    st1_data  <= {st1_data, st0_data[DATA_WIDTH-1:0]};
                end
                
                
                // left border
                if ( st0_pixel_first[CENTER] ) begin
                    for ( j = CENTER+1; j < PIXEL_NUM; j=j+1 ) begin
                        if ( BORDER_MODE == "CONSTANT" ) begin
                            st1_data[j*DATA_WIDTH +: DATA_WIDTH] <= BORDER_VALUE;
                        end
                        else if ( BORDER_MODE == "REPLICATE" ) begin
                            st1_data[j*DATA_WIDTH +: DATA_WIDTH] <= st0_data[CENTER*DATA_WIDTH +: DATA_WIDTH];
                        end
                        else if ( BORDER_MODE == "REFLECT" ) begin
                            k = CENTER + 1 - (j - CENTER);
                            if ( k < 0 ) begin k = 0; end
                            st1_data[j*DATA_WIDTH +: DATA_WIDTH] <= st0_data[k*DATA_WIDTH +: DATA_WIDTH];
                        end
                        else if ( BORDER_MODE == "REFLECT_101" ) begin
                            k = CENTER - (j - CENTER);
                            if ( k < 0 ) begin k = 0; end
                            st1_data[j*DATA_WIDTH +: DATA_WIDTH] <= st0_data[k*DATA_WIDTH +: DATA_WIDTH];
                        end
                    end
                end
                
                
                // right border
                if ( st0_pixel_first[CENTER] ) begin
                    st1_last_en <= 1'b0;
                end
                else if ( st0_pixel_last[0] ) begin
                    st1_last_en <= 1'b1;
                end
                
                if ( !st0_pixel_first[CENTER] && st1_last_en ) begin
                    if ( BORDER_MODE == "CONSTANT" ) begin
                        st1_data[DATA_WIDTH-1:0] <= BORDER_VALUE;
                    end
                    else if ( BORDER_MODE == "REPLICATE" ) begin
                        st1_data[DATA_WIDTH-1:0] <= st1_data[DATA_WIDTH-1:0];
                    end
                    else if ( BORDER_MODE == "REFLECT" ) begin
                        st1_data[DATA_WIDTH-1:0] <= st0_reflect[0*DATA_WIDTH +: DATA_WIDTH];
                    end
                    else if ( BORDER_MODE == "REFLECT_101" ) begin
                        st1_data[DATA_WIDTH-1:0] <= st0_reflect[1*DATA_WIDTH +: DATA_WIDTH];
                    end
                end
            end
        end
        
        wire                                out_line_first;
        wire                                out_line_last;
        wire                                out_pixel_first;
        wire                                out_pixel_last;
        wire                                out_de;
        wire    [USER_BITS-1:0]             out_user;
        wire    [PIXEL_NUM*DATA_WIDTH-1:0]  out_data;
        wire                                out_valid;
        
        if ( BORDER_MODE == "NONE" ) begin
            assign out_line_first  = st0_line_first[CENTER];
            assign out_line_last   = st0_line_last[CENTER];
            assign out_pixel_first = st0_pixel_first[CENTER];
            assign out_pixel_last  = st0_pixel_last[CENTER];
            assign out_de          = st0_de[CENTER];
            assign out_user        = st0_user[CENTER*USER_BITS +: USER_BITS];
            assign out_data        = st0_data;
            assign out_valid       = st0_valid[CENTER];
        end
        else begin
            assign out_line_first  = st1_line_first;
            assign out_line_last   = st1_line_last;
            assign out_pixel_first = st1_pixel_first;
            assign out_pixel_last  = st1_pixel_last;
            assign out_de          = st1_de;
            assign out_user        = st1_user;
            assign out_data        = st1_data;
            assign out_valid       = st1_valid;
        end
        
        
        assign m_img_line_first  = out_line_first;
        assign m_img_line_last   = out_line_last;
        assign m_img_pixel_first = out_pixel_first;
        assign m_img_pixel_last  = out_pixel_last;
        assign m_img_de          = out_de;
        assign m_img_user        = out_user;
        assign m_img_valid       = out_valid;
        for ( i = 0; i < PIXEL_NUM; i = i+1 ) begin :loop_endian
            if ( ENDIAN ) begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[i*DATA_WIDTH +: DATA_WIDTH];
            end
            else begin
                assign m_img_data[i*DATA_WIDTH +: DATA_WIDTH] = out_data[(PIXEL_NUM-1-i)*DATA_WIDTH +: DATA_WIDTH];
            end
        end
    end
    else begin
        assign m_img_line_first  = s_img_line_first;
        assign m_img_line_last   = s_img_line_last;
        assign m_img_pixel_first = s_img_pixel_first;
        assign m_img_pixel_last  = s_img_pixel_last;
        assign m_img_de          = s_img_de;
        assign m_img_user        = s_img_user;
        assign m_img_data        = s_img_data;
        assign m_img_valid       = s_img_valid;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
