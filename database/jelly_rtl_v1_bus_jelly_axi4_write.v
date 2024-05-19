// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// AXI4側のバス幅は AXI4_DATA_SIZE で 2のべき乗サイズのみ指定可能
// 書き込みデータは S_WDATA_WIDTH でバイト単位で指定可能


// AXI4 データ書き込みコア
module jelly_axi4_write
        #(
            parameter   AWASYNC          = 1,
            parameter   WASYNC           = 1,
            parameter   BASYNC           = 1,
            
            parameter   BYTE_WIDTH       = 8,
            parameter   BYPASS_GATE      = 1,
            parameter   BYPASS_ALIGN     = 0,
            parameter   ALLOW_UNALIGNED  = 0,
            
            parameter   HAS_WSTRB        = 0,
            parameter   HAS_WFIRST       = 0,
            parameter   HAS_WLAST        = 0,
            
            parameter   AXI4_ID_WIDTH    = 6,
            parameter   AXI4_ADDR_WIDTH  = 32,
            parameter   AXI4_DATA_SIZE   = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH  = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH  = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH   = 8,
            parameter   AXI4_QOS_WIDTH   = 4,
            parameter   AXI4_AWID        = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE      = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST     = 2'b01,
            parameter   AXI4_AWLOCK      = 1'b0,
            parameter   AXI4_AWCACHE     = 4'b0001,
            parameter   AXI4_AWPROT      = 3'b000,
            parameter   AXI4_AWQOS       = 0,
            parameter   AXI4_AWREGION    = 4'b0000,
            parameter   AXI4_ALIGN       = 12,  // 2^12 = 4k が境界
            
            parameter   S_WDATA_WIDTH    = 32,
            parameter   S_WSTRB_WIDTH    = S_WDATA_WIDTH / BYTE_WIDTH,
            parameter   S_AWLEN_WIDTH    = 10,
            parameter   S_AWLEN_OFFSET   = 1'b1,
            
            parameter   CAPACITY_WIDTH   = S_AWLEN_WIDTH,   // 内部キューイング用
            
            parameter   CONVERT_S_REGS   = 0,
            
            parameter   WFIFO_PTR_WIDTH  = 9,
            parameter   WFIFO_RAM_TYPE   = "block",
            parameter   WFIFO_LOW_DEALY  = 0,
            parameter   WFIFO_DOUT_REGS  = 1,
            parameter   WFIFO_S_REGS     = 0,
            parameter   WFIFO_M_REGS     = 1,
            
            parameter   AWFIFO_PTR_WIDTH = 4,
            parameter   AWFIFO_RAM_TYPE  = "distributed",
            parameter   AWFIFO_LOW_DEALY = 1,
            parameter   AWFIFO_DOUT_REGS = 0,
            parameter   AWFIFO_S_REGS    = 0,
            parameter   AWFIFO_M_REGS    = 0,
            
            parameter   BFIFO_PTR_WIDTH  = 4,
            parameter   BFIFO_RAM_TYPE   = "distributed",
            parameter   BFIFO_LOW_DEALY  = 0,
            parameter   BFIFO_DOUT_REGS  = 0,
            parameter   BFIFO_S_REGS     = 0,
            parameter   BFIFO_M_REGS     = 0,
            
            parameter   SWFIFOPTR_WIDTH  = 4,
            parameter   SWFIFORAM_TYPE   = "distributed",
            parameter   SWFIFOLOW_DEALY  = 1,
            parameter   SWFIFODOUT_REGS  = 0,
            parameter   SWFIFOS_REGS     = 0,
            parameter   SWFIFOM_REGS     = 0,
            
            parameter   MBFIFO_PTR_WIDTH = 4,
            parameter   MBFIFO_RAM_TYPE  = "distributed",
            parameter   MBFIFO_LOW_DEALY = 1,
            parameter   MBFIFO_DOUT_REGS = 0,
            parameter   MBFIFO_S_REGS    = 0,
            parameter   MBFIFO_M_REGS    = 0
        )
        (
            input   wire                            endian,
            
            input   wire                            s_awresetn,
            input   wire                            s_awclk,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_awaddr,
            input   wire    [S_AWLEN_WIDTH-1:0]     s_awlen,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_awlen_max,
            input   wire                            s_awvalid,
            output  wire                            s_awready,
            
            input   wire                            s_wresetn,
            input   wire                            s_wclk,
            input   wire    [S_WDATA_WIDTH-1:0]     s_wdata,
            input   wire    [S_WSTRB_WIDTH-1:0]     s_wstrb,
            input   wire                            s_wfirst,
            input   wire                            s_wlast,
            input   wire                            s_wvalid,
            output  wire                            s_wready,
//          input   wire                            wdetect_first,
//          input   wire                            wdetect_last,
//          input   wire                            wpadding_en,
//          input   wire    [S_WDATA_WIDTH-1:0]     wpadding_data,
//          input   wire    [S_WSTRB_WIDTH-1:0]     wpadding_strb,
            
            input   wire                            s_bresetn,
            input   wire                            s_bclk,
            output  wire                            s_bvalid,
            input   wire                            s_bready,
            
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
    
    
    // ---------------------------------
    //  local parameter
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   addr_mask = ALLOW_UNALIGNED ? 0 : (1 << AXI4_DATA_SIZE) - 1;
    
    
    // ---------------------------------
    //  bus width convert
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   conv_awaddr;
    wire    [CAPACITY_WIDTH-1:0]    conv_awlen;
    wire    [AXI4_LEN_WIDTH-1:0]    conv_awlen_max;
    wire                            conv_awvalid;
    wire                            conv_awready;
    
    wire    [AXI4_DATA_WIDTH-1:0]   conv_wdata;
    wire    [AXI4_STRB_WIDTH-1:0]   conv_wstrb;
    wire                            conv_wlast;
    wire                            conv_wvalid;
    wire                            conv_wready;
    
    wire                            s_wfifo_wr_signal;
    
    jelly_axi4_write_width_convert
            #(
                .AWASYNC                (AWASYNC),
                .WASYNC                 (WASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_GATE            (BYPASS_GATE),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                
                .HAS_S_WSTRB            (HAS_WSTRB),
                .HAS_S_WFIRST           (HAS_WFIRST),
                .HAS_S_WLAST            (HAS_WLAST),
                .HAS_M_WSTRB            (1),
                .HAS_M_WFIRST           (0),
                .HAS_M_WLAST            (1),
                
                .AWADDR_WIDTH           (AXI4_ADDR_WIDTH),
                .AWUSER_WIDTH           (AXI4_LEN_WIDTH),
                
                .S_WDATA_WIDTH          (S_WDATA_WIDTH),
                .S_WSTRB_WIDTH          (S_WSTRB_WIDTH),
                .S_WUSER_WIDTH          (0),
                .S_AWLEN_WIDTH          (S_AWLEN_WIDTH),
                .S_AWLEN_OFFSET         (S_AWLEN_OFFSET),
                .S_AWUSER_WIDTH         (0),
                
                .M_WDATA_SIZE           (AXI4_DATA_SIZE),
                .M_WSTRB_WIDTH          (AXI4_STRB_WIDTH),
                .M_WUSER_WIDTH          (0),
                .M_AWLEN_WIDTH          (CAPACITY_WIDTH),
                .M_AWLEN_OFFSET         (1'b1),
                .M_AWUSER_WIDTH         (0),
                
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
                
                .SWFIFOPTR_WIDTH        (SWFIFOPTR_WIDTH),
                .SWFIFORAM_TYPE         (SWFIFORAM_TYPE),
                .SWFIFOLOW_DEALY        (SWFIFOLOW_DEALY),
                .SWFIFODOUT_REGS        (SWFIFODOUT_REGS),
                .SWFIFOS_REGS           (SWFIFOS_REGS),
                .SWFIFOM_REGS           (SWFIFOM_REGS),
                
                .CONVERT_S_REGS         (CONVERT_S_REGS),
                .POST_CONVERT           (0)
            )
        i_axi4_write_width_convert
            (
                .endian                 (endian),
                
                .s_awresetn             (s_awresetn),
                .s_awclk                (s_awclk),
                .s_awaddr               (s_awaddr & ~addr_mask),
                .s_awlen                (s_awlen),
                .s_awuser               (s_awlen_max),
                .s_awvalid              (s_awvalid),
                .s_awready              (s_awready),
                
                .s_wresetn              (s_wresetn),
                .s_wclk                 (s_wclk),
                .s_wfirst               (s_wfirst),
                .s_wlast                (s_wlast),
                .s_wdata                (s_wdata),
                .s_wstrb                (s_wstrb),
                .s_wuser                (1'b0),
                .s_wvalid               (s_wvalid),
                .s_wready               (s_wready),
                .wfifo_free_count       (),
                .wfifo_wr_signal        (s_wfifo_wr_signal),
                
                .m_awresetn             (m_aresetn),
                .m_awclk                (m_aclk),
                .m_awaddr               (conv_awaddr),
                .m_awlen                (conv_awlen),
                .m_awuser               (conv_awlen_max),
                .m_awvalid              (conv_awvalid),
                .m_awready              (conv_awready),
                
                .m_wresetn              (m_aresetn),
                .m_wclk                 (m_aclk),
                .m_wdata                (conv_wdata),
                .m_wstrb                (conv_wstrb),
                .m_wfirst               (),
                .m_wlast                (conv_wlast),
                .m_wuser                (),
                .m_wvalid               (conv_wvalid),
                .m_wready               (conv_wready),
                .wfifo_data_count       (),
                .wfifo_rd_signal        ()
            );
    
    
    // FIFO 書き込み済み量を CAPACIY として管理
    wire    [CAPACITY_WIDTH-1:0]    conv_wr_size;
    wire                            conv_wr_valid;
    wire                            conv_wr_ready;
    
    jelly_capacity_async
            #(
                .ASYNC                  (WASYNC),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (1),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .REQUEST_SIZE_OFFSET    (1'b1),
                .ISSUE_SIZE_OFFSET      (1'b0)
            )
        i_capacity_async
            (
                .s_reset                (~s_wresetn),
                .s_clk                  (s_wclk),
                .s_request_size         (1'b0),
                .s_request_valid        (s_wfifo_wr_signal),
                .s_queued_request       (),
                
                .m_reset                (~m_aresetn),
                .m_clk                  (m_aclk),
                .m_issue_size           (conv_wr_size),
                .m_issue_valid          (conv_wr_valid),
                .m_issue_ready          (conv_wr_ready),
                .m_queued_request       ()
            );
    
    
    
    // ---------------------------------
    //  Write command capacity control
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   adrgen_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    adrgen_awlen;
    wire                            adrgen_awlast;
    wire                            adrgen_awvalid;
    wire                            adrgen_awready;
    
    jelly_address_generator
            #(
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .ADDR_UNIT              (1 << AXI4_DATA_SIZE),
                .SIZE_WIDTH             (CAPACITY_WIDTH),
                .SIZE_OFFSET            (1'b1),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                .LEN_OFFSET             (1'b1),
                .S_REGS                 (0)
            )
         i_address_generator
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_addr                 (conv_awaddr),
                .s_size                 (conv_awlen),
                .s_max_len              (conv_awlen_max),
                .s_valid                (conv_awvalid),
                .s_ready                (conv_awready),
                
                .m_addr                 (adrgen_awaddr),
                .m_len                  (adrgen_awlen),
                .m_last                 (adrgen_awlast),
                .m_valid                (adrgen_awvalid),
                .m_ready                (adrgen_awready)
            );
    
    
    // capacity (FIFOに書き込み終わった分だけ発行)
    wire    [AXI4_ADDR_WIDTH-1:0]   capsize_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    capsize_awlen;
    wire                            capsize_awlast;
    wire                            capsize_awvalid;
    wire                            capsize_awready;
    
    jelly_capacity_size
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .CMD_USER_WIDTH         (1 + AXI4_ADDR_WIDTH),
                .CMD_SIZE_WIDTH         (AXI4_LEN_WIDTH),
                .CMD_SIZE_OFFSET        (1'b1),
                .CHARGE_WIDTH           (CAPACITY_WIDTH),
                .CHARGE_SIZE_OFFSET     (1'b0),
                .S_REGS                 (1),
                .M_REGS                 (1)
            )
        i_capacity_size
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .initial_capacity       ({CAPACITY_WIDTH{1'b0}}),
                .current_capacity       (),
                
                .s_charge_size          (conv_wr_size),
                .s_charge_valid         (conv_wr_valid & conv_wr_ready),
                
                .s_cmd_user             ({adrgen_awlast, adrgen_awaddr}),
                .s_cmd_size             (adrgen_awlen),
                .s_cmd_valid            (adrgen_awvalid),
                .s_cmd_ready            (adrgen_awready),
                
                .m_cmd_user             ({capsize_awlast, capsize_awaddr}),
                .m_cmd_size             (capsize_awlen),
                .m_cmd_valid            (capsize_awvalid),
                .m_cmd_ready            (capsize_awready)
            );
    
    assign conv_wr_ready = 1'b1;
    
    
    
    // 4kアライメント処理
    wire    [AXI4_ADDR_WIDTH-1:0]   align_awaddr;
    wire                            align_awlast;
    wire    [AXI4_LEN_WIDTH-1:0]    align_awlen;
    wire                            align_awvalid;
    wire                            align_awready;
    
    jelly_address_align_split
            #(
                .BYPASS                 (BYPASS_ALIGN),
                .USER_WIDTH             (0),
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .UNIT_SIZE              (AXI4_DATA_SIZE),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                .ALIGN                  (AXI4_ALIGN),
                .S_REGS                 (0)
            )
         i_address_align_split
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_addr                 (capsize_awaddr),
                .s_len                  (capsize_awlen),
                .s_first                (1'b0),
                .s_last                 (capsize_awlast),
                .s_user                 (1'b0),
                .s_valid                (capsize_awvalid),
                .s_ready                (capsize_awready),
                
                .m_first                (),
                .m_last                 (align_awlast),
                .m_addr                 (align_awaddr),
                .m_len                  (align_awlen),
                .m_user                 (),
                .m_valid                (align_awvalid),
                .m_ready                (align_awready)
            );
    
    // コマンド発行用とデータ管理用に3分岐させる
    wire    [AXI4_ADDR_WIDTH-1:0]   cmd0_awaddr;
    wire                            cmd0_awlast;
    wire    [AXI4_LEN_WIDTH-1:0]    cmd0_awlen;
    wire                            cmd0_awvalid;
    wire                            cmd0_awready;
    
    wire    [AXI4_LEN_WIDTH-1:0]    cmd1_awlen;
    wire                            cmd1_awvalid;
    wire                            cmd1_awready;
    
    wire                            cmd2_awlast;
    wire                            cmd2_awvalid;
    wire                            cmd2_awready;
    
    jelly_data_split_pack2
            #(
                .NUM                    (3),
                .DATA0_0_WIDTH          (AXI4_ADDR_WIDTH),
                .DATA0_1_WIDTH          (1),
                .DATA0_2_WIDTH          (AXI4_LEN_WIDTH),
                .DATA1_0_WIDTH          (AXI4_LEN_WIDTH),
                .DATA2_0_WIDTH          (1),
                .S_REGS                 (0)
            )
        i_data_spliter
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_data0_0              (align_awaddr),
                .s_data0_1              (align_awlast),
                .s_data0_2              (align_awlen),
                .s_data1_0              (align_awlen),
                .s_data2_0              (align_awlast),
                .s_valid                (align_awvalid),
                .s_ready                (align_awready),
                
                .m0_data0               (cmd0_awaddr),
                .m0_data1               (cmd0_awlast),
                .m0_data2               (cmd0_awlen),
                .m0_valid               (cmd0_awvalid),
                .m0_ready               (cmd0_awready),
                
                .m1_data0               (cmd1_awlen),
                .m1_valid               (cmd1_awvalid),
                .m1_ready               (cmd1_awready),
                
                .m2_data0               (cmd2_awlast),
                .m2_valid               (cmd2_awvalid),
                .m2_ready               (cmd2_awready)
            );
    
    
    // aw
    assign m_axi4_awid     = AXI4_AWID;
    assign m_axi4_awaddr   = cmd0_awaddr;
    assign m_axi4_awlen    = cmd0_awlen;
    assign m_axi4_awsize   = AXI4_AWSIZE;
    assign m_axi4_awburst  = AXI4_AWBURST;
    assign m_axi4_awlock   = AXI4_AWLOCK;
    assign m_axi4_awcache  = AXI4_AWCACHE;
    assign m_axi4_awprot   = AXI4_AWPROT;
    assign m_axi4_awqos    = AXI4_AWQOS;
    assign m_axi4_awregion = AXI4_AWREGION;
    assign m_axi4_awvalid  = cmd0_awvalid;
    assign cmd0_awready    = m_axi4_awready;
    
    
    
    // ---------------------------------
    //  data
    // ---------------------------------
    
    // コマンド発行分だけデータを通す
    jelly_stream_gate
            #(
                .DATA_WIDTH             (AXI4_STRB_WIDTH + AXI4_DATA_WIDTH),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                .LEN_OFFSET             (1'b1),
                .USER_WIDTH             (0),
                .S_REGS                 (1),
                .M_REGS                 (1)
            )
        i_stream_gate
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .skip                   (1'b0),
                .detect_first           (1'b0),
                .detect_last            (1'b0),
                .padding_en             (1'b0),
                .padding_data           ({{AXI4_STRB_WIDTH{1'b0}}, {AXI4_DATA_WIDTH{1'bx}}}),
                
                .s_permit_reset         (~m_aresetn),
                .s_permit_clk           (m_aclk),
                .s_permit_first         (1'b1),
                .s_permit_last          (1'b1),
                .s_permit_len           (cmd1_awlen),
                .s_permit_user          (1'b0),
                .s_permit_valid         (cmd1_awvalid),
                .s_permit_ready         (cmd1_awready),
                
                .s_first                (1'b0),
                .s_last                 (1'b0),
                .s_data                 ({conv_wstrb, conv_wdata}),
                .s_valid                (conv_wvalid),
                .s_ready                (conv_wready),
                
                .m_first                (),
                .m_last                 (m_axi4_wlast),
                .m_data                 ({m_axi4_wstrb, m_axi4_wdata}),
                .m_user                 (),
                .m_valid                (m_axi4_wvalid),
                .m_ready                (m_axi4_wready)
            );
    
    
    
    // ---------------------------------
    //  write complete
    // ---------------------------------
    
    // receive ack
    wire    [1:0]                   ack_bresp;
    wire                            ack_blast;
    wire                            ack_bvalid;
    wire                            ack_bready;
    
    jelly_stream_add_syncflag
            #(
                .FIRST_WIDTH            (0),
                .LAST_WIDTH             (1),
                .USER_WIDTH             (2),
                
                .HAS_FIRST              (0),
                .HAS_LAST               (1),
                
                .ASYNC                  (0),
                .FIFO_PTR_WIDTH         (MBFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS         (MBFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE          (MBFIFO_RAM_TYPE ),
                .FIFO_LOW_DEALY         (MBFIFO_LOW_DEALY),
                .FIFO_S_REGS            (MBFIFO_S_REGS),
                .FIFO_M_REGS            (MBFIFO_M_REGS)
            )
        i_stream_add_syncflag
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_first                (1'b1),
                .s_last                 (1'b1),
                .s_user                 (m_axi4_bresp),
                .s_valid                (m_axi4_bvalid),
                .s_ready                (m_axi4_bready),
                
                .m_first                (),
                .m_last                 (),
                .m_added_first          (),
                .m_added_last           (ack_blast),
                .m_user                 (ack_bresp),
                .m_valid                (ack_bvalid),
                .m_ready                (ack_bready),
                
                .s_add_reset            (~m_aresetn),
                .s_add_clk              (m_aclk),
                .s_add_first            (1'b0),
                .s_add_last             (cmd2_awlast),
                .s_add_valid            (cmd2_awvalid),
                .s_add_ready            (cmd2_awready)
            );
    
    
    // BFIFO
    wire                            bfifo_valid;
    wire                            bfifo_ready;
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC                  (BASYNC),
                .DATA_WIDTH             (1'b1),
                .PTR_WIDTH              (BFIFO_PTR_WIDTH),
                .DOUT_REGS              (BFIFO_DOUT_REGS),
                .RAM_TYPE               (BFIFO_RAM_TYPE),
                .LOW_DEALY              (BFIFO_LOW_DEALY),
                .SLAVE_REGS             (BFIFO_S_REGS),
                .MASTER_REGS            (BFIFO_M_REGS)
            )
        i_fifo_generic_fwtf_b
            (
                .s_reset                (~m_aresetn),
                .s_clk                  (m_aclk),
                .s_data                 (1'b0),
                .s_valid                (bfifo_valid),
                .s_ready                (bfifo_ready),
                .s_free_count           (),
                
                .m_reset                (~s_bresetn),
                .m_clk                  (s_bclk),
                .m_data                 (),
                .m_valid                (s_bvalid),
                .m_ready                (s_bready),
                .m_data_count           ()
            );
    
    assign bfifo_valid = ack_bvalid && ack_blast;
    assign ack_bready  = s_bready || !(ack_bvalid && ack_blast);
    
    
endmodule


`default_nettype wire


// end of file
