
`timescale 1ns / 1ps
`default_nettype none


module tb_dma_stream_write();
    localparam WB_RATE   = 1000.0 / 66.6;
    localparam W_RATE    = 1000.0 / 133.0;
    localparam AXI4_RATE = 1000.0 / 200.0;
    
    
    initial begin
        $dumpfile("tb_dma_stream_write.vcd");
        $dumpvars(0, tb_dma_stream_write);
        
        #100000;
            $finish;
    end
    
    
    reg     s_wb_rst_i = 1'b1;
    initial #(WB_RATE*100)      s_wb_rst_i = 1'b0;
    
    reg     s_wb_clk_i = 1'b1;
    always #(WB_RATE/2.0)       s_wb_clk_i = ~s_wb_clk_i;
    
    reg     s_wresetn = 1'b0;
    initial #(W_RATE*100)       s_wresetn = 1'b1;
    
    reg     s_wclk = 1'b1;
    always #(W_RATE/2.0)        s_wclk = ~s_wclk;
    
    reg     m_aresetn = 1'b0;
    initial #(AXI4_RATE*100)    m_aresetn = 1'b1;
    
    reg     m_aclk = 1'b1;
    always #(AXI4_RATE/2.0)     m_aclk = ~m_aclk;
    
    
    
    localparam  RAND_BUSY = 0;
    
    
    
    // -----------------------------------------
    //  Core
    // -----------------------------------------
    
    parameter N                    = 3;
    
    parameter CORE_ID              = 32'habcd_0000;
    parameter CORE_VERSION         = 32'h0000_0000;
    
    parameter WB_ASYNC             = 1;
    parameter WASYNC               = 1;
    
    parameter BYTE_WIDTH           = 8;
    parameter BYPASS_GATE          = 0;
    parameter BYPASS_ALIGN         = 0;
    parameter AXI4_ALIGN           = 12;  // 2^12 = 4k が境界
    parameter ALLOW_UNALIGNED      = 1;
    
    parameter HAS_WSTRB            = 0;
    parameter HAS_WFIRST           = 0;
    parameter HAS_WLAST            = 0;
    
    parameter AXI4_ID_WIDTH        = 6;
    parameter AXI4_ADDR_WIDTH      = 32;
    parameter AXI4_DATA_SIZE       = 3;    // 0:8bit; 1:16bit; 2:32bit ...
    parameter AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE);
    parameter AXI4_STRB_WIDTH      = AXI4_DATA_WIDTH / BYTE_WIDTH;
    parameter AXI4_LEN_WIDTH       = 8;
    parameter AXI4_QOS_WIDTH       = 4;
    parameter AXI4_ARID            = {AXI4_ID_WIDTH{1'b0}};
    parameter AXI4_ARSIZE          = AXI4_DATA_SIZE;
    parameter AXI4_ARBURST         = 2'b01;
    parameter AXI4_ARLOCK          = 1'b0;
    parameter AXI4_ARCACHE         = 4'b0001;
    parameter AXI4_ARPROT          = 3'b000;
    parameter AXI4_ARQOS           = 0;
    parameter AXI4_ARREGION        = 4'b0000;
    
    parameter WDATA_WIDTH          = 24; // 32;
    parameter WSTRB_WIDTH          = WDATA_WIDTH / BYTE_WIDTH;
    parameter AWLEN_WIDTH          = AXI4_ADDR_WIDTH;   // 内部キューイング用
    
    parameter WB_ADR_WIDTH         = 8;
    parameter WB_DAT_WIDTH         = 64;
    parameter WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8);
    parameter INDEX_WIDTH          = 1;
    
    
    
    reg                             endian = 0;
    
    wire    [WB_ADR_WIDTH-1:0]      s_wb_adr_i;
    wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_i;
    wire    [WB_DAT_WIDTH-1:0]      s_wb_dat_o;
    wire                            s_wb_we_i;
    wire    [WB_SEL_WIDTH-1:0]      s_wb_sel_i;
    wire                            s_wb_stb_i;
    wire                            s_wb_ack_o;
    wire    [0:0]                   out_irq;
    
    wire                            buffer_request;
    wire                            buffer_release;
    wire    [AXI4_ADDR_WIDTH-1:0]   buffer_addr;
    
    reg     [WDATA_WIDTH-1:0]       s_wdata;
    reg     [WSTRB_WIDTH-1:0]       s_wstrb  = {WSTRB_WIDTH{1'b1}};
    reg     [N-1:0]                 s_wfirst = 0;
    reg     [N-1:0]                 s_wlast  = 0;
    reg                             s_wvalid;
    wire                            s_wready;
    
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
    
    jelly_dma_stream_write
            #(
                .N                      (N),
                .WB_ASYNC               (WB_ASYNC),
                .WASYNC                 (WASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_GATE            (BYPASS_GATE),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .HAS_WSTRB              (HAS_WSTRB),
                .HAS_WFIRST             (HAS_WFIRST),
                .HAS_WLAST              (HAS_WLAST),
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .WDATA_WIDTH            (WDATA_WIDTH),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH)
            )
        i_dma_stream_write
            (
                .endian                 (endian),
                
                .s_wb_rst_i             (s_wb_rst_i),
                .s_wb_clk_i             (s_wb_clk_i),
                .s_wb_adr_i             (s_wb_adr_i),
                .s_wb_dat_i             (s_wb_dat_i),
                .s_wb_dat_o             (s_wb_dat_o),
                .s_wb_we_i              (s_wb_we_i),
                .s_wb_sel_i             (s_wb_sel_i),
                .s_wb_stb_i             (s_wb_stb_i),
                .s_wb_ack_o             (s_wb_ack_o),
                .out_irq                (out_irq),
                
                .buffer_request         (buffer_request),
                .buffer_release         (buffer_release),
                .buffer_addr            (buffer_addr),
                
                .s_wresetn              (s_wresetn),
                .s_wclk                 (s_wclk),
                .s_wdata                (s_wdata),
                .s_wstrb                (s_wstrb),
                .s_wfirst               (s_wfirst),
                .s_wlast                (s_wlast),
                .s_wvalid               (s_wvalid),
                .s_wready               (s_wready),
                
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
    
    
    always @(posedge s_wclk) begin
        if ( ~s_wresetn ) begin
            s_wdata  <= 0;
            s_wvalid <= 0;
        end
        else begin
            if ( !s_wvalid || s_wready ) begin
                s_wvalid <= (RAND_BUSY ? {$random()} : 1'b1);
            end
            
            if ( s_wvalid && s_wready ) begin
                s_wdata <= s_wdata + 1;
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
                .s_axi4_arvalid         (1'b0),
                .s_axi4_arready         (),
                .s_axi4_rid             (),
                .s_axi4_rdata           (),
                .s_axi4_rresp           (),
                .s_axi4_rlast           (),
                .s_axi4_rvalid          (),
                .s_axi4_rready          (1'b0)
            );
    
    
    // ----------------------------------
    //  buffer allocator
    // ----------------------------------
    
    parameter   BUFFER_NUM   = 3;
    parameter   READER_NUM   = 1;
    parameter   ADDR_WIDTH   = AXI4_ADDR_WIDTH;
    parameter   REFCNT_WIDTH = 2;
    
    reg     [ADDR_WIDTH-1:0]    param_buf_addr0 = 32'h1000_0000;
    reg     [ADDR_WIDTH-1:0]    param_buf_addr1 = 32'h2000_0000;
    reg     [ADDR_WIDTH-1:0]    param_buf_addr2 = 32'h3000_0000;
    
    reg                         read_request;
    reg                         read_release;
    wire    [ADDR_WIDTH-1:0]    read_addr;
    wire    [1:0]               read_index;
    
    wire    [ADDR_WIDTH-1:0]    newest_addr;
    wire    [1:0]               newest_index;
    wire    [REFCNT_WIDTH-1:0]  status_refcnt0;
    wire    [REFCNT_WIDTH-1:0]  status_refcnt1;
    wire    [REFCNT_WIDTH-1:0]  status_refcnt2;
    
    
    jelly_buffer_arbiter
            #(
                .BUFFER_NUM     (BUFFER_NUM),
                .READER_NUM     (READER_NUM),
                .ADDR_WIDTH     (ADDR_WIDTH),
                .REFCNT_WIDTH   (REFCNT_WIDTH),
                .INDEX_WIDTH    (2)
            )
        i_buffer_arbiter
            (
                .reset          (s_wb_rst_i),
                .clk            (s_wb_clk_i),
                .cke            (1'b1),
                
                .param_buf_addr ({param_buf_addr2, param_buf_addr1, param_buf_addr0}),
                
                .writer_request (buffer_request),
                .writer_release (buffer_release),
                .writer_addr    (buffer_addr),
                .writer_index   (),
                
                .reader_request (read_request),
                .reader_release (read_release),
                .reader_addr    (read_addr),
                .reader_index   (read_index),
                
                .newest_addr    (newest_addr),
                .newest_index   (newest_index),
                .status_refcnt  ({status_refcnt2, status_refcnt1, status_refcnt0})
            );
    
    // dummy writer
    initial begin
    #10000;
        while ( 1 ) begin
            while ( {$random()} % 10 != 0 )
                @(posedge s_wb_clk_i);
            read_request <= 1'b1;
            @(posedge s_wb_clk_i);
            read_request <= 1'b0;
            @(posedge s_wb_clk_i);
            
            @(posedge s_wb_clk_i);
            while ( {$random()} % 100 != 0 )
                @(posedge s_wb_clk_i);
            
            read_release <= 1'b1;
            @(posedge s_wb_clk_i);
            read_release <= 1'b0;
            @(posedge s_wb_clk_i);
        end
    end
    
    
    
    // ----------------------------------
    //  WISHBONE master
    // ----------------------------------
    
    wire                            wb_rst_i = s_wb_rst_i;
    wire                            wb_clk_i = s_wb_clk_i;
    reg     [WB_ADR_WIDTH-1:0]      wb_adr_o;
    wire    [WB_DAT_WIDTH-1:0]      wb_dat_i = s_wb_dat_o;
    reg     [WB_DAT_WIDTH-1:0]      wb_dat_o;
    reg                             wb_we_o;
    reg     [WB_SEL_WIDTH-1:0]      wb_sel_o;
    reg                             wb_stb_o = 0;
    wire                            wb_ack_i = s_wb_ack_o;
    
    assign s_wb_adr_i = wb_adr_o;
    assign s_wb_dat_i = wb_dat_o;
    assign s_wb_we_i  = wb_we_o;
    assign s_wb_sel_i = wb_sel_o;
    assign s_wb_stb_i = wb_stb_o;
    
    
    reg     [WB_DAT_WIDTH-1:0]      reg_wb_dat;
    reg                             reg_wb_ack;
    always @(posedge wb_clk_i) begin
        if ( ~wb_we_o & wb_stb_o & wb_ack_i ) begin
            reg_wb_dat <= wb_dat_i;
        end
        reg_wb_ack <= wb_ack_i;
    end
    
    
    task wb_write(
                input [31:0]    adr,
                input [31:0]    dat,
                input [3:0]     sel
            );
    begin
        $display("WISHBONE_WRITE(adr:%h dat:%h sel:%b)", adr, dat, sel);
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = dat;
            wb_sel_o = sel;
            wb_we_o  = 1'b1;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
    end
    endtask
    
    task wb_read(
                input [31:0]    adr
            );
    begin
        @(negedge wb_clk_i);
            wb_adr_o = adr;
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'b1}};
            wb_we_o  = 1'b0;
            wb_stb_o = 1'b1;
        @(negedge wb_clk_i);
            while ( reg_wb_ack == 1'b0 ) begin
                @(negedge wb_clk_i);
            end
            wb_adr_o = {WB_ADR_WIDTH{1'bx}};
            wb_dat_o = {WB_DAT_WIDTH{1'bx}};
            wb_sel_o = {WB_SEL_WIDTH{1'bx}};
            wb_we_o  = 1'bx;
            wb_stb_o = 1'b0;
            $display("WISHBONE_READ(adr:%h dat:%h)", adr, reg_wb_dat);
    end
    endtask
    
    localparam  ADR_CORE_ID             = 8'h00;
    localparam  ADR_CORE_VERSION        = 8'h01;
    localparam  ADR_CORE_CONFIG         = 8'h03;
    localparam  ADR_CTL_CONTROL         = 8'h04;
    localparam  ADR_CTL_STATUS          = 8'h05;
    localparam  ADR_CTL_INDEX           = 8'h07;
    localparam  ADR_IRQ_ENABLE          = 8'h08;
    localparam  ADR_IRQ_STATUS          = 8'h09;
    localparam  ADR_IRQ_CLR             = 8'h0a;
    localparam  ADR_IRQ_SET             = 8'h0b;
    localparam  ADR_PARAM_AWADDR        = 8'h10;
    localparam  ADR_PARAM_AWLEN_MAX     = 8'h11;
    localparam  ADR_PARAM_AWLEN0        = 8'h20;
//  localparam  ADR_PARAM_AWSTEP0       = 8'h21;
    localparam  ADR_PARAM_AWLEN1        = 8'h24;
    localparam  ADR_PARAM_AWSTEP1       = 8'h25;
    localparam  ADR_PARAM_AWLEN2        = 8'h28;
    localparam  ADR_PARAM_AWSTEP2       = 8'h29;
    localparam  ADR_PARAM_AWLEN3        = 8'h2c;
    localparam  ADR_PARAM_AWSTEP3       = 8'h2d;
    localparam  ADR_PARAM_AWLEN4        = 8'h30;
    localparam  ADR_PARAM_AWSTEP4       = 8'h31;
    localparam  ADR_PARAM_AWLEN5        = 8'h34;
    localparam  ADR_PARAM_AWSTEP5       = 8'h35;
    localparam  ADR_PARAM_AWLEN6        = 8'h38;
    localparam  ADR_PARAM_AWSTEP6       = 8'h39;
    localparam  ADR_PARAM_AWLEN7        = 8'h3c;
    localparam  ADR_PARAM_AWSTEP7       = 8'h3d;
    localparam  ADR_PARAM_AWLEN8        = 8'h30;
    localparam  ADR_PARAM_AWSTEP8       = 8'h31;
    localparam  ADR_PARAM_AWLEN9        = 8'h44;
    localparam  ADR_PARAM_AWSTEP9       = 8'h45;
    localparam  ADR_WSKIP_EN            = 8'h70;
    localparam  ADR_WDETECT_FIRST       = 8'h72;
    localparam  ADR_WDETECT_LAST        = 8'h73;
    localparam  ADR_WPADDING_EN         = 8'h74;
    localparam  ADR_WPADDING_DATA       = 8'h75;
    localparam  ADR_WPADDING_STRB       = 8'h76;
    localparam  ADR_SHADOW_AWADDR       = 8'h90;
    localparam  ADR_SHADOW_AWLEN_MAX    = 8'h91;
    localparam  ADR_SHADOW_AWLEN0       = 8'ha0;
//  localparam  ADR_SHADOW_AWSTEP0      = 8'ha1;
    localparam  ADR_SHADOW_AWLEN1       = 8'ha4;
    localparam  ADR_SHADOW_AWSTEP1      = 8'ha5;
    localparam  ADR_SHADOW_AWLEN2       = 8'ha8;
    localparam  ADR_SHADOW_AWSTEP2      = 8'ha9;
    localparam  ADR_SHADOW_AWLEN3       = 8'hac;
    localparam  ADR_SHADOW_AWSTEP3      = 8'had;
    localparam  ADR_SHADOW_AWLEN4       = 8'hb0;
    localparam  ADR_SHADOW_AWSTEP4      = 8'hb1;
    localparam  ADR_SHADOW_AWLEN5       = 8'hb4;
    localparam  ADR_SHADOW_AWSTEP5      = 8'hb5;
    localparam  ADR_SHADOW_AWLEN6       = 8'hb8;
    localparam  ADR_SHADOW_AWSTEP6      = 8'hb9;
    localparam  ADR_SHADOW_AWLEN7       = 8'hbc;
    localparam  ADR_SHADOW_AWSTEP7      = 8'hbd;
    localparam  ADR_SHADOW_AWLEN8       = 8'hb0;
    localparam  ADR_SHADOW_AWSTEP8      = 8'hb1;
    localparam  ADR_SHADOW_AWLEN9       = 8'hc4;
    localparam  ADR_SHADOW_AWSTEP9      = 8'hc5;
    
    
    initial begin
        #(WB_RATE*200);
        
        $display("start");
        wb_read(ADR_CORE_ID);
        wb_read(ADR_CORE_VERSION);
        wb_read(ADR_CORE_CONFIG);
        
        wb_write(ADR_PARAM_AWADDR,    32'h0001_0000, 8'hff);
        wb_write(ADR_PARAM_AWLEN_MAX, 32'h0000_000f, 8'hff);
        wb_write(ADR_PARAM_AWLEN0,               31, 8'hff);
        wb_write(ADR_PARAM_AWLEN1,                2, 8'hff);
        wb_write(ADR_PARAM_AWSTEP1,   32'h0001_0100, 8'hff);
        wb_write(ADR_PARAM_AWLEN2,                1, 8'hff);
        wb_write(ADR_PARAM_AWSTEP2,   32'h0001_1000, 8'hff);
        
        wb_write(ADR_CTL_CONTROL,     32'h0000_000b, 8'hff);
        
        #40000;
        
        wb_write(ADR_CTL_CONTROL,     32'h0000_0000, 8'hff);
        
        #40000;
            $finish();
    end
    
    
endmodule


`default_nettype wire


// end of file
