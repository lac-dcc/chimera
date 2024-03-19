// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_cache_tag_full_associative
        #(
            parameter   USER_WIDTH  = 1,
            parameter   WAY_NUM     = 4,
            parameter   WAY_WIDTH   = WAY_NUM <=   2 ? 1 :
                                      WAY_NUM <=   4 ? 2 :
                                      WAY_NUM <=   8 ? 3 :
                                      WAY_NUM <=  16 ? 4 :
                                      WAY_NUM <=  32 ? 5 :
                                      WAY_NUM <=  64 ? 6 :
                                      WAY_NUM <= 128 ? 7 : 8,
            parameter   INDEX_WIDTH = 12,
            
            // local
            parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        clear_start,
            output  wire                        clear_busy,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire    [INDEX_WIDTH-1:0]   s_index,
            input   wire                        s_strb,
            input   wire                        s_valid,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire    [INDEX_WIDTH-1:0]   m_index,
            output  wire    [WAY_WIDTH-1:0]     m_way,
            output  wire                        m_hit,
            output  wire                        m_strb,
            output  wire                        m_valid
        );
        
    integer                             i;
    
    reg                                 reg_clear;
    always @(posedge clk) begin
        if ( reset ) begin
            reg_clear <= 1'b1;
        end
        else begin
            reg_clear <= clear_start;
        end
    end
    assign clear_busy = reg_clear;
    
    
    reg     [WAY_NUM-1:0]               reg_cache_valid;
    reg     [WAY_NUM*INDEX_WIDTH-1:0]   reg_cache_index;
    reg     [WAY_NUM*WAY_WIDTH-1:0]     reg_cache_way;
    
    reg     [USER_BITS-1:0]             reg_user;
    reg                                 reg_hit;
    reg                                 reg_strb;
    reg                                 reg_valid;
    
    reg                                 sig_hit;
    reg     [WAY_WIDTH-1:0]             sig_pos;
    
    always @* begin
        sig_hit = 1'b0;
        sig_pos = WAY_NUM-1;
        for ( i = 0; i < WAY_NUM; i = i+1 ) begin
            if ( reg_cache_valid[i] && (reg_cache_index[i*INDEX_WIDTH +: INDEX_WIDTH] == s_index) ) begin
                sig_hit = 1'b1;
                sig_pos = i;
            end
        end
    end
    
    
    always @(posedge clk) begin
        if ( reg_clear ) begin
            reg_cache_valid <= {WAY_NUM{1'b0}};
            reg_cache_index <= {(WAY_NUM*INDEX_WIDTH){1'bx}};
            for ( i = 0; i < WAY_NUM; i = i+1 ) begin
                reg_cache_way[i*WAY_WIDTH +: WAY_WIDTH] <= (WAY_NUM-1) - i;
            end
            
            reg_user   <= {USER_BITS{1'bx}};
            reg_hit    <= 1'bx;
            reg_strb   <= 1'bx;
            reg_valid  <= 1'b0;
        end
        else if ( cke ) begin
            if ( s_valid && s_strb ) begin
                reg_cache_valid[0]                            <= 1'b1;
                reg_cache_index[0*INDEX_WIDTH +: INDEX_WIDTH] <= s_index;
                reg_cache_way  [0*WAY_WIDTH   +: WAY_WIDTH]   <= reg_cache_way[sig_pos*WAY_WIDTH +: WAY_WIDTH];
                
                for ( i = 1; i < WAY_NUM; i = i+1 ) begin
                    if ( sig_pos >= i ) begin
                        reg_cache_valid[i]                            <= reg_cache_valid[(i-1)];
                        reg_cache_index[i*INDEX_WIDTH +: INDEX_WIDTH] <= reg_cache_index[(i-1)*INDEX_WIDTH +: INDEX_WIDTH];
                        reg_cache_way  [i*WAY_WIDTH  +: WAY_WIDTH]    <= reg_cache_way  [(i-1)*WAY_WIDTH   +: WAY_WIDTH];
                    end
                end
            end
            
            reg_hit    <= sig_hit;
            reg_user   <= s_user;
            reg_strb   <= s_strb;
            reg_valid  <= s_valid;
        end
    end
    
    assign m_user  = reg_user;
    assign m_index = reg_cache_index[INDEX_WIDTH-1:0];
    assign m_way   = reg_cache_way[WAY_WIDTH-1:0];
    assign m_hit   = reg_hit;
    assign m_strb  = reg_strb;
    assign m_valid = reg_valid;
    
endmodule



`default_nettype wire


// end of file
