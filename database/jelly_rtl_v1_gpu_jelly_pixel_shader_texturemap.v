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


// テクスチャマップ用シェーダー
module jelly_pixel_shader_texturemap
        #(
            parameter   IMAGE_X_NUM                   = 640,
            parameter   PARALLEL_NUM                  = 1,
            
            parameter   COMPONENT_NUM                 = 3,
            parameter   DATA_SIZE                     = 0,
            parameter   DATA_WIDTH                    = (8 << DATA_SIZE),
            parameter   ADDR_WIDTH                    = 24,
            parameter   ADDR_X_WIDTH                  = 10,
            parameter   ADDR_Y_WIDTH                  = 9,
            parameter   STRIDE_C_WIDTH                = 14,
            parameter   STRIDE_X_WIDTH                = 14,
            parameter   STRIDE_Y_WIDTH                = 14,
            
            parameter   WB_ADR_WIDTH                  = 14,
            parameter   WB_DAT_WIDTH                  = 32,
            parameter   WB_SEL_WIDTH                  = (WB_DAT_WIDTH / 8),
            
            parameter   USE_PARAM_CFG_READ            = 1,
            
            parameter   U_PHY_WIDTH                   = 10,     // 1024
            parameter   V_PHY_WIDTH                   = 10,     // 1024
            parameter   U_WIDTH                       = U_PHY_WIDTH + 2,
            parameter   V_WIDTH                       = V_PHY_WIDTH + 2,
            
            parameter   SHADER_PARAM_NUM              = 1 + 2,      // Z + UV
            parameter   SHADER_PARAM_WIDTH            = 32,
            parameter   SHADER_PARAM_Q                = 24,
            parameter   INDEX_WIDTH                   = 4,
            
            parameter   USE_BILINEAR                  = 1,
            parameter   USE_BORDER                    = 0,
            
            parameter   SCATTER_FIFO_PTR_WIDTH        = 6,
            parameter   SCATTER_FIFO_RAM_TYPE         = "distributed",
            parameter   SCATTER_S_REGS                = 1,
            parameter   SCATTER_M_REGS                = 1,
            parameter   SCATTER_INTERNAL_REGS         = (PARALLEL_NUM > 32),
            
            parameter   GATHER_FIFO_PTR_WIDTH         = 6,
            parameter   GATHER_FIFO_RAM_TYPE          = "distributed",
            parameter   GATHER_S_REGS                 = 1,
            parameter   GATHER_M_REGS                 = 1,
            parameter   GATHER_INTERNAL_REGS          = (PARALLEL_NUM > 32),
            
            parameter   SAMPLER2D_INT_WIDTH           = (ADDR_X_WIDTH > ADDR_Y_WIDTH ? ADDR_X_WIDTH : ADDR_Y_WIDTH) + 2,
            parameter   SAMPLER2D_FRAC_WIDTH          = 4,
            parameter   SAMPLER2D_X_INT_WIDTH         = SAMPLER2D_INT_WIDTH,
            parameter   SAMPLER2D_X_FRAC_WIDTH        = SAMPLER2D_FRAC_WIDTH,
            parameter   SAMPLER2D_Y_INT_WIDTH         = SAMPLER2D_INT_WIDTH,
            parameter   SAMPLER2D_Y_FRAC_WIDTH        = SAMPLER2D_FRAC_WIDTH,
            parameter   SAMPLER2D_COEFF_INT_WIDTH     = 1,
            parameter   SAMPLER2D_COEFF_FRAC_WIDTH    = SAMPLER2D_X_FRAC_WIDTH + SAMPLER2D_Y_FRAC_WIDTH,
            parameter   SAMPLER2D_S_REGS              = 1,
            parameter   SAMPLER2D_M_REGS              = 1,
            parameter   SAMPLER2D_USER_FIFO_PTR_WIDTH = 6,
            parameter   SAMPLER2D_USER_FIFO_RAM_TYPE  = "distributed",
            parameter   SAMPLER2D_USER_FIFO_M_REGS    = 0,
            parameter   SAMPLER2D_X_WIDTH             = SAMPLER2D_X_INT_WIDTH + SAMPLER2D_X_FRAC_WIDTH,
            parameter   SAMPLER2D_Y_WIDTH             = SAMPLER2D_Y_INT_WIDTH + SAMPLER2D_Y_FRAC_WIDTH,
            parameter   SAMPLER2D_COEFF_WIDTH         = SAMPLER2D_COEFF_INT_WIDTH + SAMPLER2D_COEFF_FRAC_WIDTH,
            
            parameter   S_AXI4S_TUSER_WIDTH           = 1,
            parameter   S_AXI4S_TTEXCORDU_WIDTH       = SAMPLER2D_X_INT_WIDTH + SAMPLER2D_X_FRAC_WIDTH,
            parameter   S_AXI4S_TTEXCORDV_WIDTH       = SAMPLER2D_Y_INT_WIDTH + SAMPLER2D_Y_FRAC_WIDTH,
            
            parameter   M_AXI4S_TUSER_WIDTH           = S_AXI4S_TUSER_WIDTH,
            parameter   M_AXI4S_TDATA_WIDTH           = COMPONENT_NUM*DATA_WIDTH,
            
            parameter   M_AXI4_ID_WIDTH               = 6,
            parameter   M_AXI4_ADDR_WIDTH             = 32,
            parameter   M_AXI4_DATA_SIZE              = 3,  // 0:8bit, 1:16bit, 2:32bit, 3:64bit ...
            parameter   M_AXI4_DATA_WIDTH             = (8 << M_AXI4_DATA_SIZE),
            parameter   M_AXI4_LEN_WIDTH              = 8,
            parameter   M_AXI4_QOS_WIDTH              = 4,
            parameter   M_AXI4_ARID                   = {M_AXI4_ID_WIDTH{1'b0}},
            parameter   M_AXI4_ARSIZE                 = M_AXI4_DATA_SIZE,
            parameter   M_AXI4_ARBURST                = 2'b01,
            parameter   M_AXI4_ARLOCK                 = 1'b0,
            parameter   M_AXI4_ARCACHE                = 4'b0001,
            parameter   M_AXI4_ARPROT                 = 3'b000,
            parameter   M_AXI4_ARQOS                  = 0,
            parameter   M_AXI4_ARREGION               = 4'b0000,
            parameter   M_AXI4_REGS                   = 1,
            
            parameter   L1_USE_LOOK_AHEAD             = 0,
            parameter   L1_BLK_X_SIZE                 = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_BLK_Y_SIZE                 = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_WAY_NUM                    = 1,
            parameter   L1_TAG_ADDR_WIDTH             = 6,
            parameter   L1_TAG_RAM_TYPE               = "distributed",
            parameter   L1_TAG_ALGORITHM              = "TWIST",
            parameter   L1_TAG_M_SLAVE_REGS           = 0,
            parameter   L1_TAG_M_MASTER_REGS          = 0,
            parameter   L1_MEM_RAM_TYPE               = "block",
            parameter   L1_DATA_SIZE                  = 2,
            parameter   L1_QUE_FIFO_PTR_WIDTH         = L1_USE_LOOK_AHEAD ? 5 : 0,
            parameter   L1_QUE_FIFO_RAM_TYPE          = "distributed",
            parameter   L1_QUE_FIFO_S_REGS            = 0,
            parameter   L1_QUE_FIFO_M_REGS            = 0,
            parameter   L1_AR_FIFO_PTR_WIDTH          = 0,
            parameter   L1_AR_FIFO_RAM_TYPE           = "distributed",
            parameter   L1_AR_FIFO_S_REGS             = 0,
            parameter   L1_AR_FIFO_M_REGS             = 0,
            parameter   L1_R_FIFO_PTR_WIDTH           = L1_USE_LOOK_AHEAD ? L1_BLK_Y_SIZE + L1_BLK_X_SIZE - L1_DATA_SIZE : 0,
            parameter   L1_R_FIFO_RAM_TYPE            = "block",
            parameter   L1_R_FIFO_S_REGS              = 0,
            parameter   L1_R_FIFO_M_REGS              = 0,
            parameter   L1_LOG_ENABLE                 = 0,
            parameter   L1_LOG_FILE                   = "l1_log.txt",
            parameter   L1_LOG_ID                     = 0,
            
            parameter   L2_PARALLEL_SIZE              = 2,
            parameter   L2_USE_LOOK_AHEAD             = 0,
            parameter   L2_BLK_X_SIZE                 = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_BLK_Y_SIZE                 = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_WAY_NUM                    = 1,
            parameter   L2_TAG_ADDR_WIDTH             = 6,
            parameter   L2_TAG_RAM_TYPE               = "distributed",
            parameter   L2_TAG_ALGORITHM              = L2_PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
            parameter   L2_TAG_M_SLAVE_REGS           = 0,
            parameter   L2_TAG_M_MASTER_REGS          = 0,
            parameter   L2_MEM_RAM_TYPE               = "block",
            parameter   L2_QUE_FIFO_PTR_WIDTH         = L2_USE_LOOK_AHEAD ? 5 : 0,
            parameter   L2_QUE_FIFO_RAM_TYPE          = "distributed",
            parameter   L2_QUE_FIFO_S_REGS            = 0,
            parameter   L2_QUE_FIFO_M_REGS            = 0,
            parameter   L2_AR_FIFO_PTR_WIDTH          = 0,
            parameter   L2_AR_FIFO_RAM_TYPE           = "distributed",
            parameter   L2_AR_FIFO_S_REGS             = 0,
            parameter   L2_AR_FIFO_M_REGS             = 0,
            parameter   L2_R_FIFO_PTR_WIDTH           = L2_USE_LOOK_AHEAD ? L2_BLK_Y_SIZE + L2_BLK_X_SIZE - M_AXI4_DATA_SIZE : 0,
            parameter   L2_R_FIFO_RAM_TYPE            = "block",
            parameter   L2_R_FIFO_S_REGS              = 0,
            parameter   L2_R_FIFO_M_REGS              = 0,
            parameter   L2_LOG_ENABLE                 = 0,
            parameter   L2_LOG_FILE                   = "l2_log.txt",
            parameter   L2_LOG_ID                     = 0,
            
            parameter   DMA_QUE_FIFO_PTR_WIDTH        = 6,
            parameter   DMA_QUE_FIFO_RAM_TYPE         = "distributed",
            parameter   DMA_QUE_FIFO_S_REGS           = 0,
            parameter   DMA_QUE_FIFO_M_REGS           = 1,
            parameter   DMA_S_AR_REGS                 = 1,
            parameter   DMA_S_R_REGS                  = 1,
            
            parameter   DEVICE                        = "RTL",
            
            parameter   INIT_PARAM_ADDR               = 32'h0000_0000,
            parameter   INIT_PARAM_WIDTH              = 640,
            parameter   INIT_PARAM_HEIGHT             = 480,
            parameter   INIT_PARAM_STRIDE_C           = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE),
            parameter   INIT_PARAM_STRIDE_X           = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM,
            parameter   INIT_PARAM_STRIDE_Y           = 640*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM,
            parameter   INIT_PARAM_NEARESTNEIGHBOR    = 0,
            parameter   INIT_PARAM_X_OP               = 3'b000,
            parameter   INIT_PARAM_Y_OP               = 3'b000,
            parameter   INIT_PARAM_BORDER_VALUE       = 24'h000000,
            parameter   INIT_PARAM_BGC                = 24'h000000,
            
            // local
            parameter   L1_CACHE_NUM                  = PARALLEL_NUM,
            parameter   L2_CACHE_NUM                  = (1 << L2_PARALLEL_SIZE),
            parameter   S_AXI4S_TUSER_BITS            = S_AXI4S_TUSER_WIDTH > 0 ? S_AXI4S_TUSER_WIDTH : 1,
            parameter   M_AXI4S_TUSER_BITS            = M_AXI4S_TUSER_WIDTH > 0 ? M_AXI4S_TUSER_WIDTH : 1
        )
        (
            // system
            input   wire                                                    reset,
            input   wire                                                    clk,
            input   wire                                                    endian,
            
            // control
            input   wire                                                    start,
            input   wire                                                    busy,
            input   wire                                                    update,
            
            // cache clear
            input   wire                                                    clear_start,
            output  wire                                                    clear_busy,
            
            // cache status
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_idle,
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_stall,
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_access,
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_hit,
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_miss,
            output  wire    [L1_CACHE_NUM-1:0]                              status_l1_blank,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_idle,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_stall,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_access,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_hit,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_miss,
            output  wire    [L2_CACHE_NUM-1:0]                              status_l2_blank,
            
            
            // WISHBONE
            input   wire                                                    s_wb_rst_i,
            input   wire                                                    s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]                              s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]                              s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]                              s_wb_dat_i,
            input   wire                                                    s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]                              s_wb_sel_i,
            input   wire                                                    s_wb_stb_i,
            output  wire                                                    s_wb_ack_o,
            
            // input from rasterizer
            input   wire                                                    s_rasterizer_frame_start,
            input   wire                                                    s_rasterizer_line_end,
            input   wire                                                    s_rasterizer_polygon_enable,
            input   wire    [INDEX_WIDTH-1:0]                               s_rasterizer_polygon_index,
            input   wire    [SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:0]       s_rasterizer_shader_params,
            input   wire                                                    s_rasterizer_valid,
            output  wire                                                    s_rasterizer_ready,
            
            // AXI4-Stream
            output  wire    [M_AXI4S_TUSER_BITS-1:0]                        m_axi4s_tuser,
            output  wire                                                    m_axi4s_tlast,
            output  wire    [M_AXI4S_TDATA_WIDTH-1:0]                       m_axi4s_tdata,
            output  wire                                                    m_axi4s_tstrb,
            output  wire                                                    m_axi4s_tvalid,
            input   wire                                                    m_axi4s_tready,
            
            
            // AXI4 read
            output  wire    [M_AXI4_ID_WIDTH-1:0]                           m_axi4_arid,
            output  wire    [M_AXI4_ADDR_WIDTH-1:0]                         m_axi4_araddr,
            output  wire    [M_AXI4_LEN_WIDTH-1:0]                          m_axi4_arlen,
            output  wire    [2:0]                                           m_axi4_arsize,
            output  wire    [1:0]                                           m_axi4_arburst,
            output  wire    [0:0]                                           m_axi4_arlock,
            output  wire    [3:0]                                           m_axi4_arcache,
            output  wire    [2:0]                                           m_axi4_arprot,
            output  wire    [M_AXI4_QOS_WIDTH-1:0]                          m_axi4_arqos,
            output  wire    [3:0]                                           m_axi4_arregion,
            output  wire                                                    m_axi4_arvalid,
            input   wire                                                    m_axi4_arready,
            input   wire    [M_AXI4_ID_WIDTH-1:0]                           m_axi4_rid,
            input   wire    [M_AXI4_DATA_WIDTH-1:0]                         m_axi4_rdata,
            input   wire    [1:0]                                           m_axi4_rresp,
            input   wire                                                    m_axi4_rlast,
            input   wire                                                    m_axi4_rvalid,
            output  wire                                                    m_axi4_rready
        );
    
    
    // -------------------------------------
    //  レジスタ
    // -------------------------------------
    
    // アドレス
    localparam  REG_ADDR_PARAM_ADDR             = 6'h00;
    localparam  REG_ADDR_PARAM_WIDTH            = 6'h01;
    localparam  REG_ADDR_PARAM_HEIGHT           = 6'h02;
    localparam  REG_ADDR_PARAM_STRIDE_C         = 6'h04;
    localparam  REG_ADDR_PARAM_STRIDE_X         = 6'h05;
    localparam  REG_ADDR_PARAM_STRIDE_Y         = 6'h06;
    localparam  REG_ADDR_PARAM_NEARESTNEIGHBOR  = 6'h07;
    localparam  REG_ADDR_PARAM_X_OP             = 6'h08;
    localparam  REG_ADDR_PARAM_Y_OP             = 6'h09;
    localparam  REG_ADDR_PARAM_BORDER_VALUE     = 6'h0a;
    localparam  REG_ADDR_PARAM_BGC              = 6'h0b;
    localparam  REG_ADDR_CFG_SHADER_PARAM_NUM   = 6'h10;
    localparam  REG_ADDR_CFG_SHADER_PARAM_WIDTH = 6'h11;
    localparam  REG_ADDR_CFG_SHADER_PARAM_Q     = 6'h12;
    
    // 表レジスタ
    reg     [M_AXI4_ADDR_WIDTH-1:0]             reg_param_addr;
    reg     [ADDR_X_WIDTH-1:0]                  reg_param_width;
    reg     [ADDR_Y_WIDTH-1:0]                  reg_param_height;
    reg     [STRIDE_C_WIDTH-1:0]                reg_param_stride_c;
    reg     [STRIDE_X_WIDTH-1:0]                reg_param_stride_x;
    reg     [STRIDE_Y_WIDTH-1:0]                reg_param_stride_y;
    reg                                         reg_param_nearestneighbor;
    reg     [2:0]                               reg_param_x_op;
    reg     [2:0]                               reg_param_y_op;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]      reg_param_border_value;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]      reg_param_bgc;
    
    // 裏レジスタ
    reg     [M_AXI4_ADDR_WIDTH-1:0]             reg_shadow_addr;
    reg     [ADDR_X_WIDTH-1:0]                  reg_shadow_width;
    reg     [ADDR_Y_WIDTH-1:0]                  reg_shadow_height;
    reg     [STRIDE_C_WIDTH-1:0]                reg_shadow_stride_c;
    reg     [STRIDE_X_WIDTH-1:0]                reg_shadow_stride_x;
    reg     [STRIDE_Y_WIDTH-1:0]                reg_shadow_stride_y;
    reg                                         reg_shadow_nearestneighbor;
    reg     [2:0]                               reg_shadow_x_op;
    reg     [2:0]                               reg_shadow_y_op;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]      reg_shadow_border_value;
    reg     [COMPONENT_NUM*DATA_WIDTH-1:0]      reg_shadow_bgc;
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_param_addr            <= INIT_PARAM_ADDR;
            reg_param_width           <= INIT_PARAM_WIDTH;
            reg_param_height          <= INIT_PARAM_HEIGHT;
            reg_param_stride_c        <= INIT_PARAM_STRIDE_C;
            reg_param_stride_x        <= INIT_PARAM_STRIDE_X;
            reg_param_stride_y        <= INIT_PARAM_STRIDE_Y;
            reg_param_nearestneighbor <= INIT_PARAM_NEARESTNEIGHBOR;
            reg_param_x_op            <= INIT_PARAM_X_OP;
            reg_param_y_op            <= INIT_PARAM_Y_OP;
            reg_param_border_value    <= INIT_PARAM_BORDER_VALUE;
            reg_param_bgc             <= INIT_PARAM_BGC;
        end
        else begin
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                REG_ADDR_PARAM_ADDR:            reg_param_addr            <= s_wb_dat_i;
                REG_ADDR_PARAM_WIDTH:           reg_param_width           <= s_wb_dat_i;
                REG_ADDR_PARAM_HEIGHT:          reg_param_height          <= s_wb_dat_i;
                REG_ADDR_PARAM_STRIDE_C:        reg_param_stride_c        <= s_wb_dat_i;
                REG_ADDR_PARAM_STRIDE_X:        reg_param_stride_x        <= s_wb_dat_i;
                REG_ADDR_PARAM_STRIDE_Y:        reg_param_stride_y        <= s_wb_dat_i;
                REG_ADDR_PARAM_NEARESTNEIGHBOR: reg_param_nearestneighbor <= s_wb_dat_i;
                REG_ADDR_PARAM_X_OP:            reg_param_x_op            <= s_wb_dat_i;
                REG_ADDR_PARAM_Y_OP:            reg_param_y_op            <= s_wb_dat_i;
                REG_ADDR_PARAM_BORDER_VALUE:    reg_param_border_value    <= s_wb_dat_i;
                REG_ADDR_PARAM_BGC:             reg_param_bgc             <= s_wb_dat_i;
                endcase
            end
        end
    end
    
    reg     [WB_DAT_WIDTH-1:0]  tmp_wb_dat_o;
    always @* begin
        tmp_wb_dat_o = {WB_DAT_WIDTH{1'b0}};
        case ( s_wb_adr_i )
        REG_ADDR_PARAM_ADDR:                tmp_wb_dat_o = reg_param_addr;
        REG_ADDR_PARAM_WIDTH:               tmp_wb_dat_o = reg_param_width;
        REG_ADDR_PARAM_HEIGHT:              tmp_wb_dat_o = reg_param_height;
        REG_ADDR_PARAM_STRIDE_C:            tmp_wb_dat_o = reg_param_stride_c;
        REG_ADDR_PARAM_STRIDE_X:            tmp_wb_dat_o = reg_param_stride_x;
        REG_ADDR_PARAM_STRIDE_Y:            tmp_wb_dat_o = reg_param_stride_y;
        REG_ADDR_PARAM_NEARESTNEIGHBOR:     tmp_wb_dat_o = reg_param_nearestneighbor;
        REG_ADDR_PARAM_X_OP:                tmp_wb_dat_o = reg_param_x_op;
        REG_ADDR_PARAM_Y_OP:                tmp_wb_dat_o = reg_param_y_op;
        REG_ADDR_PARAM_BORDER_VALUE:        tmp_wb_dat_o = reg_param_border_value;
        REG_ADDR_PARAM_BGC:                 tmp_wb_dat_o = reg_param_bgc;
        endcase
        
        if ( USE_PARAM_CFG_READ ) begin
            case ( s_wb_adr_i )
            REG_ADDR_CFG_SHADER_PARAM_NUM:      tmp_wb_dat_o = SHADER_PARAM_NUM;
            REG_ADDR_CFG_SHADER_PARAM_WIDTH:    tmp_wb_dat_o = SHADER_PARAM_WIDTH;
            REG_ADDR_CFG_SHADER_PARAM_Q:        tmp_wb_dat_o = SHADER_PARAM_Q;
            endcase
        end
    end
    
    assign s_wb_dat_o = tmp_wb_dat_o;
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    // update_param信号の前後ではレジスタ変化が無い前提で非同期受け渡し
    always @(posedge clk ) begin
        if ( update ) begin
            reg_shadow_addr            <= reg_param_addr;
            reg_shadow_width           <= reg_param_width;
            reg_shadow_height          <= reg_param_height;
            reg_shadow_stride_c        <= reg_param_stride_c;
            reg_shadow_stride_x        <= reg_param_stride_x;
            reg_shadow_stride_y        <= reg_param_stride_y;
            reg_shadow_nearestneighbor <= reg_param_nearestneighbor;
            reg_shadow_x_op            <= reg_param_x_op;
            reg_shadow_y_op            <= reg_param_y_op;
            reg_shadow_border_value    <= reg_param_border_value;
            reg_shadow_bgc             <= reg_param_bgc;
        end
    end
    
    
    
    
    // -------------------------------------
    // パースペクティブコレクション
    // -------------------------------------
    
    wire                                        cke;
    
    wire                                        pc_frame_start;
    wire                                        pc_line_end;
    wire                                        pc_polygon_enable;
    wire            [INDEX_WIDTH-1:0]           pc_polygon_index;
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    pc_u_tmp;
    wire    signed  [SHADER_PARAM_WIDTH-1:0]    pc_v_tmp;
    wire                                        pc_valid;
    wire                                        pc_ready;
    
    wire    signed  [SAMPLER2D_X_WIDTH-1:0]     pc_u = (pc_u_tmp >>> (SHADER_PARAM_Q - SAMPLER2D_FRAC_WIDTH - U_PHY_WIDTH));
    wire    signed  [SAMPLER2D_Y_WIDTH-1:0]     pc_v = (pc_v_tmp >>> (SHADER_PARAM_Q - SAMPLER2D_FRAC_WIDTH - V_PHY_WIDTH));
     
    jelly_fixed_matrix_divider
            #(
                .USER_WIDTH                 (3+INDEX_WIDTH),
                
                .NUM                        (SHADER_PARAM_NUM - 1),
                .S_DIVIDEND_INT_WIDTH       (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .S_DIVIDEND_FRAC_WIDTH      (SHADER_PARAM_Q),
                .S_DIVISOR_INT_WIDTH        (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .S_DIVISOR_FRAC_WIDTH       (SHADER_PARAM_Q),
                .M_QUOTIENT_INT_WIDTH       (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .M_QUOTIENT_FRAC_WIDTH      (SHADER_PARAM_Q),
                
                .DIVIDEND_FIXED_INT_WIDTH   (SHADER_PARAM_WIDTH - SHADER_PARAM_Q),
                .DIVIDEND_FIXED_FRAC_WIDTH  (SHADER_PARAM_Q),
                
                .DIVISOR_FLOAT_EXP_WIDTH    (6),
                .DIVISOR_FLOAT_FRAC_WIDTH   (16),
                
                .CLIP                       (1),
                
        //      .D_WIDTH                    (8),    // interpolation table addr bits
        //      .K_WIDTH                    (DIVISOR_FLOAT_FRAC_WIDTH - D_WIDTH),
        //      .GRAD_WIDTH                 (DIVISOR_FLOAT_FRAC_WIDTH),
                .RAM_TYPE                   ("block"),
                
                .MASTER_IN_REGS             (0),
                .MASTER_OUT_REGS            (0),
                
                .DEVICE                     (DEVICE)
            )
        i_fixed_matrix_divider
            (
                .reset                      (reset),
                .clk                        (clk),
                .cke                        (cke),
                
                .s_user                     ({
                                                s_rasterizer_frame_start,
                                                s_rasterizer_line_end,
                                                s_rasterizer_polygon_enable,
                                                s_rasterizer_polygon_index
                                            }),
                .s_dividend                 (s_rasterizer_shader_params[SHADER_PARAM_NUM*SHADER_PARAM_WIDTH-1:SHADER_PARAM_WIDTH]),
                .s_divisor                  (s_rasterizer_shader_params[SHADER_PARAM_WIDTH-1:0]),
                .s_valid                    (s_rasterizer_valid),
                .s_ready                    (), // (s_rasterizer_ready),
                
                .m_user                     ({
                                                pc_frame_start,
                                                pc_line_end,
                                                pc_polygon_enable,
                                                pc_polygon_index
                                            }),
                .m_quotient                 ({pc_v_tmp, pc_u_tmp}),
                .m_valid                    (pc_valid),
                .m_ready                    (1'b1)
            );
    
//  assign cke = !pc_valid || pc_ready;
    
    assign cke                = pc_ready;
    assign s_rasterizer_ready = cke;
    
    
    // -------------------------------------
    //  Texture Sampler
    // -------------------------------------
    
    jelly_texture_stream
            #(
                .IMAGE_X_NUM                    (IMAGE_X_NUM),
                .PARALLEL_NUM                   (PARALLEL_NUM),
                
                .COMPONENT_NUM                  (COMPONENT_NUM),
                .DATA_SIZE                      (DATA_SIZE),
                .DATA_WIDTH                     (DATA_WIDTH),
                .ADDR_WIDTH                     (ADDR_WIDTH),
                .ADDR_X_WIDTH                   (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH                   (ADDR_Y_WIDTH),
                .STRIDE_C_WIDTH                 (STRIDE_C_WIDTH),
                .STRIDE_X_WIDTH                 (STRIDE_X_WIDTH),
                .STRIDE_Y_WIDTH                 (STRIDE_Y_WIDTH),
                
                .USE_BILINEAR                   (USE_BILINEAR),
                .USE_BORDER                     (USE_BORDER),
                
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
                
                .SAMPLER2D_X_INT_WIDTH          (SAMPLER2D_X_INT_WIDTH),
                .SAMPLER2D_X_FRAC_WIDTH         (SAMPLER2D_X_FRAC_WIDTH),
                .SAMPLER2D_Y_INT_WIDTH          (SAMPLER2D_Y_INT_WIDTH),
                .SAMPLER2D_Y_FRAC_WIDTH         (SAMPLER2D_Y_FRAC_WIDTH),
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
                
                .S_AXI4S_TUSER_WIDTH            (1 + S_AXI4S_TUSER_WIDTH),
                .S_AXI4S_TTEXCORDU_WIDTH        (S_AXI4S_TTEXCORDU_WIDTH),
                .S_AXI4S_TTEXCORDV_WIDTH        (S_AXI4S_TTEXCORDV_WIDTH),
                
                .M_AXI4S_TUSER_WIDTH            (1 + M_AXI4S_TUSER_WIDTH),
                .M_AXI4S_TDATA_WIDTH            (M_AXI4S_TDATA_WIDTH),
                
                .M_AXI4_ID_WIDTH                (M_AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH              (M_AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE               (M_AXI4_DATA_SIZE),
                .M_AXI4_DATA_WIDTH              (M_AXI4_DATA_WIDTH),
                .M_AXI4_LEN_WIDTH               (M_AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH               (M_AXI4_QOS_WIDTH),
                .M_AXI4_ARID                    (M_AXI4_ARID),
                .M_AXI4_ARSIZE                  (M_AXI4_ARSIZE),
                .M_AXI4_ARBURST                 (M_AXI4_ARBURST),
                .M_AXI4_ARLOCK                  (M_AXI4_ARLOCK),
                .M_AXI4_ARCACHE                 (M_AXI4_ARCACHE),
                .M_AXI4_ARPROT                  (M_AXI4_ARPROT),
                .M_AXI4_ARQOS                   (M_AXI4_ARQOS),
                .M_AXI4_ARREGION                (M_AXI4_ARREGION),
                .M_AXI4_REGS                    (M_AXI4_REGS),
                
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
                
                .DEVICE                         (DEVICE)
            )
        i_texture_stream
            (
                .reset                          (reset),
                .clk                            (clk),
                .endian                         (endian),
                
                .param_addr                     (reg_shadow_addr),
                .param_width                    (reg_shadow_width),
                .param_height                   (reg_shadow_height),
                .param_stride_c                 (reg_shadow_stride_c),
                .param_stride_x                 (reg_shadow_stride_x),
                .param_stride_y                 (reg_shadow_stride_y),
                .param_nearestneighbor          (reg_shadow_nearestneighbor),
                .param_x_op                     (reg_shadow_x_op),
                .param_y_op                     (reg_shadow_y_op),
                .param_border_value             (reg_shadow_border_value),
                .param_blank_value              (reg_shadow_bgc),
                
                .clear_start                    (1'b0),
                .clear_busy                     (),
                
                .status_l1_idle                 (status_l1_idle),
                .status_l1_stall                (status_l1_stall),
                .status_l1_access               (status_l1_access),
                .status_l1_hit                  (status_l1_hit),
                .status_l1_miss                 (status_l1_miss),
                .status_l1_blank                (status_l1_blank),
                .status_l2_idle                 (status_l2_idle),
                .status_l2_stall                (status_l2_stall),
                .status_l2_access               (status_l2_access),
                .status_l2_hit                  (status_l2_hit),
                .status_l2_miss                 (status_l2_miss),
                .status_l2_blank                (status_l2_blank),

                .s_axi4s_tuser                  ({pc_line_end, pc_frame_start}),
                .s_axi4s_ttexcordu              (pc_u),
                .s_axi4s_ttexcordv              (pc_v),
                .s_axi4s_tstrb                  (pc_polygon_enable),
                .s_axi4s_tvalid                 (pc_valid),
                .s_axi4s_tready                 (pc_ready),
                
                .m_axi4s_tuser                  ({m_axi4s_tlast, m_axi4s_tuser}),
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
    
    
endmodule


`default_nettype wire


// End of file
