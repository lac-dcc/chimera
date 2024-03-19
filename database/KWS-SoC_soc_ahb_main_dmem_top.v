module ahb_main_dmem_top(
	haddr,
    hclk,
	hprot,
	hrdata,
	hready,
	hresp,
	hrst_b,
	hsel,
	hsize,
	htrans,
	hwdata,
	hwrite,
	intr
);
input   [31:0]  haddr;        
input           hclk;         
input   [3 :0]  hprot;        
input           hrst_b;       
input           hsel;         
input   [2 :0]  hsize;        
input   [1 :0]  htrans;       
input   [31:0]  hwdata;       
input           hwrite;       
output  [31:0]  hrdata;       
output          hready;  
output  [1 :0]  hresp;    
output		intr;  
  
wire   [31:0]  haddr;        
wire           hclk;         
wire   [3 :0]  hprot;        
wire           hrst_b;       
wire           hsel;         
wire   [2 :0]  hsize;        
wire   [1 :0]  htrans;       
wire   [31:0]  hwdata;       
wire           hwrite;       
wire  [31:0]  hrdata;       
wire          hready;  
wire  [1 :0]  hresp;    
wire		intr;   

wire [2:0] s_ahb_hburst;
assign s_ahb_hburst = 3'b0;
wire s_ahb_hready_in;
assign s_ahb_hready_in = 1'b1;
wire s_ahb_hresp;
assign hresp = 2'b0;
assign intr = 1'b0;


wire [3:0] dmem_axi_awid;
wire [7:0] dmem_axi_awlen;
wire [2:0] dmem_axi_awsize;
wire [1:0] dmem_axi_awburst;
wire [3:0] dmem_axi_awcache;
wire [31:0] dmem_axi_awaddr;
wire [2:0] dmem_axi_awprot;
wire dmem_axi_awvalid;
wire dmem_axi_awready;
wire dmem_axi_awlock;
wire [31:0] dmem_axi_wdata;
wire [3:0]  dmem_axi_wstrb;
wire dmem_axi_wlast;
wire dmem_axi_wvalid;
wire dmem_axi_wready;
wire [3:0] dmem_axi_bid;
assign dmem_axi_bid = 4'b0;
wire [1:0] dmem_axi_bresp;
wire dmem_axi_bvalid;
wire dmem_axi_bready;
wire [3:0] dmem_axi_arid;
wire [7:0] dmem_axi_arlen;
wire [2:0] dmem_axi_arsize;
wire [1:0] dmem_axi_arburst;
wire [2:0] dmem_axi_arprot;
wire [3:0] dmem_axi_arcache;
wire dmem_axi_arvalid;
wire [31:0] dmem_axi_araddr;
wire dmem_axi_arlock;
wire dmem_axi_arready;
wire [3:0] dmem_axi_rid;
assign dmem_axi_rid = 4'b0;
wire [31:0] dmem_axi_rdata;
wire [1:0] dmem_axi_rresp;
wire dmem_axi_rvalid;
wire dmem_axi_rlast;
assign dmem_axi_rlast = 1'b1;
wire dmem_axi_rready;


