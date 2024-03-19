// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// ring bus unit
module jelly_stream_ring_bus_unit
        #(
            parameter   DATA_WIDTH    = 32,
            parameter   LEN_WIDTH     = 8,
            parameter   ID_TO_WIDTH   = 4,
            parameter   ID_FROM_WIDTH = 4,
            parameter   UNIT_ID_TO    = 0,
            parameter   UNIT_ID_FROM  = 0,
            parameter   USE_TOKEN     = 1,
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
            input   wire    [LEN_BITS-1:0]      src_seq,
            input   wire                        src_last,
            input   wire    [DATA_WIDTH-1:0]    src_data,
            input   wire                        src_valid,
            input   wire                        src_token,
            
            output  wire    [ID_TO_BITS-1:0]    sink_id_to,
            output  wire    [ID_FROM_BITS-1:0]  sink_id_from,
            input   wire    [LEN_BITS-1:0]      sink_seq,
            input   wire                        sink_last,
            output  wire    [DATA_WIDTH-1:0]    sink_data,
            output  wire                        sink_valid,
            output  wire                        sink_token
        );
    
    localparam  ID_TO_BITS   = ID_TO_WIDTH   > 0 ? ID_TO_WIDTH   : 1;
    localparam  ID_FROM_BITS = ID_FROM_WIDTH > 0 ? ID_FROM_WIDTH : 1;
    localparam  LEN_BITS     = LEN_WIDTH     > 0 ? LEN_WIDTH     : 1;
    
    // receiver
    reg                             reg_recv_busy;
    reg     [ID_FROM_BITS-1:0]      reg_recv_id_from;
    reg     [LEN_BITS-1:0]          reg_recv_seq;
    
    // transmitter
    reg                             reg_send_token;
    reg     [LEN_BITS-1:0]          reg_send_seq;
    
    // ring
    reg     [ID_TO_BITS-1:0]        reg_sink_id_to;
    reg     [ID_FROM_BITS-1:0]      reg_sink_id_from;
    reg     [LEN_BITS-1:0]          reg_sink_seq;
    reg                             reg_sink_last;
    reg     [DATA_WIDTH-1:0]        reg_sink_data;
    reg                             reg_sink_valid;
    reg                             reg_sink_token;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_recv_busy    <= 1'b0;
            reg_recv_id_from <= {ID_FROM_BITS{1'bx}};
            reg_recv_seq     <= {LEN_BITS{1'b0}};
            
            reg_send_token   <= 1'b0;
            reg_send_seq     <= {LEN_BITS{1'b0}};
            
            reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
            reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
            reg_sink_last    <= 1'bx;
            reg_sink_seq     <= {LEN_BITS{1'bx}};
            reg_sink_data    <= {DATA_WIDTH{1'bx}};
            reg_sink_valid   <= 1'b0;
            reg_sink_token   <= INIT_TOKEN;
        end
        else if ( cke ) begin
            // データ転送
            reg_sink_id_to   <= src_id_to;
            reg_sink_id_from <= src_id_from;
            reg_sink_last    <= src_last;
            reg_sink_seq     <= src_seq;
            reg_sink_data    <= src_data;
            reg_sink_valid   <= src_valid;
            reg_sink_token   <= src_token;
            
            // データ取り出し
            if ( m_valid && m_ready ) begin
                reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
                reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
                reg_sink_seq     <= {LEN_BITS{1'bx}};
                reg_sink_last    <= 1'bx;
                reg_sink_data    <= {DATA_WIDTH{1'bx}};
                reg_sink_valid   <= 1'b0;
                
                if ( m_last ) begin
                    reg_recv_busy    <= 1'b0;
                    reg_recv_seq     <= {LEN_BITS{1'b0}};
                end
                else begin
                    reg_recv_busy    <= 1'b1;
                    reg_recv_id_from <= src_id_from;
                    reg_recv_seq     <= reg_recv_seq + 1'b1;
                end
            end
            
            
            // トークン取得(送信データがあるときにトークンが流れてきた)
            if ( s_valid && src_token ) begin
                reg_send_token <= 1'b1;
                reg_sink_token <= 1'b0;
            end
            
            
            // データ挿入
            if ( s_valid && s_ready ) begin
                reg_sink_id_to   <= s_id_to;
                reg_sink_id_from <= UNIT_ID_FROM;
                reg_sink_seq     <= reg_send_seq;
                reg_sink_last    <= s_last;
                reg_sink_data    <= s_data;
                reg_sink_valid   <= s_valid;
                
                if ( s_last ) begin
                    reg_send_seq   <= {LEN_BITS{1'b0}};
                    reg_send_token <= 1'b0;
                    reg_sink_token <= 1'b1;     // トークン放流
                end
                else begin
                    reg_send_seq <= reg_send_seq + 1'b1;
                end
            end
        end
    end
    
    
    // 制御
    assign s_ready      = ((!src_valid || (m_valid && m_ready)) && (src_token || reg_send_token || !USE_TOKEN));
    
    assign m_id_from    = src_id_from;
    assign m_last       = src_last;
    assign m_data       = src_data;
    assign m_valid      = (src_valid
                            && ((src_id_to   == UNIT_ID_TO)       || (ID_TO_WIDTH <= 0))
                            && ((src_seq     == reg_recv_seq)     || (LEN_WIDTH   <= 0))
                            && ((src_id_from == reg_recv_id_from) || !reg_recv_busy    )
                          );
    
    assign sink_id_to   = reg_sink_id_to;
    assign sink_id_from = reg_sink_id_from;
    assign sink_seq     = reg_sink_seq;
    assign sink_last    = reg_sink_last;
    assign sink_data    = reg_sink_data;
    assign sink_valid   = reg_sink_valid;
    assign sink_token   = reg_sink_token;
    
    
endmodule



`default_nettype wire


// end of file
