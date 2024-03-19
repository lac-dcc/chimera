// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_blk_buffer
        #(
            parameter   USER_WIDTH   = 0,
            parameter   DATA_WIDTH   = 36,
            parameter   PIXEL_NUM    = 3,
            parameter   LINE_NUM     = 3,
            parameter   PIXEL_CENTER = PIXEL_NUM / 2,
            parameter   LINE_CENTER  = LINE_NUM  / 2,
            parameter   MAX_X_NUM    = 1024,
            parameter   BORDER_MODE  = "REFLECT_101",           // NONE, CONSTANT, REPLICATE, REFLECT, REFLECT_101
            parameter   BORDER_VALUE = {DATA_WIDTH{1'b0}},
            parameter   RAM_TYPE     = "block",
            parameter   ENDIAN       = 0,                   // 0: little, 1:big
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                        reset,
            input   wire                                        clk,
            input   wire                                        cke,
            
            // slave (input)
            input   wire                                        s_img_line_first,
            input   wire                                        s_img_line_last,
            input   wire                                        s_img_pixel_first,
            input   wire                                        s_img_pixel_last,
            input   wire                                        s_img_de,
            input   wire    [USER_BITS-1:0]                     s_img_user,
            input   wire    [DATA_WIDTH-1:0]                    s_img_data,
            input   wire                                        s_img_valid,
            
            // master (output)
            output  wire                                        m_img_line_first,
            output  wire                                        m_img_line_last,
            output  wire                                        m_img_pixel_first,
            output  wire                                        m_img_pixel_last,
            output  wire                                        m_img_de,
            output  wire    [USER_BITS-1:0]                     m_img_user,
            output  wire    [LINE_NUM*PIXEL_NUM*DATA_WIDTH-1:0] m_img_data,
            output  wire                                        m_img_valid
        );
    
    wire                                img_lbuf_line_first;
    wire                                img_lbuf_line_last;
    wire                                img_lbuf_pixel_first;
    wire                                img_lbuf_pixel_last;
    wire                                img_lbuf_de;
    wire    [USER_BITS-1:0]             img_lbuf_user;
    wire    [LINE_NUM*DATA_WIDTH-1:0]   img_lbuf_data;
    wire                                img_lbuf_valid;
    
//  jelly_img_line_buffer_series
    jelly_img_line_buffer
            #(
                .USER_WIDTH             (USER_WIDTH),
                .DATA_WIDTH             (DATA_WIDTH),
                .LINE_NUM               (LINE_NUM),
                .LINE_CENTER            (LINE_CENTER),
                .MAX_X_NUM              (MAX_X_NUM),
                .BORDER_MODE            (BORDER_MODE),
                .BORDER_VALUE           (BORDER_VALUE),
                .RAM_TYPE               (RAM_TYPE),
                .ENDIAN                 (ENDIAN)
            )
        i_img_line_buffer
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_img_line_first       (s_img_line_first),
                .s_img_line_last        (s_img_line_last),
                .s_img_pixel_first      (s_img_pixel_first),
                .s_img_pixel_last       (s_img_pixel_last),
                .s_img_de               (s_img_de),
                .s_img_user             (s_img_user),
                .s_img_data             (s_img_data),
                .s_img_valid            (s_img_valid),
                
                .m_img_line_first       (img_lbuf_line_first),
                .m_img_line_last        (img_lbuf_line_last),
                .m_img_pixel_first      (img_lbuf_pixel_first),
                .m_img_pixel_last       (img_lbuf_pixel_last),
                .m_img_de               (img_lbuf_de),
                .m_img_user             (img_lbuf_user),
                .m_img_data             (img_lbuf_data),
                .m_img_valid            (img_lbuf_valid)
            );
    
    wire                                        img_pbuf_line_first;
    wire                                        img_pbuf_line_last;
    wire                                        img_pbuf_pixel_first;
    wire                                        img_pbuf_pixel_last;
    wire                                        img_pbuf_de;
    wire    [USER_BITS-1:0]                     img_pbuf_user;
    wire    [PIXEL_NUM*LINE_NUM*DATA_WIDTH-1:0] img_pbuf_data;
    wire                                        img_pbuf_valid;
    
    jelly_img_pixel_buffer
            #(
                .USER_WIDTH             (USER_WIDTH),
                .DATA_WIDTH             (LINE_NUM*DATA_WIDTH),
                .PIXEL_NUM              (PIXEL_NUM),
                .PIXEL_CENTER           (PIXEL_CENTER),
                .BORDER_MODE            (BORDER_MODE),
                .BORDER_VALUE           (BORDER_VALUE),
                .ENDIAN                 (ENDIAN)
            )
        i_img_pixel_buffer
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_img_line_first       (img_lbuf_line_first),
                .s_img_line_last        (img_lbuf_line_last),
                .s_img_pixel_first      (img_lbuf_pixel_first),
                .s_img_pixel_last       (img_lbuf_pixel_last),
                .s_img_de               (img_lbuf_de),
                .s_img_user             (img_lbuf_user),
                .s_img_data             (img_lbuf_data),
                .s_img_valid            (img_lbuf_valid),
                
                .m_img_line_first       (img_pbuf_line_first),
                .m_img_line_last        (img_pbuf_line_last),
                .m_img_pixel_first      (img_pbuf_pixel_first),
                .m_img_pixel_last       (img_pbuf_pixel_last),
                .m_img_de               (img_pbuf_de),
                .m_img_user             (img_pbuf_user),
                .m_img_data             (img_pbuf_data),
                .m_img_valid            (img_pbuf_valid)
            );
    
    assign m_img_line_first  = img_pbuf_line_first;
    assign m_img_line_last   = img_pbuf_line_last;
    assign m_img_pixel_first = img_pbuf_pixel_first;
    assign m_img_pixel_last  = img_pbuf_pixel_last;
    assign m_img_de          = img_pbuf_de;
    assign m_img_user        = img_pbuf_user;
    assign m_img_valid       = img_pbuf_valid;
    
    genvar          x, y;
    generate
    for ( y = 0; y < LINE_NUM; y = y+1 ) begin : y_loop
        for ( x = 0; x < PIXEL_NUM; x = x+1 ) begin : x_loop
            assign m_img_data[(y*PIXEL_NUM+x)*DATA_WIDTH +: DATA_WIDTH] = img_pbuf_data[(x*LINE_NUM+y)*DATA_WIDTH +: DATA_WIDTH];
        end
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
