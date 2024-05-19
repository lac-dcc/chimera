// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_gpu_texturemap();
    localparam RATE    = 10.0;
    localparam WB_RATE = 33.3;
    
    
    initial begin
        $dumpfile("tb_gpu_texturemap.vcd");
        $dumpvars(1, tb_gpu_texturemap);
    end
    
    reg     clk = 1'b1;
    always #(RATE/2.0)  clk = ~clk;
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)   wb_clk = ~wb_clk;
    
    reg     reset = 1'b1;
    always #(RATE*100)  reset = 1'b0;
    
    parameter X_NUM = 640;
    parameter Y_NUM = 480;
    parameter U_NUM = 640;
    parameter V_NUM = 480;
    
    
    
    
    // parameter
    parameter   COMPONENT_NUM                     = 3;
    parameter   DATA_SIZE                         = 0;
    parameter   DATA_WIDTH                        = (8 << DATA_SIZE);
    
    parameter   WB_ADR_WIDTH                      = 16;
    parameter   WB_DAT_WIDTH                      = 32;
    parameter   WB_SEL_WIDTH                      = (WB_DAT_WIDTH / 8);
    
    parameter   AXI4S_TUSER_WIDTH                 = 1;
    parameter   AXI4S_TDATA_WIDTH                 = COMPONENT_NUM*DATA_WIDTH;

    parameter   AXI4_ID_WIDTH                     = 6;
    parameter   AXI4_ADDR_WIDTH                   = 32;
    parameter   AXI4_DATA_SIZE                    = 3;  // 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
    parameter   AXI4_DATA_WIDTH                   = (8 << AXI4_DATA_SIZE);
    parameter   AXI4_LEN_WIDTH                    = 8;
    parameter   AXI4_QOS_WIDTH                    = 4;
    parameter   AXI4_ARID                         = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_ARSIZE                       = AXI4_DATA_SIZE;
    parameter   AXI4_ARBURST                      = 2'b01;
    parameter   AXI4_ARLOCK                       = 1'b0;
    parameter   AXI4_ARCACHE                      = 4'b0001;
    parameter   AXI4_ARPROT                       = 3'b000;
    parameter   AXI4_ARQOS                        = 0;
    parameter   AXI4_ARREGION                     = 4'b0000;
    parameter   AXI4_REGS                         = 1;
    
    parameter   IMAGE_X_NUM                       = 640;
    parameter   X_WIDTH                           = 12;
    parameter   Y_WIDTH                           = 12;
    parameter   U_PHY_WIDTH                       = 9; // 10;
    parameter   V_PHY_WIDTH                       = 9; // 10;
    parameter   U_WIDTH                           = U_PHY_WIDTH + 2;
    parameter   V_WIDTH                           = V_PHY_WIDTH + 2;
    
    parameter   CORE_ADDR_WIDTH                   = 14;
    parameter   PARAMS_ADDR_WIDTH                 = 12;
    parameter   BANK_ADDR_WIDTH                   = 10;
    
    parameter   BANK_NUM                          = 2;
    parameter   EDGE_NUM                          = 12;
    parameter   POLYGON_NUM                       = 6;
    parameter   SHADER_PARAM_NUM                  = 1 + 2;      // Z + UV
    
    parameter   EDGE_PARAM_WIDTH                  = 32;
    parameter   EDGE_RAM_TYPE                     = "distributed";
    
    parameter   SHADER_PARAM_WIDTH                = 32;
    parameter   SHADER_PARAM_Q                    = 24;
    parameter   SHADER_RAM_TYPE                   = "distributed";
    
    parameter   REGION_PARAM_WIDTH                = EDGE_NUM;
    parameter   REGION_RAM_TYPE                   = "distributed";
    
    parameter   CULLING_ONLY                      = 0;
    parameter   Z_SORT_MIN                        = 0;  // 1で小さい値優先(Z軸奥向き)
    
    parameter   RASTERIZER_INIT_CTL_ENABLE        = 1'b0;
    parameter   RASTERIZER_INIT_CTL_UPDATE        = 1'b0;
    parameter   RASTERIZER_INIT_PARAM_WIDTH       = X_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_HEIGHT      = Y_NUM-1;
    parameter   RASTERIZER_INIT_PARAM_CULLING     = 2'b01;
    parameter   RASTERIZER_INIT_PARAM_BANK        = 0;
    
    parameter   SHADER_INIT_PARAM_ADDR            = 32'h0000_0000;
    parameter   SHADER_INIT_PARAM_WIDTH           = U_NUM;
    parameter   SHADER_INIT_PARAM_HEIGHT          = V_NUM;
    parameter   SHADER_INIT_PARAM_STRIDE_C        = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE);
    parameter   SHADER_INIT_PARAM_STRIDE_X        = (1 << L2_BLK_X_SIZE)*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM;
    parameter   SHADER_INIT_PARAM_STRIDE_Y        = U_NUM*(1 << L2_BLK_Y_SIZE)*COMPONENT_NUM;
    parameter   SHADER_INIT_PARAM_NEARESTNEIGHBOR = 0;
    parameter   SHADER_INIT_PARAM_X_OP            = 3'b111;
    parameter   SHADER_INIT_PARAM_Y_OP            = 3'b111;
    parameter   SHADER_INIT_PARAM_BORDER_VALUE    = 24'h000000;
    parameter   SHADER_INIT_PARAM_BGC             = 24'h000000;
    
    
    parameter   TEX_PARALLEL_NUM                  = 4;
    parameter   TEX_ADDR_WIDTH                    = 24;
    parameter   TEX_ADDR_X_WIDTH                  = 10;
    parameter   TEX_ADDR_Y_WIDTH                  = 9;
    parameter   TEX_STRIDE_C_WIDTH                = 14;
    parameter   TEX_STRIDE_X_WIDTH                = 14;
    parameter   TEX_STRIDE_Y_WIDTH                = 14;
    
    parameter   TEX_USE_BILINEAR                  = 1;
    parameter   TEX_USE_BORDER                    = 1;
    
    parameter   SCATTER_FIFO_PTR_WIDTH            = 6;
    parameter   SCATTER_FIFO_RAM_TYPE             = "distributed";
    parameter   SCATTER_S_REGS                    = 1;
    parameter   SCATTER_M_REGS                    = 1;
    parameter   SCATTER_INTERNAL_REGS             = (TEX_PARALLEL_NUM > 32);
    
    parameter   GATHER_FIFO_PTR_WIDTH             = 6;
    parameter   GATHER_FIFO_RAM_TYPE              = "distributed";
    parameter   GATHER_S_REGS                     = 1;
    parameter   GATHER_M_REGS                     = 1;
    parameter   GATHER_INTERNAL_REGS              = (TEX_PARALLEL_NUM > 32);
    
    parameter   SAMPLER2D_INT_WIDTH               = (TEX_ADDR_X_WIDTH > TEX_ADDR_Y_WIDTH ? TEX_ADDR_X_WIDTH : TEX_ADDR_Y_WIDTH) + 2;
    parameter   SAMPLER2D_FRAC_WIDTH              = 4;
    parameter   SAMPLER2D_COEFF_INT_WIDTH         = 1;
    parameter   SAMPLER2D_COEFF_FRAC_WIDTH        = SAMPLER2D_FRAC_WIDTH + SAMPLER2D_FRAC_WIDTH;
    parameter   SAMPLER2D_S_REGS                  = 1;
    parameter   SAMPLER2D_M_REGS                  = 1;
    parameter   SAMPLER2D_USER_FIFO_PTR_WIDTH     = 6;
    parameter   SAMPLER2D_USER_FIFO_RAM_TYPE      = "distributed";
    parameter   SAMPLER2D_USER_FIFO_M_REGS        = 0;
    
    parameter   L1_USE_LOOK_AHEAD                 = 0;
    parameter   L1_BLK_X_SIZE                     = 2;  // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    parameter   L1_BLK_Y_SIZE                     = 2;  // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    parameter   L1_WAY_NUM                        = 4;
    parameter   L1_TAG_ADDR_WIDTH                 = 6;
    parameter   L1_TAG_RAM_TYPE                   = "distributed";
    parameter   L1_TAG_ALGORITHM                  = "TWIST";
    parameter   L1_TAG_M_SLAVE_REGS               = 0;
    parameter   L1_TAG_M_MASTER_REGS              = 0;
    parameter   L1_MEM_RAM_TYPE                   = "block";
    parameter   L1_DATA_SIZE                      = 2;
    parameter   L1_QUE_FIFO_PTR_WIDTH             = L1_USE_LOOK_AHEAD ? 5 : 0;
    parameter   L1_QUE_FIFO_RAM_TYPE              = "distributed";
    parameter   L1_QUE_FIFO_S_REGS                = 0;
    parameter   L1_QUE_FIFO_M_REGS                = 0;
    parameter   L1_AR_FIFO_PTR_WIDTH              = 0;
    parameter   L1_AR_FIFO_RAM_TYPE               = "distributed";
    parameter   L1_AR_FIFO_S_REGS                 = 0;
    parameter   L1_AR_FIFO_M_REGS                 = 0;
    parameter   L1_R_FIFO_PTR_WIDTH               = L1_USE_LOOK_AHEAD ? L1_BLK_Y_SIZE + L1_BLK_X_SIZE - L1_DATA_SIZE : 0;
    parameter   L1_R_FIFO_RAM_TYPE                = "block";
    parameter   L1_R_FIFO_S_REGS                  = 0;
    parameter   L1_R_FIFO_M_REGS                  = 0;
    parameter   L1_LOG_ENABLE                     = 0;
    parameter   L1_LOG_FILE                       = "l1_log.txt";
    parameter   L1_LOG_ID                         = 0;
    
    parameter   L2_PARALLEL_SIZE                  = 2;
    parameter   L2_USE_LOOK_AHEAD                 = 0;
    parameter   L2_BLK_X_SIZE                     = 3;  // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    parameter   L2_BLK_Y_SIZE                     = 3;  // 0:1pixel; 1:2pixel; 2:4pixel; 3:8pixel ...
    parameter   L2_WAY_NUM                        = 4;
    parameter   L2_TAG_ADDR_WIDTH                 = 6;
    parameter   L2_TAG_RAM_TYPE                   = "distributed";
    parameter   L2_TAG_ALGORITHM                  = L2_PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST";
    parameter   L2_TAG_M_SLAVE_REGS               = 0;
    parameter   L2_TAG_M_MASTER_REGS              = 0;
    parameter   L2_MEM_RAM_TYPE                   = "block";
    parameter   L2_QUE_FIFO_PTR_WIDTH             = L2_USE_LOOK_AHEAD ? 5 : 0;
    parameter   L2_QUE_FIFO_RAM_TYPE              = "distributed";
    parameter   L2_QUE_FIFO_S_REGS                = 0;
    parameter   L2_QUE_FIFO_M_REGS                = 0;
    parameter   L2_AR_FIFO_PTR_WIDTH              = 0;
    parameter   L2_AR_FIFO_RAM_TYPE               = "distributed";
    parameter   L2_AR_FIFO_S_REGS                 = 0;
    parameter   L2_AR_FIFO_M_REGS                 = 0;
    parameter   L2_R_FIFO_PTR_WIDTH               = L2_USE_LOOK_AHEAD ? L2_BLK_Y_SIZE + L2_BLK_X_SIZE - AXI4_DATA_SIZE : 0;
    parameter   L2_R_FIFO_RAM_TYPE                = "block";
    parameter   L2_R_FIFO_S_REGS                  = 0;
    parameter   L2_R_FIFO_M_REGS                  = 0;
    parameter   L2_LOG_ENABLE                     = 0;
    parameter   L2_LOG_FILE                       = "l2_log.txt";
    parameter   L2_LOG_ID                         = 0;
    
    parameter   DMA_QUE_FIFO_PTR_WIDTH            = 6;
    parameter   DMA_QUE_FIFO_RAM_TYPE             = "distributed";
    parameter   DMA_QUE_FIFO_S_REGS               = 0;
    parameter   DMA_QUE_FIFO_M_REGS               = 1;
    parameter   DMA_S_AR_REGS                     = 1;
    parameter   DMA_S_R_REGS                      = 1;
    
    parameter   DEVICE                            = "RTL";
    
    // signal
    wire                                endian = 0;
    
    wire                                clear_start = 0;
    wire                                clear_busy;
    
    wire                                s_wb_rst_i = reset;
    wire                                s_wb_clk_i = wb_clk;
    wire    [WB_ADR_WIDTH-1:0]          s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o;
    wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_i;
    wire                                s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]          s_wb_sel_i;
    wire                                s_wb_stb_i;
    wire                                s_wb_ack_o;
    
    wire    [AXI4S_TUSER_WIDTH-1:0]     m_axi4s_tuser;
    wire                                m_axi4s_tlast;
    wire    [AXI4S_TDATA_WIDTH-1:0]     m_axi4s_tdata;
    wire                                m_axi4s_tstrb;
    wire                                m_axi4s_tvalid;
    reg                                 m_axi4s_tready = 1'b1;
    
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid;
    wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen;
    wire    [2:0]                       m_axi4_arsize;
    wire    [1:0]                       m_axi4_arburst;
    wire    [0:0]                       m_axi4_arlock;
    wire    [3:0]                       m_axi4_arcache;
    wire    [2:0]                       m_axi4_arprot;
    wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos;
    wire    [3:0]                       m_axi4_arregion;
    wire                                m_axi4_arvalid;
    wire                                m_axi4_arready;
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid;
    wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata;
    wire    [1:0]                       m_axi4_rresp;
    wire                                m_axi4_rlast;
    wire                                m_axi4_rvalid;
    wire                                m_axi4_rready;
    
    jelly_gpu_texturemap
            #(
                .COMPONENT_NUM                      (COMPONENT_NUM                     ),
                .DATA_SIZE                          (DATA_SIZE                         ),
                .DATA_WIDTH                         (DATA_WIDTH                        ),
                .WB_ADR_WIDTH                       (WB_ADR_WIDTH                      ),
                .WB_DAT_WIDTH                       (WB_DAT_WIDTH                      ),
                .WB_SEL_WIDTH                       (WB_SEL_WIDTH                      ),
                .AXI4S_TUSER_WIDTH                  (AXI4S_TUSER_WIDTH                 ),
                .AXI4S_TDATA_WIDTH                  (AXI4S_TDATA_WIDTH                 ),
                .AXI4_ID_WIDTH                      (AXI4_ID_WIDTH                     ),
                .AXI4_ADDR_WIDTH                    (AXI4_ADDR_WIDTH                   ),
                .AXI4_DATA_SIZE                     (AXI4_DATA_SIZE                    ),
                .AXI4_DATA_WIDTH                    (AXI4_DATA_WIDTH                   ),
                .AXI4_LEN_WIDTH                     (AXI4_LEN_WIDTH                    ),
                .AXI4_QOS_WIDTH                     (AXI4_QOS_WIDTH                    ),
                .AXI4_ARID                          (AXI4_ARID                         ),
                .AXI4_ARSIZE                        (AXI4_ARSIZE                       ),
                .AXI4_ARBURST                       (AXI4_ARBURST                      ),
                .AXI4_ARLOCK                        (AXI4_ARLOCK                       ),
                .AXI4_ARCACHE                       (AXI4_ARCACHE                      ),
                .AXI4_ARPROT                        (AXI4_ARPROT                       ),
                .AXI4_ARQOS                         (AXI4_ARQOS                        ),
                .AXI4_ARREGION                      (AXI4_ARREGION                     ),
                .AXI4_REGS                          (AXI4_REGS                         ),
                .IMAGE_X_NUM                        (IMAGE_X_NUM                       ),
                .X_WIDTH                            (X_WIDTH                           ),
                .Y_WIDTH                            (Y_WIDTH                           ),
                .U_PHY_WIDTH                        (U_PHY_WIDTH),
                .V_PHY_WIDTH                        (V_PHY_WIDTH),
                .U_WIDTH                            (U_WIDTH                           ),
                .V_WIDTH                            (V_WIDTH                           ),
                .CORE_ADDR_WIDTH                    (CORE_ADDR_WIDTH                   ),
                .PARAMS_ADDR_WIDTH                  (PARAMS_ADDR_WIDTH                 ),
                .BANK_ADDR_WIDTH                    (BANK_ADDR_WIDTH                   ),
                .BANK_NUM                           (BANK_NUM                          ),
                .EDGE_NUM                           (EDGE_NUM                          ),
                .POLYGON_NUM                        (POLYGON_NUM                       ),
                .SHADER_PARAM_NUM                   (SHADER_PARAM_NUM                  ),
                .EDGE_PARAM_WIDTH                   (EDGE_PARAM_WIDTH                  ),
                .EDGE_RAM_TYPE                      (EDGE_RAM_TYPE                     ),
                .SHADER_PARAM_WIDTH                 (SHADER_PARAM_WIDTH                ),
                .SHADER_PARAM_Q                     (SHADER_PARAM_Q                    ),
                .SHADER_RAM_TYPE                    (SHADER_RAM_TYPE                   ),
                .REGION_PARAM_WIDTH                 (REGION_PARAM_WIDTH                ),
                .REGION_RAM_TYPE                    (REGION_RAM_TYPE                   ),
                .CULLING_ONLY                       (CULLING_ONLY                      ),
                .Z_SORT_MIN                         (Z_SORT_MIN                        ),
                .RASTERIZER_INIT_CTL_ENABLE         (RASTERIZER_INIT_CTL_ENABLE        ),
                .RASTERIZER_INIT_CTL_UPDATE         (RASTERIZER_INIT_CTL_UPDATE        ),
                .RASTERIZER_INIT_PARAM_WIDTH        (RASTERIZER_INIT_PARAM_WIDTH       ),
                .RASTERIZER_INIT_PARAM_HEIGHT       (RASTERIZER_INIT_PARAM_HEIGHT      ),
                .RASTERIZER_INIT_PARAM_CULLING      (RASTERIZER_INIT_PARAM_CULLING     ),
                .RASTERIZER_INIT_PARAM_BANK         (RASTERIZER_INIT_PARAM_BANK        ),
                .SHADER_INIT_PARAM_ADDR             (SHADER_INIT_PARAM_ADDR            ),
                .SHADER_INIT_PARAM_WIDTH            (SHADER_INIT_PARAM_WIDTH           ),
                .SHADER_INIT_PARAM_HEIGHT           (SHADER_INIT_PARAM_HEIGHT          ),
                .SHADER_INIT_PARAM_STRIDE_C         (SHADER_INIT_PARAM_STRIDE_C        ),
                .SHADER_INIT_PARAM_STRIDE_X         (SHADER_INIT_PARAM_STRIDE_X        ),
                .SHADER_INIT_PARAM_STRIDE_Y         (SHADER_INIT_PARAM_STRIDE_Y        ),
                .SHADER_INIT_PARAM_NEARESTNEIGHBOR  (SHADER_INIT_PARAM_NEARESTNEIGHBOR ),
                .SHADER_INIT_PARAM_X_OP             (SHADER_INIT_PARAM_X_OP            ),
                .SHADER_INIT_PARAM_Y_OP             (SHADER_INIT_PARAM_Y_OP            ),
                .SHADER_INIT_PARAM_BORDER_VALUE     (SHADER_INIT_PARAM_BORDER_VALUE    ),
                .SHADER_INIT_PARAM_BGC              (SHADER_INIT_PARAM_BGC             ),
                .TEX_PARALLEL_NUM                   (TEX_PARALLEL_NUM                  ),
                .TEX_ADDR_WIDTH                     (TEX_ADDR_WIDTH                    ),
                .TEX_ADDR_X_WIDTH                   (TEX_ADDR_X_WIDTH                  ),
                .TEX_ADDR_Y_WIDTH                   (TEX_ADDR_Y_WIDTH                  ),
                .TEX_STRIDE_C_WIDTH                 (TEX_STRIDE_C_WIDTH                ),
                .TEX_STRIDE_X_WIDTH                 (TEX_STRIDE_X_WIDTH                ),
                .TEX_STRIDE_Y_WIDTH                 (TEX_STRIDE_Y_WIDTH                ),
                .TEX_USE_BILINEAR                   (TEX_USE_BILINEAR                  ),
                .TEX_USE_BORDER                     (TEX_USE_BORDER                    ),
                .SCATTER_FIFO_PTR_WIDTH             (SCATTER_FIFO_PTR_WIDTH            ),
                .SCATTER_FIFO_RAM_TYPE              (SCATTER_FIFO_RAM_TYPE             ),
                .SCATTER_S_REGS                     (SCATTER_S_REGS                    ),
                .SCATTER_M_REGS                     (SCATTER_M_REGS                    ),
                .SCATTER_INTERNAL_REGS              (SCATTER_INTERNAL_REGS             ),
                .GATHER_FIFO_PTR_WIDTH              (GATHER_FIFO_PTR_WIDTH             ),
                .GATHER_FIFO_RAM_TYPE               (GATHER_FIFO_RAM_TYPE              ),
                .GATHER_S_REGS                      (GATHER_S_REGS                     ),
                .GATHER_M_REGS                      (GATHER_M_REGS                     ),
                .GATHER_INTERNAL_REGS               (GATHER_INTERNAL_REGS              ),
                .SAMPLER2D_INT_WIDTH                (SAMPLER2D_INT_WIDTH               ),
                .SAMPLER2D_FRAC_WIDTH               (SAMPLER2D_FRAC_WIDTH              ),
                .SAMPLER2D_COEFF_INT_WIDTH          (SAMPLER2D_COEFF_INT_WIDTH         ),
                .SAMPLER2D_COEFF_FRAC_WIDTH         (SAMPLER2D_COEFF_FRAC_WIDTH        ),
                .SAMPLER2D_S_REGS                   (SAMPLER2D_S_REGS                  ),
                .SAMPLER2D_M_REGS                   (SAMPLER2D_M_REGS                  ),
                .SAMPLER2D_USER_FIFO_PTR_WIDTH      (SAMPLER2D_USER_FIFO_PTR_WIDTH     ),
                .SAMPLER2D_USER_FIFO_RAM_TYPE       (SAMPLER2D_USER_FIFO_RAM_TYPE      ),
                .SAMPLER2D_USER_FIFO_M_REGS         (SAMPLER2D_USER_FIFO_M_REGS        ),
                .L1_USE_LOOK_AHEAD                  (L1_USE_LOOK_AHEAD                 ),
                .L1_BLK_X_SIZE                      (L1_BLK_X_SIZE                     ),
                .L1_BLK_Y_SIZE                      (L1_BLK_Y_SIZE                     ),
                .L1_WAY_NUM                         (L1_WAY_NUM                        ),
                .L1_TAG_ADDR_WIDTH                  (L1_TAG_ADDR_WIDTH                 ),
                .L1_TAG_RAM_TYPE                    (L1_TAG_RAM_TYPE                   ),
                .L1_TAG_ALGORITHM                   (L1_TAG_ALGORITHM                  ),
                .L1_TAG_M_SLAVE_REGS                (L1_TAG_M_SLAVE_REGS               ),
                .L1_TAG_M_MASTER_REGS               (L1_TAG_M_MASTER_REGS              ),
                .L1_MEM_RAM_TYPE                    (L1_MEM_RAM_TYPE                   ),
                .L1_DATA_SIZE                       (L1_DATA_SIZE                      ),
                .L1_QUE_FIFO_PTR_WIDTH              (L1_QUE_FIFO_PTR_WIDTH             ),
                .L1_QUE_FIFO_RAM_TYPE               (L1_QUE_FIFO_RAM_TYPE              ),
                .L1_QUE_FIFO_S_REGS                 (L1_QUE_FIFO_S_REGS                ),
                .L1_QUE_FIFO_M_REGS                 (L1_QUE_FIFO_M_REGS                ),
                .L1_AR_FIFO_PTR_WIDTH               (L1_AR_FIFO_PTR_WIDTH              ),
                .L1_AR_FIFO_RAM_TYPE                (L1_AR_FIFO_RAM_TYPE               ),
                .L1_AR_FIFO_S_REGS                  (L1_AR_FIFO_S_REGS                 ),
                .L1_AR_FIFO_M_REGS                  (L1_AR_FIFO_M_REGS                 ),
                .L1_R_FIFO_PTR_WIDTH                (L1_R_FIFO_PTR_WIDTH               ),
                .L1_R_FIFO_RAM_TYPE                 (L1_R_FIFO_RAM_TYPE                ),
                .L1_R_FIFO_S_REGS                   (L1_R_FIFO_S_REGS                  ),
                .L1_R_FIFO_M_REGS                   (L1_R_FIFO_M_REGS                  ),
                .L1_LOG_ENABLE                      (L1_LOG_ENABLE                     ),
                .L1_LOG_FILE                        (L1_LOG_FILE                       ),
                .L1_LOG_ID                          (L1_LOG_ID                         ),
                .L2_PARALLEL_SIZE                   (L2_PARALLEL_SIZE                  ),
                .L2_USE_LOOK_AHEAD                  (L2_USE_LOOK_AHEAD                 ),
                .L2_WAY_NUM                         (L2_WAY_NUM                        ),
                .L2_BLK_X_SIZE                      (L2_BLK_X_SIZE                     ),
                .L2_BLK_Y_SIZE                      (L2_BLK_Y_SIZE                     ),
                .L2_TAG_ADDR_WIDTH                  (L2_TAG_ADDR_WIDTH                 ),
                .L2_TAG_RAM_TYPE                    (L2_TAG_RAM_TYPE                   ),
                .L2_TAG_ALGORITHM                   (L2_TAG_ALGORITHM                  ),
                .L2_TAG_M_SLAVE_REGS                (L2_TAG_M_SLAVE_REGS               ),
                .L2_TAG_M_MASTER_REGS               (L2_TAG_M_MASTER_REGS              ),
                .L2_MEM_RAM_TYPE                    (L2_MEM_RAM_TYPE                   ),
                .L2_QUE_FIFO_PTR_WIDTH              (L2_QUE_FIFO_PTR_WIDTH             ),
                .L2_QUE_FIFO_RAM_TYPE               (L2_QUE_FIFO_RAM_TYPE              ),
                .L2_QUE_FIFO_S_REGS                 (L2_QUE_FIFO_S_REGS                ),
                .L2_QUE_FIFO_M_REGS                 (L2_QUE_FIFO_M_REGS                ),
                .L2_AR_FIFO_PTR_WIDTH               (L2_AR_FIFO_PTR_WIDTH              ),
                .L2_AR_FIFO_RAM_TYPE                (L2_AR_FIFO_RAM_TYPE               ),
                .L2_AR_FIFO_S_REGS                  (L2_AR_FIFO_S_REGS                 ),
                .L2_AR_FIFO_M_REGS                  (L2_AR_FIFO_M_REGS                 ),
                .L2_R_FIFO_PTR_WIDTH                (L2_R_FIFO_PTR_WIDTH               ),
                .L2_R_FIFO_RAM_TYPE                 (L2_R_FIFO_RAM_TYPE                ),
                .L2_R_FIFO_S_REGS                   (L2_R_FIFO_S_REGS                  ),
                .L2_R_FIFO_M_REGS                   (L2_R_FIFO_M_REGS                  ),
                .L2_LOG_ENABLE                      (L2_LOG_ENABLE                     ),
                .L2_LOG_FILE                        (L2_LOG_FILE                       ),
                .L2_LOG_ID                          (L2_LOG_ID                         ),
                .DMA_QUE_FIFO_PTR_WIDTH             (DMA_QUE_FIFO_PTR_WIDTH            ),
                .DMA_QUE_FIFO_RAM_TYPE              (DMA_QUE_FIFO_RAM_TYPE             ),
                .DMA_QUE_FIFO_S_REGS                (DMA_QUE_FIFO_S_REGS               ),
                .DMA_QUE_FIFO_M_REGS                (DMA_QUE_FIFO_M_REGS               ),
                .DMA_S_AR_REGS                      (DMA_S_AR_REGS                     ),
                .DMA_S_R_REGS                       (DMA_S_R_REGS                      ),
                .DEVICE                             (DEVICE                            )
            )
        i_gpu_texturemap
            (
                .reset                              (reset          ),
                .clk                                (clk            ),
                .endian                             (endian         ),
                
                .clear_start                        (clear_start    ),
                .clear_busy                         (clear_busy     ),
                
                .s_wb_rst_i                         (s_wb_rst_i     ),
                .s_wb_clk_i                         (s_wb_clk_i     ),
                .s_wb_adr_i                         (s_wb_adr_i     ),
                .s_wb_dat_o                         (s_wb_dat_o     ),
                .s_wb_dat_i                         (s_wb_dat_i     ),
                .s_wb_we_i                          (s_wb_we_i      ),
                .s_wb_sel_i                         (s_wb_sel_i     ),
                .s_wb_stb_i                         (s_wb_stb_i     ),
                .s_wb_ack_o                         (s_wb_ack_o     ),
                
                .m_axi4s_tuser                      (m_axi4s_tuser  ),
                .m_axi4s_tlast                      (m_axi4s_tlast  ),
                .m_axi4s_tdata                      (m_axi4s_tdata  ),
                .m_axi4s_tstrb                      (m_axi4s_tstrb),
                .m_axi4s_tvalid                     (m_axi4s_tvalid ),
                .m_axi4s_tready                     (m_axi4s_tready ),
                
                .m_axi4_arid                        (m_axi4_arid    ),
                .m_axi4_araddr                      (m_axi4_araddr  ),
                .m_axi4_arlen                       (m_axi4_arlen   ),
                .m_axi4_arsize                      (m_axi4_arsize  ),
                .m_axi4_arburst                     (m_axi4_arburst ),
                .m_axi4_arlock                      (m_axi4_arlock  ),
                .m_axi4_arcache                     (m_axi4_arcache ),
                .m_axi4_arprot                      (m_axi4_arprot  ),
                .m_axi4_arqos                       (m_axi4_arqos   ),
                .m_axi4_arregion                    (m_axi4_arregion),
                .m_axi4_arvalid                     (m_axi4_arvalid ),
                .m_axi4_arready                     (m_axi4_arready ),
                .m_axi4_rid                         (m_axi4_rid     ),
                .m_axi4_rdata                       (m_axi4_rdata   ),
                .m_axi4_rresp                       (m_axi4_rresp   ),
                .m_axi4_rlast                       (m_axi4_rlast   ),
                .m_axi4_rvalid                      (m_axi4_rvalid  ),
                .m_axi4_rready                      (m_axi4_rready  )
            );
    
    
    jelly_axi4_slave_model
            #(
                .AXI_ID_WIDTH                   (AXI4_ID_WIDTH),
                .AXI_ADDR_WIDTH                 (AXI4_ADDR_WIDTH),
                .AXI_QOS_WIDTH                  (AXI4_QOS_WIDTH),
                .AXI_LEN_WIDTH                  (AXI4_LEN_WIDTH),
                .AXI_DATA_SIZE                  (AXI4_DATA_SIZE),
                .MEM_WIDTH                      (17),
                
                .WRITE_LOG_FILE                 (""),
                .READ_LOG_FILE                  ("axi4_read.txt"),
                
                .AW_DELAY                       (0),
                .AR_DELAY                       (0),
                
                .AW_FIFO_PTR_WIDTH              (4),
                .W_FIFO_PTR_WIDTH               (4),
                .B_FIFO_PTR_WIDTH               (4),
                .AR_FIFO_PTR_WIDTH              (4),
                .R_FIFO_PTR_WIDTH               (4),
                
                .AW_BUSY_RATE                   (0),
                .W_BUSY_RATE                    (0),
                .B_BUSY_RATE                    (0),
                .AR_BUSY_RATE                   (0),
                .R_BUSY_RATE                    (0)
            )
        i_axi4_slave_model
            (
                .aresetn                        (~reset),
                .aclk                           (clk),
                
                .s_axi4_awid                    (),
                .s_axi4_awaddr                  (),
                .s_axi4_awlen                   (),
                .s_axi4_awsize                  (),
                .s_axi4_awburst                 (),
                .s_axi4_awlock                  (),
                .s_axi4_awcache                 (),
                .s_axi4_awprot                  (),
                .s_axi4_awqos                   (),
                .s_axi4_awvalid                 (0),
                .s_axi4_awready                 (),
                .s_axi4_wdata                   (),
                .s_axi4_wstrb                   (),
                .s_axi4_wlast                   (),
                .s_axi4_wvalid                  (0),
                .s_axi4_wready                  (),
                .s_axi4_bid                     (),
                .s_axi4_bresp                   (),
                .s_axi4_bvalid                  (),
                .s_axi4_bready                  (0),
                
                .s_axi4_arid                    (m_axi4_arid),
                .s_axi4_araddr                  (m_axi4_araddr),
                .s_axi4_arlen                   (m_axi4_arlen),
                .s_axi4_arsize                  (m_axi4_arsize),
                .s_axi4_arburst                 (m_axi4_arburst),
                .s_axi4_arlock                  (m_axi4_arlock),
                .s_axi4_arcache                 (m_axi4_arcache),
                .s_axi4_arprot                  (m_axi4_arprot),
                .s_axi4_arqos                   (m_axi4_arqos),
                .s_axi4_arvalid                 (m_axi4_arvalid),
                .s_axi4_arready                 (m_axi4_arready),
                .s_axi4_rid                     (m_axi4_rid),
                .s_axi4_rdata                   (m_axi4_rdata),
                .s_axi4_rresp                   (m_axi4_rresp),
                .s_axi4_rlast                   (m_axi4_rlast),
                .s_axi4_rvalid                  (m_axi4_rvalid),
                .s_axi4_rready                  (m_axi4_rready)
            );
    
    initial begin
        i_axi4_slave_model.read_memh("axi4_mem.txt");
    end
    
    
    
    integer     fp;
    initial begin
         fp = $fopen("out_img.ppm", "w");
         $fdisplay(fp, "P3");
         $fdisplay(fp, "%d %d", X_NUM, Y_NUM);
         $fdisplay(fp, "255");
    end
    
    always @(posedge clk) begin
        if ( !reset && m_axi4s_tvalid && m_axi4s_tready ) begin
             $fdisplay(fp, "%d %d %d", m_axi4s_tdata[7:0], m_axi4s_tdata[15:8], m_axi4s_tdata[23:16]);
        end
    end
    
    
    // WISHBONE master
    wire                            wb_rst_i = s_wb_rst_i;
    wire                            wb_clk_i = s_wb_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i;
    
    assign s_wb_adr_i = wb_adr_o;
    assign s_wb_dat_i = wb_dat_o;
    assign s_wb_we_i  = wb_we_o;
    assign s_wb_sel_i = wb_sel_o;
    assign s_wb_stb_i = wb_stb_o;
    assign wb_dat_i   = s_wb_dat_o;
    assign wb_ack_i   = s_wb_ack_o;
    
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_stb_o ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    task wb_write(
                input [WB_ADR_WIDTH-1:0]    adr,
                input [WB_DAT_WIDTH-1:0]    dat,
                input [WB_SEL_WIDTH-1:0]    sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
            wb_dat_o = dat;
            wb_sel_o = sel;
            wb_we_o  = 1'b1;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
    end
    endtask
    
    
    task wb_read(
                input [WB_ADR_WIDTH-1:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = (adr >> 2);
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'b1}};
            wb_we_o  = 1'b0;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
            $display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
    end
    endtask
    
    
    initial begin
    @(negedge wb_rst_i);
    #100
    
wb_write(32'h40004000, 32'hffffea7d, 4'hf);
wb_write(32'h40004004, 32'h0035b2e4, 4'hf);
wb_write(32'h40004008, 32'h0006f21c, 4'hf);
wb_write(32'h4000400c, 32'h000003d7, 4'hf);
wb_write(32'h40004010, 32'hfff67ca8, 4'hf);
wb_write(32'h40004014, 32'hffe3a0ba, 4'hf);
wb_write(32'h40004018, 32'hffffebba, 4'hf);
wb_write(32'h4000401c, 32'h00329a74, 4'hf);
wb_write(32'h40004020, 32'h001f598b, 4'hf);
wb_write(32'h40004024, 32'h0000029a, 4'hf);
wb_write(32'h40004028, 32'hfff99518, 4'hf);
wb_write(32'h4000402c, 32'hfffcb5b8, 4'hf);
wb_write(32'h40004030, 32'h00000528, 4'hf);
wb_write(32'h40004034, 32'hfff335a8, 4'hf);
wb_write(32'h40004038, 32'hffd0aa68, 4'hf);
wb_write(32'h4000403c, 32'hffffe76d, 4'hf);
wb_write(32'h40004040, 32'h003d575a, 4'hf);
wb_write(32'h40004044, 32'h00154504, 4'hf);
wb_write(32'h40004048, 32'h00000391, 4'hf);
wb_write(32'h4000404c, 32'hfff72f0b, 4'hf);
wb_write(32'h40004050, 32'hfff0dc68, 4'hf);
wb_write(32'h40004054, 32'hffffe904, 4'hf);
wb_write(32'h40004058, 32'h00395df7, 4'hf);
wb_write(32'h4000405c, 32'h00340e36, 4'hf);
wb_write(32'h40004060, 32'hfffffa35, 4'hf);
wb_write(32'h40004064, 32'h000e80f3, 4'hf);
wb_write(32'h40004068, 32'h00096670, 4'hf);
wb_write(32'h4000406c, 32'hfffff93e, 4'hf);
wb_write(32'h40004070, 32'h0010e700, 4'hf);
wb_write(32'h40004074, 32'h00011f68, 4'hf);
wb_write(32'h40004078, 32'hfffff77f, 4'hf);
wb_write(32'h4000407c, 32'h00154476, 4'hf);
wb_write(32'h40004080, 32'h0000251b, 4'hf);
wb_write(32'h40004084, 32'hfffff62e, 4'hf);
wb_write(32'h40004088, 32'h00188b76, 4'hf);
wb_write(32'h4000408c, 32'hfff798a4, 4'hf);
wb_write(32'h40008000, 32'hffffff4a, 4'hf);
wb_write(32'h40008004, 32'h0001c5cc, 4'hf);
wb_write(32'h40008008, 32'h000bccf2, 4'hf);
wb_write(32'h4000800c, 32'h00000111, 4'hf);
wb_write(32'h40008010, 32'hfffd5e8e, 4'hf);
wb_write(32'h40008014, 32'hfffea795, 4'hf);
wb_write(32'h40008018, 32'h000008c0, 4'hf);
wb_write(32'h4000801c, 32'hffea2863, 4'hf);
wb_write(32'h40008020, 32'hfffd2c7f, 4'hf);
wb_write(32'h40008024, 32'hffffff1e, 4'hf);
wb_write(32'h40008028, 32'h00023382, 4'hf);
wb_write(32'h4000802c, 32'h000ea7c1, 4'hf);
wb_write(32'h40008030, 32'hfffff611, 4'hf);
wb_write(32'h40008034, 32'h0018cb1d, 4'hf);
wb_write(32'h40008038, 32'h00167ed7, 4'hf);
wb_write(32'h4000803c, 32'hfffffdcb, 4'hf);
wb_write(32'h40008040, 32'h00057984, 4'hf);
wb_write(32'h40008044, 32'h00144863, 4'hf);
wb_write(32'h40008048, 32'h00000000, 4'hf);
wb_write(32'h4000804c, 32'h000004d5, 4'hf);
wb_write(32'h40008050, 32'h000ae755, 4'hf);
wb_write(32'h40008054, 32'h00000780, 4'hf);
wb_write(32'h40008058, 32'hffed3dc8, 4'hf);
wb_write(32'h4000805c, 32'hfffebfc9, 4'hf);
wb_write(32'h40008060, 32'h000003a7, 4'hf);
wb_write(32'h40008064, 32'hfff6fd7f, 4'hf);
wb_write(32'h40008068, 32'hfffb653c, 4'hf);
wb_write(32'h4000806c, 32'h000002b8, 4'hf);
wb_write(32'h40008070, 32'hfff93646, 4'hf);
wb_write(32'h40008074, 32'h00067e7a, 4'hf);
wb_write(32'h40008078, 32'hfffffbec, 4'hf);
wb_write(32'h4000807c, 32'h000a35d7, 4'hf);
wb_write(32'h40008080, 32'h00069d47, 4'hf);
wb_write(32'h40008084, 32'h0000119f, 4'hf);
wb_write(32'h40008088, 32'hffd4045b, 4'hf);
wb_write(32'h4000808c, 32'hffe4c208, 4'hf);
wb_write(32'h40008090, 32'h00000000, 4'hf);
wb_write(32'h40008094, 32'h000002e6, 4'hf);
wb_write(32'h40008098, 32'h00068acc, 4'hf);
wb_write(32'h4000809c, 32'hfffff880, 4'hf);
wb_write(32'h400080a0, 32'h0012c1ba, 4'hf);
wb_write(32'h400080a4, 32'h000021f5, 4'hf);
wb_write(32'h400080a8, 32'h000003a7, 4'hf);
wb_write(32'h400080ac, 32'hfff6f392, 4'hf);
wb_write(32'h400080b0, 32'hffe50148, 4'hf);
wb_write(32'h400080b4, 32'h00000445, 4'hf);
wb_write(32'h400080b8, 32'hfff55712, 4'hf);
wb_write(32'h400080bc, 32'h000a3104, 4'hf);
wb_write(32'h400080c0, 32'h00000aad, 4'hf);
wb_write(32'h400080c4, 32'hffe5512c, 4'hf);
wb_write(32'h400080c8, 32'h00091f8a, 4'hf);
wb_write(32'h400080cc, 32'h00001993, 4'hf);
wb_write(32'h400080d0, 32'hffc02901, 4'hf);
wb_write(32'h400080d4, 32'hfff7bd46, 4'hf);
wb_write(32'h4000c000, 32'h0000000f, 4'hf);
wb_write(32'h4000c004, 32'h0000000c, 4'hf);
wb_write(32'h4000c008, 32'h000000f0, 4'hf);
wb_write(32'h4000c00c, 32'h00000030, 4'hf);
wb_write(32'h4000c010, 32'h00000348, 4'hf);
wb_write(32'h4000c014, 32'h00000240, 4'hf);
wb_write(32'h4000c018, 32'h00000584, 4'hf);
wb_write(32'h4000c01c, 32'h00000180, 4'hf);
wb_write(32'h4000c020, 32'h00000c12, 4'hf);
wb_write(32'h4000c024, 32'h00000402, 4'hf);
wb_write(32'h4000c028, 32'h00000a21, 4'hf);
wb_write(32'h4000c02c, 32'h00000801, 4'hf); 

        
        $display("start");
        wb_write(32'h0000_0004, 32'h0000_0001, 4'b1111);
        wb_write(32'h0000_0000, 32'h0000_0001, 4'b1111);
        
    #100000000
        $finish();
    end
    
    
    
endmodule



`default_nettype wire


// end of file
