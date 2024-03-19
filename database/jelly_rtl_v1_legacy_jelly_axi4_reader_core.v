// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4 から Read するコア
module jelly_axi4_reader_core
        #(
            parameter   S_LEN_WIDTH            = 24,
            
            parameter   AXI4_ID_WIDTH          = 6,
            parameter   AXI4_ADDR_WIDTH        = 32,
            parameter   AXI4_DATA_SIZE         = 2, // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH        = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH         = 8,
            parameter   AXI4_QOS_WIDTH         = 4,
            parameter   AXI4_ARID              = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE            = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST           = 2'b01,
            parameter   AXI4_ARLOCK            = 1'b0,
            parameter   AXI4_ARCACHE           = 4'b0001,
            parameter   AXI4_ARPROT            = 3'b000,
            parameter   AXI4_ARQOS             = 0,
            parameter   AXI4_ARREGION          = 4'b0000,
            
            parameter   AXI4_ALIGN             = 12,
            
            parameter   AXI4S_DATA_WIDTH       = AXI4_DATA_WIDTH,
            
            parameter   CAPACITY_ASYNC         = 1,
            parameter   CAPACITY_COUNTER_WIDTH = 10,
            parameter   CAPACITY_INIT_COUNTER  = 256,
            
            parameter   LAST_FIFO_PTR_WIDTH    = 6,
            parameter   LAST_FIFO_RAM_TYPE     = "distributed",
            
            parameter   BUSY_COUNTER_WIDTH     = 10,
            
            parameter   BYPASS_RANGE           = 0,
            parameter   BYPASS_LEN             = 0,
            parameter   BYPASS_ALIGN           = 0,
            parameter   BYPASS_CAPACITY        = 0,
            parameter   BYPASS_LAST            = 0
        )
        (
            input   wire                                    aresetn,
            input   wire                                    aclk,
            input   wire                                    aclken,
            
            output  wire                                    busy,
            
            input   wire    [AXI4_ADDR_WIDTH-1:0]           param_range_start,
            input   wire    [AXI4_ADDR_WIDTH-1:0]           param_range_end,
            input   wire    [AXI4_LEN_WIDTH-1:0]            param_maxlen,
            
            input   wire                                    capacity_reset,
            input   wire                                    capacity_clk,
            input   wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_add,
            input   wire                                    capacity_valid,
            
            input   wire    [AXI4_ADDR_WIDTH-1:0]           s_araddr,
            input   wire    [S_LEN_WIDTH-1:0]               s_arlen,
            input   wire                                    s_arvalid,
            output  wire                                    s_arready,
            
            output  wire    [AXI4_ID_WIDTH-1:0]             m_axi4_arid,
            output  wire    [AXI4_ADDR_WIDTH-1:0]           m_axi4_araddr,
            output  wire    [AXI4_LEN_WIDTH-1:0]            m_axi4_arlen,
            output  wire    [2:0]                           m_axi4_arsize,
            output  wire    [1:0]                           m_axi4_arburst,
            output  wire    [0:0]                           m_axi4_arlock,
            output  wire    [3:0]                           m_axi4_arcache,
            output  wire    [2:0]                           m_axi4_arprot,
            output  wire    [AXI4_QOS_WIDTH-1:0]            m_axi4_arqos,
            output  wire    [3:0]                           m_axi4_arregion,
            output  wire                                    m_axi4_arvalid,
            input   wire                                    m_axi4_arready,
            input   wire    [AXI4_ID_WIDTH-1:0]             m_axi4_rid,
            input   wire    [AXI4_DATA_WIDTH-1:0]           m_axi4_rdata,
            input   wire    [1:0]                           m_axi4_rresp,
            input   wire                                    m_axi4_rlast,
            input   wire                                    m_axi4_rvalid,
            output  wire                                    m_axi4_rready,
            
            output  wire                                    m_axi4s_tlast,
            output  wire    [AXI4S_DATA_WIDTH-1:0]          m_axi4s_tdata,
            output  wire                                    m_axi4s_tvalid,
            input   wire                                    m_axi4s_tready
        );
    
    
    // ---------------------------------
    //  address command split
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]           core_araddr;
    wire    [S_LEN_WIDTH-1:0]               core_arlen;
    wire                                    core_arvalid;
    wire                                    core_arready;
    
    wire    [AXI4_ADDR_WIDTH-1:0]           last_araddr;
    wire    [S_LEN_WIDTH-1:0]               last_arlen;
    wire                                    last_arvalid;
    wire                                    last_arready;
    
    wire                                    spliter_busy;
    
    generate
    if ( BYPASS_LAST ) begin : blk_bypass_last
        assign  core_araddr  = s_araddr;
        assign  core_arlen   = s_arlen;
        assign  core_arvalid = s_arvalid;
        assign  s_arready    = core_arready;
        
        assign  spliter_busy = 1'b0;
    end
    else begin : blk_split_cmd
        jelly_data_spliter
                #(
                    .NUM            (2),
                    .DATA_WIDTH     (AXI4_ADDR_WIDTH+S_LEN_WIDTH),
                    .S_REGS         (0),
                    .M_REGS         (0)
                )
            i_data_spliter
                (
                    .reset          (aresetn),
                    .clk            (aclk),
                    .cke            (aclken),
                    
                    .spliter_busy   (spliter_busy),
                    
                    .s_data         ({{s_araddr, s_arlen}, {s_araddr, s_arlen}}),
                    .s_valid        (s_arvalid),
                    .s_ready        (s_arready),
                    
                    .m_data         ({{last_araddr, last_arlen}, {core_araddr, core_arlen}}),
                    .m_valid        ({last_arvalid,              core_arvalid}),
                    .m_ready        ({last_arready,              core_arready})
                );
    end
    endgenerate
    
    
    // ---------------------------------
    //  address command
    // ---------------------------------
    
    wire    [AXI4_ADDR_WIDTH-1:0]   range_araddr;
    wire    [S_LEN_WIDTH-1:0]       range_arlen;
    wire                            range_arvalid;
    wire                            range_arready;
    
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
                .s_addr                 (core_araddr),
                .s_len                  (core_arlen),
                .s_valid                (core_arvalid),
                .s_ready                (core_arready),
                
                .m_user                 (),
                .m_addr                 (range_araddr),
                .m_len                  (range_arlen),
                .m_valid                (range_arvalid),
                .m_ready                (range_arready)
            );
    
    // len
    wire    [AXI4_ADDR_WIDTH-1:0]   len_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    len_arlen;
    wire                            len_arvalid;
    wire                            len_arready;
    
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
                .s_addr                 (range_araddr),
                .s_len                  (range_arlen),
                .s_valid                (range_arvalid),
                .s_ready                (range_arready),
                
                .m_user                 (),
                .m_addr                 (len_araddr),
                .m_len                  (len_arlen),
                .m_valid                (len_arvalid),
                .m_ready                (len_arready)
            );
    
    
    // align
    wire    [AXI4_ADDR_WIDTH-1:0]   align_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    align_arlen;
    wire                            align_arvalid;
    wire                            align_arready;
    
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
                .s_addr                 (len_araddr),
                .s_len                  (len_arlen),
                .s_valid                (len_arvalid),
                .s_ready                (len_arready),
                
                .m_user                 (),
                .m_addr                 (align_araddr),
                .m_len                  (align_arlen),
                .m_valid                (align_arvalid),
                .m_ready                (align_arready)
            );
    
    
    // capacity
    wire    [AXI4_ADDR_WIDTH-1:0]   capacity_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    capacity_arlen;
    wire                            capacity_arvalid;
    wire                            capacity_arready;
    
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
                .s_addr                 (align_araddr),
                .s_len                  (align_arlen),
                .s_valid                (align_arvalid),
                .s_ready                (align_arready),
                
                .m_user                 (),
                .m_addr                 (capacity_araddr),
                .m_len                  (capacity_arlen),
                .m_valid                (capacity_arvalid),
                .m_ready                (capacity_arready)
            );
    
    assign  m_axi4_arid      = AXI4_ID_WIDTH;
    assign  m_axi4_araddr    = capacity_araddr;
    assign  m_axi4_arlen     = capacity_arlen;
    assign  m_axi4_arsize    = AXI4_ARSIZE;
    assign  m_axi4_arburst   = AXI4_ARBURST;
    assign  m_axi4_arlock    = AXI4_ARLOCK;
    assign  m_axi4_arcache   = AXI4_ARCACHE;
    assign  m_axi4_arprot    = AXI4_ARPROT;
    assign  m_axi4_arqos     = AXI4_ARQOS;
    assign  m_axi4_arregion  = AXI4_ARREGION;
    assign  m_axi4_arvalid   = capacity_arvalid;
    
    assign  capacity_arready = m_axi4_arready;
    
    
    
    // ---------------------------------
    //  data
    // ---------------------------------
    
    // tlast付与
    jelly_axi_data_last
            #(
                .BYPASS                     (BYPASS_LAST),
                .USER_WIDTH                 (0),
                .DATA_WIDTH                 (AXI4_DATA_WIDTH),
                .LEN_WIDTH                  (S_LEN_WIDTH),
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
                .s_cmd_len                  (last_arlen),
                .s_cmd_valid                (last_arvalid),
                .s_cmd_ready                (last_arready),
                
                .s_user                     (1'b0),
                .s_last                     (m_axi4_rlast),
                .s_data                     (m_axi4_rdata),
                .s_valid                    (m_axi4_rvalid),
                .s_ready                    (m_axi4_rready),
                
                .m_user                     (),
                .m_last                     (m_axi4s_tlast),
                .m_data                     (m_axi4s_tdata),
                .m_valid                    (m_axi4s_tvalid),
                .m_ready                    (m_axi4s_tready)
            );
    
    
    
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
            reg_busy_counter <= reg_busy_counter + (m_axi4_arvalid & m_axi4_arready) - (m_axi4_rlast & m_axi4_rvalid & m_axi4_rready);
            
            if ( s_arvalid & s_arready ) begin
                reg_busy <= 1'b1;
            end
            else begin
                if (       !spliter_busy  && !core_arvalid 
                        && !range_busy    && !range_arvalid
                        && !len_busy      && !len_arvalid
                        && !align_busy    && !align_arvalid
                        && !capacity_busy && !capacity_arvalid
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
