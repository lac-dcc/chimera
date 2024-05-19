// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- the soft-core processor system
//   math
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module image_processing
        #(
            parameter   WB_ADR_WIDTH   = 14,
            parameter   WB_DAT_SIZE    = 2,
            parameter   WB_DAT_WIDTH   = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH   = (WB_DAT_WIDTH / 8),
            
            parameter   DATA_WIDTH     = 10,
            parameter   ANGLE_WIDTH    = 24,
            parameter   ATAN2_X_WIDTH  = 24,
            parameter   ATAN2_Y_WIDTH  = 24,
            
            parameter   TUSER_WIDTH    = 1,
            parameter   S_TDATA_WIDTH  = DATA_WIDTH,
            parameter   M_TDATA_WIDTH  = 4*DATA_WIDTH,
            
            parameter   IMG_X_NUM      = 640,
            parameter   IMG_Y_NUM      = 132,
            parameter   IMG_X_WIDTH    = 14,
            parameter   IMG_Y_WIDTH    = 14,
            
            parameter   CENTER_Q_WIDTH = 0,
            parameter   CENTER_X_WIDTH = IMG_X_WIDTH + CENTER_Q_WIDTH,
            parameter   CENTER_Y_WIDTH = IMG_Y_WIDTH + CENTER_Q_WIDTH
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            
            input   wire                            in_update_req,
            
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            input   wire    [TUSER_WIDTH-1:0]       s_axi4s_tuser,
            input   wire                            s_axi4s_tlast,
            input   wire    [S_TDATA_WIDTH-1:0]     s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            output  wire    [TUSER_WIDTH-1:0]       m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [M_TDATA_WIDTH-1:0]     m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            input   wire                            out_reset,
            input   wire                            out_clk,
            output  wire    [ANGLE_WIDTH-1:0]       out_angle,
            output  wire                            out_valid
        );
    
    
    // axi4s to image
    localparam  USE_VALID = 0;
    
    wire                                reset = ~aresetn;
    wire                                clk   = aclk;
    wire                                cke;
    
    wire                                img_src_line_first;
    wire                                img_src_line_last;
    wire                                img_src_pixel_first;
    wire                                img_src_pixel_last;
    wire                                img_src_de;
    wire    [TUSER_WIDTH-1:0]           img_src_user;
    wire    [S_TDATA_WIDTH-1:0]         img_src_data;
    wire                                img_src_valid;
    
    wire                                img_sink_line_first;
    wire                                img_sink_line_last;
    wire                                img_sink_pixel_first;
    wire                                img_sink_pixel_last;
    wire                                img_sink_de;
    wire    [TUSER_WIDTH-1:0]           img_sink_user;
    wire    [M_TDATA_WIDTH-1:0]         img_sink_data;
    wire                                img_sink_valid;
    
    // img
    jelly_axi4s_img
            #(
                .TUSER_WIDTH                (TUSER_WIDTH),
                .S_TDATA_WIDTH              (DATA_WIDTH),
                .M_TDATA_WIDTH              (4*DATA_WIDTH),
                .IMG_Y_NUM                  (IMG_Y_NUM),
                .IMG_Y_WIDTH                (IMG_Y_WIDTH),
                .BLANK_Y_WIDTH              (8),
                .IMG_CKE_BUFG               (0)
            )
        jelly_axi4s_img
            (
                .reset                      (reset),
                .clk                        (clk),
                
                .param_blank_num            (8'h20),
                
                .s_axi4s_tdata              (s_axi4s_tdata),
                .s_axi4s_tlast              (s_axi4s_tlast),
                .s_axi4s_tuser              (s_axi4s_tuser),
                .s_axi4s_tvalid             (s_axi4s_tvalid),
                .s_axi4s_tready             (s_axi4s_tready),
                
                .m_axi4s_tdata              (m_axi4s_tdata),
                .m_axi4s_tlast              (m_axi4s_tlast),
                .m_axi4s_tuser              (m_axi4s_tuser),
                .m_axi4s_tvalid             (m_axi4s_tvalid),
                .m_axi4s_tready             (m_axi4s_tready),
                
                
                .img_cke                    (cke),
                
                .src_img_line_first         (img_src_line_first),
                .src_img_line_last          (img_src_line_last),
                .src_img_pixel_first        (img_src_pixel_first),
                .src_img_pixel_last         (img_src_pixel_last),
                .src_img_de                 (img_src_de),
                .src_img_user               (img_src_user),
                .src_img_data               (img_src_data),
                .src_img_valid              (img_src_valid),
                
                .sink_img_line_first        (img_sink_line_first),
                .sink_img_line_last         (img_sink_line_last),
                .sink_img_pixel_first       (img_sink_pixel_first),
                .sink_img_pixel_last        (img_sink_pixel_last),
                .sink_img_user              (img_sink_user),
                .sink_img_de                (img_sink_de),
                .sink_img_data              (img_sink_data),
                .sink_img_valid             (img_sink_valid)
            );
    
    
    
    // demosaic
    wire                           img_demos_line_first;
    wire                           img_demos_line_last;
    wire                           img_demos_pixel_first;
    wire                           img_demos_pixel_last;
    wire                           img_demos_de;
    wire    [TUSER_WIDTH-1:0]      img_demos_user;
    wire    [DATA_WIDTH-1:0]       img_demos_raw;
    wire    [DATA_WIDTH-1:0]       img_demos_r;
    wire    [DATA_WIDTH-1:0]       img_demos_g;
    wire    [DATA_WIDTH-1:0]       img_demos_b;
    wire                           img_demos_valid;
    
    wire    [WB_DAT_WIDTH-1:0]     wb_demos_dat_o;
    wire                           wb_demos_stb_i;
    wire                           wb_demos_ack_o;
    
    jelly_img_demosaic_acpi
            #(
                .USER_WIDTH                 (TUSER_WIDTH),
                .DATA_WIDTH                 (DATA_WIDTH),
                .MAX_X_NUM                  (4096),
                .RAM_TYPE                   ("block"),
                .USE_VALID                  (USE_VALID),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .INIT_PARAM_PHASE           (2'b11)
            )
        i_img_demosaic_acpi
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .in_update_req              (in_update_req),
                
                .s_wb_rst_i                 (s_wb_rst_i),
                .s_wb_clk_i                 (s_wb_clk_i),
                .s_wb_adr_i                 (s_wb_adr_i[7:0]),
                .s_wb_dat_i                 (s_wb_dat_i),
                .s_wb_dat_o                 (wb_demos_dat_o),
                .s_wb_we_i                  (s_wb_we_i),
                .s_wb_sel_i                 (s_wb_sel_i),
                .s_wb_stb_i                 (wb_demos_stb_i),
                .s_wb_ack_o                 (wb_demos_ack_o),
                
                .s_img_line_first           (img_src_line_first),
                .s_img_line_last            (img_src_line_last),
                .s_img_pixel_first          (img_src_pixel_first),
                .s_img_pixel_last           (img_src_pixel_last),
                .s_img_de                   (img_src_de),
                .s_img_user                 (img_src_user),
                .s_img_raw                  (img_src_data),
                .s_img_valid                (img_src_valid),
                
                .m_img_line_first           (img_demos_line_first),
                .m_img_line_last            (img_demos_line_last),
                .m_img_pixel_first          (img_demos_pixel_first),
                .m_img_pixel_last           (img_demos_pixel_last),
                .m_img_de                   (img_demos_de),
                .m_img_user                 (img_demos_user),
                .m_img_raw                  (img_demos_raw),
                .m_img_r                    (img_demos_r),
                .m_img_g                    (img_demos_g),
                .m_img_b                    (img_demos_b),
                .m_img_valid                (img_demos_valid)
            );
    
    
    // color matrix
    wire                           img_colmat_line_first;
    wire                           img_colmat_line_last;
    wire                           img_colmat_pixel_first;
    wire                           img_colmat_pixel_last;
    wire                           img_colmat_de;
    wire    [TUSER_WIDTH-1:0]      img_colmat_user;
    wire    [M_TDATA_WIDTH-1:0]    img_colmat_data;
    wire                           img_colmat_valid;
    
    wire    [WB_DAT_WIDTH-1:0]     wb_colmat_dat_o;
    wire                           wb_colmat_stb_i;
    wire                           wb_colmat_ack_o;
    
    jelly_img_color_matrix
            #(
                .USER_WIDTH                 (TUSER_WIDTH+10),
                .DATA_WIDTH                 (DATA_WIDTH),
                .INTERNAL_WIDTH             (DATA_WIDTH+2),
                
                .COEFF_INT_WIDTH            (9),
                .COEFF_FRAC_WIDTH           (16),
                .COEFF3_INT_WIDTH           (9),
                .COEFF3_FRAC_WIDTH          (16),
                .STATIC_COEFF               (1),
                .DEVICE                     ("7SERIES"),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                
                .INIT_PARAM_MATRIX00        (2 << 16),
                .INIT_PARAM_MATRIX01        (0),
                .INIT_PARAM_MATRIX02        (0),
                .INIT_PARAM_MATRIX03        (0),
                .INIT_PARAM_MATRIX10        (0),
                .INIT_PARAM_MATRIX11        (1 << 16),
                .INIT_PARAM_MATRIX12        (0),
                .INIT_PARAM_MATRIX13        (0),
                .INIT_PARAM_MATRIX20        (0),
                .INIT_PARAM_MATRIX21        (0),
                .INIT_PARAM_MATRIX22        (2 << 16),
                .INIT_PARAM_MATRIX23        (0),
                .INIT_PARAM_CLIP_MIN0       ({DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX0       ({DATA_WIDTH{1'b1}}),
                .INIT_PARAM_CLIP_MIN1       ({DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX1       ({DATA_WIDTH{1'b1}}),
                .INIT_PARAM_CLIP_MIN2       ({DATA_WIDTH{1'b0}}),
                .INIT_PARAM_CLIP_MAX2       ({DATA_WIDTH{1'b1}})
            )
        i_img_color_matrix
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .in_update_req              (in_update_req),
                
                .s_wb_rst_i                 (s_wb_rst_i),
                .s_wb_clk_i                 (s_wb_clk_i),
                .s_wb_adr_i                 (s_wb_adr_i[7:0]),
                .s_wb_dat_i                 (s_wb_dat_i),
                .s_wb_dat_o                 (wb_colmat_dat_o),
                .s_wb_we_i                  (s_wb_we_i),
                .s_wb_sel_i                 (s_wb_sel_i),
                .s_wb_stb_i                 (wb_colmat_stb_i),
                .s_wb_ack_o                 (wb_colmat_ack_o),
                
                .s_img_line_first           (img_demos_line_first),
                .s_img_line_last            (img_demos_line_last),
                .s_img_pixel_first          (img_demos_pixel_first),
                .s_img_pixel_last           (img_demos_pixel_last),
                .s_img_de                   (img_demos_de),
                .s_img_user                 ({img_demos_user, img_demos_raw}),
                .s_img_color0               (img_demos_r),
                .s_img_color1               (img_demos_g),
                .s_img_color2               (img_demos_b),
                .s_img_valid                (img_demos_valid),
                
                .m_img_line_first           (img_colmat_line_first),
                .m_img_line_last            (img_colmat_line_last),
                .m_img_pixel_first          (img_colmat_pixel_first),
                .m_img_pixel_last           (img_colmat_pixel_last),
                .m_img_de                   (img_colmat_de),
                .m_img_user                 ({img_colmat_user, img_colmat_data[DATA_WIDTH*3 +: DATA_WIDTH]}),
                .m_img_color0               (img_colmat_data[DATA_WIDTH*2 +: DATA_WIDTH]),
                .m_img_color1               (img_colmat_data[DATA_WIDTH*1 +: DATA_WIDTH]),
                .m_img_color2               (img_colmat_data[DATA_WIDTH*0 +: DATA_WIDTH]),
                .m_img_valid                (img_colmat_valid)
            );
    
    
    // RGB to Gray
    wire                            img_gray_line_first;
    wire                            img_gray_line_last;
    wire                            img_gray_pixel_first;
    wire                            img_gray_pixel_last;
    wire                            img_gray_de;
    wire    [DATA_WIDTH-1:0]        img_gray_data;
    wire                            img_gray_valid;
    
    jelly_img_rgb_to_gray
            #(
                .USER_WIDTH                 (0),
                .DATA_WIDTH                 (DATA_WIDTH)
            )
        i_img_rgb_to_gray
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_img_line_first           (img_colmat_line_first),
                .s_img_line_last            (img_colmat_line_last),
                .s_img_pixel_first          (img_colmat_pixel_first),
                .s_img_pixel_last           (img_colmat_pixel_last),
                .s_img_de                   (img_colmat_de),
                .s_img_user                 (),
                .s_img_rgb                  (img_colmat_data[3*DATA_WIDTH-1:0]),
                .s_img_valid                (img_colmat_valid),
                
                .m_img_line_first           (img_gray_line_first),
                .m_img_line_last            (img_gray_line_last),
                .m_img_pixel_first          (img_gray_pixel_first),
                .m_img_pixel_last           (img_gray_pixel_last),
                .m_img_de                   (img_gray_de),
                .m_img_user                 (),
                .m_img_rgb                  (),
                .m_img_gray                 (img_gray_data),
                .m_img_valid                (img_gray_valid)
            );
    
    
    // gaussian
    wire                            img_gauss_line_first;
    wire                            img_gauss_line_last;
    wire                            img_gauss_pixel_first;
    wire                            img_gauss_pixel_last;
    wire                            img_gauss_de;
    wire    [DATA_WIDTH-1:0]        img_gauss_data;
    wire                            img_gauss_valid;
    
    wire    [WB_DAT_WIDTH-1:0]      wb_gauss_dat_o;
    wire                            wb_gauss_stb_i;
    wire                            wb_gauss_ack_o;
    
    jelly_img_gaussian_3x3
            #(
                .NUM                        (4),
                
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .USER_WIDTH                 (0),
                .DATA_WIDTH                 (DATA_WIDTH),
                
                .INIT_CTL_CONTROL           (3'b111),
                .INIT_PARAM_ENABLE          (4'b1111)
            )
        i_img_gaussian_3x3
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .in_update_req              (in_update_req),
                
                .s_wb_rst_i                 (s_wb_rst_i),
                .s_wb_clk_i                 (s_wb_clk_i),
                .s_wb_adr_i                 (s_wb_adr_i[7:0]),
                .s_wb_dat_i                 (s_wb_dat_i),
                .s_wb_dat_o                 (wb_gauss_dat_o),
                .s_wb_we_i                  (s_wb_we_i),
                .s_wb_sel_i                 (s_wb_sel_i),
                .s_wb_stb_i                 (wb_gauss_stb_i),
                .s_wb_ack_o                 (wb_gauss_ack_o),
                
                .s_img_line_first           (img_gray_line_first),
                .s_img_line_last            (img_gray_line_last),
                .s_img_pixel_first          (img_gray_pixel_first),
                .s_img_pixel_last           (img_gray_pixel_last),
                .s_img_de                   (img_gray_de),
                .s_img_data                 (img_gray_data),
                .s_img_valid                (img_gray_valid),
                
                .m_img_line_first           (img_gauss_line_first),
                .m_img_line_last            (img_gauss_line_last),
                .m_img_pixel_first          (img_gauss_pixel_first),
                .m_img_pixel_last           (img_gauss_pixel_last),
                .m_img_de                   (img_gauss_de),
                .m_img_data                 (img_gauss_data),
                .m_img_valid                (img_gauss_valid)
            );
    
    
    // sobel
    localparam  GRAD_WIDTH = DATA_WIDTH + 1;
    
    wire                                img_sobel_line_first;
    wire                                img_sobel_line_last;
    wire                                img_sobel_pixel_first;
    wire                                img_sobel_pixel_last;
    wire                                img_sobel_de;
    wire            [DATA_WIDTH-1:0]    img_sobel_data;
    wire    signed  [GRAD_WIDTH-1:0]    img_sobel_grad_x;
    wire    signed  [GRAD_WIDTH-1:0]    img_sobel_grad_y;
    wire                                img_sobel_valid;
    
    jelly_img_sobel_core
            #(
                .USER_WIDTH                 (),
                .DATA_WIDTH                 (DATA_WIDTH),
                .GRAD_X_WIDTH               (GRAD_WIDTH),
                .GRAD_Y_WIDTH               (GRAD_WIDTH)
            )
        i_img_sobel_core
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_img_line_first           (img_gauss_line_first),
                .s_img_line_last            (img_gauss_line_last),
                .s_img_pixel_first          (img_gauss_pixel_first),
                .s_img_pixel_last           (img_gauss_pixel_last),
                .s_img_de                   (img_gauss_de),
                .s_img_data                 (img_gauss_data),
                .s_img_valid                (img_gauss_valid),
                
                .m_img_line_first           (img_sobel_line_first),
                .m_img_line_last            (img_sobel_line_last),
                .m_img_pixel_first          (img_sobel_pixel_first),
                .m_img_pixel_last           (img_sobel_pixel_last),
                .m_img_de                   (img_sobel_de),
                .m_img_data                 (img_sobel_data),
                .m_img_grad_x               (img_sobel_grad_x),
                .m_img_grad_y               (img_sobel_grad_y),
                .m_img_valid                (img_sobel_valid)
            );
    
    localparam  GRAD2_WIDTH  = 2 * GRAD_WIDTH;
    localparam  WEIGHT_WIDTH = GRAD_WIDTH + 3;
    
    wire                                img_xyss_line_first;
    wire                                img_xyss_line_last;
    wire                                img_xyss_pixel_first;
    wire                                img_xyss_pixel_last;
    wire                                img_xyss_de;
    wire    signed  [GRAD_WIDTH-1:0]    img_xyss_x;
    wire    signed  [GRAD_WIDTH-1:0]    img_xyss_y;
    wire    signed  [GRAD2_WIDTH-1:0]   img_xyss_grad2;
    wire    signed  [WEIGHT_WIDTH-1:0]  img_xyss_weight;
    wire                                img_xyss_valid;
    
    jelly_img_xy_ss
            #(
                .USER_WIDTH                 (0),
                .DATA_WIDTH                 (GRAD_WIDTH)
            )
        i_jelly_img_xy_ss
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_img_line_first           (img_sobel_line_first),
                .s_img_line_last            (img_sobel_line_last ),
                .s_img_pixel_first          (img_sobel_pixel_first),
                .s_img_pixel_last           (img_sobel_pixel_last),
                .s_img_de                   (img_sobel_de),
                .s_img_user                 (),
                .s_img_x                    (img_sobel_grad_x),
                .s_img_y                    (img_sobel_grad_y),
                .s_img_valid                (img_sobel_valid),
                
                .m_img_line_first           (img_xyss_line_first),
                .m_img_line_last            (img_xyss_line_last),
                .m_img_pixel_first          (img_xyss_pixel_first),
                .m_img_pixel_last           (img_xyss_pixel_last),
                .m_img_de                   (img_xyss_de),
                .m_img_user                 (),
                .m_img_x                    (img_xyss_x),
                .m_img_y                    (img_xyss_y),
                .m_img_ss                   (img_xyss_grad2),
                .m_img_valid                (img_xyss_valid)
            );
    
    assign img_xyss_weight = (img_xyss_grad2 >>> (GRAD2_WIDTH - WEIGHT_WIDTH));
    
    
    
    // mask
    wire                                img_mask_line_first;
    wire                                img_mask_line_last;
    wire                                img_mask_pixel_first;
    wire                                img_mask_pixel_last;
    wire                                img_mask_de;
    wire    signed  [GRAD_WIDTH-1:0]    img_mask_x;
    wire    signed  [GRAD_WIDTH-1:0]    img_mask_y;
    wire            [WEIGHT_WIDTH-1:0]  img_mask_weight;
    wire                                img_mask_mask;
    wire                                img_mask_valid;
    
    wire            [WB_DAT_WIDTH-1:0]  wb_mask_dat_o;
    wire                                wb_mask_stb_i;
    wire                                wb_mask_ack_o;
    
    jelly_img_area_mask
            #(
                .WB_ADR_WIDTH               (8),
                .WB_DAT_WIDTH               (WB_DAT_WIDTH),
                .USER_WIDTH                 (GRAD_WIDTH+GRAD_WIDTH),
                .DATA_WIDTH                 (WEIGHT_WIDTH),
                .X_WIDTH                    (IMG_X_WIDTH),
                .Y_WIDTH                    (IMG_Y_WIDTH),
                .USE_VALID                  (USE_VALID),
                .INIT_CTL_CONTROL           (3'b110),
                .INIT_PARAM_MASK_FLAG       (3'b1100),
                .INIT_PARAM_MASK_VALUE0     (0), //({GRAD_WIDTH{1'b0}}),
                .INIT_PARAM_MASK_VALUE1     (1), //({GRAD_WIDTH{1'b1}}),
                .INIT_PARAM_THRESH_FLAG     (3'b01),
                .INIT_PARAM_THRESH_VALUE    (100),
                .INIT_PARAM_RECT_FLAG       (1'b00),
                .INIT_PARAM_RECT_LEFT       (0),
                .INIT_PARAM_RECT_RIGHT      (IMG_X_NUM),
                .INIT_PARAM_RECT_TOP        (0),
                .INIT_PARAM_RECT_BOTTOM     (IMG_Y_NUM),
                .INIT_PARAM_CIRCLE_FLAG     (2'b00),
                .INIT_PARAM_CIRCLE_X        (278),
                .INIT_PARAM_CIRCLE_Y        (62),
                .INIT_PARAM_CIRCLE_RADIUS2  (60*60)
            )
        i_img_area_mask
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .in_update_req              (in_update_req),
                
                .s_wb_rst_i                 (s_wb_rst_i),
                .s_wb_clk_i                 (s_wb_clk_i),
                .s_wb_adr_i                 (s_wb_adr_i[7:0]),
                .s_wb_dat_i                 (s_wb_dat_i),
                .s_wb_dat_o                 (wb_mask_dat_o),
                .s_wb_we_i                  (s_wb_we_i),
                .s_wb_sel_i                 (s_wb_sel_i),
                .s_wb_stb_i                 (wb_mask_stb_i),
                .s_wb_ack_o                 (wb_mask_ack_o),
                
                .s_img_line_first           (img_xyss_line_first),
                .s_img_line_last            (img_xyss_line_last),
                .s_img_pixel_first          (img_xyss_pixel_first),
                .s_img_pixel_last           (img_xyss_pixel_last),
                .s_img_de                   (img_xyss_de),
                .s_img_user                 ({img_xyss_y, img_xyss_x}),
                .s_img_data                 (img_xyss_weight),
                .s_img_valid                (img_xyss_valid),
                
                .m_img_line_first           (img_mask_line_first),
                .m_img_line_last            (img_mask_line_last),
                .m_img_pixel_first          (img_mask_pixel_first),
                .m_img_pixel_last           (img_mask_pixel_last),
                .m_img_de                   (img_mask_de),
                .m_img_user                 ({img_mask_y, img_mask_x}),
                .m_img_data                 (),
                .m_img_masked_data          (img_mask_weight),
                .m_img_mask                 (img_mask_mask),
                .m_img_valid                (img_mask_valid)
            );
    
    
    jelly_img_mean_grad_to_angle
            #(
                .X_WIDTH                    (GRAD_WIDTH),
                .Y_WIDTH                    (GRAD_WIDTH),
                .WEIGHT_WIDTH               (WEIGHT_WIDTH),
                .ANGLE_WIDTH                (ANGLE_WIDTH),
                .ATAN2_X_WIDTH              (ATAN2_X_WIDTH),
                .ATAN2_Y_WIDTH              (ATAN2_Y_WIDTH)
            )
        i_img_mean_grad_to_angle
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_img_line_first           (img_mask_line_first),
                .s_img_line_last            (img_mask_line_last),
                .s_img_pixel_first          (img_mask_pixel_first),
                .s_img_pixel_last           (img_mask_pixel_last),
                .s_img_de                   (img_mask_de),
                .s_img_x                    (img_mask_x),
                .s_img_y                    (img_mask_y),
                .s_img_weight               (img_mask_weight),
                .s_img_valid                (img_mask_valid),
                
                .out_reset                  (out_reset),
                .out_clk                    (out_clk),
                .out_angle                  (out_angle),
                .out_valid                  (out_valid)
            );
    
    
    // selector
    localparam  SEL_N = 5;
    localparam  SEL_U = TUSER_WIDTH;
    localparam  SEL_D = M_TDATA_WIDTH;
    
    wire    [SEL_N-1:0]         img_sel_line_first;
    wire    [SEL_N-1:0]         img_sel_line_last;
    wire    [SEL_N-1:0]         img_sel_pixel_first;
    wire    [SEL_N-1:0]         img_sel_pixel_last;
    wire    [SEL_N-1:0]         img_sel_de;
    wire    [SEL_N*SEL_U-1:0]   img_sel_user;
    wire    [SEL_N*SEL_D-1:0]   img_sel_data;
    wire    [SEL_N-1:0]         img_sel_valid;
    
    
    assign img_sel_line_first [0]                = img_colmat_line_first;
    assign img_sel_line_last  [0]                = img_colmat_line_last;
    assign img_sel_pixel_first[0]                = img_colmat_pixel_first;
    assign img_sel_pixel_last [0]                = img_colmat_pixel_last;
    assign img_sel_de         [0]                = img_colmat_de;
    assign img_sel_user       [0*SEL_U +: SEL_U] = img_colmat_user;
    assign img_sel_data       [0*SEL_D +: SEL_D] = img_colmat_data;
    assign img_sel_valid      [0]                = img_colmat_valid;
    
    assign img_sel_line_first [1]                = img_gauss_line_first;
    assign img_sel_line_last  [1]                = img_gauss_line_last;
    assign img_sel_pixel_first[1]                = img_gauss_pixel_first;
    assign img_sel_pixel_last [1]                = img_gauss_pixel_last;
    assign img_sel_de         [1]                = img_gauss_de;
    assign img_sel_user       [1*SEL_U +: SEL_U] = 0;
    assign img_sel_data       [1*SEL_D +: SEL_D] = {4{img_gauss_data}};
    assign img_sel_valid      [1]                = img_gauss_valid;
    
    wire    [DATA_WIDTH-1:0]    img_mask_view_x      = (img_mask_x + (1 << (GRAD_WIDTH-1))) >> (GRAD_WIDTH - DATA_WIDTH);
    wire    [DATA_WIDTH-1:0]    img_mask_view_y      = (img_mask_y + (1 << (GRAD_WIDTH-1))) >> (GRAD_WIDTH - DATA_WIDTH);
    wire    [DATA_WIDTH-1:0]    img_mask_view_weight = img_mask_weight >> (WEIGHT_WIDTH - DATA_WIDTH);
    assign img_sel_line_first [2]                = img_mask_line_first;
    assign img_sel_line_last  [2]                = img_mask_line_last;
    assign img_sel_pixel_first[2]                = img_mask_pixel_first;
    assign img_sel_pixel_last [2]                = img_mask_pixel_last;
    assign img_sel_de         [2]                = img_mask_de;
    assign img_sel_user       [2*SEL_U +: SEL_U] = 0;
    assign img_sel_data       [2*SEL_D +: SEL_D] = {img_mask_view_y, {DATA_WIDTH{1'b0}}, img_mask_view_x};
    assign img_sel_valid      [2]                = img_mask_valid;
    
    assign img_sel_line_first [3]                = img_mask_line_first;
    assign img_sel_line_last  [3]                = img_mask_line_last;
    assign img_sel_pixel_first[3]                = img_mask_pixel_first;
    assign img_sel_pixel_last [3]                = img_mask_pixel_last;
    assign img_sel_de         [3]                = img_mask_de;
    assign img_sel_user       [3*SEL_U +: SEL_U] = 0;
    assign img_sel_data       [3*SEL_D +: SEL_D] = {img_mask_view_weight, img_mask_view_weight, img_mask_view_weight};
    assign img_sel_valid      [3]                = img_mask_valid;
    
    assign img_sel_line_first [4]                = img_mask_line_first;
    assign img_sel_line_last  [4]                = img_mask_line_last;
    assign img_sel_pixel_first[4]                = img_mask_pixel_first;
    assign img_sel_pixel_last [4]                = img_mask_pixel_last;
    assign img_sel_de         [4]                = img_mask_de;
    assign img_sel_user       [4*SEL_U +: SEL_U] = 0;
    assign img_sel_data       [4*SEL_D +: SEL_D] = {SEL_D{img_mask_mask}};
    assign img_sel_valid      [4]                = img_mask_valid;
    
    
    wire    [WB_DAT_WIDTH-1:0]      wb_sel_dat_o;
    wire                            wb_sel_stb_i;
    wire                            wb_sel_ack_o;
    
    jelly_img_selector
            #(
                .NUM                    (SEL_N),
                .USER_WIDTH             (SEL_U),
                .DATA_WIDTH             (SEL_D),
                .WB_ADR_WIDTH           (8),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .INIT_CTL_SELECT        (0)
            )
        i_img_selector
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i[7:0]),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (wb_sel_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (wb_sel_stb_i),
                .s_wb_ack_o             (wb_sel_ack_o),
                
                .s_img_line_first       (img_sel_line_first),
                .s_img_line_last        (img_sel_line_last),
                .s_img_pixel_first      (img_sel_pixel_first),
                .s_img_pixel_last       (img_sel_pixel_last),
                .s_img_de               (img_sel_de),
                .s_img_user             (img_sel_user),
                .s_img_data             (img_sel_data),
                .s_img_valid            (img_sel_valid),
                
                .m_img_line_first       (img_sink_line_first),
                .m_img_line_last        (img_sink_line_last),
                .m_img_pixel_first      (img_sink_pixel_first),
                .m_img_pixel_last       (img_sink_pixel_last),
                .m_img_de               (img_sink_de),
                .m_img_user             (img_sink_user),
                .m_img_data             (img_sink_data),
                .m_img_valid            (img_sink_valid)
            );
    
    
    
    // WISHBONE address decode
    assign wb_demos_stb_i  = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:8] == 6'h0);
    assign wb_colmat_stb_i = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:8] == 6'h1);
    assign wb_gauss_stb_i  = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:8] == 6'h2);
    assign wb_mask_stb_i   = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:8] == 6'h3);
    assign wb_sel_stb_i    = s_wb_stb_i & (s_wb_adr_i[WB_ADR_WIDTH-1:8] == 6'hf);
    
    assign s_wb_dat_o      = wb_demos_stb_i  ? wb_demos_dat_o  :
                             wb_colmat_stb_i ? wb_colmat_dat_o :
                             wb_gauss_stb_i  ? wb_gauss_dat_o  :
                             wb_mask_stb_i   ? wb_mask_dat_o   :
                             wb_sel_stb_i    ? wb_sel_dat_o    :
                             {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o      = wb_demos_stb_i  ? wb_demos_ack_o  :
                             wb_colmat_stb_i ? wb_colmat_ack_o :
                             wb_gauss_stb_i  ? wb_gauss_ack_o  :
                             wb_mask_stb_i   ? wb_mask_ack_o   :
                             wb_sel_stb_i    ? wb_sel_ack_o    :
                             s_wb_stb_i;
    
    
endmodule



`default_nettype wire



// end of file
