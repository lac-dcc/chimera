// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_stream_token_ring_unit
        #(
            parameter   DATA_WIDTH    = 32,
            parameter   ID_TO_WIDTH   = 4,
            parameter   ID_FROM_WIDTH = 4,
            parameter   UNIT_ID_TO    = 0,
            parameter   UNIT_ID_FROM  = 0,
            parameter   INIT_TOKEN    = 0
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [ID_TO_BITS-1:0]    s_id_to,
            input   wire                        s_last,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [ID_FROM_BITS-1:0]  m_id_from,
            output  wire                        m_last,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            input   wire    [ID_TO_BITS-1:0]    src_id_to,
            input   wire    [ID_FROM_BITS-1:0]  src_id_from,
            input   wire                        src_last,
            input   wire    [DATA_WIDTH-1:0]    src_data,
            input   wire                        src_valid,
            input   wire                        src_token,
            
            output  wire    [ID_TO_BITS-1:0]    sink_id_to,
            output  wire    [ID_FROM_BITS-1:0]  sink_id_from,
            input   wire                        sink_last,
            output  wire    [DATA_WIDTH-1:0]    sink_data,
            output  wire                        sink_valid,
            input   wire                        sink_token
        );
    
    localparam  ID_TO_BITS   = ID_TO_WIDTH   > 0 ? ID_TO_WIDTH   : 1;
    localparam  ID_FROM_BITS = ID_FROM_WIDTH > 0 ? ID_FROM_WIDTH : 1;
    
    reg                             reg_token;
    
    reg     [ID_TO_BITS-1:0]        reg_sink_id_to;
    reg     [ID_FROM_BITS-1:0]      reg_sink_id_from;
    reg                             reg_sink_last;
    reg     [DATA_WIDTH-1:0]        reg_sink_data;
    reg                             reg_sink_valid;
    reg                             reg_sink_token;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_token        <= 1'b0;
            
            reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
            reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
            reg_sink_last    <= src_last;
            reg_sink_data    <= {DATA_WIDTH{1'bx}};
            reg_sink_valid   <= 1'b0;
            reg_sink_token   <= INIT_TOKEN;
        end
        else if ( cke ) begin
            // データ転送
            reg_sink_id_to   <= src_id_to;
            reg_sink_id_from <= src_id_from;
            reg_sink_last    <= src_last;
            reg_sink_data    <= src_data;
            reg_sink_valid   <= src_valid;
            reg_sink_token   <= src_token;
            
            // データ取り出し
            if ( m_valid && m_ready ) begin
                reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
                reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
                reg_sink_last    <= 1'bx;
                reg_sink_data    <= {DATA_WIDTH{1'bx}};
                reg_sink_valid   <= 1'b0;
            end
            
            // トークン取得(送信データがあるときにトークンが流れてきた)
            if ( s_valid && src_token ) begin
                reg_token      <= 1'b1;
                reg_sink_token <= 1'b0;
            end
            
            // データ挿入
            if ( s_valid && s_ready ) begin
                // データ挿入
                reg_sink_id_to   <= s_id_to;
                reg_sink_id_from <= UNIT_ID_FROM;
                reg_sink_last    <= s_last;
                reg_sink_data    <= s_data;
                reg_sink_valid   <= s_valid;
                
                if ( s_last ) begin
                    // トークン開放
                    reg_token      <= 1'b0;
                    reg_sink_token <= 1'b1;
                end
            end
        end
    end
    
    
    // 制御
    assign s_ready      = ((!src_valid || (m_valid && m_ready)) && (src_token || reg_token));
    
    assign m_id_from    = src_id_from;
    assign m_last       = src_last;
    assign m_data       = src_data;
    assign m_valid      = (src_valid && ((src_id_to == UNIT_ID_TO) || (ID_TO_WIDTH <= 0)));
    
    assign sink_id_to   = reg_sink_id_to;
    assign sink_id_from = reg_sink_id_from;
    assign sink_last    = reg_sink_last;
    assign sink_data    = reg_sink_data;
    assign sink_valid   = reg_sink_valid;
    assign sink_token   = reg_sink_token;
    
    
endmodule



`default_nettype wire


// end of file
