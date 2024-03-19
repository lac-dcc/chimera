// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2015 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


// 将来削除予定


`timescale 1ns / 1ps
`default_nettype none


//  AXI4Stream を AXI4に Write するコア
module jelly_axi4_dma_writer
        #(
            parameter   AXI4_ID_WIDTH       = 6,
            parameter   AXI4_ADDR_WIDTH     = 32,
            parameter   AXI4_DATA_SIZE      = 2,    // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH     = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_STRB_WIDTH     = (1 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH      = 8,
            parameter   AXI4_QOS_WIDTH      = 4,
            parameter   AXI4_AWID           = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_AWSIZE         = AXI4_DATA_SIZE,
            parameter   AXI4_AWBURST        = 2'b01,
            parameter   AXI4_AWLOCK         = 1'b0,
            parameter   AXI4_AWCACHE        = 4'b0001,
            parameter   AXI4_AWPROT         = 3'b000,
            parameter   AXI4_AWQOS          = 0,
            parameter   AXI4_AWREGION       = 4'b0000,
            parameter   AXI4S_DATA_WIDTH    = AXI4_DATA_WIDTH,
            parameter   COUNT_WIDTH         = AXI4_ADDR_WIDTH - AXI4_DATA_SIZE,
            parameter   PACKET_ENABLE       = 0,
            parameter   QUEUE_COUNTER_WIDTH = 8,
            parameter   ISSUE_COUNTER_WIDTH = 8,
            parameter   AXI4_AW_REGS        = 1,
            parameter   AXI4_W_REGS         = 1,
            parameter   AXI4S_REGS          = 0
        )
        (
            input   wire                                aresetn,
            input   wire                                aclk,
            
            // control
            input   wire                                enable,
            output  wire                                busy,
            
            input   wire    [QUEUE_COUNTER_WIDTH-1:0]   queue_counter,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]       param_addr,
            input   wire    [COUNT_WIDTH-1:0]           param_count,
            input   wire    [AXI4_LEN_WIDTH-1:0]        param_maxlen,
            input   wire    [AXI4_STRB_WIDTH-1:0]       param_wstrb,
            
            // master AXI4 (write)
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
            
            // slave AXI4-Stream
            input   wire    [AXI4S_DATA_WIDTH-1:0]      s_axi4s_tdata,
            input   wire                                s_axi4s_tvalid,
            output  wire                                s_axi4s_tready
        );
    
    
    // -----------------------------
    //  insert FF
    // -----------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   axi4_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    axi4_awlen;
    wire                            axi4_awvalid;
    wire                            axi4_awready;
    wire    [AXI4_DATA_WIDTH-1:0]   axi4_wdata;
    wire                            axi4_wlast;
    wire                            axi4_wvalid;
    wire                            axi4_wready;
    
    wire    [AXI4S_DATA_WIDTH-1:0]  axi4s_tdata;
    wire                            axi4s_tvalid;
    wire                            axi4s_tready;
    
    // AXI4 aw
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (AXI4_ADDR_WIDTH+AXI4_LEN_WIDTH),
                .SLAVE_REGS         (AXI4_AW_REGS),
                .MASTER_REGS        (AXI4_AW_REGS)
            )
        i_pipeline_insert_ff_aw
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .s_data             ({axi4_awaddr, axi4_awlen}),
                .s_valid            (axi4_awvalid),
                .s_ready            (axi4_awready),
                
                .m_data             ({m_axi4_awaddr, m_axi4_awlen}),
                .m_valid            (m_axi4_awvalid),
                .m_ready            (m_axi4_awready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    assign m_axi4_awid     = AXI4_AWID;
    assign m_axi4_awsize   = AXI4_AWSIZE;
    assign m_axi4_awburst  = AXI4_AWBURST;
    assign m_axi4_awlock   = AXI4_AWLOCK;
    assign m_axi4_awcache  = AXI4_AWCACHE;
    assign m_axi4_awprot   = AXI4_AWPROT;
    assign m_axi4_awqos    = AXI4_AWQOS;
    assign m_axi4_awregion = AXI4_AWREGION;
    
    
    // AXI4 w
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (AXI4_DATA_WIDTH+1),
                .SLAVE_REGS         (AXI4_W_REGS),
                .MASTER_REGS        (AXI4_W_REGS)
            )
        i_pipeline_insert_ff_w
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .s_data             ({axi4_wdata, axi4_wlast}),
                .s_valid            (axi4_wvalid),
                .s_ready            (axi4_wready),
                
                .m_data             ({m_axi4_wdata, m_axi4_wlast}),
                .m_valid            (m_axi4_wvalid),
                .m_ready            (m_axi4_wready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    assign m_axi4_wstrb   = param_wstrb;
    
    
    // AXI4 b
    assign m_axi4_bready  = 1'b1;
    
    
    // AXI4Stream
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (AXI4S_DATA_WIDTH),
                .SLAVE_REGS         (AXI4S_REGS && !PACKET_ENABLE),
                .MASTER_REGS        (AXI4S_REGS && !PACKET_ENABLE)
            )
        i_pipeline_insert_ff_t
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .s_data             (s_axi4s_tdata),
                .s_valid            (s_axi4s_tvalid),
                .s_ready            (s_axi4s_tready),
                
                .m_data             (axi4s_tdata),
                .m_valid            (axi4s_tvalid),
                .m_ready            (axi4s_tready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    // -----------------------------
    //  Packet
    // -----------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   axi4_ctl_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    axi4_ctl_awlen;
    wire                            axi4_ctl_awvalid;
    wire                            axi4_ctl_awready;
    
    
    reg     [ISSUE_COUNTER_WIDTH-1:0]   reg_issue_counter, next_issue_counter;
    always @* begin
        next_issue_counter = reg_issue_counter;
        
        if ( axi4_awvalid && axi4_awready ) begin
            next_issue_counter = next_issue_counter + axi4_awlen + 1'b1;
        end
        
        if ( axi4_wvalid && axi4_wready ) begin
            next_issue_counter = next_issue_counter - 1'b1;
        end
    end
    
    reg                                 reg_packet_awready;
    reg                                 reg_packet_wready;
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            reg_issue_counter  <= {ISSUE_COUNTER_WIDTH{1'b0}};
            reg_packet_awready <= 1'b0;
            reg_packet_wready  <= 1'b0;
        end
        else begin
            // count
            reg_issue_counter  <= next_issue_counter;
            
            // ready
            reg_packet_awready <= 1'b0;
            reg_packet_wready  <= (next_issue_counter > 0);
            if ( !reg_packet_awready && axi4_ctl_awvalid ) begin
                if ( queue_counter > reg_issue_counter + axi4_ctl_awlen ) begin 
                    reg_packet_awready <= 1'b1;
                    reg_packet_wready  <= 1'b1;
                end
            end
        end
    end
    
    
    
    // -----------------------------
    //  Control
    // -----------------------------
    
    wire                            cmd_busy;
    
    wire    [AXI4_LEN_WIDTH-1:0]    cmd_len;
    wire                            cmd_valid;
    wire                            cmd_ready;
    
    wire    [AXI4_LEN_WIDTH-1:0]    cmd_buf_len;
    wire                            cmd_buf_valid;
    wire                            cmd_buf_ready;
    
    jelly_axi4_dma_addr
            #(
                .AXI4_ID_WIDTH      (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH    (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE     (AXI4_DATA_SIZE),
                .AXI4_LEN_WIDTH     (AXI4_LEN_WIDTH),
                .COUNT_WIDTH        (COUNT_WIDTH)
            )
        i_axi4_dma_addr
            (
                .aresetn            (aresetn),
                .aclk               (aclk),
                
                .enable             (enable),
                .busy               (cmd_busy),
                
                .param_addr         (param_addr),
                .param_count        (param_count),
                .param_maxlen       (param_maxlen),
                
                .m_cmd_len          (cmd_buf_len),
                .m_cmd_valid        (cmd_buf_valid),
                .m_cmd_ready        (cmd_buf_ready),
                
                .m_axi4_addr        (axi4_ctl_awaddr),
                .m_axi4_len         (axi4_ctl_awlen),
                .m_axi4_valid       (axi4_ctl_awvalid),
                .m_axi4_ready       (axi4_ctl_awready)
            );
    
    assign axi4_awaddr      = axi4_ctl_awaddr;
    assign axi4_awlen       = axi4_ctl_awlen;
    assign axi4_awvalid     = axi4_ctl_awvalid & (reg_packet_awready || !PACKET_ENABLE);
    assign axi4_ctl_awready = axi4_awready     & (reg_packet_awready || !PACKET_ENABLE);
    
    
    // commnad buffering
    jelly_pipeline_insert_ff
            #(
                .DATA_WIDTH         (AXI4_LEN_WIDTH),
                .SLAVE_REGS         (1),
                .MASTER_REGS        (0)
            )
        i_pipeline_insert_ff
            (
                .reset              (~aresetn),
                .clk                (aclk),
                .cke                (1'b1),
                
                .s_data             (cmd_buf_len),
                .s_valid            (cmd_buf_valid),
                .s_ready            (cmd_buf_ready),
                
                .m_data             (cmd_len),
                .m_valid            (cmd_valid),
                .m_ready            (cmd_ready),
                
                .buffered           (),
                .s_ready_next       ()
            );
    
    
    reg                             reg_wbusy,  next_wbusy;
    reg     [AXI4_LEN_WIDTH-1:0]    reg_wcount, next_wcount;
    
    always @* begin
        next_wbusy  = reg_wbusy;
        next_wcount = reg_wcount;
        
        if ( cmd_valid && cmd_ready ) begin
            next_wbusy  = 1'b1;
            next_wcount = cmd_len;
        end
        
        if ( axi4_wvalid && axi4_wready ) begin
            next_wcount = next_wcount - 1'b1;
        end
        
        if ( axi4_wvalid && axi4_wready && axi4_wlast ) begin
            next_wbusy = 1'b0;
        end
    end
    
    always @(posedge aclk) begin
        if ( !aresetn ) begin
            reg_wbusy  <= 1'b0;
            reg_wcount <= {AXI4_LEN_WIDTH{1'bx}};
        end
        else begin
            reg_wbusy  <= next_wbusy;
            reg_wcount <= next_wcount;
        end
    end
    
    assign cmd_ready      = !reg_wbusy; // || (axi4_wvalid && axi4_wlast && axi4_wready);
    
    assign axi4_wdata     = axi4s_tdata;
    assign axi4_wlast     = (reg_wbusy && reg_wcount == 0) || (!reg_wbusy && cmd_len == 0);
    assign axi4_wvalid    = (reg_wbusy || cmd_valid) && axi4s_tvalid & (reg_packet_wready || !PACKET_ENABLE);
    assign axi4s_tready   = (reg_wbusy || cmd_valid) && axi4_wready  & (reg_packet_wready || !PACKET_ENABLE);
    
    assign busy           = cmd_busy || reg_wbusy || cmd_buf_valid || cmd_valid;
    
endmodule


`default_nettype wire


// end of file
