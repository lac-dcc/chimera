// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4_writer();
    localparam AXI4_RATE  = 1000.0 / 200.0;
    localparam AXI4S_RATE = 1000.0 / 150.3;
    
    initial begin
        $dumpfile("tb_axi4_writer.vcd");
        $dumpvars(0, tb_axi4_writer);
        
        #1000000;
            $finish;
    end

    reg     aresetn = 1'b0;
    initial #(AXI4_RATE*100)    aresetn = 1'b1;
    
    reg     axi4_aclk = 1'b1;
    always #(AXI4_RATE/2.0)     axi4_aclk = ~axi4_aclk;
    
    reg     axi4s_aclk = 1'b1;
    always #(AXI4S_RATE/2.0)    axi4s_aclk = ~axi4s_aclk;
    
    
    localparam  RAND_BUSY = 0;
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    parameter   S_LEN_WIDTH              = 24;
    
    parameter   AXI4_ID_WIDTH            = 6;
    parameter   AXI4_ADDR_WIDTH          = 32;
    parameter   AXI4_DATA_SIZE           = 2;   // 0:8bit, 1:16bit, 2:32bit ...
    parameter   AXI4_DATA_WIDTH          = (8 << AXI4_DATA_SIZE);
    parameter   AXI4_STRB_WIDTH          = (1 << AXI4_DATA_SIZE);
    parameter   AXI4_LEN_WIDTH           = 8;
    parameter   AXI4_QOS_WIDTH           = 4;
    parameter   AXI4_AWID                = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_AWSIZE              = AXI4_DATA_SIZE;
    parameter   AXI4_AWBURST             = 2'b01;
    parameter   AXI4_AWLOCK              = 1'b0;
    parameter   AXI4_AWCACHE             = 4'b0001;
    parameter   AXI4_AWPROT              = 3'b000;
    parameter   AXI4_AWQOS               = 0;
    parameter   AXI4_AWREGION            = 4'b0000;
    
    parameter   AXI4_ALIGN               = 12;
    
    parameter   AXI4S_ASYNC              = 1;
    parameter   AXI4S_DATA_WIDTH         = AXI4_DATA_WIDTH;
    parameter   AXI4S_STRB_WIDTH         = AXI4_STRB_WIDTH;
    parameter   AXI4S_FIFO_PTR_WIDTH     = 9;
    parameter   AXI4S_FIFO_RAM_TYPE      = "block";
    
    parameter   LAST_FIFO_PTR_WIDTH      = 12;
    parameter   LAST_FIFO_RAM_TYPE       = "distributed";
    
    parameter   BYPASS_RANGE             = 0;
    parameter   BYPASS_LEN               = 0;
    parameter   BYPASS_ALIGN             = 0;
    parameter   BYPASS_CAPACITY          = 0;
    parameter   BYPASS_LAST              = 0;
    
    
    wire                                    aclk    = axi4_aclk;
    wire                                    aclken  = 1'b1;
    
    wire                                    busy;

    wire    [AXI4_ADDR_WIDTH-1:0]           param_range_start = 32'h0010000;
    wire    [AXI4_ADDR_WIDTH-1:0]           param_range_end   = 32'h000ffff;
    wire    [AXI4_LEN_WIDTH-1:0]            param_maxlen      = 8'h1f;
    
    reg     [AXI4_ADDR_WIDTH-1:0]           s_awaddr;
    reg     [S_LEN_WIDTH-1:0]               s_awlen;
    reg                                     s_awvalid = 0;
    wire                                    s_awready;
    
    wire                                    s_axi4s_aresetn = aresetn;
    wire                                    s_axi4s_aclk    = axi4s_aclk;
    wire                                    s_axi4s_aclken  = 1'b1;
    reg     [AXI4S_STRB_WIDTH-1:0]          s_axi4s_tstrb   = {AXI4S_STRB_WIDTH{1'b1}};
    reg     [AXI4S_DATA_WIDTH-1:0]          s_axi4s_tdata;
    reg                                     s_axi4s_tvalid  = 0;
    wire                                    s_axi4s_tready;
    
    wire    [AXI4_ID_WIDTH-1:0]             m_axi4_awid;
    wire    [AXI4_ADDR_WIDTH-1:0]           m_axi4_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]            m_axi4_awlen;
    wire    [2:0]                           m_axi4_awsize;
    wire    [1:0]                           m_axi4_awburst;
    wire    [0:0]                           m_axi4_awlock;
    wire    [3:0]                           m_axi4_awcache;
    wire    [2:0]                           m_axi4_awprot;
    wire    [AXI4_QOS_WIDTH-1:0]            m_axi4_awqos;
    wire    [3:0]                           m_axi4_awregion;
    wire                                    m_axi4_awvalid;
    wire                                    m_axi4_awready;
    wire    [AXI4_DATA_WIDTH-1:0]           m_axi4_wdata;
    wire    [AXI4_STRB_WIDTH-1:0]           m_axi4_wstrb;
    wire                                    m_axi4_wlast;
    wire                                    m_axi4_wvalid;
    wire                                    m_axi4_wready;
    wire    [AXI4_ID_WIDTH-1:0]             m_axi4_bid;
    wire    [1:0]                           m_axi4_bresp;
    wire                                    m_axi4_bvalid;
    wire                                    m_axi4_bready;
    
    jelly_axi4_writer
            #(
                .S_LEN_WIDTH            (S_LEN_WIDTH ),
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
                .AXI4S_ASYNC            (AXI4S_ASYNC),
                .AXI4S_STRB_WIDTH       (AXI4S_STRB_WIDTH),
                .AXI4S_DATA_WIDTH       (AXI4S_DATA_WIDTH),
                .AXI4S_FIFO_PTR_WIDTH   (AXI4S_FIFO_PTR_WIDTH),
                .AXI4S_FIFO_RAM_TYPE    (AXI4S_FIFO_RAM_TYPE),
                .LAST_FIFO_PTR_WIDTH    (LAST_FIFO_PTR_WIDTH),
                .LAST_FIFO_RAM_TYPE     (LAST_FIFO_RAM_TYPE),
                .BYPASS_RANGE           (BYPASS_RANGE),
                .BYPASS_LEN             (BYPASS_LEN),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .BYPASS_CAPACITY        (BYPASS_CAPACITY)
            )
        i_axi4_writer
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                .aclken                 (aclken),
                
                .busy                   (busy),
                
                .param_range_start      (param_range_start),
                .param_range_end        (param_range_end),
                .param_maxlen           (param_maxlen),
                
                .s_awaddr               (s_awaddr),
                .s_awlen                (s_awlen),
                .s_awvalid              (s_awvalid),
                .s_awready              (s_awready),
                
                .s_axi4s_aresetn        (s_axi4s_aresetn),
                .s_axi4s_aclk           (s_axi4s_aclk),
                .s_axi4s_aclken         (s_axi4s_aclken),
                .s_axi4s_tstrb          (s_axi4s_tstrb),
                .s_axi4s_tdata          (s_axi4s_tdata),
                .s_axi4s_tvalid         (s_axi4s_tvalid),
                .s_axi4s_tready         (s_axi4s_tready),
                
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
    
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            s_awaddr  <= 32'h0001_0000;
            s_awlen   <= 24'h0000_1000 - 1;
            s_awvalid <= 1'b0;
        end
        else begin
            if ( s_awvalid & s_awready ) begin
                s_awaddr <= s_awaddr + ((s_awlen + 1) << AXI4_DATA_SIZE);
            end
            
            if ( !s_awvalid || s_awready ) begin
                s_awvalid <= RAND_BUSY ? {$random()} : 1'b1;
            end
        end
    end
    
    always @(posedge s_axi4s_aclk) begin
        if ( ~s_axi4s_aresetn ) begin
            s_axi4s_tdata  <= 32'h0000_0000;
            s_axi4s_tvalid <= 1'b0;
        end
        else begin
            if ( s_axi4s_tvalid & s_axi4s_tready ) begin
                s_axi4s_tdata <= s_axi4s_tdata + 1;
            end
            
            if ( !s_axi4s_tvalid || s_axi4s_tready ) begin
                s_axi4s_tvalid <= RAND_BUSY ? {$random()} : 1'b1;
            end
        end
    end
    
    
    
    // ---------------------------------
    //  dummy memory model
    // ---------------------------------
    
    jelly_axi4_slave_model
            #(
                .AXI_ID_WIDTH           (AXI4_ID_WIDTH),
                .AXI_ADDR_WIDTH         (AXI4_ADDR_WIDTH),
                .AXI_QOS_WIDTH          (AXI4_QOS_WIDTH),
                .AXI_LEN_WIDTH          (AXI4_LEN_WIDTH),
                .AXI_DATA_SIZE          (AXI4_DATA_SIZE),
                .AXI_DATA_WIDTH         (AXI4_DATA_WIDTH),
                .AXI_STRB_WIDTH         (AXI4_DATA_WIDTH/8),
                .MEM_WIDTH              (24),
                
                .READ_DATA_ADDR         (1),
                
                .WRITE_LOG_FILE         ("axi4_write.txt"),
                .READ_LOG_FILE          ("axi4_read.txt"),
                
                .AW_DELAY               (RAND_BUSY ? 64 : 0),
                .AR_DELAY               (RAND_BUSY ? 64 : 0),
                
                .AW_FIFO_PTR_WIDTH      (RAND_BUSY ? 4 : 0),
                .W_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .B_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .AR_FIFO_PTR_WIDTH      (0),
                .R_FIFO_PTR_WIDTH       (0),
                
                .AW_BUSY_RATE           (RAND_BUSY ? 80 : 0),
                .W_BUSY_RATE            (RAND_BUSY ? 80 : 0),
                .B_BUSY_RATE            (RAND_BUSY ? 80 : 0),
                .AR_BUSY_RATE           (0),
                .R_BUSY_RATE            (0)
            )
        i_axi4_slave_model
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .s_axi4_awid            (m_axi4_awid),
                .s_axi4_awaddr          (m_axi4_awaddr),
                .s_axi4_awlen           (m_axi4_awlen),
                .s_axi4_awsize          (m_axi4_awsize),
                .s_axi4_awburst         (m_axi4_awburst),
                .s_axi4_awlock          (m_axi4_awlock),
                .s_axi4_awcache         (m_axi4_awcache),
                .s_axi4_awprot          (m_axi4_awprot),
                .s_axi4_awqos           (m_axi4_awqos),
                .s_axi4_awvalid         (m_axi4_awvalid),
                .s_axi4_awready         (m_axi4_awready),
                .s_axi4_wdata           (m_axi4_wdata),
                .s_axi4_wstrb           (m_axi4_wstrb),
                .s_axi4_wlast           (m_axi4_wlast),
                .s_axi4_wvalid          (m_axi4_wvalid),
                .s_axi4_wready          (m_axi4_wready),
                .s_axi4_bid             (m_axi4_bid),
                .s_axi4_bresp           (m_axi4_bresp),
                .s_axi4_bvalid          (m_axi4_bvalid),
                .s_axi4_bready          (m_axi4_bready),
                .s_axi4_arid            (),
                .s_axi4_araddr          (),
                .s_axi4_arlen           (),
                .s_axi4_arsize          (),
                .s_axi4_arburst         (),
                .s_axi4_arlock          (),
                .s_axi4_arcache         (),
                .s_axi4_arprot          (),
                .s_axi4_arqos           (),
                .s_axi4_arvalid         (1'b0),
                .s_axi4_arready         (),
                .s_axi4_rid             (),
                .s_axi4_rdata           (),
                .s_axi4_rresp           (),
                .s_axi4_rlast           (),
                .s_axi4_rvalid          (),
                .s_axi4_rready          (1'b0)
            );
    
    
    
endmodule


`default_nettype wire


// end of file
