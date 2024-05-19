// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2021 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



// WISHBONE => AXI4Lite converter
module jelly_wishbone_to_axi4l
        #(
            parameter   WB_ADR_WIDTH     = 30,
            parameter   WB_DAT_SIZE      = 2,                       // 0:8bit, 1:16bit, 2:32bit ...
            parameter   WB_DAT_WIDTH     = (8 << WB_DAT_SIZE),
            parameter   WB_SEL_WIDTH     = WB_DAT_WIDTH / 8,
            
            parameter   AXI4L_ADDR_WIDTH = WB_ADR_WIDTH + WB_DAT_SIZE,
            parameter   AXI4L_DATA_WIDTH = WB_DAT_WIDTH,
            parameter   AXI4L_STRB_WIDTH = WB_SEL_WIDTH
        )
        (
            // WISHBONE
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_we_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            
            // AXI4Light
            output  wire                            m_axi4l_aresetn,
            output  wire                            m_axi4l_aclk,
            output  wire    [AXI4L_ADDR_WIDTH-1:0]  m_axi4l_awaddr,
            output  wire    [2:0]                   m_axi4l_awprot,
            output  wire                            m_axi4l_awvalid,
            input   wire                            m_axi4l_awready,
            output  wire    [AXI4L_STRB_WIDTH-1:0]  m_axi4l_wstrb,
            output  wire    [AXI4L_DATA_WIDTH-1:0]  m_axi4l_wdata,
            output  wire                            m_axi4l_wvalid,
            input   wire                            m_axi4l_wready,
            input   wire    [1:0]                   m_axi4l_bresp,
            input   wire                            m_axi4l_bvalid,
            output  wire                            m_axi4l_bready,
            output  wire    [AXI4L_ADDR_WIDTH-1:0]  m_axi4l_araddr,
            output  wire    [2:0]                   m_axi4l_arprot,
            output  wire                            m_axi4l_arvalid,
            input   wire                            m_axi4l_arready,
            input   wire    [AXI4L_DATA_WIDTH-1:0]  m_axi4l_rdata,
            input   wire    [1:0]                   m_axi4l_rresp,
            input   wire                            m_axi4l_rvalid,
            output  wire                            m_axi4l_rready
        );
    
    
    reg                             reg_busy;
    reg                             reg_awvalid;
    reg                             reg_wvalid;
    reg                             reg_arvalid;
    
    always @( posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_busy     <= 1'b0;
            reg_awvalid  <= 1'b0;
            reg_wvalid   <= 1'b0;
            reg_arvalid  <= 1'b0;
        end
        else begin
            if ( s_wb_ack_o      ) begin reg_busy    <= 1'b0; end
            if ( m_axi4l_awready ) begin reg_awvalid <= 1'b0; end
            if ( m_axi4l_wready  ) begin reg_wvalid  <= 1'b0; end
            if ( m_axi4l_arready ) begin reg_arvalid <= 1'b0; end
            
            if ( !reg_busy && s_wb_stb_i ) begin
                reg_busy    <= 1'b1;
                reg_awvalid <= s_wb_we_i;
                reg_wvalid  <= s_wb_we_i;
                reg_arvalid <= ~s_wb_we_i;
            end
        end
    end
    
    assign s_wb_dat_o      = m_axi4l_rdata;
    assign s_wb_ack_o      = (m_axi4l_bvalid || m_axi4l_rvalid);
    
    assign m_axi4l_aresetn = ~s_wb_rst_i;
    assign m_axi4l_aclk    = s_wb_clk_i;
    assign m_axi4l_awaddr  = {s_wb_adr_i, {WB_DAT_SIZE{1'b0}}};
    assign m_axi4l_awprot  = 3'd0;
    assign m_axi4l_awvalid = reg_awvalid;
    assign m_axi4l_wstrb   = s_wb_sel_i;
    assign m_axi4l_wdata   = s_wb_dat_i;
    assign m_axi4l_wvalid  = reg_wvalid;
    assign m_axi4l_bready  = 1'b1;
    assign m_axi4l_araddr  = {s_wb_adr_i, {WB_DAT_SIZE{1'b0}}};
    assign m_axi4l_arprot  = 3'd0;
    assign m_axi4l_arvalid = reg_arvalid;
    assign m_axi4l_rready  = 1'b1;
    
    
endmodule


`default_nettype wire


// end of file
