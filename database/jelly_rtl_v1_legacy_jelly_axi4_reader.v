// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License

// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------



`timescale 1ns / 1ps
`default_nettype none



//  AXI4 から Read
module jelly_axi4_reader
        #(
            parameter   S_LEN_WIDTH              = 24,
            
            parameter   AXI4_ID_WIDTH            = 6,
            parameter   AXI4_ADDR_WIDTH          = 32,
            parameter   AXI4_DATA_SIZE           = 2,   // 0:8bit, 1:16bit, 2:32bit ...
            parameter   AXI4_DATA_WIDTH          = (8 << AXI4_DATA_SIZE),
            parameter   AXI4_LEN_WIDTH           = 8,
            parameter   AXI4_QOS_WIDTH           = 4,
            parameter   AXI4_ARID                = {AXI4_ID_WIDTH{1'b0}},
            parameter   AXI4_ARSIZE              = AXI4_DATA_SIZE,
            parameter   AXI4_ARBURST             = 2'b01,
            parameter   AXI4_ARLOCK              = 1'b0,
            parameter   AXI4_ARCACHE             = 4'b0001,
            parameter   AXI4_ARPROT              = 3'b000,
            parameter   AXI4_ARQOS               = 0,
            parameter   AXI4_ARREGION            = 4'b0000,
            
            parameter   AXI4_ALIGN               = 12,
            
            parameter   AXI4S_ASYNC              = 1,
            parameter   AXI4S_DATA_WIDTH         = AXI4_DATA_WIDTH,
            parameter   AXI4S_FIFO_PTR_WIDTH     = 9,
            parameter   AXI4S_FIFO_RAM_TYPE      = "block",
            
            parameter   LAST_FIFO_PTR_WIDTH      = 6,
            parameter   LAST_FIFO_RAM_TYPE       = "distributed",

            parameter   BUSY_COUNTER_WIDTH       = 10,
            
            parameter   BYPASS_RANGE             = 0,
            parameter   BYPASS_LEN               = 0,
            parameter   BYPASS_ALIGN             = 0,
            parameter   BYPASS_CAPACITY          = 0,
            parameter   BYPASS_LAST              = 0
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            output  wire                            busy,
            
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_range_start,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_range_end,
            input   wire    [AXI4_LEN_WIDTH-1:0]    param_maxlen,
            
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_araddr,
            input   wire    [S_LEN_WIDTH-1:0]       s_arlen,
            input   wire                            s_arvalid,
            output  wire                            s_arready,
            
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
            output  wire                            m_axi4_rready,
            
            input   wire                            m_axi4s_aresetn,
            input   wire                            m_axi4s_aclk,
            input   wire                            m_axi4s_aclken,
            output  wire                            m_axi4s_tlast,
            output  wire    [AXI4S_DATA_WIDTH-1:0]  m_axi4s_tdata,
            output  wire                            m_axi4s_tvalid,
            input   wire                            m_axi4s_tready
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
                    
                    .busy           (spliter_busy),
                    
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
    //  Core
    // ---------------------------------
    
    localparam  CAPACITY_ASYNC           = AXI4S_ASYNC;
    localparam  CAPACITY_COUNTER_WIDTH   = AXI4S_FIFO_PTR_WIDTH + 1;
    localparam  CAPACITY_INIT_COUNTER    = (1 << AXI4S_FIFO_PTR_WIDTH);
    
    wire                                    capacity_reset = ~m_axi4s_aresetn;
    wire                                    capacity_clk   = m_axi4s_aclk;
    wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_add   = 1;
    wire                                    capacity_valid = (m_axi4s_aclken & m_axi4s_tvalid & m_axi4s_tready);
    
    wire                                    axi4s_tlast;
    wire    [AXI4S_DATA_WIDTH-1:0]          axi4s_tdata;
    wire                                    axi4s_tvalid;
    wire                                    axi4s_tready;
    
    wire                                    core_busy;
    
    jelly_axi4_reader_core
        #(
                .S_LEN_WIDTH                (S_LEN_WIDTH),
                
                .AXI4_ID_WIDTH              (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH            (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE             (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH            (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH             (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH             (AXI4_QOS_WIDTH),
                .AXI4_ARID                  (AXI4_ARID),
                .AXI4_ARSIZE                (AXI4_ARSIZE),
                .AXI4_ARBURST               (AXI4_ARBURST),
                .AXI4_ARLOCK                (AXI4_ARLOCK),
                .AXI4_ARCACHE               (AXI4_ARCACHE),
                .AXI4_ARPROT                (AXI4_ARPROT),
                .AXI4_ARQOS                 (AXI4_ARQOS),
                .AXI4_ARREGION              (AXI4_ARREGION),
                
                .AXI4_ALIGN                 (AXI4_ALIGN),
                
                .AXI4S_DATA_WIDTH           (AXI4S_DATA_WIDTH),
                
                .CAPACITY_ASYNC             (CAPACITY_ASYNC),
                .CAPACITY_COUNTER_WIDTH     (CAPACITY_COUNTER_WIDTH),
                .CAPACITY_INIT_COUNTER      (CAPACITY_INIT_COUNTER),
                
                .LAST_FIFO_PTR_WIDTH        (0),
                
                .BUSY_COUNTER_WIDTH         (BUSY_COUNTER_WIDTH),
                
                .BYPASS_RANGE               (BYPASS_RANGE),
                .BYPASS_LEN                 (BYPASS_LEN),
                .BYPASS_ALIGN               (BYPASS_ALIGN),
                .BYPASS_CAPACITY            (BYPASS_CAPACITY),
                .BYPASS_LAST                (1)
            )
        i_axi4_reader_core
            (
                .aresetn                    (aresetn),
                .aclk                       (aclk),
                .aclken                     (aclken),
                
                .busy                       (core_busy),
                
                .param_range_start          (param_range_start),
                .param_range_end            (param_range_end),
                .param_maxlen               (param_maxlen),
                
                .capacity_reset             (capacity_reset),
                .capacity_clk               (capacity_clk),
                .capacity_add               (capacity_add),
                .capacity_valid             (capacity_valid),
                
                .s_araddr                   (core_araddr),
                .s_arlen                    (core_arlen),
                .s_arvalid                  (core_arvalid),
                .s_arready                  (core_arready),
                
                .m_axi4_arid                (m_axi4_arid),
                .m_axi4_araddr              (m_axi4_araddr),
                .m_axi4_arlen               (m_axi4_arlen),
                .m_axi4_arsize              (m_axi4_arsize),
                .m_axi4_arburst             (m_axi4_arburst),
                .m_axi4_arlock              (m_axi4_arlock),
                .m_axi4_arcache             (m_axi4_arcache),
                .m_axi4_arprot              (m_axi4_arprot),
                .m_axi4_arqos               (m_axi4_arqos),
                .m_axi4_arregion            (m_axi4_arregion),
                .m_axi4_arvalid             (m_axi4_arvalid),
                .m_axi4_arready             (m_axi4_arready),
                .m_axi4_rid                 (m_axi4_rid),
                .m_axi4_rdata               (m_axi4_rdata),
                .m_axi4_rresp               (m_axi4_rresp),
                .m_axi4_rlast               (m_axi4_rlast),
                .m_axi4_rvalid              (m_axi4_rvalid),
                .m_axi4_rready              (m_axi4_rready),
                
                .m_axi4s_tlast              (axi4s_tlast),
                .m_axi4s_tdata              (axi4s_tdata),
                .m_axi4s_tvalid             (axi4s_tvalid),
                .m_axi4s_tready             (axi4s_tready)
            );
    
    
    
    // ---------------------------------
    //  AXI4S FIFO  
    // ---------------------------------
    
    wire                                axi4s_fifo_tlast;
    wire    [AXI4S_DATA_WIDTH-1:0]      axi4s_fifo_tdata;
    wire                                axi4s_fifo_tvalid;
    wire                                axi4s_fifo_tready;
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC                      (AXI4S_ASYNC),
                .DATA_WIDTH                 (1+AXI4S_DATA_WIDTH),
                .PTR_WIDTH                  (AXI4S_FIFO_PTR_WIDTH),
                .DOUT_REGS                  (0),
                .RAM_TYPE                   (AXI4S_FIFO_RAM_TYPE),
                .LOW_DEALY                  (0),
                .SLAVE_REGS                 (0),
                .MASTER_REGS                (1)
            )
        i_fifo_generic_fwtf_axi4s
            (
                .s_reset                    (~aresetn),
                .s_clk                      (aclk),
                .s_data                     ({axi4s_tlast, axi4s_tdata}),
                .s_valid                    (axi4s_tvalid & aclken),
                .s_ready                    (axi4s_tready),
                .s_free_count               (),
                
                .m_reset                    (~m_axi4s_aresetn),
                .m_clk                      (m_axi4s_aclk),
                .m_data                     ({axi4s_fifo_tlast, axi4s_fifo_tdata}),
                .m_valid                    (axi4s_fifo_tvalid),
                .m_ready                    (axi4s_fifo_tready),
                .m_data_count               ()
            );
    
    // tlast付与
    jelly_axi_data_last
            #(
                .BYPASS                     (BYPASS_LAST),
                .USER_WIDTH                 (0),
                .DATA_WIDTH                 (AXI4_DATA_WIDTH),
                .LEN_WIDTH                  (S_LEN_WIDTH),
                .FIFO_ASYNC                 (AXI4S_ASYNC),
                .FIFO_PTR_WIDTH             (LAST_FIFO_PTR_WIDTH),
                .FIFO_RAM_TYPE              (LAST_FIFO_RAM_TYPE),
                .S_SLAVE_REGS               (0),
                .S_MASTER_REGS              (0),
                .M_SLAVE_REGS               (0),
                .M_MASTER_REGS              (1)
            )
        i_axi_data_last
            (
                .aresetn                    (m_axi4s_aresetn),
                .aclk                       (m_axi4s_aclk),
                .aclken                     (m_axi4s_aclken),
                
                .s_cmd_aresetn              (aresetn),
                .s_cmd_aclk                 (aclk),
                .s_cmd_aclken               (aclken),
                .s_cmd_len                  (last_arlen),
                .s_cmd_valid                (last_arvalid),
                .s_cmd_ready                (last_arready),
                
                .s_user                     (1'b0),
                .s_last                     (axi4s_fifo_tlast),
                .s_data                     (axi4s_fifo_tdata),
                .s_valid                    (axi4s_fifo_tvalid),
                .s_ready                    (axi4s_fifo_tready),
                
                .m_user                     (),
                .m_last                     (m_axi4s_tlast),
                .m_data                     (m_axi4s_tdata),
                .m_valid                    (m_axi4s_tvalid),
                .m_ready                    (m_axi4s_tready)
            );
    
    assign busy = (spliter_busy || core_busy);
    
endmodule


`default_nettype wire


// end of file
