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


// WISHBONE bus to Jelly bus
module jelly_wishbone_to_jbus
        #(
            parameter   ADDR_WIDTH   = 30,
            parameter   DATA_SIZE    = 2,               // 0:8bit, 1:16bit, 2:32bit ...
            parameter   SEL_WIDTH    = (1 << DATA_SIZE),
            parameter   DATA_WIDTH   = (8 << DATA_SIZE),
            parameter   PIPELINE     = 1
        )
        (
            // system
            input   wire                                reset,
            input   wire                                clk,
            
            // WISHBONE bus
            input   wire    [ADDR_WIDTH-1:0]            s_wb_adr_i,
            input   wire    [DATA_WIDTH-1:0]            s_wb_dat_i,
            output  wire    [DATA_WIDTH-1:0]            s_wb_dat_o,
            input   wire                                s_wb_we_i,
            input   wire    [SEL_WIDTH-1:0]             s_wb_sel_i,
            input   wire                                s_wb_stb_i,
            output  wire                                s_wb_ack_o,
            
            // CPU bus
            output  wire                                m_jbus_en,
            output  wire    [ADDR_WIDTH-1:0]            m_jbus_addr,
            output  wire    [DATA_WIDTH-1:0]            m_jbus_wdata,
            input   wire    [DATA_WIDTH-1:0]            m_jbus_rdata,
            output  wire                                m_jbus_we,
            output  wire    [SEL_WIDTH-1:0]             m_jbus_sel,
            output  wire                                m_jbus_valid,
            input   wire                                m_jbus_ready
        );
    
    
    // read state
    reg                         reg_m_read;
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_m_read<= 1'b0;
        end
        else begin
            if ( m_jbus_en & m_jbus_ready ) begin
                reg_m_read <= m_jbus_valid & !m_jbus_we;
            end
        end
    end
    
    
    generate
    if ( PIPELINE == 0 ) begin
        // no wait
        assign m_jbus_en    = 1'b1;
        assign m_jbus_addr  = s_wb_adr_i;
        assign m_jbus_wdata = s_wb_dat_i;
        assign m_jbus_we    = s_wb_we_i;
        assign m_jbus_sel   = s_wb_sel_i;
        assign m_jbus_valid = s_wb_stb_i & !reg_m_read;
        
        assign s_wb_dat_o = m_jbus_rdata;
        assign s_wb_ack_o = m_jbus_ready & (reg_m_read | m_jbus_we);
    end
    else begin
        // insert FF
        reg     [ADDR_WIDTH-1:0]    reg_jbus_addr;
        reg     [DATA_WIDTH-1:0]    reg_jbus_wdata;
        reg                         reg_jbus_we;
        reg     [SEL_WIDTH-1:0]     reg_jbus_sel;
        reg                         reg_jbus_valid;
        reg     [DATA_WIDTH-1:0]    reg_wb_dat_o;
        reg                         reg_wb_ack_o;
        
        always @( posedge clk ) begin
            if ( reset ) begin
                reg_jbus_addr  <= {ADDR_WIDTH{1'bx}};
                reg_jbus_wdata <= {DATA_WIDTH{1'bx}};
                reg_jbus_we    <= 1'bx;
                reg_jbus_sel   <= {SEL_WIDTH{1'bx}};
                reg_jbus_valid <= 1'b0;
                
                reg_wb_dat_o   <= {DATA_WIDTH{1'bx}};
                reg_wb_ack_o   <= 1'b0;
            end
            else begin
                if ( m_jbus_ready ) begin
                    reg_jbus_addr  <= s_wb_adr_i;
                    reg_jbus_wdata <= s_wb_dat_i;
                    reg_jbus_we    <= s_wb_we_i;
                    reg_jbus_sel   <= s_wb_sel_i;
                    reg_jbus_valid <= s_wb_stb_i & !reg_m_read;
                    
                    reg_wb_dat_o   <= m_jbus_rdata;
                    reg_wb_ack_o   <= s_wb_stb_i & (s_wb_we_i | & reg_m_read);
                end
                else begin
                    reg_wb_dat_o   <= m_jbus_rdata;
                    reg_wb_ack_o   <= 1'b0;
                end
            end
        end
        
        assign m_jbus_en    = 1'b1;
        assign m_jbus_addr  = reg_jbus_addr;
        assign m_jbus_wdata = reg_jbus_wdata;
        assign m_jbus_we    = reg_jbus_we;
        assign m_jbus_sel   = reg_jbus_sel;
        assign m_jbus_valid = reg_jbus_valid;
        
        assign s_wb_dat_o    = reg_wb_dat_o;
        assign s_wb_ack_o    = reg_wb_ack_o;
    end
    endgenerate
    
endmodule


`default_nettype wire


// end of file
