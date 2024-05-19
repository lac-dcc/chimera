// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1ns / 1ps
`default_nettype none


module tb_dma_stream_read();
    localparam WB_RATE   = 1000.0 / 66.6;
    localparam R_RATE    = 1000.0 / 133.0;
    localparam AXI4_RATE = 1000.0 / 200.0;
    
    
    initial begin
        $dumpfile("tb_dma_stream_read.vcd");
        $dumpvars(0, tb_dma_stream_read);
        
        #100000;
            $finish;
    end
    
    
    reg     s_wb_rst_i = 1'b1;
    initial #(WB_RATE*100)      s_wb_rst_i = 1'b0;
    
    reg     s_wb_clk_i = 1'b1;
    always #(WB_RATE/2.0)       s_wb_clk_i = ~s_wb_clk_i;
    
    reg     s_rresetn = 1'b0;
    initial #(R_RATE*100)       s_rresetn = 1'b1;
    
    reg     s_rclk = 1'b1;
    always #(R_RATE/2.0)        s_rclk = ~s_rclk;
    
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
    parameter RASYNC               = 1;
    
    parameter BYTE_WIDTH           = 8;
    parameter BYPASS_GATE          = 0;
    parameter BYPASS_ALIGN         = 0;
    parameter AXI4_ALIGN           = 12;  // 2^12 = 4k が境界
    parameter ALLOW_UNALIGNED      = 1;
    
    parameter HAS_RFIRST           = 1;
    parameter HAS_RLAST            = 1;
    
    parameter AXI4_ID_WIDTH        = 6;
    parameter AXI4_ADDR_WIDTH      = 32;
    parameter AXI4_DATA_SIZE       = 2;    // 0:8bit; 1:16bit; 2:32bit ...
    parameter AXI4_DATA_WIDTH      = (BYTE_WIDTH << AXI4_DATA_SIZE);
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
    
    parameter RDATA_WIDTH          = 32;
    parameter CAPACITY_WIDTH       = 12;   // 内部キューイング用
    
    parameter ARLEN_OFFSET         = 1'b1;
    parameter ARLEN0_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN1_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN2_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN3_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN4_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN5_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN6_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN7_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN8_WIDTH         = CAPACITY_WIDTH;
    parameter ARLEN9_WIDTH         = CAPACITY_WIDTH;
    parameter ARSTEP1_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP2_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP3_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP4_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP5_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP6_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP7_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP8_WIDTH        = AXI4_ADDR_WIDTH;
    parameter ARSTEP9_WIDTH        = AXI4_ADDR_WIDTH;
    
    parameter CONVERT_S_REGS       = 0;
    
    parameter RFIFO_PTR_WIDTH      = 9;
    parameter RFIFO_RAM_TYPE       = "block";
    parameter RFIFO_LOW_DEALY      = 0;
    parameter RFIFO_DOUT_REGS      = 1;
    parameter RFIFO_S_REGS         = 0;
    parameter RFIFO_M_REGS         = 1;
    
    parameter ARFIFO_PTR_WIDTH     = 4;
    parameter ARFIFO_RAM_TYPE      = "distributed";
    parameter ARFIFO_LOW_DEALY     = 1;
    parameter ARFIFO_DOUT_REGS     = 0;
    parameter ARFIFO_S_REGS        = 0;
    parameter ARFIFO_M_REGS        = 0;
    
    parameter SRFIFO_PTR_WIDTH     = 4;
    parameter SRFIFO_RAM_TYPE      = "distributed";
    parameter SRFIFO_LOW_DEALY     = 0;
    parameter SRFIFO_DOUT_REGS     = 0;
    parameter SRFIFO_S_REGS        = 0;
    parameter SRFIFO_M_REGS        = 0;
    
    parameter MRFIFO_PTR_WIDTH     = 4;
    parameter MRFIFO_RAM_TYPE      = "distributed";
    parameter MRFIFO_LOW_DEALY     = 1;
    parameter MRFIFO_DOUT_REGS     = 0;
    parameter MRFIFO_S_REGS        = 0;
    parameter MRFIFO_M_REGS        = 0;
    
    parameter RACKFIFO_PTR_WIDTH   = 4;
    parameter RACKFIFO_DOUT_REGS   = 0;
    parameter RACKFIFO_RAM_TYPE    = "distributed";
    parameter RACKFIFO_LOW_DEALY   = 1;
    parameter RACKFIFO_S_REGS      = 0;
    parameter RACKFIFO_M_REGS      = 0;
    parameter RACK_S_REGS          = 0;
    parameter RACK_M_REGS          = 1;
    
    parameter CACKFIFO_PTR_WIDTH   = 4;
    parameter CACKFIFO_DOUT_REGS   = 0;
    parameter CACKFIFO_RAM_TYPE    = "distributed";
    parameter CACKFIFO_LOW_DEALY   = 1;
    parameter CACKFIFO_S_REGS      = 0;
    parameter CACKFIFO_M_REGS      = 0;
    parameter CACK_S_REGS          = 0;
    parameter CACK_M_REGS          = 1;
    
    parameter WB_ADR_WIDTH         = 8;
    parameter WB_DAT_WIDTH         = 64;
    parameter WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8);
    parameter INDEX_WIDTH          = 1;
    
    parameter INIT_CTL_CONTROL     = 4'b0000;
    parameter INIT_IRQ_ENABLE      = 1'b0;
    parameter INIT_PARAM_ARADDR    = 0;
    parameter INIT_PARAM_ARLEN_MAX = 0;
    parameter INIT_PARAM_ARLEN0    = 0;
//  parameter INIT_PARAM_ARSTEP0   = 1;
    parameter INIT_PARAM_ARLEN1    = 0;
    parameter INIT_PARAM_ARSTEP1   = 0;
    parameter INIT_PARAM_ARLEN2    = 0;
    parameter INIT_PARAM_ARSTEP2   = 0;
    parameter INIT_PARAM_ARLEN3    = 0;
    parameter INIT_PARAM_ARSTEP3   = 0;
    parameter INIT_PARAM_ARLEN4    = 0;
    parameter INIT_PARAM_ARSTEP4   = 0;
    parameter INIT_PARAM_ARLEN5    = 0;
    parameter INIT_PARAM_ARSTEP5   = 0;
    parameter INIT_PARAM_ARLEN6    = 0;
    parameter INIT_PARAM_ARSTEP6   = 0;
    parameter INIT_PARAM_ARLEN7    = 0;
    parameter INIT_PARAM_ARSTEP7   = 0;
    parameter INIT_PARAM_ARLEN8    = 0;
    parameter INIT_PARAM_ARSTEP8   = 0;
    parameter INIT_PARAM_ARLEN9    = 0;
    parameter INIT_PARAM_ARSTEP9   = 0;
    
    
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
    
    wire    [RDATA_WIDTH-1:0]       s_rdata;
    wire    [N-1:0]                 s_rfirst;
    wire    [N-1:0]                 s_rlast;
    wire                            s_rvalid;
    reg                             s_rready;
    
    wire    [AXI4_ID_WIDTH-1:0]     m_axi4_arid;
    wire    [AXI4_ADDR_WIDTH-1:0]   m_axi4_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]    m_axi4_arlen;
    wire    [2:0]                   m_axi4_arsize;
    wire    [1:0]                   m_axi4_arburst;
    wire    [0:0]                   m_axi4_arlock;
    wire    [3:0]                   m_axi4_arcache;
    wire    [2:0]                   m_axi4_arprot;
    wire    [AXI4_QOS_WIDTH-1:0]    m_axi4_arqos;
    wire    [3:0]                   m_axi4_arregion;
    wire                            m_axi4_arvalid;
    wire                            m_axi4_arready;
    wire    [AXI4_ID_WIDTH-1:0]     m_axi4_rid;
    wire    [AXI4_DATA_WIDTH-1:0]   m_axi4_rdata;
    wire    [1:0]                   m_axi4_rresp;
    wire                            m_axi4_rlast;
    wire                            m_axi4_rvalid;
    wire                            m_axi4_rready;
    
    jelly_dma_stream_read
            #(
                .N                      (N),
                .CORE_ID                (CORE_ID),
                .CORE_VERSION           (CORE_VERSION),
                .WB_ASYNC               (WB_ASYNC),
                .RASYNC                 (RASYNC),
                .BYTE_WIDTH             (BYTE_WIDTH),
                .BYPASS_GATE            (BYPASS_GATE),
                .BYPASS_ALIGN           (BYPASS_ALIGN),
                .AXI4_ALIGN             (AXI4_ALIGN),
                .ALLOW_UNALIGNED        (ALLOW_UNALIGNED),
                .HAS_RFIRST             (HAS_RFIRST),
                .HAS_RLAST              (HAS_RLAST),
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH),
                .AXI4_ARID              (AXI4_ARID),
                .AXI4_ARSIZE            (AXI4_ARSIZE),
                .AXI4_ARBURST           (AXI4_ARBURST),
                .AXI4_ARLOCK            (AXI4_ARLOCK),
                .AXI4_ARCACHE           (AXI4_ARCACHE),
                .AXI4_ARPROT            (AXI4_ARPROT),
                .AXI4_ARQOS             (AXI4_ARQOS),
                .AXI4_ARREGION          (AXI4_ARREGION),
                .RDATA_WIDTH            (RDATA_WIDTH),
                .CAPACITY_WIDTH         (CAPACITY_WIDTH),
                .ARLEN0_WIDTH           (ARLEN0_WIDTH),
                .ARLEN1_WIDTH           (ARLEN1_WIDTH),
                .ARLEN2_WIDTH           (ARLEN2_WIDTH),
                .ARLEN3_WIDTH           (ARLEN3_WIDTH),
                .ARLEN4_WIDTH           (ARLEN4_WIDTH),
                .ARLEN5_WIDTH           (ARLEN5_WIDTH),
                .ARLEN6_WIDTH           (ARLEN6_WIDTH),
                .ARLEN7_WIDTH           (ARLEN7_WIDTH),
                .ARLEN8_WIDTH           (ARLEN8_WIDTH),
                .ARLEN9_WIDTH           (ARLEN9_WIDTH),
                .ARSTEP1_WIDTH          (ARSTEP1_WIDTH),
                .ARSTEP2_WIDTH          (ARSTEP2_WIDTH),
                .ARSTEP3_WIDTH          (ARSTEP3_WIDTH),
                .ARSTEP4_WIDTH          (ARSTEP4_WIDTH),
                .ARSTEP5_WIDTH          (ARSTEP5_WIDTH),
                .ARSTEP6_WIDTH          (ARSTEP6_WIDTH),
                .ARSTEP7_WIDTH          (ARSTEP7_WIDTH),
                .ARSTEP8_WIDTH          (ARSTEP8_WIDTH),
                .ARSTEP9_WIDTH          (ARSTEP9_WIDTH),
                .CONVERT_S_REGS         (CONVERT_S_REGS),
                .RFIFO_PTR_WIDTH        (RFIFO_PTR_WIDTH),
                .RFIFO_RAM_TYPE         (RFIFO_RAM_TYPE),
                .RFIFO_LOW_DEALY        (RFIFO_LOW_DEALY),
                .RFIFO_DOUT_REGS        (RFIFO_DOUT_REGS),
                .RFIFO_S_REGS           (RFIFO_S_REGS),
                .RFIFO_M_REGS           (RFIFO_M_REGS),
                .ARFIFO_PTR_WIDTH       (ARFIFO_PTR_WIDTH),
                .ARFIFO_RAM_TYPE        (ARFIFO_RAM_TYPE),
                .ARFIFO_LOW_DEALY       (ARFIFO_LOW_DEALY),
                .ARFIFO_DOUT_REGS       (ARFIFO_DOUT_REGS),
                .ARFIFO_S_REGS          (ARFIFO_S_REGS),
                .ARFIFO_M_REGS          (ARFIFO_M_REGS),
                .SRFIFO_PTR_WIDTH       (SRFIFO_PTR_WIDTH),
                .SRFIFO_RAM_TYPE        (SRFIFO_RAM_TYPE),
                .SRFIFO_LOW_DEALY       (SRFIFO_LOW_DEALY),
                .SRFIFO_DOUT_REGS       (SRFIFO_DOUT_REGS),
                .SRFIFO_S_REGS          (SRFIFO_S_REGS),
                .SRFIFO_M_REGS          (SRFIFO_M_REGS),
                .MRFIFO_PTR_WIDTH       (MRFIFO_PTR_WIDTH),
                .MRFIFO_RAM_TYPE        (MRFIFO_RAM_TYPE),
                .MRFIFO_LOW_DEALY       (MRFIFO_LOW_DEALY),
                .MRFIFO_DOUT_REGS       (MRFIFO_DOUT_REGS),
                .MRFIFO_S_REGS          (MRFIFO_S_REGS),
                .MRFIFO_M_REGS          (MRFIFO_M_REGS),
                .RACKFIFO_PTR_WIDTH     (RACKFIFO_PTR_WIDTH),
                .RACKFIFO_DOUT_REGS     (RACKFIFO_DOUT_REGS),
                .RACKFIFO_RAM_TYPE      (RACKFIFO_RAM_TYPE),
                .RACKFIFO_LOW_DEALY     (RACKFIFO_LOW_DEALY),
                .RACKFIFO_S_REGS        (RACKFIFO_S_REGS),
                .RACKFIFO_M_REGS        (RACKFIFO_M_REGS),
                .RACK_S_REGS            (RACK_S_REGS),
                .RACK_M_REGS            (RACK_M_REGS),
                .CACKFIFO_PTR_WIDTH     (CACKFIFO_PTR_WIDTH),
                .CACKFIFO_DOUT_REGS     (CACKFIFO_DOUT_REGS),
                .CACKFIFO_RAM_TYPE      (CACKFIFO_RAM_TYPE),
                .CACKFIFO_LOW_DEALY     (CACKFIFO_LOW_DEALY),
                .CACKFIFO_S_REGS        (CACKFIFO_S_REGS),
                .CACKFIFO_M_REGS        (CACKFIFO_M_REGS),
                .CACK_S_REGS            (CACK_S_REGS),
                .CACK_M_REGS            (CACK_M_REGS),
                .WB_ADR_WIDTH           (WB_ADR_WIDTH),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH),
                .INDEX_WIDTH            (INDEX_WIDTH),
                .INIT_CTL_CONTROL       (INIT_CTL_CONTROL),
                .INIT_IRQ_ENABLE        (INIT_IRQ_ENABLE),
                .INIT_PARAM_ARADDR      (INIT_PARAM_ARADDR),
                .INIT_PARAM_ARLEN_MAX   (INIT_PARAM_ARLEN_MAX),
                .INIT_PARAM_ARLEN0      (INIT_PARAM_ARLEN0),
//              .INIT_PARAM_ARSTEP0     (INIT_PARAM_ARSTEP0),
                .INIT_PARAM_ARLEN1      (INIT_PARAM_ARLEN1),
                .INIT_PARAM_ARSTEP1     (INIT_PARAM_ARSTEP1),
                .INIT_PARAM_ARLEN2      (INIT_PARAM_ARLEN2),
                .INIT_PARAM_ARSTEP2     (INIT_PARAM_ARSTEP2),
                .INIT_PARAM_ARLEN3      (INIT_PARAM_ARLEN3),
                .INIT_PARAM_ARSTEP3     (INIT_PARAM_ARSTEP3),
                .INIT_PARAM_ARLEN4      (INIT_PARAM_ARLEN4),
                .INIT_PARAM_ARSTEP4     (INIT_PARAM_ARSTEP4),
                .INIT_PARAM_ARLEN5      (INIT_PARAM_ARLEN5),
                .INIT_PARAM_ARSTEP5     (INIT_PARAM_ARSTEP5),
                .INIT_PARAM_ARLEN6      (INIT_PARAM_ARLEN6),
                .INIT_PARAM_ARSTEP6     (INIT_PARAM_ARSTEP6),
                .INIT_PARAM_ARLEN7      (INIT_PARAM_ARLEN7),
                .INIT_PARAM_ARSTEP7     (INIT_PARAM_ARSTEP7),
                .INIT_PARAM_ARLEN8      (INIT_PARAM_ARLEN8),
                .INIT_PARAM_ARSTEP8     (INIT_PARAM_ARSTEP8),
                .INIT_PARAM_ARLEN9      (INIT_PARAM_ARLEN9),
                .INIT_PARAM_ARSTEP9     (INIT_PARAM_ARSTEP9)
            )
        i_dma_stream_read
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
                
                .s_rresetn              (s_rresetn),
                .s_rclk                 (s_rclk),
                .s_rdata                (s_rdata),
                .s_rfirst               (s_rfirst),
                .s_rlast                (s_rlast),
                .s_rvalid               (s_rvalid),
                .s_rready               (s_rready),
                
                .m_aresetn              (m_aresetn),
                .m_aclk                 (m_aclk),
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
      
    
    always @(posedge s_rclk) begin
        if ( ~s_rresetn ) begin
            s_rready <= 0;
        end
        else begin
            s_rready <= (RAND_BUSY ? {$random()} : 1'b1);
        end
    end
    
    
    integer fp;
    initial begin
        fp = $fopen("out.txt", "w");
    end
    
    always @(posedge s_rclk) begin
        if ( ~s_rresetn ) begin
        end
        else begin
            if ( s_rvalid && s_rready ) begin
                $fdisplay(fp, "%h %b %b", s_rdata, s_rfirst, s_rlast);
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
    
    reg                         writer_request = 0;
    reg                         writer_release = 0;
    wire    [ADDR_WIDTH-1:0]    writer_addr;
    wire    [1:0]               writer_index;
    
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
                
                .writer_request (writer_request),
                .writer_release (writer_release),
                .writer_addr    (writer_addr),
                .writer_index   (writer_index),
                
                .reader_request (buffer_request),
                .reader_release (buffer_release),
                .reader_addr    (buffer_addr),
                .reader_index   (),
                
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
            writer_request <= 1'b1;
            @(posedge s_wb_clk_i);
            writer_request <= 1'b0;
            @(posedge s_wb_clk_i);
            
            @(posedge s_wb_clk_i);
            while ( {$random()} % 100 != 0 )
                @(posedge s_wb_clk_i);
            
            writer_release <= 1'b1;
            @(posedge s_wb_clk_i);
            writer_release <= 1'b0;
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
    
    
    localparam  ADR_CORE_ID          = 8'h00;
    localparam  ADR_CORE_VERSION     = 8'h01;
    localparam  ADR_CORE_CONFIG      = 8'h03;
    localparam  ADR_CTL_CONTROL      = 8'h04;
    localparam  ADR_CTL_STATUS       = 8'h05;
    localparam  ADR_CTL_INDEX        = 8'h07;
    localparam  ADR_IRQ_ENABLE       = 8'h08;
    localparam  ADR_IRQ_STATUS       = 8'h09;
    localparam  ADR_IRQ_CLR          = 8'h0a;
    localparam  ADR_IRQ_SET          = 8'h0b;
    localparam  ADR_PARAM_ARADDR     = 8'h10;
    localparam  ADR_PARAM_ARLEN_MAX  = 8'h11;
    localparam  ADR_PARAM_ARLEN0     = 8'h20;
//  localparam  ADR_PARAM_ARSTEP0    = 8'h21;
    localparam  ADR_PARAM_ARLEN1     = 8'h24;
    localparam  ADR_PARAM_ARSTEP1    = 8'h25;
    localparam  ADR_PARAM_ARLEN2     = 8'h28;
    localparam  ADR_PARAM_ARSTEP2    = 8'h29;
    localparam  ADR_PARAM_ARLEN3     = 8'h2c;
    localparam  ADR_PARAM_ARSTEP3    = 8'h2d;
    localparam  ADR_PARAM_ARLEN4     = 8'h30;
    localparam  ADR_PARAM_ARSTEP4    = 8'h31;
    localparam  ADR_PARAM_ARLEN5     = 8'h34;
    localparam  ADR_PARAM_ARSTEP5    = 8'h35;
    localparam  ADR_PARAM_ARLEN6     = 8'h38;
    localparam  ADR_PARAM_ARSTEP6    = 8'h39;
    localparam  ADR_PARAM_ARLEN7     = 8'h3c;
    localparam  ADR_PARAM_ARSTEP7    = 8'h3d;
    localparam  ADR_PARAM_ARLEN8     = 8'h30;
    localparam  ADR_PARAM_ARSTEP8    = 8'h31;
    localparam  ADR_PARAM_ARLEN9     = 8'h44;
    localparam  ADR_PARAM_ARSTEP9    = 8'h45;
    localparam  ADR_SHADOW_ARADDR    = 8'h90;
    localparam  ADR_SHADOW_ARLEN_MAX = 8'h91;
    localparam  ADR_SHADOW_ARLEN0    = 8'ha0;
//  localparam  ADR_SHADOW_ARSTEP0   = 8'ha1;
    localparam  ADR_SHADOW_ARLEN1    = 8'ha4;
    localparam  ADR_SHADOW_ARSTEP1   = 8'ha5;
    localparam  ADR_SHADOW_ARLEN2    = 8'ha8;
    localparam  ADR_SHADOW_ARSTEP2   = 8'ha9;
    localparam  ADR_SHADOW_ARLEN3    = 8'hac;
    localparam  ADR_SHADOW_ARSTEP3   = 8'had;
    localparam  ADR_SHADOW_ARLEN4    = 8'hb0;
    localparam  ADR_SHADOW_ARSTEP4   = 8'hb1;
    localparam  ADR_SHADOW_ARLEN5    = 8'hb4;
    localparam  ADR_SHADOW_ARSTEP5   = 8'hb5;
    localparam  ADR_SHADOW_ARLEN6    = 8'hb8;
    localparam  ADR_SHADOW_ARSTEP6   = 8'hb9;
    localparam  ADR_SHADOW_ARLEN7    = 8'hbc;
    localparam  ADR_SHADOW_ARSTEP7   = 8'hbd;
    localparam  ADR_SHADOW_ARLEN8    = 8'hb0;
    localparam  ADR_SHADOW_ARSTEP8   = 8'hb1;
    localparam  ADR_SHADOW_ARLEN9    = 8'hc4;
    localparam  ADR_SHADOW_ARSTEP9   = 8'hc5;
    
    
    initial begin
        #(WB_RATE*200);
        
        $display("start");
        wb_read(ADR_CORE_ID);
        wb_read(ADR_CORE_VERSION);
        wb_read(ADR_CORE_CONFIG);
        
        wb_write(ADR_PARAM_ARADDR,    32'h1000_0000, 8'hff);
        wb_write(ADR_PARAM_ARLEN_MAX, 32'h0000_0003, 8'hff);
        wb_write(ADR_PARAM_ARLEN0,             17-1, 8'hff);
        wb_write(ADR_PARAM_ARLEN1,              3-1, 8'hff);
        wb_write(ADR_PARAM_ARLEN2,              2-1, 8'hff);
        wb_write(ADR_PARAM_ARSTEP1,   32'h0000_0200, 8'hff);
        wb_write(ADR_PARAM_ARSTEP2,   32'h0001_0000, 8'hff);
        
        wb_write(ADR_CTL_CONTROL,     32'h0000_000b, 8'hff);
//      wb_write(ADR_CTL_CONTROL,     32'h0000_0007, 8'hff);    // 1-shot
        
        #40000;
        
        wb_write(ADR_CTL_CONTROL,     32'h0000_0000, 8'hff);
        
        #20000;
            $finish();
    end
    
    
endmodule


`default_nettype wire


// end of file
