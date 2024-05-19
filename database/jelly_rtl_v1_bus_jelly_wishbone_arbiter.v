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



// wishbone_arbiter
module jelly_wishbone_arbiter
        #(
            parameter                           WB_ADR_WIDTH = 30,
            parameter                           WB_DAT_WIDTH = 32,
            parameter                           WB_SEL_WIDTH = (WB_DAT_WIDTH / 8)
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // cpu side port 0
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb0_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb0_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb0_dat_o,
            input   wire                        s_wb0_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb0_sel_i,
            input   wire                        s_wb0_stb_i,
            output  wire                        s_wb0_ack_o,
            
            // cpu side port 1
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb1_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb1_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb1_dat_o,
            input   wire                        s_wb1_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb1_sel_i,
            input   wire                        s_wb1_stb_i,
            output  wire                        s_wb1_ack_o,
            
            // memory side port
            output  wire    [WB_ADR_WIDTH-1:0]  m_wb_adr_o,
            input   wire    [WB_DAT_WIDTH-1:0]  m_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  m_wb_dat_o,
            output  wire                        m_wb_we_o,
            output  wire    [WB_SEL_WIDTH-1:0]  m_wb_sel_o,
            output  wire                        m_wb_stb_o,
            input   wire                        m_wb_ack_i
        );
    
    
    // arbiter
    reg         reg_busy;
    reg         reg_sw;
    wire        sw;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_busy <= 1'b0;
            reg_sw   <= 1'bx;
        end
        else begin
            reg_busy <= m_wb_stb_o & !m_wb_ack_i;
            
            if ( !reg_busy ) begin
                reg_sw <= sw;
            end
        end
    end
    assign sw = reg_busy ? reg_sw : !s_wb0_stb_i;
    
    
    assign m_wb_adr_o = sw ? s_wb1_adr_i : s_wb0_adr_i;
    assign m_wb_dat_o = sw ? s_wb1_dat_i : s_wb0_dat_i;
    assign m_wb_we_o  = sw ? s_wb1_we_i  : s_wb0_we_i;
    assign m_wb_sel_o = sw ? s_wb1_sel_i : s_wb0_sel_i;
    assign m_wb_stb_o = sw ? s_wb1_stb_i : s_wb0_stb_i;
    
    assign s_wb0_dat_o = m_wb_dat_i;
    assign s_wb0_ack_o = !sw ? m_wb_ack_i : 1'b0;
    
    assign s_wb1_dat_o = m_wb_dat_i;
    assign s_wb1_ack_o = sw ? m_wb_ack_i : 1'b0;
    
endmodule


`default_nettype wire


// end of file
