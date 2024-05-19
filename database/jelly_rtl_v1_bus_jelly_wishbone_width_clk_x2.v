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



// whishbone x2 clock and width convert bridge
module jelly_wishbone_width_clk_x2
        #(
            parameter   S_WB_ADR_WIDTH  = 30,
            parameter   S_WB_DAT_WIDTH  = 32,
            parameter   S_WB_SEL_WIDTH  = (S_WB_DAT_WIDTH / 8),
            
            parameter   M_WB_ADR_WIDTH = S_WB_ADR_WIDTH + 1,
            parameter   M_WB_DAT_WIDTH = (S_WB_DAT_WIDTH >> 1),
            parameter   M_WB_SEL_WIDTH = (S_WB_SEL_WIDTH >> 1)
        )
        (
            //system
            input   wire                                reset,
            input   wire                                clk,
            input   wire                                clk_x2,
            
            // endian
            input   wire                                endian,
            
            // slave port (WISHBONE)
            input   wire    [S_WB_ADR_WIDTH-1:0]    s_wb_adr_i,
            output  reg     [S_WB_DAT_WIDTH-1:0]    s_wb_dat_o,
            input   wire    [S_WB_DAT_WIDTH-1:0]    s_wb_dat_i,
            input   wire                                s_wb_we_i,
            input   wire    [S_WB_SEL_WIDTH-1:0]    s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  reg                                 s_wb_ack_o,
            
            // master port (WISHBONE)
            output  wire    [M_WB_ADR_WIDTH-1:0]    m_wb_adr_o,
            output  wire    [M_WB_DAT_WIDTH-1:0]    m_wb_dat_o,
            input   wire    [M_WB_DAT_WIDTH-1:0]    m_wb_dat_i,
            output  wire                                m_wb_we_o,
            output  wire    [M_WB_SEL_WIDTH-1:0]    m_wb_sel_o,
            output  wire                                m_wb_stb_o,
            input   wire                                m_wb_ack_i
        );
    
    localparam  DELAY = 1.0;
    
    // remove clock jitter when simutation
    reg                                 delay_clk;
    reg     [S_WB_ADR_WIDTH-1:0]        tmp_s_wb_adr_i;
    reg     [S_WB_DAT_WIDTH-1:0]        tmp_s_wb_dat_i;
    reg                                 tmp_s_wb_we_i;
    reg     [S_WB_SEL_WIDTH-1:0]        tmp_s_wb_sel_i;
    reg                                 tmp_s_wb_stb_i;
    wire    [S_WB_DAT_WIDTH-1:0]        tmp_s_wb_dat_o;
    wire                                tmp_s_wb_ack_o;
    always @* begin
        delay_clk          <= #DELAY clk;
        tmp_s_wb_adr_i <= #DELAY s_wb_adr_i;
        tmp_s_wb_dat_i <= #DELAY s_wb_dat_i;
        tmp_s_wb_we_i  <= #DELAY s_wb_we_i;
        tmp_s_wb_sel_i <= #DELAY s_wb_sel_i;
        tmp_s_wb_stb_i <= #DELAY s_wb_stb_i;
        s_wb_dat_o     <= #DELAY tmp_s_wb_dat_o;
        s_wb_ack_o     <= #DELAY tmp_s_wb_ack_o;
    end
    
    
    // clock phase
    reg             reg_phase;
    always @( posedge clk_x2 ) begin
        reg_phase <= delay_clk;
    end
    
    // control
    reg                                 reg_2nd;
    reg                                 reg_end;
    reg     [M_WB_DAT_WIDTH-1:0]    reg_read_dat1;
    reg     [M_WB_DAT_WIDTH-1:0]    reg_read_dat2;
        
    always @( posedge clk_x2 ) begin
        if ( reset ) begin
            reg_2nd       <= 1'b0;
            reg_end       <= 1'b0;
            reg_read_dat1 <= {S_WB_DAT_WIDTH{1'bx}};
            reg_read_dat2 <= {S_WB_DAT_WIDTH{1'bx}};
        end
        else begin
            if ( reg_end ) begin
                if ( reg_phase == 1'b1 ) begin
                    reg_end  <= 1'b0;
                end
            end
            else begin
                if ( reg_2nd == 1'b0 ) begin
                    // 1st word
                    reg_read_dat1 <= m_wb_dat_i;
                    reg_2nd       <= tmp_s_wb_stb_i & ((m_wb_sel_o == 0) | m_wb_ack_i);
                end
                else begin
                    // 2nd word
                    reg_read_dat2 <= m_wb_dat_i;
                    if ( (m_wb_sel_o == 0) | m_wb_ack_i ) begin
                        reg_2nd <= 1'b0;
                        reg_end <= (reg_phase != 1'b1);
                    end
                end
            end
        end
    end
    
    wire    [M_WB_DAT_WIDTH-1:0]    read_dat1;
    wire    [M_WB_DAT_WIDTH-1:0]    read_dat2;
    assign read_dat1 = reg_read_dat1;
    assign read_dat2 = reg_end ? reg_read_dat2 : m_wb_dat_i;
    
    wire    [M_WB_DAT_WIDTH-1:0]    write_dat1;
    wire    [M_WB_DAT_WIDTH-1:0]    write_dat2;
    wire    [M_WB_SEL_WIDTH-1:0]    write_sel1;
    wire    [M_WB_SEL_WIDTH-1:0]    write_sel2;
    assign write_dat1 = endian ? tmp_s_wb_dat_i[M_WB_DAT_WIDTH +: M_WB_DAT_WIDTH] : tmp_s_wb_dat_i[0 +: M_WB_DAT_WIDTH];
    assign write_dat2 = endian ? tmp_s_wb_dat_i[0 +: M_WB_DAT_WIDTH] : tmp_s_wb_dat_i[M_WB_DAT_WIDTH +: M_WB_DAT_WIDTH];
    assign write_sel1 = endian ? tmp_s_wb_sel_i[M_WB_SEL_WIDTH +: M_WB_SEL_WIDTH] : tmp_s_wb_sel_i[0 +: M_WB_SEL_WIDTH];
    assign write_sel2 = endian ? tmp_s_wb_sel_i[0 +: M_WB_SEL_WIDTH] : tmp_s_wb_sel_i[M_WB_SEL_WIDTH +: M_WB_SEL_WIDTH];
    
    
    assign m_wb_adr_o = {tmp_s_wb_adr_i, reg_2nd};
    assign m_wb_dat_o = reg_2nd ? write_dat2 : write_dat1;
    assign m_wb_we_o  = tmp_s_wb_we_i;
    assign m_wb_sel_o = reg_2nd ? write_sel2 : write_sel1;
    assign m_wb_stb_o = tmp_s_wb_stb_i & (m_wb_sel_o != 0) & !reg_end;
    
    assign tmp_s_wb_dat_o  = endian ? {read_dat1, read_dat2} : {read_dat2, read_dat1};
    assign tmp_s_wb_ack_o  = reg_end | (reg_2nd & ((m_wb_sel_o == 0) | m_wb_ack_i));
    
endmodule



`default_nettype wire


// end of file
