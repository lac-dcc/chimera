// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
   (DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    IIC_0_0_scl_i,
    IIC_0_0_scl_o,
    IIC_0_0_scl_t,
    IIC_0_0_sda_i,
    IIC_0_0_sda_o,
    IIC_0_0_sda_t,
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
    out_clk100,
    out_clk200,
    out_clk250,
    out_reset,
    vout_clk,
    vout_clk_x5,
    vout_reset,
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
    s_axi4_mem_aresetn,
    sys_clock,
    sys_reset);
   inout [14:0]DDR_addr;
   inout [2:0]DDR_ba;
   inout DDR_cas_n;
   inout DDR_ck_n;
   inout DDR_ck_p;
   inout DDR_cke;
   inout DDR_cs_n;
   inout [3:0]DDR_dm;
   inout [31:0]DDR_dq;
   inout [3:0]DDR_dqs_n;
   inout [3:0]DDR_dqs_p;
   inout DDR_odt;
   inout DDR_ras_n;
   inout DDR_reset_n;
   inout DDR_we_n;
   inout FIXED_IO_ddr_vrn;
   inout FIXED_IO_ddr_vrp;
   inout [53:0]FIXED_IO_mio;
   inout FIXED_IO_ps_clk;
   inout FIXED_IO_ps_porb;
   inout FIXED_IO_ps_srstb;
   input IIC_0_0_scl_i;
   output IIC_0_0_scl_o;
   output IIC_0_0_scl_t;
   input IIC_0_0_sda_i;
   output IIC_0_0_sda_o;
   output IIC_0_0_sda_t;
   output m_axi4l_peri_aclk;
   output [31:0]m_axi4l_peri_araddr;
   output [0:0]m_axi4l_peri_aresetn;
   output [2:0]m_axi4l_peri_arprot;
   input m_axi4l_peri_arready;
   output m_axi4l_peri_arvalid;
   output [31:0]m_axi4l_peri_awaddr;
   output [2:0]m_axi4l_peri_awprot;
   input m_axi4l_peri_awready;
   output m_axi4l_peri_awvalid;
   output m_axi4l_peri_bready;
   input [1:0]m_axi4l_peri_bresp;
   input m_axi4l_peri_bvalid;
   input [31:0]m_axi4l_peri_rdata;
   output m_axi4l_peri_rready;
   input [1:0]m_axi4l_peri_rresp;
   input m_axi4l_peri_rvalid;
   output [31:0]m_axi4l_peri_wdata;
   input m_axi4l_peri_wready;
   output [3:0]m_axi4l_peri_wstrb;
   output m_axi4l_peri_wvalid;

   output vout_reset;
   output vout_clk;
   output vout_clk_x5;

   output out_clk100;
   output out_clk200;
   output out_clk250;
   output [0:0]out_reset;
   input [31:0]s_axi4_mem0_araddr;
   input [1:0]s_axi4_mem0_arburst;
   input [3:0]s_axi4_mem0_arcache;
   input [5:0]s_axi4_mem0_arid;
   input [7:0]s_axi4_mem0_arlen;
   input [0:0]s_axi4_mem0_arlock;
   input [2:0]s_axi4_mem0_arprot;
   input [3:0]s_axi4_mem0_arqos;
   output s_axi4_mem0_arready;
   input [2:0]s_axi4_mem0_arsize;
   input s_axi4_mem0_arvalid;
   input [31:0]s_axi4_mem0_awaddr;
   input [1:0]s_axi4_mem0_awburst;
   input [3:0]s_axi4_mem0_awcache;
   input [5:0]s_axi4_mem0_awid;
   input [7:0]s_axi4_mem0_awlen;
   input [0:0]s_axi4_mem0_awlock;
   input [2:0]s_axi4_mem0_awprot;
   input [3:0]s_axi4_mem0_awqos;
   output s_axi4_mem0_awready;
   input [2:0]s_axi4_mem0_awsize;
   input s_axi4_mem0_awvalid;
   output [5:0]s_axi4_mem0_bid;
   input s_axi4_mem0_bready;
   output [1:0]s_axi4_mem0_bresp;
   output s_axi4_mem0_bvalid;
   output [63:0]s_axi4_mem0_rdata;
   output [5:0]s_axi4_mem0_rid;
   output s_axi4_mem0_rlast;
   input s_axi4_mem0_rready;
   output [1:0]s_axi4_mem0_rresp;
   output s_axi4_mem0_rvalid;
   input [63:0]s_axi4_mem0_wdata;
   input s_axi4_mem0_wlast;
   output s_axi4_mem0_wready;
   input [7:0]s_axi4_mem0_wstrb;
   input s_axi4_mem0_wvalid;
   output s_axi4_mem_aclk;
   output [0:0]s_axi4_mem_aresetn;
   input sys_clock;
   input sys_reset;
  
  
	localparam RATE100 = 1000.0/100.00;
	localparam RATE200 = 1000.0/200.00;
	localparam RATE250 = 1000.0/250.00;
	localparam RATE133 = 1000.0/133.33;
	
	localparam RATE_VOUT    = 1000.0/75.00;
	localparam RATE_VOUT_X5 = RATE_VOUT / 5.0;
	
	reg			reset = 1;
	initial #100 reset = 0;
	
	reg			clk100 = 1'b1;
	always #(RATE100/2.0) clk100 <= ~clk100;
	
	reg			clk200 = 1'b1;
	always #(RATE200/2.0) clk200 <= ~clk200;
	
	reg			clk250 = 1'b1;
	always #(RATE250/2.0) clk250 <= ~clk250;
	
	reg			clk133 = 1'b1;
	always #(RATE133/2.0) clk133 <= ~clk133;
	
	
	reg			video_clk = 1'b1;
	always #(RATE_VOUT/2.0) video_clk <= ~video_clk;
	
	reg			video_clk_x5 = 1'b1;
	always #(RATE_VOUT_X5/2.0) video_clk_x5 <= ~video_clk_x5;
	
	
	assign out_reset             = reset;
	assign out_clk100            = clk100;
	assign out_clk200            = clk200;
	assign out_clk250            = clk250;
	
	assign vout_reset            = reset;
	assign vout_clk              = video_clk;
	assign vout_clk_x5           = video_clk_x5;
	
	assign m_axi4l_peri_aresetn  = ~reset;
	assign m_axi4l_peri_aclk     = clk100;
	assign s_axi4_mem_aresetn    = ~reset;
	assign s_axi4_mem_aclk       = clk133;
	
	
	
	jelly_axi4_slave_model
			#(
				.AXI_ID_WIDTH			(6),
				.AXI_ADDR_WIDTH			(24),
				.AXI_DATA_SIZE			(3),
				.MEM_WIDTH				(17),
				
				.WRITE_LOG_FILE			("axi4_write.txt"),
				.READ_LOG_FILE			("axi4_read.txt"),
				
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
				.s_axi4_awaddr			(s_axi4_mem0_awaddr[23:0]),
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
				.s_axi4_araddr			(s_axi4_mem0_araddr[23:0]),
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
