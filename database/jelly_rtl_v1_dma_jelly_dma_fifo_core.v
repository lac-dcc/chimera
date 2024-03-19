// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// 外部メモリをFIFO的に使う為のDMAコア
module jelly_dma_fifo_core
        #(
            parameter   S_ASYNC              = 1,
            parameter   M_ASYNC              = 1,
            parameter   UNIT_WIDTH           = 8,
            parameter   BYTE_WIDTH           = 8,
            parameter   S_DATA_WIDTH         = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   M_DATA_WIDTH         = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            
            parameter   AXI4_ID_WIDTH        = 6,
            parameter   AXI4_ADDR_WIDTH      = 49,
            parameter   AXI4_DATA_SIZE       = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH       = 8,
            parameter   AXI4_QOS_WIDTH       = 4,
            parameter   AXI4_AWID            = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE          = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST         = 2'b01,
            parameter   AXI4_AWLOCK          = 1'b0,
            parameter   AXI4_AWCACHE         = 4'b0001,
            parameter   AXI4_AWPROT          = 3'b000,
            parameter   AXI4_AWQOS           = 0,
            parameter   AXI4_AWREGION        = 4'b0000,
            parameter   AXI4_ARID            = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE          = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST         = 2'b01,
            parameter   AXI4_ARLOCK          = 1'b0,
            parameter   AXI4_ARCACHE         = 4'b0001,
            parameter   AXI4_ARPROT          = 3'b000,
            parameter   AXI4_ARQOS           = 0,
            parameter   AXI4_ARREGION        = 4'b0000,
            
            parameter   BYPASS_ADDR_OFFSET   = 0,   // 0番地からしか使わない場合バイパス可
            parameter   BYPASS_ALIGN         = 0,   // アライメント跨ぎを処理不要の場合バイパス可
            parameter   AXI4_ALIGN           = 12,
            
            parameter   PARAM_ADDR_WIDTH     = AXI4_ADDR_WIDTH,
            parameter   PARAM_SIZE_WIDTH     = 32,
            parameter   PARAM_SIZE_OFFSET    = 1'b0,
            parameter   PARAM_AWLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_WSTRB_WIDTH    = AXI4_STRB_WIDTH,
            parameter   PARAM_WTIMEOUT_WIDTH = 8,
            parameter   PARAM_ARLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_RTIMEOUT_WIDTH = 8,
            
            parameter   WDATA_FIFO_PTR_WIDTH = 9,
            parameter   WDATA_FIFO_RAM_TYPE  = "block",
            parameter   WDATA_FIFO_LOW_DEALY = 0,
            parameter   WDATA_FIFO_DOUT_REGS = 1,
            parameter   WDATA_FIFO_S_REGS    = 1,
            parameter   WDATA_FIFO_M_REGS    = 1,
            
            parameter   AWLEN_FIFO_PTR_WIDTH = 5,
            parameter   AWLEN_FIFO_RAM_TYPE  = "distributed",
            parameter   AWLEN_FIFO_LOW_DEALY = 0,
            parameter   AWLEN_FIFO_DOUT_REGS = 1,
            parameter   AWLEN_FIFO_S_REGS    = 0,
            parameter   AWLEN_FIFO_M_REGS    = 1,
            
            parameter   BLEN_FIFO_PTR_WIDTH  = 5,
            parameter   BLEN_FIFO_RAM_TYPE   = "distributed",
            parameter   BLEN_FIFO_LOW_DEALY  = 0,
            parameter   BLEN_FIFO_DOUT_REGS  = 1,
            parameter   BLEN_FIFO_S_REGS     = 0,
            parameter   BLEN_FIFO_M_REGS     = 1,
            
            parameter   RDATA_FIFO_PTR_WIDTH = 9,
            parameter   RDATA_FIFO_RAM_TYPE  = "block",
            parameter   RDATA_FIFO_LOW_DEALY = 0,
            parameter   RDATA_FIFO_DOUT_REGS = 1,
            parameter   RDATA_FIFO_S_REGS    = 1,
            parameter   RDATA_FIFO_M_REGS    = 1
        )
        (
            // reset & clock
            input   wire                                aresetn,
            input   wire                                aclk,
            
            // control
            input   wire                                enable,
            output  wire                                busy,
            
            // parameter(busy中に変化させないこと)
            input   wire    [PARAM_ADDR_WIDTH-1:0]      param_addr,
            input   wire    [PARAM_SIZE_WIDTH-1:0]      param_size,
            input   wire    [PARAM_AWLEN_WIDTH-1:0]     param_awlen,
            input   wire    [PARAM_WSTRB_WIDTH-1:0]     param_wstrb,
            input   wire    [PARAM_WTIMEOUT_WIDTH-1:0]  param_wtimeout,
            input   wire    [PARAM_ARLEN_WIDTH-1:0]     param_arlen,
            input   wire    [PARAM_RTIMEOUT_WIDTH-1:0]  param_rtimeout,
            
            // data stream bus slave port (write)
            input   wire                                s_reset,
            input   wire                                s_clk,
            input   wire    [S_DATA_WIDTH-1:0]          s_data,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            // data stream bus master port (read)
            input   wire                                m_reset,
            input   wire                                m_clk,
            output  wire    [M_DATA_WIDTH-1:0]          m_data,
            output  wire                                m_valid,
            input   wire                                m_ready,
            
            // AXI4(memory bus)
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_awlen,
            output  wire    [2:0]                       m_axi4_awsize,
            output  wire    [1:0]                       m_axi4_awburst,
            output  wire    [0:0]                       m_axi4_awlock,
            output  wire    [3:0]                       m_axi4_awcache,
            output  wire    [2:0]                       m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_awqos,
            output  wire    [3:0]                       m_axi4_awregion,
            output  wire                                m_axi4_awvalid,
            input   wire                                m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb,
            output  wire                                m_axi4_wlast,
            output  wire                                m_axi4_wvalid,
            input   wire                                m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_bid,
            input   wire    [1:0]                       m_axi4_bresp,
            input   wire                                m_axi4_bvalid,
            output  wire                                m_axi4_bready,
            output  wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen,
            output  wire    [2:0]                       m_axi4_arsize,
            output  wire    [1:0]                       m_axi4_arburst,
            output  wire    [0:0]                       m_axi4_arlock,
            output  wire    [3:0]                       m_axi4_arcache,
            output  wire    [2:0]                       m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos,
            output  wire    [3:0]                       m_axi4_arregion,
            output  wire                                m_axi4_arvalid,
            input   wire                                m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata,
            input   wire    [1:0]                       m_axi4_rresp,
            input   wire                                m_axi4_rlast,
            input   wire                                m_axi4_rvalid,
            output  wire                                m_axi4_rready
        );
    
    // hand shake
    wire                            write_busy;
    wire    [AXI4_LEN_WIDTH-1:0]    write_complete_size;
    wire                            write_complete_valid;
    
    wire                            read_busy;
    wire    [AXI4_LEN_WIDTH-1:0]    read_complete_size;
    wire                            read_complete_valid;
    
    assign busy = write_busy || read_busy;
    
    
    // write
    jelly_dma_fifo_write
            #(
                .ASYNC                  (S_ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .S_DATA_WIDTH           (S_DATA_WIDTH),
                
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
                
                .BYPASS_ADDR_OFFSET     (BYPASS_ADDR_OFFSET),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .PARAM_ADDR_WIDTH       (PARAM_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH       (PARAM_SIZE_WIDTH),
                .PARAM_SIZE_OFFSET      (PARAM_SIZE_OFFSET),
                .PARAM_AWLEN_WIDTH      (PARAM_AWLEN_WIDTH),
                .PARAM_WSTRB_WIDTH      (PARAM_WSTRB_WIDTH),
                .PARAM_TIMEOUT_WIDTH    (PARAM_WTIMEOUT_WIDTH),
                
                .PERMIT_SIZE_WIDTH      (AXI4_LEN_WIDTH),
                .COMPLETE_SIZE_WIDTH    (AXI4_LEN_WIDTH),
                
                .WDATA_FIFO_PTR_WIDTH   (WDATA_FIFO_PTR_WIDTH),
                .WDATA_FIFO_RAM_TYPE    (WDATA_FIFO_RAM_TYPE),
                .WDATA_FIFO_LOW_DEALY   (WDATA_FIFO_LOW_DEALY),
                .WDATA_FIFO_DOUT_REGS   (WDATA_FIFO_DOUT_REGS),
                .WDATA_FIFO_S_REGS      (WDATA_FIFO_S_REGS),
                .WDATA_FIFO_M_REGS      (WDATA_FIFO_M_REGS),
                
                .AWLEN_FIFO_PTR_WIDTH   (AWLEN_FIFO_PTR_WIDTH),
                .AWLEN_FIFO_RAM_TYPE    (AWLEN_FIFO_RAM_TYPE),
                .AWLEN_FIFO_LOW_DEALY   (AWLEN_FIFO_LOW_DEALY),
                .AWLEN_FIFO_DOUT_REGS   (AWLEN_FIFO_DOUT_REGS),
                .AWLEN_FIFO_S_REGS      (AWLEN_FIFO_S_REGS),
                .AWLEN_FIFO_M_REGS      (AWLEN_FIFO_M_REGS),
                
                .BLEN_FIFO_PTR_WIDTH    (BLEN_FIFO_PTR_WIDTH),
                .BLEN_FIFO_RAM_TYPE     (BLEN_FIFO_RAM_TYPE),
                .BLEN_FIFO_LOW_DEALY    (BLEN_FIFO_LOW_DEALY),
                .BLEN_FIFO_DOUT_REGS    (BLEN_FIFO_DOUT_REGS),
                .BLEN_FIFO_S_REGS       (BLEN_FIFO_S_REGS),
                .BLEN_FIFO_M_REGS       (BLEN_FIFO_M_REGS)
            )
        i_dma_fifo_write
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .enable                 (enable),
                .busy                   (write_busy),
                
                .update_param           (~busy),
                .param_addr             (param_addr),
                .param_size             (param_size),
                .param_awlen            (param_awlen),
                .param_wstrb            (param_wstrb),
                .param_timeout          (param_wtimeout),
                
                .s_reset                (s_reset),
                .s_clk                  (s_clk),
                .s_data                 (s_data),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .write_permit_size      (read_complete_size),
                .write_permit_valid     (read_complete_valid),
                
                .write_complete_size    (write_complete_size),
                .write_complete_valid   (write_complete_valid),
                
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
    
    // read
    jelly_dma_fifo_read
            #(
                .ASYNC                  (M_ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .M_DATA_WIDTH           (M_DATA_WIDTH),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_STRB_WIDTH        (AXI4_STRB_WIDTH),
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
                
                .BYPASS_ADDR_OFFSET     (BYPASS_ADDR_OFFSET),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .PARAM_ADDR_WIDTH       (PARAM_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH       (PARAM_SIZE_WIDTH),
                .PARAM_SIZE_OFFSET      (PARAM_SIZE_OFFSET),
                .PARAM_ARLEN_WIDTH      (PARAM_ARLEN_WIDTH),
                .PARAM_TIMEOUT_WIDTH    (PARAM_RTIMEOUT_WIDTH),
                
                .REQUEST_SIZE_WIDTH     (AXI4_LEN_WIDTH),
                .COMPLETE_SIZE_WIDTH    (AXI4_LEN_WIDTH),
                
                .RDATA_FIFO_PTR_WIDTH   (RDATA_FIFO_PTR_WIDTH),
                .RDATA_FIFO_RAM_TYPE    (RDATA_FIFO_RAM_TYPE),
                .RDATA_FIFO_LOW_DEALY   (RDATA_FIFO_LOW_DEALY),
                .RDATA_FIFO_DOUT_REGS   (RDATA_FIFO_DOUT_REGS),
                .RDATA_FIFO_S_REGS      (RDATA_FIFO_S_REGS),
                .RDATA_FIFO_M_REGS      (RDATA_FIFO_M_REGS)
            )
        i_axi4_fifo_read
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .enable                 (enable | write_busy),
                .busy                   (read_busy),
                
                .update_param           (~busy),
                .param_addr             (param_addr),
                .param_size             (param_size),
                .param_arlen            (param_arlen),
                .param_timeout          (param_rtimeout),
                
                .m_reset                (m_reset),
                .m_clk                  (m_clk),
                .m_data                 (m_data),
                .m_valid                (m_valid),
                .m_ready                (m_ready),
                
                .read_request_size      (write_complete_size),
                .read_request_valid     (write_complete_valid),
                
                .read_complete_size     (read_complete_size),
                .read_complete_valid    (read_complete_valid),
                
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
    
    
endmodule


`default_nettype wire


// end of file
