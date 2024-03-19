// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//   image processing
//
//                                 Copyright (C) 2008-2016 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_canny_core
        #(
            parameter   USER_WIDTH    = 0,
            parameter   GRAD_X_WIDTH  = 8,
            parameter   GRAD_Y_WIDTH  = 8,
            parameter   TH_WIDTH      = GRAD_X_WIDTH > GRAD_Y_WIDTH ? GRAD_X_WIDTH*2+1 : GRAD_Y_WIDTH*2+1,
            parameter   ANGLE_WIDTH   = 8,
            parameter   SCALED_RADIAN = 1,
            parameter   USE_VALID     = 0,
            
            parameter   USER_BITS    = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire                                enable,
            input   wire            [TH_WIDTH-1:0]      param_th,   // 閾値(2乗した値を設定)
            
            input   wire                                s_img_line_first,
            input   wire                                s_img_line_last,
            input   wire                                s_img_pixel_first,
            input   wire                                s_img_pixel_last,
            input   wire                                s_img_de,
            input   wire            [USER_BITS-1:0]     s_img_user,
            input   wire    signed  [GRAD_X_WIDTH-1:0]  s_img_grad_x,
            input   wire    signed  [GRAD_Y_WIDTH-1:0]  s_img_grad_y,
            input   wire                                s_img_valid,
            
            output  wire                                m_img_line_first,
            output  wire                                m_img_line_last,
            output  wire                                m_img_pixel_first,
            output  wire                                m_img_pixel_last,
            output  wire                                m_img_de,
            output  wire            [USER_BITS-1:0]     m_img_user,
            output  wire                                m_img_binary,
            output  wire            [ANGLE_WIDTH-1:0]   m_img_angle,
            output  wire                                m_img_valid
        );
    
    localparam  Q_WIDTH         = SCALED_RADIAN ? ANGLE_WIDTH : ANGLE_WIDTH - 4;
    localparam  PIPELINE_STAGES = 1 + Q_WIDTH;
    
    
    // threshold
    reg     signed  [GRAD_X_WIDTH*2-1:0]    st0_grad_x;
    reg     signed  [GRAD_Y_WIDTH*2-1:0]    st0_grad_y;
    
    reg     signed  [GRAD_X_WIDTH*2-1:0]    st1_grad_x;
    reg     signed  [GRAD_Y_WIDTH*2-1:0]    st1_grad_y;
    
    reg             [TH_WIDTH-1:0]          st2_grad;
    
    reg                                     st3_binary;
    
    always @(posedge clk) begin
        if ( cke ) begin
            st0_grad_x <= s_img_grad_x * s_img_grad_x;
            st0_grad_y <= s_img_grad_y * s_img_grad_y;
            
            st1_grad_x <= st0_grad_x;
            st1_grad_y <= st0_grad_y;
            
            st2_grad   <= st1_grad_x + st1_grad_y;
            
            st3_binary <= (st2_grad > param_th) && enable;
        end
    end
    
    jelly_data_delay
            #(
                .LATENCY            (PIPELINE_STAGES-4),
                .DATA_WIDTH         (1)
             )
        i_data_delay_binary
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .in_data            (st3_binary),
                
                .out_data           (m_img_binary)
            );
    
    
    // calc direction
    jelly_fixed_atan2
            #(
                .SCALED_RADIAN      (1),
                .USER_WIDTH         (0),
                .X_WIDTH            (GRAD_X_WIDTH),
                .Y_WIDTH            (GRAD_Y_WIDTH),
                .ANGLE_WIDTH        (ANGLE_WIDTH),
                .Q_WIDTH            (Q_WIDTH),
                .MASTER_IN_REGS     (0),
                .MASTER_OUT_REGS    (0)
            )
        i_fixed_atan2
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_user             (),
                .s_x                (s_img_grad_x),
                .s_y                (s_img_grad_y),
                .s_valid            (s_img_valid),
                .s_ready            (),
                
                .m_user             (),
                .m_angle            (m_img_angle),
                .m_valid            (),
                .m_ready            (1'b1)
            );
    
    
    // delay
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (PIPELINE_STAGES),
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
