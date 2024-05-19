// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



module jelly_cache_core
        #(
            parameter   LINE_SIZE         = 2,      // 2^n (0:1words, 1:2words, 2:4words ...)
            parameter   ARRAY_SIZE        = 8,      // 2^n (1:2lines, 2:4lines 3:8lines ...)
            parameter   LINE_WORDS        = (1 << LINE_SIZE),
            
            parameter   SLAVE_ADDR_WIDTH  = 24,
            parameter   SLAVE_DATA_SIZE   = 2,      // 2^n (0:8bit, 1:16bit, 2:32bit ...)
            parameter   SLAVE_DATA_WIDTH  = (8 << SLAVE_DATA_SIZE),
            parameter   SLAVE_SEL_WIDTH   = (1 << SLAVE_DATA_SIZE),
            
            parameter   MASTER_ADR_WIDTH  = SLAVE_ADDR_WIDTH - LINE_SIZE,
            parameter   MASTER_DAT_SIZE   = SLAVE_DATA_SIZE + LINE_SIZE,
            parameter   MASTER_DAT_WIDTH  = (8 << MASTER_DAT_SIZE),
            parameter   MASTER_SEL_WIDTH  = (1 << MASTER_DAT_SIZE),
                        
            parameter   CACHE_OFFSET_WIDTH = LINE_SIZE,
            parameter   CACHE_INDEX_WIDTH  = ARRAY_SIZE,
            parameter   CACHE_TAGADR_WIDTH = SLAVE_ADDR_WIDTH - (CACHE_INDEX_WIDTH + CACHE_OFFSET_WIDTH),
            parameter   CACHE_DATA_WIDTH   = MASTER_DAT_WIDTH,

            parameter   RAM_ADDR_WIDTH     = CACHE_INDEX_WIDTH,
            parameter   RAM_DATA_WIDTH     = 1 + CACHE_TAGADR_WIDTH + CACHE_DATA_WIDTH
        )
        (
            // system
            input   wire                            clk,
            input   wire                            reset,
            input   wire                            endian,
            
            // slave port
            input   wire                            s_jbus_en,
            input   wire    [SLAVE_ADDR_WIDTH-1:0]  s_jbus_addr,
            input   wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus_wdata,
            output  wire    [SLAVE_DATA_WIDTH-1:0]  s_jbus_rdata,
            input   wire                            s_jbus_we,
            input   wire    [SLAVE_SEL_WIDTH-1:0]   s_jbus_sel,
            input   wire                            s_jbus_valid,
            output  wire                            s_jbus_ready,
            
            // master port
            output  wire    [MASTER_ADR_WIDTH-1:0]  m_wb_adr_o,
            output  wire    [MASTER_DAT_WIDTH-1:0]  m_wb_dat_o,
            input   wire    [MASTER_DAT_WIDTH-1:0]  m_wb_dat_i,
            output  wire                            m_wb_we_o,
            output  wire    [MASTER_SEL_WIDTH-1:0]  m_wb_sel_o,
            output  wire                            m_wb_stb_o,
            input   wire                            m_wb_ack_i,
            
            // ram port
            output  wire                            m_ram_en,
            output  wire                            m_ram_we,
            output  wire    [RAM_ADDR_WIDTH-1:0]    m_ram_addr,
            output  wire    [RAM_DATA_WIDTH-1:0]    m_ram_wdata,
            input   wire    [RAM_DATA_WIDTH-1:0]    m_ram_rdata
        );
    
    
    // tag&data RAM assign
    wire                                ram_write_valid;
    wire    [CACHE_TAGADR_WIDTH-1:0]    ram_write_tagadr;
    wire    [CACHE_DATA_WIDTH-1:0]      ram_write_data;
    assign m_ram_wdata = {ram_write_valid, ram_write_tagadr, ram_write_data};
    
    wire                                ram_read_valid;
    wire    [CACHE_TAGADR_WIDTH-1:0]    ram_read_tagadr;
    wire    [CACHE_DATA_WIDTH-1:0]      ram_read_data;
    assign ram_read_data   = m_ram_rdata[CACHE_DATA_WIDTH-1:0];
    assign ram_read_tagadr = m_ram_rdata[CACHE_DATA_WIDTH +: CACHE_TAGADR_WIDTH];
    assign ram_read_valid  = m_ram_rdata[RAM_DATA_WIDTH-1];
    
    
    // slave address assign
    wire    [CACHE_OFFSET_WIDTH-1:0]    s_jbus_offset;
    wire    [CACHE_INDEX_WIDTH-1:0]     s_jbus_index;
    wire    [CACHE_TAGADR_WIDTH-1:0]    s_jbus_tagadr;
    assign s_jbus_offset = s_jbus_addr[0                                      +: CACHE_OFFSET_WIDTH];
    assign s_jbus_index  = s_jbus_addr[CACHE_OFFSET_WIDTH                     +: CACHE_INDEX_WIDTH];
    assign s_jbus_tagadr = s_jbus_addr[CACHE_OFFSET_WIDTH + CACHE_INDEX_WIDTH +: CACHE_TAGADR_WIDTH];
    
    
    // slave input
    reg                                 reg_s_re;
    reg                                 reg_s_we;
    reg     [CACHE_OFFSET_WIDTH-1:0]    reg_s_offset;
    reg     [CACHE_INDEX_WIDTH-1:0]     reg_s_index;
    reg     [CACHE_TAGADR_WIDTH-1:0]    reg_s_tagadr;
    reg     [SLAVE_SEL_WIDTH-1:0]       reg_s_sel;
    reg     [SLAVE_DATA_WIDTH-1:0]      reg_s_wdata;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_s_re     <= 1'b0;
            reg_s_we     <= 1'b0;
            reg_s_offset <= {CACHE_OFFSET_WIDTH{1'bx}};
            reg_s_index  <= {CACHE_INDEX_WIDTH{1'bx}};
            reg_s_tagadr <= {CACHE_TAGADR_WIDTH{1'bx}}; 
            reg_s_sel    <= {SLAVE_SEL_WIDTH{1'bx}};
            reg_s_wdata  <= {SLAVE_DATA_WIDTH{1'bx}};
        end
        else begin
            if ( s_jbus_en & s_jbus_ready ) begin
                reg_s_re     <= s_jbus_valid & !s_jbus_we;
                reg_s_we     <= s_jbus_valid & s_jbus_we;
                reg_s_offset <= s_jbus_offset;
                reg_s_index  <= s_jbus_index;
                reg_s_tagadr <= s_jbus_tagadr;
                reg_s_sel    <= s_jbus_sel;
                reg_s_wdata  <= s_jbus_wdata;
            end
            else if ( s_jbus_ready ) begin
                reg_s_we     <= 1'b0;
            end
        end
    end
    
    // hit test
    wire    cache_hit;
    wire    cache_read_miss;
    wire    cache_write_hit;
    reg     reg_write_hit_end;
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_write_hit_end <= 1'b0;
        end
        else begin
            if ( reg_write_hit_end ) begin
                if ( s_jbus_ready ) begin
                    reg_write_hit_end <= 1'b0;
                end
            end
            else begin
                reg_write_hit_end <= cache_write_hit;
            end
        end
    end
    
    assign cache_hit       = ram_read_valid & (reg_s_tagadr == ram_read_tagadr);
    assign cache_read_miss = reg_s_re & !cache_hit;
    assign cache_write_hit = reg_s_we & cache_hit & !reg_write_hit_end;
    
    
    // cahce read
    wire    [SLAVE_DATA_WIDTH-1:0]  cache_rdata;
    jelly_multiplexer
            #(
                .SEL_WIDTH      (CACHE_OFFSET_WIDTH),
                .OUT_WIDTH      (SLAVE_DATA_WIDTH)
            )
        i_multiplexer
            (
                .endian         (endian),
                .sel            (reg_s_offset),
                .din            (ram_read_data),
                .dout           (cache_rdata)
            );
    
    // write bls
    wire    [MASTER_SEL_WIDTH-1:0]      write_sel;
    wire    [MASTER_DAT_WIDTH-1:0]      write_data_mask;
    wire    [MASTER_DAT_WIDTH-1:0]      write_data;
    
    jelly_demultiplexer
            #(
                .SEL_WIDTH      (CACHE_OFFSET_WIDTH),
                .IN_WIDTH       (SLAVE_SEL_WIDTH)
            )
        i_demultiplexer_sel
            (
                .endian         (endian),
                .sel            (reg_s_offset),
                .din            (reg_s_sel),
                .dout           (write_sel)
            );
    
    jelly_deselector
            #(
                .SEL_WIDTH      (MASTER_SEL_WIDTH),
                .IN_WIDTH       (8)
            )
        i_deselector_sel_mask
            (
                .sel            (write_sel),
                .din            (8'hff),
                .dout           (write_data_mask)
            );
    
    assign write_data = {LINE_WORDS{reg_s_wdata}};
    
    
    // read end monitor
    wire            read_end;
    reg             read_end_mask;
    always @( posedge clk ) begin
        if ( reset ) begin
            read_end_mask <= 1'b0;
        end
        else begin
            read_end_mask <= read_end;
        end
    end
    assign read_end = !read_end_mask & (m_wb_stb_o & !m_wb_we_o & m_wb_ack_i);
    
    // write end monitor
    reg             write_end;
    always @( posedge clk ) begin
        if ( reset ) begin
            write_end <= 1'b0;
        end
        else begin
            if ( s_jbus_en & s_jbus_ready ) begin
                write_end <= 1'b0;
            end
            else begin
                if ( m_wb_stb_o & m_wb_we_o & m_wb_ack_i ) begin
                    write_end <= 1'b1;
                end
            end
        end
    end
    
    
    // master output
    reg     [MASTER_ADR_WIDTH-1:0]      reg_m_adr_o;
    reg     [MASTER_DAT_WIDTH-1:0]      reg_m_dat_o;
    reg                                 reg_m_we_o;
    reg     [MASTER_SEL_WIDTH-1:0]      reg_m_sel_o;
    reg                                 reg_m_stb_o;
    
    always @ ( posedge clk ) begin
        if ( reset ) begin
            reg_m_adr_o <= {MASTER_ADR_WIDTH{1'bx}};
            reg_m_dat_o <= {MASTER_DAT_WIDTH{1'bx}};
            reg_m_we_o  <= 1'bx;
            reg_m_sel_o <= {MASTER_SEL_WIDTH{1'bx}};
            reg_m_stb_o <= 1'b0;
        end
        else begin
            if ( !(m_wb_stb_o & !m_wb_ack_i) ) begin
                reg_m_stb_o <= (reg_s_we & !write_end) | (cache_read_miss & !read_end);
                reg_m_we_o  <= reg_s_we;
                reg_m_adr_o <= {reg_s_tagadr, reg_s_index};
                reg_m_sel_o <= reg_s_we ? write_sel : {MASTER_SEL_WIDTH{1'b1}};
                reg_m_dat_o <= {LINE_WORDS{reg_s_wdata}};
            end
            else begin
                if ( m_wb_ack_i ) begin
                    reg_m_stb_o <= 1'b0;
                end
            end
        end
    end
    
    assign m_wb_adr_o       = reg_m_adr_o;
    assign m_wb_dat_o       = reg_m_dat_o;
    assign m_wb_we_o        = reg_m_we_o;
    assign m_wb_sel_o       = reg_m_sel_o;
    assign m_wb_stb_o       = reg_m_stb_o;
    
    assign m_ram_en         = read_end | cache_write_hit | (s_jbus_en & s_jbus_valid & s_jbus_ready);
    assign m_ram_we         = read_end | cache_write_hit;
    assign m_ram_addr       = m_ram_we ? reg_s_index : s_jbus_index;
    assign ram_write_valid  = 1'b1;
    assign ram_write_tagadr = reg_s_tagadr;
    assign ram_write_data   = read_end ? m_wb_dat_i : ((write_data_mask & write_data) | (~write_data_mask & ram_read_data));
    
    assign s_jbus_rdata     = cache_rdata;
//  assign s_jbus_ready     = !((m_wb_stb_o & !m_wb_ack_i) | cache_read_miss | cache_write_hit);
    assign s_jbus_ready     = !(
                                    ((m_wb_stb_o & !m_wb_ack_i) &((reg_s_we & !write_end) | (cache_read_miss & !read_end)))
                                    | cache_read_miss
                                    | cache_write_hit
                                );
    
endmodule


// end of file
