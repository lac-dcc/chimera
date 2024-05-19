// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_img_record_model
        #(
            parameter   COMPONENT_NUM    = 3,
            parameter   DATA_WIDTH       = 8,
            parameter   INIT_FRAME_NUM   = 0,
            parameter   FRAME_WIDTH      = 32,
            parameter   X_WIDTH          = 32,
            parameter   Y_WIDTH          = 32,
            parameter   FILE_NAME        = "img_%04d.ppm",
            parameter   MAX_PATH         = 64
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            input   wire                                    cke,
            
            input   wire    [X_WIDTH-1:0]                   param_width,
            input   wire    [Y_WIDTH-1:0]                   param_height,
            
            input   wire                                    s_img_line_first,
            input   wire                                    s_img_line_last,
            input   wire                                    s_img_pixel_first,
            input   wire                                    s_img_pixel_last,
            input   wire                                    s_img_de,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  s_img_data,
            input   wire                                    s_img_valid
        );
    
    
    jelly_axi4s_slave_model
            #(
                .COMPONENT_NUM      (COMPONENT_NUM),
                .DATA_WIDTH         (DATA_WIDTH),
                .INIT_FRAME_NUM     (INIT_FRAME_NUM),
                .FRAME_WIDTH        (FRAME_WIDTH),
                .X_WIDTH            (X_WIDTH),
                .Y_WIDTH            (Y_WIDTH),
                .FILE_NAME          (FILE_NAME),
                .MAX_PATH           (MAX_PATH)
            )
        i_axi4s_slave_model
            (
                .aresetn            (~reset),
                .aclk               (clk),
                .aclken             (cke),
                
                .param_width        (param_width),
                .param_height       (param_height),
                
                .s_axi4s_tuser      (s_img_valid & s_img_line_first & s_img_pixel_first),
                .s_axi4s_tlast      (s_img_valid & s_img_pixel_last),
                .s_axi4s_tdata      (s_img_data),
                .s_axi4s_tvalid     (s_img_valid & s_img_de),
                .s_axi4s_tready     ()
            );
    
    
endmodule


`default_nettype wire


// end of file
