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



module jelly_texture_cache_tag
        #(
            parameter   USER_WIDTH       = 1,
            
            parameter   ADDR_X_WIDTH     = 12,
            parameter   ADDR_Y_WIDTH     = 12,
            
            parameter   PARALLEL_SIZE    = 0,
            parameter   WAY_NUM          = 1,
            parameter   WAY_WIDTH        = WAY_NUM <=   1 ? 0 :
                                           WAY_NUM <=   2 ? 1 :
                                           WAY_NUM <=   4 ? 2 :
                                           WAY_NUM <=   8 ? 3 :
                                           WAY_NUM <=  16 ? 4 :
                                           WAY_NUM <=  32 ? 5 :
                                           WAY_NUM <=  64 ? 6 :
                                           WAY_NUM <= 128 ? 7 : 8,
            
            parameter   TAG_ADDR_WIDTH   = 6,
            parameter   TBL_ADDR_WIDTH   = TAG_ADDR_WIDTH + WAY_WIDTH,
            
            parameter   BLK_X_SIZE       = 2,   // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   BLK_Y_SIZE       = 2,   // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            
            parameter   RAM_TYPE         = "distributed",
            
            parameter   ALGORITHM        = PARALLEL_SIZE > 0 ? "SUDOKU" : "TWIST",
            
            parameter   M_SLAVE_REGS     = 0,
            parameter   M_MASTER_REGS    = 0,
            
            parameter   LOG_ENABLE       = 0,
            parameter   LOG_FILE         = "cache_log.txt",
            parameter   LOG_ID           = 0,
            
            // local
            parameter   USER_BITS        = USER_WIDTH > 0 ? USER_WIDTH : 1,
            parameter   PIX_ADDR_X_WIDTH = BLK_X_SIZE,
            parameter   PIX_ADDR_Y_WIDTH = BLK_Y_SIZE,
            parameter   BLK_ADDR_X_WIDTH = ADDR_X_WIDTH - BLK_X_SIZE,
            parameter   BLK_ADDR_Y_WIDTH = ADDR_Y_WIDTH - BLK_Y_SIZE
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            
            input   wire                            clear_start,
            output  wire                            clear_busy,
            
            input   wire    [USER_BITS-1:0]         s_user,
            input   wire                            s_last,
            input   wire    [ADDR_X_WIDTH-1:0]      s_addrx,
            input   wire    [ADDR_Y_WIDTH-1:0]      s_addry,
            input   wire                            s_strb,
            input   wire                            s_valid,
            output  wire                            s_ready,
            
            output  wire    [USER_BITS-1:0]         m_user,
            output  wire                            m_last,
            output  wire    [TBL_ADDR_WIDTH-1:0]    m_tbl_addr,
            output  wire    [PIX_ADDR_X_WIDTH-1:0]  m_pix_addrx,
            output  wire    [PIX_ADDR_Y_WIDTH-1:0]  m_pix_addry,
            output  wire    [BLK_ADDR_X_WIDTH-1:0]  m_blk_addrx,
            output  wire    [BLK_ADDR_Y_WIDTH-1:0]  m_blk_addry,
            output  wire                            m_cache_hit,
            output  wire                            m_strb,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    
    localparam  INDEX_WIDTH = ALGORITHM == "NORMAL" ? BLK_ADDR_Y_WIDTH + BLK_ADDR_X_WIDTH - TAG_ADDR_WIDTH : BLK_ADDR_Y_WIDTH + BLK_ADDR_X_WIDTH;
    localparam  WAY_BITS    = WAY_WIDTH      > 0 ? WAY_WIDTH      : 1;
    localparam  TAG_BITS    = TAG_ADDR_WIDTH > 0 ? TAG_ADDR_WIDTH : 1;
    
    
    // ---------------------------------
    //  INDEX
    // ---------------------------------
    
    wire    [PIX_ADDR_X_WIDTH-1:0]  s_pix_addrx = s_addrx[BLK_X_SIZE-1:0];
    wire    [PIX_ADDR_Y_WIDTH-1:0]  s_pix_addry = s_addry[BLK_Y_SIZE-1:0];
    wire    [BLK_ADDR_X_WIDTH-1:0]  s_blk_addrx = s_addrx[ADDR_X_WIDTH-1:BLK_X_SIZE];
    wire    [BLK_ADDR_Y_WIDTH-1:0]  s_blk_addry = s_addry[ADDR_Y_WIDTH-1:BLK_Y_SIZE];
    
    //  tag addr & index
    wire    [TAG_BITS-1:0]          s_tag_addr;
    wire    [INDEX_WIDTH-1:0]       s_index;
    
    jelly_texture_cache_tag_addr
            #(
                .PARALLEL_SIZE      (PARALLEL_SIZE),
                
                .ADDR_X_WIDTH       (BLK_ADDR_X_WIDTH),
                .ADDR_Y_WIDTH       (BLK_ADDR_Y_WIDTH),
                .TAG_ADDR_WIDTH     (TAG_ADDR_WIDTH),
                
                .ALGORITHM          (ALGORITHM)
            )
        i_texture_cache_tag_addr
            (
                .addrx              (s_blk_addrx),
                .addry              (s_blk_addry),
                
                .unit_id            (),
                .tag_addr           (s_tag_addr),
                .index              (s_index)
            );
    
    
    // ---------------------------------
    //  TAG RAM
    // ---------------------------------
    
    
    wire                            cke;
    
    wire    [USER_BITS-1:0]         tag_user;
    wire                            tag_last;
    wire    [TBL_ADDR_WIDTH-1:0]    tag_tbl_addr;
    wire    [PIX_ADDR_X_WIDTH-1:0]  tag_pix_addrx;
    wire    [PIX_ADDR_Y_WIDTH-1:0]  tag_pix_addry;
    wire    [BLK_ADDR_X_WIDTH-1:0]  tag_blk_addrx;
    wire    [BLK_ADDR_Y_WIDTH-1:0]  tag_blk_addry;
    wire                            tag_cache_hit;
    wire                            tag_strb;
    wire                            tag_valid;
    wire                            tag_ready;
    
    wire    [INDEX_WIDTH-1:0]       tag_index;
    wire    [WAY_BITS-1:0]          tag_way;
    wire    [TAG_BITS-1:0]          tag_tag;
    
    jelly_cache_tag
            #(
                .USER_WIDTH     (USER_BITS + 1 + PIX_ADDR_X_WIDTH + PIX_ADDR_Y_WIDTH + BLK_ADDR_Y_WIDTH + BLK_ADDR_X_WIDTH),
                .WAY_NUM        (WAY_NUM),
                .WAY_WIDTH      (WAY_WIDTH),
                .INDEX_WIDTH    (INDEX_WIDTH),
                .TAG_WIDTH      (TAG_ADDR_WIDTH),
                .ADDR_WIDTH     (TBL_ADDR_WIDTH),
                .RAM_TYPE       (RAM_TYPE)
            )
        i_cache_tag
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .clear_start    (clear_start),
                .clear_busy     (clear_busy),
                
                .s_user         ({
                                    s_user,
                                    s_last,
                                    s_pix_addrx,
                                    s_pix_addry,
                                    s_blk_addrx,
                                    s_blk_addry
                                }),
                .s_index        (s_index),
                .s_tag          (s_tag_addr),
                .s_strb         (s_strb),
                .s_valid        (s_valid),
                
                .m_user         ({
                                    tag_user,
                                    tag_last,
                                    tag_pix_addrx,
                                    tag_pix_addry,
                                    tag_blk_addrx,
                                    tag_blk_addry
                                }),
                .m_index        (tag_index),
                .m_way          (tag_way),
                .m_tag          (tag_tag),
                .m_addr         (tag_tbl_addr),
                .m_hit          (tag_cache_hit),
                .m_strb         (tag_strb),
                .m_valid        (tag_valid)
            );
    
    assign cke     = tag_ready || !tag_valid;
