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


// AXI4 DMA FIFO用 データ読出しコア
module jelly_dma_fifo_read
        #(
            parameter   ASYNC                = 1,
            parameter   UNIT_WIDTH           = 8,
            parameter   BYTE_WIDTH           = 8,
            parameter   M_DATA_WIDTH         = 32,
            
            parameter   AXI4_ID_WIDTH        = 6,
            parameter   AXI4_ADDR_WIDTH      = 49,
            parameter   AXI4_DATA_SIZE       = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / BYTE_WIDTH,
            parameter   AXI4_LEN_WIDTH       = 8,
            parameter   AXI4_QOS_WIDTH       = 4,
            
            parameter   AXI4_ARID            = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE          = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST         = 2'b01,
            parameter   AXI4_ARLOCK          = 1'b0,
            parameter   AXI4_ARCACHE         = 4'b0001,
            parameter   AXI4_ARPROT          = 3'b000,
            parameter   AXI4_ARQOS           = 0,
            parameter   AXI4_ARREGION        = 4'b0000,
            
            parameter   BYPASS_ADDR_OFFSET   = 0,
            parameter   BYPASS_ALIGN         = 0,
            parameter   AXI4_ALIGN           = 12,
            
            parameter   PARAM_ADDR_WIDTH     = AXI4_ADDR_WIDTH,
            parameter   PARAM_SIZE_WIDTH     = 32,
            parameter   PARAM_SIZE_OFFSET    = 1'b0,
            parameter   PARAM_ARLEN_WIDTH    = AXI4_LEN_WIDTH,
            parameter   PARAM_TIMEOUT_WIDTH  = 8,
            
            parameter   REQUEST_SIZE_WIDTH   = AXI4_LEN_WIDTH,
            parameter   COMPLETE_SIZE_WIDTH  = AXI4_LEN_WIDTH,
            
            parameter   RDATA_FIFO_PTR_WIDTH = 9,
            parameter   RDATA_FIFO_RAM_TYPE  = "block",
            parameter   RDATA_FIFO_LOW_DEALY = 0,
            parameter   RDATA_FIFO_DOUT_REGS = 1,
            parameter   RDATA_FIFO_S_REGS    = 1,
            parameter   RDATA_FIFO_M_REGS    = 1
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire                                update_param,
            input   wire    [PARAM_ADDR_WIDTH-1:0]      param_addr,
            input   wire    [PARAM_SIZE_WIDTH-1:0]      param_size,
            input   wire    [PARAM_ARLEN_WIDTH-1:0]     param_arlen,
            input   wire    [PARAM_TIMEOUT_WIDTH-1:0]   param_timeout,
            
            input   wire                                m_reset,
            input   wire                                m_clk,
            output  wire    [M_DATA_WIDTH-1:0]          m_data,
            output  wire                                m_valid,
            input   wire                                m_ready,
            
            input   wire    [REQUEST_SIZE_WIDTH-1:0]    read_request_size,
            input   wire                                read_request_valid,
            
            output  wire    [COMPLETE_SIZE_WIDTH-1:0]   read_complete_size,
            output  wire                                read_complete_valid,
            
            
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
    
    
    // ---------------------------------
    //  localparam
    // ---------------------------------
    
    localparam  POST_CONVERT    = !((M_DATA_WIDTH > AXI4_DATA_WIDTH) && (M_DATA_WIDTH % AXI4_DATA_WIDTH == 0));
    
    localparam  CAPACITY_WIDTH  = RDATA_FIFO_PTR_WIDTH + 1;
    localparam  ADDR_WIDTH      = PARAM_SIZE_WIDTH - AXI4_DATA_SIZE;
    localparam  LEN_WIDTH       = PARAM_ARLEN_WIDTH;
    
    
    
    // ---------------------------------
    //  FIFO
    // ---------------------------------
    
    wire    [AXI4_DATA_WIDTH-1:0]   fifo_data;
    wire                            fifo_valid;
    wire                            fifo_ready;
    
    wire    [CAPACITY_WIDTH-1:0]    m_rd_size = POST_CONVERT ? 1 : M_DATA_WIDTH / AXI4_DATA_WIDTH;
    wire                            m_rd_valid;
    
    jelly_fifo_width_convert
            #(
                .ASYNC                  (ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .S_NUM                  (AXI4_DATA_WIDTH / UNIT_WIDTH),
                .M_NUM                  (M_DATA_WIDTH    / UNIT_WIDTH),
                
                .FIFO_PTR_WIDTH         (RDATA_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE          (RDATA_FIFO_RAM_TYPE),
                .FIFO_LOW_DEALY         (RDATA_FIFO_LOW_DEALY),
                .FIFO_DOUT_REGS         (RDATA_FIFO_DOUT_REGS),
                .FIFO_S_REGS            (RDATA_FIFO_S_REGS),
                .FIFO_M_REGS            (RDATA_FIFO_M_REGS),
                
                .POST_CONVERT           (POST_CONVERT)
            )
        i_fifo_width_convert_rdata
            (
                .endian                 (1'b0),
                
                .s_reset                (~aresetn),
                .s_clk                  (aclk),
                .s_data                 (fifo_data),
                .s_valid                (fifo_valid),
                .s_ready                (fifo_ready),
                .s_fifo_free_count      (),
                .s_fifo_wr_signal       (),
                
                .m_reset                (m_reset),
                .m_clk                  (m_clk),
                .m_data                 (m_data),
                .m_valid                (m_valid),
                .m_ready                (m_ready),
                .m_fifo_data_count      (),
                .m_fifo_rd_signal       (m_rd_valid)
            );
    
    
    wire    [CAPACITY_WIDTH-1:0]    fifo_rd_size;
    wire                            fifo_rd_valid;
    wire                            fifo_rd_ready;
    
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
                .s_reset                (m_reset),
                .s_clk                  (m_clk),
                .s_request_size         (m_rd_size),
                .s_request_valid        (m_rd_valid),
                .s_queued_request       (),
                
                .m_reset                (~aresetn),
                .m_clk                  (aclk),
                .m_issue_size           (fifo_rd_size),
                .m_issue_valid          (fifo_rd_valid),
                .m_issue_ready          (fifo_rd_ready),
                .m_queued_request       ()
            );
    
    
    
    // ---------------------------------
    //  Control
    // ---------------------------------
    
    assign read_complete_size  = 1'b0;
    assign read_complete_valid = m_axi4_rvalid & m_axi4_rready;
    
    jelly_busy_control
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (REQUEST_SIZE_WIDTH),
                .COMPLETE_WIDTH         (CAPACITY_WIDTH),
                .ISSUE_SIZE_OFFSET      (1'b1),
                .COMPLETE_SIZE_OFFSET   (1'b0)
            )
        i_busy_control
            (
                .reset                  (~aresetn),
                .clk                    (aclk),
                .cke                    (1'b1),
                
                .enable                 (enable),
                .busy                   (busy),
                
                .current_count          (),
                
                .s_issue_size           (read_request_size),
                .s_issue_valid          (read_request_valid),
                
                .s_complete_size        (fifo_rd_size),
                .s_complete_valid       (fifo_rd_valid)
            );
    
    
    
    // ---------------------------------
    //  write capacity control
    // ---------------------------------
    
    // FIFOの空き容量分書き込みを許す(読み終わった分再チャージする)
    
    wire    [CAPACITY_WIDTH-1:0]    initial_capacity = (1 << RDATA_FIFO_PTR_WIDTH);
    wire    [CAPACITY_WIDTH-1:0]    initial_request  = {CAPACITY_WIDTH{1'b0}};
    
    wire    [CAPACITY_WIDTH-1:0]    control_len;
    wire                            control_valid;
    
    jelly_capacity_control
            #(
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .REQUEST_WIDTH          (REQUEST_SIZE_WIDTH),
                .CHARGE_WIDTH           (CAPACITY_WIDTH),
                .ISSUE_WIDTH            (CAPACITY_WIDTH),
                .REQUEST_SIZE_OFFSET    (1'b1),
                .CHARGE_SIZE_OFFSET     (1'b0),
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
                
                .s_request_size         (read_request_size),
                .s_request_valid        (read_request_valid & busy),
                
                .s_charge_size          (fifo_rd_size),
                .s_charge_valid         (fifo_rd_valid),
                
                .m_issue_size           (control_len),
                .m_issue_valid          (control_valid),
                .m_issue_ready          (1'b1)
            );
    
    assign fifo_rd_ready = 1'b1;
    
    
    // すぐに書き込まずにタイムアウトするまで待ってなるべくまとまった単位で書き込む
    wire    [LEN_WIDTH-1:0]         timeout_len;
    wire                            timeout_valid;
    wire                            timeout_ready;
    
    jelly_capacity_timeout
            #(
                .TIMER_WIDTH            (PARAM_TIMEOUT_WIDTH),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
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
                
                .max_issue_size         (param_arlen),
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
    wire    [AXI4_ADDR_WIDTH-1:0]   adroff_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    adroff_arlen;
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
                
                .m_addr                 (adroff_araddr),
                .m_user                 (adroff_arlen),
                .m_valid                (adroff_valid),
                .m_ready                (adroff_ready)
            );
    
    
    // 4kアライメント処理
    wire    [AXI4_ADDR_WIDTH-1:0]   align_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    align_arlen;
    wire                            align_arvalid;
    wire                            align_arready;
    
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
                .s_addr                 (adroff_araddr),
                .s_len                  (adroff_arlen),
                .s_user                 (1'b0),
                .s_valid                (adroff_valid),
                .s_ready                (adroff_ready),
                
                .m_first                (),
                .m_last                 (),
                .m_addr                 (align_araddr),
                .m_len                  (align_arlen),
                .m_user                 (),
                .m_valid                (align_arvalid),
                .m_ready                (align_arready)
            );
    
    
    // aw
    assign m_axi4_arid     = AXI4_ARID;
    assign m_axi4_araddr   = align_araddr;
    assign m_axi4_arlen    = align_arlen;
    assign m_axi4_arsize   = AXI4_ARSIZE;
    assign m_axi4_arburst  = AXI4_ARBURST;
    assign m_axi4_arlock   = AXI4_ARLOCK;
    assign m_axi4_arcache  = AXI4_ARCACHE;
    assign m_axi4_arprot   = AXI4_ARPROT;
    assign m_axi4_arqos    = AXI4_ARQOS;
    assign m_axi4_arregion = AXI4_ARREGION;
    assign m_axi4_arvalid  = align_arvalid;
    assign align_arready   = m_axi4_arready;
    
    
    // ---------------------------------
    //  data
    // ---------------------------------
    
    assign fifo_data  = m_axi4_rdata;
    assign fifo_valid = m_axi4_rvalid;
    
//  assign m_axi4_rready = fifo_ready;
    assign m_axi4_rready = 1'b1;    // FIFOが開いている分しかコマンド発行しない
    
    
    
    
    
    // ---------------------------------
    //  debug (for dimulation)
    // ---------------------------------
    
    always @(posedge aclk) begin
        if ( aresetn ) begin
            if ( busy & !fifo_ready ) begin
                $display("FIFO overflow");
                $stop();
            end
        end
    end
    
    integer total_m;
    always @(posedge m_clk) begin
        if ( m_reset ) begin
            total_m <= 0;
        end
        else begin
            if ( m_valid & m_ready ) begin
                total_m <= total_m + 1;
            end
        end
    end
    
    integer total_ar;
    integer total_r;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            total_ar <= 0;
            total_r  <= 0;
        end
        else begin
            if ( m_axi4_arvalid & m_axi4_arready ) begin
                total_ar <= total_ar + m_axi4_arlen + 1'b1;
            end
            
            if ( m_axi4_rvalid & m_axi4_rready ) begin
                total_r <= total_r + 1'b1;
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
    
    integer total_request;
    integer total_complete;
    always @(posedge aclk) begin
        if ( ~aresetn || (!busy & update_param) ) begin
            total_request  <= 0;
            total_complete <= 0;
        end
        else begin
            if ( read_request_valid ) begin
                total_request <= total_request + read_request_size + 1'b1;
            end
            
            if ( read_complete_valid ) begin
                total_complete <= total_complete + read_complete_size + 1'b1;
            end
        end
    end
    
endmodule


`default_nettype wire


// end of file
