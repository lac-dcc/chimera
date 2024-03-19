// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2018 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// read only cache tag
module jelly_cache_tag
        #(
            parameter   USER_WIDTH  = 0,
            parameter   WAY_NUM     = 4,
            parameter   WAY_WIDTH   = WAY_NUM <=   1 ? 0 :
                                      WAY_NUM <=   2 ? 1 :
                                      WAY_NUM <=   4 ? 2 :
                                      WAY_NUM <=   8 ? 3 :
                                      WAY_NUM <=  16 ? 4 :
                                      WAY_NUM <=  32 ? 5 :
                                      WAY_NUM <=  64 ? 6 :
                                      WAY_NUM <= 128 ? 7 : 8,
            parameter   INDEX_WIDTH = 12,
            parameter   TAG_WIDTH   = 6,
            parameter   ADDR_WIDTH  = WAY_WIDTH + TAG_WIDTH,
            parameter   RAM_TYPE    = "distributed",
            
            // local
            parameter   WAY_BITS    = WAY_WIDTH  > 0 ? WAY_WIDTH  : 1,
            parameter   TAG_BITS    = TAG_WIDTH  > 0 ? TAG_WIDTH  : 1,
            parameter   USER_BITS   = USER_WIDTH > 0 ? USER_WIDTH : 1
        )
        (
            input   wire                            reset,
            input   wire                            clk,
            input   wire                            cke,
            
            input   wire                            clear_start,
            output  wire                            clear_busy,
            
            input   wire    [USER_BITS-1:0]         s_user,
            input   wire    [INDEX_WIDTH-1:0]       s_index,
            input   wire    [TAG_BITS-1:0]          s_tag,
            input   wire                            s_strb,
            input   wire                            s_valid,
            
            output  wire    [USER_BITS-1:0]         m_user,
            output  wire    [INDEX_WIDTH-1:0]       m_index,
            output  wire    [WAY_BITS-1:0]          m_way,
            output  wire    [TAG_BITS-1:0]          m_tag,
            output  wire    [ADDR_WIDTH-1:0]        m_addr,
            output  wire                            m_hit,
            output  wire                            m_strb,
            output  wire                            m_valid
        );
    
    generate
    if ( WAY_WIDTH <= 0 ) begin : blk_directmap
        jelly_cache_tag_directmap
                #(
                    .USER_WIDTH         (USER_WIDTH),
                    .INDEX_WIDTH        (INDEX_WIDTH),
                    .TAG_WIDTH          (TAG_WIDTH),
                    .RAM_TYPE           (RAM_TYPE)
                )
            i_cache_tag_directmap
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .clear_start        (clear_start),
                    .clear_busy         (clear_busy),
                    
                    .s_user             (s_user),
                    .s_index            (s_index),
                    .s_tag              (s_tag),
                    .s_strb             (s_strb),
                    .s_valid            (s_valid),
                                         
                    .m_user             (m_user),
                    .m_index            (m_index),
                    .m_tag              (m_tag),
                    .m_hit              (m_hit),
                    .m_strb             (m_strb),
                    .m_valid            (m_valid)
                );
        
        assign m_way  = 0;
        assign m_addr = m_tag;
    end
    else if ( TAG_WIDTH <= 0 ) begin : blk_full_associative
        jelly_cache_tag_full_associative
                #(
                    .USER_WIDTH         (USER_WIDTH),
                    .WAY_NUM            (WAY_NUM),
                    .WAY_WIDTH          (WAY_WIDTH),
                    .INDEX_WIDTH        (INDEX_WIDTH)
                )
            i_cache_tag_full_associative
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .clear_start        (clear_start),
                    .clear_busy         (clear_busy),
                    
                    .s_user             (s_user),
                    .s_index            (s_index),
                    .s_strb             (s_strb),
                    .s_valid            (s_valid),
                                         
                    .m_user             (m_user),
                    .m_index            (m_index),
                    .m_way              (m_way),
                    .m_hit              (m_hit),
                    .m_strb             (m_strb),
                    .m_valid            (m_valid)
                );
        assign m_tag  = 0;
        assign m_addr = m_way;
    end
    else begin : blk_set_associative
        jelly_cache_tag_set_associative
                #(
                    .USER_WIDTH         (USER_WIDTH),
                    .WAY_NUM            (WAY_NUM),
                    .WAY_WIDTH          (WAY_WIDTH),
                    .INDEX_WIDTH        (INDEX_WIDTH),
                    .TAG_WIDTH          (TAG_WIDTH),
                    .RAM_TYPE           (RAM_TYPE)
                )
            i_cache_tag_set_associative
                (
                    .reset              (reset),
                    .clk                (clk),
                    .cke                (cke),
                    
                    .clear_start        (clear_start),
                    .clear_busy         (clear_busy),
                    
                    .s_user             (s_user),
                    .s_index            (s_index),
                    .s_tag              (s_tag),
                    .s_strb             (s_strb),
                    .s_valid            (s_valid),
                                         
                    .m_user             (m_user),
                    .m_index            (m_index),
                    .m_way              (m_way),
                    .m_tag              (m_tag),
                    .m_hit              (m_hit),
                    .m_strb             (m_strb),
                    .m_valid            (m_valid)
                );
        
        assign m_addr = {m_way, m_tag};
    end
    endgenerate
    
endmodule


`default_nettype wire


// End of file
