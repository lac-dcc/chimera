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



module jelly_texture_cache_l2
        #(
            parameter   COMPONENT_NUM          = 3,
            parameter   COMPONENT_DATA_WIDTH   = 8,
            parameter   COMPONENT_DATA_SIZE    = COMPONENT_DATA_WIDTH <=     8 ?  0 :
                                                 COMPONENT_DATA_WIDTH <=    16 ?  1 :
                                                 COMPONENT_DATA_WIDTH <=    32 ?  2 :
                                                 COMPONENT_DATA_WIDTH <=    64 ?  3 :
                                                 COMPONENT_DATA_WIDTH <=   128 ?  4 :
                                                 COMPONENT_DATA_WIDTH <=   256 ?  5 :
                                                 COMPONENT_DATA_WIDTH <=   512 ?  6 :
                                                 COMPONENT_DATA_WIDTH <=  1024 ?  7 :
                                                 COMPONENT_DATA_WIDTH <=  2048 ?  8 :
                                                 COMPONENT_DATA_WIDTH <=  4096 ?  9 :
                                                 COMPONENT_DATA_WIDTH <=  8192 ? 10 :
                                                 COMPONENT_DATA_WIDTH <= 16384 ? 11 :
                                                 COMPONENT_DATA_WIDTH <= 32768 ? 12 : 13,
            
            parameter   ADDR_WIDTH             = 24,
            parameter   STRIDE_C_WIDTH         = 14,
            parameter   STRIDE_X_WIDTH         = 14,
            parameter   STRIDE_Y_WIDTH         = 14,
            
            parameter   PARALLEL_SIZE          = 2,     // 0:1, 1:2, 2:4, 2:4, 3:8 ....
            parameter   ADDR_X_WIDTH           = 12,
            parameter   ADDR_Y_WIDTH           = 12,
            parameter   BLK_X_SIZE             = 3, // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   BLK_Y_SIZE             = 3, // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   WAY_NUM                = 1,
            parameter   TAG_ADDR_WIDTH         = 6,
            parameter   TAG_RAM_TYPE           = "distributed",
            parameter   TAG_ALGORITHM          = PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
            parameter   TAG_M_SLAVE_REGS       = 0,
            parameter   TAG_M_MASTER_REGS      = 0,
            parameter   MEM_RAM_TYPE           = "block",
            
            parameter   USE_LOOK_AHEAD         = 0,
            parameter   USE_S_RREADY           = 1, // 0: s_rready is always 1'b1.   1: handshake mode.
            parameter   USE_M_RREADY           = 0, // 0: m_rready is always 1'b1.   1: handshake mode.
            
            parameter   S_NUM                  = 8,
            parameter   S_DATA_SIZE            = 1,
            parameter   S_BLK_X_NUM            = 2,
            parameter   S_BLK_Y_NUM            = 2,
            
            parameter   M_AXI4_ID_WIDTH        = 6,
            parameter   M_AXI4_ADDR_WIDTH      = 32,
            parameter   M_AXI4_DATA_SIZE       = 2, // 0:8bit, 1:16bit, 2:32bit ...
            parameter   M_AXI4_DATA_WIDTH      = (8 << M_AXI4_DATA_SIZE),
            parameter   M_AXI4_LEN_WIDTH       = 8,
            parameter   M_AXI4_QOS_WIDTH       = 4,
            parameter   M_AXI4_ARID            = {M_AXI4_ID_WIDTH{1'b0}},
            parameter   M_AXI4_ARSIZE          = M_AXI4_DATA_SIZE,
            parameter   M_AXI4_ARBURST         = 2'b01,
            parameter   M_AXI4_ARLOCK          = 1'b0,
            parameter   M_AXI4_ARCACHE         = 4'b0001,
            parameter   M_AXI4_ARPROT          = 3'b000,
            parameter   M_AXI4_ARQOS           = 0,
            parameter   M_AXI4_ARREGION        = 4'b0000,
            parameter   M_AXI4_REGS            = 1,
            
            parameter   QUE_FIFO_PTR_WIDTH     = USE_LOOK_AHEAD ? BLK_Y_SIZE + BLK_X_SIZE : 0,
            parameter   QUE_FIFO_RAM_TYPE      = "distributed",
            parameter   QUE_FIFO_S_REGS        = 0,
            parameter   QUE_FIFO_M_REGS        = 0,
            
            parameter   AR_FIFO_PTR_WIDTH      = 0,
            parameter   AR_FIFO_RAM_TYPE       = "distributed",
            parameter   AR_FIFO_S_REGS         = 0,
            parameter   AR_FIFO_M_REGS         = 0,
            
            parameter   R_FIFO_PTR_WIDTH       = BLK_Y_SIZE + BLK_X_SIZE - (M_AXI4_DATA_SIZE - COMPONENT_DATA_SIZE),
            parameter   R_FIFO_RAM_TYPE        = "distributed",
            parameter   R_FIFO_S_REGS          = 0,
            parameter   R_FIFO_M_REGS          = 0,

            parameter   DMA_QUE_FIFO_PTR_WIDTH = 6,
            parameter   DMA_QUE_FIFO_RAM_TYPE  = "distributed",
            parameter   DMA_QUE_FIFO_S_REGS    = 0,
            parameter   DMA_QUE_FIFO_M_REGS    = 1,     
            parameter   DMA_S_AR_REGS          = 1,
            parameter   DMA_S_R_REGS           = 1,
            
            parameter   LOG_ENABLE             = 0,
            parameter   LOG_FILE               = "cache_log.txt",
            parameter   LOG_ID                 = 0,
            
            // local
            parameter   CACHE_NUM              = (1 << PARALLEL_SIZE),
            parameter   S_DATA_WIDTH           = ((COMPONENT_NUM * COMPONENT_DATA_WIDTH) << S_DATA_SIZE)
        )
        (
            input   wire                                            reset,
            input   wire                                            clk,
            
            input   wire                                            endian,
            
            input   wire    [M_AXI4_ADDR_WIDTH-1:0]                 param_addr,
            input   wire    [M_AXI4_LEN_WIDTH-1:0]                  param_arlen,
            input   wire    [STRIDE_C_WIDTH-1:0]                    param_stride_c,
            input   wire    [STRIDE_X_WIDTH-1:0]                    param_stride_x,
            input   wire    [STRIDE_Y_WIDTH-1:0]                    param_stride_y,
            
            input   wire                                            clear_start,
            output  wire                                            clear_busy,
            
            output  wire    [CACHE_NUM-1:0]                         status_idle,
            output  wire    [CACHE_NUM-1:0]                         status_stall,
            output  wire    [CACHE_NUM-1:0]                         status_access,
            output  wire    [CACHE_NUM-1:0]                         status_hit,
            output  wire    [CACHE_NUM-1:0]                         status_miss,
            output  wire    [CACHE_NUM-1:0]                         status_blank,
            
            input   wire    [S_NUM*ADDR_X_WIDTH-1:0]                s_araddrx,
            input   wire    [S_NUM*ADDR_Y_WIDTH-1:0]                s_araddry,
            input   wire    [S_NUM-1:0]                             s_arvalid,
            output  wire    [S_NUM-1:0]                             s_arready,
            
            output  wire    [S_NUM-1:0]                             s_rlast,
            output  wire    [S_NUM*S_DATA_WIDTH-1:0]                s_rdata,
            output  wire    [S_NUM-1:0]                             s_rvalid,
            input   wire    [S_NUM-1:0]                             s_rready,
            
            
            output  wire    [M_AXI4_ID_WIDTH-1:0]                   m_axi4_arid,
            output  wire    [M_AXI4_ADDR_WIDTH-1:0]                 m_axi4_araddr,
            output  wire    [M_AXI4_LEN_WIDTH-1:0]                  m_axi4_arlen,
            output  wire    [2:0]                                   m_axi4_arsize,
            output  wire    [1:0]                                   m_axi4_arburst,
            output  wire    [0:0]                                   m_axi4_arlock,
            output  wire    [3:0]                                   m_axi4_arcache,
            output  wire    [2:0]                                   m_axi4_arprot,
            output  wire    [M_AXI4_QOS_WIDTH-1:0]                  m_axi4_arqos,
            output  wire    [3:0]                                   m_axi4_arregion,
            output  wire                                            m_axi4_arvalid,
            input   wire                                            m_axi4_arready,
            input   wire    [M_AXI4_ID_WIDTH-1:0]                   m_axi4_rid,
            input   wire    [M_AXI4_DATA_WIDTH-1:0]                 m_axi4_rdata,
            input   wire    [1:0]                                   m_axi4_rresp,
            input   wire                                            m_axi4_rlast,
            input   wire                                            m_axi4_rvalid,
            output  wire                                            m_axi4_rready
        );
    
    genvar  i;
    
    
    // -----------------------------
    //  localparam
    // -----------------------------
        
    localparam  CACHE_ID_WIDTH      = PARALLEL_SIZE;
    
    localparam  ID_WIDTH            = M_AXI4_ID_WIDTH;
    
    localparam  S_ID_WIDTH          = S_NUM                <=     2 ?  1 :
                                      S_NUM                <=     4 ?  2 :
                                      S_NUM                <=     8 ?  3 :
                                      S_NUM                <=    16 ?  4 :
                                      S_NUM                <=    32 ?  5 :
                                      S_NUM                <=    64 ?  6 :
                                      S_NUM                <=   128 ?  7 :
                                      S_NUM                <=   256 ?  8 :
                                      S_NUM                <=   512 ?  9 :
                                      S_NUM                <=  1024 ? 10 :
                                      S_NUM                <=  2048 ? 11 :
                                      S_NUM                <=  4096 ? 12 :
                                      S_NUM                <=  8192 ? 13 :
                                      S_NUM                <= 16384 ? 14 :
                                      S_NUM                <= 32768 ? 15 : 16;
    
    localparam  COMPONENT_SEL_WIDTH = COMPONENT_NUM        <=     2 ?  1 :
                                      COMPONENT_NUM        <=     4 ?  2 :
                                      COMPONENT_NUM        <=     8 ?  3 :
                                      COMPONENT_NUM        <=    16 ?  4 :
                                      COMPONENT_NUM        <=    32 ?  5 :
                                      COMPONENT_NUM        <=    64 ?  6 :
                                      COMPONENT_NUM        <=   128 ?  7 :
                                      COMPONENT_NUM        <=   256 ?  8 :
                                      COMPONENT_NUM        <=   512 ?  9 :
                                      COMPONENT_NUM        <=  1024 ? 10 :
                                      COMPONENT_NUM        <=  2048 ? 11 :
                                      COMPONENT_NUM        <=  4096 ? 12 :
                                      COMPONENT_NUM        <=  8192 ? 13 :
                                      COMPONENT_NUM        <= 16384 ? 14 :
                                      COMPONENT_NUM        <= 32768 ? 15 : 16;
    
    
    
    localparam  M_DATA_SIZE    = M_AXI4_DATA_SIZE;
    
    
    
    // -----------------------------
    //  Arbiter
    // -----------------------------
    
    localparam  S_AR_PACKET_WIDTH = ADDR_X_WIDTH + ADDR_Y_WIDTH;
    localparam  S_R_PACKET_WIDTH  = 1 + S_DATA_WIDTH;
    
    
    // コマンドパケット生成
    localparam  BLK_ADDR_X_WIDTH = ADDR_X_WIDTH - BLK_X_SIZE;
    localparam  BLK_ADDR_Y_WIDTH = ADDR_Y_WIDTH - BLK_Y_SIZE;
    
    wire    [S_NUM*CACHE_ID_WIDTH-1:0]      s_arid;
    wire    [S_NUM*S_AR_PACKET_WIDTH-1:0]   s_arpacket;
    
    generate
    for ( i = 0; i < S_NUM; i = i+1 ) begin : loop_ar_pack
        //  ID
        wire    [BLK_ADDR_X_WIDTH-1:0]  s_blk_addrx;
        wire    [BLK_ADDR_Y_WIDTH-1:0]  s_blk_addry;
        assign s_blk_addrx = (s_araddrx[i*ADDR_X_WIDTH +: ADDR_X_WIDTH] >> BLK_X_SIZE);
        assign s_blk_addry = (s_araddry[i*ADDR_Y_WIDTH +: ADDR_Y_WIDTH] >> BLK_Y_SIZE);
        
        jelly_texture_cache_tag_addr
                #(
                    .PARALLEL_SIZE      (PARALLEL_SIZE),
                    
                    .ADDR_X_WIDTH       (BLK_ADDR_X_WIDTH),
                    .ADDR_Y_WIDTH       (BLK_ADDR_Y_WIDTH),
                    .TAG_ADDR_WIDTH     (TAG_ADDR_WIDTH)
                )
            i_texture_cache_tag_addr_cache_id
                (
                    .addrx              (s_blk_addrx),
                    .addry              (s_blk_addry),
                    
                    .unit_id            (s_arid[i*CACHE_ID_WIDTH +: CACHE_ID_WIDTH]),
                    .tag_addr           (),
                    .index              ()
                );
        
        // packet
        assign s_arpacket[i*S_AR_PACKET_WIDTH +: S_AR_PACKET_WIDTH] =
                        {
                            s_araddrx[i*ADDR_X_WIDTH +: ADDR_X_WIDTH],
                            s_araddry[i*ADDR_Y_WIDTH +: ADDR_Y_WIDTH]
                        };
    end
    endgenerate
    
    
    // コマンドパケット調停
    wire    [CACHE_NUM*S_ID_WIDTH-1:0]          arbit_arid;
    wire    [CACHE_NUM*S_AR_PACKET_WIDTH-1:0]   arbit_arpacket;
    wire    [CACHE_NUM-1:0]                     arbit_arvalid;
    wire    [CACHE_NUM-1:0]                     arbit_arready;
    
    
    wire    [CACHE_NUM*S_ID_WIDTH-1:0]          arbit_aruser;
    wire    [CACHE_NUM*ADDR_X_WIDTH-1:0]        arbit_araddrx;
    wire    [CACHE_NUM*ADDR_Y_WIDTH-1:0]        arbit_araddry;
    generate
    for ( i = 0; i < CACHE_NUM; i = i+1 ) begin : loop_ar_unpack
        assign 
            {
                arbit_aruser [i*S_ID_WIDTH         +: S_ID_WIDTH],
                arbit_araddrx[i*ADDR_X_WIDTH       +: ADDR_X_WIDTH],
                arbit_araddry[i*ADDR_Y_WIDTH       +: ADDR_Y_WIDTH]
            } = arbit_arpacket[i*S_AR_PACKET_WIDTH +: S_AR_PACKET_WIDTH];
    end
    endgenerate
    
    jelly_data_arbiter_ring_bus
            #(
                .S_NUM              (S_NUM),
                .S_ID_WIDTH         (S_ID_WIDTH),
                .M_NUM              (CACHE_NUM),
                .M_ID_WIDTH         (CACHE_ID_WIDTH),
                .DATA_WIDTH         (S_AR_PACKET_WIDTH)
            )
        i_data_arbiter_ring_bus
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_id_to            (s_arid),
                .s_data             (s_arpacket),
                .s_valid            (s_arvalid),
                .s_ready            (s_arready),
                
                .m_id_from          (arbit_arid),
                .m_data             (arbit_arpacket),
                .m_valid            (arbit_arvalid),
                .m_ready            (arbit_arready)
            );
    
    
    
    // データ用クロスバー
    wire    [CACHE_NUM*S_ID_WIDTH-1:0]          arbit_rid;
    wire    [CACHE_NUM-1:0]                     arbit_rlast;
    wire    [CACHE_NUM*S_DATA_WIDTH-1:0]        arbit_rdata;
    wire    [CACHE_NUM-1:0]                     arbit_rvalid;
    wire    [CACHE_NUM-1:0]                     arbit_rready;
    
    wire    [CACHE_NUM*S_R_PACKET_WIDTH-1:0]    arbit_rpacket;
    
    wire    [S_NUM*S_R_PACKET_WIDTH-1:0]        s_rpacket;
    
    generate
    for ( i = 0; i < CACHE_NUM; i = i+1 ) begin : loop_r_pack
        assign arbit_rpacket[i*S_R_PACKET_WIDTH +: S_R_PACKET_WIDTH] =
            {
                arbit_rlast[i],
                arbit_rdata[i*S_DATA_WIDTH +: S_DATA_WIDTH]
            };
    end
    endgenerate
    
    generate
    for ( i = 0; i < S_NUM; i = i+1 ) begin : loop_r_unpack
        assign
            {
                s_rlast[i],
                s_rdata[i*S_DATA_WIDTH +: S_DATA_WIDTH]
            } = s_rpacket[i*S_R_PACKET_WIDTH +: S_R_PACKET_WIDTH];
    end
    endgenerate
    
    jelly_data_crossbar_simple
            #(
                .S_NUM          (CACHE_NUM),
                .S_ID_WIDTH     (CACHE_ID_WIDTH),
                .M_NUM          (S_NUM),
                .M_ID_WIDTH     (S_ID_WIDTH),
                .DATA_WIDTH     (S_R_PACKET_WIDTH)
            )
        i_data_crossbar_simple
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (1'b1),
                
                .s_id_to        (arbit_rid),
                .s_data         (arbit_rpacket),
                .s_valid        (arbit_rvalid),
                
                .m_id_from      (),
                .m_data         (s_rpacket),
                .m_valid        (s_rvalid)
            );
    assign arbit_rready = {CACHE_NUM{1'b1}};
    
    // simulation check
    always @(posedge clk) begin
        if ( !reset ) begin
            if ( |(s_rvalid & ~s_rready) ) begin
                $display("L2$ rdata overflow : %b", (s_rvalid & ~s_rready));
            end
        end
    end
    
    
    /*
    jelly_stream_arbiter_crossbar
            #(
                .S_NUM              (CACHE_NUM),
                .S_ID_WIDTH         (CACHE_ID_WIDTH),
                .M_NUM              (S_NUM),
                .M_ID_WIDTH         (S_ID_WIDTH),
                .DATA_WIDTH         (S_DATA_WIDTH)
            )
        i_stream_arbiter_crossbar_r
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_id_to            (arbit_rid),
                .s_last             (arbit_rlast),
                .s_data             (arbit_rdata),
                .s_valid            (arbit_rvalid),
                .s_ready            (arbit_rready),
                
                .m_id_from          (),
                .m_last             (s_rlast),
                .m_data             (s_rdata),
                .m_valid            (s_rvalid),
                .m_ready            (s_rready)
            );
    */
    
    
    // -----------------------------
    //  L2 Cahce
    // -----------------------------
    
    localparam  M_AR_PACKET_WIDTH = ADDR_X_WIDTH + ADDR_Y_WIDTH;
    localparam  M_R_PACKET_WIDTH  = 1 + COMPONENT_SEL_WIDTH + M_AXI4_DATA_WIDTH;
    
    // cache
    wire    [CACHE_NUM-1:0]                     cache_clear_busy;
    assign clear_busy = cache_clear_busy[0];
    
    wire    [CACHE_NUM*M_AR_PACKET_WIDTH-1:0]   cache_arpacket;
    wire    [CACHE_NUM*ADDR_X_WIDTH-1:0]        cache_araddrx;
    wire    [CACHE_NUM*ADDR_Y_WIDTH-1:0]        cache_araddry;
    wire    [CACHE_NUM-1:0]                     cache_arvalid;
    wire    [CACHE_NUM-1:0]                     cache_arready;
    
    wire    [CACHE_NUM*M_R_PACKET_WIDTH-1:0]    cache_rpacket;
    wire    [CACHE_NUM-1:0]                     cache_rlast;
    wire    [CACHE_NUM*COMPONENT_SEL_WIDTH-1:0] cache_rcomponent;
    wire    [CACHE_NUM*COMPONENT_NUM-1:0]       cache_rstrb;
    wire    [CACHE_NUM*M_AXI4_DATA_WIDTH-1:0]   cache_rdata;
    wire    [CACHE_NUM-1:0]                     cache_rvalid;
    wire    [CACHE_NUM-1:0]                     cache_rready;
    
    
    generate
    for ( i = 0; i < CACHE_NUM; i = i+1 ) begin : cahce_loop
        
        // strobe
        assign  cache_rstrb[i*COMPONENT_NUM +: COMPONENT_NUM] = (1 << cache_rcomponent[i*COMPONENT_SEL_WIDTH +: COMPONENT_SEL_WIDTH]);
        
        
        // ar pack
        assign cache_arpacket[i*M_AR_PACKET_WIDTH +: M_AR_PACKET_WIDTH] =
                {
                    cache_araddrx[i*ADDR_X_WIDTH +: ADDR_X_WIDTH],
                    cache_araddry[i*ADDR_Y_WIDTH +: ADDR_Y_WIDTH]
                };
        
        // r unpack
        assign {
                    cache_rlast     [i],
                    cache_rcomponent[i*COMPONENT_SEL_WIDTH +: COMPONENT_SEL_WIDTH],
                    cache_rdata     [i*M_AXI4_DATA_WIDTH   +: M_AXI4_DATA_WIDTH]
                }
                    = cache_rpacket[i*M_R_PACKET_WIDTH +: M_R_PACKET_WIDTH];
        
        // cahce
        jelly_texture_cache_unit
                #(
                    .COMPONENT_NUM          (COMPONENT_NUM),
                    .COMPONENT_DATA_WIDTH   (8),
                    
                    .PARALLEL_SIZE          (PARALLEL_SIZE),
                    .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                    .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                    .BLK_X_SIZE             (BLK_X_SIZE),
                    .BLK_Y_SIZE             (BLK_Y_SIZE),
                    .WAY_NUM                (WAY_NUM),
                    .TAG_ADDR_WIDTH         (TAG_ADDR_WIDTH),
                    .TAG_RAM_TYPE           (TAG_RAM_TYPE),
                    .TAG_ALGORITHM          (TAG_ALGORITHM), 
                    .TAG_M_SLAVE_REGS       (TAG_M_SLAVE_REGS),
                    .TAG_M_MASTER_REGS      (TAG_M_MASTER_REGS),
                    .MEM_RAM_TYPE           (MEM_RAM_TYPE),
                    
                    .USE_LOOK_AHEAD         (USE_LOOK_AHEAD),
                    .USE_S_RREADY           (USE_S_RREADY),
                    .USE_M_RREADY           (USE_M_RREADY),
                    
                    .S_USER_WIDTH           (S_ID_WIDTH),
                    .S_DATA_SIZE            (S_DATA_SIZE+COMPONENT_DATA_SIZE),  // AXIにあわせてバイト単位に換算
                    .S_BLK_X_NUM            (S_BLK_X_NUM),
                    .S_BLK_Y_NUM            (S_BLK_Y_NUM),
                    
                    .M_DATA_SIZE            (M_AXI4_DATA_SIZE),
                    .M_INORDER              (0),
                    
                    .QUE_FIFO_PTR_WIDTH     (QUE_FIFO_PTR_WIDTH),
                    .QUE_FIFO_RAM_TYPE      (QUE_FIFO_RAM_TYPE),
                    .QUE_FIFO_S_REGS        (QUE_FIFO_S_REGS),
                    .QUE_FIFO_M_REGS        (QUE_FIFO_M_REGS),
                    
                    .AR_FIFO_PTR_WIDTH      (AR_FIFO_PTR_WIDTH),
                    .AR_FIFO_RAM_TYPE       (AR_FIFO_RAM_TYPE),
                    .AR_FIFO_S_REGS         (AR_FIFO_S_REGS),
                    .AR_FIFO_M_REGS         (AR_FIFO_M_REGS),
                    
                    .R_FIFO_PTR_WIDTH       (R_FIFO_PTR_WIDTH),
                    .R_FIFO_RAM_TYPE        (R_FIFO_RAM_TYPE),
                    .R_FIFO_S_REGS          (R_FIFO_S_REGS),
                    .R_FIFO_M_REGS          (R_FIFO_M_REGS),
                    
                    .LOG_ENABLE             (LOG_ENABLE),
                    .LOG_FILE               (LOG_FILE),
                    .LOG_ID                 (LOG_ID + i)
                )
            i_texture_cache_unit
                (
                    .reset                  (reset),
                    .clk                    (clk),
                    
                    .endian                 (endian),
                    
                    .clear_start            (clear_start),
                    .clear_busy             (cache_clear_busy[i]),
                    
                    .param_blank_value      ({S_DATA_WIDTH{1'b0}}),
                    
                    .status_idle            (status_idle  [i]),
                    .status_stall           (status_stall [i]),
                    .status_access          (status_access[i]),
                    .status_hit             (status_hit   [i]),
                    .status_miss            (status_miss  [i]),
                    .status_blank           (status_blank [i]),
                    
                    .s_aruser               (arbit_arid   [i*S_ID_WIDTH   +: S_ID_WIDTH]),
                    .s_araddrx              (arbit_araddrx[i*ADDR_X_WIDTH +: ADDR_X_WIDTH]),
                    .s_araddry              (arbit_araddry[i*ADDR_Y_WIDTH +: ADDR_Y_WIDTH]),
                    .s_arstrb               (1'b1),
                    .s_arvalid              (arbit_arvalid[i]),
                    .s_arready              (arbit_arready[i]),
                    
                    .s_ruser                (arbit_rid    [i*S_ID_WIDTH   +: S_ID_WIDTH]),
                    .s_rlast                (arbit_rlast  [i]),
                    .s_rdata                (arbit_rdata  [i*S_DATA_WIDTH +: S_DATA_WIDTH]),
                    .s_rstrb                (),
                    .s_rvalid               (arbit_rvalid [i]),
                    .s_rready               (arbit_rready [i]),
                    
                    .m_araddrx              (cache_araddrx[i*ADDR_X_WIDTH +: ADDR_X_WIDTH]),
                    .m_araddry              (cache_araddry[i*ADDR_Y_WIDTH +: ADDR_Y_WIDTH]),
                    .m_arvalid              (cache_arvalid[i]),
                    .m_arready              (cache_arready[i]),
                    
                    .m_rlast                (cache_rlast  [i]),
                    .m_rstrb                (cache_rstrb  [i*COMPONENT_NUM  +: COMPONENT_NUM]),
                    .m_rdata                ({COMPONENT_NUM{cache_rdata[i*M_AXI4_DATA_WIDTH +: M_AXI4_DATA_WIDTH]}}),
                    .m_rvalid               (cache_rvalid [i]),
                    .m_rready               (cache_rready [i])
                );
    end
    endgenerate
    
    
    
    // -----------------------------
    //  Ring-bus
    // -----------------------------
    
    wire    [CACHE_ID_WIDTH-1:0]        ringbus_arid;
    wire    [M_AR_PACKET_WIDTH-1:0]     ringbus_arpacket;
    wire    [ADDR_X_WIDTH-1:0]          ringbus_araddrx;
    wire    [ADDR_Y_WIDTH-1:0]          ringbus_araddry;
    wire                                ringbus_arvalid;
    wire                                ringbus_arready;
    
    wire    [CACHE_ID_WIDTH-1:0]        ringbus_rid;
    wire    [M_R_PACKET_WIDTH-1:0]      ringbus_rpacket;
    wire                                ringbus_rlast;
    wire    [COMPONENT_SEL_WIDTH-1:0]   ringbus_rcomponent;
    wire    [M_AXI4_DATA_WIDTH-1:0]     ringbus_rdata;
    wire                                ringbus_rvalid;
    wire                                ringbus_rready;
    
    // ar unpack
    assign  {ringbus_araddrx, ringbus_araddry} = ringbus_arpacket;
    
    // r pack
    assign ringbus_rpacket = {ringbus_rlast, ringbus_rcomponent, ringbus_rdata};
    
    jelly_data_arbiter_ring_bus
            #(
                .S_NUM              (CACHE_NUM),
                .S_ID_WIDTH         (CACHE_ID_WIDTH),
                .M_NUM              (1),
                .M_ID_WIDTH         (1),
                .DATA_WIDTH         (M_AR_PACKET_WIDTH)
            )
        i_data_arbiter_ring_bus_ar
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_id_to            ({CACHE_NUM{1'b0}}),
                .s_data             (cache_arpacket),
                .s_valid            (cache_arvalid),
                .s_ready            (cache_arready),
                
                .m_id_from          (ringbus_arid),
                .m_data             (ringbus_arpacket),
                .m_valid            (ringbus_arvalid),
                .m_ready            (ringbus_arready)
            );

    jelly_data_switch
            #(
                .NUM                (CACHE_NUM),
                .ID_WIDTH           (CACHE_ID_WIDTH),
                .DATA_WIDTH         (M_R_PACKET_WIDTH),
                .S_REGS             (0),
                .M_REGS             (1)
            )
        i_data_switch_r
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_id               (ringbus_rid),
                .s_data             (ringbus_rpacket),
                .s_valid            (ringbus_rvalid),
                .s_ready            (),
                
                .m_data             (cache_rpacket),
                .m_valid            (cache_rvalid),
                .m_ready            ({CACHE_NUM{1'b1}})
            );
    assign ringbus_rready = 1'b1;
    
    /*
    jelly_data_crossbar_simple
            #(
                .S_NUM              (1),
                .S_ID_WIDTH         (1),
                .M_NUM              (CACHE_NUM),
                .M_ID_WIDTH         (CACHE_ID_WIDTH),
                .DATA_WIDTH         (M_R_PACKET_WIDTH)
            )
        i_data_crossbar_simple_r
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_id_to            (ringbus_rid),
                .s_data             (ringbus_rpacket),
                .s_valid            (ringbus_rvalid),
                
                .m_id_from          (),
                .m_data             (cache_rpacket),
                .m_valid            (cache_rvalid)
            );
    assign ringbus_rready = 1'b1;
    */
    
    /*
    jelly_ring_bus_arbiter_bidirection
            #(
                .S_NUM              (CACHE_NUM),
                .S_ID_WIDTH         (CACHE_ID_WIDTH),
                .M_NUM              (1),
                .M_ID_WIDTH         (1),
                .DOWN_DATA_WIDTH    (M_AR_PACKET_WIDTH),
                .UP_DATA_WIDTH      (M_R_PACKET_WIDTH)
            )
        i_ring_bus_arbiter_bidirection
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_down_id_to       (1'b0),
                .s_down_data        (cache_arpacket),
                .s_down_valid       (cache_arvalid),
                .s_down_ready       (cache_arready),
                .s_up_id_from       (),
                .s_up_data          (cache_rpacket),
                .s_up_valid         (cache_rvalid),
                .s_up_ready         (cache_rready),
                
                .m_down_id_from     (ringbus_arid),
                .m_down_data        (ringbus_arpacket),
                .m_down_valid       (ringbus_arvalid),
                .m_down_ready       (ringbus_arready),
                .m_up_id_to         (ringbus_rid),
                .m_up_data          (ringbus_rpacket),
                .m_up_valid         (ringbus_rvalid),
                .m_up_ready         (ringbus_rready)
            );
    */
    
    
    // -----------------------------
    //  DMA
    // -----------------------------
    
    wire    [ID_WIDTH-1:0]              dma_arid;
    wire    [ADDR_WIDTH-1:0]            dma_araddr;
    wire                                dma_arvalid;
    wire                                dma_arready;
    
    wire    [ID_WIDTH-1:0]              dma_rid;
    wire                                dma_rlast;
    wire    [COMPONENT_SEL_WIDTH-1:0]   dma_rcomponent;
    wire    [M_AXI4_DATA_WIDTH-1:0]     dma_rdata;
    wire                                dma_rvalid;
    wire                                dma_rready;
    
    jelly_texture_cache_dma
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_SEL_WIDTH    (COMPONENT_SEL_WIDTH),
                
                .M_AXI4_ID_WIDTH        (M_AXI4_ID_WIDTH),
                .M_AXI4_ADDR_WIDTH      (M_AXI4_ADDR_WIDTH),
                .M_AXI4_DATA_SIZE       (M_AXI4_DATA_SIZE),
                .M_AXI4_DATA_WIDTH      (M_AXI4_DATA_WIDTH),
                .M_AXI4_LEN_WIDTH       (M_AXI4_LEN_WIDTH),
                .M_AXI4_QOS_WIDTH       (M_AXI4_QOS_WIDTH),
                .M_AXI4_ARSIZE          (M_AXI4_ARSIZE),
                .M_AXI4_ARBURST         (M_AXI4_ARBURST),
                .M_AXI4_ARLOCK          (M_AXI4_ARLOCK),
                .M_AXI4_ARCACHE         (M_AXI4_ARCACHE),
                .M_AXI4_ARPROT          (M_AXI4_ARPROT),
                .M_AXI4_ARQOS           (M_AXI4_ARQOS),
                .M_AXI4_ARREGION        (M_AXI4_ARREGION),
                .M_AXI4_REGS            (M_AXI4_REGS),
                
                .ID_WIDTH               (ID_WIDTH),
                .ADDR_WIDTH             (ADDR_WIDTH),
                .STRIDE_C_WIDTH         (STRIDE_C_WIDTH),
                
                .QUE_FIFO_PTR_WIDTH     (DMA_QUE_FIFO_PTR_WIDTH),
                .QUE_FIFO_RAM_TYPE      (DMA_QUE_FIFO_RAM_TYPE),
                .QUE_FIFO_S_REGS        (DMA_QUE_FIFO_S_REGS),
                .QUE_FIFO_M_REGS        (DMA_QUE_FIFO_M_REGS),
                
                .S_AR_REGS              (DMA_S_AR_REGS),
                .S_R_REGS               (DMA_S_R_REGS)
            )
        i_texture_cache_dma
            (
                .reset                  (reset),
                .clk                    (clk),
                                         
                .param_addr             (param_addr),
                .param_arlen            (param_arlen),
                .param_stride_c         (param_stride_c),
                
                .s_arid                 (dma_arid),
                .s_araddr               (dma_araddr),
                .s_arvalid              (dma_arvalid),
                .s_arready              (dma_arready),
                .s_rid                  (dma_rid),
                .s_rlast                (dma_rlast),
                .s_rcomponent           (dma_rcomponent),
                .s_rdata                (dma_rdata),
                .s_rvalid               (dma_rvalid),
                .s_rready               (dma_rready),
                
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
    
    reg     [ID_WIDTH-1:0]      st0_dma_arid;
    reg     [ADDR_WIDTH-1:0]    st0_dma_araddry;
    reg     [ADDR_WIDTH-1:0]    st0_dma_araddrx;
    reg                         st0_dma_arvalid;
    
    reg     [ID_WIDTH-1:0]      st1_dma_arid;
    reg     [ADDR_WIDTH-1:0]    st1_dma_araddry;
    reg     [ADDR_WIDTH-1:0]    st1_dma_araddrx;
    reg                         st1_dma_arvalid;
    
    reg     [ID_WIDTH-1:0]      st2_dma_arid;
    reg     [ADDR_WIDTH-1:0]    st2_dma_araddr;
    reg                         st2_dma_arvalid;
    always @(posedge clk) begin
        if ( reset ) begin
            st0_dma_arid    <= {ID_WIDTH{1'bx}};
            st0_dma_araddry <= {ADDR_WIDTH{1'bx}};
            st0_dma_araddrx <= {ADDR_WIDTH{1'bx}};
            st0_dma_arvalid <= 1'b0;
            
            st1_dma_arid    <= {ID_WIDTH{1'bx}};
            st1_dma_araddry <= {ADDR_WIDTH{1'bx}};
            st1_dma_araddrx <= {ADDR_WIDTH{1'bx}};
            st1_dma_arvalid <= 1'b0;
            
            st2_dma_arid    <= {ID_WIDTH{1'bx}};
            st2_dma_araddr  <= {ADDR_WIDTH{1'bx}};
            st2_dma_arvalid <= 1'b0;
        end
        else if ( !dma_arvalid || dma_arready ) begin
            st0_dma_arid    <= ringbus_arid;
            st0_dma_araddry <= ((ringbus_araddry >> BLK_Y_SIZE) * param_stride_y);  // + (ringbus_araddrx << (BLK_Y_SIZE + BLK_X_SIZE));
            st0_dma_araddrx <= ((ringbus_araddrx >> BLK_X_SIZE) * param_stride_x);
            st0_dma_arvalid <= ringbus_arvalid;
            
            st1_dma_arid    <= st0_dma_arid;
            st1_dma_araddry <= st0_dma_araddry;
            st1_dma_araddrx <= st0_dma_araddrx;
            st1_dma_arvalid <= st0_dma_arvalid;
            
            st2_dma_arid    <= st1_dma_arid;
            st2_dma_araddr  <= st1_dma_araddry + st1_dma_araddrx;
            st2_dma_arvalid <= st1_dma_arvalid; 
        end
    end
    
    assign dma_arid           = st2_dma_arid;
    assign dma_araddr         = st2_dma_araddr;
    assign dma_arvalid        = st2_dma_arvalid;
    assign ringbus_arready    = (!dma_arvalid || dma_arready);
    
    assign ringbus_rid        = dma_rid;
    assign ringbus_rlast      = dma_rlast;
    assign ringbus_rcomponent = dma_rcomponent;
    assign ringbus_rdata      = dma_rdata;
    assign ringbus_rvalid     = dma_rvalid;
    assign dma_rready         = ringbus_rready;
    
    
endmodule


`default_nettype wire


// end of file
