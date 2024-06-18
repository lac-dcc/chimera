// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_axi4_write();
    
    // simulation setting
    initial begin
        $dumpfile("tb_axi4_write.vcd");
        $dumpvars(0, tb_axi4_write);
        
        #1000000;
            $finish;
    end
    
    localparam S_AWRATE = 1000.0/100.0;
    localparam S_WRATE  = 1000.0/200.0;
    localparam S_BRATE  = 1000.0/130.0;
    localparam M_ARATE  = 1000.0/166.0;
    
    parameter RAND_BUSY = 1;
    
    
    
    // clock & reset
    reg     s_awclk = 1'b1;
    always #(S_AWRATE/2.0)  s_awclk  = ~s_awclk;
    
    reg     s_awresetn = 1'b0;
    initial #(S_AWRATE*100) s_awresetn = 1'b1;
    
    reg     s_wclk = 1'b1;
    always #(S_WRATE/2.0)   s_wclk  = ~s_wclk;
    
    reg     s_wresetn = 1'b0;
    initial #(S_WRATE*100)  s_wresetn = 1'b1;
    
    reg     s_bclk = 1'b1;
    always #(S_WRATE/2.0)   s_bclk  = ~s_bclk;
    
    reg     s_bresetn = 1'b0;
    initial #(S_WRATE*100)  s_bresetn = 1'b1;
    
    
    reg     m_aclk = 1'b1;
    always #(M_ARATE/2.0)   m_aclk  = ~m_aclk;
    
    reg     m_aresetn = 1'b0;
    initial #(M_ARATE*100)  m_aresetn = 1'b1;
    
    

    parameter   AWASYNC              = 1;
    parameter   WASYNC               = 1;
    parameter   BASYNC               = 1;
    
    parameter   BYTE_WIDTH           = 8;
    parameter   BYPASS_ALIGN         = 0;
    parameter   AXI4_ALIGN           = 12;  // 2^12 = 4k が境界
    parameter   ALLOW_UNALIGNED      = 1;
    
    parameter   HAS_S_WSTRB          = 0;
    parameter   HAS_S_WFIRST         = 0;
    parameter   HAS_S_WLAST          = 0;
    parameter   HAS_M_WSTRB          = 1;
    parameter   HAS_M_WFIRST         = 1;
    parameter   HAS_M_WLAST          = 1;
    
    parameter   AXI4_ID_WIDTH        = 6;
    parameter   AXI4_ADDR_WIDTH      = 49;
    parameter   AXI4_DATA_SIZE       = 3;    // 0:8bit; 1:16bit; 2:32bit ...
    parameter   AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE);
    parameter   AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / BYTE_WIDTH;
    parameter   AXI4_LEN_WIDTH       = 8;
    parameter   AXI4_QOS_WIDTH       = 4;
    parameter   AXI4_AWID            = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_AWSIZE          = AXI4_DATA_SIZE;
    parameter   AXI4_AWBURST         = 2'b01;
    parameter   AXI4_AWLOCK          = 1'b0;
    parameter   AXI4_AWCACHE         = 4'b0001;
    parameter   AXI4_AWPROT          = 3'b000;
    parameter   AXI4_AWQOS           = 0;
    parameter   AXI4_AWREGION        = 4'b0000;
    
    parameter   S_WDATA_WIDTH        = 32;
    parameter   S_WSTRB_WIDTH        = S_WDATA_WIDTH / BYTE_WIDTH;
    parameter   S_AWLEN_WIDTH        = 32;
    parameter   S_AWLEN_OFFSET       = 1'b1;
    
    parameter   AWLEN_WIDTH          = S_AWLEN_WIDTH - 1;   // 内部キューイング用
    parameter   AWLEN_OFFSET         = S_AWLEN_OFFSET;
    
    parameter   CONVERT_S_REGS       = 1;
    
    parameter   WFIFO_PTR_WIDTH      = 9;
    parameter   WFIFO_RAM_TYPE       = "block";
    parameter   WFIFO_LOW_DEALY      = 0;
    parameter   WFIFO_DOUT_REGS      = 1;
    parameter   WFIFO_S_REGS         = 1;
    parameter   WFIFO_M_REGS         = 1;
    
    parameter   AWFIFO_PTR_WIDTH     = 4;
    parameter   AWFIFO_RAM_TYPE      = "distributed";
    parameter   AWFIFO_LOW_DEALY     = 1;
    parameter   AWFIFO_DOUT_REGS     = 0;
    parameter   AWFIFO_S_REGS        = 1;
    parameter   AWFIFO_M_REGS        = 1;
    
    parameter   BFIFO_PTR_WIDTH      = 5;
    parameter   BFIFO_RAM_TYPE       = "distributed";
    parameter   BFIFO_LOW_DEALY      = 0;
    parameter   BFIFO_DOUT_REGS      = 1;
    parameter   BFIFO_S_REGS         = 1;
    parameter   BFIFO_M_REGS         = 1;
    
    parameter   DATFIFO_PTR_WIDTH     = 4;
    parameter   DATFIFO_RAM_TYPE      = "distributed";
    parameter   DATFIFO_LOW_DEALY     = 1;
    parameter   DATFIFO_DOUT_REGS     = 0;
    parameter   DATFIFO_S_REGS        = 1;
    parameter   DATFIFO_M_REGS        = 1;
    
    parameter   ACKFIFO_PTR_WIDTH     = 4;
    parameter   ACKFIFO_RAM_TYPE      = "distributed";
    parameter   ACKFIFO_LOW_DEALY     = 1;
    parameter   ACKFIFO_DOUT_REGS     = 0;
    parameter   ACKFIFO_S_REGS        = 0;
    parameter   ACKFIFO_M_REGS        = 1;
    
    
    reg                             endian = 0;
    
    reg     [AXI4_ADDR_WIDTH-1:0]   s_awaddr;
    reg     [S_AWLEN_WIDTH-1:0]     s_awlen;
    reg     [AXI4_LEN_WIDTH-1:0]    s_awlen_max;
    reg                             s_awvalid;
    wire                            s_awready;
    
    reg     [S_WDATA_WIDTH-1:0]     s_wdata;
    reg     [S_WSTRB_WIDTH-1:0]     s_wstrb;
    reg                             s_wfirst = 0;
    reg                             s_wlast  = 0;
    reg                             s_wvalid;
    wire                            s_wready;
    reg                             s_wparam_detect_first = 0;
    reg                             s_wparam_detect_last  = 0;
    reg                             s_wparam_padding_en   = 0;
    reg     [S_WDATA_WIDTH-1:0]     s_wparam_padding_data = 0;
    reg     [S_WSTRB_WIDTH-1:0]     s_wparam_padding_strb = 0;
    
    wire                            s_bvalid;
    reg                             s_bready = 1;
    
    wire    [AXI4_ID_WIDTH-1:0]     m_axi4_awid;
    wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_awlen;
    wire    [2:0]                   m_axi4_awsize;
    wire    [1:0]                   m_axi4_awburst;
    wire    [0:0]                   m_axi4_awlock;
    wire    [3:0]                   m_axi4_awcache;
    wire    [2:0]                   m_axi4_awprot;
    wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_awqos;
    wire    [3:0]                   m_axi4_awregion;
    wire                            m_axi4_awvalid;
    wire                            m_axi4_awready;
    wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_wdata;
    wire    [AXI4_STRB_WIDTH-1:0]   m_axi4_wstrb;
    wire                            m_axi4_wlast;
    wire                            m_axi4_wvalid;
    wire                            m_axi4_wready;
    wire    [AXI4_ID_WIDTH-1:0]     m_axi4_bid;
    wire    [1:0]                   m_axi4_bresp;
    wire                            m_axi4_bvalid;
    wire                            m_axi4_bready;
    
    jelly_axi4_write
            #(
                .AWASYNC                (AWASYNC),
                .WASYNC                 (WASYNC),
                .BASYNC                 (BASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .HAS_S_WSTRB            (HAS_S_WSTRB),
                .HAS_S_WFIRST           (HAS_S_WFIRST),
                .HAS_S_WLAST            (HAS_S_WLAST),
                .HAS_M_WSTRB            (HAS_M_WSTRB),
                .HAS_M_WFIRST           (HAS_M_WFIRST),
                .HAS_M_WLAST            (HAS_M_WLAST),
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
                .S_WDATA_WIDTH          (S_WDATA_WIDTH),
                .S_WSTRB_WIDTH          (S_WSTRB_WIDTH),
                .S_AWLEN_WIDTH          (S_AWLEN_WIDTH),
                .S_AWLEN_OFFSET         (S_AWLEN_OFFSET),
                .AWLEN_WIDTH            (AWLEN_WIDTH),
                .AWLEN_OFFSET           (AWLEN_OFFSET),
                .CONVERT_S_REGS         (CONVERT_S_REGS),
                .WFIFO_PTR_WIDTH        (WFIFO_PTR_WIDTH),
                .WFIFO_RAM_TYPE         (WFIFO_RAM_TYPE),
                .WFIFO_LOW_DEALY        (WFIFO_LOW_DEALY),
                .WFIFO_DOUT_REGS        (WFIFO_DOUT_REGS),
                .WFIFO_S_REGS           (WFIFO_S_REGS),
                .WFIFO_M_REGS           (WFIFO_M_REGS),
                .AWFIFO_PTR_WIDTH       (AWFIFO_PTR_WIDTH),
                .AWFIFO_RAM_TYPE        (AWFIFO_RAM_TYPE),
                .AWFIFO_LOW_DEALY       (AWFIFO_LOW_DEALY),
                .AWFIFO_DOUT_REGS       (AWFIFO_DOUT_REGS),
                .AWFIFO_S_REGS          (AWFIFO_S_REGS),
                .AWFIFO_M_REGS          (AWFIFO_M_REGS),
                .BFIFO_PTR_WIDTH        (BFIFO_PTR_WIDTH),
                .BFIFO_RAM_TYPE         (BFIFO_RAM_TYPE),
                .BFIFO_LOW_DEALY        (BFIFO_LOW_DEALY),
                .BFIFO_DOUT_REGS        (BFIFO_DOUT_REGS),
                .BFIFO_S_REGS           (BFIFO_S_REGS),
                .BFIFO_M_REGS           (BFIFO_M_REGS),
                .DATFIFO_PTR_WIDTH      (DATFIFO_PTR_WIDTH),
                .DATFIFO_RAM_TYPE       (DATFIFO_RAM_TYPE),
                .DATFIFO_LOW_DEALY      (DATFIFO_LOW_DEALY),
                .DATFIFO_DOUT_REGS      (DATFIFO_DOUT_REGS),
                .DATFIFO_S_REGS         (DATFIFO_S_REGS),
                .DATFIFO_M_REGS         (DATFIFO_M_REGS),
                .ACKFIFO_PTR_WIDTH      (ACKFIFO_PTR_WIDTH),
                .ACKFIFO_RAM_TYPE       (ACKFIFO_RAM_TYPE),
                .ACKFIFO_LOW_DEALY      (ACKFIFO_LOW_DEALY),
                .ACKFIFO_DOUT_REGS      (ACKFIFO_DOUT_REGS),
                .ACKFIFO_S_REGS         (ACKFIFO_S_REGS),
                .ACKFIFO_M_REGS         (ACKFIFO_M_REGS)
            )
        i_axi4_write
            (
                .endian                 (endian),
                
                .s_awresetn             (s_awresetn),
                .s_awclk                (s_awclk),
                .s_awaddr               (s_awaddr),
                .s_awlen                (s_awlen),
                .s_awlen_max            (s_awlen_max),
                .s_awvalid              (s_awvalid),
                .s_awready              (s_awready),
                
                .s_wresetn              (s_wresetn),
                .s_wclk                 (s_wclk),
                .s_wdata                (s_wdata),
                .s_wstrb                (s_wstrb),
                .s_wfirst               (s_wfirst),
                .s_wlast                (s_wlast),
                .s_wvalid               (s_wvalid),
                .s_wready               (s_wready),
                .s_wparam_detect_first  (s_wparam_detect_first),
                .s_wparam_detect_last   (s_wparam_detect_last),
                .s_wparam_padding_en    (s_wparam_padding_en),
                .s_wparam_padding_data  (s_wparam_padding_data),
                .s_wparam_padding_strb  (s_wparam_padding_strb),
                
                .s_bresetn              (s_bresetn),
                .s_bclk                 (s_bclk),
                .s_bvalid               (s_bvalid),
                .s_bready               (s_bready),
                
                .m_aresetn              (m_aresetn),
                .m_aclk                 (m_aclk),
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
                .aresetn                (m_aresetn),
                .aclk                   (m_aclk),
                
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
                .s_axi4_arvalid         (),
                .s_axi4_arready         (),
                .s_axi4_rid             (),
                .s_axi4_rdata           (),
                .s_axi4_rresp           (),
                .s_axi4_rlast           (),
                .s_axi4_rvalid          (),
                .s_axi4_rready          ()
            );
    
