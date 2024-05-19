// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4_reader();
    localparam AXI4_RATE  = 1000.0 / 200.0;
    localparam AXI4S_RATE = 1000.0 / 150.3;
    
    initial begin
        $dumpfile("tb_axi4_reader.vcd");
        $dumpvars(0, tb_axi4_reader);
        
        #1000000;
            $finish;
    end

    reg     aresetn = 1'b0;
    initial #(AXI4_RATE*100)    aresetn = 1'b1;
    
    reg     axi4_aclk = 1'b1;
    always #(AXI4_RATE/2.0)     axi4_aclk = ~axi4_aclk;
    
    reg     axi4s_aclk = 1'b1;
    always #(AXI4S_RATE/2.0)    axi4s_aclk = ~axi4s_aclk;
    
    
    localparam  RAND_BUSY = 1;
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    parameter   S_LEN_WIDTH              = 24;
    
    parameter   AXI4_ID_WIDTH            = 6;
    parameter   AXI4_ADDR_WIDTH          = 32;
    parameter   AXI4_DATA_SIZE           = 2;   // 0:8bit, 1:16bit, 2:32bit ...
    parameter   AXI4_DATA_WIDTH          = (8 << AXI4_DATA_SIZE);
    parameter   AXI4_LEN_WIDTH           = 8;
    parameter   AXI4_QOS_WIDTH           = 4;
    parameter   AXI4_ARID                = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_ARSIZE              = AXI4_DATA_SIZE;
    parameter   AXI4_ARBURST             = 2'b01;
    parameter   AXI4_ARLOCK              = 1'b0;
    parameter   AXI4_ARCACHE             = 4'b0001;
    parameter   AXI4_ARPROT              = 3'b000;
    parameter   AXI4_ARQOS               = 0;
    parameter   AXI4_ARREGION            = 4'b0000;
    
    parameter   AXI4_ALIGN               = 12;
    
    parameter   AXI4S_ASYNC              = 1;
    parameter   AXI4S_DATA_WIDTH         = AXI4_DATA_WIDTH;
    parameter   AXI4S_FIFO_PTR_WIDTH     = 9;
    parameter   AXI4S_FIFO_RAM_TYPE      = "block";
    
    parameter   LAST_FIFO_PTR_WIDTH      = 12;
    parameter   LAST_FIFO_RAM_TYPE       = "distributed";
    parameter   LAST_USE_READY           = 0;
    
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
    
    reg     [AXI4_ADDR_WIDTH-1:0]           s_araddr;
    reg     [S_LEN_WIDTH-1:0]               s_arlen;
    reg                                     s_arvalid;
    wire                                    s_arready;
    
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
    
    wire                                    m_axi4s_aresetn = aresetn;
    wire                                    m_axi4s_aclk    = axi4s_aclk;
    wire                                    m_axi4s_aclken  = 1'b1;
    wire                                    m_axi4s_tlast;
    wire    [AXI4S_DATA_WIDTH-1:0]          m_axi4s_tdata;
    wire                                    m_axi4s_tvalid;
    reg                                     m_axi4s_tready = 1'b1;
    
    jelly_axi4_reader
            #(
                .S_LEN_WIDTH                (S_LEN_WIDTH ),
                .AXI4_ID_WIDTH              (AXI4_ID_WIDTH ),
                .AXI4_ADDR_WIDTH            (AXI4_ADDR_WIDTH ),
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
                .AXI4_ARREGION              (AXI4_ARREGION ),
                .AXI4_ALIGN                 (AXI4_ALIGN),
                .AXI4S_ASYNC                (AXI4S_ASYNC),
                .AXI4S_DATA_WIDTH           (AXI4S_DATA_WIDTH),
                .AXI4S_FIFO_PTR_WIDTH       (AXI4S_FIFO_PTR_WIDTH),
                .AXI4S_FIFO_RAM_TYPE        (AXI4S_FIFO_RAM_TYPE),
                .LAST_FIFO_PTR_WIDTH        (LAST_FIFO_PTR_WIDTH),
                .LAST_FIFO_RAM_TYPE         (LAST_FIFO_RAM_TYPE),
                .LAST_USE_READY             (LAST_USE_READY),
                .BYPASS_RANGE               (BYPASS_RANGE),
                .BYPASS_LEN                 (BYPASS_LEN),
                .BYPASS_ALIGN               (BYPASS_ALIGN),
                .BYPASS_CAPACITY            (BYPASS_CAPACITY),
                .BYPASS_LAST                (BYPASS_LAST)
            )
        i_axi4_reader
            (
                .aresetn                    (aresetn),
                .aclk                       (aclk),
                .aclken                     (aclken),

                .busy                       (busy),             

                .param_range_start          (param_range_start),
                .param_range_end            (param_range_end),
                .param_maxlen               (param_maxlen),
                                             
                .s_araddr                   (s_araddr),
                .s_arlen                    (s_arlen),
                .s_arvalid                  (s_arvalid),
                .s_arready                  (s_arready),
                
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
                
                .m_axi4s_aresetn            (m_axi4s_aresetn),
                .m_axi4s_aclk               (m_axi4s_aclk),
                .m_axi4s_aclken             (m_axi4s_aclken),
                .m_axi4s_tlast              (m_axi4s_tlast),
                .m_axi4s_tdata              (m_axi4s_tdata),
                .m_axi4s_tvalid             (m_axi4s_tvalid),
                .m_axi4s_tready             (m_axi4s_tready)
            );
    
    initial begin
        if ( RAND_BUSY ) begin
            // ready を落としてemptyさせる
            m_axi4s_tready = 0;
            #(AXI4_RATE*2000);
            
            // 逆にfullさせる
            @(negedge m_axi4s_aclk)
            m_axi4s_tready = 1;
            #(AXI4_RATE*2000);
            
            // 後はランダム
            while ( 1 ) begin
                @(negedge m_axi4s_aclk)
                m_axi4s_tready = {$random()};
            end
        end
        
        m_axi4s_tready = 1;
    end
    
    
    always @(posedge aclk) begin
        if ( ~aresetn ) begin
            s_araddr  <= 32'h0001_0000;
            s_arlen   <= 24'h0000_1000 - 1;
            s_arvalid <= 1'b0;
        end
        else begin
            if ( s_arvalid & s_arready ) begin
                s_araddr <= s_araddr + ((s_arlen + 1) << AXI4_DATA_SIZE);
            end
            
            if ( !s_arvalid || s_arready ) begin
                s_arvalid <= RAND_BUSY ? {$random()} : 1'b1;
                
        //      if ( s_araddr > 32'h0001_0100 ) begin
        //          s_arvalid <= 0;
        //      end
            end
            
            if ( !m_axi4_rready ) begin
                $display("m_axi4_rready down");     // リセット解除時に一回出るけど気にしない
            end
        end
    end
    
    
    
    integer     fp;
    initial fp = $fopen("out.txt", "w");
    
    always @(posedge m_axi4s_aclk) begin
        if ( m_axi4s_aresetn ) begin
            if ( m_axi4s_tvalid && m_axi4s_tready ) begin
    //          $display("%h %b", m_axi4s_tdata, m_axi4s_tlast);
                $fdisplay(fp, "%h %b", m_axi4s_tdata, m_axi4s_tlast);
                if ( m_axi4s_tdata == 32'h0004_0000 ) begin
                    $finish;
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
                
                .s_axi4_awid            (),
                .s_axi4_awaddr          (),
                .s_axi4_awlen           (),
                .s_axi4_awsize          (),
                .s_axi4_awburst         (),
                .s_axi4_awlock          (),
                .s_axi4_awcache         (),
                .s_axi4_awprot          (),
                .s_axi4_awqos           (),
                .s_axi4_awvalid         (1'b0),
                .s_axi4_awready         (),
                .s_axi4_wdata           (),
                .s_axi4_wstrb           (),
                .s_axi4_wlast           (),
                .s_axi4_wvalid          (1'b0),
                .s_axi4_wready          (),
                .s_axi4_bid             (),
                .s_axi4_bresp           (),
                .s_axi4_bvalid          (),
                .s_axi4_bready          (1'b0),
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
