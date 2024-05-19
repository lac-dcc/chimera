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



module jelly_wishbone_width_converter
        #(
            parameter   S_WB_DAT_SIZE   = 3,    // 2^n (0:8bit, 1:16bit, 2:32bit, 3:64bit ...)
            parameter   S_WB_ADR_WIDTH  = 29,
            parameter   S_WB_DAT_WIDTH  = (8 << S_WB_DAT_SIZE),
            parameter   S_WB_SEL_WIDTH  = (1 << S_WB_DAT_SIZE),
            
            parameter   M_WB_DAT_SIZE   = 2,    // 2^n (0:8bit, 1:16bit, 2:32bit, 3:64bit ...)
            parameter   M_WB_ADR_WIDTH  = S_WB_ADR_WIDTH + S_WB_DAT_SIZE - M_WB_DAT_SIZE,
            parameter   M_WB_DAT_WIDTH  = (8 << M_WB_DAT_SIZE),
            parameter   M_WB_SEL_WIDTH  = (1 << M_WB_DAT_SIZE)
        )
        (
            // system
            input   wire                            clk,
            input   wire                            reset,
            
            input   wire                            endian,
            
            // master port
            input   wire    [S_WB_ADR_WIDTH-1:0]    s_wb_adr_i,
            output  wire    [S_WB_DAT_WIDTH-1:0]    s_wb_dat_o,
            input   wire    [S_WB_DAT_WIDTH-1:0]    s_wb_dat_i,
            input   wire                            s_wb_we_i,
            input   wire    [S_WB_SEL_WIDTH-1:0]    s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            // master port
            output  wire    [M_WB_ADR_WIDTH-1:0]    m_wb_adr_o,
            output  wire    [M_WB_DAT_WIDTH-1:0]    m_wb_dat_o,
            input   wire    [M_WB_DAT_WIDTH-1:0]    m_wb_dat_i,
            output  wire                            m_wb_we_o,
            output  wire    [M_WB_SEL_WIDTH-1:0]    m_wb_sel_o,
            output  wire                            m_wb_stb_o,
            input   wire                            m_wb_ack_i
        );
    
    localparam  RATE = (S_WB_DAT_SIZE > M_WB_DAT_SIZE) ? (S_WB_DAT_SIZE - M_WB_DAT_SIZE) : (M_WB_DAT_SIZE - S_WB_DAT_SIZE);
    
    generate
    if ( M_WB_DAT_SIZE < S_WB_DAT_SIZE ) begin
        // to narrow
        reg     [RATE-1:0]                  reg_counter;
        integer                             i0, j0;
        reg     [S_WB_DAT_WIDTH-1:0]    reg_master_dat_i;
        always @(posedge clk) begin
            if ( reset ) begin
                reg_counter <= {RATE{1'b0}};
            end
            else begin
                if ( s_wb_stb_i & ((m_wb_sel_o == 0) | m_wb_ack_i) ) begin
                    reg_counter <= reg_counter + 1;
                end
            end
            
            for ( i0 = 0; i0 < (1 << RATE); i0 = i0 + 1 ) begin
                if ( i0 == reg_counter ) begin
                    for ( j0 = 0; j0 < M_WB_DAT_WIDTH; j0 = j0 + 1 ) begin
                        reg_master_dat_i[M_WB_DAT_WIDTH*i0 + j0] <= m_wb_dat_i[j0];
                    end
                end
            end
        end
        
        reg     [M_WB_DAT_WIDTH-1:0]    tmp_m_dat_o;
        reg     [M_WB_SEL_WIDTH-1:0]    tmp_m_sel_o;
        reg     [S_WB_DAT_WIDTH-1:0]    tmp_s_dat_o;
        integer                             i1, j1;
        always @* begin
            tmp_m_dat_o = {M_WB_DAT_WIDTH{1'b0}};
            tmp_m_sel_o = {M_WB_SEL_WIDTH{1'b0}}; 
            tmp_s_dat_o  = {S_WB_DAT_WIDTH-1{1'b0}};
            for ( i1 = 0; i1 < (1 << RATE); i1 = i1 + 1 ) begin
                if ( i1 == (reg_counter ^ {RATE{endian}}) ) begin
                    for ( j1 = 0; j1 < M_WB_DAT_WIDTH; j1 = j1 + 1 ) begin
                        tmp_m_dat_o[j1] = s_wb_dat_i[M_WB_DAT_WIDTH*i1 + j1];
                    end
                    for ( j1 = 0; j1 < M_WB_SEL_WIDTH; j1 = j1 + 1 ) begin
                        tmp_m_sel_o[j1] = s_wb_sel_i[M_WB_SEL_WIDTH*i1 + j1];
                    end
                end
            end
            
            for ( i1 = 0; i1 < (1 << RATE); i1 = i1 + 1 ) begin
                if ( i1 == {RATE{1'b1}} ) begin
                    for ( j1 = 0; j1 < M_WB_DAT_WIDTH; j1 = j1 + 1 ) begin
                        tmp_s_dat_o[M_WB_DAT_WIDTH*(i1 ^ {RATE{endian}}) + j1] = m_wb_dat_i[j1];
                    end
                end
                else begin
                    for ( j1 = 0; j1 < M_WB_DAT_WIDTH; j1 = j1 + 1 ) begin
                        tmp_s_dat_o[M_WB_DAT_WIDTH*(i1 ^ {RATE{endian}}) + j1] = reg_master_dat_i[M_WB_DAT_WIDTH*i1 + j1];
                    end
                end
            end
        end
        
        assign m_wb_adr_o = {s_wb_adr_i, reg_counter};
        assign m_wb_dat_o = tmp_m_dat_o;
        assign m_wb_we_o  = s_wb_we_i;
        assign m_wb_sel_o = tmp_m_sel_o;
        assign m_wb_stb_o = s_wb_stb_i & (tmp_m_sel_o != 0);
        
        assign s_wb_dat_o = tmp_s_dat_o;
        assign s_wb_ack_o = (reg_counter == {RATE{1'b1}}) & ((m_wb_sel_o == 0) | m_wb_ack_i); 
    end
    else if ( M_WB_DAT_SIZE > S_WB_DAT_SIZE ) begin
        // to wide
        reg     [M_WB_SEL_WIDTH-1:0]    tmp_m_sel_o;
        reg     [S_WB_DAT_WIDTH-1:0]    tmp_s_dat_o;
        integer                         i, j;
        always @* begin
            tmp_m_sel_o = {M_WB_SEL_WIDTH{1'b0}};
            tmp_s_dat_o  = {S_WB_DAT_WIDTH{1'b0}};
            for ( i = 0; i < (1 << RATE); i = i + 1 ) begin
                if ( i == (s_wb_adr_i[RATE-1:0] ^ {RATE{endian}}) ) begin
                    for ( j = 0; j < S_WB_SEL_WIDTH; j = j + 1 ) begin
                        tmp_m_sel_o[S_WB_SEL_WIDTH*i + j] = s_wb_sel_i[j];
                    end
                    for ( j = 0; j < S_WB_DAT_WIDTH; j = j + 1 ) begin
                        tmp_s_dat_o[j] = m_wb_dat_i[S_WB_DAT_WIDTH*i + j];
                    end
                end
            end
        end
        assign m_wb_adr_o = (s_wb_adr_i >> RATE);
        assign m_wb_dat_o = {(1 << RATE){s_wb_dat_i}};
        assign s_wb_dat_o = tmp_s_dat_o;
        assign m_wb_we_o  = s_wb_we_i;
        assign m_wb_sel_o = tmp_m_sel_o;
        assign m_wb_stb_o = s_wb_stb_i;
        assign s_wb_ack_o = m_wb_ack_i;
    end
    else begin
        // same width
        assign m_wb_adr_o = s_wb_adr_i;
        assign m_wb_dat_o = s_wb_dat_i;
        assign s_wb_dat_o = m_wb_dat_i;
        assign m_wb_we_o  = s_wb_we_i;
        assign m_wb_sel_o = s_wb_sel_i;
        assign m_wb_stb_o = s_wb_stb_i;
        assign s_wb_ack_o = m_wb_ack_i;
    end
    endgenerate
    
endmodule



`default_nettype wire


// end of file
