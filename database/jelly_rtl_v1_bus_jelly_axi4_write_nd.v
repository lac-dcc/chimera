// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2020 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none


// AXI4 N次元データ書き込みコア
module jelly_axi4_write_nd
        #(
            parameter N                   = 1,
            
            parameter AWASYNC             = 1,
            parameter WASYNC              = 1,
            parameter BASYNC              = 1,
            
            parameter BYTE_WIDTH          = 8,
            parameter BYPASS_GATE         = 0,
            parameter BYPASS_ALIGN        = 0,
            parameter WDETECTOR_ENABLE    = 1,
            parameter ALLOW_UNALIGNED     = 0,
            
            parameter HAS_WSTRB           = 0,
            parameter HAS_WFIRST          = 0,
            parameter HAS_WLAST           = 0,
            
            parameter AXI4_ID_WIDTH       = 6,
            parameter AXI4_ADDR_WIDTH     = 32,
            parameter AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter AXI4_DATA_WIDTH     = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter AXI4_STRB_WIDTH     = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter AXI4_LEN_WIDTH      = 8,
            parameter AXI4_QOS_WIDTH      = 4,
            parameter AXI4_AWID           = {AXI4_ID_WIDTH{1'b0}},
            parameter AXI4_AWSIZE         = AXI4_DATA_SIZE,
            parameter AXI4_AWBURST        = 2'b01,
            parameter AXI4_AWLOCK         = 1'b0,
            parameter AXI4_AWCACHE        = 4'b0001,
            parameter AXI4_AWPROT         = 3'b000,
            parameter AXI4_AWQOS          = 0,
            parameter AXI4_AWREGION       = 4'b0000,
            parameter AXI4_ALIGN          = 12,  // 2^12 = 4k が境界
            
            parameter S_WDATA_WIDTH       = 32,
            parameter S_WSTRB_WIDTH       = S_WDATA_WIDTH / BYTE_WIDTH,
            parameter S_AWSTEP_WIDTH      = AXI4_ADDR_WIDTH,
            parameter S_AWLEN_WIDTH       = AXI4_ADDR_WIDTH,
            parameter S_AWLEN_OFFSET      = 1'b1,
            
            parameter CAPACITY_WIDTH      = AXI4_ADDR_WIDTH,   // 内部キューイング用
            
            parameter CONVERT_S_REGS      = 0,
            
            parameter WFIFO_PTR_WIDTH     = 9,
            parameter WFIFO_RAM_TYPE      = "block",
            parameter WFIFO_LOW_DEALY     = 0,
            parameter WFIFO_DOUT_REGS     = 1,
            parameter WFIFO_S_REGS        = 0,
            parameter WFIFO_M_REGS        = 1,
            
            parameter AWFIFO_PTR_WIDTH    = 4,
            parameter AWFIFO_RAM_TYPE     = "distributed",
            parameter AWFIFO_LOW_DEALY    = 1,
            parameter AWFIFO_DOUT_REGS    = 0,
            parameter AWFIFO_S_REGS       = 1,
            parameter AWFIFO_M_REGS       = 1,
            
            parameter BFIFO_PTR_WIDTH     = 4,
            parameter BFIFO_RAM_TYPE      = "distributed",
            parameter BFIFO_LOW_DEALY     = 0,
            parameter BFIFO_DOUT_REGS     = 0,
            parameter BFIFO_S_REGS        = 0,
            parameter BFIFO_M_REGS        = 0,
            
            parameter SWFIFOPTR_WIDTH     = 4,
            parameter SWFIFORAM_TYPE      = "distributed",
            parameter SWFIFOLOW_DEALY     = 1,
            parameter SWFIFODOUT_REGS     = 0,
            parameter SWFIFOS_REGS        = 0,
            parameter SWFIFOM_REGS        = 0,
            
            parameter MBFIFO_PTR_WIDTH    = 4,
            parameter MBFIFO_RAM_TYPE     = "distributed",
            parameter MBFIFO_LOW_DEALY    = 1,
            parameter MBFIFO_DOUT_REGS    = 0,
            parameter MBFIFO_S_REGS       = 0,
            parameter MBFIFO_M_REGS       = 0,
            
            parameter WDATFIFO_PTR_WIDTH  = 4,
            parameter WDATFIFO_DOUT_REGS  = 0,
            parameter WDATFIFO_RAM_TYPE   = "distributed",
            parameter WDATFIFO_LOW_DEALY  = 1,
            parameter WDATFIFO_S_REGS     = 0,
            parameter WDATFIFO_M_REGS     = 0,
            parameter WDAT_S_REGS         = 0,
            parameter WDAT_M_REGS         = 1,
            
            parameter BACKFIFO_PTR_WIDTH  = 4,
            parameter BACKFIFO_DOUT_REGS  = 0,
            parameter BACKFIFO_RAM_TYPE   = "distributed",
            parameter BACKFIFO_LOW_DEALY  = 1,
            parameter BACKFIFO_S_REGS     = 0,
            parameter BACKFIFO_M_REGS     = 0,
            parameter BACK_S_REGS         = 0,
            parameter BACK_M_REGS         = 1
        )
        (
            input   wire                            endian,
            
            input   wire                            s_awresetn,
            input   wire                            s_awclk,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_awaddr,
            input   wire    [AXI4_LEN_WIDTH-1:0]    s_awlen_max,
            input   wire    [N*S_AWSTEP_WIDTH-1:0]  s_awstep,       // step0は無視(1固定、つまり連続アクセスのみ)
            input   wire    [N*S_AWLEN_WIDTH-1:0]   s_awlen,
            input   wire                            s_awvalid,
            output  wire                            s_awready,
            
            input   wire                            s_wresetn,
            input   wire                            s_wclk,
            input   wire    [S_WDATA_WIDTH-1:0]     s_wdata,
            input   wire    [S_WSTRB_WIDTH-1:0]     s_wstrb,
            input   wire    [N-1:0]                 s_wfirst, 
            input   wire    [N-1:0]                 s_wlast,
            input   wire                            s_wvalid,
            output  wire                            s_wready,
            
            input   wire                            wskip,
            input   wire    [N-1:0]                 wdetect_first,
            input   wire    [N-1:0]                 wdetect_last,
            input   wire                            wpadding_en,
            input   wire    [S_WDATA_WIDTH-1:0]     wpadding_data,
            input   wire    [S_WSTRB_WIDTH-1:0]     wpadding_strb,
            
            input   wire                            s_bresetn,
            input   wire                            s_bclk,
            output  wire    [N-1:0]                 s_bfirst,
            output  wire    [N-1:0]                 s_blast,
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
    
    
    // ---------------------------------------------
    //  N-Dimension addressing
    // ---------------------------------------------
    
    // m_aw 側にクロック載せ替え
    wire    [AXI4_ADDR_WIDTH-1:0]   awfifo_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    awfifo_awlen_max;
    wire    [N*S_AWSTEP_WIDTH-1:0]  awfifo_awstep;
    wire    [N*S_AWLEN_WIDTH-1:0]   awfifo_awlen;
    wire                            awfifo_awvalid;
    wire                            awfifo_awready;
    
    jelly_fifo_pack
            #(
                .ASYNC              (AWASYNC),
                .DATA0_WIDTH        (AXI4_ADDR_WIDTH),
                .DATA1_WIDTH        (AXI4_LEN_WIDTH),
                .DATA2_WIDTH        (N*S_AWSTEP_WIDTH),
                .DATA3_WIDTH        (N*S_AWLEN_WIDTH),
                
                .PTR_WIDTH          (AWFIFO_PTR_WIDTH),
                .DOUT_REGS          (AWFIFO_DOUT_REGS),
                .RAM_TYPE           (AWFIFO_RAM_TYPE),
                .LOW_DEALY          (AWFIFO_LOW_DEALY),
                .S_REGS             (AWFIFO_S_REGS),
                .M_REGS             (AWFIFO_M_REGS)
            )
        i_fifo_pack_cmd_aw
            (
                .s_reset            (~s_awresetn),
                .s_clk              (s_awclk),
                .s_data0            (s_awaddr),
                .s_data1            (s_awlen_max),
                .s_data2            (s_awstep),
                .s_data3            (s_awlen),
                .s_valid            (s_awvalid),
                .s_ready            (s_awready),
                
                .m_reset            (~m_aresetn),
                .m_clk              (m_aclk),
                .m_data0            (awfifo_awaddr),
                .m_data1            (awfifo_awlen_max),
                .m_data2            (awfifo_awstep),
                .m_data3            (awfifo_awlen),
                .m_valid            (awfifo_awvalid),
                .m_ready            (awfifo_awready)
            );
    
    
    // address generate
    wire    [AXI4_ADDR_WIDTH-1:0]   adrgen_awaddr;
    wire    [S_AWLEN_WIDTH-1:0]     adrgen_awlen;
    wire    [AXI4_LEN_WIDTH-1:0]    adrgen_awlen_max;
    wire    [N-1:0]                 adrgen_awfirst;
    wire    [N-1:0]                 adrgen_awlast;
    wire                            adrgen_awvalid;
    wire                            adrgen_awready;
    
    generate
    if ( N >= 2 ) begin : blk_adrgen_nd
        // 2D以上のアドレッシング
        jelly_address_generator_nd
                #(
                    .N                      (N-1),
                    .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                    .STEP_WIDTH             (S_AWSTEP_WIDTH),
                    .LEN_WIDTH              (S_AWLEN_WIDTH),
                    .LEN_OFFSET             (S_AWLEN_OFFSET),
                    .USER_WIDTH             (S_AWLEN_WIDTH + AXI4_LEN_WIDTH)
                )
            i_address_generator_nd
                (
                    .reset                  (~m_aresetn),
                    .clk                    (m_aclk),
                    .cke                    (1'b1),
                    
                    .s_addr                 (awfifo_awaddr),
                    .s_step                 (awfifo_awstep[N*S_AWSTEP_WIDTH-1:S_AWSTEP_WIDTH]),
                    .s_len                  (awfifo_awlen [N*S_AWLEN_WIDTH-1:S_AWLEN_WIDTH]),
                    .s_user                 ({awfifo_awlen[S_AWLEN_WIDTH-1:0], awfifo_awlen_max}),
                    .s_valid                (awfifo_awvalid),
                    .s_ready                (awfifo_awready),
                    
                    .m_addr                 (adrgen_awaddr),
                    .m_first                (adrgen_awfirst[N-1:1]),
                    .m_last                 (adrgen_awlast[N-1:1]),
                    .m_user                 ({adrgen_awlen, adrgen_awlen_max}),
                    .m_valid                (adrgen_awvalid),
                    .m_ready                (adrgen_awready)
                );
        assign adrgen_awfirst[0] = 1'b1;
        assign adrgen_awlast[0]  = 1'b1;
    end
    else begin : blk_1d
        assign adrgen_awaddr     = awfifo_awaddr;
        assign adrgen_awlen      = awfifo_awlen;
        assign adrgen_awlen_max  = awfifo_awlen_max;
        assign adrgen_awfirst    = 1'b1;
        assign adrgen_awlast     = 1'b1;
        assign adrgen_awvalid    = awfifo_awvalid;
        assign awfifo_awready    = adrgen_awready;
    end
    endgenerate
    
    
    // コマンド分岐
    wire    [AXI4_ADDR_WIDTH-1:0]   cmd_awaddr;
    wire    [S_AWLEN_WIDTH-1:0]     cmd_awlen;
    wire    [AXI4_LEN_WIDTH-1:0]    cmd_awlen_max;
    wire                            cmd_awvalid;
    wire                            cmd_awready;
    
    wire    [N-1:0]                 dat_awfirst;
    wire    [N-1:0]                 dat_awlast;
    wire    [S_AWLEN_WIDTH-1:0]     dat_awlen;
    wire                            dat_awvalid;
    wire                            dat_awready;
    
    wire    [N-1:0]                 ack_awfirst;
    wire    [N-1:0]                 ack_awlast;
    wire                            ack_awvalid;
    wire                            ack_awready;
    
    jelly_data_split_pack2
            #(
                .NUM                    (3),
                .DATA0_0_WIDTH          (AXI4_ADDR_WIDTH),
                .DATA0_1_WIDTH          (S_AWLEN_WIDTH),
                .DATA0_2_WIDTH          (AXI4_LEN_WIDTH),
                .DATA1_0_WIDTH          (S_AWLEN_WIDTH),
                .DATA1_1_WIDTH          (N),
                .DATA1_2_WIDTH          (N),
                .DATA2_0_WIDTH          (N),
                .DATA2_1_WIDTH          (N)
            )
        i_data_split_pack2
            (
                .reset                  (~m_aresetn),
                .clk                    (m_aclk),
                .cke                    (1'b1),
                
                .s_data0_0              (adrgen_awaddr),
                .s_data0_1              (adrgen_awlen),
                .s_data0_2              (adrgen_awlen_max),
                .s_data1_0              (adrgen_awlen),
                .s_data1_1              (adrgen_awfirst),
                .s_data1_2              (adrgen_awlast),
                .s_data2_0              (adrgen_awfirst),
                .s_data2_1              (adrgen_awlast),
                .s_valid                (adrgen_awvalid),
                .s_ready                (adrgen_awready),
                
                .m0_data0               (cmd_awaddr),
                .m0_data1               (cmd_awlen),
                .m0_data2               (cmd_awlen_max),
                .m0_valid               (cmd_awvalid),
                .m0_ready               (cmd_awready),
                
                .m1_data0               (dat_awlen),
                .m1_data1               (dat_awfirst),
                .m1_data2               (dat_awlast),
                .m1_valid               (dat_awvalid),
                .m1_ready               (dat_awready),
                
                .m2_data0               (ack_awfirst),
                .m2_data1               (ack_awlast),
                .m2_valid               (ack_awvalid),
                .m2_ready               (ack_awready)
            );
    
    
    // ---------------------------------------------
    //  1D write core
    // ---------------------------------------------
    
    // write
    wire    [S_WDATA_WIDTH-1:0]     write_wdata;
    wire    [S_WSTRB_WIDTH-1:0]     write_wstrb;
    wire    [N-1:0]                 write_wfirst;
    wire    [N-1:0]                 write_wlast;
    wire                            write_wvalid;
    wire                            write_wready;
    
    wire                            write_bvalid;
    wire                            write_bready;
    
    jelly_axi4_write
        #(
            .AWASYNC                (0),
            .WASYNC                 (WASYNC),
            .BASYNC                 (BASYNC),
            
            .BYTE_WIDTH             (BYTE_WIDTH),
            .BYPASS_GATE            (BYPASS_GATE),
            .BYPASS_ALIGN           (BYPASS_ALIGN),
            .AXI4_ALIGN             (AXI4_ALIGN),
            .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
            
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
            
            .S_WDATA_WIDTH          (S_WDATA_WIDTH),
            .S_WSTRB_WIDTH          (S_WSTRB_WIDTH),
            .S_AWLEN_WIDTH          (S_AWLEN_WIDTH),
            .S_AWLEN_OFFSET         (S_AWLEN_OFFSET),
            
            .CAPACITY_WIDTH         (CAPACITY_WIDTH),
            
            .CONVERT_S_REGS         (CONVERT_S_REGS),
            
            .WFIFO_PTR_WIDTH        (WFIFO_PTR_WIDTH),
            .WFIFO_RAM_TYPE         (WFIFO_RAM_TYPE),
            .WFIFO_LOW_DEALY        (WFIFO_LOW_DEALY),
            .WFIFO_DOUT_REGS        (WFIFO_DOUT_REGS),
            .WFIFO_S_REGS           (WFIFO_S_REGS),
            .WFIFO_M_REGS           (WFIFO_M_REGS),
            
            .AWFIFO_PTR_WIDTH       (0),
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
            .MBFIFO_M_REGS          (MBFIFO_M_REGS)
        )
    i_axi4_write
        (
            .endian                 (endian),
            
            .s_awresetn             (m_aresetn),
            .s_awclk                (m_aclk),
            .s_awaddr               (cmd_awaddr),
            .s_awlen                (cmd_awlen),
            .s_awlen_max            (cmd_awlen_max),
            .s_awvalid              (cmd_awvalid),
            .s_awready              (cmd_awready),
            
            .s_wresetn              (s_wresetn),
            .s_wclk                 (s_wclk),
            .s_wdata                (write_wdata),
            .s_wstrb                (write_wstrb),
            .s_wfirst               (write_wfirst[0]),
            .s_wlast                (write_wlast[0]),
            .s_wvalid               (write_wvalid),
            .s_wready               (write_wready),
            
            .s_bresetn              (s_bresetn),
            .s_bclk                 (s_bclk),
            .s_bvalid               (write_bvalid),
            .s_bready               (write_bready),
            
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
    
    
    
    // ---------------------------------------------
    //  write data
    // ---------------------------------------------
    
    // サイズに合わせてデータ補正
    jelly_stream_gate
            #(
                .N                  (N),
                .BYPASS             (BYPASS_GATE),
                .DETECTOR_ENABLE    (WDETECTOR_ENABLE),
                .DATA_WIDTH         (S_WSTRB_WIDTH + S_WDATA_WIDTH),
                .LEN_WIDTH          (S_AWLEN_WIDTH),
                .LEN_OFFSET         (S_AWLEN_OFFSET),
                .S_REGS             (WDAT_S_REGS),
                .M_REGS             (WDAT_M_REGS),
                
                .ASYNC              (WASYNC),
                .FIFO_PTR_WIDTH     (WDATFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS     (WDATFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE      (WDATFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY     (WDATFIFO_LOW_DEALY),
                .FIFO_S_REGS        (WDATFIFO_S_REGS),
                .FIFO_M_REGS        (WDATFIFO_M_REGS)
            )
        i_stream_gate
            (
                .reset              (~s_wresetn),
                .clk                (s_wclk),
                .cke                (1'b1),
                
                .skip               (wskip),
                .detect_first       (wdetect_first),
                .detect_last        (wdetect_last),
                .padding_en         (wpadding_en),
                .padding_data       ({wpadding_strb, wpadding_data}),
                
                .s_first            (s_wfirst),
                .s_last             (s_wlast),
                .s_data             ({s_wstrb, s_wdata}),
                .s_valid            (s_wvalid),
                .s_ready            (s_wready),
                
                .m_first            (write_wfirst),
                .m_last             (write_wlast),
                .m_data             ({write_wstrb, write_wdata}),
                .m_user             (),
                .m_valid            (write_wvalid),
                .m_ready            (write_wready),
                
                .s_permit_reset     (~m_aresetn),
                .s_permit_clk       (m_aclk),
                .s_permit_first     (dat_awfirst),
                .s_permit_last      (dat_awlast),
                .s_permit_len       (dat_awlen),
                .s_permit_user      (1'b0),
                .s_permit_valid     (dat_awvalid),
                .s_permit_ready     (dat_awready)
            );
    
    
    
    // ---------------------------------------------
    //  write ack
    // ---------------------------------------------
    
    // b-ack ポートにフラグ付与
    jelly_stream_add_syncflag
            #(
                .FIRST_WIDTH        (N),
                .LAST_WIDTH         (N),
                .USER_WIDTH         (0),
                .HAS_FIRST          (1),
                .HAS_LAST           (1),
                .ASYNC              (WASYNC),
                .FIFO_PTR_WIDTH     (BACKFIFO_PTR_WIDTH),
                .FIFO_DOUT_REGS     (BACKFIFO_DOUT_REGS),
                .FIFO_RAM_TYPE      (BACKFIFO_RAM_TYPE),
                .FIFO_LOW_DEALY     (BACKFIFO_LOW_DEALY),
                .FIFO_S_REGS        (BACKFIFO_S_REGS),
                .FIFO_M_REGS        (BACKFIFO_M_REGS),
                .S_REGS             (BACK_S_REGS),
                .M_REGS             (BACK_M_REGS)
            )
        i_stream_add_syncflag_b
            (
                .reset              (~s_bresetn),
                .clk                (s_bclk),
                .cke                (1'b1),
                
                .s_first            (1'b1),
                .s_last             (1'b1),
                .s_user             (1'b0),
                .s_valid            (write_bvalid),
                .s_ready            (write_bready),
                
                .m_first            (),
                .m_last             (),
                .m_added_first      (s_bfirst),
                .m_added_last       (s_blast),
                .m_user             (),
                .m_valid            (s_bvalid),
                .m_ready            (s_bready),
                
                .s_add_reset        (~m_aresetn),
                .s_add_clk          (m_aclk),
                .s_add_first        (ack_awfirst),
                .s_add_last         (ack_awlast),
                .s_add_valid        (ack_awvalid),
                .s_add_ready        (ack_awready)
            );
    
endmodule


`default_nettype wire


// end of file
