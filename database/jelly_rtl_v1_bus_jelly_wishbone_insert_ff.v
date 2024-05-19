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


// wishbone insert FF
module jelly_wishbone_insert_ff
        #(
            parameter   WB_ADR_WIDTH  = 30,
            parameter   WB_DAT_WIDTH  = 32,
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8),
            parameter   BYPASS        = 1,
            parameter   M_REGS        = !BYPASS,
            parameter   S_REGS        = !BYPASS
        )
        (
            // system
            input   wire                        reset,
            input   wire                        clk,
            
            // slave port
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  wire                        s_wb_ack_o,
            
            // master port
            output  wire    [WB_ADR_WIDTH-1:0]  m_wb_adr_o,
            input   wire    [WB_DAT_WIDTH-1:0]  m_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]  m_wb_dat_o,
            output  wire                        m_wb_we_o,
            output  wire    [WB_SEL_WIDTH-1:0]  m_wb_sel_o,
            output  wire                        m_wb_stb_o,
            input   wire                        m_wb_ack_i
        );
    
    // temporary
    wire    [WB_ADR_WIDTH-1:0]  wb_tmp_adr_o;
    wire    [WB_DAT_WIDTH-1:0]  wb_tmp_dat_i;
    wire    [WB_DAT_WIDTH-1:0]  wb_tmp_dat_o;
    wire                        wb_tmp_we_o;
    wire    [WB_SEL_WIDTH-1:0]  wb_tmp_sel_o;
    wire                        wb_tmp_stb_o;
    wire                        wb_tmp_ack_i;
    
    
    // slave port
    generate
    if ( S_REGS ) begin
        // insert FF
        reg     [WB_DAT_WIDTH-1:0]  reg_s_dat_o;
        reg                         reg_s_ack_o;
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_s_dat_o  <= {WB_DAT_WIDTH{1'bx}};
                reg_s_ack_o  <= 1'b0;
            end
            else begin
                reg_s_dat_o  <= wb_tmp_dat_i;
                reg_s_ack_o  <= wb_tmp_stb_o & wb_tmp_ack_i;
            end
        end
        
        assign wb_tmp_adr_o = s_wb_adr_i;
        assign wb_tmp_dat_o = s_wb_dat_i;
        assign wb_tmp_we_o  = s_wb_we_i;
        assign wb_tmp_sel_o = s_wb_sel_i;
        assign wb_tmp_stb_o = s_wb_stb_i & !reg_s_ack_o;
        
        assign s_wb_dat_o   = reg_s_dat_o;
        assign s_wb_ack_o   = reg_s_ack_o;
    end
    else begin
        // through
        assign wb_tmp_adr_o = s_wb_adr_i;
        assign wb_tmp_dat_o = s_wb_dat_i;
        assign wb_tmp_we_o  = s_wb_we_i;
        assign wb_tmp_sel_o = s_wb_sel_i;
        assign wb_tmp_stb_o = s_wb_stb_i;
        
        assign s_wb_dat_o   = wb_tmp_dat_i;
        assign s_wb_ack_o   = wb_tmp_ack_i;
    end
    endgenerate
    
    
    // master port
    generate
    if ( M_REGS ) begin
        // insert FF
        reg     [WB_ADR_WIDTH-1:0]  reg_m_adr_o;
        reg     [WB_DAT_WIDTH-1:0]  reg_m_dat_o;
        reg                         reg_m_we_o;
        reg     [WB_SEL_WIDTH-1:0]  reg_m_sel_o;
        reg                         reg_m_stb_o;
        always @ ( posedge clk ) begin
            if ( reset ) begin
                reg_m_adr_o <= {WB_ADR_WIDTH{1'bx}};
                reg_m_dat_o <= {WB_DAT_WIDTH{1'bx}};
                reg_m_we_o  <= 1'bx;
                reg_m_sel_o <= {WB_SEL_WIDTH{1'bx}};
                reg_m_stb_o <= 1'b0;
            end
            else begin
                reg_m_adr_o <= wb_tmp_adr_o;
                reg_m_dat_o <= wb_tmp_dat_o;
                reg_m_we_o  <= wb_tmp_we_o;
                reg_m_sel_o <= wb_tmp_sel_o;
                reg_m_stb_o <= wb_tmp_stb_o & !(reg_m_stb_o & wb_tmp_ack_i);
            end
        end
        
        assign m_wb_adr_o   = reg_m_adr_o;
        assign m_wb_dat_o   = reg_m_dat_o;
        assign m_wb_we_o    = reg_m_we_o;
        assign m_wb_sel_o   = reg_m_sel_o;
        assign m_wb_stb_o   = reg_m_stb_o;
        
        assign wb_tmp_dat_i = m_wb_dat_i;
        assign wb_tmp_ack_i = m_wb_ack_i;
    end
    else begin
        // through
        assign m_wb_adr_o   = wb_tmp_adr_o;
        assign m_wb_dat_o   = wb_tmp_dat_o;
        assign m_wb_we_o    = wb_tmp_we_o;
        assign m_wb_sel_o   = wb_tmp_sel_o;
        assign m_wb_stb_o   = wb_tmp_stb_o;
                      
        assign wb_tmp_dat_i = m_wb_dat_i;
        assign wb_tmp_ack_i = m_wb_ack_i;
    end
    endgenerate
    
    
endmodule



`default_nettype wire


// end of file
