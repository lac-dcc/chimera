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



module jelly_texture_stream
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
            
            parameter   USE_BILINEAR                  = 1,
            parameter   USE_BORDER                    = 1,
            
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
            
            parameter   SAMPLER2D_X_INT_WIDTH         = ADDR_X_WIDTH + 2,
            parameter   SAMPLER2D_X_FRAC_WIDTH        = 4,
            parameter   SAMPLER2D_Y_INT_WIDTH         = ADDR_Y_WIDTH + 2,
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
            
            parameter   DEVICE                        = "7SERIES",  // "RTL"
                        
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
            
            // AXI4-Stream
            input   wire    [S_AXI4S_TUSER_BITS-1:0]                        s_axi4s_tuser,
            input   wire    [S_AXI4S_TTEXCORDU_WIDTH-1:0]                   s_axi4s_ttexcordu,
            input   wire    [S_AXI4S_TTEXCORDV_WIDTH-1:0]                   s_axi4s_ttexcordv,
            input   wire                                                    s_axi4s_tstrb,
            input   wire                                                    s_axi4s_tvalid,
            output  wire                                                    s_axi4s_tready,
            
            output  wire    [M_AXI4S_TUSER_BITS-1:0]                        m_axi4s_tuser,
            output  wire    [M_AXI4S_TDATA_WIDTH-1:0]                       m_axi4s_tdata,
            output  wire                                                    m_axi4s_tstrb,
            output  wire                                                    m_axi4s_tvalid,
            input   wire                                                    m_axi4s_tready,
            
            
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
    
    localparam  SAMPLER1D_NUM = 0;
    localparam  SAMPLER2D_NUM = PARALLEL_NUM;
    localparam  SAMPLER3D_NUM = 0;
    
    localparam  UNIT_X_NUM    = (IMAGE_X_NUM + (PARALLEL_NUM-1)) / PARALLEL_NUM;
    
    
    genvar      i;
    
    
    
    // 2D sampler's signal
    
    
    // scatter
    localparam  SAMPLER2D_USER_WIDTH = S_AXI4S_TUSER_WIDTH;
    localparam  SAMPLER2D_USER_BITS  = S_AXI4S_TUSER_BITS;
    localparam  SCATTER_DATA_WIDTH   = S_AXI4S_TUSER_WIDTH + 1 + S_AXI4S_TTEXCORDU_WIDTH + S_AXI4S_TTEXCORDV_WIDTH;
    
    wire    [SCATTER_DATA_WIDTH-1:0]                    s_axi4s_tpacket = {s_axi4s_tuser, s_axi4s_tstrb, s_axi4s_ttexcordv, s_axi4s_ttexcordu};
    
    wire    [SAMPLER2D_NUM*SAMPLER2D_USER_BITS-1:0]     s_sampler2d_user;
    wire    [SAMPLER2D_NUM-1:0]                         s_sampler2d_strb;
    wire    [SAMPLER2D_NUM*SAMPLER2D_X_WIDTH-1:0]       s_sampler2d_x;
    wire    [SAMPLER2D_NUM*SAMPLER2D_Y_WIDTH-1:0]       s_sampler2d_y;
    wire    [SAMPLER2D_NUM-1:0]                         s_sampler2d_valid;
    wire    [SAMPLER2D_NUM-1:0]                         s_sampler2d_ready;
    
    wire    [SAMPLER2D_NUM*SCATTER_DATA_WIDTH-1:0]      s_samoler2d_packet;
    
    generate
    for ( i = 0; i < SAMPLER2D_NUM; i = i+1 ) begin : loop_scatter_packet
        assign {s_sampler2d_user  [i*S_AXI4S_TUSER_BITS +: S_AXI4S_TUSER_BITS],
                s_sampler2d_strb  [i],
                s_sampler2d_y     [i*SAMPLER2D_Y_WIDTH  +: SAMPLER2D_Y_WIDTH],
                s_sampler2d_x     [i*SAMPLER2D_X_WIDTH  +: SAMPLER2D_X_WIDTH]}
                 = s_samoler2d_packet[i*SCATTER_DATA_WIDTH +: SCATTER_DATA_WIDTH];
    end
    endgenerate
    
    
    jelly_data_scatter
            #(
                .PORT_NUM                       (SAMPLER2D_NUM),
                .DATA_WIDTH                     (SCATTER_DATA_WIDTH),
                .LINE_SIZE                      (IMAGE_X_NUM),
                .UNIT_SIZE                      (UNIT_X_NUM),
                .FIFO_PTR_WIDTH                 (SCATTER_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE                  (SCATTER_FIFO_RAM_TYPE),
                .S_REGS                         (SCATTER_S_REGS),
                .M_REGS                         (SCATTER_M_REGS),
                .INTERNAL_REGS                  (SCATTER_INTERNAL_REGS)
            )
        i_data_scatter
            (
                .reset                          (reset),
                .clk                            (clk),
                
                .s_data                         (s_axi4s_tpacket),
                .s_valid                        (s_axi4s_tvalid),
                .s_ready                        (s_axi4s_tready),
                
                .m_data                         (s_samoler2d_packet),
                .m_valid                        (s_sampler2d_valid),
                .m_ready                        (s_sampler2d_ready)
            );
    
    
    // sampler
    wire    [SAMPLER2D_NUM*SAMPLER2D_USER_WIDTH-1:0]        m_sampler2d_user;
    wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_strb;
    wire    [SAMPLER2D_NUM*COMPONENT_NUM*DATA_WIDTH-1:0]    m_sampler2d_data;
    wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_valid;
    wire    [SAMPLER2D_NUM-1:0]                             m_sampler2d_ready;
    
    jelly_texture_sampler
            #(
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
                
                .SAMPLER2D_NUM                  (SAMPLER2D_NUM),
                .SAMPLER2D_USER_WIDTH           (SAMPLER2D_USER_WIDTH),
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
                .SAMPLER2D_USER_BITS            (SAMPLER2D_USER_BITS),
                
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
                
                .L1_CACHE_NUM                   (L1_CACHE_NUM),
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
                .L2_CACHE_NUM                   (L2_CACHE_NUM),
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
                
                .DMA_QUE_FIFO_PTR_WIDTH         (DMA_QUE_FIFO_PTR_WIDTH ),
                .DMA_QUE_FIFO_RAM_TYPE          (DMA_QUE_FIFO_RAM_TYPE),
                .DMA_QUE_FIFO_S_REGS            (DMA_QUE_FIFO_S_REGS),
                .DMA_QUE_FIFO_M_REGS            (DMA_QUE_FIFO_M_REGS),
                .DMA_S_AR_REGS                  (DMA_S_AR_REGS),
                .DMA_S_R_REGS                   (DMA_S_R_REGS),
                
                .DEVICE                         (DEVICE)
            )
        i_texture_sampler
            (
                .reset                          (reset),
                .clk                            (clk),
                .endian                         (endian),
                
                .param_addr                     (param_addr),
                .param_width                    (param_width),
                .param_height                   (param_height),
                .param_stride_c                 (param_stride_c),
                .param_stride_x                 (param_stride_x),
                .param_stride_y                 (param_stride_y),
                
                .param_nearestneighbor          (param_nearestneighbor),
                .param_x_op                     (param_x_op),
                .param_y_op                     (param_y_op),
                .param_border_value             (param_border_value),
                .param_blank_value              (param_blank_value),
                
                .clear_start                    (clear_start),
                .clear_busy                     (clear_busy),
                
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
                
                .s_sampler2d_user               (s_sampler2d_user),
                .s_sampler2d_x                  (s_sampler2d_x),
                .s_sampler2d_y                  (s_sampler2d_y),
                .s_sampler2d_strb               (s_sampler2d_strb),
                .s_sampler2d_valid              (s_sampler2d_valid),
                .s_sampler2d_ready              (s_sampler2d_ready),
                
                .m_sampler2d_user               (m_sampler2d_user),
                .m_sampler2d_data               (m_sampler2d_data),
                .m_sampler2d_strb               (m_sampler2d_strb),
                .m_sampler2d_valid              (m_sampler2d_valid),
                .m_sampler2d_ready              (m_sampler2d_ready),
                
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
    
    
    // gather
    localparam  GATHER_DATA_WIDTH = SAMPLER2D_USER_WIDTH + 1 + M_AXI4S_TDATA_WIDTH;
    
    wire    [SAMPLER2D_NUM*GATHER_DATA_WIDTH-1:0]       m_sampler2d_packet;
    
    generate
    for ( i = 0; i < SAMPLER2D_NUM; i = i+1 ) begin : loop_gather_packet
        assign m_sampler2d_packet[i*GATHER_DATA_WIDTH +: GATHER_DATA_WIDTH]
                = {m_sampler2d_user  [i*S_AXI4S_TUSER_BITS  +: S_AXI4S_TUSER_BITS],
                   m_sampler2d_strb  [i],
                   m_sampler2d_data  [i*M_AXI4S_TDATA_WIDTH +: M_AXI4S_TDATA_WIDTH]};
    end
    endgenerate
    
    wire    [GATHER_DATA_WIDTH-1:0]                     m_axi4s_tpacket;
    
    assign {m_axi4s_tuser, m_axi4s_tstrb, m_axi4s_tdata} = m_axi4s_tpacket;
    
    jelly_data_gather
            #(
                .PORT_NUM           (SAMPLER2D_NUM),
                .DATA_WIDTH         (GATHER_DATA_WIDTH),
                .LINE_SIZE          (IMAGE_X_NUM),
                .UNIT_SIZE          (UNIT_X_NUM),
                .FIFO_PTR_WIDTH     (GATHER_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE      (GATHER_FIFO_RAM_TYPE),
                .S_REGS             (GATHER_S_REGS),
                .M_REGS             (GATHER_M_REGS),
                .INTERNAL_REGS      (GATHER_INTERNAL_REGS)
            )
        i_data_gather
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_data             (m_sampler2d_packet),
                .s_valid            (m_sampler2d_valid),
                .s_ready            (m_sampler2d_ready),
                
                .m_data             (m_axi4s_tpacket),
                .m_valid            (m_axi4s_tvalid),
                .m_ready            (m_axi4s_tready)
            );
    
    
endmodule


`default_nettype wire


// end of file
