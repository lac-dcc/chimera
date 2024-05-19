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
module jelly_ring_bus_unit
        #(
            parameter   DATA_WIDTH    = 32,
            parameter   ID_TO_WIDTH   = 4,
            parameter   ID_FROM_WIDTH = 4,
            parameter   UNIT_ID_TO    = 0,
            parameter   UNIT_ID_FROM  = 0,
            
            // local
            parameter   ID_TO_BITS    = ID_TO_WIDTH   > 0 ? ID_TO_WIDTH   : 1,
            parameter   ID_FROM_BITS  = ID_FROM_WIDTH > 0 ? ID_FROM_WIDTH : 1
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            input   wire                        cke,
            
            input   wire    [ID_TO_BITS-1:0]    s_id_to,
            input   wire    [DATA_WIDTH-1:0]    s_data,
            input   wire                        s_valid,
            output  wire                        s_ready,
            
            output  wire    [ID_FROM_BITS-1:0]  m_id_from,
            output  wire    [DATA_WIDTH-1:0]    m_data,
            output  wire                        m_valid,
            input   wire                        m_ready,
            
            input   wire    [ID_TO_BITS-1:0]    src_id_to,
            input   wire    [ID_FROM_BITS-1:0]  src_id_from,
            input   wire    [DATA_WIDTH-1:0]    src_data,
            input   wire                        src_valid,
            
            output  wire    [ID_TO_BITS-1:0]    sink_id_to,
            output  wire    [ID_FROM_BITS-1:0]  sink_id_from,
            output  wire    [DATA_WIDTH-1:0]    sink_data,
            output  wire                        sink_valid
        );
        
    reg     [ID_TO_BITS-1:0]        reg_sink_id_to;
    reg     [ID_FROM_BITS-1:0]      reg_sink_id_from;
    reg     [DATA_WIDTH-1:0]        reg_sink_data;
    reg                             reg_sink_valid;
    
    always @(posedge clk) begin
        if ( reset ) begin
            reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
            reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
            reg_sink_data    <= {DATA_WIDTH{1'bx}};
            reg_sink_valid   <= 1'b0;
        end
        else if ( cke ) begin
            // データ転送
            reg_sink_id_to   <= src_id_to;
            reg_sink_id_from <= src_id_from;
            reg_sink_data    <= src_data;
            reg_sink_valid   <= src_valid;
            
            // データ取り出し
            if ( m_valid && m_ready ) begin
                reg_sink_id_to   <= {ID_TO_BITS{1'bx}};
                reg_sink_id_from <= {ID_FROM_BITS{1'bx}};
                reg_sink_data    <= {DATA_WIDTH{1'bx}};
                reg_sink_valid   <= 1'b0;
            end
            
            // データ挿入
            if ( s_valid && s_ready ) begin
                reg_sink_id_to   <= s_id_to;
                reg_sink_id_from <= UNIT_ID_FROM;
                reg_sink_data    <= s_data;
                reg_sink_valid   <= s_valid;
            end
        end
    end
    
    
    // 制御
    assign s_ready      = (!src_valid || (m_valid && m_ready));
    
    assign m_id_from    = src_id_from;
    assign m_data       = src_data;
    assign m_valid      = (src_valid && ((src_id_to == UNIT_ID_TO) || (ID_TO_WIDTH <= 0)));
    
    assign sink_id_to   = reg_sink_id_to;
    assign sink_id_from = reg_sink_id_from;
    assign sink_data    = reg_sink_data;
    assign sink_valid   = reg_sink_valid;
    
    
endmodule



`default_nettype wire


// end of file
