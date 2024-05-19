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



module jelly_dma_video_write
        #(
            // 基本設定
            parameter BYTE_WIDTH            = 8,
            
            // WISHBONE register
            parameter WB_ASYNC              = 1,
            parameter WB_ADR_WIDTH          = 8,
            parameter WB_DAT_WIDTH          = 32,
            parameter WB_SEL_WIDTH          = (WB_DAT_WIDTH / 8),
            
            // AXI4-Stream Video
            parameter AXI4S_ASYNC           = 1,
            parameter AXI4S_DATA_WIDTH      = 32,
            parameter AXI4S_USER_WIDTH      = 1,
            
            // AXI4 Memory
            parameter AXI4_ID_WIDTH         = 6,
            parameter AXI4_ADDR_WIDTH       = 32,
            parameter AXI4_DATA_SIZE        = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH       = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter AXI4_STRB_WIDTH       = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter AXI4_LEN_WIDTH        = 8,
            parameter AXI4_QOS_WIDTH        = 4,
            parameter AXI4_AWID             = {AXI4_ID_WIDTH{1'b0}},
            parameter AXI4_AWSIZE           = AXI4_DATA_SIZE,
            parameter AXI4_AWBURST          = 2'b01,
            parameter AXI4_AWLOCK           = 1'b0,
            parameter AXI4_AWCACHE          = 4'b0001,
            parameter AXI4_AWPROT           = 3'b000,
            parameter AXI4_AWQOS            = 0,
            parameter AXI4_AWREGION         = 4'b0000,
            parameter AXI4_ALIGN            = 12,  // 2^12 = 4k が境界
            
            // レジスタ構成など
            parameter INDEX_WIDTH           = 1,
            parameter SIZE_OFFSET           = 1'b1,
            parameter H_SIZE_WIDTH          = 12,
            parameter V_SIZE_WIDTH          = 12,
            parameter F_SIZE_WIDTH          = 8,
            parameter LINE_STEP_WIDTH       = AXI4_ADDR_WIDTH,
            parameter FRAME_STEP_WIDTH      = AXI4_ADDR_WIDTH,
            
            // レジスタ初期値
            parameter INIT_CTL_CONTROL      = 4'b0000,
            parameter INIT_IRQ_ENABLE       = 1'b0,
            parameter INIT_PARAM_ADDR       = 0,
            parameter INIT_PARAM_OFFSET     = 0,
            parameter INIT_PARAM_AWLEN_MAX  = 0,
            parameter INIT_PARAM_H_SIZE     = 0,
            parameter INIT_PARAM_V_SIZE     = 0,
            parameter INIT_PARAM_LINE_STEP  = 0,
            parameter INIT_PARAM_F_SIZE     = 0,
            parameter INIT_PARAM_FRAME_STEP = 0,
            parameter INIT_SKIP_EN          = 1'b1,
            parameter INIT_DETECT_FIRST     = 3'b010,
            parameter INIT_DETECT_LAST      = 3'b001,
            parameter INIT_PADDING_EN       = 1'b1,
            parameter INIT_PADDING_DATA     = {AXI4S_DATA_WIDTH{1'b0}},
            parameter INIT_PADDING_STRB     = {(AXI4S_DATA_WIDTH/BYTE_WIDTH){1'b0}},
            
            // 構成情報
            parameter CORE_ID               = 32'h527a_0110,
            parameter CORE_VERSION          = 32'h0000_0000,
            parameter BYPASS_GATE           = 0,
            parameter BYPASS_ALIGN          = 0,
            parameter WDETECTOR_CHANGE      = 0,
            parameter DETECTOR_ENABLE       = 1,
            parameter ALLOW_UNALIGNED       = 1,
            parameter CAPACITY_WIDTH        = 32,
            parameter WFIFO_PTR_WIDTH       = 9,
            parameter WFIFO_RAM_TYPE        = "block",
            parameter WFIFO_LOW_DEALY       = 0,
            parameter WFIFO_DOUT_REGS       = 1,
            parameter WFIFO_S_REGS          = 0,
            parameter WFIFO_M_REGS          = 1,
            parameter AWFIFO_PTR_WIDTH      = 4,
            parameter AWFIFO_RAM_TYPE       = "distributed",
            parameter AWFIFO_LOW_DEALY      = 1,
            parameter AWFIFO_DOUT_REGS      = 1,
            parameter AWFIFO_S_REGS         = 1,
            parameter AWFIFO_M_REGS         = 1,
            parameter BFIFO_PTR_WIDTH       = 4,
            parameter BFIFO_RAM_TYPE        = "distributed",
            parameter BFIFO_LOW_DEALY       = 0,
            parameter BFIFO_DOUT_REGS       = 0,
            parameter BFIFO_S_REGS          = 0,
            parameter BFIFO_M_REGS          = 0,
            parameter SWFIFOPTR_WIDTH       = 4,
            parameter SWFIFORAM_TYPE        = "distributed",
            parameter SWFIFOLOW_DEALY       = 1,
            parameter SWFIFODOUT_REGS       = 0,
            parameter SWFIFOS_REGS          = 0,
            parameter SWFIFOM_REGS          = 0,
            parameter MBFIFO_PTR_WIDTH      = 4,
            parameter MBFIFO_RAM_TYPE       = "distributed",
            parameter MBFIFO_LOW_DEALY      = 1,
            parameter MBFIFO_DOUT_REGS      = 0,
            parameter MBFIFO_S_REGS         = 0,
            parameter MBFIFO_M_REGS         = 0,
            parameter WDATFIFO_PTR_WIDTH    = 4,
            parameter WDATFIFO_DOUT_REGS    = 0,
            parameter WDATFIFO_RAM_TYPE     = "distributed",
            parameter WDATFIFO_LOW_DEALY    = 1,
            parameter WDATFIFO_S_REGS       = 0,
            parameter WDATFIFO_M_REGS       = 0,
            parameter WDAT_S_REGS           = 0,
            parameter WDAT_M_REGS           = 1,
            parameter BACKFIFO_PTR_WIDTH    = 4,
            parameter BACKFIFO_DOUT_REGS    = 0,
            parameter BACKFIFO_RAM_TYPE     = "distributed",
            parameter BACKFIFO_LOW_DEALY    = 1,
            parameter BACKFIFO_S_REGS       = 0,
            parameter BACKFIFO_M_REGS       = 0,
            parameter BACK_S_REGS           = 0,
            parameter BACK_M_REGS           = 1,
            parameter CONVERT_S_REGS        = 0
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
            input   wire                            s_axi4s_aresetn,
            input   wire                            s_axi4s_aclk,
            input   wire    [AXI4S_USER_WIDTH-1:0]  s_axi4s_tuser,  // frame start
            input   wire                            s_axi4s_tlast,
            input   wire    [AXI4S_DATA_WIDTH-1:0]  s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            
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
    
    
    jelly_dma_stream_write
            #(
                .N                      (3),
                .BYTE_WIDTH             (BYTE_WIDTH),
                
                .WB_ASYNC               (WB_ASYNC),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                
                .WASYNC                 (AXI4S_ASYNC),
                .WDATA_WIDTH            (AXI4S_DATA_WIDTH),
                .WSTRB_WIDTH            (AXI4S_DATA_WIDTH / BYTE_WIDTH),
                .HAS_WSTRB              (0),
                .HAS_WFIRST             (1),
                .HAS_WLAST              (1),
                
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
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .INDEX_WIDTH            (INDEX_WIDTH),
                .AWLEN_OFFSET           (SIZE_OFFSET),
                .AWLEN0_WIDTH           (H_SIZE_WIDTH),
                .AWLEN1_WIDTH           (V_SIZE_WIDTH),
                .AWLEN2_WIDTH           (F_SIZE_WIDTH),
                .AWSTEP1_WIDTH          (LINE_STEP_WIDTH),
                .AWSTEP2_WIDTH          (FRAME_STEP_WIDTH),
                
                .INIT_CTL_CONTROL       (INIT_CTL_CONTROL),
                .INIT_IRQ_ENABLE        (INIT_IRQ_ENABLE),
                .INIT_PARAM_AWADDR      (INIT_PARAM_ADDR),
                .INIT_PARAM_AWOFFSET    (INIT_PARAM_OFFSET),
                .INIT_PARAM_AWLEN_MAX   (INIT_PARAM_AWLEN_MAX),
                .INIT_PARAM_AWLEN0      (INIT_PARAM_H_SIZE),
                .INIT_PARAM_AWLEN1      (INIT_PARAM_V_SIZE),
                .INIT_PARAM_AWSTEP1     (INIT_PARAM_LINE_STEP),
                .INIT_PARAM_AWLEN2      (INIT_PARAM_F_SIZE),
                .INIT_PARAM_AWSTEP2     (INIT_PARAM_FRAME_STEP),
                
                .INIT_WSKIP_EN          (INIT_SKIP_EN),
                .INIT_WDETECT_FIRST     (INIT_DETECT_FIRST),
                .INIT_WDETECT_LAST      (INIT_DETECT_LAST),
                .INIT_WPADDING_EN       (INIT_PADDING_EN),
                .INIT_WPADDING_DATA     (INIT_PADDING_DATA),
                .INIT_WPADDING_STRB     (INIT_PADDING_STRB),
                
                .CORE_ID                (CORE_ID),
                .CORE_VERSION           (CORE_VERSION),
                .BYPASS_GATE            (BYPASS_GATE),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .WDETECTOR_CHANGE       (WDETECTOR_CHANGE),
                .WDETECTOR_ENABLE       (DETECTOR_ENABLE),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
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
                .BACK_M_REGS            (BACK_M_REGS),
                .CONVERT_S_REGS         (CONVERT_S_REGS)
            )
        i_dma_stream_write
            (
                .endian                 (endian),
                                         
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (s_wb_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (s_wb_stb_i),
                .s_wb_ack_o             (s_wb_ack_o),
                .out_irq                (out_irq),
                
                .buffer_request         (buffer_request),
                .buffer_release         (buffer_release),
                .buffer_addr            (buffer_addr),
                                         
                .s_wresetn              (s_axi4s_aresetn),
                .s_wclk                 (s_axi4s_aclk),
                .s_wdata                (s_axi4s_tdata),
                .s_wstrb                ({(AXI4S_DATA_WIDTH/BYTE_WIDTH){1'b1}}),
                .s_wfirst               ({1'b0, s_axi4s_tuser[0], 1'b0}),
                .s_wlast                ({2'b00, s_axi4s_tlast}),
                .s_wvalid               (s_axi4s_tvalid),
                .s_wready               (s_axi4s_tready),
                
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
    
    
endmodule


`default_nettype wire


// end of file
