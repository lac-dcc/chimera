// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_color_matrix_core
        #(
            parameter   USER_WIDTH        = 0,
            parameter   DATA_WIDTH        = 10,
            parameter   INTERNAL_WIDTH    = DATA_WIDTH + 2,
            
            parameter   COEFF_INT_WIDTH   = 17,
            parameter   COEFF_FRAC_WIDTH  = 8,
            parameter   COEFF3_INT_WIDTH  = COEFF_INT_WIDTH,
            parameter   COEFF3_FRAC_WIDTH = COEFF_FRAC_WIDTH,
            parameter   STATIC_COEFF      = 1,
            parameter   DEVICE            = "RTL", // "RTL" or "7SERIES"
            
            // local
            parameter   COEFF_WIDTH       = COEFF_INT_WIDTH + COEFF_FRAC_WIDTH,
            parameter   COEFF3_WIDTH      = COEFF3_INT_WIDTH + COEFF3_FRAC_WIDTH,
            parameter   USER_BITS         = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix00,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix01,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix02,
            input   wire    signed  [COEFF3_WIDTH-1:0]  param_matrix03,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix10,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix11,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix12,
            input   wire    signed  [COEFF3_WIDTH-1:0]  param_matrix13,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix20,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix21,
            input   wire    signed  [COEFF_WIDTH-1:0]   param_matrix22,
            input   wire    signed  [COEFF3_WIDTH-1:0]  param_matrix23,
            
            input   wire            [DATA_WIDTH-1:0]    param_clip_min0,
            input   wire            [DATA_WIDTH-1:0]    param_clip_max0,
            input   wire            [DATA_WIDTH-1:0]    param_clip_min1,
            input   wire            [DATA_WIDTH-1:0]    param_clip_max1,
            input   wire            [DATA_WIDTH-1:0]    param_clip_min2,
            input   wire            [DATA_WIDTH-1:0]    param_clip_max2,
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire            [USER_BITS-1:0]     s_img_user,
            input   wire            [DATA_WIDTH-1:0]    s_img_color0,
            input   wire            [DATA_WIDTH-1:0]    s_img_color1,
            input   wire            [DATA_WIDTH-1:0]    s_img_color2,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire            [USER_BITS-1:0]     m_img_user,
            output  wire            [DATA_WIDTH-1:0]    m_img_color0,
            output  wire            [DATA_WIDTH-1:0]    m_img_color1,
            output  wire            [DATA_WIDTH-1:0]    m_img_color2,
            output  wire                                m_img_valid
        );
    
    
    // matrix
    wire    signed  [DATA_WIDTH:0]          s_img_color0_signed = {1'b0, s_img_color0};
    wire    signed  [DATA_WIDTH:0]          s_img_color1_signed = {1'b0, s_img_color1};
    wire    signed  [DATA_WIDTH:0]          s_img_color2_signed = {1'b0, s_img_color2};
    
    wire                                    matrix_line_first;
    wire                                    matrix_line_last;
    wire                                    matrix_pixel_first;
    wire                                    matrix_pixel_last;
    wire                                    matrix_de;
    wire            [USER_BITS-1:0]         matrix_user;
    wire    signed  [INTERNAL_WIDTH-1:0]    matrix_color0;
    wire    signed  [INTERNAL_WIDTH-1:0]    matrix_color1;
    wire    signed  [INTERNAL_WIDTH-1:0]    matrix_color2;
    wire                                    matrix_valid;
    
    jelly_fixed_matrix3x4
            #(
                .COEFF_INT_WIDTH        (COEFF_INT_WIDTH),
                .COEFF_FRAC_WIDTH       (COEFF_FRAC_WIDTH),
                .COEFF3_INT_WIDTH       (COEFF3_INT_WIDTH),
                .COEFF3_FRAC_WIDTH      (COEFF3_FRAC_WIDTH),
                
                .S_FIXED_INT_WIDTH      (DATA_WIDTH+1),
                .S_FIXED_FRAC_WIDTH     (0),
                
                .M_FIXED_INT_WIDTH      (INTERNAL_WIDTH),
                .M_FIXED_FRAC_WIDTH     (0),
                
                .USER_WIDTH             (USER_WIDTH+5),
                
                .STATIC_COEFF           (STATIC_COEFF),
                
                .MASTER_IN_REGS         (0),
                .MASTER_OUT_REGS        (0),
                
                .DEVICE                 (DEVICE)
            )
        i_fixed_matrix3x4
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .coeff00                (param_matrix00),
                .coeff01                (param_matrix01),
                .coeff02                (param_matrix02),
                .coeff03                (param_matrix03),
                .coeff10                (param_matrix10),
                .coeff11                (param_matrix11),
                .coeff12                (param_matrix12),
                .coeff13                (param_matrix13),
                .coeff20                (param_matrix20),
                .coeff21                (param_matrix21),
                .coeff22                (param_matrix22),
                .coeff23                (param_matrix23),
                                         
                .s_user                 ({
                                            s_img_user,
                                            s_img_line_first,
                                            s_img_line_last,
                                            s_img_pixel_first,
                                            s_img_pixel_last,
                                            s_img_de
                                        }),
                .s_fixed_x              (s_img_color0_signed),
                .s_fixed_y              (s_img_color1_signed),
                .s_fixed_z              (s_img_color2_signed),
                .s_valid                (s_img_valid),
                .s_ready                (),
                                         
                .m_user                 ({
                                            matrix_user,
                                            matrix_line_first,
                                            matrix_line_last,
                                            matrix_pixel_first,
                                            matrix_pixel_last,
                                            matrix_de
                                        }),
                .m_fixed_x              (matrix_color0),
                .m_fixed_y              (matrix_color1),
                .m_fixed_z              (matrix_color2),
                .m_valid                (matrix_valid),
                .m_ready                (1'b1)
            );
    
    
    // clip
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_min0 = {1'b0, param_clip_min0};
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_max0 = {1'b0, param_clip_max0};
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_min1 = {1'b0, param_clip_min1};
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_max1 = {1'b0, param_clip_max1};
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_min2 = {1'b0, param_clip_min2};
    wire    signed  [INTERNAL_WIDTH-1:0]    clip_max2 = {1'b0, param_clip_max2};
    
    reg                                     clip_line_first;
    reg                                     clip_line_last;
    reg                                     clip_pixel_first;
    reg                                     clip_pixel_last;
    reg                                     clip_de;
    reg             [USER_BITS-1:0]         clip_user;
    reg             [DATA_WIDTH-1:0]        clip_color0;
    reg             [DATA_WIDTH-1:0]        clip_color1;
    reg             [DATA_WIDTH-1:0]        clip_color2;
    reg                                     clip_valid;
    
    always @(posedge clk) begin
        if ( cke ) begin
            clip_line_first  <= matrix_valid & matrix_line_first;
            clip_line_last   <= matrix_valid & matrix_line_last;
            clip_pixel_first <= matrix_valid & matrix_pixel_first;
            clip_pixel_last  <= matrix_valid & matrix_pixel_last;
            clip_de          <= matrix_valid & matrix_de;
            clip_user        <= matrix_user;
            clip_color0      <= matrix_color0;
            clip_color1      <= matrix_color1;
            clip_color2      <= matrix_color2;
            
            if ( matrix_color0 < clip_min0 ) begin clip_color0 <= clip_min0; end
            if ( matrix_color0 > clip_max0 ) begin clip_color0 <= clip_max0; end
            if ( matrix_color1 < clip_min1 ) begin clip_color1 <= clip_min1; end
            if ( matrix_color1 > clip_max1 ) begin clip_color1 <= clip_max1; end
            if ( matrix_color2 < clip_min2 ) begin clip_color2 <= clip_min2; end
            if ( matrix_color2 > clip_max2 ) begin clip_color2 <= clip_max2; end
        end
    end
    
    always @(posedge clk) begin
        if ( reset ) begin
            clip_valid <= 1'b0;
        end
        else if ( cke ) begin
            clip_valid <= matrix_valid;
        end
    end
    
    assign m_img_line_first  = clip_valid & clip_line_first;
    assign m_img_line_last   = clip_valid & clip_line_last;
    assign m_img_pixel_first = clip_valid & clip_pixel_first;
    assign m_img_pixel_last  = clip_valid & clip_pixel_last;
    assign m_img_de          = clip_valid & clip_de;
    assign m_img_user        = clip_user;
    assign m_img_color0      = clip_color0;
    assign m_img_color1      = clip_color1;
    assign m_img_color2      = clip_color2;
    assign m_img_valid       = clip_valid;
        
endmodule


`default_nettype wire


// end of file
