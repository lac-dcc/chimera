
`timescale 1ns / 1ps
`default_nettype none


module tb_vdma_axi4s_to_axi4s();
    localparam WB_RATE      = 1000.0 /  50.1;
    localparam S_AXI4S_RATE = 1000.0 /  75.2;
    localparam M_AXI4S_RATE = 1000.0 / 150.3;
    localparam AXI4_RATE    = 1000.0 / 200.4;
    localparam TRIG_RATE    = 1000.0 / 100.5;
    
    initial begin
        $dumpfile("tb_vdma_axi4s_to_axi4s.vcd");
        $dumpvars(0, tb_vdma_axi4s_to_axi4s);
        
        #1000000;
            $finish;
    end
    
    reg     wb_clk = 1'b1;
    always #(WB_RATE/2.0)       wb_clk = ~wb_clk;
    
    reg     s_axi4s_clk = 1'b1;
    always #(S_AXI4S_RATE/2.0)  s_axi4s_clk = ~s_axi4s_clk;
    
    reg     m_axi4s_clk = 1'b1;
    always #(M_AXI4S_RATE/2.0)  m_axi4s_clk = ~m_axi4s_clk;
    
    reg     axi4_clk = 1'b1;
    always #(AXI4_RATE/2.0)     axi4_clk = ~axi4_clk;
    
    reg     trig_clk = 1'b1;
    always #(TRIG_RATE/2.0)     trig_clk = ~trig_clk;
    
    reg     reset = 1'b1;
    initial #(WB_RATE*100)  reset = 1'b0;
    
    
    localparam  RAND_BUSY = 0;
    
    localparam  X_NUM     = 64;
    localparam  Y_NUM     = 48;
    
    
    
    // -----------------------------------------
    //  TOP
    // -----------------------------------------
    
    parameter   CORE_ID              = 32'habcd_0000;
    parameter   CORE_VERSION         = 32'h0000_0000;
    
    parameter   WASYNC               = 1;
    parameter   WFIFO_PTR_WIDTH      = 9;
    parameter   WPIXEL_SIZE          = 2;   // 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
    
    parameter   RASYNC               = 1;
    parameter   RFIFO_PTR_WIDTH      = 9;
    parameter   RPIXEL_SIZE          = 2;   // 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
    
    parameter   AXI4_ID_WIDTH        = 6;
    parameter   AXI4_ADDR_WIDTH      = 32;
    parameter   AXI4_DATA_SIZE       = 2;   // 0:8bit; 1:16bit; 2:32bit ...
    parameter   AXI4_DATA_WIDTH      = (8 << AXI4_DATA_SIZE);
    parameter   AXI4_STRB_WIDTH      = (1 << AXI4_DATA_SIZE);
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
    
    parameter   AXI4_ARID            = {AXI4_ID_WIDTH{1'b0}};
    parameter   AXI4_ARSIZE          = AXI4_DATA_SIZE;
    parameter   AXI4_ARBURST         = 2'b01;
    parameter   AXI4_ARLOCK          = 1'b0;
    parameter   AXI4_ARCACHE         = 4'b0001;
    parameter   AXI4_ARPROT          = 3'b000;
    parameter   AXI4_ARQOS           = 0;
    parameter   AXI4_ARREGION        = 4'b0000;
    
    parameter   AXI4S_S_DATA_SIZE    = 2;   // 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
    parameter   AXI4S_S_DATA_WIDTH   = (8 << AXI4S_S_DATA_SIZE);
    parameter   AXI4S_S_USER_WIDTH   = 1;
    
    parameter   AXI4S_M_DATA_SIZE    = 2;   // 0:8bit; 1:16bit; 2:32bit; 3:64bit ...
    parameter   AXI4S_M_DATA_WIDTH   = (8 << AXI4S_M_DATA_SIZE);
    parameter   AXI4S_M_USER_WIDTH   = 1;
    
    parameter   AXI4_AW_REGS         = 1;
    parameter   AXI4_W_REGS          = 1;
    parameter   AXI4S_S_REGS         = 1;
    
    parameter   AXI4_AR_REGS         = 1;
    parameter   AXI4_R_REGS          = 1;
    parameter   AXI4S_M_REGS         = 1;

    parameter   INDEX_WIDTH          = 8;
    parameter   STRIDE_WIDTH         = 14;
    parameter   H_WIDTH              = 10;
    parameter   V_WIDTH              = 10;
    parameter   SIZE_WIDTH           = H_WIDTH + V_WIDTH;
    
    parameter   WIDLE_SKIP           = 0;
    parameter   WPACKET_ENABLE       = (WFIFO_PTR_WIDTH >= AXI4_LEN_WIDTH);
    parameter   WISSUE_COUNTER_WIDTH = 10;
    
    parameter   RLIMITTER_ENABLE     = 0;
    parameter   RLIMITTER_MARGINE    = 4;
    parameter   RISSUE_COUNTER_WIDTH = 10;
    
    parameter   WB_ADR_WIDTH         = 8;
    parameter   WB_DAT_WIDTH         = 32;
    parameter   WB_SEL_WIDTH         = (WB_DAT_WIDTH / 8);
    
    parameter   TRIG_ASYNC           = 1;   // WISHBONEと非同期の場合
    parameter   TRIG_WSTART_ENABLE   = 1;
    parameter   TRIG_RSTART_ENABLE   = 1;
    
    parameter   INIT_CTL_AUTOFLIP    = 2'b11;
    parameter   INIT_PARAM_ADDR0     = 32'h0000_0000;
    parameter   INIT_PARAM_ADDR1     = 32'h0010_0000;
    parameter   INIT_PARAM_ADDR2     = 32'h0020_0000;
    
    parameter   INIT_WCTL_CONTROL    = 4'b1011;
    parameter   INIT_WPARAM_ADDR     = 32'h0000_0000;
    parameter   INIT_WPARAM_STRIDE   = 4096;
    parameter   INIT_WPARAM_WIDTH    = X_NUM;
    parameter   INIT_WPARAM_HEIGHT   = Y_NUM;
    parameter   INIT_WPARAM_SIZE     = INIT_WPARAM_WIDTH * INIT_WPARAM_HEIGHT;
    parameter   INIT_WPARAM_AWLEN    = 7;
    
    parameter   INIT_RCTL_CONTROL    = 4'b1011;
    parameter   INIT_RPARAM_ADDR     = 32'h0000_0000;
    parameter   INIT_RPARAM_STRIDE   = 4096;
    parameter   INIT_RPARAM_WIDTH    = X_NUM;
    parameter   INIT_RPARAM_HEIGHT   = Y_NUM;
    parameter   INIT_RPARAM_SIZE     = INIT_RPARAM_WIDTH * INIT_RPARAM_HEIGHT;
    parameter   INIT_RPARAM_ARLEN    = 7;
    
    
    // master AXI4
    wire                                m_axi4_aresetn = ~reset;
    wire                                m_axi4_aclk    = axi4_clk;
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_awid;
    wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_awaddr;
    wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_awlen;
    wire    [2:0]                       m_axi4_awsize;
    wire    [1:0]                       m_axi4_awburst;
    wire    [0:0]                       m_axi4_awlock;
    wire    [3:0]                       m_axi4_awcache;
    wire    [2:0]                       m_axi4_awprot;
    wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_awqos;
    wire    [3:0]                       m_axi4_awregion;
    wire                                m_axi4_awvalid;
    wire                                m_axi4_awready;
    wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_wdata;
    wire    [AXI4_STRB_WIDTH-1:0]       m_axi4_wstrb;
    wire                                m_axi4_wlast;
    wire                                m_axi4_wvalid;
    wire                                m_axi4_wready;
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_bid;
    wire    [1:0]                       m_axi4_bresp;
    wire                                m_axi4_bvalid;
    wire                                m_axi4_bready;
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_arid;
    wire    [AXI4_ADDR_WIDTH-1:0]       m_axi4_araddr;
    wire    [AXI4_LEN_WIDTH-1:0]        m_axi4_arlen;
    wire    [2:0]                       m_axi4_arsize;
    wire    [1:0]                       m_axi4_arburst;
    wire    [0:0]                       m_axi4_arlock;
    wire    [3:0]                       m_axi4_arcache;
    wire    [2:0]                       m_axi4_arprot;
    wire    [AXI4_QOS_WIDTH-1:0]        m_axi4_arqos;
    wire    [3:0]                       m_axi4_arregion;
    wire                                m_axi4_arvalid;
    wire                                m_axi4_arready;
    wire    [AXI4_ID_WIDTH-1:0]         m_axi4_rid;
    wire    [AXI4_DATA_WIDTH-1:0]       m_axi4_rdata;
    wire    [1:0]                       m_axi4_rresp;
    wire                                m_axi4_rlast;
    wire                                m_axi4_rvalid;
    wire                                m_axi4_rready;
    
    wire                                s_axi4s_aresetn = ~reset;
    wire                                s_axi4s_aclk    = s_axi4s_clk;
    wire    [AXI4S_S_DATA_WIDTH-1:0]    s_axi4s_tdata;
    wire                                s_axi4s_tlast;
    wire    [AXI4S_S_USER_WIDTH-1:0]    s_axi4s_tuser;
    wire                                s_axi4s_tvalid;
    wire                                s_axi4s_tready;
    
    wire                                m_axi4s_aresetn = ~reset;
    wire                                m_axi4s_aclk    = m_axi4s_clk;
    wire    [AXI4S_M_DATA_WIDTH-1:0]    m_axi4s_tdata;
    wire                                m_axi4s_tlast;
    wire    [AXI4S_M_USER_WIDTH-1:0]    m_axi4s_tuser;
    wire                                m_axi4s_tvalid;
    reg                                 m_axi4s_tready = 1;
    
    wire                                s_wb_rst_i = reset;
    wire                                s_wb_clk_i = wb_clk;
    reg     [WB_ADR_WIDTH-1:0]          s_wb_adr_i;
    reg     [WB_DAT_WIDTH-1:0]          s_wb_dat_i;
    wire    [WB_DAT_WIDTH-1:0]          s_wb_dat_o;
    reg                                 s_wb_we_i;
    reg     [WB_SEL_WIDTH-1:0]          s_wb_sel_i;
    reg                                 s_wb_stb_i = 0;
    wire                                s_wb_ack_o;
    wire                                out_wirq;
    wire                                out_rirq;
    
    wire                                trig_reset = reset;
//  wire                                trig_clk;
    reg                                 trig_wstart = 0;
    reg                                 trig_rstart = 0;
    
    jelly_vdma_axi4s_to_axi4s
            #(
                .CORE_ID                (CORE_ID              ),
                .CORE_VERSION           (CORE_VERSION         ),
                
                .WASYNC                 (WASYNC               ),
                .WFIFO_PTR_WIDTH        (WFIFO_PTR_WIDTH      ),
                .WPIXEL_SIZE            (WPIXEL_SIZE          ),
                
                .RASYNC                 (RASYNC               ),
                .RFIFO_PTR_WIDTH        (RFIFO_PTR_WIDTH      ),
                .RPIXEL_SIZE            (RPIXEL_SIZE          ),
                
                .AXI4_ID_WIDTH          (AXI4_ID_WIDTH        ),
                .AXI4_ADDR_WIDTH        (AXI4_ADDR_WIDTH      ),
                .AXI4_DATA_SIZE         (AXI4_DATA_SIZE       ),
                .AXI4_DATA_WIDTH        (AXI4_DATA_WIDTH      ),
                .AXI4_STRB_WIDTH        (AXI4_STRB_WIDTH      ),
                .AXI4_LEN_WIDTH         (AXI4_LEN_WIDTH       ),
                .AXI4_QOS_WIDTH         (AXI4_QOS_WIDTH       ),
                
                .AXI4_AWID              (AXI4_AWID            ),
                .AXI4_AWSIZE            (AXI4_AWSIZE          ),
                .AXI4_AWBURST           (AXI4_AWBURST         ),
                .AXI4_AWLOCK            (AXI4_AWLOCK          ),
                .AXI4_AWCACHE           (AXI4_AWCACHE         ),
                .AXI4_AWPROT            (AXI4_AWPROT          ),
                .AXI4_AWQOS             (AXI4_AWQOS           ),
                .AXI4_AWREGION          (AXI4_AWREGION        ),
                
                .AXI4_ARID              (AXI4_ARID            ),
                .AXI4_ARSIZE            (AXI4_ARSIZE          ),
                .AXI4_ARBURST           (AXI4_ARBURST         ),
                .AXI4_ARLOCK            (AXI4_ARLOCK          ),
                .AXI4_ARCACHE           (AXI4_ARCACHE         ),
                .AXI4_ARPROT            (AXI4_ARPROT          ),
                .AXI4_ARQOS             (AXI4_ARQOS           ),
                .AXI4_ARREGION          (AXI4_ARREGION        ),
                
                .AXI4S_S_DATA_SIZE      (AXI4S_S_DATA_SIZE    ),
                .AXI4S_S_DATA_WIDTH     (AXI4S_S_DATA_WIDTH   ),
                .AXI4S_S_USER_WIDTH     (AXI4S_S_USER_WIDTH   ),
                
                .AXI4S_M_DATA_SIZE      (AXI4S_M_DATA_SIZE    ),
                .AXI4S_M_DATA_WIDTH     (AXI4S_M_DATA_WIDTH   ),
                .AXI4S_M_USER_WIDTH     (AXI4S_M_USER_WIDTH   ),
                
                .AXI4_AW_REGS           (AXI4_AW_REGS         ),
                .AXI4_W_REGS            (AXI4_W_REGS          ),
                .AXI4S_S_REGS           (AXI4S_S_REGS         ),
                
                .AXI4_AR_REGS           (AXI4_AR_REGS         ),
                .AXI4_R_REGS            (AXI4_R_REGS          ),
                .AXI4S_M_REGS           (AXI4S_M_REGS         ),
                
                .INDEX_WIDTH            (INDEX_WIDTH          ),
                .STRIDE_WIDTH           (STRIDE_WIDTH         ),
                .H_WIDTH                (H_WIDTH              ),
                .V_WIDTH                (V_WIDTH              ),
                .SIZE_WIDTH             (SIZE_WIDTH           ),
                
                .WIDLE_SKIP             (WIDLE_SKIP           ),
                .WPACKET_ENABLE         (WPACKET_ENABLE       ),
                .WISSUE_COUNTER_WIDTH   (WISSUE_COUNTER_WIDTH ),
                
                .RLIMITTER_ENABLE       (RLIMITTER_ENABLE     ),
                .RLIMITTER_MARGINE      (RLIMITTER_MARGINE    ),
                .RISSUE_COUNTER_WIDTH   (RISSUE_COUNTER_WIDTH ),
                
                .WB_ADR_WIDTH           (WB_ADR_WIDTH         ),
                .WB_DAT_WIDTH           (WB_DAT_WIDTH         ),
                .WB_SEL_WIDTH           (WB_SEL_WIDTH         ),
                
                .TRIG_ASYNC             (TRIG_ASYNC           ),
                .TRIG_WSTART_ENABLE     (TRIG_WSTART_ENABLE   ),
                .TRIG_RSTART_ENABLE     (TRIG_RSTART_ENABLE   ),
                
                .INIT_CTL_AUTOFLIP      (INIT_CTL_AUTOFLIP    ),
                .INIT_PARAM_ADDR0       (INIT_PARAM_ADDR0     ),
                .INIT_PARAM_ADDR1       (INIT_PARAM_ADDR1     ),
                .INIT_PARAM_ADDR2       (INIT_PARAM_ADDR2     ),
                
                .INIT_WCTL_CONTROL      (INIT_WCTL_CONTROL    ),
                .INIT_WPARAM_ADDR       (INIT_WPARAM_ADDR     ),
                .INIT_WPARAM_STRIDE     (INIT_WPARAM_STRIDE   ),
                .INIT_WPARAM_WIDTH      (INIT_WPARAM_WIDTH    ),
                .INIT_WPARAM_HEIGHT     (INIT_WPARAM_HEIGHT   ),
                .INIT_WPARAM_SIZE       (INIT_WPARAM_SIZE     ),
                .INIT_WPARAM_AWLEN      (INIT_WPARAM_AWLEN    ),
                
                .INIT_RCTL_CONTROL      (INIT_RCTL_CONTROL    ),
                .INIT_RPARAM_ADDR       (INIT_RPARAM_ADDR     ),
                .INIT_RPARAM_STRIDE     (INIT_RPARAM_STRIDE   ),
                .INIT_RPARAM_WIDTH      (INIT_RPARAM_WIDTH    ),
                .INIT_RPARAM_HEIGHT     (INIT_RPARAM_HEIGHT   ),
                .INIT_RPARAM_SIZE       (INIT_RPARAM_SIZE     ),
                .INIT_RPARAM_ARLEN      (INIT_RPARAM_ARLEN    )
            )
        i_vdma_axi4s_to_axi4s
            (
                .m_axi4_aresetn         (m_axi4_aresetn ),
                .m_axi4_aclk            (m_axi4_aclk    ),
                
                .m_axi4_awid            (m_axi4_awid    ),
                .m_axi4_awaddr          (m_axi4_awaddr  ),
                .m_axi4_awlen           (m_axi4_awlen   ),
                .m_axi4_awsize          (m_axi4_awsize  ),
                .m_axi4_awburst         (m_axi4_awburst ),
                .m_axi4_awlock          (m_axi4_awlock  ),
                .m_axi4_awcache         (m_axi4_awcache ),
                .m_axi4_awprot          (m_axi4_awprot  ),
                .m_axi4_awqos           (m_axi4_awqos   ),
                .m_axi4_awregion        (m_axi4_awregion),
                .m_axi4_awvalid         (m_axi4_awvalid ),
                .m_axi4_awready         (m_axi4_awready ),
                .m_axi4_wdata           (m_axi4_wdata   ),
                .m_axi4_wstrb           (m_axi4_wstrb   ),
                .m_axi4_wlast           (m_axi4_wlast   ),
                .m_axi4_wvalid          (m_axi4_wvalid  ),
                .m_axi4_wready          (m_axi4_wready  ),
                .m_axi4_bid             (m_axi4_bid     ),
                .m_axi4_bresp           (m_axi4_bresp   ),
                .m_axi4_bvalid          (m_axi4_bvalid  ),
                .m_axi4_bready          (m_axi4_bready  ),
                
                .m_axi4_arid            (m_axi4_arid    ),
                .m_axi4_araddr          (m_axi4_araddr  ),
                .m_axi4_arlen           (m_axi4_arlen   ),
                .m_axi4_arsize          (m_axi4_arsize  ),
                .m_axi4_arburst         (m_axi4_arburst ),
                .m_axi4_arlock          (m_axi4_arlock  ),
                .m_axi4_arcache         (m_axi4_arcache ),
                .m_axi4_arprot          (m_axi4_arprot  ),
                .m_axi4_arqos           (m_axi4_arqos   ),
                .m_axi4_arregion        (m_axi4_arregion),
                .m_axi4_arvalid         (m_axi4_arvalid ),
                .m_axi4_arready         (m_axi4_arready ),
                .m_axi4_rid             (m_axi4_rid     ),
                .m_axi4_rdata           (m_axi4_rdata   ),
                .m_axi4_rresp           (m_axi4_rresp   ),
                .m_axi4_rlast           (m_axi4_rlast   ),
                .m_axi4_rvalid          (m_axi4_rvalid  ),
                .m_axi4_rready          (m_axi4_rready  ),
                
                .s_axi4s_aresetn        (s_axi4s_aresetn),
                .s_axi4s_aclk           (s_axi4s_aclk   ),
                .s_axi4s_tdata          (s_axi4s_tdata  ),
                .s_axi4s_tlast          (s_axi4s_tlast  ),
                .s_axi4s_tuser          (s_axi4s_tuser  ),
                .s_axi4s_tvalid         (s_axi4s_tvalid ),
                .s_axi4s_tready         (s_axi4s_tready ),
                
                .m_axi4s_aresetn        (m_axi4s_aresetn),
                .m_axi4s_aclk           (m_axi4s_aclk   ),
                .m_axi4s_tdata          (m_axi4s_tdata  ),
                .m_axi4s_tlast          (m_axi4s_tlast  ),
                .m_axi4s_tuser          (m_axi4s_tuser  ),
                .m_axi4s_tvalid         (m_axi4s_tvalid ),
                .m_axi4s_tready         (m_axi4s_tready ),
                
                .s_wb_rst_i             (s_wb_rst_i     ),
                .s_wb_clk_i             (s_wb_clk_i     ),
                .s_wb_adr_i             (s_wb_adr_i     ),
                .s_wb_dat_i             (s_wb_dat_i     ),
                .s_wb_dat_o             (s_wb_dat_o     ),
                .s_wb_we_i              (s_wb_we_i      ),
                .s_wb_sel_i             (s_wb_sel_i     ),
                .s_wb_stb_i             (s_wb_stb_i     ),
                .s_wb_ack_o             (s_wb_ack_o     ),
                .out_wirq               (out_wirq       ),
                .out_rirq               (out_rirq       ),
                
                .trig_reset             (trig_reset     ),
                .trig_clk               (trig_clk       ),
                .trig_wstart            (trig_wstart    ),
                .trig_rstart            (trig_rstart    )
            );
    
    
    // -----------------------------------------
    //  triger
    // -----------------------------------------
    
    reg     [31:0]      reg_trg_wcount;
    reg     [31:0]      reg_trg_rcount;
    always @(posedge trig_clk) begin
        if ( trig_reset ) begin
            reg_trg_wcount <= 0;
            reg_trg_rcount <= 0;
        end
        else begin
            trig_wstart   <= (reg_trg_wcount == 0);
            trig_rstart   <= (reg_trg_rcount == 0);
            
            reg_trg_wcount <= reg_trg_wcount - 1;
            if ( reg_trg_wcount == 0) begin
                reg_trg_wcount <= 8000;
            end
            
            reg_trg_rcount <= reg_trg_rcount - 1;
            if ( reg_trg_rcount == 0) begin
                reg_trg_rcount <= 7000;
            end
        end
    end
    
    
    // ---------------------------------
    //  dummy video model
    // ---------------------------------
    
    jelly_axi4s_master_model
            #(
                .AXI4S_DATA_WIDTH   (AXI4S_S_DATA_WIDTH),
                .X_NUM              (X_NUM),
                .Y_NUM              (Y_NUM),
                .PPM_FILE           ("image.ppm"),
                .BUSY_RATE          (RAND_BUSY ? 5 : 0)
            )
        i_axi4s_master_model
            (
                .aresetn            (s_axi4s_aresetn),
                .aclk               (s_axi4s_aclk),
                
                .m_axi4s_tuser      (s_axi4s_tuser),
                .m_axi4s_tlast      (s_axi4s_tlast),
                .m_axi4s_tdata      (s_axi4s_tdata),
                .m_axi4s_tvalid     (s_axi4s_tvalid),
                .m_axi4s_tready     (s_axi4s_tready)
            );
    
    
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
                .AXI_STRB_WIDTH         (AXI4_STRB_WIDTH),
                .MEM_WIDTH              (24),
                
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
                .aresetn                (m_axi4_aresetn),
                .aclk                   (m_axi4_aclk),
                
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
