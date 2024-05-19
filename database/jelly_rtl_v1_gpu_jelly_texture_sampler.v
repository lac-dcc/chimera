// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_texture_sampler
        #(
            parameter   COMPONENT_NUM                 = 3,
            parameter   DATA_SIZE                     = 0,
            parameter   DATA_WIDTH                    = (8 << DATA_SIZE),
            parameter   ADDR_WIDTH                    = 24,
            parameter   ADDR_X_WIDTH                  = 10,
            parameter   ADDR_Y_WIDTH                  = 9,
            parameter   STRIDE_C_WIDTH                = 14,
            parameter   STRIDE_X_WIDTH                = 14,
            parameter   STRIDE_Y_WIDTH                = 14,
            
            parameter   USE_BILINEAR                  = 1,
            parameter   USE_BORDER                    = 1,
            
            parameter   SAMPLER1D_NUM                 = 0,
            
            parameter   SAMPLER2D_NUM                 = 4,
            parameter   SAMPLER2D_USER_WIDTH          = 0,
            parameter   SAMPLER2D_X_INT_WIDTH         = ADDR_X_WIDTH+1,
            parameter   SAMPLER2D_X_FRAC_WIDTH        = 4,
            parameter   SAMPLER2D_Y_INT_WIDTH         = ADDR_Y_WIDTH+1,
            parameter   SAMPLER2D_Y_FRAC_WIDTH        = 4,
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
            parameter   SAMPLER2D_USER_BITS           = SAMPLER2D_USER_WIDTH > 0 ? SAMPLER2D_USER_WIDTH : 1,
            
            parameter   SAMPLER3D_NUM                 = 0,
            
            
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
            
            parameter   L1_CACHE_NUM                  = SAMPLER1D_NUM + SAMPLER2D_NUM + SAMPLER3D_NUM,
            parameter   L1_USE_LOOK_AHEAD             = 0,
            parameter   L1_BLK_X_SIZE                 = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_BLK_Y_SIZE                 = 2,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L1_WAY_NUM                    = 4,
            parameter   L1_TAG_ADDR_WIDTH             = 6,
            parameter   L1_TAG_RAM_TYPE               = "distributed",
            parameter   L1_TAG_ALGORITHM              = "NORMAL", // "TWIST",
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
            parameter   L2_CACHE_NUM                  = (1 << L2_PARALLEL_SIZE),
            parameter   L2_USE_LOOK_AHEAD             = 0,
            parameter   L2_BLK_X_SIZE                 = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_BLK_Y_SIZE                 = 3,  // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   L2_WAY_NUM                    = 4,
            parameter   L2_TAG_ADDR_WIDTH             = 6,
            parameter   L2_TAG_RAM_TYPE               = "distributed",
            parameter   L2_TAG_ALGORITHM              = "NORMAL", // L2_PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
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
            
            parameter   DEVICE                        = "RTL" // "7SERIES"
        )
        (
            // system
            input   wire                                                    reset,
            input   wire                                                    clk,
            input   wire                                                    endian,
            
            // parameter
            input   wire    [M_AXI4_ADDR_WIDTH-1:0]                         param_addr,
            input   wire    [ADDR_X_WIDTH-1:0]                              param_width,
            input   wire    [ADDR_Y_WIDTH-1:0]                              param_height,
            input   wire    [STRIDE_C_WIDTH-1:0]                            param_stride_c,
            input   wire    [STRIDE_X_WIDTH-1:0]                            param_stride_x,
            input   wire    [STRIDE_Y_WIDTH-1:0]                            param_stride_y,
            
            input   wire                                                    param_nearestneighbor,
            input   wire    [2:0]                                           param_x_op,
            input   wire    [2:0]                                           param_y_op,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]                  param_border_value,
            input   wire    [COMPONENT_NUM*DATA_WIDTH-1:0]                  param_blank_value,
            
            // control
            input   wire                                                    clear_start,
            output  wire                                                    clear_busy,
            
            // status
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
            
            // 2D sampler
            input   wire    [SAMPLER2D_NUM*SAMPLER2D_USER_BITS-1:0]         s_sampler2d_user,
            input   wire    [SAMPLER2D_NUM*SAMPLER2D_X_WIDTH-1:0]           s_sampler2d_x,
            input   wire    [SAMPLER2D_NUM*SAMPLER2D_Y_WIDTH-1:0]           s_sampler2d_y,
            input   wire    [SAMPLER2D_NUM-1:0]                             s_sampler2d_strb,
            input   wire    [SAMPLER2D_NUM-1:0]                             s_sampler2d_valid,
            output  wire    [SAMPLER2D_NUM-1:0]                             s_sampler2d_ready,
            
            output  wire    [SAMPLER2D_NUM*SAMPLER2D_USER_BITS-1:0]         m_sampler2d_user,
            output  wire    [SAMPLER2D_NUM*COMPONENT_NUM*DATA_WIDTH-1:0]    m_sampler2d_data,
            output  wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_strb,
            output  wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_valid,
            input   wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_ready,
            
            
            // AXI4 read (master)
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
    
    genvar      i;
    
    // -------------------------------------------------
    //  1D sampler
    // -------------------------------------------------
    
    // 1Dというか補間無しアクセス？
    // そのうち必要になったら考える
    
    
    
    // -------------------------------------------------
    //  2D sampler
    // -------------------------------------------------
    
    localparam  BILINEAR_USER_WIDTH    = USE_BILINEAR ? SAMPLER2D_COEFF_WIDTH : SAMPLER2D_USER_BITS;
    localparam  SAMPLER2D_PACKET_WIDTH = 1 + BILINEAR_USER_WIDTH;
    
    wire    [SAMPLER2D_NUM*SAMPLER2D_PACKET_WIDTH-1:0]      sampler2d_arpacket;
    wire    [SAMPLER2D_NUM*BILINEAR_USER_WIDTH-1:0]         sampler2d_aruser;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_arborder;
    wire    [SAMPLER2D_NUM*ADDR_X_WIDTH-1:0]                sampler2d_araddrx;
    wire    [SAMPLER2D_NUM*ADDR_Y_WIDTH-1:0]                sampler2d_araddry;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_arstrb;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_arvalid;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_arready;
    
    wire    [SAMPLER2D_NUM*SAMPLER2D_PACKET_WIDTH-1:0]      sampler2d_rpacket;
    wire    [SAMPLER2D_NUM*BILINEAR_USER_WIDTH-1:0]         sampler2d_ruser;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_rborder;
    wire    [SAMPLER2D_NUM*COMPONENT_NUM*DATA_WIDTH-1:0]    sampler2d_rdata;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_rstrb;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_rvalid;
    wire    [SAMPLER2D_NUM-1:0]                             sampler2d_rready;
    
    generate
    for ( i = 0; i < SAMPLER2D_NUM; i = i+1 ) begin : loop_2d
        wire    [BILINEAR_USER_WIDTH-1:0]       bilinear_aruser;
        wire    [SAMPLER2D_X_INT_WIDTH-1:0]     bilinear_araddrx;
        wire    [SAMPLER2D_Y_INT_WIDTH-1:0]     bilinear_araddry;
        wire                                    bilinear_arstrb;
        wire                                    bilinear_arvalid;
        wire                                    bilinear_arready;
        
        wire    [BILINEAR_USER_WIDTH-1:0]       bilinear_ruser;
        wire    [COMPONENT_NUM*DATA_WIDTH-1:0]  bilinear_rdata;
        wire                                    bilinear_rstrb;
        wire                                    bilinear_rvalid;
        wire                                    bilinear_rready;
        
        if ( USE_BILINEAR ) begin : blk_bilinear
            
            jelly_texture_bilinear_unit
                    #(
                        .COMPONENT_NUM          (COMPONENT_NUM),
                        .DATA_WIDTH             (DATA_WIDTH),
                        .USER_WIDTH             (SAMPLER2D_USER_WIDTH),
                        .X_INT_WIDTH            (SAMPLER2D_X_INT_WIDTH),
                        .X_FRAC_WIDTH           (SAMPLER2D_X_FRAC_WIDTH),
                        .Y_INT_WIDTH            (SAMPLER2D_Y_INT_WIDTH),
                        .Y_FRAC_WIDTH           (SAMPLER2D_Y_FRAC_WIDTH),
                        .COEFF_INT_WIDTH        (SAMPLER2D_COEFF_INT_WIDTH),
                        .COEFF_FRAC_WIDTH       (SAMPLER2D_COEFF_FRAC_WIDTH),
                        .S_REGS                 (SAMPLER2D_S_REGS),
                        .M_REGS                 (SAMPLER2D_M_REGS),
                        .USER_FIFO_PTR_WIDTH    (SAMPLER2D_USER_FIFO_PTR_WIDTH),
                        .USER_FIFO_RAM_TYPE     (SAMPLER2D_USER_FIFO_RAM_TYPE),
                        .USER_FIFO_M_REGS       (SAMPLER2D_USER_FIFO_M_REGS),
                        .DEVICE                 (DEVICE)
                    )
                i_texture_bilinear_unit
                    (
                        .reset                  (reset),
                        .clk                    (clk),
                        .cke                    (1'b1),
                        
                        .param_nearestneighbor  (param_nearestneighbor),
                        .param_blank_value      (param_blank_value),
                        
                        .s_user                 (s_sampler2d_user  [i*SAMPLER2D_USER_BITS      +: SAMPLER2D_USER_BITS]),
                        .s_x                    (s_sampler2d_x     [i*SAMPLER2D_X_WIDTH        +: SAMPLER2D_X_WIDTH]),
                        .s_y                    (s_sampler2d_y     [i*SAMPLER2D_Y_WIDTH        +: SAMPLER2D_Y_WIDTH]),
                        .s_strb                 (s_sampler2d_strb  [i]),
                        .s_valid                (s_sampler2d_valid [i]),
                        .s_ready                (s_sampler2d_ready [i]),
                        
                        .m_user                 (m_sampler2d_user  [i*SAMPLER2D_USER_BITS      +: SAMPLER2D_USER_BITS]),
                        .m_data                 (m_sampler2d_data  [i*COMPONENT_NUM*DATA_WIDTH +: COMPONENT_NUM*DATA_WIDTH]),
                        .m_strb                 (m_sampler2d_strb  [i]),
                        .m_valid                (m_sampler2d_valid [i]),
                        .m_ready                (m_sampler2d_ready [i]),
                        
                        .m_mem_arcoeff          (bilinear_aruser),
                        .m_mem_araddrx          (bilinear_araddrx),
                        .m_mem_araddry          (bilinear_araddry),
                        .m_mem_arstrb           (bilinear_arstrb),
                        .m_mem_arvalid          (bilinear_arvalid),
                        .m_mem_arready          (bilinear_arready),
                        .m_mem_rcoeff           (bilinear_ruser),
                        .m_mem_rdata            (bilinear_rdata),
                        .m_mem_rstrb            (bilinear_rstrb),
                        .m_mem_rvalid           (bilinear_rvalid),
                        .m_mem_rready           (bilinear_rready)
                    );
            /*
            jelly_texture_bilinear
                    #(
                        .COMPONENT_NUM          (COMPONENT_NUM),
                        .DATA_WIDTH             (DATA_WIDTH),
                        .USER_WIDTH             (SAMPLER2D_USER_WIDTH),
                        .X_INT_WIDTH            (SAMPLER2D_X_INT_WIDTH),
                        .X_FRAC_WIDTH           (SAMPLER2D_X_FRAC_WIDTH),
                        .Y_INT_WIDTH            (SAMPLER2D_Y_INT_WIDTH),
                        .Y_FRAC_WIDTH           (SAMPLER2D_Y_FRAC_WIDTH),
                        .COEFF_INT_WIDTH        (SAMPLER2D_COEFF_INT_WIDTH),
                        .COEFF_FRAC_WIDTH       (SAMPLER2D_COEFF_FRAC_WIDTH),
                        .S_REGS                 (SAMPLER2D_S_REGS),
                        .M_REGS                 (SAMPLER2D_M_REGS),
                        .USER_FIFO_PTR_WIDTH    (SAMPLER2D_USER_FIFO_PTR_WIDTH),
                        .USER_FIFO_RAM_TYPE     (SAMPLER2D_USER_FIFO_RAM_TYPE),
                        .USER_FIFO_M_REGS       (SAMPLER2D_USER_FIFO_M_REGS),
                        .DEVICE                 (DEVICE)
                    )
                i_texture_bilinear
                    (
                        .reset                  (reset),
                        .clk                    (clk),
                        .cke                    (1'b1),
                        
                        .param_nearestneighbor  (param_nearestneighbor),
                        .param_blank_value      (param_blank_value),
                        
                        .s_user                 (s_sampler2d_user  [i*SAMPLER2D_USER_BITS      +: SAMPLER2D_USER_BITS]),
                        .s_x                    (s_sampler2d_x     [i*SAMPLER2D_X_WIDTH        +: SAMPLER2D_X_WIDTH]),
                        .s_y                    (s_sampler2d_y     [i*SAMPLER2D_Y_WIDTH        +: SAMPLER2D_Y_WIDTH]),
                        .s_strb                 (s_sampler2d_strb  [i]),
                        .s_valid                (s_sampler2d_valid [i]),
                        .s_ready                (s_sampler2d_ready [i]),
                        .m_user                 (m_sampler2d_user  [i*SAMPLER2D_USER_BITS      +: SAMPLER2D_USER_BITS]),
                        
                        .m_data                 (m_sampler2d_data  [i*COMPONENT_NUM*DATA_WIDTH +: COMPONENT_NUM*DATA_WIDTH]),
                        .m_strb                 (m_sampler2d_strb  [i]),
                        .m_valid                (m_sampler2d_valid [i]),
                        .m_ready                (m_sampler2d_ready [i]),
                        
                        .m_mem_araddrx          (bilinear_araddrx),
                        .m_mem_araddry          (bilinear_araddry),
                        .m_mem_arstrb           (bilinear_arstrb),
                        .m_mem_arvalid          (bilinear_arvalid),
                        .m_mem_arready          (bilinear_arready),
                        .m_mem_rdata            (bilinear_rdata),
                        .m_mem_rstrb            (bilinear_rstrb),
                        .m_mem_rvalid           (bilinear_rvalid),
                        .m_mem_rready           (bilinear_rready)
                    );
            */
        end
        else begin : blk_nearestneighbor
            wire    signed  [SAMPLER2D_X_WIDTH-1:0] tmp_x = s_sampler2d_x[i*SAMPLER2D_X_WIDTH +: SAMPLER2D_X_WIDTH] + ((1 << SAMPLER2D_X_FRAC_WIDTH) >> 1);
            wire    signed  [SAMPLER2D_Y_WIDTH-1:0] tmp_y = s_sampler2d_y[i*SAMPLER2D_Y_WIDTH +: SAMPLER2D_Y_WIDTH] + ((1 << SAMPLER2D_Y_FRAC_WIDTH) >> 1);
            
            assign bilinear_aruser   = s_sampler2d_user[i*SAMPLER2D_USER_BITS +: SAMPLER2D_USER_BITS];
            assign bilinear_araddrx  = (tmp_x >>> SAMPLER2D_X_FRAC_WIDTH);
            assign bilinear_araddry  = (tmp_y >>> SAMPLER2D_Y_FRAC_WIDTH);
            assign bilinear_arstrb   = s_sampler2d_strb  [i];
            assign bilinear_arvalid  = s_sampler2d_valid [i];
            
            assign s_sampler2d_ready[i] = bilinear_arready;
            
            assign m_sampler2d_user  [i*SAMPLER2D_USER_BITS      +: SAMPLER2D_USER_BITS]      = bilinear_ruser;
            assign m_sampler2d_data  [i*COMPONENT_NUM*DATA_WIDTH +: COMPONENT_NUM*DATA_WIDTH] = bilinear_rstrb ? bilinear_rdata : param_blank_value;
            assign m_sampler2d_strb  [i]                                                      = bilinear_rstrb;
            assign m_sampler2d_valid [i]                                                      = bilinear_rvalid;
            
            assign bilinear_rready = m_sampler2d_ready[i];
        end
        
        if ( USE_BORDER ) begin : blk_border
            jelly_texture_border_unit
                    #(
                        .USER_WIDTH         (BILINEAR_USER_WIDTH),
                        .DATA_WIDTH         (COMPONENT_NUM*DATA_WIDTH),
                        .ADDR_X_WIDTH       (ADDR_X_WIDTH),
                        .ADDR_Y_WIDTH       (ADDR_Y_WIDTH),
                        .X_WIDTH            (SAMPLER2D_X_INT_WIDTH),
                        .Y_WIDTH            (SAMPLER2D_Y_INT_WIDTH),
                        .M_REGS             (0)
                    )
                i_texture_border_unit
                    (
                        .reset              (reset),
                        .clk                (clk),
                        .cke                (1'b1),
                        
                        .param_width        (param_width),
                        .param_height       (param_height),
                        .param_x_op         (param_x_op),
                        .param_y_op         (param_y_op),
                        .param_border_value (param_border_value),
                        
                        .s_aruser           (bilinear_aruser),
                        .s_arx              (bilinear_araddrx),
                        .s_ary              (bilinear_araddry),
                        .s_arstrb           (bilinear_arstrb),
                        .s_arvalid          (bilinear_arvalid),
                        .s_arready          (bilinear_arready),
                        .s_ruser            (bilinear_ruser),
                        .s_rborder          (),
                        .s_rdata            (bilinear_rdata),
                        .s_rstrb            (bilinear_rstrb),
                        .s_rvalid           (bilinear_rvalid),
                        .s_rready           (bilinear_rready),
                        
                        .m_aruser           (sampler2d_aruser  [i*BILINEAR_USER_WIDTH      +: BILINEAR_USER_WIDTH]),
                        .m_arborder         (sampler2d_arborder[i]),
                        .m_araddrx          (sampler2d_araddrx [i*ADDR_X_WIDTH             +: ADDR_X_WIDTH]),
                        .m_araddry          (sampler2d_araddry [i*ADDR_Y_WIDTH             +: ADDR_Y_WIDTH]),
                        .m_arstrb           (sampler2d_arstrb  [i]),
                        .m_arvalid          (sampler2d_arvalid [i]),
                        .m_arready          (sampler2d_arready [i]),
                        .m_ruser            (sampler2d_ruser   [i*BILINEAR_USER_WIDTH      +: BILINEAR_USER_WIDTH]),
                        .m_rborder          (sampler2d_rborder [i]),
                        .m_rdata            (sampler2d_rdata   [i*COMPONENT_NUM*DATA_WIDTH +: COMPONENT_NUM*DATA_WIDTH]),
                        .m_rstrb            (sampler2d_rstrb   [i]),
                        .m_rvalid           (sampler2d_rvalid  [i]),
                        .m_rready           (sampler2d_rready  [i])
                    );
        end
        else begin : blk_no_border
            assign sampler2d_aruser  [i*BILINEAR_USER_WIDTH      +: BILINEAR_USER_WIDTH] = bilinear_aruser;
            assign sampler2d_arborder[i]                                                 = 1'b0;
            assign sampler2d_araddrx [i*ADDR_X_WIDTH             +: ADDR_X_WIDTH]        = bilinear_araddrx;
            assign sampler2d_araddry [i*ADDR_Y_WIDTH             +: ADDR_Y_WIDTH]        = bilinear_araddry;
            assign sampler2d_arstrb  [i]                                                 = bilinear_arstrb;
            assign sampler2d_arvalid [i]                                                 = bilinear_arvalid;
            
            assign bilinear_arready = sampler2d_arready[i];
            
            
            assign bilinear_ruser  = sampler2d_ruser [i*BILINEAR_USER_WIDTH      +: BILINEAR_USER_WIDTH];
            assign bilinear_rdata  = sampler2d_rdata [i*COMPONENT_NUM*DATA_WIDTH +: COMPONENT_NUM*DATA_WIDTH];
            assign bilinear_rstrb  = sampler2d_rstrb [i];
            assign bilinear_rvalid = sampler2d_rvalid[i];
            
            assign sampler2d_rready[i] = bilinear_rready;
        end
        
        assign sampler2d_arpacket[i*SAMPLER2D_PACKET_WIDTH +: SAMPLER2D_PACKET_WIDTH]
                    = {sampler2d_arborder[i],
                       sampler2d_aruser  [i*BILINEAR_USER_WIDTH +: BILINEAR_USER_WIDTH]};
        
        assign {sampler2d_rborder[i],
                sampler2d_ruser  [i*BILINEAR_USER_WIDTH +: BILINEAR_USER_WIDTH]}
                    = sampler2d_rpacket[i*SAMPLER2D_PACKET_WIDTH +: SAMPLER2D_PACKET_WIDTH];
    end
    endgenerate
    
    
    // -------------------------------------------------
    //  3D sampler
    // -------------------------------------------------
    
    // ミップマップ用トリリニア補間予定地
    // 作る日くるのか？
    
    
    
    
    // -------------------------------------------------
    //  Texture cache
    // -------------------------------------------------
    
    jelly_texture_cache_core
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_SIZE    (DATA_SIZE),
                
                .USER_WIDTH             (SAMPLER2D_PACKET_WIDTH),
                .USE_S_RREADY           (1),            // 0: s_rready is always 1'b1.   1: handshake mode.
                
                .ADDR_WIDTH             (ADDR_WIDTH),
                .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                .STRIDE_C_WIDTH         (STRIDE_C_WIDTH),
                .STRIDE_X_WIDTH         (STRIDE_X_WIDTH),
                .STRIDE_Y_WIDTH         (STRIDE_Y_WIDTH),
                
                .M_AXI4_ID_WIDTH        (M_AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH      (M_AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE       (M_AXI4_DATA_SIZE),
                .M_AXI4_DATA_WIDTH      (M_AXI4_DATA_WIDTH),
                .M_AXI4_LEN_WIDTH       (M_AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH       (M_AXI4_QOS_WIDTH),
                .M_AXI4_ARID            (M_AXI4_ARID),
                .M_AXI4_ARSIZE          (M_AXI4_ARSIZE),
                .M_AXI4_ARBURST         (M_AXI4_ARBURST),
                .M_AXI4_ARLOCK          (M_AXI4_ARLOCK),
                .M_AXI4_ARCACHE         (M_AXI4_ARCACHE),
                .M_AXI4_ARPROT          (M_AXI4_ARPROT),
                .M_AXI4_ARQOS           (M_AXI4_ARQOS),
                .M_AXI4_ARREGION        (M_AXI4_ARREGION),
                .M_AXI4_REGS            (M_AXI4_REGS),
                
                .L1_CACHE_NUM           (L1_CACHE_NUM),
                .L1_USE_LOOK_AHEAD      (L1_USE_LOOK_AHEAD),
                .L1_BLK_X_SIZE          (L1_BLK_X_SIZE),
                .L1_BLK_Y_SIZE          (L1_BLK_Y_SIZE),
                .L1_WAY_NUM             (L1_WAY_NUM),
                .L1_TAG_ADDR_WIDTH      (L1_TAG_ADDR_WIDTH),
                .L1_TAG_RAM_TYPE        (L1_TAG_RAM_TYPE),
                .L1_TAG_ALGORITHM       (L1_TAG_ALGORITHM),
                .L1_TAG_M_SLAVE_REGS    (L1_TAG_M_SLAVE_REGS),
                .L1_TAG_M_MASTER_REGS   (L1_TAG_M_MASTER_REGS),
                .L1_MEM_RAM_TYPE        (L1_MEM_RAM_TYPE),
                .L1_DATA_SIZE           (L1_DATA_SIZE),
                .L1_QUE_FIFO_PTR_WIDTH  (L1_QUE_FIFO_PTR_WIDTH),
                .L1_QUE_FIFO_RAM_TYPE   (L1_QUE_FIFO_RAM_TYPE),
                .L1_QUE_FIFO_S_REGS     (L1_QUE_FIFO_S_REGS),
                .L1_QUE_FIFO_M_REGS     (L1_QUE_FIFO_M_REGS),
                .L1_AR_FIFO_PTR_WIDTH   (L1_AR_FIFO_PTR_WIDTH),
                .L1_AR_FIFO_RAM_TYPE    (L1_AR_FIFO_RAM_TYPE),
                .L1_AR_FIFO_S_REGS      (L1_AR_FIFO_S_REGS),
                .L1_AR_FIFO_M_REGS      (L1_AR_FIFO_M_REGS),
                .L1_R_FIFO_PTR_WIDTH    (L1_R_FIFO_PTR_WIDTH),
                .L1_R_FIFO_RAM_TYPE     (L1_R_FIFO_RAM_TYPE),
                .L1_R_FIFO_S_REGS       (L1_R_FIFO_S_REGS),
                .L1_R_FIFO_M_REGS       (L1_R_FIFO_M_REGS),
                .L1_LOG_ENABLE          (L1_LOG_ENABLE),
                .L1_LOG_FILE            (L1_LOG_FILE),
                .L1_LOG_ID              (L1_LOG_ID),
                
                .L2_PARALLEL_SIZE       (L2_PARALLEL_SIZE),
                .L2_USE_LOOK_AHEAD      (L2_USE_LOOK_AHEAD),
                .L2_BLK_X_SIZE          (L2_BLK_X_SIZE),
                .L2_BLK_Y_SIZE          (L2_BLK_Y_SIZE),
                .L2_WAY_NUM             (L2_WAY_NUM),
                .L2_TAG_ADDR_WIDTH      (L2_TAG_ADDR_WIDTH),
                .L2_TAG_RAM_TYPE        (L2_TAG_RAM_TYPE),
                .L2_TAG_ALGORITHM       (L2_TAG_ALGORITHM),
                .L2_TAG_M_SLAVE_REGS    (L2_TAG_M_SLAVE_REGS),
                .L2_TAG_M_MASTER_REGS   (L2_TAG_M_MASTER_REGS),
                .L2_MEM_RAM_TYPE        (L2_MEM_RAM_TYPE),
                .L2_QUE_FIFO_PTR_WIDTH  (L2_QUE_FIFO_PTR_WIDTH),
                .L2_QUE_FIFO_RAM_TYPE   (L2_QUE_FIFO_RAM_TYPE),
                .L2_QUE_FIFO_S_REGS     (L2_QUE_FIFO_S_REGS),
                .L2_QUE_FIFO_M_REGS     (L2_QUE_FIFO_M_REGS),
                .L2_AR_FIFO_PTR_WIDTH   (L2_AR_FIFO_PTR_WIDTH),
                .L2_AR_FIFO_RAM_TYPE    (L2_AR_FIFO_RAM_TYPE),
                .L2_AR_FIFO_S_REGS      (L2_AR_FIFO_S_REGS),
                .L2_AR_FIFO_M_REGS      (L2_AR_FIFO_M_REGS),
                .L2_R_FIFO_PTR_WIDTH    (L2_R_FIFO_PTR_WIDTH),
                .L2_R_FIFO_RAM_TYPE     (L2_R_FIFO_RAM_TYPE),
                .L2_R_FIFO_S_REGS       (L2_R_FIFO_S_REGS),
                .L2_R_FIFO_M_REGS       (L2_R_FIFO_M_REGS),
                .L2_LOG_ENABLE          (L2_LOG_ENABLE),
                .L2_LOG_FILE            (L2_LOG_FILE),
                .L2_LOG_ID              (L2_LOG_ID),
                
                .DMA_QUE_FIFO_PTR_WIDTH (DMA_QUE_FIFO_PTR_WIDTH),
                .DMA_QUE_FIFO_RAM_TYPE  (DMA_QUE_FIFO_RAM_TYPE),
                .DMA_QUE_FIFO_S_REGS    (DMA_QUE_FIFO_S_REGS),
                .DMA_QUE_FIFO_M_REGS    (DMA_QUE_FIFO_M_REGS),
                .DMA_S_AR_REGS          (DMA_S_AR_REGS),
                .DMA_S_R_REGS           (DMA_S_R_REGS)
            )
        i_texture_cache_core
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (endian),
                
                .param_addr             (param_addr),
                .param_stride_c         (param_stride_c),
                .param_stride_x         (param_stride_x),
                .param_stride_y         (param_stride_y),
                .param_blank_value      (param_blank_value),
                
                .clear_start            (clear_start),
                .clear_busy             (clear_busy),
                
                .status_l1_idle         (status_l1_idle),
                .status_l1_stall        (status_l1_stall),
                .status_l1_access       (status_l1_access),
                .status_l1_hit          (status_l1_hit),
                .status_l1_miss         (status_l1_miss),
                .status_l1_blank        (status_l1_blank),
                .status_l2_idle         (status_l2_idle),
                .status_l2_stall        (status_l2_stall),
                .status_l2_access       (status_l2_access),
                .status_l2_hit          (status_l2_hit),
                .status_l2_miss         (status_l2_miss),
                .status_l2_blank        (status_l2_blank),
                
                .s_aruser               (sampler2d_arpacket),
                .s_araddrx              (sampler2d_araddrx),
                .s_araddry              (sampler2d_araddry),
                .s_arstrb               (sampler2d_arstrb),
                .s_arvalid              (sampler2d_arvalid),
                .s_arready              (sampler2d_arready),
                .s_ruser                (sampler2d_rpacket),
                .s_rdata                (sampler2d_rdata),
                .s_rstrb                (sampler2d_rstrb),
                .s_rvalid               (sampler2d_rvalid),
                .s_rready               (sampler2d_rready),
                
                .m_axi4_arid            (m_axi4_arid),
                .m_axi4_araddr          (m_axi4_araddr),
                .m_axi4_arlen           (m_axi4_arlen),
                .m_axi4_arsize          (m_axi4_arsize),
                .m_axi4_arburst         (m_axi4_arburst),
                .m_axi4_arlock          (m_axi4_arlock),
                .m_axi4_arcache         (m_axi4_arcache),
                .m_axi4_arprot          (m_axi4_arprot),
                .m_axi4_arqos           (m_axi4_arqos),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arvalid         (m_axi4_arvalid),
                .m_axi4_arready         (m_axi4_arready),
                .m_axi4_rid             (m_axi4_rid),
                .m_axi4_rdata           (m_axi4_rdata),
                .m_axi4_rresp           (m_axi4_rresp),
                .m_axi4_rlast           (m_axi4_rlast),
                .m_axi4_rvalid          (m_axi4_rvalid),
                .m_axi4_rready          (m_axi4_rready)
            );
    
    
endmodule


`default_nettype wire


// end of file