ahblite_axi_bridge_0 dmem_ahb_axi_ctrl0 (
  .s_ahb_hclk(hclk),              // input wire s_ahb_hclk
  .s_ahb_hresetn(hrst_b),        // input wire s_ahb_hresetn
  .s_ahb_hsel(hsel),              // input wire s_ahb_hsel
  .s_ahb_haddr(haddr),            // input wire [31 : 0] s_ahb_haddr
  .s_ahb_hprot(hprot),            // input wire [3 : 0] s_ahb_hprot
  .s_ahb_htrans(htrans),          // input wire [1 : 0] s_ahb_htrans
  .s_ahb_hsize(hsize),            // input wire [2 : 0] s_ahb_hsize
  .s_ahb_hwrite(hwrite),          // input wire s_ahb_hwrite
  .s_ahb_hburst(s_ahb_hburst),          // input wire [2 : 0] s_ahb_hburst
  .s_ahb_hwdata(hwdata),          // input wire [31 : 0] s_ahb_hwdata
  .s_ahb_hready_out(hready),  // output wire s_ahb_hready_out
  .s_ahb_hready_in(s_ahb_hready_in),    // input wire s_ahb_hready_in
  .s_ahb_hrdata(hrdata),          // output wire [31 : 0] s_ahb_hrdata
  .s_ahb_hresp(s_ahb_hresp),            // output wire s_ahb_hresp
  .m_axi_awid(dmem_axi_awid),              // output wire [3 : 0] m_axi_awid
  .m_axi_awlen(dmem_axi_awlen),            // output wire [7 : 0] m_axi_awlen
  .m_axi_awsize(dmem_axi_awsize),          // output wire [2 : 0] m_axi_awsize
  .m_axi_awburst(dmem_axi_awburst),        // output wire [1 : 0] m_axi_awburst
  .m_axi_awcache(dmem_axi_awcache),        // output wire [3 : 0] m_axi_awcache
  .m_axi_awaddr(dmem_axi_awaddr),          // output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot(dmem_axi_awprot),          // output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid(dmem_axi_awvalid),        // output wire m_axi_awvalid
  .m_axi_awready(dmem_axi_awready),        // input wire m_axi_awready
  .m_axi_awlock(dmem_axi_awlock),          // output wire m_axi_awlock
  .m_axi_wdata(dmem_axi_wdata),            // output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb(dmem_axi_wstrb),            // output wire [3 : 0] m_axi_wstrb
  .m_axi_wlast(dmem_axi_wlast),            // output wire m_axi_wlast
  .m_axi_wvalid(dmem_axi_wvalid),          // output wire m_axi_wvalid
  .m_axi_wready(dmem_axi_wready),          // input wire m_axi_wready
  .m_axi_bid(dmem_axi_bid),                // input wire [3 : 0] m_axi_bid
  .m_axi_bresp(dmem_axi_bresp),            // input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid(dmem_axi_bvalid),          // input wire m_axi_bvalid
  .m_axi_bready(dmem_axi_bready),          // output wire m_axi_bready
  .m_axi_arid(dmem_axi_arid),              // output wire [3 : 0] m_axi_arid
  .m_axi_arlen(dmem_axi_arlen),            // output wire [7 : 0] m_axi_arlen
  .m_axi_arsize(dmem_axi_arsize),          // output wire [2 : 0] m_axi_arsize
  .m_axi_arburst(dmem_axi_arburst),        // output wire [1 : 0] m_axi_arburst
  .m_axi_arprot(dmem_axi_arprot),          // output wire [2 : 0] m_axi_arprot
  .m_axi_arcache(dmem_axi_arcache),        // output wire [3 : 0] m_axi_arcache
  .m_axi_arvalid(dmem_axi_arvalid),        // output wire m_axi_arvalid
  .m_axi_araddr(dmem_axi_araddr),          // output wire [31 : 0] m_axi_araddr
  .m_axi_arlock(dmem_axi_arlock),          // output wire m_axi_arlock
  .m_axi_arready(dmem_axi_arready),        // input wire m_axi_arready
  .m_axi_rid(dmem_axi_rid),                // input wire [3 : 0] m_axi_rid
  .m_axi_rdata(dmem_axi_rdata),            // input wire [31 : 0] m_axi_rdata
  .m_axi_rresp(dmem_axi_rresp),            // input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid(dmem_axi_rvalid),          // input wire m_axi_rvalid
  .m_axi_rlast(dmem_axi_rlast),            // input wire m_axi_rlast
  .m_axi_rready(dmem_axi_rready)          // output wire m_axi_rready
);


