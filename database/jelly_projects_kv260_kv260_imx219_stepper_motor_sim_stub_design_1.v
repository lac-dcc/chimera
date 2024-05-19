// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
   (i2c_scl_i,
    i2c_scl_o,
    i2c_scl_t,
    i2c_sda_i,
    i2c_sda_o,
    i2c_sda_t,
    m_axi4l_peri_aclk,
    m_axi4l_peri_araddr,
    m_axi4l_peri_aresetn,
    m_axi4l_peri_arprot,
    m_axi4l_peri_arready,
    m_axi4l_peri_arvalid,
    m_axi4l_peri_awaddr,
    m_axi4l_peri_awprot,
    m_axi4l_peri_awready,
    m_axi4l_peri_awvalid,
    m_axi4l_peri_bready,
    m_axi4l_peri_bresp,
    m_axi4l_peri_bvalid,
    m_axi4l_peri_rdata,
    m_axi4l_peri_rready,
    m_axi4l_peri_rresp,
    m_axi4l_peri_rvalid,
    m_axi4l_peri_wdata,
    m_axi4l_peri_wready,
    m_axi4l_peri_wstrb,
    m_axi4l_peri_wvalid,
    m_axi4l_rpu_aclk,
    m_axi4l_rpu_araddr,
    m_axi4l_rpu_aresetn,
    m_axi4l_rpu_arprot,
    m_axi4l_rpu_arready,
    m_axi4l_rpu_arvalid,
    m_axi4l_rpu_awaddr,
    m_axi4l_rpu_awprot,
    m_axi4l_rpu_awready,
    m_axi4l_rpu_awvalid,
    m_axi4l_rpu_bready,
    m_axi4l_rpu_bresp,
    m_axi4l_rpu_bvalid,
    m_axi4l_rpu_rdata,
    m_axi4l_rpu_rready,
    m_axi4l_rpu_rresp,
    m_axi4l_rpu_rvalid,
    m_axi4l_rpu_wdata,
    m_axi4l_rpu_wready,
    m_axi4l_rpu_wstrb,
    m_axi4l_rpu_wvalid,
    nfiq0_lpd_rpu,
    nfiq1_lpd_rpu,
    nirq0_lpd_rpu,
    nirq1_lpd_rpu,
    out_clk100,
    out_clk200,
    out_clk250,
    out_reset,
    s_axi4_mem0_araddr,
    s_axi4_mem0_arburst,
    s_axi4_mem0_arcache,
    s_axi4_mem0_arid,
    s_axi4_mem0_arlen,
    s_axi4_mem0_arlock,
    s_axi4_mem0_arprot,
    s_axi4_mem0_arqos,
    s_axi4_mem0_arready,
    s_axi4_mem0_arsize,
    s_axi4_mem0_aruser,
    s_axi4_mem0_arvalid,
    s_axi4_mem0_awaddr,
    s_axi4_mem0_awburst,
    s_axi4_mem0_awcache,
    s_axi4_mem0_awid,
    s_axi4_mem0_awlen,
    s_axi4_mem0_awlock,
    s_axi4_mem0_awprot,
    s_axi4_mem0_awqos,
    s_axi4_mem0_awready,
    s_axi4_mem0_awsize,
    s_axi4_mem0_awuser,
    s_axi4_mem0_awvalid,
    s_axi4_mem0_bid,
    s_axi4_mem0_bready,
    s_axi4_mem0_bresp,
    s_axi4_mem0_bvalid,
    s_axi4_mem0_rdata,
    s_axi4_mem0_rid,
    s_axi4_mem0_rlast,
    s_axi4_mem0_rready,
    s_axi4_mem0_rresp,
    s_axi4_mem0_rvalid,
    s_axi4_mem0_wdata,
    s_axi4_mem0_wlast,
    s_axi4_mem0_wready,
    s_axi4_mem0_wstrb,
    s_axi4_mem0_wvalid,
    s_axi4_mem_aclk,
    s_axi4_mem_aresetn);
  input i2c_scl_i;
  output i2c_scl_o;
  output i2c_scl_t;
  input i2c_sda_i;
  output i2c_sda_o;
  output i2c_sda_t;
  output m_axi4l_peri_aclk;
  output [39:0]m_axi4l_peri_araddr;
  output [0:0]m_axi4l_peri_aresetn;
  output [2:0]m_axi4l_peri_arprot;
  input m_axi4l_peri_arready;
  output m_axi4l_peri_arvalid;
  output [39:0]m_axi4l_peri_awaddr;
  output [2:0]m_axi4l_peri_awprot;
  input m_axi4l_peri_awready;
  output m_axi4l_peri_awvalid;
  output m_axi4l_peri_bready;
  input [1:0]m_axi4l_peri_bresp;
  input m_axi4l_peri_bvalid;
  input [63:0]m_axi4l_peri_rdata;
  output m_axi4l_peri_rready;
  input [1:0]m_axi4l_peri_rresp;
  input m_axi4l_peri_rvalid;
  output [63:0]m_axi4l_peri_wdata;
  input m_axi4l_peri_wready;
  output [7:0]m_axi4l_peri_wstrb;
  output m_axi4l_peri_wvalid;
  output m_axi4l_rpu_aclk;
  output [39:0]m_axi4l_rpu_araddr;
  output [0:0]m_axi4l_rpu_aresetn;
  output [2:0]m_axi4l_rpu_arprot;
  input m_axi4l_rpu_arready;
  output m_axi4l_rpu_arvalid;
  output [39:0]m_axi4l_rpu_awaddr;
  output [2:0]m_axi4l_rpu_awprot;
  input m_axi4l_rpu_awready;
  output m_axi4l_rpu_awvalid;
  output m_axi4l_rpu_bready;
  input [1:0]m_axi4l_rpu_bresp;
  input m_axi4l_rpu_bvalid;
  input [31:0]m_axi4l_rpu_rdata;
  output m_axi4l_rpu_rready;
  input [1:0]m_axi4l_rpu_rresp;
  input m_axi4l_rpu_rvalid;
  output [31:0]m_axi4l_rpu_wdata;
  input m_axi4l_rpu_wready;
  output [3:0]m_axi4l_rpu_wstrb;
  output m_axi4l_rpu_wvalid;
  input nfiq0_lpd_rpu;
  input nfiq1_lpd_rpu;
  input nirq0_lpd_rpu;
  input nirq1_lpd_rpu;
  output out_clk100;
  output out_clk200;
  output out_clk250;
  output [0:0]out_reset;
  input [48:0]s_axi4_mem0_araddr;
  input [1:0]s_axi4_mem0_arburst;
  input [3:0]s_axi4_mem0_arcache;
  input [5:0]s_axi4_mem0_arid;
  input [7:0]s_axi4_mem0_arlen;
  input s_axi4_mem0_arlock;
  input [2:0]s_axi4_mem0_arprot;
  input [3:0]s_axi4_mem0_arqos;
  output s_axi4_mem0_arready;
  input [2:0]s_axi4_mem0_arsize;
  input s_axi4_mem0_aruser;
  input s_axi4_mem0_arvalid;
  input [48:0]s_axi4_mem0_awaddr;
  input [1:0]s_axi4_mem0_awburst;
  input [3:0]s_axi4_mem0_awcache;
  input [5:0]s_axi4_mem0_awid;
  input [7:0]s_axi4_mem0_awlen;
  input s_axi4_mem0_awlock;
  input [2:0]s_axi4_mem0_awprot;
  input [3:0]s_axi4_mem0_awqos;
  output s_axi4_mem0_awready;
  input [2:0]s_axi4_mem0_awsize;
  input s_axi4_mem0_awuser;
  input s_axi4_mem0_awvalid;
  output [5:0]s_axi4_mem0_bid;
  input s_axi4_mem0_bready;
  output [1:0]s_axi4_mem0_bresp;
  output s_axi4_mem0_bvalid;
  output [127:0]s_axi4_mem0_rdata;
  output [5:0]s_axi4_mem0_rid;
  output s_axi4_mem0_rlast;
  input s_axi4_mem0_rready;
  output [1:0]s_axi4_mem0_rresp;
  output s_axi4_mem0_rvalid;
  input [127:0]s_axi4_mem0_wdata;
  input s_axi4_mem0_wlast;
  output s_axi4_mem0_wready;
  input [15:0]s_axi4_mem0_wstrb;
  input s_axi4_mem0_wvalid;
  output s_axi4_mem_aclk;
  output [0:0]s_axi4_mem_aresetn;

  wire i2c_scl_i;
  wire i2c_scl_io;
  wire i2c_scl_o;
  wire i2c_scl_t;
  wire i2c_sda_i;
  wire i2c_sda_io;
  wire i2c_sda_o;
  wire i2c_sda_t;
  wire m_axi4l_peri_aclk;
  wire [39:0]m_axi4l_peri_araddr;
  wire [0:0]m_axi4l_peri_aresetn;
  wire [2:0]m_axi4l_peri_arprot;
  wire m_axi4l_peri_arready;
  wire m_axi4l_peri_arvalid;
  wire [39:0]m_axi4l_peri_awaddr;
  wire [2:0]m_axi4l_peri_awprot;
  wire m_axi4l_peri_awready;
  wire m_axi4l_peri_awvalid;
  wire m_axi4l_peri_bready;
  wire [1:0]m_axi4l_peri_bresp;
  wire m_axi4l_peri_bvalid;
  wire [63:0]m_axi4l_peri_rdata;
  wire m_axi4l_peri_rready;
  wire [1:0]m_axi4l_peri_rresp;
  wire m_axi4l_peri_rvalid;
  wire [63:0]m_axi4l_peri_wdata;
  wire m_axi4l_peri_wready;
  wire [7:0]m_axi4l_peri_wstrb;
  wire m_axi4l_peri_wvalid;
  wire m_axi4l_rpu_aclk;
  wire [39:0]m_axi4l_rpu_araddr;
  wire [0:0]m_axi4l_rpu_aresetn;
  wire [2:0]m_axi4l_rpu_arprot;
  wire m_axi4l_rpu_arready;
  wire m_axi4l_rpu_arvalid;
  wire [39:0]m_axi4l_rpu_awaddr;
  wire [2:0]m_axi4l_rpu_awprot;
  wire m_axi4l_rpu_awready;
  wire m_axi4l_rpu_awvalid;
  wire m_axi4l_rpu_bready;
  wire [1:0]m_axi4l_rpu_bresp;
  wire m_axi4l_rpu_bvalid;
  wire [31:0]m_axi4l_rpu_rdata;
  wire m_axi4l_rpu_rready;
  wire [1:0]m_axi4l_rpu_rresp;
  wire m_axi4l_rpu_rvalid;
  wire [31:0]m_axi4l_rpu_wdata;
  wire m_axi4l_rpu_wready;
  wire [3:0]m_axi4l_rpu_wstrb;
  wire m_axi4l_rpu_wvalid;
  wire nfiq0_lpd_rpu;
  wire nfiq1_lpd_rpu;
  wire nirq0_lpd_rpu;
  wire nirq1_lpd_rpu;
  wire out_clk100;
  wire out_clk200;
  wire out_clk250;
  wire [0:0]out_reset;
  wire [48:0]s_axi4_mem0_araddr;
  wire [1:0]s_axi4_mem0_arburst;
  wire [3:0]s_axi4_mem0_arcache;
  wire [5:0]s_axi4_mem0_arid;
  wire [7:0]s_axi4_mem0_arlen;
  wire s_axi4_mem0_arlock;
  wire [2:0]s_axi4_mem0_arprot;
  wire [3:0]s_axi4_mem0_arqos;
  wire s_axi4_mem0_arready;
  wire [2:0]s_axi4_mem0_arsize;
  wire s_axi4_mem0_aruser;
  wire s_axi4_mem0_arvalid;
  wire [48:0]s_axi4_mem0_awaddr;
  wire [1:0]s_axi4_mem0_awburst;
  wire [3:0]s_axi4_mem0_awcache;
  wire [5:0]s_axi4_mem0_awid;
  wire [7:0]s_axi4_mem0_awlen;
  wire s_axi4_mem0_awlock;
  wire [2:0]s_axi4_mem0_awprot;
  wire [3:0]s_axi4_mem0_awqos;
  wire s_axi4_mem0_awready;
  wire [2:0]s_axi4_mem0_awsize;
  wire s_axi4_mem0_awuser;
  wire s_axi4_mem0_awvalid;
  wire [5:0]s_axi4_mem0_bid;
  wire s_axi4_mem0_bready;
  wire [1:0]s_axi4_mem0_bresp;
  wire s_axi4_mem0_bvalid;
  wire [127:0]s_axi4_mem0_rdata;
  wire [5:0]s_axi4_mem0_rid;
  wire s_axi4_mem0_rlast;
  wire s_axi4_mem0_rready;
  wire [1:0]s_axi4_mem0_rresp;
  wire s_axi4_mem0_rvalid;
  wire [127:0]s_axi4_mem0_wdata;
  wire s_axi4_mem0_wlast;
  wire s_axi4_mem0_wready;
  wire [15:0]s_axi4_mem0_wstrb;
  wire s_axi4_mem0_wvalid;
  wire s_axi4_mem_aclk;
  wire [0:0]s_axi4_mem_aresetn;

  
    // テストベンチから force する前提
    reg             reset           /*verilator public_flat*/;
    reg             clk100          /*verilator public_flat*/;
    reg             clk200          /*verilator public_flat*/;
    reg             clk250          /*verilator public_flat*/;
	
    reg     [36:0]  wb_peri_adr_i   /*verilator public_flat*/;
    reg     [63:0]  wb_peri_dat_o   /*verilator public_flat*/;
    reg     [63:0]  wb_peri_dat_i   /*verilator public_flat*/;
    reg     [7:0]   wb_peri_sel_i   /*verilator public_flat*/;
    reg             wb_peri_we_i    /*verilator public_flat*/;
    reg             wb_peri_stb_i   /*verilator public_flat*/;
    reg             wb_peri_ack_o   /*verilator public_flat*/;

    reg     [37:0]  wb_rpu_adr_i    /*verilator public_flat*/;
    reg     [31:0]  wb_rpu_dat_o    /*verilator public_flat*/;
    reg     [31:0]  wb_rpu_dat_i    /*verilator public_flat*/;
    reg     [3:0]   wb_rpu_sel_i    /*verilator public_flat*/;
    reg             wb_rpu_we_i     /*verilator public_flat*/;
    reg             wb_rpu_stb_i    /*verilator public_flat*/  = 1'b0;
    reg             wb_rpu_ack_o    /*verilator public_flat*/;

    assign out_reset             = reset;
    assign out_clk100            = clk100;
    assign out_clk200            = clk200;
    assign out_clk250            = clk250;
    assign s_axi4_mem_aresetn    = ~reset;
    assign s_axi4_mem_aclk       = clk250;
    
    jelly_wishbone_to_axi4l
            #(
                .WB_ADR_WIDTH           (37),
                .WB_DAT_SIZE            (3)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_wishbone_to_axi4l_peri
            (
                .s_wb_rst_i             (reset),
                .s_wb_clk_i             (clk250),
                .s_wb_adr_i             (wb_peri_adr_i),
                .s_wb_dat_o             (wb_peri_dat_o),
                .s_wb_dat_i             (wb_peri_dat_i),
                .s_wb_sel_i             (wb_peri_sel_i),
                .s_wb_we_i              (wb_peri_we_i ),
                .s_wb_stb_i             (wb_peri_stb_i),
                .s_wb_ack_o             (wb_peri_ack_o),

                .m_axi4l_aresetn        (m_axi4l_peri_aresetn),
                .m_axi4l_aclk           (m_axi4l_peri_aclk),
                .m_axi4l_awaddr         (m_axi4l_peri_awaddr),
                .m_axi4l_awprot         (m_axi4l_peri_awprot),
                .m_axi4l_awvalid        (m_axi4l_peri_awvalid),
                .m_axi4l_awready        (m_axi4l_peri_awready),
                .m_axi4l_wstrb          (m_axi4l_peri_wstrb),
                .m_axi4l_wdata          (m_axi4l_peri_wdata),
                .m_axi4l_wvalid         (m_axi4l_peri_wvalid),
                .m_axi4l_wready         (m_axi4l_peri_wready),
                .m_axi4l_bresp          (m_axi4l_peri_bresp),
                .m_axi4l_bvalid         (m_axi4l_peri_bvalid),
                .m_axi4l_bready         (m_axi4l_peri_bready),
                .m_axi4l_araddr         (m_axi4l_peri_araddr),
                .m_axi4l_arprot         (m_axi4l_peri_arprot),
                .m_axi4l_arvalid        (m_axi4l_peri_arvalid),
                .m_axi4l_arready        (m_axi4l_peri_arready),
                .m_axi4l_rdata          (m_axi4l_peri_rdata),
                .m_axi4l_rresp          (m_axi4l_peri_rresp),
                .m_axi4l_rvalid         (m_axi4l_peri_rvalid),
                .m_axi4l_rready         (m_axi4l_peri_rready)
            );

    jelly_wishbone_to_axi4l
            #(
                .WB_ADR_WIDTH           (38),
                .WB_DAT_SIZE            (2)     // 0:8bit, 1:16bit, 2:32bit ...
            )
        i_wishbone_to_axi4l_rpu
            (
                .s_wb_rst_i             (reset),
                .s_wb_clk_i             (clk250),
                .s_wb_adr_i             (wb_rpu_adr_i),
                .s_wb_dat_o             (wb_rpu_dat_o),
                .s_wb_dat_i             (wb_rpu_dat_i),
                .s_wb_sel_i             (wb_rpu_sel_i),
                .s_wb_we_i              (wb_rpu_we_i ),
                .s_wb_stb_i             (wb_rpu_stb_i),
                .s_wb_ack_o             (wb_rpu_ack_o),

                .m_axi4l_aresetn        (m_axi4l_rpu_aresetn),
                .m_axi4l_aclk           (m_axi4l_rpu_aclk),
                .m_axi4l_awaddr         (m_axi4l_rpu_awaddr),
                .m_axi4l_awprot         (m_axi4l_rpu_awprot),
                .m_axi4l_awvalid        (m_axi4l_rpu_awvalid),
                .m_axi4l_awready        (m_axi4l_rpu_awready),
                .m_axi4l_wstrb          (m_axi4l_rpu_wstrb),
                .m_axi4l_wdata          (m_axi4l_rpu_wdata),
                .m_axi4l_wvalid         (m_axi4l_rpu_wvalid),
                .m_axi4l_wready         (m_axi4l_rpu_wready),
                .m_axi4l_bresp          (m_axi4l_rpu_bresp),
                .m_axi4l_bvalid         (m_axi4l_rpu_bvalid),
                .m_axi4l_bready         (m_axi4l_rpu_bready),
                .m_axi4l_araddr         (m_axi4l_rpu_araddr),
                .m_axi4l_arprot         (m_axi4l_rpu_arprot),
                .m_axi4l_arvalid        (m_axi4l_rpu_arvalid),
                .m_axi4l_arready        (m_axi4l_rpu_arready),
                .m_axi4l_rdata          (m_axi4l_rpu_rdata),
                .m_axi4l_rresp          (m_axi4l_rpu_rresp),
                .m_axi4l_rvalid         (m_axi4l_rpu_rvalid),
                .m_axi4l_rready         (m_axi4l_rpu_rready)
            );

	jelly_axi4_slave_model
			#(
				.AXI_ID_WIDTH			(6),
				.AXI_ADDR_WIDTH			(49),
				.AXI_DATA_SIZE			(4),
				.MEM_WIDTH				(17),
				
				.WRITE_LOG_FILE			("axi4_write.txt"),
				.READ_LOG_FILE			(""),
				
				.AW_DELAY				(20),
				.AR_DELAY				(20),
				
				.AW_FIFO_PTR_WIDTH		(4),
				.W_FIFO_PTR_WIDTH		(4),
				.B_FIFO_PTR_WIDTH		(4),
				.AR_FIFO_PTR_WIDTH		(4),
				.R_FIFO_PTR_WIDTH		(4),
				
				.AW_BUSY_RATE			(0),
				.W_BUSY_RATE			(0),
				.B_BUSY_RATE			(0),
				.AR_BUSY_RATE			(0),
				.R_BUSY_RATE			(0)
			)
		i_axi4_slave_model
			(
				.aresetn				(s_axi4_mem_aresetn),
				.aclk					(s_axi4_mem_aclk),
				
				.s_axi4_awid			(s_axi4_mem0_awid),
				.s_axi4_awaddr			(s_axi4_mem0_awaddr),
				.s_axi4_awlen			(s_axi4_mem0_awlen),
				.s_axi4_awsize			(s_axi4_mem0_awsize),
				.s_axi4_awburst			(s_axi4_mem0_awburst),
				.s_axi4_awlock			(s_axi4_mem0_awlock),
				.s_axi4_awcache			(s_axi4_mem0_awcache),
				.s_axi4_awprot			(s_axi4_mem0_awprot),
				.s_axi4_awqos			(s_axi4_mem0_awqos),
				.s_axi4_awvalid			(s_axi4_mem0_awvalid),
				.s_axi4_awready			(s_axi4_mem0_awready),
				.s_axi4_wdata			(s_axi4_mem0_wdata),
				.s_axi4_wstrb			(s_axi4_mem0_wstrb),
				.s_axi4_wlast			(s_axi4_mem0_wlast),
				.s_axi4_wvalid			(s_axi4_mem0_wvalid),
				.s_axi4_wready			(s_axi4_mem0_wready),
				.s_axi4_bid				(s_axi4_mem0_bid),
				.s_axi4_bresp			(s_axi4_mem0_bresp),
				.s_axi4_bvalid			(s_axi4_mem0_bvalid),
				.s_axi4_bready			(s_axi4_mem0_bready),
				.s_axi4_arid			(s_axi4_mem0_arid),
				.s_axi4_araddr			(s_axi4_mem0_araddr),
				.s_axi4_arlen			(s_axi4_mem0_arlen),
				.s_axi4_arsize			(s_axi4_mem0_arsize),
				.s_axi4_arburst			(s_axi4_mem0_arburst),
				.s_axi4_arlock			(s_axi4_mem0_arlock),
				.s_axi4_arcache			(s_axi4_mem0_arcache),
				.s_axi4_arprot			(s_axi4_mem0_arprot),
				.s_axi4_arqos			(s_axi4_mem0_arqos),
				.s_axi4_arvalid			(s_axi4_mem0_arvalid),
				.s_axi4_arready			(s_axi4_mem0_arready),
				.s_axi4_rid				(s_axi4_mem0_rid),
				.s_axi4_rdata			(s_axi4_mem0_rdata),
				.s_axi4_rresp			(s_axi4_mem0_rresp),
				.s_axi4_rlast			(s_axi4_mem0_rlast),
				.s_axi4_rvalid			(s_axi4_mem0_rvalid),
				.s_axi4_rready			(s_axi4_mem0_rready)
			);
	
	
endmodule
