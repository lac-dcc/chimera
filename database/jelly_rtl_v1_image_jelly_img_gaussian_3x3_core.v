// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_gaussian_3x3_core
        #(
            parameter   COMPONENTS     = 1,
            parameter   USER_WIDTH     = 0,
            parameter   DATA_WIDTH     = 8,
            parameter   OUT_DATA_WIDTH = DATA_WIDTH,
            parameter   MAX_X_NUM      = 4096,
            parameter   RAM_TYPE       = "block",
            parameter   USE_VALID      = 0,
            
            parameter   S_DATA_WIDTH   = COMPONENTS * DATA_WIDTH,
            parameter   M_DATA_WIDTH   = COMPONENTS * OUT_DATA_WIDTH,
            parameter   USER_BITS      = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        enable,
            
            input   wire                        s_img_line_first,
            input   wire                        s_img_line_last,
            input   wire                        s_img_pixel_first,
            input   wire                        s_img_pixel_last,
            input   wire                        s_img_de,
            input   wire    [USER_BITS-1:0]     s_img_user,
            input   wire    [S_DATA_WIDTH-1:0]  s_img_data,
            input   wire                        s_img_valid,
            
            output  wire                        m_img_line_first,
            output  wire                        m_img_line_last,
            output  wire                        m_img_pixel_first,
            output  wire                        m_img_pixel_last,
            output  wire                        m_img_de,
            output  wire    [USER_BITS-1:0]     m_img_user,
            output  wire    [M_DATA_WIDTH-1:0]  m_img_data,
            output  wire                        m_img_valid
        );
    
    localparam M = 3;
    localparam N = 3;
    
    wire                            img_blk_line_first;
    wire                            img_blk_line_last;
    wire                            img_blk_pixel_first;
    wire                            img_blk_pixel_last;
    wire    [USER_BITS-1:0]         img_blk_user;
    wire                            img_blk_de;
    wire    [M*N*S_DATA_WIDTH-1:0]  img_blk_data;
    wire                            img_blk_valid;
    
    jelly_img_blk_buffer
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (S_DATA_WIDTH),
                .LINE_NUM           (M),
                .PIXEL_NUM          (N),
                .MAX_X_NUM          (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .BORDER_MODE        ("REPLICATE")
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
    
    genvar i, j;
    generate
    for ( i = 0; i < COMPONENTS; i = i+1 ) begin : loop_unit
        wire    [M*N*DATA_WIDTH-1:0]  in_data;
        for ( j = 0; j < M*N; j = j+1 ) begin : loop_data
            assign in_data[j*DATA_WIDTH +: DATA_WIDTH] = img_blk_data[j*S_DATA_WIDTH + i*DATA_WIDTH +: DATA_WIDTH];
        end
        
        jelly_img_gaussian_3x3_calc
                #(
                    .DATA_WIDTH         (DATA_WIDTH),
                    .OUT_DATA_WIDTH     (OUT_DATA_WIDTH)
                )
            i_img_gaussian_3x3_calc
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .enable             (enable),
                    
                    .in_data            (in_data),
                    
                    .out_data           (m_img_data[OUT_DATA_WIDTH*i +: OUT_DATA_WIDTH])
                );
    end
    endgenerate
    
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (4),
                .USE_VALID          (USE_VALID)
            )
        i_img_delay
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_img_line_first   (img_blk_line_first),
                .s_img_line_last    (img_blk_line_last),
                .s_img_pixel_first  (img_blk_pixel_first),
                .s_img_pixel_last   (img_blk_pixel_last),
                .s_img_de           (img_blk_de),
                .s_img_user         (img_blk_user),
                .s_img_valid        (img_blk_valid),
                
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
