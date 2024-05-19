// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps



// block sram interface
module jelly_jbus_to_ram
        #(
            parameter   ADDR_WIDTH  = 12,
            parameter   DATA_WIDTH  = 32,
            parameter   SEL_WIDTH   = (DATA_WIDTH / 8)
        )
        (
            input   wire                        reset,
            input   wire                        clk,
            
            // jelly bus
            input   wire                        s_jbus_en,
            input   wire    [ADDR_WIDTH-1:0]    s_jbus_addr,
            input   wire    [DATA_WIDTH-1:0]    s_jbus_wdata,
            output  wire    [DATA_WIDTH-1:0]    s_jbus_rdata,
            input   wire                        s_jbus_we,
            input   wire    [SEL_WIDTH-1:0]     s_jbus_sel,
            input   wire                        s_jbus_valid,
            output  wire                        s_jbus_ready,
            
            // ram
            output  wire                        m_ram_en,
            output  wire                        m_ram_we,
            output  wire    [ADDR_WIDTH-1:0]    m_ram_addr,
            output  wire    [DATA_WIDTH-1:0]    m_ram_wdata,
            input   wire    [DATA_WIDTH-1:0]    m_ram_rdata
        );
    
    // write control
    reg                         reg_we;
    reg     [ADDR_WIDTH-1:0]    reg_addr;
    reg     [SEL_WIDTH-1:0]     reg_sel;
    reg     [DATA_WIDTH-1:0]    reg_wdata;
    always @( posedge clk ) begin
        if ( reset ) begin
            reg_we    <= 1'b0;
            reg_sel   <= {SEL_WIDTH{1'bx}};
            reg_wdata <= {DATA_WIDTH{1'bx}};
        end
        else begin
            if ( s_jbus_en & s_jbus_ready ) begin
                reg_we    <= s_jbus_valid & s_jbus_we;
                reg_addr  <= s_jbus_addr;
                reg_sel   <= s_jbus_sel;
                reg_wdata <= s_jbus_wdata;
            end
            else begin
                reg_we    <= 1'b0; 
            end
        end
    end
    
    // write mask
    function [DATA_WIDTH-1:0] make_write_mask;
    input   [SEL_WIDTH-1:0] sel;
    integer                 i, j;
    begin
        for ( i = 0; i < SEL_WIDTH; i = i + 1 ) begin
            for ( j = 0; j < 8; j = j + 1 ) begin
                make_write_mask[i*8 + j] = sel[i];
            end
        end
    end
    endfunction
    
    wire    [DATA_WIDTH-1:0]    write_mask;
    assign write_mask = make_write_mask(reg_sel);
    
    assign s_jbus_rdata = m_ram_rdata;
    assign s_jbus_ready = !(s_jbus_valid & reg_we);
    
    assign m_ram_en     = (s_jbus_en & s_jbus_valid) | reg_we;
    assign m_ram_we     = reg_we;
    assign m_ram_addr   = reg_we ? reg_addr : s_jbus_addr;
    assign m_ram_wdata  = (m_ram_rdata & ~write_mask) | (reg_wdata & write_mask);
    
endmodule


// end of file
