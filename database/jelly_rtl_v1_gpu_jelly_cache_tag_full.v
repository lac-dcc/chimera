// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



module jelly_cache_tag_full
        #(
            parameter   USER_WIDTH = 1,
            
            parameter   ADDR_WIDTH = 24,
            parameter   TAG_WIDTH  = 2,
            parameter   TAG_NUM    = (1 << TAG_WIDTH)
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire                        clear_start,
            output  wire                        clear_busy,
            
            input   wire    [USER_BITS-1:0]     s_user,
            input   wire                        s_enable,
            input   wire    [ADDR_WIDTH-1:0]    s_addr,
            input   wire                        s_valid,
            
            output  wire    [USER_BITS-1:0]     m_user,
            output  wire                        m_enable,
            output  wire    [ADDR_WIDTH-1:0]    m_addr,
            output  wire    [TAG_WIDTH-1:0]     m_tag,
            output  wire                        m_hit,
            output  wire                        m_valid
        );
    
    localparam  USER_BITS = USER_WIDTH > 0 ? USER_WIDTH : 1;
    
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
    
    
    reg     [TAG_NUM-1:0]               reg_en;
    reg     [TAG_NUM*ADDR_WIDTH-1:0]    reg_addr;
    reg     [TAG_NUM*TAG_WIDTH-1:0]     reg_tag;
    
    reg     [USER_BITS-1:0]             reg_user;
    reg                                 reg_enable;
    reg                                 reg_hit;
    reg                                 reg_valid;
    
    reg                                 sig_hit;
    reg     [TAG_WIDTH-1:0]             sig_pos;
    
    always @* begin
        sig_hit = 1'b0;
        sig_pos = TAG_NUM-1;
        for ( i = 0; i < TAG_NUM; i = i+1 ) begin
            if ( reg_en[i] && (reg_addr[i*ADDR_WIDTH +: ADDR_WIDTH] == s_addr) ) begin
                sig_hit = 1'b1;
                sig_pos = i;
            end
        end
    end
    
    
    always @(posedge clk) begin
        if ( reg_clear ) begin
            reg_en   <= {TAG_NUM{1'b0}};
            reg_addr <= {(TAG_NUM*ADDR_WIDTH){1'bx}};
            for ( i = 0; i < TAG_NUM; i = i+1 ) begin
                reg_tag[i*TAG_WIDTH +: TAG_WIDTH] <= (TAG_NUM-1) - i;
            end
            
            reg_user   <= {USER_BITS{1'bx}};
            reg_enable <= 1'bx;
            reg_hit    <= 1'bx;
            reg_valid  <= 1'b0;
        end
        else if ( cke ) begin
            if ( s_enable ) begin
                reg_en  [0]                          <= 1'b1;
                reg_addr[0*ADDR_WIDTH +: ADDR_WIDTH] <= s_addr;
                reg_tag [0*TAG_WIDTH  +: TAG_WIDTH]  <= reg_tag[sig_pos*TAG_WIDTH +: TAG_WIDTH];
                
                for ( i = 1; i < TAG_NUM; i = i+1 ) begin
                    if ( sig_pos >= i ) begin
                        reg_en  [i]                          <= reg_en  [(i-1)];
                        reg_addr[i*ADDR_WIDTH +: ADDR_WIDTH] <= reg_addr[(i-1)*ADDR_WIDTH +: ADDR_WIDTH];
                        reg_tag [i*TAG_WIDTH  +: TAG_WIDTH]  <= reg_tag [(i-1)*TAG_WIDTH  +: TAG_WIDTH];
                    end
                end
            end
            
            reg_user   <= s_user;
            reg_enable <= s_enable;
            reg_hit    <= sig_hit;
            reg_valid  <= s_valid;
        end
    end
    
    assign m_user   = reg_user;
    assign m_enable = reg_enable;
    assign m_addr   = reg_addr[ADDR_WIDTH-1:0];
    assign m_tag    = reg_tag[TAG_WIDTH-1:0];
    assign m_hit    = reg_hit;
    assign m_valid  = reg_valid;
    
endmodule



`default_nettype wire


// end of file
