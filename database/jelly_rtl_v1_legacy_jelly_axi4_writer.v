// ---------------------------------------------------------------------------
//  Jelly  -- The platform for real-time computing
//
//                                 Copyright (C) 2008-2017 by Ryuz
//                                 https://github.com/ryuz/jelly.git
// ---------------------------------------------------------------------------


`timescale 1ns / 1ps
`default_nettype none


// AXI4 に Write
module jelly_axi4_writer
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
            
            parameter   AXI4S_ASYNC            = 1,
            parameter   AXI4S_STRB_WIDTH       = AXI4_STRB_WIDTH,
            parameter   AXI4S_DATA_WIDTH       = AXI4_DATA_WIDTH,
            parameter   AXI4S_FIFO_PTR_WIDTH   = 9,
            parameter   AXI4S_FIFO_RAM_TYPE    = "block",
            
            parameter   LAST_FIFO_PTR_WIDTH    = 6,
            parameter   LAST_FIFO_RAM_TYPE     = "distributed",
            
            parameter   BUSY_COUNTER_WIDTH     = 10,
            
            parameter   BYPASS_RANGE           = 0,
            parameter   BYPASS_LEN             = 0,
            parameter   BYPASS_ALIGN           = 0,
            parameter   BYPASS_CAPACITY        = 0
        )
        (
            input   wire                            aresetn,
            input   wire                            aclk,
            input   wire                            aclken,
            
            output  wire                            busy,
            
            // parameter
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_range_start,
            input   wire    [AXI4_ADDR_WIDTH-1:0]   param_range_end,
            input   wire    [AXI4_LEN_WIDTH-1:0]    param_maxlen,
            
            // command
            input   wire    [AXI4_ADDR_WIDTH-1:0]   s_awaddr,
            input   wire    [S_LEN_WIDTH-1:0]       s_awlen,
            input   wire                            s_awvalid,
            output  wire                            s_awready,
            
            // data
            input   wire                            s_axi4s_aresetn,
            input   wire                            s_axi4s_aclk,
            input   wire                            s_axi4s_aclken,
            input   wire    [AXI4S_STRB_WIDTH-1:0]  s_axi4s_tstrb,
            input   wire    [AXI4S_DATA_WIDTH-1:0]  s_axi4s_tdata,
            input   wire                            s_axi4s_tvalid,
            output  wire                            s_axi4s_tready,
            
            // AXI4
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
    //  AXI4S FIFO  
    // ---------------------------------
    
    wire    [AXI4S_STRB_WIDTH-1:0]      axi4s_fifo_tstrb;
    wire    [AXI4S_DATA_WIDTH-1:0]      axi4s_fifo_tdata;
    wire                                axi4s_fifo_tvalid;
    wire                                axi4s_fifo_tready;
    
    jelly_fifo_generic_fwtf
            #(
                .ASYNC                  (AXI4S_ASYNC),
                .DATA_WIDTH             (AXI4S_STRB_WIDTH+AXI4S_DATA_WIDTH),
                .PTR_WIDTH              (AXI4S_FIFO_PTR_WIDTH),
                .DOUT_REGS              (0),
                .RAM_TYPE               (AXI4S_FIFO_RAM_TYPE),
                .LOW_DEALY              (0),
                .SLAVE_REGS             (0),
                .MASTER_REGS            (1)
            )
        i_fifo_generic_fwtf_axi4s
            (
                .s_reset                (~s_axi4s_aresetn),
                .s_clk                  (s_axi4s_aclk),
                .s_data                 ({s_axi4s_tstrb, s_axi4s_tdata}),
                .s_valid                (s_axi4s_tvalid & s_axi4s_aclken),
                .s_ready                (s_axi4s_tready),
                .s_free_count           (),
                
                .m_reset                (~aresetn),
                .m_clk                  (aclk),
                .m_data                 ({axi4s_fifo_tstrb, axi4s_fifo_tdata}),
                .m_valid                (axi4s_fifo_tvalid),
                .m_ready                (axi4s_fifo_tready & aclken),
                .m_data_count           ()
            );
    
    
    // ---------------------------------
    //  Core
    // ---------------------------------
    
    localparam  CAPACITY_ASYNC           = AXI4S_ASYNC;
    localparam  CAPACITY_COUNTER_WIDTH   = AXI4S_FIFO_PTR_WIDTH + 1;
    localparam  CAPACITY_INIT_COUNTER    = 0;
    
    wire                                    capacity_reset = ~s_axi4s_aresetn;
    wire                                    capacity_clk   = s_axi4s_aclk;
    wire    [CAPACITY_COUNTER_WIDTH-1:0]    capacity_add   = 1;
    wire                                    capacity_valid = (s_axi4s_aclken & s_axi4s_tvalid & s_axi4s_tready);
    
    wire                                    axi4s_tlast;
    wire    [AXI4S_DATA_WIDTH-1:0]          axi4s_tdata;
    wire                                    axi4s_tvalid;
    wire                                    axi4s_tready;
    
    jelly_axi4_writer_core
            #(
                .S_LEN_WIDTH            (S_LEN_WIDTH),
                
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
                
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .AXI4S_STRB_WIDTH       (AXI4S_STRB_WIDTH),
                .AXI4S_DATA_WIDTH       (AXI4S_DATA_WIDTH),
                
                .CAPACITY_ASYNC         (CAPACITY_ASYNC),
                .CAPACITY_COUNTER_WIDTH (CAPACITY_COUNTER_WIDTH),
                .CAPACITY_INIT_COUNTER  (CAPACITY_INIT_COUNTER),
                
                .LAST_FIFO_PTR_WIDTH    (LAST_FIFO_PTR_WIDTH),
                .LAST_FIFO_RAM_TYPE     (LAST_FIFO_RAM_TYPE),
                
                .BUSY_COUNTER_WIDTH     (BUSY_COUNTER_WIDTH),
                
                .BYPASS_RANGE           (BYPASS_RANGE),
                .BYPASS_LEN             (BYPASS_LEN),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .BYPASS_CAPACITY        (BYPASS_CAPACITY)
            )
        i_axi4_writer_core
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (busy),
                
                .param_range_start      (param_range_start),
                .param_range_end        (param_range_end),
                .param_maxlen           (param_maxlen),
                
                .capacity_reset         (capacity_reset),
                .capacity_clk           (capacity_clk),
                .capacity_add           (capacity_add),
                .capacity_valid         (capacity_valid),
                
                .s_awaddr               (s_awaddr),
                .s_awlen                (s_awlen),
                .s_awvalid              (s_awvalid),
                .s_awready              (s_awready),
                
                .s_axi4s_tstrb          (axi4s_fifo_tstrb),
                .s_axi4s_tdata          (axi4s_fifo_tdata),
                .s_axi4s_tvalid         (axi4s_fifo_tvalid & aclken),
                .s_axi4s_tready         (axi4s_fifo_tready),
                
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
    
    
endmodule


`default_nettype wire


// end of file
