// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4 へ Write するコア
module jelly_axi4_writer_core
        #(
            parameter   S_LEN_WIDTH            = 24,
            
            parameter   AXI4_ID_WIDTH          = 6,
            parameter   AXI4_ADDR_WIDTH        = 32,
            parameter   AXI4_DATA_SIZE         = 2, // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH        = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH        = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH         = 8,
            parameter   AXI4_QOS_WIDTH         = 4,
            parameter   AXI4_AWID              = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE            = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST           = 2'b01,
            parameter   AXI4_AWLOCK            = 1'b0,
            parameter   AXI4_AWCACHE           = 4'b0001,
            parameter   AXI4_AWPROT            = 3'b000,
            parameter   AXI4_AWQOS             = 0,
            parameter   AXI4_AWREGION          = 4'b0000,
            
            parameter   AXI4_ALIGN             = 12,
            
            parameter   AXI4S_STRB_WIDTH       = AXI4_STRB_WIDTH,
            parameter   AXI4S_DATA_WIDTH       = AXI4_DATA_WIDTH,
            
            parameter   CAPACITY_ASYNC         = 1,
            parameter   CAPACITY_COUNTER_WIDTH = 10,
            parameter   CAPACITY_INIT_COUNTER  = 0,
            
            parameter   LAST_FIFO_PTR_WIDTH    = 6,
            parameter   LAST_FIFO_RAM_TYPE     = "distributed",
            
            parameter   BUSY_COUNTER_WIDTH     = 10,
            
            parameter   BYPASS_RANGE           = 0,
            parameter   BYPASS_LEN             = 0,
            parameter   BYPASS_ALIGN           = 0,
            parameter   BYPASS_CAPACITY        = 0
        )
        (
            input   wire                                    aresetn,
            input   wire                                    aclk,
            input   wire                                    aclken,
            
            output  wire                                    busy,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]           param_range_start,
            input   wire    [AXI4_ADDR_WIDTH-1:0]           param_range_end,
            input   wire    [AXI4_LEN_WIDTH-1:0]            param_maxlen,
            
            // capacity charge port
            input   wire                                    capacity_reset,
            input   wire                                    capacity_clk,
            input   wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_add,
            input   wire                                    capacity_valid,
            
            // command
            input   wire    [AXI4_ADDR_WIDTH-1:0]           s_awaddr,
            input   wire    [S_LEN_WIDTH-1:0]               s_awlen,
            input   wire                                    s_awvalid,
            output  wire                                    s_awready,
            
            // data
            input   wire    [AXI4S_STRB_WIDTH-1:0]          s_axi4s_tstrb,
            input   wire    [AXI4S_DATA_WIDTH-1:0]          s_axi4s_tdata,
            input   wire                                    s_axi4s_tvalid,
            output  wire                                    s_axi4s_tready,
            
            // AXI4
            output  wire    [AXI4_ID_WIDTH-1:0]             m_axi4_awid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]           m_axi4_awaddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]            m_axi4_awlen,
            output  wire    [2:0]                           m_axi4_awsize,
            output  wire    [1:0]                           m_axi4_awburst,
            output  wire    [0:0]                           m_axi4_awlock,
            output  wire    [3:0]                           m_axi4_awcache,
            output  wire    [2:0]                           m_axi4_awprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]            m_axi4_awqos,
            output  wire    [3:0]                           m_axi4_awregion,
            output  wire                                    m_axi4_awvalid,
            input   wire                                    m_axi4_awready,
            output  wire    [AXI4_DATA_WIDTH-1:0]           m_axi4_wdata,
            output  wire    [AXI4_STRB_WIDTH-1:0]           m_axi4_wstrb,
            output  wire                                    m_axi4_wlast,
            output  wire                                    m_axi4_wvalid,
            input   wire                                    m_axi4_wready,
            input   wire    [AXI4_ID_WIDTH-1:0]             m_axi4_bid,
            input   wire    [1:0]                           m_axi4_bresp,
            input   wire                                    m_axi4_bvalid,
            output  wire                                    m_axi4_bready
        );
    
    
    // ---------------------------------
    //  address command
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   range_awaddr;
    wire    [S_LEN_WIDTH-1:0]       range_awlen;
    wire                            range_awvalid;
    wire                            range_awready;
    
    wire                            range_busy;
    
    jelly_axi_addr_range
            #(
                .BYPASS                 (BYPASS_RANGE),
                .USER_WIDTH             (0),
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .DATA_SIZE              (AXI4_DATA_SIZE),
                .LEN_WIDTH              (S_LEN_WIDTH),
                .S_SLAVE_REGS           (1),
                .S_MASTER_REGS          (1),
                .M_SLAVE_REGS           (0),
                .M_MASTER_REGS          (1)
            )
        i_axi_addr_range
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (range_busy),
                
                .param_range_start      (param_range_start),
                .param_range_end        (param_range_end),
                
                .s_user                 (1'b0),
                .s_addr                 (s_awaddr),
                .s_len                  (s_awlen),
                .s_valid                (s_awvalid),
                .s_ready                (s_awready),
                
                .m_user                 (),
                .m_addr                 (range_awaddr),
                .m_len                  (range_awlen),
                .m_valid                (range_awvalid),
                .m_ready                (range_awready)
            );
    
    // len
    wire    [AXI4_ADDR_WIDTH-1:0]   len_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    len_awlen;
    wire                            len_awvalid;
    wire                            len_awready;
    
    wire                            len_busy;
    
    jelly_axi_addr_len
            #(
                .BYPASS                 (BYPASS_LEN),
                .USER_WIDTH             (0),
                .DATA_SIZE              (AXI4_DATA_SIZE),
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .S_LEN_WIDTH            (S_LEN_WIDTH),
                .M_LEN_WIDTH            (AXI4_LEN_WIDTH),
                .S_SLAVE_REGS           (0),
                .S_MASTER_REGS          (0),
                .M_SLAVE_REGS           (0),
                .M_MASTER_REGS          (1)
            )
        i_axi_addr_len
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (len_busy),
                
                .param_len_max          (param_maxlen),
                
                .s_user                 (1'b0),
                .s_addr                 (range_awaddr),
                .s_len                  (range_awlen),
                .s_valid                (range_awvalid),
                .s_ready                (range_awready),
                
                .m_user                 (),
                .m_addr                 (len_awaddr),
                .m_len                  (len_awlen),
                .m_valid                (len_awvalid),
                .m_ready                (len_awready)
            );
    
    
    // align
    wire    [AXI4_ADDR_WIDTH-1:0]   align_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    align_awlen;
    wire                            align_awvalid;
    wire                            align_awready;
    
    wire                            align_busy;
    
    jelly_axi_addr_align
            #(
                .BYPASS                 (BYPASS_ALIGN),
                .USER_WIDTH             (0),
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .DATA_SIZE              (AXI4_DATA_SIZE),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                .ALIGN                  (AXI4_ALIGN),
                .S_SLAVE_REGS           (0),
                .S_MASTER_REGS          (0),
                .M_SLAVE_REGS           (0),
                .M_MASTER_REGS          (1)
            )
        i_axi_addr_align
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (align_busy),
                
                .s_user                 (1'b0),
                .s_addr                 (len_awaddr),
                .s_len                  (len_awlen),
                .s_valid                (len_awvalid),
                .s_ready                (len_awready),
                
                .m_user                 (),
                .m_addr                 (align_awaddr),
                .m_len                  (align_awlen),
                .m_valid                (align_awvalid),
                .m_ready                (align_awready)
            );
    
    
    // capacity
    wire    [AXI4_ADDR_WIDTH-1:0]   capacity_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    capacity_awlen;
    wire                            capacity_awvalid;
    wire                            capacity_awready;
    
    wire                            capacity_busy;
    
    jelly_axi_addr_capacity
            #(
                .BYPASS                 (BYPASS_CAPACITY),
                .USER_WIDTH             (0),
                .DATA_SIZE              (AXI4_DATA_SIZE),
                .ADDR_WIDTH             (AXI4_ADDR_WIDTH),
                .LEN_WIDTH              (AXI4_LEN_WIDTH),
                
                .CAPACITY_ASYNC         (CAPACITY_ASYNC),
                .CAPACITY_COUNTER_WIDTH (CAPACITY_COUNTER_WIDTH),
                .CAPACITY_INIT_COUNTER  (CAPACITY_INIT_COUNTER),
                
                .S_SLAVE_REGS           (1),
                .S_MASTER_REGS          (1),
                .M_SLAVE_REGS           (1),
                .M_MASTER_REGS          (1)
            )
        i_axi_addr_capacity
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (capacity_busy),
                
                .capacity_reset         (capacity_reset),
                .capacity_clk           (capacity_clk),
                .capacity_add           (capacity_add),
                .capacity_valid         (capacity_valid),
                
                .s_user                 (1'b0),
                .s_addr                 (align_awaddr),
                .s_len                  (align_awlen),
                .s_valid                (align_awvalid),
                .s_ready                (align_awready),
                
                .m_user                 (),
                .m_addr                 (capacity_awaddr),
                .m_len                  (capacity_awlen),
                .m_valid                (capacity_awvalid),
                .m_ready                (capacity_awready)
            );
    
    
    wire    [AXI4_ADDR_WIDTH-1:0]           core_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]            core_awlen;
    wire                                    core_awvalid;
    wire                                    core_awready;
    
    assign core_awaddr      = capacity_awaddr;
    assign core_awlen       = capacity_awlen;
    assign core_awvalid     = capacity_awvalid;
    assign capacity_awready = core_awready;
    
    
    
    // ---------------------------------
    //  address command split
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]           last_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]            last_awlen;
    wire                                    last_awvalid;
    wire                                    last_awready;
    
    jelly_data_spliter
            #(
                .NUM            (2),
                .DATA_WIDTH     (AXI4_ADDR_WIDTH+AXI4_LEN_WIDTH),
                .S_REGS         (0),
                .M_REGS         (0)
            )
        i_data_spliter
            (
                .reset          (aresetn),
                .clk            (aclk),
                .cke            (aclken),
                
                .s_data         ({{core_awaddr, core_awlen}, {core_awaddr, core_awlen}}),
                .s_valid        (core_awvalid),
                .s_ready        (core_awready),
                
                .m_data         ({{last_awaddr, last_awlen}, {m_axi4_awaddr, m_axi4_awlen}}),
                .m_valid        ({last_awvalid,              m_axi4_awvalid}),
                .m_ready        ({last_awready,              m_axi4_awready})
            );
    
    
    assign  m_axi4_awid      = AXI4_ID_WIDTH;
    assign  m_axi4_awsize    = AXI4_AWSIZE;
    assign  m_axi4_awburst   = AXI4_AWBURST;
    assign  m_axi4_awlock    = AXI4_AWLOCK;
    assign  m_axi4_awcache   = AXI4_AWCACHE;
    assign  m_axi4_awprot    = AXI4_AWPROT;
    assign  m_axi4_awqos     = AXI4_AWQOS;
    assign  m_axi4_awregion  = AXI4_AWREGION;
    
    
    
    // ---------------------------------
    //  data
    // ---------------------------------
    
    // wlast付与
    jelly_axi_data_last
            #(
                .BYPASS                     (0),
                .USER_WIDTH                 (AXI4_STRB_WIDTH),
                .DATA_WIDTH                 (AXI4_DATA_WIDTH),
                .LEN_WIDTH                  (AXI4_LEN_WIDTH),
                .FIFO_ASYNC                 (0),
                .FIFO_PTR_WIDTH             (LAST_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE              (LAST_FIFO_RAM_TYPE),
                .S_SLAVE_REGS               (0),
                .S_MASTER_REGS              (0),
                .M_SLAVE_REGS               (0),
                .M_MASTER_REGS              (1)
            )
        i_axi_data_last
            (
                .aresetn                    (aresetn),
                .aclk                       (aclk),
                .aclken                     (aclken),
                
                .s_cmd_aresetn              (aresetn),
                .s_cmd_aclk                 (aclk),
                .s_cmd_aclken               (aclken),
                .s_cmd_len                  (last_awlen),
                .s_cmd_valid                (last_awvalid),
                .s_cmd_ready                (last_awready),
                
                .s_user                     (s_axi4s_tstrb),
                .s_last                     (1'b1),
                .s_data                     (s_axi4s_tdata),
                .s_valid                    (s_axi4s_tvalid),
                .s_ready                    (s_axi4s_tready),
                
                .m_user                     (m_axi4_wstrb),
                .m_last                     (m_axi4_wlast),
                .m_data                     (m_axi4_wdata),
                .m_valid                    (m_axi4_wvalid),
                .m_ready                    (m_axi4_wready)
            );
    
    assign m_axi4_bready = 1'b1;
    
    
    // ---------------------------------
    //  busy カウンタ
    // ---------------------------------
    
    reg                                 reg_busy;
    
    reg     [BUSY_COUNTER_WIDTH-1:0]    reg_busy_counter;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_busy         <= 1'b0;
            reg_busy_counter <= {BUSY_COUNTER_WIDTH{1'b0}};
        end
        else if( aclken ) begin
            reg_busy_counter <= reg_busy_counter + (m_axi4_awvalid & m_axi4_awready) - (m_axi4_bvalid & m_axi4_bready);
            
            if ( s_awvalid & s_awready ) begin
                reg_busy <= 1'b1;
            end
            else begin
                if (    !range_busy    && !range_awvalid
                     && !len_busy      && !len_awvalid
                     && !align_busy    && !align_awvalid
                     && !capacity_busy && !capacity_awvalid
                     && (reg_busy_counter == 0) ) begin
                    reg_busy <= 1'b0;
                end
            end
        end
    end
    
    assign busy = reg_busy;
    
endmodule


`default_nettype wire


// end of file