wire [17:0] dmem_axi_awaddr_18;
wire [17:0] dmem_axi_araddr_18;
assign dmem_axi_awaddr_18 = dmem_axi_awaddr[17:0];
assign dmem_axi_araddr_18 = dmem_axi_araddr[17:0];

wire bram_rst_a;
wire bram_clk_a;
wire bram_en_a;
wire [3:0] bram_we_a;
wire [17:0] bram_addr_a;
wire [31:0] bram_wrdata_a;
wire  [31:0] bram_rddata_a;


axi_bram_ctrl_0 dmem_axi_bram_ctrl0 (
  .s_axi_aclk(hclk),        // input wire s_axi_aclk
  .s_axi_aresetn(hrst_b),  // input wire s_axi_aresetn
  .s_axi_awaddr(dmem_axi_awaddr_18),    // input wire [17 : 0] s_axi_awaddr
  .s_axi_awprot(dmem_axi_awprot),    // input wire [2 : 0] s_axi_awprot
  .s_axi_awvalid(dmem_axi_awvalid),  // input wire s_axi_awvalid
  .s_axi_awready(dmem_axi_awready),  // output wire s_axi_awready
  .s_axi_wdata(dmem_axi_wdata),      // input wire [31 : 0] s_axi_wdata
  .s_axi_wstrb(dmem_axi_wstrb),      // input wire [3 : 0] s_axi_wstrb
  .s_axi_wvalid(dmem_axi_wvalid),    // input wire s_axi_wvalid
  .s_axi_wready(dmem_axi_wready),    // output wire s_axi_wready
  .s_axi_bresp(dmem_axi_bresp),      // output wire [1 : 0] s_axi_bresp
  .s_axi_bvalid(dmem_axi_bvalid),    // output wire s_axi_bvalid
  .s_axi_bready(dmem_axi_bready),    // input wire s_axi_bready
  .s_axi_araddr(dmem_axi_araddr_18),    // input wire [17 : 0] s_axi_araddr
  .s_axi_arprot(dmem_axi_arprot),    // input wire [2 : 0] s_axi_arprot
  .s_axi_arvalid(dmem_axi_arvalid),  // input wire s_axi_arvalid
  .s_axi_arready(dmem_axi_arready),  // output wire s_axi_arready
  .s_axi_rdata(dmem_axi_rdata),      // output wire [31 : 0] s_axi_rdata
  .s_axi_rresp(dmem_axi_rresp),      // output wire [1 : 0] s_axi_rresp
  .s_axi_rvalid(dmem_axi_rvalid),    // output wire s_axi_rvalid
  .s_axi_rready(dmem_axi_rready),    // input wire s_axi_rready
  .bram_rst_a(bram_rst_a),        // output wire bram_rst_a
  .bram_clk_a(bram_clk_a),        // output wire bram_clk_a
  .bram_en_a(bram_en_a),          // output wire bram_en_a
  .bram_we_a(bram_we_a),          // output wire [3 : 0] bram_we_a
  .bram_addr_a(bram_addr_a),      // output wire [17 : 0] bram_addr_a
  .bram_wrdata_a(bram_wrdata_a),  // output wire [31 : 0] bram_wrdata_a
  .bram_rddata_a(bram_rddata_a)  // input wire [31 : 0] bram_rddata_a
);

wire [15:0] bram_addr_a_16;
assign bram_addr_a_16 = bram_addr_a[17:2];
wire bram_we_a_1;
assign bram_we_a_1 = bram_we_a[0:0];

blk_mem_gen_0 dmem_bram_0 (
  .clka(bram_clk_a),    // input wire clka
  .ena(bram_en_a),      // input wire ena
  .wea(bram_we_a_1),      // input wire [0 : 0] wea
  .addra(bram_addr_a_16),  // input wire [15 : 0] addra
  .dina(bram_wrdata_a),    // input wire [31 : 0] dina
  .douta(bram_rddata_a)  // output wire [31 : 0] douta
);

endmodule