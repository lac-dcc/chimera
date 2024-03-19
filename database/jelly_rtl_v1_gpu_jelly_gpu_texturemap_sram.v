// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// SRAM版テクスチャマッピング
module jelly_gpu_texturemap_sram
        #(
            parameter   COMPONENT_NUM                 = 3,
            parameter   DATA_WIDTH                    = 8,
            
            parameter   WB_ADR_WIDTH                  = 16,
            parameter   WB_DAT_WIDTH                  = 32,
            parameter   WB_SEL_WIDTH                  = (WB_DAT_WIDTH / 8),
            
            parameter   AXI4S_TUSER_WIDTH             = 1,
            parameter   AXI4S_TDATA_WIDTH             = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   CORE_ADDR_WIDTH               = 14,
            parameter   PARAMS_ADDR_WIDTH             = 12,
            parameter   BANK_ADDR_WIDTH               = 10,
            
            parameter   SELECT_WIDTH                  = 1,
            parameter   BANK_NUM                      = 1,
            parameter   EDGE_NUM                      = 12,
            parameter   POLYGON_NUM                   = 6,
            parameter   SHADER_PARAM_NUM              = 1 + 2,      // Z + UV
            
            parameter   EDGE_PARAM_WIDTH              = 32,
            parameter   EDGE_RAM_TYPE                 = "distributed",
            
            parameter   SHADER_PARAM_WIDTH            = 32,
            parameter   SHADER_PARAM_Q                = 24,
            parameter   SHADER_RAM_TYPE               = "distributed",
            
            parameter   REGION_PARAM_WIDTH            = EDGE_NUM,
            parameter   REGION_RAM_TYPE               = "distributed",
            
            parameter   CULLING_ONLY                  = 0,
            parameter   Z_SORT_MIN                    = 0,  // 1で小さい値優先(Z軸奥向き)
            
            parameter   X_WIDTH                       = 12,
            parameter   Y_WIDTH                       = 12,
            
            parameter   U_WIDTH                       = SHADER_PARAM_Q,
            parameter   U_INT_WIDTH                   = 8,
            parameter   U_FRAC_WIDTH                  = U_WIDTH - U_INT_WIDTH,
            
            parameter   V_WIDTH                       = SHADER_PARAM_Q,
            parameter   V_INT_WIDTH                   = 8,
            parameter   V_FRAC_WIDTH                  = U_WIDTH - U_INT_WIDTH,
            
            parameter   DEVICE                        = "RTL",
            
            parameter   TEXMEM_READMEMB               = 0,
            parameter   TEXMEM_READMEMH               = 0,
            parameter   TEXMEM_READMEM_FILE0          = "",
            parameter   TEXMEM_READMEM_FILE1          = "",
            parameter   TEXMEM_READMEM_FILE2          = "",
            parameter   TEXMEM_READMEM_FILE3          = "",
            
            
            parameter   RASTERIZER_INIT_CTL_ENABLE    = 1'b0,
            parameter   RASTERIZER_INIT_CTL_UPDATE    = 1'b0,
            parameter   RASTERIZER_INIT_PARAM_WIDTH   = 640-1,
            parameter   RASTERIZER_INIT_PARAM_HEIGHT  = 480-1,
            parameter   RASTERIZER_INIT_PARAM_CULLING = 2'b01,
            parameter   RASTERIZER_INIT_PARAM_BANK    = 0,
            
            parameter   SHADER_INIT_PARAM_BGC         = 32'h0000_0000
        )
        (
            input   wire                                    reset,
            input   wire                                    clk,
            
            input   wire                                    mem_reset,
            input   wire                                    mem_clk,
            input   wire                                    mem_we,
            input   wire    [U_INT_WIDTH-1:0]               mem_addrx,
            input   wire    [V_INT_WIDTH-1:0]               mem_addry,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  mem_wdata,
            
            input   wire                                    s_wb_rst_i,
            input   wire                                    s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]              s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]              s_wb_dat_i,
            input   wire                                    s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]              s_wb_sel_i,
            input   wire                                    s_wb_stb_i,
            output  wire                                    s_wb_ack_o,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0]         m_axi4s_tuser,
            output  wire                                    m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0]         m_axi4s_tdata,
            output  wire                                    m_axi4s_tstrb,
            output  wire                                    m_axi4s_tvalid,
            input   wire                                    m_axi4s_tready
        );
    
    
    localparam  CFG_SHADER_TYPE     = 32'h0002_0003;        //  color:yes textue:no z:yes
    localparam  CFG_VERSION         = 32'h0001_0000;
    localparam  CFG_CORE_ADDR_WIDTH = 14;
    
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
    wire    [SELECT_WIDTH-1:0]                          rasterizer_select;
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
                
                .SELECT_WIDTH                   (SELECT_WIDTH),
                .INDEX_WIDTH                    (INDEX_WIDTH),
                
                .CULLING_ONLY                   (CULLING_ONLY),
                .Z_SORT_MIN                     (Z_SORT_MIN),
                
                .CFG_SHADER_TYPE                (CFG_SHADER_TYPE),
                .CFG_VERSION                    (CFG_VERSION),
                .CFG_CORE_ADDR_WIDTH            (CFG_CORE_ADDR_WIDTH),
                
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
                .m_select                       (rasterizer_select),
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
    
    // pixel shader
    wire    [WB_DAT_WIDTH-1:0]                          wb_shader_dat_o;
    wire                                                wb_shader_stb_i;
    wire                                                wb_shader_ack_o;
    
    wire    [WB_DAT_WIDTH-1:0]                          wb_texmem_dat_o;
    wire                                                wb_texmem_stb_i;
    wire                                                wb_texmem_ack_o;
    
    jelly_pixel_shader_texturemap_sram
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .DATA_WIDTH             (DATA_WIDTH),
                
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                
                .AXI4S_TUSER_WIDTH      (AXI4S_TUSER_WIDTH),
                .AXI4S_TDATA_WIDTH      (AXI4S_TDATA_WIDTH),
                
                .INDEX_WIDTH            (INDEX_WIDTH),
                
                .SHADER_PARAM_NUM       (SHADER_PARAM_NUM),
                .SHADER_PARAM_WIDTH     (SHADER_PARAM_WIDTH),
                .SHADER_PARAM_Q         (SHADER_PARAM_Q),
                
                .U_WIDTH                (U_WIDTH),
                .U_INT_WIDTH            (U_INT_WIDTH),
                .U_FRAC_WIDTH           (U_FRAC_WIDTH),
                
                .V_WIDTH                (V_WIDTH),
                .V_INT_WIDTH            (V_INT_WIDTH),
                .V_FRAC_WIDTH           (V_FRAC_WIDTH),
                
                .READMEMB               (TEXMEM_READMEMB),
                .READMEMH               (TEXMEM_READMEMH),
                .READMEM_FILE0          (TEXMEM_READMEM_FILE0),
                .READMEM_FILE1          (TEXMEM_READMEM_FILE1),
                .READMEM_FILE2          (TEXMEM_READMEM_FILE2),
                .READMEM_FILE3          (TEXMEM_READMEM_FILE3),
                
                .DEVICE                 (DEVICE),
                
                .USE_PARAM_CFG_READ     (1),
                
                .INIT_PARAM_BGC         (SHADER_INIT_PARAM_BGC)
            )
        i_pixel_shader_texturemap_sram
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
                                                 
                .mem_reset                      (mem_reset),
                .mem_clk                        (mem_clk),
                .mem_we                         (mem_we),
                .mem_addrx                      (mem_addrx),
                .mem_addry                      (mem_addry),
                .mem_wdata                      (mem_wdata),
                
                .s_rasterizer_frame_start       (rasterizer_frame_start),
                .s_rasterizer_line_end          (rasterizer_line_end),
                .s_rasterizer_polygon_enable    (rasterizer_polygon_enable),
                .s_rasterizer_polygon_index     (rasterizer_polygon_index),
                .s_rasterizer_shader_params     (rasterizer_shader_params),
                .s_rasterizer_valid             (rasterizer_valid),
                .s_rasterizer_ready             (cke),
                
                .m_axi4s_tuser                  (m_axi4s_tuser),
                .m_axi4s_tlast                  (m_axi4s_tlast),
                .m_axi4s_tdata                  (m_axi4s_tdata),
                .m_axi4s_tstrb                  (m_axi4s_tstrb),
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
