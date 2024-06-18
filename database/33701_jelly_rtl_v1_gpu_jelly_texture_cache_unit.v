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



module jelly_texture_cache_unit
        #(
            parameter   COMPONENT_NUM        = 1,
            parameter   COMPONENT_DATA_WIDTH = 24,
            
            parameter   PARALLEL_SIZE        = 0,
            parameter   ADDR_X_WIDTH         = 12,
            parameter   ADDR_Y_WIDTH         = 12,
            parameter   BLK_X_SIZE           = 2,   // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   BLK_Y_SIZE           = 2,   // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   WAY_NUM              = 1,
            parameter   TAG_ADDR_WIDTH       = 6,
            parameter   TAG_RAM_TYPE         = "distributed",
            parameter   TAG_ALGORITHM        = PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
            parameter   TAG_M_SLAVE_REGS     = 0,
            parameter   TAG_M_MASTER_REGS    = 0,

            parameter   MEM_RAM_TYPE         = "block",
            
            parameter   USE_LOOK_AHEAD       = 1,
            parameter   USE_S_RREADY         = 1,   // 0: s_rready is always 1'b1.   1: handshake mode.
            parameter   USE_M_RREADY         = 0,   // 0: m_rready is always 1'b1.   1: handshake mode.
            
            parameter   S_USER_WIDTH         = 1,
            parameter   S_DATA_SIZE          = 0,
            parameter   S_BLK_X_NUM          = 1,
            parameter   S_BLK_Y_NUM          = 1,
            
            parameter   M_DATA_SIZE          = 1,
            parameter   M_INORDER            = 1,
            parameter   M_INORDER_DATA_FIRST = 0,
            
            parameter   QUE_FIFO_PTR_WIDTH   = USE_LOOK_AHEAD ? BLK_Y_SIZE + BLK_X_SIZE : 0,
            parameter   QUE_FIFO_RAM_TYPE    = "distributed",
            parameter   QUE_FIFO_S_REGS      = 0,
            parameter   QUE_FIFO_M_REGS      = 0,
            
            parameter   AR_FIFO_PTR_WIDTH    = 0,
            parameter   AR_FIFO_RAM_TYPE     = "distributed",
            parameter   AR_FIFO_S_REGS       = 0,
            parameter   AR_FIFO_M_REGS       = 0,
            
            parameter   R_FIFO_PTR_WIDTH     = BLK_Y_SIZE + BLK_X_SIZE - M_DATA_SIZE,
            parameter   R_FIFO_RAM_TYPE      = "distributed",
            parameter   R_FIFO_S_REGS        = 0,
            parameter   R_FIFO_M_REGS        = 0,
            
            parameter   LOG_ENABLE           = 0,
            parameter   LOG_FILE             = "cache_log.txt",
            parameter   LOG_ID               = 0,
            
            // local
            parameter   S_DATA_WIDTH         = ((COMPONENT_NUM * COMPONENT_DATA_WIDTH) << S_DATA_SIZE),
            parameter   M_DATA_WIDTH         = ((COMPONENT_NUM * COMPONENT_DATA_WIDTH) << M_DATA_SIZE),
            parameter   M_STRB_WIDTH         = COMPONENT_NUM
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            endian,
            
            input   wire                            clear_start,
            output  wire                            clear_busy,
            
            input   wire    [S_DATA_WIDTH-1:0]      param_blank_value,
            
            output  wire                            status_idle,
            output  wire                            status_stall,
            output  wire                            status_access,
            output  wire                            status_hit,
            output  wire                            status_miss,
            output  wire                            status_blank,
            
            input   wire    [S_USER_WIDTH-1:0]      s_aruser,
            input   wire    [ADDR_X_WIDTH-1:0]      s_araddrx,
            input   wire    [ADDR_Y_WIDTH-1:0]      s_araddry,
            input   wire                            s_arstrb,
            input   wire                            s_arvalid,
            output  wire                            s_arready,
            output  wire    [S_USER_WIDTH-1:0]      s_ruser,
            output  wire                            s_rlast,
            output  wire    [S_DATA_WIDTH-1:0]      s_rdata,
            output  wire                            s_rstrb,
            output  wire                            s_rvalid,
            input   wire                            s_rready,
            
            
            output  wire    [ADDR_X_WIDTH-1:0]      m_araddrx,
            output  wire    [ADDR_Y_WIDTH-1:0]      m_araddry,
            output  wire                            m_arvalid,
            input   wire                            m_arready,
            input   wire                            m_rlast,
            input   wire    [M_STRB_WIDTH-1:0]      m_rstrb,
            input   wire    [M_DATA_WIDTH-1:0]      m_rdata,
            input   wire                            m_rvalid,
            output  wire                            m_rready
        );
        
    generate
    if ( USE_LOOK_AHEAD ) begin : blk_lookahead
        jelly_texture_cache_lookahead
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_WIDTH   (COMPONENT_DATA_WIDTH),
                
                .PARALLEL_SIZE          (PARALLEL_SIZE),
                .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                .BLK_X_SIZE             (BLK_X_SIZE),
                .BLK_Y_SIZE             (BLK_Y_SIZE),
                .WAY_NUM                (WAY_NUM),
                .TAG_ADDR_WIDTH         (TAG_ADDR_WIDTH),
                .TAG_RAM_TYPE           (TAG_RAM_TYPE),
                .TAG_M_SLAVE_REGS       (TAG_M_SLAVE_REGS),
                .TAG_M_MASTER_REGS      (TAG_M_MASTER_REGS),
                .TAG_ALGORITHM          (TAG_ALGORITHM),
                .MEM_RAM_TYPE           (MEM_RAM_TYPE),
                
                .USE_S_RREADY           (USE_S_RREADY),
                .USE_M_RREADY           (USE_M_RREADY),
                
                .S_USER_WIDTH           (S_USER_WIDTH),
                .S_DATA_SIZE            (S_DATA_SIZE),
                .S_BLK_X_NUM            (S_BLK_X_NUM),
                .S_BLK_Y_NUM            (S_BLK_Y_NUM),
                
                .M_DATA_SIZE            (M_DATA_SIZE),
                .M_INORDER              (M_INORDER),
                .M_INORDER_DATA_FIRST   (M_INORDER_DATA_FIRST),
                
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
                .LOG_ID                 (LOG_ID)
            )
        i_texture_cache_lookahead
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (endian),
                
                .clear_start            (clear_start),
                .clear_busy             (clear_busy),
                
                .param_blank_value      (param_blank_value),
                
                .status_idle            (status_idle),
                .status_stall           (status_stall),
                .status_access          (status_access),
                .status_hit             (status_hit),
                .status_miss            (status_miss),
                .status_blank           (status_blank),
                
                .s_aruser               (s_aruser),
                .s_araddrx              (s_araddrx),
                .s_araddry              (s_araddry),
                .s_arstrb               (s_arstrb),
                .s_arvalid              (s_arvalid),
                .s_arready              (s_arready),
                .s_ruser                (s_ruser),
                .s_rlast                (s_rlast),
                .s_rdata                (s_rdata),
                .s_rstrb                (s_rstrb),
                .s_rvalid               (s_rvalid),
                .s_rready               (s_rready),
                
                .m_araddrx              (m_araddrx),
                .m_araddry              (m_araddry),
                .m_arvalid              (m_arvalid),
                .m_arready              (m_arready),
                .m_rlast                (m_rlast),
                .m_rstrb                (m_rstrb),
                .m_rdata                (m_rdata),
                .m_rvalid               (m_rvalid),
                .m_rready               (m_rready)
            );
    end
    else begin : blk_basic
        jelly_texture_cache_basic
            #(
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_WIDTH   (COMPONENT_DATA_WIDTH),
                
                .PARALLEL_SIZE          (PARALLEL_SIZE),
                .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                .BLK_X_SIZE             (BLK_X_SIZE),
                .BLK_Y_SIZE             (BLK_Y_SIZE),
                .WAY_NUM                (WAY_NUM),
                .TAG_ADDR_WIDTH         (TAG_ADDR_WIDTH),
                .TAG_RAM_TYPE           (TAG_RAM_TYPE),
                .TAG_M_SLAVE_REGS       (TAG_M_SLAVE_REGS),
                .TAG_M_MASTER_REGS      (TAG_M_MASTER_REGS),
                .MEM_RAM_TYPE           (MEM_RAM_TYPE),
                
                .USE_S_RREADY           (USE_S_RREADY),
                .USE_M_RREADY           (USE_M_RREADY),
                
                .S_USER_WIDTH           (S_USER_WIDTH),
                .S_DATA_SIZE            (S_DATA_SIZE),
                .S_BLK_X_NUM            (S_BLK_X_NUM),
                .S_BLK_Y_NUM            (S_BLK_Y_NUM),
                
                .M_DATA_SIZE            (M_DATA_SIZE),
                
                .QUE_FIFO_PTR_WIDTH     (QUE_FIFO_PTR_WIDTH),
                .QUE_FIFO_RAM_TYPE      (QUE_FIFO_RAM_TYPE),
                .QUE_FIFO_S_REGS        (QUE_FIFO_S_REGS),
                .QUE_FIFO_M_REGS        (QUE_FIFO_M_REGS),
                
                .LOG_ENABLE             (LOG_ENABLE),
                .LOG_FILE               (LOG_FILE),
                .LOG_ID                 (LOG_ID)
            )
        i_texture_cache_basic
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (endian),
                
                .clear_start            (clear_start),
                .clear_busy             (clear_busy),
                
                .param_blank_value      (param_blank_value),
                
                .status_idle            (status_idle),
                .status_stall           (status_stall),
                .status_access          (status_access),
                .status_hit             (status_hit),
                .status_miss            (status_miss),
                .status_blank           (status_blank),
                
                .s_aruser               (s_aruser),
                .s_araddrx              (s_araddrx),
                .s_araddry              (s_araddry),
                .s_arstrb               (s_arstrb),
                .s_arvalid              (s_arvalid),
                .s_arready              (s_arready),
                .s_ruser                (s_ruser),
                .s_rlast                (s_rlast),
                .s_rdata                (s_rdata),
                .s_rstrb                (s_rstrb),
                .s_rvalid               (s_rvalid),
                .s_rready               (s_rready),
                
                .m_araddrx              (m_araddrx),
                .m_araddry              (m_araddry),
                .m_arvalid              (m_arvalid),
                .m_arready              (m_arready),
                .m_rlast                (m_rlast),
                .m_rstrb                (m_rstrb),
                .m_rdata                (m_rdata),
                .m_rvalid               (m_rvalid),
                .m_rready               (m_rready)
            );
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
