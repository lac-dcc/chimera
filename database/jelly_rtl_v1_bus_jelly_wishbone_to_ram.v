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



module jelly_wishbone_to_ram
        #(
            parameter   WB_ADR_WIDTH  = 12,
            parameter   WB_DAT_WIDTH  = 32,
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            // wishbone
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            // ram
            output  wire                        m_ram_en,
            output  wire                        m_ram_we,
            output  wire    [WB_ADR_WIDTH-1:0]  m_ram_addr,
            output  wire    [WB_DAT_WIDTH-1:0]  m_ram_wdata,
            input   wire    [WB_DAT_WIDTH-1:0]  m_ram_rdata
        );
    
    
    // write mask
    function [WB_DAT_WIDTH-1:0] make_write_mask;
    input   [WB_SEL_WIDTH-1:0]  sel;
    integer                 i, j;
    begin
        for ( i = 0; i < WB_SEL_WIDTH; i = i + 1 ) begin
            for ( j = 0; j < 8; j = j + 1 ) begin
                make_write_mask[i*8 + j] = sel[i];
            end
        end
    end
    endfunction
    
    wire    [WB_DAT_WIDTH-1:0]  write_mask;
    assign write_mask = make_write_mask(s_wb_sel_i);
    
    reg         reg_ack;
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_ack <= 1'b0;
        end
        else begin
            reg_ack <= !reg_ack & s_wb_stb_i;
        end
    end
    
    assign s_wb_dat_o  = m_ram_rdata;
    assign s_wb_ack_o  = reg_ack;
    
    assign m_ram_en    = s_wb_stb_i;
    assign m_ram_we    = s_wb_we_i & reg_ack;
    assign m_ram_addr  = s_wb_adr_i;
    assign m_ram_wdata = (m_ram_rdata & ~write_mask) | (s_wb_dat_i & write_mask);
    
    
endmodule



`default_nettype wire


// end of file
