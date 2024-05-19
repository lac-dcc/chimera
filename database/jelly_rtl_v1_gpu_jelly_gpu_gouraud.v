// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// グーローシェーディング版
module jelly_gpu_gouraud
        #(
            parameter   WB_ADR_WIDTH                  = 16,
            parameter   WB_DAT_WIDTH                  = 32,
            parameter   WB_SEL_WIDTH                  = (WB_DAT_WIDTH / 8),
            
            parameter   USE_S_AX4S                    = 0,
            
            parameter   COMPONENT_NUM                 = 3,
            parameter   DATA_WIDTH                    = 8,
            
            parameter   AXI4S_TUSER_WIDTH             = 1,
            parameter   AXI4S_TDATA_WIDTH             = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   X_WIDTH                       = 12,
            parameter   Y_WIDTH                       = 12,
            
            parameter   CORE_ADDR_WIDTH               = 14,
            parameter   PARAMS_ADDR_WIDTH             = 12,
            parameter   BANK_ADDR_WIDTH               = 10,
            
            parameter   BANK_NUM                      = 2,
            
            parameter   EDGE_NUM                      = 12,
            parameter   POLYGON_NUM                   = 6,
            parameter   SHADER_PARAM_NUM              = 1 + COMPONENT_NUM,
            
            parameter   EDGE_PARAM_WIDTH              = 32,
            parameter   EDGE_RAM_TYPE                 = "distributed",
            
            parameter   SHADER_PARAM_WIDTH            = 32,
            parameter   SHADER_PARAM_Q                = 24,
            parameter   SHADER_RAM_TYPE               = "distributed",
            
            parameter   REGION_PARAM_WIDTH            = EDGE_NUM,
            parameter   REGION_RAM_TYPE               = "distributed",
            
            parameter   CULLING_ONLY                  = 0,
            parameter   Z_SORT_MIN                    = 0,  // 1で小さい値優先(Z軸奥向き)
            
            parameter   USE_PARAM_CFG_READ            = 1,
            
            parameter   RASTERIZER_INIT_CTL_ENABLE    = 1'b0,
            parameter   RASTERIZER_INIT_CTL_UPDATE    = 1'b0,
            parameter   RASTERIZER_INIT_PARAM_WIDTH   = 640-1,
            parameter   RASTERIZER_INIT_PARAM_HEIGHT  = 480-1,
            parameter   RASTERIZER_INIT_PARAM_CULLING = 2'b01,
            parameter   RASTERIZER_INIT_PARAM_BANK    = 0,
            
            parameter   SHADER_INIT_PARAM_BG_MODE     = 1'b0,
            parameter   SHADER_INIT_PARAM_BG_COLOR    = 24'h00_00_ff
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            input   wire    [AXI4S_TUSER_WIDTH-1:0]     s_axi4s_tuser,
            input   wire                                s_axi4s_tlast,
            input   wire    [AXI4S_TDATA_WIDTH-1:0]     s_axi4s_tdata,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0]     m_axi4s_tuser,
            output  wire                                m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0]     m_axi4s_tdata,
            output  wire                                m_axi4s_tvalid,
            input   wire                                m_axi4s_tready
        );
    
    localparam  CFG_SHADER_TYPE    = 32'b101;           //  color:yes textue:no z:yes
    localparam  CFG_VERSION        = 32'h0001_0000;
    
    
    localparam  INDEX_WIDTH         = POLYGON_NUM <=     2 ?  1 :
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
                                      POLYGON_NUM <= 32768 ? 15 : 16;
    
    
    // ラスタライザ
    wire                                                cke;
    
    wire                                                start;
    wire                                                busy;
    wire                                                update;
    
    wire                                                rasterizer_frame_start;
    wire                                                rasterizer_line_end;
    wire                                                rasterizer_polygon_enable;
    wire    [INDEX_WIDTH-1:0]                           rasterizer_polygon_index;
    wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   rasterizer_shader_params;
    wire                                                rasterizer_valid;
    
    wire    [WB_DAT_WIDTH-1:0]                          wb_rasterizer_dat_o;
    wire                                                wb_rasterizer_stb_i;
    wire                                                wb_rasterizer_ack_o;
    
    jelly_rasterizer
            #(
                .X_WIDTH                        (X_WIDTH),
                .Y_WIDTH                        (Y_WIDTH),
                
                .WB_ADR_WIDTH                   (CORE_ADDR_WIDTH),
                .WB_DAT_WIDTH                   (WB_DAT_WIDTH),
                .WB_SEL_WIDTH                   (WB_SEL_WIDTH),
                
                .BANK_NUM                       (BANK_NUM),
                .BANK_ADDR_WIDTH                (BANK_ADDR_WIDTH),
                .PARAMS_ADDR_WIDTH              (PARAMS_ADDR_WIDTH),
                
                .EDGE_NUM                       (EDGE_NUM),
                .POLYGON_NUM                    (POLYGON_NUM),
                .SHADER_PARAM_NUM               (SHADER_PARAM_NUM),
                
                .EDGE_PARAM_WIDTH               (EDGE_PARAM_WIDTH),
                .EDGE_RAM_TYPE                  (EDGE_RAM_TYPE),
                
                .SHADER_PARAM_WIDTH             (SHADER_PARAM_WIDTH),
                .SHADER_RAM_TYPE                (SHADER_RAM_TYPE),
                
                .REGION_PARAM_WIDTH             (REGION_PARAM_WIDTH),
                .REGION_RAM_TYPE                (REGION_RAM_TYPE),
                
                .CULLING_ONLY                   (CULLING_ONLY),
                .Z_SORT_MIN                     (Z_SORT_MIN),
                
                .USE_PARAM_CFG_READ             (USE_PARAM_CFG_READ),
                .CFG_SHADER_TYPE                (CFG_SHADER_TYPE),
                .CFG_VERSION                    (CFG_VERSION),
                .CFG_CORE_ADDR_WIDTH            (CORE_ADDR_WIDTH),
                
                .INIT_CTL_ENABLE                (RASTERIZER_INIT_CTL_ENABLE),
                .INIT_CTL_UPDATE                (RASTERIZER_INIT_CTL_UPDATE),
                .INIT_PARAM_WIDTH               (RASTERIZER_INIT_PARAM_WIDTH),
                .INIT_PARAM_HEIGHT              (RASTERIZER_INIT_PARAM_HEIGHT),
                .INIT_PARAM_CULLING             (RASTERIZER_INIT_PARAM_CULLING),
                .INIT_PARAM_BANK                (RASTERIZER_INIT_PARAM_BANK)
            )
        i_rasterizer
            (
                .reset                          (reset),
                .clk                            (clk),
                .cke                            (cke),
                
                .start                          (start),
                .busy                           (busy),
                .update                         (update),
                
                .m_frame_start                  (rasterizer_frame_start),
                .m_line_end                     (rasterizer_line_end),
                .m_select                       (),
                .m_polygon_enable               (rasterizer_polygon_enable),
                .m_polygon_index                (rasterizer_polygon_index),
                .m_shader_params                (rasterizer_shader_params),
                .m_valid                        (rasterizer_valid),
                
                .s_wb_rst_i                     (s_wb_rst_i),
                .s_wb_clk_i                     (s_wb_clk_i),
                .s_wb_adr_i                     (s_wb_adr_i[CORE_ADDR_WIDTH-1:0]),
                .s_wb_dat_o                     (wb_rasterizer_dat_o),
                .s_wb_dat_i                     (s_wb_dat_i),
                .s_wb_we_i                      (s_wb_we_i),
                .s_wb_sel_i                     (s_wb_sel_i),
                .s_wb_stb_i                     (wb_rasterizer_stb_i),
                .s_wb_ack_o                     (wb_rasterizer_ack_o)
            );
    
    
    
    // combiner
    wire                                                combiner_frame_start;
    wire                                                combiner_line_end;
    wire                                                combiner_polygon_enable;
    wire    [INDEX_WIDTH-1:0]                           combiner_polygon_index;
    wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]   combiner_shader_params;
    wire    [AXI4S_TDATA_WIDTH-1:0]                     combiner_bg_color;
    wire                                                combiner_valid;
    wire                                                combiner_ready;
    
    generate
    if ( USE_S_AX4S ) begin : blk_combiner
        jelly_video_combiner2
                #(
                    .S0_TUSER_WIDTH             (AXI4S_TUSER_WIDTH),
                    .S0_TDATA_WIDTH             (AXI4S_TDATA_WIDTH),
                    .S1_TUSER_WIDTH             (1),
                    .S1_TDATA_WIDTH             (1+INDEX_WIDTH+SHADER_PARAM_NUM*SHADER_PARAM_WIDTH),
                    .S0_REGS                    (1),
                    .S1_REGS                    (1),
                    .M_REGS                     (1)
                )
            i_video_combiner2
                (
                    .reset                      (reset),
                    .clk                        (clk),
                    .cke                        (1'b1),
                    
                    .s0_axi4s_tlast             (s_axi4s_tlast),
                    .s0_axi4s_tuser             (s_axi4s_tuser),
                    .s0_axi4s_tdata             (s_axi4s_tdata),
                    .s0_axi4s_tvalid            (s_axi4s_tvalid),
                    .s0_axi4s_tready            (s_axi4s_tready),
                    
                    .s1_axi4s_tlast             (rasterizer_line_end),
                    .s1_axi4s_tuser             (rasterizer_frame_start),
                    .s1_axi4s_tdata             ({rasterizer_polygon_enable, rasterizer_polygon_index, rasterizer_shader_params}),
                    .s1_axi4s_tvalid            (rasterizer_valid),
                    .s1_axi4s_tready            (cke),
                    
                    .m_axi4s_tlast              (combiner_line_end),
                    .m_axi4s_tuser0             (combiner_frame_start),
                    .m_axi4s_tuser1             (),
                    .m_axi4s_tdata0             (combiner_bg_color),
                    .m_axi4s_tdata1             ({combiner_polygon_enable, combiner_polygon_index, combiner_shader_params}),
                    .m_axi4s_tvalid             (combiner_valid),
                    .m_axi4s_tready             (combiner_ready)
                );
    end
    else begin : blk_no_combiner
        assign combiner_frame_start    = rasterizer_frame_start;
        assign combiner_line_end       = rasterizer_line_end;
        assign combiner_polygon_enable = rasterizer_polygon_enable;
        assign combiner_polygon_index  = rasterizer_polygon_index;
        assign combiner_shader_params  = rasterizer_shader_params;
        assign combiner_bg_color       = {AXI4S_TDATA_WIDTH{1'b0}};
        assign combiner_valid          = rasterizer_valid;
        assign cke                     = combiner_ready;
    end
    endgenerate
    
    
    // pixel shader
    wire    [WB_DAT_WIDTH-1:0]      wb_shader_dat_o;
    wire                            wb_shader_stb_i;
    wire                            wb_shader_ack_o;
    
    jelly_pixel_shader_gouraud
            #(
                .COMPONENT_NUM                  (COMPONENT_NUM),
                .DATA_WIDTH                     (DATA_WIDTH),
                
                .WB_ADR_WIDTH                   (CORE_ADDR_WIDTH),
                .WB_DAT_WIDTH                   (WB_DAT_WIDTH),
                .WB_SEL_WIDTH                   (WB_SEL_WIDTH),
                
                .AXI4S_TUSER_WIDTH              (AXI4S_TUSER_WIDTH),
                .AXI4S_TDATA_WIDTH              (AXI4S_TDATA_WIDTH),
                
                .INDEX_WIDTH                    (INDEX_WIDTH),
                
                .SHADER_PARAM_NUM               (SHADER_PARAM_NUM - 1), // 0番目はZなので除外
                .SHADER_PARAM_WIDTH             (SHADER_PARAM_WIDTH),
                .SHADER_PARAM_Q                 (SHADER_PARAM_Q),
                
                .USE_PARAM_CFG_READ             (USE_PARAM_CFG_READ),
                
                .INIT_PARAM_BG_MODE             (SHADER_INIT_PARAM_BG_MODE),
                .INIT_PARAM_BG_COLOR            (SHADER_INIT_PARAM_BG_COLOR)
            )
        i_pixel_shader_gouraud
            (
                .reset                          (reset),
                .clk                            (clk),
                
                .start                          (start),
                .busy                           (busy),
                .update                         (update),
                
                .s_wb_rst_i                     (s_wb_rst_i),
                .s_wb_clk_i                     (s_wb_clk_i),
                .s_wb_adr_i                     (s_wb_adr_i[CORE_ADDR_WIDTH-1:0]),
                .s_wb_dat_o                     (wb_shader_dat_o),
                .s_wb_dat_i                     (s_wb_dat_i),
                .s_wb_we_i                      (s_wb_we_i),
                .s_wb_sel_i                     (s_wb_sel_i),
                .s_wb_stb_i                     (wb_shader_stb_i),
                .s_wb_ack_o                     (wb_shader_ack_o),
                
                .s_rasterizer_frame_start       (combiner_frame_start),
                .s_rasterizer_line_end          (combiner_line_end),
                .s_rasterizer_polygon_enable    (combiner_polygon_enable),
                .s_rasterizer_polygon_index     (combiner_polygon_index),
                .s_rasterizer_shader_params     (combiner_shader_params[SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:SHADER_PARAM_WIDTH]), // Zを除去
                .s_rasterizer_bg_color          (combiner_bg_color),
                .s_rasterizer_valid             (combiner_valid),
                .s_rasterizer_ready             (combiner_ready),
                
                .m_axi4s_tuser                  (m_axi4s_tuser),
                .m_axi4s_tlast                  (m_axi4s_tlast),
                .m_axi4s_tdata                  (m_axi4s_tdata),
                .m_axi4s_tvalid                 (m_axi4s_tvalid),
                .m_axi4s_tready                 (m_axi4s_tready)
            );
    
    
    
    // WISHBONE addr decode
    assign wb_rasterizer_stb_i = s_wb_stb_i && (s_wb_adr_i[CORE_ADDR_WIDTH +: 1] == 1'b0);
    assign wb_shader_stb_i     = s_wb_stb_i && (s_wb_adr_i[CORE_ADDR_WIDTH +: 1] == 1'b1);
    
    assign s_wb_dat_o          = wb_rasterizer_stb_i ? wb_rasterizer_dat_o :
                                 wb_shader_stb_i     ? wb_shader_dat_o     :
                                 0;
    
    assign s_wb_ack_o          = wb_rasterizer_stb_i ? wb_rasterizer_ack_o :
                                 wb_shader_stb_i     ? wb_shader_ack_o     :
                                 s_wb_stb_i;
    
    
endmodule


`default_nettype wire


// End of file
