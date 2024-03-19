// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_texture_cache_basic
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
            
            parameter   USE_S_RREADY         = 1,   // 0: s_rready is always 1'b1.   1: handshake mode.
            parameter   USE_M_RREADY         = 0,   // 0: m_rready is always 1'b1.   1: handshake mode.
            
            parameter   S_USER_WIDTH         = 1,
            parameter   S_DATA_SIZE          = 0,
            parameter   S_BLK_X_NUM          = 1,
            parameter   S_BLK_Y_NUM          = 1,
            
            parameter   M_DATA_SIZE          = 1,
            
            parameter   QUE_FIFO_PTR_WIDTH   = 0,
            parameter   QUE_FIFO_RAM_TYPE    = "distributed",
            parameter   QUE_FIFO_S_REGS      = 0,
            parameter   QUE_FIFO_M_REGS      = 0,
            
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
    
    
    // ---------------------------------
    //  localparam
    // ---------------------------------
    
    localparam  PIX_ADDR_X_WIDTH     = BLK_X_SIZE;
    localparam  PIX_ADDR_Y_WIDTH     = BLK_Y_SIZE;
    localparam  BLK_ADDR_X_WIDTH     = ADDR_X_WIDTH - BLK_X_SIZE;
    localparam  BLK_ADDR_Y_WIDTH     = ADDR_Y_WIDTH - BLK_Y_SIZE;
    
    
    // ---------------------------------
    //  Queueing
    // ---------------------------------
    
    wire    [S_USER_WIDTH-1:0]      que_aruser;
    wire    [ADDR_X_WIDTH-1:0]      que_araddrx;
    wire    [ADDR_Y_WIDTH-1:0]      que_araddry;
    wire                            que_arstrb;
    wire                            que_arvalid;
    wire                            que_arready;
    
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH         (S_USER_WIDTH+1+ADDR_X_WIDTH+ADDR_Y_WIDTH),
                .PTR_WIDTH          (QUE_FIFO_PTR_WIDTH),
                .RAM_TYPE           (QUE_FIFO_RAM_TYPE),
                .SLAVE_REGS         (QUE_FIFO_S_REGS),
                .MASTER_REGS        (QUE_FIFO_M_REGS)
            )
        i_fifo_fwtf_que
            (
                .reset              (reset),
                .clk                (clk),
                
                .s_data             ({s_aruser, s_arstrb, s_araddrx, s_araddry}),
                .s_valid            (s_arvalid),
                .s_ready            (s_arready),
                .s_free_count       (),
                
                .m_data             ({que_aruser, que_arstrb, que_araddrx, que_araddry}),
                .m_valid            (que_arvalid),
                .m_ready            (que_arready),
                .m_data_count       ()
            );
    
    // ---------------------------------
    //  block addr
    // ---------------------------------
    
    wire    [S_USER_WIDTH-1:0]      blkaddr_aruser;
    wire                            blkaddr_arlast;
    wire    [ADDR_X_WIDTH-1:0]      blkaddr_araddrx;
    wire    [ADDR_Y_WIDTH-1:0]      blkaddr_araddry;
    wire                            blkaddr_arstrb;
    wire                            blkaddr_arvalid;
    wire                            blkaddr_arready;
    
    jelly_texture_blk_addr
            #(
                .USER_WIDTH             (S_USER_WIDTH+1),
                
                .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                
                .DATA_SIZE              (S_DATA_SIZE),
                
                .BLK_X_NUM              (S_BLK_X_NUM),
                .BLK_Y_NUM              (S_BLK_Y_NUM)
            )
        i_texture_blk_addr
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .s_user                 ({que_aruser, que_arstrb}),
                .s_addrx                (que_araddrx),
                .s_addry                (que_araddry),
                .s_valid                (que_arvalid),
                .s_ready                (que_arready),
                
                .m_user                 ({blkaddr_aruser, blkaddr_arstrb}),
                .m_last                 (blkaddr_arlast),
                .m_addrx                (blkaddr_araddrx),
                .m_addry                (blkaddr_araddry),
                .m_valid                (blkaddr_arvalid),
                .m_ready                (blkaddr_arready)
            );
    
    
    // ---------------------------------
    //  TAG-RAM access
    // ---------------------------------
    
    localparam  WAY_WIDTH        = WAY_NUM <=   1 ? 0 :
                                   WAY_NUM <=   2 ? 1 :
                                   WAY_NUM <=   4 ? 2 :
                                   WAY_NUM <=   8 ? 3 :
                                   WAY_NUM <=  16 ? 4 :
                                   WAY_NUM <=  32 ? 5 :
                                   WAY_NUM <=  64 ? 6 :
                                   WAY_NUM <= 128 ? 7 : 8;
    
    localparam  TBL_ADDR_WIDTH   = TAG_ADDR_WIDTH + WAY_WIDTH;
    
    
    wire        [S_USER_WIDTH-1:0]      tagram_user;
    wire                                tagram_last;
    wire        [TBL_ADDR_WIDTH-1:0]    tagram_tbl_addr;
    wire        [PIX_ADDR_X_WIDTH-1:0]  tagram_pix_addrx;
    wire        [PIX_ADDR_Y_WIDTH-1:0]  tagram_pix_addry;
    wire        [BLK_ADDR_X_WIDTH-1:0]  tagram_blk_addrx;
    wire        [BLK_ADDR_Y_WIDTH-1:0]  tagram_blk_addry;
    wire                                tagram_cache_hit;
    wire                                tagram_strb;
    wire                                tagram_valid;
    wire                                tagram_ready;
    
    jelly_texture_cache_tag
            #(
                .USER_WIDTH             (S_USER_WIDTH),
                
                .ADDR_X_WIDTH           (ADDR_X_WIDTH),
                .ADDR_Y_WIDTH           (ADDR_Y_WIDTH),
                
                .PARALLEL_SIZE          (PARALLEL_SIZE),
                .WAY_NUM                (WAY_NUM),
                .TAG_ADDR_WIDTH         (TAG_ADDR_WIDTH),
                .TBL_ADDR_WIDTH         (TBL_ADDR_WIDTH),
                .BLK_X_SIZE             (BLK_X_SIZE),
                .BLK_Y_SIZE             (BLK_Y_SIZE),
                .RAM_TYPE               (TAG_RAM_TYPE),
                
                .M_SLAVE_REGS           (TAG_M_SLAVE_REGS),
                .M_MASTER_REGS          (TAG_M_MASTER_REGS),
                
                .LOG_ENABLE             (LOG_ENABLE),
                .LOG_FILE               (LOG_FILE),
                .LOG_ID                 (LOG_ID)
            )
        i_texture_cache_tag
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .clear_start            (clear_start),
                .clear_busy             (clear_busy),
                
                .s_user                 (blkaddr_aruser),
                .s_last                 (blkaddr_arlast),
                .s_addrx                (blkaddr_araddrx),
                .s_addry                (blkaddr_araddry),
                .s_strb                 (blkaddr_arstrb),
                .s_valid                (blkaddr_arvalid),
                .s_ready                (blkaddr_arready),
                
                .m_user                 (tagram_user),
                .m_last                 (tagram_last),
                .m_tbl_addr             (tagram_tbl_addr),
                .m_pix_addrx            (tagram_pix_addrx),
                .m_pix_addry            (tagram_pix_addry),
                .m_blk_addrx            (tagram_blk_addrx),
                .m_blk_addry            (tagram_blk_addry),
                .m_cache_hit            (tagram_cache_hit),
                .m_strb                 (tagram_strb),
                .m_valid                (tagram_valid),
                .m_ready                (tagram_ready)
            );
    
    
    // ---------------------------------
    //  cahce miss read control
    // ---------------------------------
    
    localparam  USE_WAIT       = !USE_M_RREADY && USE_S_RREADY;
    
    localparam  PIX_ADDR_WIDTH = PIX_ADDR_Y_WIDTH + PIX_ADDR_X_WIDTH;
    
    wire                                mem_busy;
    wire                                mem_ready;
    
    reg                                 reg_tagram_ready;
    
    reg     [S_USER_WIDTH-1:0]          reg_user;
    reg                                 reg_last;
    reg     [TBL_ADDR_WIDTH-1:0]        reg_tbl_addr;
    reg     [PIX_ADDR_WIDTH-1:0]        reg_pix_addr;
    reg     [PIX_ADDR_X_WIDTH-1:0]      reg_pix_addrx;
    reg     [PIX_ADDR_Y_WIDTH-1:0]      reg_pix_addry;
    reg     [BLK_ADDR_X_WIDTH-1:0]      reg_blk_addrx;
    reg     [BLK_ADDR_Y_WIDTH-1:0]      reg_blk_addry;
    reg                                 reg_range_out;
    reg                                 reg_strb;
    reg                                 reg_valid;
    
    reg     [COMPONENT_NUM-1:0]         reg_we;
    reg                                 reg_wlast;
    reg     [M_DATA_WIDTH-1:0]          reg_wdata;
    
    reg                                 reg_m_wait;
    reg                                 reg_m_arvalid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_tagram_ready <= 1'b1;
            
            reg_user         <= {S_USER_WIDTH{1'bx}};
            reg_last         <= 1'bx;
            reg_tbl_addr     <= {TBL_ADDR_WIDTH{1'bx}};
            reg_pix_addr     <= {PIX_ADDR_WIDTH{1'bx}};
            reg_pix_addrx    <= {PIX_ADDR_X_WIDTH{1'bx}};
            reg_pix_addry    <= {PIX_ADDR_Y_WIDTH{1'bx}};
            reg_blk_addrx    <= {BLK_ADDR_X_WIDTH{1'bx}};
            reg_blk_addry    <= {BLK_ADDR_Y_WIDTH{1'bx}};
            reg_strb         <= 1'bx;
            reg_valid        <= 1'b0;
            
            reg_we           <= {COMPONENT_NUM{1'b0}};
            reg_wlast        <= 1'bx;
            reg_wdata        <= {M_DATA_WIDTH{1'bx}};
            
            reg_m_wait       <= 1'b0;
            reg_m_arvalid    <= 1'b0;
        end
        else begin
            // araddr request complete
            if ( m_arready ) begin
                reg_m_arvalid <= 1'b0;
            end
            
            // memory stage request receive
            if ( mem_ready ) begin
                reg_valid <= 1'b0;
                reg_we    <= {COMPONENT_NUM{1'b0}};
            end
            
            // rdata receive
            if ( m_rvalid && m_rready ) begin
                reg_we    <= m_rstrb;
                reg_wlast <= m_rlast;
                reg_wdata <= m_rdata;
            end
            
            // m_arvalid
            if ( reg_m_wait && !mem_busy ) begin
                reg_m_wait    <= 1'b0;
                reg_m_arvalid <= 1'b1;
            end
            
            // write
            if ( (reg_we != 0) && mem_ready ) begin
                reg_pix_addr <= reg_pix_addr + (1 << M_DATA_SIZE);
                
                if ( reg_wlast ) begin
                    // write end
                    reg_pix_addr     <= {reg_pix_addry, reg_pix_addrx};
                    reg_valid        <= 1'b1;
                    reg_tagram_ready <= 1'b1;
                end
            end
            
            if ( tagram_valid && tagram_ready ) begin
                if ( !tagram_cache_hit && tagram_strb ) begin
                    // cache miss
                    reg_tagram_ready <= 1'b0;
                    reg_m_arvalid    <= (!USE_WAIT || !mem_busy);
                    reg_m_wait       <= (USE_WAIT && mem_busy);
                    reg_pix_addr     <= {PIX_ADDR_WIDTH{1'b0}};
                    reg_valid        <= 1'b0;
                end
                else begin
                    // cache hit
                    reg_m_arvalid    <= 1'b0;
                    reg_pix_addr     <= {tagram_pix_addry, tagram_pix_addrx};
                    reg_valid        <= tagram_valid;
                end
                
                reg_tbl_addr   <= tagram_tbl_addr;
            end
            
            if ( tagram_ready ) begin
                reg_user      <= tagram_user;
                reg_last      <= tagram_last;
                reg_strb      <= tagram_strb;
                reg_pix_addrx <= tagram_pix_addrx;
                reg_pix_addry <= tagram_pix_addry;
                reg_blk_addrx <= tagram_blk_addrx;
                reg_blk_addry <= tagram_blk_addry;
            end
        end
    end
    
    assign tagram_ready = (reg_tagram_ready && (!reg_valid || mem_ready));
    
    assign m_araddrx    = (reg_blk_addrx << BLK_X_SIZE);
    assign m_araddry    = (reg_blk_addry << BLK_Y_SIZE);
    assign m_arvalid    = reg_m_arvalid;
    
    assign m_rready     = (USE_WAIT || mem_ready);
    
    
    // status
    assign status_idle      = !tagram_valid;
    assign status_stall     = !tagram_ready && !status_access;
    assign status_access    = !reg_tagram_ready;
    assign status_hit       = (tagram_valid && tagram_ready && tagram_cache_hit);
    assign status_miss      = (tagram_valid && tagram_ready && (!tagram_cache_hit && tagram_strb));
    assign status_blank     = (tagram_valid && tagram_ready && tagram_strb);
    
    
    // ---------------------------------
    //  cahce memory
    // ---------------------------------
    
    jelly_texture_cache_mem
            #(
                .USER_WIDTH             (S_USER_WIDTH),
                .COMPONENT_NUM          (COMPONENT_NUM),
                .COMPONENT_DATA_WIDTH   (COMPONENT_DATA_WIDTH),
                .TBL_ADDR_WIDTH         (TBL_ADDR_WIDTH),
                .TBL_MEM_SIZE           (WAY_NUM * (1 << TAG_ADDR_WIDTH)),
                .PIX_ADDR_WIDTH         (PIX_ADDR_WIDTH),
                .M_DATA_SIZE            (S_DATA_SIZE),
                .S_DATA_SIZE            (M_DATA_SIZE),
                .RAM_TYPE               (MEM_RAM_TYPE)
            )
        i_texture_cache_mem
            (
                .reset                  (reset),
                .clk                    (clk),
                
                .endian                 (endian),
                
                .busy                   (mem_busy),
                
                .param_blank_value      (param_blank_value),
                
                .s_last                 (reg_last),
                .s_user                 (reg_user),
                .s_we                   (reg_we),
                .s_wdata                (reg_wdata),
                .s_tbl_addr             (reg_tbl_addr),
                .s_pix_addr             (reg_pix_addr),
                .s_strb                 (reg_strb),
                .s_valid                (reg_valid),
                .s_ready                (mem_ready),
                
                .m_user                 (s_ruser),
                .m_last                 (s_rlast),
                .m_data                 (s_rdata),
                .m_strb                 (s_rstrb),
                .m_valid                (s_rvalid),
                .m_ready                (USE_S_RREADY ? s_rready : 1'b1)
            );
    
endmodule



`default_nettype wire


// end of file
