// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_texture_cache_tag_associative
        #(
            parameter   USER_WIDTH     = 1,
            
            parameter   ADDR_X_WIDTH   = 12,
            parameter   ADDR_Y_WIDTH   = 12,
            
            parameter   TAG_ADDR_WIDTH = 2,
            parameter   BLK_X_SIZE     = 2, // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            parameter   BLK_Y_SIZE     = 2, // 0:1pixel, 1:2pixel, 2:4pixel, 3:8pixel ...
            
            parameter   M_SLAVE_REGS   = 0,
            parameter   M_MASTER_REGS  = 0,
            
            // local
            parameter   USER_BITS      = USER_WIDTH > 0 ? USER_WIDTH : 1
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
            output  wire    [TAG_ADDR_WIDTH-1:0]    m_tag_addr,
            output  wire    [PIX_ADDR_X_WIDTH-1:0]  m_pix_addrx,
            output  wire    [PIX_ADDR_Y_WIDTH-1:0]  m_pix_addry,
            output  wire    [BLK_ADDR_X_WIDTH-1:0]  m_blk_addrx,
            output  wire    [BLK_ADDR_Y_WIDTH-1:0]  m_blk_addry,
            output  wire                            m_cache_hit,
            output  wire                            m_strb,
            output  wire                            m_valid,
            input   wire                            m_ready
        );
    
    // common
    localparam  PIX_ADDR_X_WIDTH = BLK_X_SIZE;
    localparam  PIX_ADDR_Y_WIDTH = BLK_Y_SIZE;
    localparam  BLK_ADDR_X_WIDTH = ADDR_X_WIDTH - BLK_X_SIZE;
    localparam  BLK_ADDR_Y_WIDTH = ADDR_Y_WIDTH - BLK_Y_SIZE;
    
    wire                            cke;
    
    
    // slave
    wire    [PIX_ADDR_X_WIDTH-1:0]  s_pix_addrx = s_addrx[BLK_X_SIZE-1:0];
    wire    [PIX_ADDR_Y_WIDTH-1:0]  s_pix_addry = s_addry[BLK_Y_SIZE-1:0];
    wire    [BLK_ADDR_X_WIDTH-1:0]  s_blk_addrx = s_addrx[ADDR_X_WIDTH-1:BLK_X_SIZE];
    wire    [BLK_ADDR_Y_WIDTH-1:0]  s_blk_addry = s_addry[ADDR_Y_WIDTH-1:BLK_Y_SIZE];
    
    
    //  insert FF
    reg     [USER_BITS-1:0]         reg_user;
    reg                             reg_last;
    reg                             reg_enable;
    reg     [PIX_ADDR_X_WIDTH-1:0]  reg_pix_addrx;
    reg     [PIX_ADDR_Y_WIDTH-1:0]  reg_pix_addry;
    reg     [BLK_ADDR_X_WIDTH-1:0]  reg_blk_addrx;
    reg     [BLK_ADDR_Y_WIDTH-1:0]  reg_blk_addry;
    reg                             reg_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_user      <= {USER_BITS{1'bx}};
            reg_last      <= 1'bx;
            reg_enable    <= 1'bx;
            reg_pix_addrx <= {PIX_ADDR_X_WIDTH{1'bx}};
            reg_pix_addry <= {PIX_ADDR_Y_WIDTH{1'bx}};
            reg_blk_addrx <= {BLK_ADDR_X_WIDTH{1'bx}};
            reg_blk_addry <= {BLK_ADDR_Y_WIDTH{1'bx}};
            reg_valid     <= 1'b0;
        end
        else if ( cke ) begin
            reg_user      <= s_user;
            reg_last      <= s_last;
            reg_enable    <= (s_strb && s_valid);
            reg_pix_addrx <= s_pix_addrx;
            reg_pix_addry <= s_pix_addry;
            reg_blk_addrx <= s_blk_addrx;
            reg_blk_addry <= s_blk_addry;
            reg_valid     <= s_valid;
        end
    end
    
    assign s_ready = cke;
    
    
    // full associative tag
    wire    [USER_BITS-1:0]         tag_user;
    wire                            tag_last;
    wire                            tag_enable;
    wire    [TAG_ADDR_WIDTH-1:0]    tag_tag_addr;
    wire    [PIX_ADDR_X_WIDTH-1:0]  tag_pix_addrx;
    wire    [PIX_ADDR_Y_WIDTH-1:0]  tag_pix_addry;
    wire    [BLK_ADDR_X_WIDTH-1:0]  tag_blk_addrx;
    wire    [BLK_ADDR_Y_WIDTH-1:0]  tag_blk_addry;
    wire                            tag_cache_hit;
    wire                            tag_valid;
    
    jelly_cache_tag_full
            #(
                .USER_WIDTH     (USER_BITS+1+PIX_ADDR_X_WIDTH+PIX_ADDR_Y_WIDTH ),
                
                .ADDR_WIDTH     (BLK_ADDR_Y_WIDTH + BLK_ADDR_X_WIDTH),
                .TAG_WIDTH      (TAG_ADDR_WIDTH)
            )
        i_cache_tag_full
            (
                .reset          (reset),
                .clk            (clk),
                .cke            (cke),
                
                .clear_start    (clear_start),
                .clear_busy     (clear_busy),
                
                .s_user         ({reg_user, reg_last, reg_pix_addrx, reg_pix_addry}),
                .s_enable       (reg_enable),
                .s_addr         ({reg_blk_addry, reg_blk_addrx}),
                .s_valid        (reg_valid),
                
                .m_user         ({tag_user, tag_last, tag_pix_addrx, tag_pix_addry}),
                .m_enable       (tag_enable),
                .m_addr         ({tag_blk_addry, tag_blk_addrx}),
                .m_tag          (tag_tag_addr),
                .m_hit          (tag_cache_hit),
                .m_valid        (tag_valid)
            );
    
    
    // output
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (USER_BITS+1+1+TAG_ADDR_WIDTH+PIX_ADDR_X_WIDTH+PIX_ADDR_Y_WIDTH+BLK_ADDR_X_WIDTH+BLK_ADDR_Y_WIDTH+1),
                .SLAVE_REGS         (1),
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
                                        tag_enable,
                                        tag_tag_addr,
                                        tag_pix_addrx,
                                        tag_pix_addry,
                                        tag_blk_addrx,
                                        tag_blk_addry,
                                        tag_cache_hit
                                    }),
                .s_valid            (tag_valid),
                .s_ready            (cke),
                
                .m_data             ({
                                        m_user,
                                        m_last,
                                        m_strb,
                                        m_tag_addr,
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
    
    
endmodule



`default_nettype wire


// end of file
