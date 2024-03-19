// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_img_alpha_blend_core
        #(
            parameter COMPONENTS  = 3,
            parameter ALPHA_WIDTH = 8,
            parameter DATA_WIDTH  = 8,
            parameter USER_WIDTH  = 0,
            parameter USE_VALID   = 0,
            
            parameter USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                cke,
            
            input   wire    [ALPHA_WIDTH-1:0]           param_alpha,
            
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
            output  wire    [COMPONENTS*DATA_WIDTH-1:0] m_img_data,
            output  wire                                m_img_valid
        );
    
    // process
    reg     [COMPONENTS*DATA_WIDTH-1:0]     reg_data0;
    reg     [COMPONENTS*DATA_WIDTH-1:0]     reg_data1;
    always @(posedge clk) begin
        if ( cke ) begin
            // パラメータ更新に1サイクル待つ
            reg_data0 <= s_img_data0;
            reg_data1 <= s_img_data1;
        end
    end
    
    genvar  i;
    generate
    for ( i = 0; i < COMPONENTS; i = i+1 ) begin : loop_alpha_blend
        // 2stage cores
        jelly_unsigned_alpha_blend
                #(
                    .ALPHA_WIDTH    (ALPHA_WIDTH),
                    .DATA_WIDTH     (DATA_WIDTH),
                    .USER_WIDTH     (0),
                    .M_REGS         (0)
                )
            i_unsigned_alpha_blend
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (cke),
                
                .s_alpha            (param_alpha),
                .s_data0            (reg_data0[i*DATA_WIDTH +: DATA_WIDTH]),
                .s_data1            (reg_data1[i*DATA_WIDTH +: DATA_WIDTH]),
                .s_user             (1'b0),
                .s_valid            (1'b1),
                .s_ready            (),
                
                .m_data             (m_img_data[i*DATA_WIDTH +: DATA_WIDTH]),
                .m_user             (),
                .m_valid            (),
                .m_ready            (1'b1)
            );
    end
    endgenerate
    
    
    // control signals
    jelly_img_delay
            #(
                .USER_WIDTH         (USER_WIDTH),
                .LATENCY            (1+3),
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
