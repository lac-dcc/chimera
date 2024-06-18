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


// whishbone x2 clock bridge
module jelly_wishbone_clk_x2
        #(
            parameter   WB_ADR_WIDTH  = 30,
            parameter   WB_DAT_WIDTH  = 32,
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8)
        )
        (
            //system
            input   wire                        clk,
            input   wire                        clk_x2,
            input   wire                        reset,
            
            // wishbone
            input   wire    [WB_ADR_WIDTH-1:0]  s_wb_adr_i,
            output  reg     [WB_DAT_WIDTH-1:0]  s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  s_wb_dat_i,
            input   wire                        s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]  s_wb_sel_i,
            input   wire                        s_wb_stb_i,
            output  reg                         s_wb_ack_o,
            
            // wishbone
            output  reg     [WB_ADR_WIDTH-1:0]  m_wb_x2_adr_o,
            output  reg     [WB_DAT_WIDTH-1:0]  m_wb_x2_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]  m_wb_x2_dat_i,
            output  reg                         m_wb_x2_we_o,
            output  reg     [WB_SEL_WIDTH-1:0]  m_wb_x2_sel_o,
            output  reg                         m_wb_x2_stb_o,
            input   wire                        m_wb_x2_ack_i
        );
    
    reg                         st_idle;
    reg                         st_busy;
    reg                         st_end;

    always @( posedge clk ) begin
        if ( reset ) begin
            s_wb_ack_o <= 1'b0;
        end
        else begin
            if ( s_wb_stb_i & ~s_wb_ack_o & st_end ) begin
                s_wb_ack_o <= 1'b1;
            end
            else begin
                s_wb_ack_o <= 1'b0;
            end
        end
    end
    
    
    always @( posedge clk_x2 ) begin
        if ( reset ) begin
            st_idle <= 1'b1;
            st_busy <= 1'b0;
            st_end  <= 1'b0;
            
            m_wb_x2_adr_o <= {WB_ADR_WIDTH{1'bx}};
            m_wb_x2_dat_o <= {WB_DAT_WIDTH{1'bx}};
            m_wb_x2_we_o  <= 1'bx;
            m_wb_x2_sel_o <= {WB_SEL_WIDTH{1'bx}};
            m_wb_x2_stb_o <= 1'b0;
        end
        else begin
            if ( st_idle ) begin
                if ( s_wb_stb_i & ~s_wb_ack_o ) begin
                    m_wb_x2_adr_o <= s_wb_adr_i;
                    m_wb_x2_dat_o <= s_wb_dat_i;
                    m_wb_x2_we_o  <= s_wb_we_i;
                    m_wb_x2_sel_o <= s_wb_sel_i;
                    m_wb_x2_stb_o <= 1'b1;
                    
                    st_idle <= 1'b0;
                    st_busy <= 1'b1;
                end
            end
            else if ( st_busy ) begin
                s_wb_dat_o <= m_wb_x2_dat_i;
                if ( m_wb_x2_ack_i ) begin
                    m_wb_x2_stb_o <= 1'b0;
                    st_busy     <= 1'b0;
                    st_end      <= 1'b1;
                end
            end
            else if ( st_end ) begin
                if ( s_wb_ack_o ) begin
                    st_end  <= 1'b0;
                    st_idle <= 1'b1;
                end
            end
        end
    end
    
endmodule



`default_nettype wire


// end of file
