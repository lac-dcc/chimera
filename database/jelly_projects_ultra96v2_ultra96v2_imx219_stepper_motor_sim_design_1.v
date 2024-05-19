// This program was cloned from: https://github.com/ryuz/jelly
// License: MIT License


`timescale 1 ns / 1 ps

module design_1
   (m_axi4l_peri_aclk,
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
  
  
	localparam RATE100 = 1000.0/100.00;
	localparam RATE200 = 1000.0/200.00;
	localparam RATE250 = 1000.0/250.00;
	localparam RATE133 = 1000.0/133.33;
	
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
	
	
	assign out_reset             = reset;
	assign out_clk100            = clk100;
	assign out_clk200            = clk200;
	assign out_clk250            = clk250;
	assign m_axi4l_peri_aresetn  = ~reset;
	assign m_axi4l_peri_aclk     = clk100;
	assign s_axi4_mem_aresetn    = ~reset;
	assign s_axi4_mem_aclk       = clk133;
	
	
	
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
