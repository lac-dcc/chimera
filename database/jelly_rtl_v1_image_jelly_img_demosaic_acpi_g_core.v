// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_demosaic_acpi_g_core
        #(
            parameter   USER_WIDTH = 0,
            parameter   DATA_WIDTH = 10,
            parameter   MAX_X_NUM  = 4096,
            parameter   RAM_TYPE   = "block",
            parameter   USE_VALID  = 0,
            
            parameter   USER_BITS  = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,

            input   wire    [1:0]                   param_phase,
           
            input   wire                            s_img_line_first,
            input   wire                            s_img_line_last,
            input   wire                            s_img_pixel_first,
            input   wire                            s_img_pixel_last,
            input   wire                            s_img_de,
            input   wire    [USER_BITS-1:0]         s_img_user,
            input   wire    [DATA_WIDTH-1:0]        s_img_raw,
            input   wire                            s_img_valid,
            
            output  wire                            m_img_line_first,
            output  wire                            m_img_line_last,
            output  wire                            m_img_pixel_first,
            output  wire                            m_img_pixel_last,
            output  wire                            m_img_de,
            output  wire    [USER_BITS-1:0]         m_img_user,
            output  wire    [DATA_WIDTH-1:0]        m_img_raw,
            output  wire    [DATA_WIDTH-1:0]        m_img_g,
            output  wire                            m_img_valid
        );
    
    
    wire                            img_blk_line_first;
    wire                            img_blk_line_last;
    wire                            img_blk_pixel_first;
    wire                            img_blk_pixel_last;
    wire    [USER_BITS-1:0]         img_blk_user;
    wire                            img_blk_de;
    wire    [5*5*DATA_WIDTH-1:0]    img_blk_raw;
    wire                            img_blk_valid;
    
    jelly_img_blk_buffer
            #(
                .USER_WIDTH         (USER_WIDTH),
                .DATA_WIDTH         (DATA_WIDTH),
                .LINE_NUM           (5),
                .PIXEL_NUM          (5),
                .MAX_X_NUM          (MAX_X_NUM),
                .RAM_TYPE           (RAM_TYPE),
                .BORDER_MODE        ("REFLECT_101")
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
                .s_img_data         (s_img_raw),
                .s_img_valid        (s_img_valid),
                
                .m_img_line_first   (img_blk_line_first),
                .m_img_line_last    (img_blk_line_last),
                .m_img_pixel_first  (img_blk_pixel_first),
                .m_img_pixel_last   (img_blk_pixel_last),
                .m_img_de           (img_blk_de),
                .m_img_user         (img_blk_user),
                .m_img_data         (img_blk_raw),
                .m_img_valid        (img_blk_valid)
            );
    
    jelly_img_demosaic_acpi_g_calc
            #(
                .DATA_WIDTH         (DATA_WIDTH)
            )
        i_img_demosaic_acpi_g_calc
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),

                .param_phase        (param_phase),
                
                .in_line_first      (img_blk_line_first  & img_blk_valid),
                .in_pixel_first     (img_blk_pixel_first & img_blk_valid),
                .in_raw             (img_blk_raw),
                
                .out_raw            (m_img_raw),
                .out_g              (m_img_g)
            );
    
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (7),
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