//  assign cke     = tag_ready;
    
    assign s_ready = cke;
    
    // output
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (USER_BITS+1+1+TBL_ADDR_WIDTH+PIX_ADDR_X_WIDTH+PIX_ADDR_Y_WIDTH+BLK_ADDR_X_WIDTH+BLK_ADDR_Y_WIDTH+1),
                .SLAVE_REGS         (M_SLAVE_REGS),
                .MASTER_REGS        (M_MASTER_REGS)
            )
        i_pipeline_insert_ff
            (
                .reset              (reset),
                .clk                (clk),
                .cke                (1'b1),
                
                .s_data             ({
                                        tag_user,
                                        tag_last,
                                        tag_strb,
                                        tag_tbl_addr,
                                        tag_pix_addrx,
                                        tag_pix_addry,
                                        tag_blk_addrx,
                                        tag_blk_addry,
                                        tag_cache_hit
                                    }),
                .s_valid            (tag_valid),
                .s_ready            (tag_ready),
                
                .m_data             ({
                                        m_user,
                                        m_last,
                                        m_strb,
                                        m_tbl_addr,
                                        m_pix_addrx,
                                        m_pix_addry,
                                        m_blk_addrx,
                                        m_blk_addry,
                                        m_cache_hit
                                    }),
                .m_valid            (m_valid),
                .m_ready            (m_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // Log
    generate
    if ( LOG_ENABLE ) begin : blk_log
        integer fp;
        
        initial begin
            fp = $fopen(LOG_FILE, "w");
            if ( fp != 0 ) begin
                $fclose(fp);
            end
        end
        
        always @(posedge clk) begin
            if ( !reset ) begin
                if ( tag_valid & tag_ready ) begin
                    fp = $fopen(LOG_FILE, "a");
                    if ( fp != 0 ) begin
                        $fdisplay(fp, "[%d] hit:%b index:0x%h addr:0x%h way:%d tag:0x%h blkx:%d blky:%d",
                                LOG_ID, tag_cache_hit, tag_index, tag_tbl_addr, tag_way, tag_tag, tag_blk_addrx, tag_blk_addry);
                    end
                    $fclose(fp);
                end
            end
        end
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
