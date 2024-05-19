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


// Jelly bus to WISHBONE bus bridge
module jelly_jbus_decoder
        #(
            parameter   SLAVE_ADDR_WIDTH   = 30,
            parameter   SLAVE_DATA_SIZE    = 2,                 // 0:8bit, 1:16bit, 2:32bit ...
            parameter   SLAVE_DATA_WIDTH   = (8 << SLAVE_DATA_SIZE),
            parameter   SLAVE_SEL_WIDTH    = (SLAVE_DATA_WIDTH / 8),
            
            parameter   DEC_ADDR_WIDTH     = SLAVE_ADDR_WIDTH
        )
        (
            // system
            input   wire                            reset,
            input   wire                            clk,
            
            // decode address
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  addr_mask,
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  addr_value,
            
            // slave port (jelly bus)
            input   wire                            s_jbus_en,
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  s_jbus_addr,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus_wdata,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus_rdata,
            input   wire                            s_jbus_we,
            input   wire    [SLAVE_SEL_WIDTH-1:0]   s_jbus_sel,
            input   wire                            s_jbus_valid,
            output  wire                            s_jbus_ready,
            
            // master port (jelly bus)
            output  wire                            m_jbus_en,
            output  wire    [SLAVE_ADDR_WIDTH-1:0]  m_jbus_addr,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  m_jbus_wdata,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  m_jbus_rdata,
            output  wire                            m_jbus_we,
            output  wire    [SLAVE_SEL_WIDTH-1:0]   m_jbus_sel,
            output  wire                            m_jbus_valid,
            input   wire                            m_jbus_ready,
            
            // decoded port (jelly bus)
            output  wire                            m_jbus_decode_en,
            output  wire    [DEC_ADDR_WIDTH-1:0]    m_jbus_decode_addr,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  m_jbus_decode_wdata,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  m_jbus_decode_rdata,
            output  wire                            m_jbus_decode_we,
            output  wire    [SLAVE_SEL_WIDTH-1:0]   m_jbus_decode_sel,
            output  wire                            m_jbus_decode_valid,
            input   wire                            m_jbus_decode_ready
        );
    
    
    wire    sw;
    assign  sw = ((s_jbus_addr & addr_mask) == addr_value);
    
    wire    read_ready;
    reg     read_sw;
    
    reg     read_busy;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            read_busy <= 1'b0;
            read_sw   <= 1'bx;
        end
        else begin
            if ( s_jbus_en & !s_jbus_we & s_jbus_valid & s_jbus_ready ) begin
                read_busy <= 1'b1;
                read_sw   <= sw;
            end
            else if ( s_jbus_en & s_jbus_ready ) begin
                read_busy <= 1'b0;
                read_sw   <= 1'bx;
            end
        end
    end
    
    assign read_ready          = read_busy ? (read_sw ? m_jbus_decode_ready : m_jbus_ready) : 1'b1;
    
    assign m_jbus_en           = s_jbus_en & read_ready;
    assign m_jbus_addr         = s_jbus_addr;
    assign m_jbus_wdata        = s_jbus_wdata; 
    assign m_jbus_we           = s_jbus_we;
    assign m_jbus_sel          = s_jbus_sel;
    assign m_jbus_valid        = s_jbus_valid & !sw;
    
    assign m_jbus_decode_en    = s_jbus_en & read_ready;
    assign m_jbus_decode_addr  = s_jbus_addr; 
    assign m_jbus_decode_wdata = s_jbus_wdata; 
    assign m_jbus_decode_we    = s_jbus_we;
    assign m_jbus_decode_sel   = s_jbus_sel;
    assign m_jbus_decode_valid = s_jbus_valid & sw;
    
    assign s_jbus_rdata        = read_sw ? m_jbus_decode_rdata : m_jbus_rdata;
    assign s_jbus_ready        = (sw ? m_jbus_decode_ready : m_jbus_ready) & read_ready;
    
endmodule


`default_nettype wire


// end of file
