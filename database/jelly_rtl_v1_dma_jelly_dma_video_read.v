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



module jelly_dma_video_read
        #(
            // 基本設定
            parameter BYTE_WIDTH            = 8,
            
            // WISHBONE
            parameter WB_ASYNC              = 1,
            parameter WB_ADR_WIDTH          = 8,
            parameter WB_DAT_WIDTH          = 32,
            parameter WB_SEL_WIDTH          = (WB_DAT_WIDTH / 8),
            
            // AXI4-Stream Video
            parameter AXI4S_ASYNC           = 1,
            parameter AXI4S_DATA_WIDTH      = 32,
            parameter AXI4S_USER_WIDTH      = 1,
            
            // AXI4
            parameter AXI4_ID_WIDTH         = 6,
            parameter AXI4_ADDR_WIDTH       = 32,
            parameter AXI4_DATA_SIZE        = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH       = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter AXI4_LEN_WIDTH        = 8,
            parameter AXI4_QOS_WIDTH        = 4,
            parameter AXI4_ARID             = {AXI4_ID_WIDTH{1'b0}},
            parameter AXI4_ARSIZE           = AXI4_DATA_SIZE,
            parameter AXI4_ARBURST          = 2'b01,
            parameter AXI4_ARLOCK           = 1'b0,
            parameter AXI4_ARCACHE          = 4'b0001,
            parameter AXI4_ARPROT           = 3'b000,
            parameter AXI4_ARQOS            = 0,
            parameter AXI4_ARREGION         = 4'b0000,
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
            
            // 構成情報
            parameter CORE_ID               = 32'h527a_0120,
            parameter CORE_VERSION          = 32'h0000_0000,
            parameter BYPASS_GATE           = 0,
            parameter BYPASS_ALIGN          = 0,
            parameter ALLOW_UNALIGNED       = 1,
            parameter CAPACITY_WIDTH        = 32,
            parameter RFIFO_PTR_WIDTH       = 9,
            parameter RFIFO_RAM_TYPE        = "block",
            parameter RFIFO_LOW_DEALY       = 0,
            parameter RFIFO_DOUT_REGS       = 1,
            parameter RFIFO_S_REGS          = 0,
            parameter RFIFO_M_REGS          = 1,
            parameter ARFIFO_PTR_WIDTH      = 4,
            parameter ARFIFO_RAM_TYPE       = "distributed",
            parameter ARFIFO_LOW_DEALY      = 1,
            parameter ARFIFO_DOUT_REGS      = 1,
            parameter ARFIFO_S_REGS         = 1,
            parameter ARFIFO_M_REGS         = 1,
            parameter SRFIFO_PTR_WIDTH      = 4,
            parameter SRFIFO_RAM_TYPE       = "distributed",
            parameter SRFIFO_LOW_DEALY      = 0,
            parameter SRFIFO_DOUT_REGS      = 0,
            parameter SRFIFO_S_REGS         = 0,
            parameter SRFIFO_M_REGS         = 0,
            parameter MRFIFO_PTR_WIDTH      = 4,
            parameter MRFIFO_RAM_TYPE       = "distributed",
            parameter MRFIFO_LOW_DEALY      = 1,
            parameter MRFIFO_DOUT_REGS      = 0,
            parameter MRFIFO_S_REGS         = 0,
            parameter MRFIFO_M_REGS         = 0,
            parameter RACKFIFO_PTR_WIDTH    = 4,
            parameter RACKFIFO_DOUT_REGS    = 0,
            parameter RACKFIFO_RAM_TYPE     = "distributed",
            parameter RACKFIFO_LOW_DEALY    = 1,
            parameter RACKFIFO_S_REGS       = 0,
            parameter RACKFIFO_M_REGS       = 0,
            parameter RACK_S_REGS           = 0,
            parameter RACK_M_REGS           = 1,
            parameter CACKFIFO_PTR_WIDTH    = 4,
            parameter CACKFIFO_DOUT_REGS    = 0,
            parameter CACKFIFO_RAM_TYPE     = "distributed",
            parameter CACKFIFO_LOW_DEALY    = 1,
            parameter CACKFIFO_S_REGS       = 0,
            parameter CACKFIFO_M_REGS       = 0,
            parameter CACK_S_REGS           = 0,
            parameter CACK_M_REGS           = 1,
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
            
            // read stream
            input   wire                            m_axi4s_aresetn,
            input   wire                            m_axi4s_aclk,
            output  wire    [AXI4S_USER_WIDTH-1:0]  m_axi4s_tuser,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_DATA_WIDTH-1:0]  m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready,
            
            // AXI4
            input   wire                            m_aresetn,
            input   wire                            m_aclk,
            output  wire    [AXI4_ID_WIDTH-1:0]     m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_arlen,
            output  wire    [2:0]                   m_axi4_arsize,
            output  wire    [1:0]                   m_axi4_arburst,
            output  wire    [0:0]                   m_axi4_arlock,
            output  wire    [3:0]                   m_axi4_arcache,
            output  wire    [2:0]                   m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_arqos,
            output  wire    [3:0]                   m_axi4_arregion,
            output  wire                            m_axi4_arvalid,
            input   wire                            m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]     m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_rdata,
            input   wire    [1:0]                   m_axi4_rresp,
            input   wire                            m_axi4_rlast,
            input   wire                            m_axi4_rvalid,
            output  wire                            m_axi4_rready
        );
    
    
    wire    [AXI4S_DATA_WIDTH-1:0]  s_rdata;
    wire    [2:0]                   s_rfirst;
    wire    [2:0]                   s_rlast;
    wire                            s_rvalid;
    wire                            s_rready;
    
    jelly_dma_stream_read
            #(
                .N                      (3),
                .BYTE_WIDTH             (BYTE_WIDTH),
                
                .WB_ASYNC               (WB_ASYNC),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                
                .RASYNC                 (AXI4S_ASYNC),
                .RDATA_WIDTH            (AXI4S_DATA_WIDTH),
                .HAS_RFIRST             (1),
                .HAS_RLAST              (1),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .AXI4_ARID              (AXI4_ARID),
                .AXI4_ARSIZE            (AXI4_ARSIZE),
                .AXI4_ARBURST           (AXI4_ARBURST),
                .AXI4_ARLOCK            (AXI4_ARLOCK),
                .AXI4_ARCACHE           (AXI4_ARCACHE),
                .AXI4_ARPROT            (AXI4_ARPROT),
                .AXI4_ARQOS             (AXI4_ARQOS),
                .AXI4_ARREGION          (AXI4_ARREGION),
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .INDEX_WIDTH            (INDEX_WIDTH),
                .ARLEN_OFFSET           (SIZE_OFFSET),
                .ARLEN0_WIDTH           (H_SIZE_WIDTH),
                .ARLEN1_WIDTH           (V_SIZE_WIDTH),
                .ARLEN2_WIDTH           (F_SIZE_WIDTH),
                .ARSTEP1_WIDTH          (LINE_STEP_WIDTH),
                .ARSTEP2_WIDTH          (FRAME_STEP_WIDTH),
                
                .INIT_CTL_CONTROL       (INIT_CTL_CONTROL),
                .INIT_IRQ_ENABLE        (INIT_IRQ_ENABLE),
                .INIT_PARAM_ARADDR      (INIT_PARAM_ADDR),
                .INIT_PARAM_AROFFSET    (INIT_PARAM_OFFSET),
                .INIT_PARAM_ARLEN_MAX   (INIT_PARAM_AWLEN_MAX),
                .INIT_PARAM_ARLEN0      (INIT_PARAM_H_SIZE),
                .INIT_PARAM_ARLEN1      (INIT_PARAM_V_SIZE),
                .INIT_PARAM_ARSTEP1     (INIT_PARAM_LINE_STEP),
                .INIT_PARAM_ARLEN2      (INIT_PARAM_F_SIZE),
                .INIT_PARAM_ARSTEP2     (INIT_PARAM_FRAME_STEP),
                
                .CORE_ID                (CORE_ID),
                .CORE_VERSION           (CORE_VERSION),
                .BYPASS_GATE            (BYPASS_GATE),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .RFIFO_PTR_WIDTH        (RFIFO_PTR_WIDTH),
                .RFIFO_RAM_TYPE         (RFIFO_RAM_TYPE),
                .RFIFO_LOW_DEALY        (RFIFO_LOW_DEALY),
                .RFIFO_DOUT_REGS        (RFIFO_DOUT_REGS),
                .RFIFO_S_REGS           (RFIFO_S_REGS),
                .RFIFO_M_REGS           (RFIFO_M_REGS),
                .ARFIFO_PTR_WIDTH       (ARFIFO_PTR_WIDTH),
                .ARFIFO_RAM_TYPE        (ARFIFO_RAM_TYPE),
                .ARFIFO_LOW_DEALY       (ARFIFO_LOW_DEALY),
                .ARFIFO_DOUT_REGS       (ARFIFO_DOUT_REGS),
                .ARFIFO_S_REGS          (ARFIFO_S_REGS),
                .ARFIFO_M_REGS          (ARFIFO_M_REGS),
                .SRFIFO_PTR_WIDTH       (SRFIFO_PTR_WIDTH),
                .SRFIFO_RAM_TYPE        (SRFIFO_RAM_TYPE),
                .SRFIFO_LOW_DEALY       (SRFIFO_LOW_DEALY),
                .SRFIFO_DOUT_REGS       (SRFIFO_DOUT_REGS),
                .SRFIFO_S_REGS          (SRFIFO_S_REGS),
                .SRFIFO_M_REGS          (SRFIFO_M_REGS),
                .MRFIFO_PTR_WIDTH       (MRFIFO_PTR_WIDTH),
                .MRFIFO_RAM_TYPE        (MRFIFO_RAM_TYPE),
                .MRFIFO_LOW_DEALY       (MRFIFO_LOW_DEALY),
                .MRFIFO_DOUT_REGS       (MRFIFO_DOUT_REGS),
                .MRFIFO_S_REGS          (MRFIFO_S_REGS),
                .MRFIFO_M_REGS          (MRFIFO_M_REGS),
                .RACKFIFO_PTR_WIDTH     (RACKFIFO_PTR_WIDTH),
                .RACKFIFO_DOUT_REGS     (RACKFIFO_DOUT_REGS),
                .RACKFIFO_RAM_TYPE      (RACKFIFO_RAM_TYPE),
                .RACKFIFO_LOW_DEALY     (RACKFIFO_LOW_DEALY),
                .RACKFIFO_S_REGS        (RACKFIFO_S_REGS),
                .RACKFIFO_M_REGS        (RACKFIFO_M_REGS),
                .RACK_S_REGS            (RACK_S_REGS),
                .RACK_M_REGS            (RACK_M_REGS),
                .CACKFIFO_PTR_WIDTH     (CACKFIFO_PTR_WIDTH),
                .CACKFIFO_DOUT_REGS     (CACKFIFO_DOUT_REGS),
                .CACKFIFO_RAM_TYPE      (CACKFIFO_RAM_TYPE),
                .CACKFIFO_LOW_DEALY     (CACKFIFO_LOW_DEALY),
                .CACKFIFO_S_REGS        (CACKFIFO_S_REGS),
                .CACKFIFO_M_REGS        (CACKFIFO_M_REGS),
                .CACK_S_REGS            (CACK_S_REGS),
                .CACK_M_REGS            (CACK_M_REGS),
                .CONVERT_S_REGS         (CONVERT_S_REGS)
            )
        i_dma_stream_read
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
                
                .s_rresetn              (m_axi4s_aresetn),
                .s_rclk                 (m_axi4s_aclk),
                .s_rdata                (s_rdata),
                .s_rfirst               (s_rfirst),
                .s_rlast                (s_rlast),
                .s_rvalid               (s_rvalid),
                .s_rready               (s_rready),
                
                .m_aresetn              (m_aresetn),
                .m_aclk                 (m_aclk),
                .m_axi4_arid            (m_axi4_arid),
                .m_axi4_araddr          (m_axi4_araddr),
                .m_axi4_arlen           (m_axi4_arlen),
                .m_axi4_arsize          (m_axi4_arsize),
                .m_axi4_arburst         (m_axi4_arburst),
                .m_axi4_arlock          (m_axi4_arlock),
                .m_axi4_arcache         (m_axi4_arcache),
                .m_axi4_arprot          (m_axi4_arprot),
                .m_axi4_arqos           (m_axi4_arqos),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arvalid         (m_axi4_arvalid),
                .m_axi4_arready         (m_axi4_arready),
                .m_axi4_rid             (m_axi4_rid),
                .m_axi4_rdata           (m_axi4_rdata),
                .m_axi4_rresp           (m_axi4_rresp),
                .m_axi4_rlast           (m_axi4_rlast),
                .m_axi4_rvalid          (m_axi4_rvalid),
                .m_axi4_rready          (m_axi4_rready)
            );
    
    
    assign m_axi4s_tuser  = s_rfirst[1];
    assign m_axi4s_tlast  = s_rlast[0];
    assign m_axi4s_tdata  = s_rdata;
    assign m_axi4s_tvalid = s_rvalid;
    assign s_rready       = m_axi4s_tready;
    
    
endmodule


`default_nettype wire


// end of file
