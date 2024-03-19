// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


module jelly_rasterizer
        #(
            parameter   X_WIDTH             = 12,
            parameter   Y_WIDTH             = 12,
            
            parameter   WB_ADR_WIDTH        = 14,
            parameter   WB_DAT_WIDTH        = 32,
            parameter   WB_SEL_WIDTH        = (WB_DAT_WIDTH / 8),
            
            parameter   BANK_NUM            = 2,
            parameter   PARAMS_ADDR_WIDTH   = 12,
            parameter   BANK_ADDR_WIDTH     = 10,
            
            parameter   EDGE_NUM            = 12,
            parameter   POLYGON_NUM         = 6,
            parameter   SHADER_PARAM_NUM    = 3,
            
            parameter   EDGE_PARAM_WIDTH    = 32,
            parameter   EDGE_RAM_TYPE       = "distributed",
            
            parameter   SHADER_PARAM_WIDTH  = 32,
            parameter   SHADER_RAM_TYPE     = "distributed",
            
            parameter   REGION_PARAM_WIDTH  = EDGE_NUM,
            parameter   REGION_RAM_TYPE     = "distributed",
            
            parameter   SELECT_WIDTH        = 1,
            parameter   INDEX_WIDTH         = POLYGON_NUM <=     2 ?  1 :
                                              POLYGON_NUM <=     4 ?  2 :
                                              POLYGON_NUM <=     8 ?  3 :
                                              POLYGON_NUM <=    16 ?  4 :
                                              POLYGON_NUM <=    32 ?  5 :
                                              POLYGON_NUM <=    64 ?  6 :
                                              POLYGON_NUM <=   128 ?  7 :
                                              POLYGON_NUM <=   256 ?  8 :
                                              POLYGON_NUM <=   512 ?  9 :
                                              POLYGON_NUM <=  1024 ? 10 :
                                              POLYGON_NUM <=  2048 ? 11 :
                                              POLYGON_NUM <=  4096 ? 12 :
                                              POLYGON_NUM <=  8192 ? 13 :
                                              POLYGON_NUM <= 16384 ? 14 :
                                              POLYGON_NUM <= 32768 ? 15 : 16,
            
            parameter   CULLING_ONLY        = 1,
            parameter   Z_SORT_MIN          = 0,    // Zの大小どちらを優先するか(Z軸の向き)
            
            parameter   USE_PARAM_CFG_READ  = 1,
            parameter   CFG_SHADER_TYPE     = 32'h0000_0000,
            parameter   CFG_VERSION         = 32'h0000_0000,
            parameter   CFG_CORE_ADDR_WIDTH = 14,
            
            parameter   INIT_CTL_ENABLE     = 1'b0,
            parameter   INIT_CTL_UPDATE     = 1'b0,
            parameter   INIT_PARAM_WIDTH    = 640-1,
            parameter   INIT_PARAM_HEIGHT   = 480-1,
            parameter   INIT_PARAM_CULLING  = 2'b01,
            parameter   INIT_PARAM_BANK     = 0
        )
        (
            input   wire                                                reset,
            input   wire                                                clk,
            input   wire                                                cke,
            
            output  wire                                                start,
            output  wire                                                busy,
            output  wire                                                update,
            
            input   wire                                                s_wb_rst_i,
            input   wire                                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]                          s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]                          s_wb_dat_i,
            input   wire                                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]                          s_wb_sel_i,
            input   wire                                                s_wb_stb_i,
            output  wire                                                s_wb_ack_o,
            
            output  wire                                                m_frame_start,
            output  wire                                                m_line_end,
            output  wire    [SELECT_WIDTH-1:0]                          m_select,
            output  wire                                                m_polygon_enable,
            output  wire    [INDEX_WIDTH-1:0]                           m_polygon_index,
            output  wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   m_shader_params,
            output  wire                                                m_valid
        );
    
    // local
    localparam  PARAMS_EDGE_SIZE   = EDGE_NUM*3;
    localparam  PARAMS_SHADER_SIZE = POLYGON_NUM*SHADER_PARAM_NUM*3;
    localparam  PARAMS_REGION_SIZE = POLYGON_NUM*2;
    
    
    // parameters
    wire    [X_WIDTH-1:0]                               param_width;
    wire    [Y_WIDTH-1:0]                               param_height;
    wire    [1:0]                                       param_culling;
    
    wire    [PARAMS_EDGE_SIZE*EDGE_PARAM_WIDTH-1:0]     params_edge;
    wire    [PARAMS_SHADER_SIZE*SHADER_PARAM_WIDTH-1:0] params_shader;
    wire    [PARAMS_REGION_SIZE*REGION_PARAM_WIDTH-1:0] params_region;
    
    jelly_rasterizer_params
            #(
                .X_WIDTH                (X_WIDTH),
                .Y_WIDTH                (Y_WIDTH),
                
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                
                .BANK_NUM               (BANK_NUM),
                .BANK_ADDR_WIDTH        (BANK_ADDR_WIDTH),
                .PARAMS_ADDR_WIDTH      (PARAMS_ADDR_WIDTH),
                .SELECT_WIDTH           (SELECT_WIDTH),
                
                .EDGE_NUM               (EDGE_NUM),
                .POLYGON_NUM            (POLYGON_NUM),
                .SHADER_PARAM_NUM       (SHADER_PARAM_NUM),
                
                .EDGE_PARAM_WIDTH       (EDGE_PARAM_WIDTH),
                .EDGE_RAM_TYPE          (EDGE_RAM_TYPE),
                
                .SHADER_PARAM_WIDTH     (SHADER_PARAM_WIDTH),
                .SHADER_RAM_TYPE        (SHADER_RAM_TYPE),
                
                .REGION_PARAM_WIDTH     (REGION_PARAM_WIDTH),
                .REGION_RAM_TYPE        (REGION_RAM_TYPE),
                
                .USE_PARAM_CFG_READ     (USE_PARAM_CFG_READ),
                .CFG_SHADER_TYPE        (CFG_SHADER_TYPE),
                .CFG_VERSION            (CFG_VERSION),
                .CFG_CORE_ADDR_WIDTH    (CFG_CORE_ADDR_WIDTH),
                
                .INIT_CTL_ENABLE        (INIT_CTL_ENABLE),
                .INIT_CTL_UPDATE        (INIT_CTL_UPDATE),
                .INIT_PARAM_WIDTH       (INIT_PARAM_WIDTH),
                .INIT_PARAM_HEIGHT      (INIT_PARAM_HEIGHT),
                .INIT_PARAM_CULLING     (INIT_PARAM_CULLING),
                .INIT_PARAM_BANK        (INIT_PARAM_BANK)
            )
        i_rasterizer_params
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .start                  (start),
                .update                 (update),
                .busy                   (busy),
                
                .param_width            (param_width),
                .param_height           (param_height),
                .param_culling          (param_culling),
                .param_select           (m_select),
                
                .params_edge            (params_edge),
                .params_shader          (params_shader),
                .params_region          (params_region),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_o             (s_wb_dat_o),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (s_wb_stb_i),
                .s_wb_ack_o             (s_wb_ack_o)
            );
    
    // core
    jelly_rasterizer_core
            #(
                .X_WIDTH                (X_WIDTH),
                .Y_WIDTH                (Y_WIDTH),
                
                .EDGE_NUM               (EDGE_NUM),
                .POLYGON_NUM            (POLYGON_NUM),
                .SHADER_PARAM_NUM       (SHADER_PARAM_NUM),
                
                .EDGE_PARAM_WIDTH       (EDGE_PARAM_WIDTH),
                .SHADER_PARAM_WIDTH     (SHADER_PARAM_WIDTH),
                
                .REGION_PARAM_WIDTH     (REGION_PARAM_WIDTH),
                
                .INDEX_WIDTH            (INDEX_WIDTH),
                
                .CULLING_ONLY           (CULLING_ONLY),
                .Z_SORT_MIN             (Z_SORT_MIN)
            )
        i_rasterizer_core
            (
                .reset                  (reset),
                .clk                    (clk),
                .cke                    (cke),
                
                .start                  (start),
                .busy                   (busy),
                
                .param_width            (param_width),
                .param_height           (param_height),
                .param_culling          (param_culling),
                
                .params_edge            (params_edge),
                .params_shader          (params_shader),
                .params_region          (params_region),
                
                .m_frame_start          (m_frame_start),
                .m_line_end             (m_line_end),
                .m_polygon_enable       (m_polygon_enable),
                .m_polygon_index        (m_polygon_index),
                .m_shader_params        (m_shader_params),
                .m_valid                (m_valid)
            );
    
    
endmodule


`default_nettype wire


// End of file
