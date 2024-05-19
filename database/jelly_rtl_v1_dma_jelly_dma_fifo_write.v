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


// AXI4 DMA FIFO用 データ書き込みコア
module jelly_dma_fifo_write
        #(
            parameter   ASYNC                = 1,
            parameter   UNIT_WIDTH           = 8,
            parameter   BYTE_WIDTH           = 8,
            parameter   S_DATA_WIDTH         = 32,
            
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
            
            parameter   BYPASS_ADDR_OFFSET   = 0,
            parameter   BYPASS_ALIGN         = 0,
            parameter   AXI4_ALIGN           = 12,
            
            parameter   PARAM_ADDR_WIDTH     = AXI4_ADDR_WIDTH,
            parameter   PARAM_SIZE_WIDTH     = 32,
            parameter   PARAM_SIZE_OFFSET    = 1'b0,
            parameter   PARAM_AWLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_WSTRB_WIDTH    = AXI4_STRB_WIDTH,
            parameter   PARAM_TIMEOUT_WIDTH  = 8,
            
            parameter   PERMIT_SIZE_WIDTH    = AXI4_LEN_WIDTH,
            parameter   COMPLETE_SIZE_WIDTH  = AXI4_LEN_WIDTH,
            
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
            parameter   BLEN_FIFO_M_REGS     = 1
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire                                update_param,
            input   wire    [PARAM_ADDR_WIDTH-1:0]      param_addr,
            input   wire    [PARAM_SIZE_WIDTH-1:0]      param_size,
            input   wire    [PARAM_AWLEN_WIDTH-1:0]     param_awlen,
            input   wire    [PARAM_WSTRB_WIDTH-1:0]     param_wstrb,
            input   wire    [PARAM_TIMEOUT_WIDTH-1:0]   param_timeout,
            
            input   wire                                s_reset,
            input   wire                                s_clk,
            input   wire    [S_DATA_WIDTH-1:0]          s_data,
            input   wire                                s_valid,
            output  wire                                s_ready,
            
            input   wire    [PERMIT_SIZE_WIDTH-1:0]     write_permit_size,
            input   wire                                write_permit_valid,
            
            output  wire    [COMPLETE_SIZE_WIDTH-1:0]   write_complete_size,
            output  wire                                write_complete_valid,
            
            
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
            output  wire                                m_axi4_bready
        );
    
    
    // ---------------------------------
    //  localparam
    // ---------------------------------
    
    localparam  POST_CONVERT     = ((S_DATA_WIDTH > AXI4_DATA_WIDTH) && (S_DATA_WIDTH % AXI4_DATA_WIDTH == 0));
    
    localparam  CAPACITY_WIDTH   = PARAM_SIZE_WIDTH - AXI4_DATA_SIZE;
    localparam  ADDR_WIDTH       = PARAM_SIZE_WIDTH - AXI4_DATA_SIZE;
    localparam  LEN_WIDTH        = PARAM_AWLEN_WIDTH;
    
    
    
    // ---------------------------------
    //  FIFO
    // ---------------------------------
    
    wire    [AXI4_DATA_WIDTH-1:0]   fifo_data;
    wire                            fifo_valid;
    wire                            fifo_ready;
    
    wire    [CAPACITY_WIDTH-1:0]    s_wr_size = POST_CONVERT ? (S_DATA_WIDTH / AXI4_DATA_WIDTH) : 1;
    wire                            s_wr_valid;
    
    jelly_fifo_width_convert
            #(
                .ASYNC                  (ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .S_NUM                  (S_DATA_WIDTH    / UNIT_WIDTH),
                .M_NUM                  (AXI4_DATA_WIDTH / UNIT_WIDTH),
                
                .FIFO_PTR_WIDTH         (WDATA_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE          (WDATA_FIFO_RAM_TYPE),
                .FIFO_LOW_DEALY         (WDATA_FIFO_LOW_DEALY),
                .FIFO_DOUT_REGS         (WDATA_FIFO_DOUT_REGS),
                .FIFO_S_REGS            (WDATA_FIFO_S_REGS),
                .FIFO_M_REGS            (WDATA_FIFO_M_REGS),
                
                .POST_CONVERT           (POST_CONVERT)
            )
        i_fifo_width_convert_wdata
            (
                .endian                 (1'b0),
                
                .s_reset                (s_reset),
                .s_clk                  (s_clk),
                .s_data                 (s_data),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                .s_fifo_free_count      (),
                .s_fifo_wr_signal       (s_wr_valid),
                
                .m_reset                (~aresetn),
                .m_clk                  (aclk),
                .m_data                 (fifo_data),
                .m_valid                (fifo_valid),
                .m_ready                (fifo_ready | ~busy),
                .m_fifo_data_count      (),
                .m_fifo_rd_signal       ()
            );
    
    
    wire    [CAPACITY_WIDTH-1:0]    fifo_wr_size;
    wire                            fifo_wr_valid;
    wire                            fifo_wr_ready;
    
    jelly_capacity_async
            #(
                .ASYNC                  (ASYNC),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .REQUEST_SIZE_OFFSET    (1'b0),
                .ISSUE_SIZE_OFFSET      (1'b0)
            )
        i_capacity_async
            (
                .s_reset                (s_reset),
                .s_clk                  (s_clk),
                .s_request_size         (s_wr_size),
                .s_request_valid        (s_wr_valid),
                .s_queued_request       (),
                
                .m_reset                (~aresetn),
                .m_clk                  (aclk),
                .m_issue_size           (fifo_wr_size),
                .m_issue_valid          (fifo_wr_valid),
                .m_issue_ready          (fifo_wr_ready),
                .m_queued_request       ()
            );
    
    
    
    // ---------------------------------
    //  Control
    // ---------------------------------
    
    jelly_busy_control
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .COMPLETE_WIDTH         (COMPLETE_SIZE_WIDTH),
                .ISSUE_SIZE_OFFSET      (1'b0),
                .COMPLETE_SIZE_OFFSET   (1'b1)
            )
        i_busy_control
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .enable                 (enable),
                .busy                   (busy),
                
                .current_count          (),
                
                .s_issue_size           (fifo_wr_size),
                .s_issue_valid          (fifo_wr_valid & fifo_wr_ready),
                
                .s_complete_size        (write_complete_size),
                .s_complete_valid       (write_complete_valid)
            );
    
    
    
    // ---------------------------------
    //  write capacity control
    // ---------------------------------
    
    // メモリの空き容量分書き込みを許す(読み終わった分再チャージする)
    
    wire    [CAPACITY_WIDTH-1:0]    initial_capacity = param_size[PARAM_SIZE_WIDTH-1:AXI4_DATA_SIZE];
    wire    [CAPACITY_WIDTH-1:0]    initial_request  = {CAPACITY_WIDTH{1'b0}};
    
    wire    [CAPACITY_WIDTH-1:0]    control_len;
    wire                            control_valid;
    
    jelly_capacity_control
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (CAPACITY_WIDTH),
                .CHARGE_WIDTH           (PERMIT_SIZE_WIDTH),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .REQUEST_SIZE_OFFSET    (PARAM_SIZE_OFFSET),
                .CHARGE_SIZE_OFFSET     (1'b1),
                .ISSUE_SIZE_OFFSET      (1'b0)
            )
        i_capacity_control
            (
                .reset                  (~aresetn | (~busy & update_param)),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .initial_capacity       (initial_capacity),
                .initial_request        (initial_request),
                
                .current_capacity       (),
                .queued_request         (),
                
                .s_request_size         (fifo_wr_size),
                .s_request_valid        (fifo_wr_valid & fifo_wr_ready),
                
                .s_charge_size          (write_permit_size),
                .s_charge_valid         (write_permit_valid),
                
                .m_issue_size           (control_len),
                .m_issue_valid          (control_valid),
                .m_issue_ready          (1'b1)
            );
    
    assign fifo_wr_ready = busy & enable;
    
    
    
    
    // すぐに書き込まずにタイムアウトするまで待ってなるべくまとまった単位で書き込む
    wire    [LEN_WIDTH-1:0]         timeout_len;
    wire                            timeout_valid;
    wire                            timeout_ready;
    
    jelly_capacity_timeout
            #(
                .TIMER_WIDTH            (PARAM_TIMEOUT_WIDTH),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),               // オーバーフローしないサイズとする
                .REQUEST_WIDTH          (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (LEN_WIDTH),
                .REQUEST_SIZE_OFFSET    (1'b0),
                .ISSUE_SIZE_OFFSET      (1'b1),
                .INIT_REQUEST           (0)
            )
        i_capacity_timeout
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .max_issue_size         (param_awlen),
                .timeout                (param_timeout),
                
                .queued_request         (),
                .current_timer          (),
                
                .s_request_size         (control_len),
                .s_request_valid        (control_valid),
                
                .m_issue_size           (timeout_len),
                .m_issue_valid          (timeout_valid),
                .m_issue_ready          (timeout_ready)
            );
    
    
    // レンジ内での循環アドレスを生成する
    wire    [ADDR_WIDTH-1:0]        adrgen_addr;
    wire    [LEN_WIDTH-1:0]         adrgen_len;
    wire                            adrgen_valid;
    wire                            adrgen_ready;
    
    jelly_address_generator_range
            #(
                .SIZE_WIDTH             (ADDR_WIDTH),
                .LEN_WIDTH              (8),
                .SIZE_OFFSET            (PARAM_SIZE_OFFSET),
                .LEN_OFFSET             (1'b1),
                .S_REGS                 (1),
                .INIT_ADDR              (0)
            )
        i_address_generator_range
            (
                .reset                  (~aresetn | (~busy & update_param)),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .param_size             (param_size[PARAM_SIZE_WIDTH-1:AXI4_DATA_SIZE]),
                
                .s_len                  (timeout_len),
                .s_valid                (timeout_valid),
                .s_ready                (timeout_ready),
                
                .m_addr                 (adrgen_addr),
                .m_len                  (adrgen_len),
                .m_valid                (adrgen_valid),
                .m_ready                (adrgen_ready)
            );
    
    
    //  アドレスに値を加算する
    wire    [AXI4_ADDR_WIDTH-1:0]   adroff_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    adroff_awlen;
    wire                            adroff_valid;
    wire                            adroff_ready;
    
    jelly_address_offset
            #(
                .BYPASS                 (BYPASS_ADDR_OFFSET),
                .OFFSET_WIDTH           (PARAM_ADDR_WIDTH),
                .S_ADDR_WIDTH           (ADDR_WIDTH),
                .M_ADDR_WIDTH           (AXI4_ADDR_WIDTH),
                .USER_WIDTH             (AXI4_LEN_WIDTH),
                .S_ADDR_UNIT            (1 << AXI4_DATA_SIZE),
                .OFFSET_UNIT            (1),
                .M_UNIT_SIZE            (0),
                .S_REGS                 (0),
                .M_REGS                 (1)
            )
        i_address_offset
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .s_addr                 (adrgen_addr),
                .s_offset               (param_addr),
                .s_user                 (adrgen_len),
                .s_valid                (adrgen_valid),
                .s_ready                (adrgen_ready),
                
                .m_addr                 (adroff_awaddr),
                .m_user                 (adroff_awlen),
                .m_valid                (adroff_valid),
                .m_ready                (adroff_ready)
            );
    
    
    // 4kアライメント処理
    wire    [AXI4_ADDR_WIDTH-1:0]   align_awaddr;
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
                .LEN_OFFSET             (1'b1),
                .ALIGN                  (AXI4_ALIGN),
                .S_REGS                 (0)
            )
        i_address_align_split
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .s_first                (1'b0),
                .s_last                 (1'b0),
                .s_addr                 (adroff_awaddr),
                .s_len                  (adroff_awlen),
                .s_user                 (1'b0),
                .s_valid                (adroff_valid),
                .s_ready                (adroff_ready),
                
                .m_first                (),
                .m_last                 (),
                .m_addr                 (align_awaddr),
                .m_len                  (align_awlen),
                .m_user                 (),
                .m_valid                (align_awvalid),
                .m_ready                (align_awready)
            );
    
    
    // ---------------------------------
    //  address command split
    // ---------------------------------
    
    // コマンド発行用とデータ管理用と終了管理用に3分岐させる
    wire    [AXI4_ADDR_WIDTH-1:0]   cmd0_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    cmd0_awlen;
    wire                            cmd0_awvalid;
    wire                            cmd0_awready;
    
    wire    [AXI4_LEN_WIDTH-1:0]    cmd1_awlen;
    wire                            cmd1_awvalid;
    wire                            cmd1_awready;
    
    wire    [AXI4_LEN_WIDTH-1:0]    cmd2_awlen;
    wire                            cmd2_awvalid;
    wire                            cmd2_awready;
    
    jelly_data_split_pack
            #(
                .NUM                    (3),
                .DATA0_WIDTH            (AXI4_LEN_WIDTH + AXI4_ADDR_WIDTH),
                .DATA1_WIDTH            (AXI4_LEN_WIDTH),
                .DATA2_WIDTH            (AXI4_LEN_WIDTH),
                .S_REGS                 (0)
            )
        i_data_split_pack
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .s_data0                ({align_awlen, align_awaddr}),
                .s_data1                (align_awlen),
                .s_data2                (align_awlen),
                .s_valid                (align_awvalid),
                .s_ready                (align_awready),
                
                .m0_data                ({cmd0_awlen, cmd0_awaddr}),
                .m0_valid               (cmd0_awvalid),
                .m0_ready               (cmd0_awready),
                
                .m1_data                (cmd1_awlen),
                .m1_valid               (cmd1_awvalid),
                .m1_ready               (cmd1_awready),
                
                .m2_data                (cmd2_awlen),
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
    
    // wlast付与
    jelly_stream_gate
            #(
                .DATA_WIDTH             (AXI4_DATA_WIDTH),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                .LEN_OFFSET             (1'b1),
                .USER_WIDTH             (0),
                .S_REGS                 (0),
                .M_REGS                 (1)
            )
        i_stream_gate
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .skip                   (1'b0),
                .detect_first           (1'b0),
                .detect_last            (1'b0),
                .padding_en             (1'b0),
                .padding_data           (1'b0),
                
                .s_first                (1'b0),
                .s_last                 (1'b0),
                .s_data                 (fifo_data),
                .s_valid                (fifo_valid),
                .s_ready                (fifo_ready),
                
                .m_first                (),
                .m_last                 (m_axi4_wlast),
                .m_data                 (m_axi4_wdata),
                .m_user                 (),
                .m_valid                (m_axi4_wvalid),
                .m_ready                (m_axi4_wready),
                
                .s_permit_reset         (~aresetn),
                .s_permit_clk           (aclk),
                .s_permit_first         (1'b1),
                .s_permit_last          (1'b1),
                .s_permit_len           (cmd1_awlen),
                .s_permit_user          (1'b0),
                .s_permit_valid         (cmd1_awvalid),
                .s_permit_ready         (cmd1_awready)
            );
    
    
    assign m_axi4_wstrb  = param_wstrb;
    
    
    // ---------------------------------
    //  write complete
    // ---------------------------------
    
    wire    [AXI4_LEN_WIDTH-1:0]    blen_awlen;
    wire                            blen_valid;
    wire                            blen_ready;
    
    jelly_fifo_fwtf
            #(
                .DATA_WIDTH             (AXI4_LEN_WIDTH),
                .PTR_WIDTH              (BLEN_FIFO_PTR_WIDTH),
                .DOUT_REGS              (BLEN_FIFO_DOUT_REGS),
                .RAM_TYPE               (BLEN_FIFO_RAM_TYPE),
                .LOW_DEALY              (BLEN_FIFO_LOW_DEALY),
                .SLAVE_REGS             (BLEN_FIFO_S_REGS),
                .MASTER_REGS            (BLEN_FIFO_M_REGS)
            )
        i_fifo_fwtf_blen
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                
                .s_data                 (cmd2_awlen),
                .s_valid                (cmd2_awvalid),
                .s_ready                (cmd2_awready),
                .s_free_count           (),
                
                .m_data                 (blen_awlen),
                .m_valid                (blen_valid),
                .m_ready                (blen_ready),
                .m_data_count           ()
            );
    
    assign blen_ready           = (m_axi4_bvalid & m_axi4_bready);
    
    assign write_complete_size  = blen_awlen;
    assign write_complete_valid = (blen_valid & blen_ready);
    
    assign m_axi4_bready        = 1'b1;
    
    
    
    // ---------------------------------
    //  debug (for dimulation)
    // ---------------------------------
    
    integer total_s;
    always @(posedge s_clk) begin
        if ( s_reset ) begin
            total_s <= 0;
        end
        else begin
            if ( s_valid & s_ready ) begin
                total_s <= total_s + 1;
            end
        end
    end
    
    integer total_aw;
    integer total_w;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            total_aw <= 0;
            total_w  <= 0;
        end
        else begin
            if ( m_axi4_awvalid & m_axi4_awready ) begin
                total_aw <= total_aw + m_axi4_awlen + 1'b1;
            end
            
            if ( m_axi4_wvalid & m_axi4_wready ) begin
                total_w <= total_w + 'b1;
            end
        end
    end
    
    integer     total_fifo;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            total_fifo <= 0;
        end
        else begin
            if ( fifo_valid & fifo_ready ) begin
                total_fifo <= total_fifo + 1;
            end
        end
    end
    
    integer total_permit;
    integer total_complete;
    always @(posedge aclk) begin
        if ( ~aresetn || (!busy & update_param) ) begin
            total_permit   <= 0;
            total_complete <= 0;
        end
        else begin
            if ( write_permit_valid ) begin
                total_permit <= total_permit + write_permit_size + 1'b1;
            end
            
            if ( write_complete_valid ) begin
                total_complete <= total_complete + write_complete_size + 1'b1;
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
