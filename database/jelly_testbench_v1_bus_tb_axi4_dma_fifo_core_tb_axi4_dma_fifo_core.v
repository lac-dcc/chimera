
`timescale 1ns / 1ps
`default_nettype none


module tb_axi4_dma_fifo_core();
    
    localparam S_RATE    = 1000.0 / 150.3;
    localparam M_RATE    = 1000.0 / 100.7;
    localparam AXI4_RATE = 1000.0 / 200.0;
    
    
    initial begin
        $dumpfile("tb_axi4_dma_fifo_core.vcd");
        $dumpvars(0, tb_axi4_dma_fifo_core);
        
        #1000000;
            $finish;
    end
    
    reg     s_reset = 1'b1;
    initial #(S_RATE*100)       s_reset = 1'b0;
    
    reg     s_clk = 1'b1;
    always #(S_RATE/2.0)        s_clk = ~s_clk;
    
    reg     m_reset = 1'b1;
    initial #(M_RATE*100)       m_reset = 1'b0;
    
    reg     m_clk = 1'b1;
    always #(M_RATE/2.0)        m_clk = ~m_clk;
    
    reg     aresetn = 1'b0;
    initial #(AXI4_RATE*100)    aresetn = 1'b1;
    
    reg     aclk = 1'b1;
    always #(AXI4_RATE/2.0)     aclk = ~aclk;
    
    
    
    localparam  RAND_BUSY = 1;
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    parameter   S_ASYNC                  = 1;
    parameter   S_DATA_SIZE              = 2;    // 0:8bit, 1:16bit, 2:32bit ...
    parameter   UNIT_WIDTH               = 8;
    parameter   M_ASYNC                  = 1;
    parameter   M_DATA_SIZE              = 2;    // 0:8bit, 1:16bit, 2:32bit ...
    
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
    parameter   AXI4_ARID                = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_ARSIZE              = AXI4_DATA_SIZE;
    parameter   AXI4_ARBURST             = 2'b01;
    parameter   AXI4_ARLOCK              = 1'b0;
    parameter   AXI4_ARCACHE             = 4'b0001;
    parameter   AXI4_ARPROT              = 3'b000;
    parameter   AXI4_ARQOS               = 0;
    parameter   AXI4_ARREGION            = 4'b0000;
    
    parameter   BYPASS_ADDR_OFFSET       = 0;
    parameter   BYPASS_ALIGN             = 0;
    parameter   AXI4_ALIGN               = 12;
    
    parameter   PARAM_ADDR_WIDTH         = AXI4_ADDR_WIDTH;
    parameter   PARAM_SIZE_WIDTH         = 32;
    parameter   PARAM_SIZE_OFFSET        = 1'b0;
    parameter   PARAM_AWLEN_WIDTH        = AXI4_LEN_WIDTH;
    parameter   PARAM_WSTRB_WIDTH        = AXI4_STRB_WIDTH;
    parameter   PARAM_WTIMEOUT_WIDTH     = 8;
    parameter   PARAM_ARLEN_WIDTH        = AXI4_LEN_WIDTH;
    parameter   PARAM_RTIMEOUT_WIDTH     = 8;
    
    parameter   WDATA_FIFO_PTR_WIDTH     = 9;
    parameter   WDATA_FIFO_RAM_TYPE      = "block";
    parameter   WDATA_FIFO_LOW_DEALY     = 0;
    parameter   WDATA_FIFO_DOUT_REGS     = 1;
    parameter   WDATA_FIFO_S_REGS        = 1;
    parameter   WDATA_FIFO_M_REGS        = 1;
    
    parameter   AWLEN_FIFO_PTR_WIDTH     = 5;
    parameter   AWLEN_FIFO_RAM_TYPE      = "distributed";
    parameter   AWLEN_FIFO_LOW_DEALY     = 0;
    parameter   AWLEN_FIFO_DOUT_REGS     = 1;
    parameter   AWLEN_FIFO_S_REGS        = 0;
    parameter   AWLEN_FIFO_M_REGS        = 1;
    
    parameter   BLEN_FIFO_PTR_WIDTH      = 5;
    parameter   BLEN_FIFO_RAM_TYPE       = "distributed";
    parameter   BLEN_FIFO_LOW_DEALY      = 0;
    parameter   BLEN_FIFO_DOUT_REGS      = 1;
    parameter   BLEN_FIFO_S_REGS         = 0;
    parameter   BLEN_FIFO_M_REGS         = 1;
    
    parameter   RDATA_FIFO_PTR_WIDTH     = 9;
    parameter   RDATA_FIFO_RAM_TYPE      = "block";
    parameter   RDATA_FIFO_LOW_DEALY     = 0;
    parameter   RDATA_FIFO_DOUT_REGS     = 1;
    parameter   RDATA_FIFO_S_REGS        = 1;
    parameter   RDATA_FIFO_M_REGS        = 1;
    
    
    parameter   S_DATA_WIDTH             = (UNIT_WIDTH << S_DATA_SIZE);
    parameter   M_DATA_WIDTH             = (UNIT_WIDTH << M_DATA_SIZE);
    
    
    reg                                     enable = 1;
    wire                                    busy;
    
    reg     [PARAM_ADDR_WIDTH-1:0]          param_addr     = 32'h0000000;
    reg     [PARAM_SIZE_WIDTH-1:0]          param_size     = 32'h0001000;
    reg     [PARAM_AWLEN_WIDTH-1:0]         param_awlen    = 8'h0f;
    reg     [PARAM_WSTRB_WIDTH-1:0]         param_wstrb    = {PARAM_WSTRB_WIDTH{1'b1}};
    reg     [PARAM_WTIMEOUT_WIDTH-1:0]      param_wtimeout = 8'h0f;
    reg     [PARAM_AWLEN_WIDTH-1:0]         param_arlen    = 8'h0f;
    reg     [PARAM_RTIMEOUT_WIDTH-1:0]      param_rtimeout = 8'h0f;
    
    reg     [S_DATA_WIDTH-1:0]              s_data;
    reg                                     s_valid;
    wire                                    s_ready;
    
    wire    [S_DATA_WIDTH-1:0]              m_data;
    wire                                    m_valid;
    reg                                     m_ready;
    
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
    wire    [AXI4_ID_WIDTH-1:0]             m_axi4_arid;
    wire    [AXI4_ADDR_WIDTH-1:0]           m_axi4_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]            m_axi4_arlen;
    wire    [2:0]                           m_axi4_arsize;
    wire    [1:0]                           m_axi4_arburst;
    wire    [0:0]                           m_axi4_arlock;
    wire    [3:0]                           m_axi4_arcache;
    wire    [2:0]                           m_axi4_arprot;
    wire    [AXI4_QOS_WIDTH-1:0]            m_axi4_arqos;
    wire    [3:0]                           m_axi4_arregion;
    wire                                    m_axi4_arvalid;
    wire                                    m_axi4_arready;
    wire    [AXI4_ID_WIDTH-1:0]             m_axi4_rid;
    wire    [AXI4_DATA_WIDTH-1:0]           m_axi4_rdata;
    wire    [1:0]                           m_axi4_rresp;
    wire                                    m_axi4_rlast;
    wire                                    m_axi4_rvalid;
    wire                                    m_axi4_rready;
    
    jelly_axi4_dma_fifo_core
            #(
                .S_ASYNC                (S_ASYNC),
                .M_ASYNC                (M_ASYNC),
                .UNIT_WIDTH             (UNIT_WIDTH),
                .S_DATA_SIZE            (S_DATA_SIZE),
                .M_DATA_SIZE            (M_DATA_SIZE),
                
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
                .AXI4_ARID              (AXI4_ARID),
                .AXI4_ARSIZE            (AXI4_ARSIZE),
                .AXI4_ARBURST           (AXI4_ARBURST),
                .AXI4_ARLOCK            (AXI4_ARLOCK),
                .AXI4_ARCACHE           (AXI4_ARCACHE),
                .AXI4_ARPROT            (AXI4_ARPROT),
                .AXI4_ARQOS             (AXI4_ARQOS),
                .AXI4_ARREGION          (AXI4_ARREGION),
                
                .BYPASS_ADDR_OFFSET     (BYPASS_ADDR_OFFSET),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                
                .PARAM_ADDR_WIDTH       (PARAM_ADDR_WIDTH),
                .PARAM_SIZE_WIDTH       (PARAM_SIZE_WIDTH),
                .PARAM_SIZE_OFFSET      (PARAM_SIZE_OFFSET),
                .PARAM_AWLEN_WIDTH      (PARAM_AWLEN_WIDTH),
                .PARAM_WSTRB_WIDTH      (PARAM_WSTRB_WIDTH),
                .PARAM_WTIMEOUT_WIDTH   (PARAM_WTIMEOUT_WIDTH),
                .PARAM_ARLEN_WIDTH      (PARAM_ARLEN_WIDTH),
                .PARAM_RTIMEOUT_WIDTH   (PARAM_RTIMEOUT_WIDTH),
                
                .WDATA_FIFO_PTR_WIDTH   (WDATA_FIFO_PTR_WIDTH),
                .WDATA_FIFO_RAM_TYPE    (WDATA_FIFO_RAM_TYPE),
                .WDATA_FIFO_LOW_DEALY   (WDATA_FIFO_LOW_DEALY),
                .WDATA_FIFO_DOUT_REGS   (WDATA_FIFO_DOUT_REGS),
                .WDATA_FIFO_S_REGS      (WDATA_FIFO_S_REGS),
                .WDATA_FIFO_M_REGS      (WDATA_FIFO_M_REGS),
                
                .AWLEN_FIFO_PTR_WIDTH   (AWLEN_FIFO_PTR_WIDTH),
                .AWLEN_FIFO_RAM_TYPE    (AWLEN_FIFO_RAM_TYPE),
                .AWLEN_FIFO_LOW_DEALY   (AWLEN_FIFO_LOW_DEALY),
                .AWLEN_FIFO_DOUT_REGS   (AWLEN_FIFO_DOUT_REGS),
                .AWLEN_FIFO_S_REGS      (AWLEN_FIFO_S_REGS),
                .AWLEN_FIFO_M_REGS      (AWLEN_FIFO_M_REGS),
                
                .BLEN_FIFO_PTR_WIDTH    (BLEN_FIFO_PTR_WIDTH),
                .BLEN_FIFO_RAM_TYPE     (BLEN_FIFO_RAM_TYPE),
                .BLEN_FIFO_LOW_DEALY    (BLEN_FIFO_LOW_DEALY),
                .BLEN_FIFO_DOUT_REGS    (BLEN_FIFO_DOUT_REGS),
                .BLEN_FIFO_S_REGS       (BLEN_FIFO_S_REGS),
                .BLEN_FIFO_M_REGS       (BLEN_FIFO_M_REGS),
                                         
                .RDATA_FIFO_PTR_WIDTH   (RDATA_FIFO_PTR_WIDTH),
                .RDATA_FIFO_RAM_TYPE    (RDATA_FIFO_RAM_TYPE),
                .RDATA_FIFO_LOW_DEALY   (RDATA_FIFO_LOW_DEALY),
                .RDATA_FIFO_DOUT_REGS   (RDATA_FIFO_DOUT_REGS),
                .RDATA_FIFO_S_REGS      (RDATA_FIFO_S_REGS),
                .RDATA_FIFO_M_REGS      (RDATA_FIFO_M_REGS)
            )
        i_axi4_dma_fifo_core
            (
                .aresetn                (aresetn),
                .aclk                   (aclk),
                
                .enable                 (enable),
                .busy                   (busy),
                
                .param_addr             (param_addr),
                .param_size             (param_size),
                .param_awlen            (param_awlen),
                .param_wstrb            (param_wstrb),
                .param_wtimeout         (param_wtimeout),
                .param_arlen            (param_arlen),
                .param_rtimeout         (param_rtimeout),
                
                .s_reset                (s_reset),
                .s_clk                  (s_clk),
                .s_data                 (s_data ),
                .s_valid                (s_valid),
                .s_ready                (s_ready),
                
                .m_reset                (m_reset),
                .m_clk                  (m_clk),
                .m_data                 (m_data ),
                .m_valid                (m_valid),
                .m_ready                (m_ready),
                
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
                .m_axi4_bready          (m_axi4_bready),
                .m_axi4_arid            (m_axi4_arid),
                .m_axi4_araddr          (m_axi4_araddr),
                .m_axi4_arlen           (m_axi4_arlen),
                .m_axi4_arsize          (m_axi4_arsize),
                .m_axi4_arburst         (m_axi4_arburst),
                .m_axi4_arlock          (m_axi4_arlock),
                .m_axi4_arcache         (m_axi4_arcache),
                .m_axi4_arprot          (m_axi4_arprot),
                .m_axi4_arqos           (m_axi4_arqos),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arvalid         (m_axi4_arvalid),
                .m_axi4_arready         (m_axi4_arready),
                .m_axi4_rid             (m_axi4_rid),
                .m_axi4_rdata           (m_axi4_rdata),
                .m_axi4_rresp           (m_axi4_rresp),
                .m_axi4_rlast           (m_axi4_rlast),
                .m_axi4_rvalid          (m_axi4_rvalid),
                .m_axi4_rready          (m_axi4_rready)
            );
    
    
    // ---------------------------------
    //  dummy stream Write & Read
    // ---------------------------------
    
    reg         s_enable = 1;
    integer     i        = 0;
    integer     pattern  = 0;
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            i        <= 0;
            pattern  <= 0;
        end
        else begin
            i <= i + 1;
            
            // sequences
            if ( i < 2000 ) begin
                enable   <= 1;
                s_enable <= 1;
            end
            else if ( i < 4000 ) begin
                enable   <= 0;
                s_enable <= 0;
                pattern  <= 1;
            end
            else if ( i < 6000 ) begin
                enable   <= 1;
                s_enable <= 1;
                pattern  <= 2;
            end
            else if ( i < 8000 ) begin
                enable   <= 0;
                s_enable <= 0;
                pattern  <= 3;
            end
            else if ( i > 10000 ) begin
                $finish;
            end
            
            if ( !busy & !enable ) begin
                if ( pattern == 1 ) begin
                    param_addr     <= 32'h0002340;
                    param_size     <= 32'h0004320;
                    param_awlen    <= 8'h0f;
                    param_wstrb    <= {PARAM_WSTRB_WIDTH{1'b1}};
                    param_wtimeout <= 8'h0f;
                    param_arlen    <= 8'h0f;
                    param_rtimeout <= 8'h0f;
                end
            end
        end
    end
    
    
    // write
    always @(posedge s_clk) begin
        if ( s_reset ) begin
            s_data  <= 0;
            s_valid <= 1'b0;
        end
        else begin
            if ( s_valid & s_ready ) begin
                s_data <= s_data + 1;
            end
            
            if ( !s_valid || s_ready ) begin
                s_valid <= s_enable & (RAND_BUSY ? {$random()} : 1'b1);
            end
        end
    end
    
    reg     [M_DATA_WIDTH-1:0]  expect_m_data;
    reg                         m_data_error;
    always @(posedge m_clk) begin
        if ( m_reset ) begin
            m_ready       <= 1'b0;
            expect_m_data <= 0;
        end
        else begin
            m_ready <= RAND_BUSY ? {$random()} : 1'b1;
            
            m_data_error = 0;
            if ( m_valid && m_ready ) begin
                expect_m_data <= expect_m_data + 1'b1;
                if ( m_data != expect_m_data ) begin
                    $display("ERROR");
                    m_data_error = 1;
                end
                else begin
//                 $display("OK");
                end
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
                .MEM_WIDTH              (20),
                
                .READ_DATA_ADDR         (0),
                
                .WRITE_LOG_FILE         ("axi4_write.txt"),
                .READ_LOG_FILE          ("axi4_read.txt"),
                
                .AW_DELAY               (RAND_BUSY ? 16 : 0),
                .AR_DELAY               (RAND_BUSY ? 16 : 0),
                
                .AW_FIFO_PTR_WIDTH      (RAND_BUSY ? 4 : 0),
                .W_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .B_FIFO_PTR_WIDTH       (RAND_BUSY ? 4 : 0),
                .AR_FIFO_PTR_WIDTH      (0),
                .R_FIFO_PTR_WIDTH       (0),
                
                .AW_BUSY_RATE           (RAND_BUSY ? 10 : 0),
                .W_BUSY_RATE            (RAND_BUSY ? 10 : 0),
                .B_BUSY_RATE            (RAND_BUSY ? 10 : 0),
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
                .s_axi4_arid            (m_axi4_arid),
                .s_axi4_araddr          (m_axi4_araddr),
                .s_axi4_arlen           (m_axi4_arlen),
                .s_axi4_arsize          (m_axi4_arsize),
                .s_axi4_arburst         (m_axi4_arburst),
                .s_axi4_arlock          (m_axi4_arlock),
                .s_axi4_arcache         (m_axi4_arcache),
                .s_axi4_arprot          (m_axi4_arprot),
                .s_axi4_arqos           (m_axi4_arqos),
                .s_axi4_arvalid         (m_axi4_arvalid),
                .s_axi4_arready         (m_axi4_arready),
                .s_axi4_rid             (m_axi4_rid),
                .s_axi4_rdata           (m_axi4_rdata),
                .s_axi4_rresp           (m_axi4_rresp),
                .s_axi4_rlast           (m_axi4_rlast),
                .s_axi4_rvalid          (m_axi4_rvalid),
                .s_axi4_rready          (m_axi4_rready)
            );
    
    
endmodule


`default_nettype wire


// end of file