//    assign m_axi4_awready = 1;
//    assign m_axi4_wready  = 1;
//    assign m_axi4_bvalid  = 0;
    
    
    always @(posedge s_wclk) begin
        if ( ~s_wresetn ) begin
            s_wdata  <= 0;
            s_wstrb  <= {S_WSTRB_WIDTH{1'b1}};
            s_wvalid <= 0;
        end
        else begin
            if ( !s_wvalid | s_wready ) begin
                s_wvalid <= (RAND_BUSY ? {$random()} : 1'b1);
            end
            
            if ( s_wvalid & s_wready ) begin
                s_wdata <= s_wdata + 1;
            end
        end
    end
    
    /*
    integer fp_s_aw;
    integer fp_m_aw;
    integer fp_m_w;
    initial begin
        fp_s_aw = $fopen("out_s_aw.txt", "w");
        fp_m_aw = $fopen("out_m_aw.txt", "w");
        fp_m_w  = $fopen("out_m_w.txt",  "w");
    end
    
    always @(posedge s_awclk) begin
        if ( s_awresetn ) begin
            if ( s_awvalid && s_awready ) begin
                $fdisplay(fp_s_aw, "%h %h", s_awaddr, s_awlen);
            end
        end
    end
    
    always @(posedge m_awclk) begin
        if ( m_awresetn ) begin
            if ( m_awvalid && m_awready ) begin
                $fdisplay(fp_m_aw, "%h %h", m_awaddr, m_awlen);
            end
        end
    end
    
    integer count_m_w = 0;
    always @(posedge m_wclk) begin
        if ( m_wresetn ) begin
            if ( m_wvalid && m_wready ) begin
                $fdisplay(fp_m_w, "%h %h %b %b", m_wdata, m_wstrb, m_wfirst, m_wlast);
                count_m_w <= count_m_w + 1;
            end
        end
    end
    */
    
    
    
    
    integer     i;
    initial begin
        #0;
            s_awaddr    <= 0;
            s_awlen     <= 0;
            s_awlen_max <= 15;
            s_awvalid   <= 0;
        #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h1000;
            s_awlen   <= 512  - S_AWLEN_OFFSET;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h10000 - 3;
            s_awlen   <= 17  - S_AWLEN_OFFSET;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            
        #10000;
        
        /*
        @(posedge s_awclk)
            s_awaddr  <= 0;
            s_awlen   <= 15 - S_AWLEN_OFFSET;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 0;
            s_awlen   <= 1 - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 1;
            s_awlen   <= 16  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 3;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
            #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001003;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001007;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;
        
        
        @(posedge s_awclk)
            s_awaddr  <= 32'h001008;
            s_awlen   <= 15  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            while ( !(s_awvalid && s_awready) )
                @(posedge s_awclk);
                s_awvalid <= 0;
        #10000;

        // 連続アクセス
        @(posedge s_awclk)
            s_awaddr  <= 32'h001008;
            s_awlen   <= 1  - S_AWLEN_OFFSET;
            s_awuser  <= 0;
            s_awvalid <= 1;
            @(posedge s_awclk);
            for ( i = 0; i < 100; i = i+1 ) begin
                while ( !(s_awvalid && s_awready) )
                    @(posedge s_awclk);
                s_awaddr <= s_awaddr + 7;
                s_awlen  <= s_awlen + 1;
                @(posedge s_awclk);
            end
            s_awvalid <= 0;
        */
        
        #10000;
            $finish();
    end
    
    

endmodule


`default_nettype wire


// end of file
