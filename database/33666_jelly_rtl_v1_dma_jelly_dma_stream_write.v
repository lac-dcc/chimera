// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns/1ps
`default_nettype none



module jelly_dma_stream_write
        #(
            // 基本設定
            parameter N                    = 2,
            parameter BYTE_WIDTH           = 8,
            
            // WISHBONE
            parameter WB_ASYNC             = 1,
            parameter WB_ADR_WIDTH         = 8,
            parameter WB_DAT_WIDTH         = 32,
            parameter WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8),
            
            // write port
            parameter WASYNC               = 1,
            parameter WDATA_WIDTH          = 32,
            parameter WSTRB_WIDTH          = WDATA_WIDTH / BYTE_WIDTH,
            parameter HAS_WSTRB            = 0,
            parameter HAS_WFIRST           = 0,
            parameter HAS_WLAST            = 0,
            
            // AXI4
            parameter AXI4_ID_WIDTH        = 6,
            parameter AXI4_ADDR_WIDTH      = 32,
            parameter AXI4_DATA_SIZE       = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter AXI4_LEN_WIDTH       = 8,
            parameter AXI4_QOS_WIDTH       = 4,
            parameter AXI4_AWID            = {AXI4_ID_WIDTH{1'b0}},
            parameter AXI4_AWSIZE          = AXI4_DATA_SIZE,
            parameter AXI4_AWBURST         = 2'b01,
            parameter AXI4_AWLOCK          = 1'b0,
            parameter AXI4_AWCACHE         = 4'b0001,
            parameter AXI4_AWPROT          = 3'b000,
            parameter AXI4_AWQOS           = 0,
            parameter AXI4_AWREGION        = 4'b0000,
            parameter AXI4_ALIGN           = 12,  // 2^12 = 4k が境界
            
            // レジスタ構成など
            parameter INDEX_WIDTH          = 1,
            parameter AWLEN_OFFSET         = 1'b1,
            parameter AWLEN0_WIDTH         = 32,
            parameter AWLEN1_WIDTH         = 32,
            parameter AWLEN2_WIDTH         = 32,
            parameter AWLEN3_WIDTH         = 32,
            parameter AWLEN4_WIDTH         = 32,
            parameter AWLEN5_WIDTH         = 32,
            parameter AWLEN6_WIDTH         = 32,
            parameter AWLEN7_WIDTH         = 32,
            parameter AWLEN8_WIDTH         = 32,
            parameter AWLEN9_WIDTH         = 32,
            parameter AWSTEP1_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP2_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP3_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP4_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP5_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP6_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP7_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP8_WIDTH        = AXI4_ADDR_WIDTH,
            parameter AWSTEP9_WIDTH        = AXI4_ADDR_WIDTH,
            
            // レジスタ初期値
            parameter INIT_CTL_CONTROL     = 4'b0000,
            parameter INIT_IRQ_ENABLE      = 1'b0,
            parameter INIT_PARAM_AWADDR    = 0,
            parameter INIT_PARAM_AWOFFSET  = 0,
            parameter INIT_PARAM_AWLEN_MAX = 0,
            parameter INIT_PARAM_AWLEN0    = 0,
//          parameter INIT_PARAM_AWSTEP0   = 0,
            parameter INIT_PARAM_AWLEN1    = 0,
            parameter INIT_PARAM_AWSTEP1   = 0,
            parameter INIT_PARAM_AWLEN2    = 0,
            parameter INIT_PARAM_AWSTEP2   = 0,
            parameter INIT_PARAM_AWLEN3    = 0,
            parameter INIT_PARAM_AWSTEP3   = 0,
            parameter INIT_PARAM_AWLEN4    = 0,
            parameter INIT_PARAM_AWSTEP4   = 0,
            parameter INIT_PARAM_AWLEN5    = 0,
            parameter INIT_PARAM_AWSTEP5   = 0,
            parameter INIT_PARAM_AWLEN6    = 0,
            parameter INIT_PARAM_AWSTEP6   = 0,
            parameter INIT_PARAM_AWLEN7    = 0,
            parameter INIT_PARAM_AWSTEP7   = 0,
            parameter INIT_PARAM_AWLEN8    = 0,
            parameter INIT_PARAM_AWSTEP8   = 0,
            parameter INIT_PARAM_AWLEN9    = 0,
            parameter INIT_PARAM_AWSTEP9   = 0,
            parameter INIT_WSKIP_EN        = 1'b1,
            parameter INIT_WDETECT_FIRST   = {N{1'b0}},
            parameter INIT_WDETECT_LAST    = {N{1'b0}},
            parameter INIT_WPADDING_EN     = 1'b1,
            parameter INIT_WPADDING_DATA   = {WDATA_WIDTH{1'b0}},
            parameter INIT_WPADDING_STRB   = {WSTRB_WIDTH{1'b0}},
            
            // 構成情報
            parameter CORE_ID              = 32'h527a_0110,
            parameter CORE_VERSION         = 32'h0000_0000,
            parameter BYPASS_GATE          = 0,
            parameter BYPASS_ALIGN         = 0,
            parameter WDETECTOR_CHANGE     = 1,
            parameter WDETECTOR_ENABLE     = 1,
            parameter ALLOW_UNALIGNED      = 1,
            parameter CAPACITY_WIDTH       = 32,
            parameter WFIFO_PTR_WIDTH      = 9,
            parameter WFIFO_RAM_TYPE       = "block",
            parameter WFIFO_LOW_DEALY      = 0,
            parameter WFIFO_DOUT_REGS      = 1,
            parameter WFIFO_S_REGS         = 0,
            parameter WFIFO_M_REGS         = 1,
            parameter AWFIFO_PTR_WIDTH     = 4,
            parameter AWFIFO_RAM_TYPE      = "distributed",
            parameter AWFIFO_LOW_DEALY     = 1,
            parameter AWFIFO_DOUT_REGS     = 0,
            parameter AWFIFO_S_REGS        = 1,
            parameter AWFIFO_M_REGS        = 1,
            parameter BFIFO_PTR_WIDTH      = 4,
            parameter BFIFO_RAM_TYPE       = "distributed",
            parameter BFIFO_LOW_DEALY      = 0,
            parameter BFIFO_DOUT_REGS      = 0,
            parameter BFIFO_S_REGS         = 0,
            parameter BFIFO_M_REGS         = 0,
            parameter SWFIFOPTR_WIDTH      = 4,
            parameter SWFIFORAM_TYPE       = "distributed",
            parameter SWFIFOLOW_DEALY      = 1,
            parameter SWFIFODOUT_REGS      = 0,
            parameter SWFIFOS_REGS         = 0,
            parameter SWFIFOM_REGS         = 0,
            parameter MBFIFO_PTR_WIDTH     = 4,
            parameter MBFIFO_RAM_TYPE      = "distributed",
            parameter MBFIFO_LOW_DEALY     = 1,
            parameter MBFIFO_DOUT_REGS     = 0,
            parameter MBFIFO_S_REGS        = 0,
            parameter MBFIFO_M_REGS        = 0,
            parameter WDATFIFO_PTR_WIDTH   = 4,
            parameter WDATFIFO_DOUT_REGS   = 0,
            parameter WDATFIFO_RAM_TYPE    = "distributed",
            parameter WDATFIFO_LOW_DEALY   = 1,
            parameter WDATFIFO_S_REGS      = 0,
            parameter WDATFIFO_M_REGS      = 0,
            parameter WDAT_S_REGS          = 0,
            parameter WDAT_M_REGS          = 1,
            parameter BACKFIFO_PTR_WIDTH   = 4,
            parameter BACKFIFO_DOUT_REGS   = 0,
            parameter BACKFIFO_RAM_TYPE    = "distributed",
            parameter BACKFIFO_LOW_DEALY   = 1,
            parameter BACKFIFO_S_REGS      = 0,
            parameter BACKFIFO_M_REGS      = 0,
            parameter BACK_S_REGS          = 0,
            parameter BACK_M_REGS          = 1,
            parameter CONVERT_S_REGS       = 0
        )
        (
            input   wire                            endian,
            
            // WISHBONE (register access)
            input   wire                            s_wb_rst_i,
            input   wire                            s_wb_clk_i,
            input   wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i,
            input   wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i,
            output  wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o,
            input   wire                            s_wb_we_i,
            input   wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i,
            input   wire                            s_wb_stb_i,
            output  wire                            s_wb_ack_o,
            output  wire    [0:0]                   out_irq,
            
            output  wire                            buffer_request,
            output  wire                            buffer_release,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   buffer_addr,
            
            // write stream
            input   wire                            s_wresetn,
            input   wire                            s_wclk,
            input   wire    [WDATA_WIDTH-1:0]       s_wdata,
            input   wire    [WSTRB_WIDTH-1:0]       s_wstrb,
            input   wire    [N-1:0]                 s_wfirst,
            input   wire    [N-1:0]                 s_wlast,
            input   wire                            s_wvalid,
            output  wire                            s_wready,
            
            // AXI4
            input   wire                            m_aresetn,
            input   wire                            m_aclk,
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_awlen,
            output  wire    [2:0]                   m_axi4_awsize,
            output  wire    [1:0]                   m_axi4_awburst,
            output  wire    [0:0]                   m_axi4_awlock,
            output  wire    [3:0]                   m_axi4_awcache,
            output  wire    [2:0]                   m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_awqos,
            output  wire    [3:0]                   m_axi4_awregion,
            output  wire                            m_axi4_awvalid,
            input   wire                            m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]   m_axi4_wstrb,
            output  wire                            m_axi4_wlast,
            output  wire                            m_axi4_wvalid,
            input   wire                            m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_bid,
            input   wire    [1:0]                   m_axi4_bresp,
            input   wire                            m_axi4_bvalid,
            output  wire                            m_axi4_bready
        );
    
    
    // address mask
    localparam  [AXI4_ADDR_WIDTH-1:0]   ADDR_MASK = ~((1 << AXI4_DATA_SIZE) - 1);
    
    
    // ---------------------------------
    //  Register
    // ---------------------------------
    
    // register address offset
    localparam  ADR_CORE_ID             = 8'h00;
    localparam  ADR_CORE_VERSION        = 8'h01;
    localparam  ADR_CORE_CONFIG         = 8'h03;
    localparam  ADR_CTL_CONTROL         = 8'h04;
    localparam  ADR_CTL_STATUS          = 8'h05;
    localparam  ADR_CTL_INDEX           = 8'h07;
    localparam  ADR_IRQ_ENABLE          = 8'h08;
    localparam  ADR_IRQ_STATUS          = 8'h09;
    localparam  ADR_IRQ_CLR             = 8'h0a;
    localparam  ADR_IRQ_SET             = 8'h0b;
    localparam  ADR_PARAM_AWADDR        = 8'h10;
    localparam  ADR_PARAM_AWOFFSET      = 8'h18;
    localparam  ADR_PARAM_AWLEN_MAX     = 8'h1c;
    localparam  ADR_PARAM_AWLEN0        = 8'h20;
//  localparam  ADR_PARAM_AWSTEP0       = 8'h21;
    localparam  ADR_PARAM_AWLEN1        = 8'h24;
    localparam  ADR_PARAM_AWSTEP1       = 8'h25;
    localparam  ADR_PARAM_AWLEN2        = 8'h28;
    localparam  ADR_PARAM_AWSTEP2       = 8'h29;
    localparam  ADR_PARAM_AWLEN3        = 8'h2c;
    localparam  ADR_PARAM_AWSTEP3       = 8'h2d;
    localparam  ADR_PARAM_AWLEN4        = 8'h30;
    localparam  ADR_PARAM_AWSTEP4       = 8'h31;
    localparam  ADR_PARAM_AWLEN5        = 8'h34;
    localparam  ADR_PARAM_AWSTEP5       = 8'h35;
    localparam  ADR_PARAM_AWLEN6        = 8'h38;
    localparam  ADR_PARAM_AWSTEP6       = 8'h39;
    localparam  ADR_PARAM_AWLEN7        = 8'h3c;
    localparam  ADR_PARAM_AWSTEP7       = 8'h3d;
    localparam  ADR_PARAM_AWLEN8        = 8'h40;
    localparam  ADR_PARAM_AWSTEP8       = 8'h41;
    localparam  ADR_PARAM_AWLEN9        = 8'h44;
    localparam  ADR_PARAM_AWSTEP9       = 8'h45;
    localparam  ADR_WSKIP_EN            = 8'h70;
    localparam  ADR_WDETECT_FIRST       = 8'h72;
    localparam  ADR_WDETECT_LAST        = 8'h73;
    localparam  ADR_WPADDING_EN         = 8'h74;
    localparam  ADR_WPADDING_DATA       = 8'h75;
    localparam  ADR_WPADDING_STRB       = 8'h76;
    localparam  ADR_SHADOW_AWADDR       = 8'h90;
    localparam  ADR_SHADOW_AWOFFSET     = 8'h98;
    localparam  ADR_SHADOW_AWLEN_MAX    = 8'h9c;
    localparam  ADR_SHADOW_AWLEN0       = 8'ha0;
//  localparam  ADR_SHADOW_AWSTEP0      = 8'ha1;
    localparam  ADR_SHADOW_AWLEN1       = 8'ha4;
    localparam  ADR_SHADOW_AWSTEP1      = 8'ha5;
    localparam  ADR_SHADOW_AWLEN2       = 8'ha8;
    localparam  ADR_SHADOW_AWSTEP2      = 8'ha9;
    localparam  ADR_SHADOW_AWLEN3       = 8'hac;
    localparam  ADR_SHADOW_AWSTEP3      = 8'had;
    localparam  ADR_SHADOW_AWLEN4       = 8'hb0;
    localparam  ADR_SHADOW_AWSTEP4      = 8'hb1;
    localparam  ADR_SHADOW_AWLEN5       = 8'hb4;
    localparam  ADR_SHADOW_AWSTEP5      = 8'hb5;
    localparam  ADR_SHADOW_AWLEN6       = 8'hb8;
    localparam  ADR_SHADOW_AWSTEP6      = 8'hb9;
    localparam  ADR_SHADOW_AWLEN7       = 8'hbc;
    localparam  ADR_SHADOW_AWSTEP7      = 8'hbd;
    localparam  ADR_SHADOW_AWLEN8       = 8'hc0;
    localparam  ADR_SHADOW_AWSTEP8      = 8'hc1;
    localparam  ADR_SHADOW_AWLEN9       = 8'hc4;
    localparam  ADR_SHADOW_AWSTEP9      = 8'hc5;
    
    
    // registers
    reg     [3:0]                   reg_ctl_control;    // bit[0]:enable, bit[1]:update, bit[2]:oneshot, bit[3]:auto_addr
    reg     [0:0]                   reg_ctl_status;
    reg     [INDEX_WIDTH-1:0]       reg_ctl_index;
    reg     [0:0]                   reg_irq_enable;
    reg     [0:0]                   reg_irq_status;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_awaddr;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_param_awoffset;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_param_awlen_max;
    reg     [AWLEN0_WIDTH-1:0]      reg_param_awlen0;
//  reg     [AWSTEP0_WIDTH-1:0]     reg_param_awstep0;
    reg     [AWLEN1_WIDTH-1:0]      reg_param_awlen1;
    reg     [AWSTEP1_WIDTH-1:0]     reg_param_awstep1;
    reg     [AWLEN2_WIDTH-1:0]      reg_param_awlen2;
    reg     [AWSTEP2_WIDTH-1:0]     reg_param_awstep2;
    reg     [AWLEN3_WIDTH-1:0]      reg_param_awlen3;
    reg     [AWSTEP3_WIDTH-1:0]     reg_param_awstep3;
    reg     [AWLEN4_WIDTH-1:0]      reg_param_awlen4;
    reg     [AWSTEP4_WIDTH-1:0]     reg_param_awstep4;
    reg     [AWLEN5_WIDTH-1:0]      reg_param_awlen5;
    reg     [AWSTEP5_WIDTH-1:0]     reg_param_awstep5;
    reg     [AWLEN6_WIDTH-1:0]      reg_param_awlen6;
    reg     [AWSTEP6_WIDTH-1:0]     reg_param_awstep6;
    reg     [AWLEN7_WIDTH-1:0]      reg_param_awlen7;
    reg     [AWSTEP7_WIDTH-1:0]     reg_param_awstep7;
    reg     [AWLEN8_WIDTH-1:0]      reg_param_awlen8;
    reg     [AWSTEP8_WIDTH-1:0]     reg_param_awstep8;
    reg     [AWLEN9_WIDTH-1:0]      reg_param_awlen9;
    reg     [AWSTEP9_WIDTH-1:0]     reg_param_awstep9;
    reg                             reg_wskip_en;
    reg     [N-1:0]                 reg_wdetect_first;
    reg     [N-1:0]                 reg_wdetect_last;
    reg                             reg_wpadding_en;
    reg     [WDATA_WIDTH-1:0]       reg_wpadding_data;
    reg     [WSTRB_WIDTH-1:0]       reg_wpadding_strb;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_shadow_awaddr;
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_shadow_awoffset;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_shadow_awlen_max;
    reg     [AWLEN0_WIDTH-1:0]      reg_shadow_awlen0;
//  reg     [AWSTEP0_WIDTH-1:0]     reg_shadow_awstep0;
    reg     [AWLEN1_WIDTH-1:0]      reg_shadow_awlen1;
    reg     [AWSTEP1_WIDTH-1:0]     reg_shadow_awstep1;
    reg     [AWLEN2_WIDTH-1:0]      reg_shadow_awlen2;
    reg     [AWSTEP2_WIDTH-1:0]     reg_shadow_awstep2;
    reg     [AWLEN3_WIDTH-1:0]      reg_shadow_awlen3;
    reg     [AWSTEP3_WIDTH-1:0]     reg_shadow_awstep3;
    reg     [AWLEN4_WIDTH-1:0]      reg_shadow_awlen4;
    reg     [AWSTEP4_WIDTH-1:0]     reg_shadow_awstep4;
    reg     [AWLEN5_WIDTH-1:0]      reg_shadow_awlen5;
    reg     [AWSTEP5_WIDTH-1:0]     reg_shadow_awstep5;
    reg     [AWLEN6_WIDTH-1:0]      reg_shadow_awlen6;
    reg     [AWSTEP6_WIDTH-1:0]     reg_shadow_awstep6;
    reg     [AWLEN7_WIDTH-1:0]      reg_shadow_awlen7;
    reg     [AWSTEP7_WIDTH-1:0]     reg_shadow_awstep7;
    reg     [AWLEN8_WIDTH-1:0]      reg_shadow_awlen8;
    reg     [AWSTEP8_WIDTH-1:0]     reg_shadow_awstep8;
    reg     [AWLEN9_WIDTH-1:0]      reg_shadow_awlen9;
    reg     [AWSTEP9_WIDTH-1:0]     reg_shadow_awstep9;
    
    wire                            sig_start = !reg_ctl_status && reg_ctl_control[0];
    wire                            sig_end;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   reg_awaddr;
    reg                             reg_awvalid;
    wire                            s_awready;
    
    reg                             reg_wskip;
    
    assign out_irq        = out_irq & reg_irq_enable;
    
    assign buffer_request = (sig_start && reg_ctl_control[3]);
    assign buffer_release = (sig_end || (!sig_start && !reg_ctl_status));
    
    
    function [WB_DAT_WIDTH-1:0] write_mask(
                                        input [WB_DAT_WIDTH-1:0] org,
                                        input [WB_DAT_WIDTH-1:0] dat,
                                        input [WB_SEL_WIDTH-1:0] sel
                                    );
    integer i;
    begin
        for ( i = 0; i < WB_DAT_WIDTH; i = i+1 ) begin
            write_mask[i] = sel[i/8] ? dat[i] : org[i];
        end
    end
    endfunction
    
    always @(posedge s_wb_clk_i ) begin
        if ( s_wb_rst_i ) begin
            reg_ctl_control      <= INIT_CTL_CONTROL;
            reg_ctl_status       <= 0;
            reg_ctl_index        <= 0;
            reg_irq_enable       <= INIT_IRQ_ENABLE;
            reg_irq_status       <= 0;
            reg_param_awaddr     <= INIT_PARAM_AWADDR;
            reg_param_awoffset   <= INIT_PARAM_AWOFFSET;
            reg_param_awlen_max  <= INIT_PARAM_AWLEN_MAX;
            reg_param_awlen0     <= INIT_PARAM_AWLEN0;
//          reg_param_awstep0    <= INIT_PARAM_AWSTEP0;
            reg_param_awlen1     <= (N > 1) ? INIT_PARAM_AWLEN1  : 0;
            reg_param_awstep1    <= (N > 1) ? INIT_PARAM_AWSTEP1 : 0;
            reg_param_awlen2     <= (N > 2) ? INIT_PARAM_AWLEN2  : 0;
            reg_param_awstep2    <= (N > 2) ? INIT_PARAM_AWSTEP2 : 0;
            reg_param_awlen3     <= (N > 3) ? INIT_PARAM_AWLEN3  : 0;
            reg_param_awstep3    <= (N > 3) ? INIT_PARAM_AWSTEP3 : 0;
            reg_param_awlen4     <= (N > 4) ? INIT_PARAM_AWLEN4  : 0;
            reg_param_awstep4    <= (N > 4) ? INIT_PARAM_AWSTEP4 : 0;
            reg_param_awlen5     <= (N > 5) ? INIT_PARAM_AWLEN5  : 0;
            reg_param_awstep5    <= (N > 5) ? INIT_PARAM_AWSTEP5 : 0;
            reg_param_awlen6     <= (N > 6) ? INIT_PARAM_AWLEN6  : 0;
            reg_param_awstep6    <= (N > 6) ? INIT_PARAM_AWSTEP6 : 0;
            reg_param_awlen7     <= (N > 7) ? INIT_PARAM_AWLEN7  : 0;
            reg_param_awstep7    <= (N > 7) ? INIT_PARAM_AWSTEP7 : 0;
            reg_param_awlen8     <= (N > 8) ? INIT_PARAM_AWLEN8  : 0;
            reg_param_awstep8    <= (N > 8) ? INIT_PARAM_AWSTEP8 : 0;
            reg_param_awlen9     <= (N > 9) ? INIT_PARAM_AWLEN9  : 0;
            reg_param_awstep9    <= (N > 9) ? INIT_PARAM_AWSTEP9 : 0;
            reg_wskip_en         <= INIT_WSKIP_EN;
            reg_wdetect_first    <= INIT_WDETECT_FIRST;
            reg_wdetect_last     <= INIT_WDETECT_LAST;
            reg_wpadding_en      <= INIT_WPADDING_EN;
            reg_wpadding_data    <= INIT_WPADDING_DATA;
            reg_wpadding_strb    <= INIT_WPADDING_STRB;
            reg_shadow_awaddr    <= INIT_PARAM_AWADDR;
            reg_shadow_awoffset  <= INIT_PARAM_AWOFFSET;
            reg_shadow_awlen_max <= INIT_PARAM_AWLEN_MAX;
            reg_shadow_awlen0    <= INIT_PARAM_AWLEN0;
//          reg_shadow_awstep0   <= INIT_PARAM_AWSTEP0;
            reg_shadow_awlen1    <= (N > 1) ? INIT_PARAM_AWLEN1  : 0;
            reg_shadow_awstep1   <= (N > 1) ? INIT_PARAM_AWSTEP1 : 0;
            reg_shadow_awlen2    <= (N > 2) ? INIT_PARAM_AWLEN2  : 0;
            reg_shadow_awstep2   <= (N > 2) ? INIT_PARAM_AWSTEP2 : 0;
            reg_shadow_awlen3    <= (N > 3) ? INIT_PARAM_AWLEN3  : 0;
            reg_shadow_awstep3   <= (N > 3) ? INIT_PARAM_AWSTEP3 : 0;
            reg_shadow_awlen4    <= (N > 4) ? INIT_PARAM_AWLEN4  : 0;
            reg_shadow_awstep4   <= (N > 4) ? INIT_PARAM_AWSTEP4 : 0;
            reg_shadow_awlen5    <= (N > 5) ? INIT_PARAM_AWLEN5  : 0;
            reg_shadow_awstep5   <= (N > 5) ? INIT_PARAM_AWSTEP5 : 0;
            reg_shadow_awlen6    <= (N > 6) ? INIT_PARAM_AWLEN6  : 0;
            reg_shadow_awstep6   <= (N > 6) ? INIT_PARAM_AWSTEP6 : 0;
            reg_shadow_awlen7    <= (N > 7) ? INIT_PARAM_AWLEN7  : 0;
            reg_shadow_awstep7   <= (N > 7) ? INIT_PARAM_AWSTEP7 : 0;
            reg_shadow_awlen8    <= (N > 8) ? INIT_PARAM_AWLEN8  : 0;
            reg_shadow_awstep8   <= (N > 8) ? INIT_PARAM_AWSTEP8 : 0;
            reg_shadow_awlen9    <= (N > 9) ? INIT_PARAM_AWLEN9  : 0;
            reg_shadow_awstep9   <= (N > 9) ? INIT_PARAM_AWSTEP9 : 0;
            
            reg_awaddr           <= INIT_PARAM_AWADDR + INIT_PARAM_AWOFFSET;
            reg_awvalid          <= 1'b0;
            reg_wskip            <= 1'b0;
        end
        else begin
            // register write
            if ( s_wb_stb_i && s_wb_we_i ) begin
                case ( s_wb_adr_i )
                ADR_CTL_CONTROL:        reg_ctl_control      <= write_mask(reg_ctl_control,     s_wb_dat_i, s_wb_sel_i);
                ADR_IRQ_ENABLE:         reg_irq_enable       <= write_mask(reg_irq_enable,      s_wb_dat_i, s_wb_sel_i);
                ADR_IRQ_CLR:            reg_irq_status       <= reg_irq_status & ~write_mask(0, s_wb_dat_i, s_wb_sel_i);
                ADR_IRQ_SET:            reg_irq_status       <= reg_irq_status |  write_mask(0, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_AWADDR:       reg_param_awaddr     <= write_mask(reg_param_awaddr,    s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_AWOFFSET:     reg_param_awoffset   <= write_mask(reg_param_awoffset,  s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_AWLEN_MAX:    reg_param_awlen_max  <= write_mask(reg_param_awlen_max, s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_AWLEN0:       reg_param_awlen0     <= write_mask(reg_param_awlen0,    s_wb_dat_i, s_wb_sel_i);
//              ADR_PARAM_AWSTEP0:      reg_param_awstep0    <= write_mask(reg_param_awstep0,   s_wb_dat_i, s_wb_sel_i);
                ADR_PARAM_AWLEN1:       reg_param_awlen1     <= (N > 1) ? write_mask(reg_param_awlen1,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP1:      reg_param_awstep1    <= (N > 1) ? write_mask(reg_param_awstep1,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN2:       reg_param_awlen2     <= (N > 2) ? write_mask(reg_param_awlen2,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP2:      reg_param_awstep2    <= (N > 2) ? write_mask(reg_param_awstep2,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN3:       reg_param_awlen3     <= (N > 3) ? write_mask(reg_param_awlen3,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP3:      reg_param_awstep3    <= (N > 3) ? write_mask(reg_param_awstep3,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN4:       reg_param_awlen4     <= (N > 4) ? write_mask(reg_param_awlen4,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP4:      reg_param_awstep4    <= (N > 4) ? write_mask(reg_param_awstep4,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN5:       reg_param_awlen5     <= (N > 5) ? write_mask(reg_param_awlen5,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP5:      reg_param_awstep5    <= (N > 5) ? write_mask(reg_param_awstep5,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN6:       reg_param_awlen6     <= (N > 6) ? write_mask(reg_param_awlen6,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP6:      reg_param_awstep6    <= (N > 6) ? write_mask(reg_param_awstep6,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN7:       reg_param_awlen7     <= (N > 7) ? write_mask(reg_param_awlen7,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP7:      reg_param_awstep7    <= (N > 7) ? write_mask(reg_param_awstep7,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN8:       reg_param_awlen8     <= (N > 8) ? write_mask(reg_param_awlen8,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP8:      reg_param_awstep8    <= (N > 8) ? write_mask(reg_param_awstep8,   s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWLEN9:       reg_param_awlen9     <= (N > 9) ? write_mask(reg_param_awlen9,    s_wb_dat_i, s_wb_sel_i) : 0;
                ADR_PARAM_AWSTEP9:      reg_param_awstep9    <= (N > 9) ? write_mask(reg_param_awstep9,   s_wb_dat_i, s_wb_sel_i) : 0;
                endcase
                
                if ( WDETECTOR_CHANGE ) begin
                case ( s_wb_adr_i )
                ADR_WSKIP_EN:           reg_wskip_en         <= write_mask(reg_wskip_en,        s_wb_dat_i, s_wb_sel_i);
                ADR_WDETECT_FIRST:      reg_wdetect_first    <= write_mask(reg_wdetect_first,   s_wb_dat_i, s_wb_sel_i);
                ADR_WDETECT_LAST:       reg_wdetect_last     <= write_mask(reg_wdetect_last,    s_wb_dat_i, s_wb_sel_i);
                ADR_WPADDING_EN:        reg_wpadding_en      <= write_mask(reg_wpadding_en,     s_wb_dat_i, s_wb_sel_i);
                ADR_WPADDING_DATA:      reg_wpadding_data    <= write_mask(reg_wpadding_data,   s_wb_dat_i, s_wb_sel_i);
                ADR_WPADDING_STRB:      reg_wpadding_strb    <= write_mask(reg_wpadding_strb,   s_wb_dat_i, s_wb_sel_i);
                endcase
                end
            end
            
            if ( s_awready ) begin
                reg_awvalid <= 1'b0;
            end
            
            // start
            if ( sig_start ) begin
                reg_ctl_status <= 1'b1;
                reg_awvalid    <= 1'b1;
                
                if ( reg_ctl_control[1] ) begin // update
                    reg_ctl_control[1]   <= 1'b0;
                    reg_ctl_index        <= reg_ctl_index + 1'b1;
                    
                    reg_awaddr           <= reg_param_awaddr + reg_param_awoffset;
                    
                    reg_shadow_awaddr    <= reg_param_awaddr;
                    reg_shadow_awoffset  <= reg_param_awoffset;
                    reg_shadow_awlen_max <= reg_param_awlen_max;
                    reg_shadow_awlen0    <= reg_param_awlen0;
//                  reg_shadow_awstep0   <= reg_param_awstep0;
                    reg_shadow_awlen1    <= reg_param_awlen1;
                    reg_shadow_awstep1   <= reg_param_awstep1;
                    reg_shadow_awlen2    <= reg_param_awlen2;
                    reg_shadow_awstep2   <= reg_param_awstep2;
                    reg_shadow_awlen3    <= reg_param_awlen3;
                    reg_shadow_awstep3   <= reg_param_awstep3;
                    reg_shadow_awlen4    <= reg_param_awlen4;
                    reg_shadow_awstep4   <= reg_param_awstep4;
                    reg_shadow_awlen5    <= reg_param_awlen5;
                    reg_shadow_awstep5   <= reg_param_awstep5;
                    reg_shadow_awlen6    <= reg_param_awlen6;
                    reg_shadow_awstep6   <= reg_param_awstep6;
                    reg_shadow_awlen7    <= reg_param_awlen7;
                    reg_shadow_awstep7   <= reg_param_awstep7;
                    reg_shadow_awlen8    <= reg_param_awlen8;
                    reg_shadow_awstep8   <= reg_param_awstep8;
                    reg_shadow_awlen9    <= reg_param_awlen9;
                    reg_shadow_awstep9   <= reg_param_awstep9;
                end
                
                if ( buffer_request ) begin
                    reg_awaddr        <= buffer_addr + reg_shadow_awoffset;
                    reg_shadow_awaddr <= buffer_addr;
                end
                
            end
            
            // end
            if ( sig_end ) begin
                reg_ctl_status <= 1'b0;
                if ( reg_ctl_control[2] ) begin // oneshot
                    reg_ctl_control[0] <= 1'b0;
                end
            end
            
            // skip
            reg_wskip <= reg_wskip_en && !reg_ctl_control[0] && !reg_ctl_status;
        end
    end
    
    assign s_wb_dat_o = (s_wb_adr_i == ADR_CORE_ID)          ? CORE_ID              :
                        (s_wb_adr_i == ADR_CORE_VERSION)     ? CORE_VERSION         :
                        (s_wb_adr_i == ADR_CORE_CONFIG)      ? N                    :
                        (s_wb_adr_i == ADR_CTL_CONTROL)      ? reg_ctl_control      :
                        (s_wb_adr_i == ADR_CTL_STATUS)       ? reg_ctl_status       :
                        (s_wb_adr_i == ADR_CTL_INDEX)        ? reg_ctl_index        :
                        (s_wb_adr_i == ADR_IRQ_ENABLE)       ? reg_irq_enable       :
                        (s_wb_adr_i == ADR_IRQ_STATUS)       ? reg_irq_status       :
                        (s_wb_adr_i == ADR_PARAM_AWADDR)     ? reg_param_awaddr     :
                        (s_wb_adr_i == ADR_PARAM_AWOFFSET)   ? reg_param_awoffset   :
                        (s_wb_adr_i == ADR_PARAM_AWLEN_MAX)  ? reg_param_awlen_max  :
                        (s_wb_adr_i == ADR_PARAM_AWLEN0)     ? reg_param_awlen0     :
//                      (s_wb_adr_i == ADR_PARAM_AWSTEP0)    ? reg_param_awstep0    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN1)     ? reg_param_awlen1     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP1)    ? reg_param_awstep1    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN2)     ? reg_param_awlen2     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP2)    ? reg_param_awstep2    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN3)     ? reg_param_awlen3     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP3)    ? reg_param_awstep3    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN4)     ? reg_param_awlen4     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP4)    ? reg_param_awstep4    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN5)     ? reg_param_awlen5     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP5)    ? reg_param_awstep5    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN6)     ? reg_param_awlen6     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP6)    ? reg_param_awstep6    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN7)     ? reg_param_awlen7     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP7)    ? reg_param_awstep7    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN8)     ? reg_param_awlen8     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP8)    ? reg_param_awstep8    :
                        (s_wb_adr_i == ADR_PARAM_AWLEN9)     ? reg_param_awlen9     :
                        (s_wb_adr_i == ADR_PARAM_AWSTEP9)    ? reg_param_awstep9    :
                        (s_wb_adr_i == ADR_WSKIP_EN)         ? reg_wskip_en         :
                        (s_wb_adr_i == ADR_WDETECT_FIRST)    ? reg_wdetect_first    :
                        (s_wb_adr_i == ADR_WDETECT_LAST)     ? reg_wdetect_last     :
                        (s_wb_adr_i == ADR_WPADDING_EN)      ? reg_wpadding_en      :
                        (s_wb_adr_i == ADR_WPADDING_DATA)    ? reg_wpadding_data    :
                        (s_wb_adr_i == ADR_WPADDING_STRB)    ? reg_wpadding_strb    :
                        (s_wb_adr_i == ADR_SHADOW_AWADDR)    ? reg_shadow_awaddr    :
                        (s_wb_adr_i == ADR_SHADOW_AWOFFSET)  ? reg_shadow_awoffset  :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN_MAX) ? reg_shadow_awlen_max :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN0)    ? reg_shadow_awlen0    :
//                      (s_wb_adr_i == ADR_SHADOW_AWSTEP0)   ? reg_shadow_awstep0   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN1)    ? reg_shadow_awlen1    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP1)   ? reg_shadow_awstep1   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN2)    ? reg_shadow_awlen2    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP2)   ? reg_shadow_awstep2   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN3)    ? reg_shadow_awlen3    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP3)   ? reg_shadow_awstep3   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN4)    ? reg_shadow_awlen4    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP4)   ? reg_shadow_awstep4   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN5)    ? reg_shadow_awlen5    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP5)   ? reg_shadow_awstep5   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN6)    ? reg_shadow_awlen6    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP6)   ? reg_shadow_awstep6   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN7)    ? reg_shadow_awlen7    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP7)   ? reg_shadow_awstep7   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN8)    ? reg_shadow_awlen8    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP8)   ? reg_shadow_awstep8   :
                        (s_wb_adr_i == ADR_SHADOW_AWLEN9)    ? reg_shadow_awlen9    :
                        (s_wb_adr_i == ADR_SHADOW_AWSTEP9)   ? reg_shadow_awstep9   :
                        {WB_DAT_WIDTH{1'b0}};
    
    assign s_wb_ack_o = s_wb_stb_i;
    
    
    
    // read core
    localparam LEN_MAX  = AXI4_ADDR_WIDTH;
    localparam STEP_MAX = AXI4_ADDR_WIDTH;
    
    wire    [10*LEN_MAX-1:0]     s_awlen;
    wire    [10*STEP_MAX-1:0]    s_awstep;
    
    assign s_awlen[0*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen0;
    assign s_awlen[1*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen1;
    assign s_awlen[2*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen2;
    assign s_awlen[3*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen3;
    assign s_awlen[4*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen4;
    assign s_awlen[5*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen5;
    assign s_awlen[6*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen6;
    assign s_awlen[7*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen7;
    assign s_awlen[8*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen8;
    assign s_awlen[9*LEN_MAX +: LEN_MAX]    = reg_shadow_awlen9;
    
    assign s_awstep[0*STEP_MAX +: STEP_MAX] = 1;
    assign s_awstep[1*STEP_MAX +: STEP_MAX] = reg_shadow_awstep1;
    assign s_awstep[2*STEP_MAX +: STEP_MAX] = reg_shadow_awstep2;
    assign s_awstep[3*STEP_MAX +: STEP_MAX] = reg_shadow_awstep3;
    assign s_awstep[4*STEP_MAX +: STEP_MAX] = reg_shadow_awstep4;
    assign s_awstep[5*STEP_MAX +: STEP_MAX] = reg_shadow_awstep5;
    assign s_awstep[6*STEP_MAX +: STEP_MAX] = reg_shadow_awstep6;
    assign s_awstep[7*STEP_MAX +: STEP_MAX] = reg_shadow_awstep7;
    assign s_awstep[8*STEP_MAX +: STEP_MAX] = reg_shadow_awstep8;
    assign s_awstep[9*STEP_MAX +: STEP_MAX] = reg_shadow_awstep9;
    
    
    (* ASYNC_REG = "true" *)    reg         reg_wskip_ff0, reg_wskip_ff1;
    always @(posedge s_wclk ) begin
        if ( ~s_wresetn ) begin
            reg_wskip_ff0 <= 1'b0;
            reg_wskip_ff1 <= 1'b0;
        end
        else begin
            reg_wskip_ff0 <= reg_wskip;
            reg_wskip_ff1 <= reg_wskip_ff0;
        end
    end
    
    
    wire    [N-1:0]                 s_bfirst;
    wire    [N-1:0]                 s_blast;
    wire                            s_bvalid;
    wire                            s_bready;
    
    jelly_axi4_write_nd
            #(
                .N                      (N),
                
                .AWASYNC                (WB_ASYNC),
                .WASYNC                 (WASYNC),
                .BASYNC                 (WB_ASYNC),
                
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_GATE            (BYPASS_GATE),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .WDETECTOR_ENABLE       (WDETECTOR_ENABLE),
                
                .HAS_WSTRB              (HAS_WSTRB),
                .HAS_WFIRST             (HAS_WFIRST),
                .HAS_WLAST              (HAS_WLAST),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH        (AXI4_STRB_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .AXI4_AWID              (AXI4_AWID),
                .AXI4_AWSIZE            (AXI4_AWSIZE),
                .AXI4_AWBURST           (AXI4_AWBURST),
                .AXI4_AWLOCK            (AXI4_AWLOCK),
                .AXI4_AWCACHE           (AXI4_AWCACHE),
                .AXI4_AWPROT            (AXI4_AWPROT),
                .AXI4_AWQOS             (AXI4_AWQOS),
                .AXI4_AWREGION          (AXI4_AWREGION),
                .S_WDATA_WIDTH          (WDATA_WIDTH),
                .S_WSTRB_WIDTH          (WSTRB_WIDTH),
                .S_AWSTEP_WIDTH         (STEP_MAX),
                .S_AWLEN_WIDTH          (LEN_MAX),
                .S_AWLEN_OFFSET         (AWLEN_OFFSET),
                
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .CONVERT_S_REGS         (CONVERT_S_REGS),
                
                .WFIFO_PTR_WIDTH        (WFIFO_PTR_WIDTH),
                .WFIFO_RAM_TYPE         (WFIFO_RAM_TYPE),
                .WFIFO_LOW_DEALY        (WFIFO_LOW_DEALY),
                .WFIFO_DOUT_REGS        (WFIFO_DOUT_REGS),
                .WFIFO_S_REGS           (WFIFO_S_REGS),
                .WFIFO_M_REGS           (WFIFO_M_REGS),
                .AWFIFO_PTR_WIDTH       (AWFIFO_PTR_WIDTH),
                .AWFIFO_RAM_TYPE        (AWFIFO_RAM_TYPE),
                .AWFIFO_LOW_DEALY       (AWFIFO_LOW_DEALY),
                .AWFIFO_DOUT_REGS       (AWFIFO_DOUT_REGS),
                .AWFIFO_S_REGS          (AWFIFO_S_REGS),
                .AWFIFO_M_REGS          (AWFIFO_M_REGS),
                .BFIFO_PTR_WIDTH        (BFIFO_PTR_WIDTH),
                .BFIFO_RAM_TYPE         (BFIFO_RAM_TYPE),
                .BFIFO_LOW_DEALY        (BFIFO_LOW_DEALY),
                .BFIFO_DOUT_REGS        (BFIFO_DOUT_REGS),
                .BFIFO_S_REGS           (BFIFO_S_REGS),
                .BFIFO_M_REGS           (BFIFO_M_REGS),
                .SWFIFOPTR_WIDTH        (SWFIFOPTR_WIDTH),
                .SWFIFORAM_TYPE         (SWFIFORAM_TYPE),
                .SWFIFOLOW_DEALY        (SWFIFOLOW_DEALY),
                .SWFIFODOUT_REGS        (SWFIFODOUT_REGS),
                .SWFIFOS_REGS           (SWFIFOS_REGS),
                .SWFIFOM_REGS           (SWFIFOM_REGS),
                .MBFIFO_PTR_WIDTH       (MBFIFO_PTR_WIDTH),
                .MBFIFO_RAM_TYPE        (MBFIFO_RAM_TYPE),
                .MBFIFO_LOW_DEALY       (MBFIFO_LOW_DEALY),
                .MBFIFO_DOUT_REGS       (MBFIFO_DOUT_REGS),
                .MBFIFO_S_REGS          (MBFIFO_S_REGS),
                .MBFIFO_M_REGS          (MBFIFO_M_REGS),
                .WDATFIFO_PTR_WIDTH     (WDATFIFO_PTR_WIDTH),
                .WDATFIFO_DOUT_REGS     (WDATFIFO_DOUT_REGS),
                .WDATFIFO_RAM_TYPE      (WDATFIFO_RAM_TYPE),
                .WDATFIFO_LOW_DEALY     (WDATFIFO_LOW_DEALY),
                .WDATFIFO_S_REGS        (WDATFIFO_S_REGS),
                .WDATFIFO_M_REGS        (WDATFIFO_M_REGS),
                .WDAT_S_REGS            (WDAT_S_REGS),
                .WDAT_M_REGS            (WDAT_M_REGS),
                .BACKFIFO_PTR_WIDTH     (BACKFIFO_PTR_WIDTH),
                .BACKFIFO_DOUT_REGS     (BACKFIFO_DOUT_REGS),
                .BACKFIFO_RAM_TYPE      (BACKFIFO_RAM_TYPE),
                .BACKFIFO_LOW_DEALY     (BACKFIFO_LOW_DEALY),
                .BACKFIFO_S_REGS        (BACKFIFO_S_REGS),
                .BACKFIFO_M_REGS        (BACKFIFO_M_REGS),
                .BACK_S_REGS            (BACK_S_REGS),
                .BACK_M_REGS            (BACK_M_REGS)
            )
        i_axi4_write_nd
            (
                .endian                 (endian),
                
                .s_awresetn             (~s_wb_rst_i),
                .s_awclk                (s_wb_clk_i),
                .s_awaddr               (reg_awaddr),
                .s_awlen_max            (reg_shadow_awlen_max),
                .s_awstep               (s_awstep[N*STEP_MAX-1:0]),
                .s_awlen                (s_awlen[N*LEN_MAX-1:0]),
                .s_awvalid              (reg_awvalid),
                .s_awready              (s_awready),
                
                .s_wresetn              (s_wresetn),
                .s_wclk                 (s_wclk),
                .s_wdata                (s_wdata),
                .s_wstrb                (s_wstrb),
                .s_wfirst               (s_wfirst),
                .s_wlast                (s_wlast),
                .s_wvalid               (s_wvalid),
                .s_wready               (s_wready),
                
                .wskip                  (reg_wskip_ff1),
                .wdetect_first          (reg_wdetect_first),
                .wdetect_last           (reg_wdetect_last),
                .wpadding_en            (reg_wpadding_en),
                .wpadding_data          (reg_wpadding_data),
                .wpadding_strb          (reg_wpadding_strb),
                
                .s_bresetn              (~s_wb_rst_i),
                .s_bclk                 (s_wb_clk_i),
                .s_bfirst               (s_bfirst),
                .s_blast                (s_blast),
                .s_bvalid               (s_bvalid),
                .s_bready               (s_bready),
                
                .m_aresetn              (m_aresetn),
                .m_aclk                 (m_aclk),
                .m_axi4_awid            (m_axi4_awid),
                .m_axi4_awaddr          (m_axi4_awaddr),
                .m_axi4_awlen           (m_axi4_awlen),
                .m_axi4_awsize          (m_axi4_awsize),
                .m_axi4_awburst         (m_axi4_awburst),
                .m_axi4_awlock          (m_axi4_awlock),
                .m_axi4_awcache         (m_axi4_awcache),
                .m_axi4_awprot          (m_axi4_awprot),
                .m_axi4_awqos           (m_axi4_awqos),
                .m_axi4_awregion        (m_axi4_awregion),
                .m_axi4_awvalid         (m_axi4_awvalid),
                .m_axi4_awready         (m_axi4_awready),
                .m_axi4_wdata           (m_axi4_wdata),
                .m_axi4_wstrb           (m_axi4_wstrb),
                .m_axi4_wlast           (m_axi4_wlast),
                .m_axi4_wvalid          (m_axi4_wvalid),
                .m_axi4_wready          (m_axi4_wready),
                .m_axi4_bid             (m_axi4_bid),
                .m_axi4_bresp           (m_axi4_bresp),
                .m_axi4_bvalid          (m_axi4_bvalid),
                .m_axi4_bready          (m_axi4_bready)
            );
    
    assign s_bready = 1'b1;
    
    assign sig_end   = s_bvalid & s_bready & s_blast[N-1];
    
    
endmodule


`default_nettype wire


// end of file
