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



module jelly_sram
        #(
            parameter   WB_ADR_WIDTH  = 10,
            parameter   WB_DAT_WIDTH  = 32,
            parameter   WB_SEL_WIDTH  = (WB_DAT_WIDTH / 8),
            parameter   READMEMB      = 0,
            parameter   READMEMH      = 0,
            parameter   READMEM_FILE  = ""
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
            output  wire                        s_wb_ack_o
        );
    
    wire                        ram_en;
    wire                        ram_we;
    wire    [WB_ADR_WIDTH-1:0]  ram_addr;
    wire    [WB_DAT_WIDTH-1:0]  ram_wdata;
    wire    [WB_DAT_WIDTH-1:0]  ram_rdata;
    
    jelly_wishbone_to_ram
            #(
                .WB_ADR_WIDTH   (WB_ADR_WIDTH),
                .WB_DAT_WIDTH   (WB_DAT_WIDTH)
            )
        i_wishbone_to_ram
            (
                .reset          (reset),
                .clk            (clk),
                
                .s_wb_adr_i     (s_wb_adr_i),
                .s_wb_dat_o     (s_wb_dat_o),
                .s_wb_dat_i     (s_wb_dat_i),
                .s_wb_we_i      (s_wb_we_i),
                .s_wb_sel_i     (s_wb_sel_i),
                .s_wb_stb_i     (s_wb_stb_i),
                .s_wb_ack_o     (s_wb_ack_o),
                
                .m_ram_en       (ram_en),
                .m_ram_we       (ram_we),
                .m_ram_addr     (ram_addr),
                .m_ram_wdata    (ram_wdata),
                .m_ram_rdata    (ram_rdata)
            );
    
    jelly_ram_singleport
            #(
                .ADDR_WIDTH     (WB_ADR_WIDTH),
                .DATA_WIDTH     (WB_DAT_WIDTH),
                .MODE           ("WRITE_FIRST"),
                .FILLMEM        (0),
                .FILLMEM_DATA   ({WB_DAT_WIDTH{1'b0}}),
                .READMEMB       (READMEMB),
                .READMEMH       (READMEMH),
                .READMEM_FILE   (READMEM_FILE)
            )
        i_ram_singleport
            (
                .clk            (clk),
                .en             (ram_en),
                .regcke         (1'b0),
                .we             (ram_we),
                .addr           (ram_addr),
                .din            (ram_wdata),
                .dout           (ram_rdata)
            );
    
endmodule



`default_nettype wire


// end of file
