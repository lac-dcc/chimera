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


// テクスチャマッピング版
module jelly_gpu_texturemap
        #(
            parameter   COMPONENT_NUM                     = 3,
            parameter   DATA_SIZE                         = 0,
            parameter   DATA_WIDTH                        = (8 << DATA_SIZE),
            
            parameter   WB_ADR_WIDTH                      = 16,
            parameter   WB_DAT_WIDTH                      = 32,
            parameter   WB_SEL_WIDTH                      = (WB_DAT_WIDTH / 8),
            
            parameter   AXI4S_TUSER_WIDTH                 = 1,
            parameter   AXI4S_TDATA_WIDTH                 = COMPONENT_NUM*DATA_WIDTH,

            parameter   AXI4_ID_WIDTH                     = 6,
            parameter   AXI4_ADDR_WIDTH                   = 32,
            parameter   AXI4_DATA_SIZE                    = 3,  // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   AXI4_DATA_WIDTH                   = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH                    = 8,
            parameter   AXI4_QOS_WIDTH                    = 4,
            parameter   AXI4_ARID                         = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE                       = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST                      = 2'b01,
            parameter   AXI4_ARLOCK                       = 1'b0,
            parameter   AXI4_ARCACHE                      = 4'b0001,
            parameter   AXI4_ARPROT                       = 3'b000,
            parameter   AXI4_ARQOS                        = 0,
            parameter   AXI4_ARREGION                     = 4'b0000,
            parameter   AXI4_REGS                         = 1,
            
            parameter   IMAGE_X_NUM                       = 640,
            parameter   X_WIDTH                           = 12,
            parameter   Y_WIDTH                           = 12,

            parameter   U_PHY_WIDTH                       = 10,     // 1024
            parameter   V_PHY_WIDTH                       = 10,     // 1024
            parameter   U_WIDTH                           = U_PHY_WIDTH + 2,
            parameter   V_WIDTH                           = V_PHY_WIDTH + 2,
            
            parameter   CORE_ADDR_WIDTH                   = 14,
            parameter   PARAMS_ADDR_WIDTH                 = 12,
            parameter   BANK_ADDR_WIDTH                   = 10,
            
            parameter   BANK_NUM                          = 2,
            parameter   EDGE_NUM                          = 12,
            parameter   POLYGON_NUM                       = 6,
            parameter   SHADER_PARAM_NUM                  = 1 + 2,      // Z + UV
            
            parameter   EDGE_PARAM_WIDTH                  = 32,
            parameter   EDGE_RAM_TYPE                     = "distributed",
            
            parameter   SHADER_PARAM_WIDTH                = 32,
            parameter   SHADER_PARAM_Q                    = 24,
            parameter   SHADER_RAM_TYPE                   = "distributed",
            
            parameter   REGION_PARAM_WIDTH                = EDGE_NUM,
            parameter   REGION_RAM_TYPE                   = "distributed",
            
            parameter   CULLING_ONLY                      = 0,
            parameter   Z_SORT_MIN                        = 0,  // 1で小さい値優先(Z軸奥向き)
            
            parameter   RASTERIZER_INIT_CTL_ENABLE        = 1'b0,
            parameter   RASTERIZER_INIT_CTL_UPDATE        = 1'b0,
            parameter   RASTERIZER_INIT_PARAM_WIDTH       = 640-1,
            parameter   RASTERIZER_INIT_PARAM_HEIGHT      = 480-1,
            parameter   RASTERIZER_INIT_PARAM_CULLING     = 2'b01,
            parameter   RASTERIZER_INIT_PARAM_BANK        = 0,
            
            parameter   SHADER_INIT_PARAM_ADDR            = 32'h0000_0000,
            parameter   SHADER_INIT_PARAM_WIDTH           = 640,
            parameter   SHADER_INIT_PARAM_HEIGHT          = 480,
            parameter   SHADER_INIT_PARAM_STRIDE_C        = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE),
            parameter   SHADER_INIT_PARAM_STRIDE_X        = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM,
            parameter   SHADER_INIT_PARAM_STRIDE_Y        = 640*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM,
            parameter   SHADER_INIT_PARAM_NEARESTNEIGHBOR = 0,
            parameter   SHADER_INIT_PARAM_X_OP            = 3'b000,
            parameter   SHADER_INIT_PARAM_Y_OP            = 3'b000,
            parameter   SHADER_INIT_PARAM_BORDER_VALUE    = 24'h000000,
            parameter   SHADER_INIT_PARAM_BGC             = 24'h000000,
            
            
            parameter   TEX_PARALLEL_NUM                  = 4,
            parameter   TEX_ADDR_WIDTH                    = 24,
            parameter   TEX_ADDR_X_WIDTH                  = 10,
            parameter   TEX_ADDR_Y_WIDTH                  = 9,
            parameter   TEX_STRIDE_C_WIDTH                = 14,
            parameter   TEX_STRIDE_X_WIDTH                = 14,
            parameter   TEX_STRIDE_Y_WIDTH                = 14,
            
            parameter   TEX_USE_BILINEAR                  = 1,
            parameter   TEX_USE_BORDER                    = 0,
            
            parameter   SCATTER_FIFO_PTR_WIDTH            = 6,
            parameter   SCATTER_FIFO_RAM_TYPE             = "distributed",
            parameter   SCATTER_S_REGS                    = 1,
            parameter   SCATTER_M_REGS                    = 1,
            parameter   SCATTER_INTERNAL_REGS             = (TEX_PARALLEL_NUM > 32),
            
            parameter   GATHER_FIFO_PTR_WIDTH             = 6,
            parameter   GATHER_FIFO_RAM_TYPE              = "distributed",
            parameter   GATHER_S_REGS                     = 1,
            parameter   GATHER_M_REGS                     = 1,
            parameter   GATHER_INTERNAL_REGS              = (TEX_PARALLEL_NUM > 32),
            
            parameter   SAMPLER2D_INT_WIDTH               = (TEX_ADDR_X_WIDTH > TEX_ADDR_Y_WIDTH ? TEX_ADDR_X_WIDTH : TEX_ADDR_Y_WIDTH) + 2,
            parameter   SAMPLER2D_FRAC_WIDTH              = 4,
            parameter   SAMPLER2D_COEFF_INT_WIDTH         = 1,
            parameter   SAMPLER2D_COEFF_FRAC_WIDTH        = SAMPLER2D_FRAC_WIDTH + SAMPLER2D_FRAC_WIDTH,
            parameter   SAMPLER2D_S_REGS                  = 1,
            parameter   SAMPLER2D_M_REGS                  = 1,
            parameter   SAMPLER2D_USER_FIFO_PTR_WIDTH     = 6,
            parameter   SAMPLER2D_USER_FIFO_RAM_TYPE      = "distributed",
            parameter   SAMPLER2D_USER_FIFO_M_REGS        = 0,
            
            parameter   L1_USE_LOOK_AHEAD                 = 0,
            parameter   L1_BLK_X_SIZE                     = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_BLK_Y_SIZE                     = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_WAY_NUM                        = 4,
            parameter   L1_TAG_ADDR_WIDTH                 = 4,
            parameter   L1_TAG_RAM_TYPE                   = "distributed",
            parameter   L1_TAG_ALGORITHM                  = "TWIST",
            parameter   L1_TAG_M_SLAVE_REGS               = 0,
            parameter   L1_TAG_M_MASTER_REGS              = 0,
            parameter   L1_MEM_RAM_TYPE                   = "block",
            parameter   L1_DATA_SIZE                      = 2,
            parameter   L1_QUE_FIFO_PTR_WIDTH             = L1_USE_LOOK_AHEAD ? 5 : 0,
            parameter   L1_QUE_FIFO_RAM_TYPE              = "distributed",
            parameter   L1_QUE_FIFO_S_REGS                = 0,
            parameter   L1_QUE_FIFO_M_REGS                = 0,
            parameter   L1_AR_FIFO_PTR_WIDTH              = 0,
            parameter   L1_AR_FIFO_RAM_TYPE               = "distributed",
            parameter   L1_AR_FIFO_S_REGS                 = 0,
            parameter   L1_AR_FIFO_M_REGS                 = 0,
            parameter   L1_R_FIFO_PTR_WIDTH               = L1_USE_LOOK_AHEAD ? L1_BLK_Y_SIZE + L1_BLK_X_SIZE - L1_DATA_SIZE : 0,
            parameter   L1_R_FIFO_RAM_TYPE                = "block",
            parameter   L1_R_FIFO_S_REGS                  = 0,
            parameter   L1_R_FIFO_M_REGS                  = 0,
            parameter   L1_LOG_ENABLE                     = 0,
            parameter   L1_LOG_FILE                       = "l1_log.txt",
            parameter   L1_LOG_ID                         = 0,
            
            parameter   L2_PARALLEL_SIZE                  = 2,
            parameter   L2_USE_LOOK_AHEAD                 = 0,
            parameter   L2_BLK_X_SIZE                     = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_BLK_Y_SIZE                     = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_WAY_NUM                        = 4,
            parameter   L2_TAG_ADDR_WIDTH                 = 4,
            parameter   L2_TAG_RAM_TYPE                   = "distributed",
            parameter   L2_TAG_ALGORITHM                  = L2_PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
            parameter   L2_TAG_M_SLAVE_REGS               = 0,
            parameter   L2_TAG_M_MASTER_REGS              = 0,
            parameter   L2_MEM_RAM_TYPE                   = "block",
            parameter   L2_QUE_FIFO_PTR_WIDTH             = L2_USE_LOOK_AHEAD ? 5 : 0,
            parameter   L2_QUE_FIFO_RAM_TYPE              = "distributed",
            parameter   L2_QUE_FIFO_S_REGS                = 0,
            parameter   L2_QUE_FIFO_M_REGS                = 0,
            parameter   L2_AR_FIFO_PTR_WIDTH              = 0,
            parameter   L2_AR_FIFO_RAM_TYPE               = "distributed",
            parameter   L2_AR_FIFO_S_REGS                 = 0,
            parameter   L2_AR_FIFO_M_REGS                 = 0,
            parameter   L2_R_FIFO_PTR_WIDTH               = L2_USE_LOOK_AHEAD ? L2_BLK_Y_SIZE + L2_BLK_X_SIZE - AXI4_DATA_SIZE : 0,
            parameter   L2_R_FIFO_RAM_TYPE                = "block",
            parameter   L2_R_FIFO_S_REGS                  = 0,
            parameter   L2_R_FIFO_M_REGS                  = 0,
            parameter   L2_LOG_ENABLE                     = 0,
            parameter   L2_LOG_FILE                       = "l2_log.txt",
            parameter   L2_LOG_ID                         = 0,
            
            parameter   DMA_QUE_FIFO_PTR_WIDTH            = 6,
            parameter   DMA_QUE_FIFO_RAM_TYPE             = "distributed",
            parameter   DMA_QUE_FIFO_S_REGS               = 0,
            parameter   DMA_QUE_FIFO_M_REGS               = 1,
            parameter   DMA_S_AR_REGS                     = 1,
            parameter   DMA_S_R_REGS                      = 1,
            
            parameter   DEVICE                            = "RTL"
        )
        (
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                endian,
            
            input   wire                                clear_start,
            input   wire                                clear_busy,
            
            input   wire                                s_wb_rst_i,
            input   wire                                s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i,
            input   wire                                s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            output  wire    [AXI4S_TUSER_WIDTH-1:0]     m_axi4s_tuser,
            output  wire                                m_axi4s_tlast,
            output  wire    [AXI4S_TDATA_WIDTH-1:0]     m_axi4s_tdata,
            output  wire                                m_axi4s_tstrb,
            output  wire                                m_axi4s_tvalid,
            input   wire                                m_axi4s_tready,

            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen,
            output  wire    [2:0]                       m_axi4_arsize,
            output  wire    [1:0]                       m_axi4_arburst,
            output  wire    [0:0]                       m_axi4_arlock,
            output  wire    [3:0]                       m_axi4_arcache,
            output  wire    [2:0]                       m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos,
            output  wire    [3:0]                       m_axi4_arregion,
            output  wire                                m_axi4_arvalid,
            input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            input   wire                                m_axi4_rvalid,
            output  wire                                m_axi4_rready
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
                
                .CFG_SHADER_TYPE                (CFG_SHADER_TYPE),
                .CFG_VERSION                    (CFG_VERSION),
//              .CFG_SHADER_PARAM_Q             (SHADER_PARAM_Q),
                
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
    localparam  SAMPLER2D_X_WIDTH                 = SAMPLER2D_INT_WIDTH + SAMPLER2D_FRAC_WIDTH;
    localparam  SAMPLER2D_Y_WIDTH                 = SAMPLER2D_INT_WIDTH + SAMPLER2D_FRAC_WIDTH;
    localparam  SAMPLER2D_COEFF_WIDTH             = SAMPLER2D_COEFF_INT_WIDTH + SAMPLER2D_COEFF_FRAC_WIDTH;
    localparam  S_AXI4S_TUSER_WIDTH               = 1;
    localparam  S_AXI4S_TTEXCORDU_WIDTH           = SAMPLER2D_INT_WIDTH + SAMPLER2D_FRAC_WIDTH;
    localparam  S_AXI4S_TTEXCORDV_WIDTH           = SAMPLER2D_INT_WIDTH + SAMPLER2D_FRAC_WIDTH;

    wire    [WB_DAT_WIDTH-1:0]                          wb_shader_dat_o;
    wire                                                wb_shader_stb_i;
    wire                                                wb_shader_ack_o;
    
    jelly_pixel_shader_texturemap
            #(
                .IMAGE_X_NUM                    (IMAGE_X_NUM),
                .PARALLEL_NUM                   (TEX_PARALLEL_NUM),
                .COMPONENT_NUM                  (COMPONENT_NUM),
                .DATA_SIZE                      (DATA_SIZE),
                .DATA_WIDTH                     (DATA_WIDTH),
                .ADDR_WIDTH                     (TEX_ADDR_WIDTH),
                .ADDR_X_WIDTH                   (TEX_ADDR_X_WIDTH),
                .ADDR_Y_WIDTH                   (TEX_ADDR_Y_WIDTH),
                .STRIDE_C_WIDTH                 (TEX_STRIDE_C_WIDTH),
                .STRIDE_X_WIDTH                 (TEX_STRIDE_X_WIDTH),
                .STRIDE_Y_WIDTH                 (TEX_STRIDE_Y_WIDTH),
                .U_PHY_WIDTH                    (U_PHY_WIDTH),
                .V_PHY_WIDTH                    (V_PHY_WIDTH),
                .U_WIDTH                        (U_WIDTH),
                .V_WIDTH                        (V_WIDTH),
                
                .WB_ADR_WIDTH                   (CORE_ADDR_WIDTH),
                .WB_DAT_WIDTH                   (WB_DAT_WIDTH),
                .WB_SEL_WIDTH                   (WB_SEL_WIDTH),
                
                .USE_PARAM_CFG_READ             (1),
                
                .SHADER_PARAM_NUM               (SHADER_PARAM_NUM),
                .SHADER_PARAM_WIDTH             (SHADER_PARAM_WIDTH),
                .SHADER_PARAM_Q                 (SHADER_PARAM_Q),
                .INDEX_WIDTH                    (INDEX_WIDTH),
                
                .USE_BILINEAR                   (TEX_USE_BILINEAR),
                .USE_BORDER                     (TEX_USE_BORDER),
                
                .SCATTER_FIFO_PTR_WIDTH         (SCATTER_FIFO_PTR_WIDTH),
                .SCATTER_FIFO_RAM_TYPE          (SCATTER_FIFO_RAM_TYPE),
                .SCATTER_S_REGS                 (SCATTER_S_REGS),
                .SCATTER_M_REGS                 (SCATTER_M_REGS),
                .SCATTER_INTERNAL_REGS          (SCATTER_INTERNAL_REGS),
                
                .GATHER_FIFO_PTR_WIDTH          (GATHER_FIFO_PTR_WIDTH),
                .GATHER_FIFO_RAM_TYPE           (GATHER_FIFO_RAM_TYPE),
                .GATHER_S_REGS                  (GATHER_S_REGS),
                .GATHER_M_REGS                  (GATHER_M_REGS),
                .GATHER_INTERNAL_REGS           (GATHER_INTERNAL_REGS),
                
                .SAMPLER2D_INT_WIDTH            (SAMPLER2D_INT_WIDTH),
                .SAMPLER2D_FRAC_WIDTH           (SAMPLER2D_FRAC_WIDTH),
                .SAMPLER2D_COEFF_INT_WIDTH      (SAMPLER2D_COEFF_INT_WIDTH),
                .SAMPLER2D_COEFF_FRAC_WIDTH     (SAMPLER2D_COEFF_FRAC_WIDTH),
                .SAMPLER2D_S_REGS               (SAMPLER2D_S_REGS),
                .SAMPLER2D_M_REGS               (SAMPLER2D_M_REGS),
                .SAMPLER2D_USER_FIFO_PTR_WIDTH  (SAMPLER2D_USER_FIFO_PTR_WIDTH),
                .SAMPLER2D_USER_FIFO_RAM_TYPE   (SAMPLER2D_USER_FIFO_RAM_TYPE),
                .SAMPLER2D_USER_FIFO_M_REGS     (SAMPLER2D_USER_FIFO_M_REGS),
                .SAMPLER2D_X_WIDTH              (SAMPLER2D_X_WIDTH),
                .SAMPLER2D_Y_WIDTH              (SAMPLER2D_Y_WIDTH),
                .SAMPLER2D_COEFF_WIDTH          (SAMPLER2D_COEFF_WIDTH),
                
                .S_AXI4S_TUSER_WIDTH            (S_AXI4S_TUSER_WIDTH),
                .S_AXI4S_TTEXCORDU_WIDTH        (S_AXI4S_TTEXCORDU_WIDTH),
                .S_AXI4S_TTEXCORDV_WIDTH        (S_AXI4S_TTEXCORDV_WIDTH),
                
                .M_AXI4S_TUSER_WIDTH            (AXI4S_TUSER_WIDTH),
                .M_AXI4S_TDATA_WIDTH            (AXI4S_TDATA_WIDTH),
                
                .M_AXI4_ID_WIDTH                (AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH              (AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE               (AXI4_DATA_SIZE),
                .M_AXI4_DATA_WIDTH              (AXI4_DATA_WIDTH),
                .M_AXI4_LEN_WIDTH               (AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH               (AXI4_QOS_WIDTH),
                .M_AXI4_ARID                    (AXI4_ARID),
                .M_AXI4_ARSIZE                  (AXI4_ARSIZE),
                .M_AXI4_ARBURST                 (AXI4_ARBURST),
                .M_AXI4_ARLOCK                  (AXI4_ARLOCK),
                .M_AXI4_ARCACHE                 (AXI4_ARCACHE),
                .M_AXI4_ARPROT                  (AXI4_ARPROT),
                .M_AXI4_ARQOS                   (AXI4_ARQOS),
                .M_AXI4_ARREGION                (AXI4_ARREGION),
                .M_AXI4_REGS                    (AXI4_REGS),
                
                .L1_USE_LOOK_AHEAD              (L1_USE_LOOK_AHEAD),
                .L1_BLK_X_SIZE                  (L1_BLK_X_SIZE),
                .L1_BLK_Y_SIZE                  (L1_BLK_Y_SIZE),
                .L1_WAY_NUM                     (L1_WAY_NUM),
                .L1_TAG_ADDR_WIDTH              (L1_TAG_ADDR_WIDTH),
                .L1_TAG_RAM_TYPE                (L1_TAG_RAM_TYPE),
                .L1_TAG_ALGORITHM               (L1_TAG_ALGORITHM),
                .L1_TAG_M_SLAVE_REGS            (L1_TAG_M_SLAVE_REGS),
                .L1_TAG_M_MASTER_REGS           (L1_TAG_M_MASTER_REGS),
                .L1_MEM_RAM_TYPE                (L1_MEM_RAM_TYPE),
                .L1_DATA_SIZE                   (L1_DATA_SIZE),
                .L1_QUE_FIFO_PTR_WIDTH          (L1_QUE_FIFO_PTR_WIDTH),
                .L1_QUE_FIFO_RAM_TYPE           (L1_QUE_FIFO_RAM_TYPE),
                .L1_QUE_FIFO_S_REGS             (L1_QUE_FIFO_S_REGS),
                .L1_QUE_FIFO_M_REGS             (L1_QUE_FIFO_M_REGS),
                .L1_AR_FIFO_PTR_WIDTH           (L1_AR_FIFO_PTR_WIDTH),
                .L1_AR_FIFO_RAM_TYPE            (L1_AR_FIFO_RAM_TYPE),
                .L1_AR_FIFO_S_REGS              (L1_AR_FIFO_S_REGS),
                .L1_AR_FIFO_M_REGS              (L1_AR_FIFO_M_REGS),
                .L1_R_FIFO_PTR_WIDTH            (L1_R_FIFO_PTR_WIDTH),
                .L1_R_FIFO_RAM_TYPE             (L1_R_FIFO_RAM_TYPE),
                .L1_R_FIFO_S_REGS               (L1_R_FIFO_S_REGS),
                .L1_R_FIFO_M_REGS               (L1_R_FIFO_M_REGS),
                .L1_LOG_ENABLE                  (L1_LOG_ENABLE),
                .L1_LOG_FILE                    (L1_LOG_FILE),
                .L1_LOG_ID                      (L1_LOG_ID),
                
                .L2_PARALLEL_SIZE               (L2_PARALLEL_SIZE),
                .L2_USE_LOOK_AHEAD              (L2_USE_LOOK_AHEAD),
                .L2_BLK_X_SIZE                  (L2_BLK_X_SIZE),
                .L2_BLK_Y_SIZE                  (L2_BLK_Y_SIZE),
                .L2_WAY_NUM                     (L2_WAY_NUM),
                .L2_TAG_ADDR_WIDTH              (L2_TAG_ADDR_WIDTH),
                .L2_TAG_RAM_TYPE                (L2_TAG_RAM_TYPE),
                .L2_TAG_ALGORITHM               (L2_TAG_ALGORITHM),
                .L2_TAG_M_SLAVE_REGS            (L2_TAG_M_SLAVE_REGS),
                .L2_TAG_M_MASTER_REGS           (L2_TAG_M_MASTER_REGS),
                .L2_MEM_RAM_TYPE                (L2_MEM_RAM_TYPE),
                .L2_QUE_FIFO_PTR_WIDTH          (L2_QUE_FIFO_PTR_WIDTH),
                .L2_QUE_FIFO_RAM_TYPE           (L2_QUE_FIFO_RAM_TYPE),
                .L2_QUE_FIFO_S_REGS             (L2_QUE_FIFO_S_REGS),
                .L2_QUE_FIFO_M_REGS             (L2_QUE_FIFO_M_REGS),
                .L2_AR_FIFO_PTR_WIDTH           (L2_AR_FIFO_PTR_WIDTH),
                .L2_AR_FIFO_RAM_TYPE            (L2_AR_FIFO_RAM_TYPE),
                .L2_AR_FIFO_S_REGS              (L2_AR_FIFO_S_REGS),
                .L2_AR_FIFO_M_REGS              (L2_AR_FIFO_M_REGS),
                .L2_R_FIFO_PTR_WIDTH            (L2_R_FIFO_PTR_WIDTH),
                .L2_R_FIFO_RAM_TYPE             (L2_R_FIFO_RAM_TYPE),
                .L2_R_FIFO_S_REGS               (L2_R_FIFO_S_REGS),
                .L2_R_FIFO_M_REGS               (L2_R_FIFO_M_REGS),
                .L2_LOG_ENABLE                  (L2_LOG_ENABLE),
                .L2_LOG_FILE                    (L2_LOG_FILE),
                .L2_LOG_ID                      (L2_LOG_ID),
                
                .DMA_QUE_FIFO_PTR_WIDTH         (DMA_QUE_FIFO_PTR_WIDTH),
                .DMA_QUE_FIFO_RAM_TYPE          (DMA_QUE_FIFO_RAM_TYPE),
                .DMA_QUE_FIFO_S_REGS            (DMA_QUE_FIFO_S_REGS),
                .DMA_QUE_FIFO_M_REGS            (DMA_QUE_FIFO_M_REGS),
                .DMA_S_AR_REGS                  (DMA_S_AR_REGS),
                .DMA_S_R_REGS                   (DMA_S_R_REGS),
                
                .DEVICE                         (DEVICE),
                
                .INIT_PARAM_ADDR                (SHADER_INIT_PARAM_ADDR),
                .INIT_PARAM_WIDTH               (SHADER_INIT_PARAM_WIDTH),
                .INIT_PARAM_HEIGHT              (SHADER_INIT_PARAM_HEIGHT),
                .INIT_PARAM_STRIDE_C            (SHADER_INIT_PARAM_STRIDE_C),
                .INIT_PARAM_STRIDE_X            (SHADER_INIT_PARAM_STRIDE_X),
                .INIT_PARAM_STRIDE_Y            (SHADER_INIT_PARAM_STRIDE_Y),
                .INIT_PARAM_NEARESTNEIGHBOR     (SHADER_INIT_PARAM_NEARESTNEIGHBOR),
                .INIT_PARAM_X_OP                (SHADER_INIT_PARAM_X_OP),
                .INIT_PARAM_Y_OP                (SHADER_INIT_PARAM_Y_OP),
                .INIT_PARAM_BORDER_VALUE        (SHADER_INIT_PARAM_BORDER_VALUE),
                .INIT_PARAM_BGC                 (SHADER_INIT_PARAM_BGC)
            )
        i_pixel_shader_texturemap
            (
                .reset                          (reset),
                .clk                            (clk),
                .endian                         (endian),
                
                .start                          (start),
                .busy                           (busy),
                .update                         (update),
                
                .clear_start                    (clear_start),
                .clear_busy                     (clear_busy ),
                
                .status_l1_idle                 (),
                .status_l1_stall                (),
                .status_l1_access               (),
                .status_l1_hit                  (),
                .status_l1_miss                 (),
                .status_l1_blank                (),
                .status_l2_idle                 (),
                .status_l2_stall                (),
                .status_l2_access               (),
                .status_l2_hit                  (),
                .status_l2_miss                 (),
                .status_l2_blank                (),
                
                .s_wb_rst_i                     (s_wb_rst_i),
                .s_wb_clk_i                     (s_wb_clk_i),
                .s_wb_adr_i                     (s_wb_adr_i[CORE_ADDR_WIDTH-1:0]),
                .s_wb_dat_o                     (wb_shader_dat_o),
                .s_wb_dat_i                     (s_wb_dat_i),
                .s_wb_we_i                      (s_wb_we_i),
                .s_wb_sel_i                     (s_wb_sel_i),
                .s_wb_stb_i                     (wb_shader_stb_i),
                .s_wb_ack_o                     (wb_shader_ack_o),
                
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
                .m_axi4s_tready                 (m_axi4s_tready),
                
                .m_axi4_arid                    (m_axi4_arid),
                .m_axi4_araddr                  (m_axi4_araddr),
                .m_axi4_arlen                   (m_axi4_arlen),
                .m_axi4_arsize                  (m_axi4_arsize),
                .m_axi4_arburst                 (m_axi4_arburst),
                .m_axi4_arlock                  (m_axi4_arlock),
                .m_axi4_arcache                 (m_axi4_arcache),
                .m_axi4_arprot                  (m_axi4_arprot),
                .m_axi4_arqos                   (m_axi4_arqos),
                .m_axi4_arregion                (m_axi4_arregion),
                .m_axi4_arvalid                 (m_axi4_arvalid),
                .m_axi4_arready                 (m_axi4_arready),
                .m_axi4_rid                     (m_axi4_rid),
                .m_axi4_rdata                   (m_axi4_rdata),
                .m_axi4_rresp                   (m_axi4_rresp),
                .m_axi4_rlast                   (m_axi4_rlast),
                .m_axi4_rvalid                  (m_axi4_rvalid),
                .m_axi4_rready                  (m_axi4_rready)
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
