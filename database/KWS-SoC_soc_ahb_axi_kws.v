//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/23 15:46:41
// Design Name: 
// Module Name: ahb_axi_kws
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module ahb_axi_kws(
  haddr0,
  hclk0,
  hprot0,
  hrdata0,
  hready0,
  hresp0,
  hrst_b0,
  hsel0,
  hsize0,
  htrans0,
  hwdata0,
  hwrite0,
  intr0,
  haddr1,
  hclk1,
  hprot1,
  hrdata1,
  hready1,
  hresp1,
  hrst_b1,
  hsel1,
  hsize1,
  htrans1,
  hwdata1,
  hwrite1,
  intr1,
  haddr2,
  hclk2,
  hprot2,
  hrdata2,
  hready2,
  hresp2,
  hrst_b2,
  hsel2,
  hsize2,
  htrans2,
  hwdata2,
  hwrite2,
  intr2,
  haddr3,
  hclk3,
  hprot3,
  hrdata3,
  hready3,
  hresp3,
  hrst_b3,
  hsel3,
  hsize3,
  htrans3,
  hwdata3,
  hwrite3,
  intr3
);

input   [31:0]  haddr0;        
input           hclk0;         
input   [3 :0]  hprot0;        
input           hrst_b0;       
input           hsel0;         
input   [2 :0]  hsize0;        
input   [1 :0]  htrans0;       
input   [31:0]  hwdata0;       
input           hwrite0;       
output  [31:0]  hrdata0;       
output          hready0;  
output   [1:0] hresp0;    
output		intr0; 
input   [31:0]  haddr1;        
input           hclk1;         
input   [3 :0]  hprot1;        
input           hrst_b1;       
input           hsel1;         
input   [2 :0]  hsize1;        
input   [1 :0]  htrans1;       
input   [31:0]  hwdata1;       
input           hwrite1;       
output  [31:0]  hrdata1;       
output          hready1;  
output  [1:0]  hresp1;    
output		intr1; 
input   [31:0]  haddr2;        
input           hclk2;         
input   [3 :0]  hprot2;        
input           hrst_b2;       
input           hsel2;         
input   [2 :0]  hsize2;        
input   [1 :0]  htrans2;       
input   [31:0]  hwdata2;       
input           hwrite2;       
output  [31:0]  hrdata2;       
output          hready2;  
output   [1:0] hresp2;    
output		intr2; 
input   [31:0]  haddr3;        
input           hclk3;         
input   [3 :0]  hprot3;        
input           hrst_b3;       
input           hsel3;         
input   [2 :0]  hsize3;        
input   [1 :0]  htrans3;       
input   [31:0]  hwdata3;       
input           hwrite3;       
output  [31:0]  hrdata3;       
output          hready3;  
output  [1:0]  hresp3;    
output		intr3; 

wire intr0;
wire intr1;
wire intr2;
wire intr3;
wire hclk0;
wire hclk1;
wire hclk2;
wire hclk3;
wire hrst_b0;
wire hrst_b1;
wire hrst_b2;
wire hrst_b3;



wire [3:0] data_out_axi_awid;
wire [7:0] data_out_axi_awlen;
wire [2:0]data_out_axi_awsize;
wire [1:0]data_out_axi_awburst;
wire [3:0]data_out_axi_awcache;
wire [31:0]data_out_axi_awaddr;
wire [2:0]data_out_axi_awprot;
wire data_out_axi_awvalid;
wire data_out_axi_awready;
wire data_out_axi_awlock;
wire [31:0]data_out_axi_wdata;
wire [3:0]data_out_axi_wstrb;
wire  data_out_axi_wlast;
wire  data_out_axi_wvalid;
wire  data_out_axi_wready;
wire [3:0]data_out_axi_bid;
wire [1:0]data_out_axi_bresp;
wire data_out_axi_bvalid;
wire data_out_axi_bready;
wire [3:0]data_out_axi_arid;
wire [7:0]data_out_axi_arlen;
wire [2:0]data_out_axi_arsize;
wire [1:0]data_out_axi_arburst;
wire [2:0]data_out_axi_arprot;
wire [3:0]data_out_axi_arcache;
wire data_out_axi_arvalid;
wire [31:0]data_out_axi_araddr;
wire data_out_axi_arlock;
wire  data_out_axi_arready;
wire [3:0]data_out_axi_rid;
wire [31:0]data_out_axi_rdata;
wire [1:0]data_out_axi_rresp;
wire  data_out_axi_rvalid;
wire data_out_axi_rlast;
wire data_out_axi_rready; 
wire data_out_hresp;

wire [3:0] data_in_axi_awid;
wire [7:0] data_in_axi_awlen;
wire [2:0]data_in_axi_awsize;
wire [1:0]data_in_axi_awburst;
wire [3:0]data_in_axi_awcache;
wire [31:0]data_in_axi_awaddr;
wire [2:0]data_in_axi_awprot;
wire data_in_axi_awvalid;
wire data_in_axi_awready;
wire data_in_axi_awlock;
wire [31:0]data_in_axi_wdata;
wire [3:0]data_in_axi_wstrb;
wire  data_in_axi_wlast;
wire  data_in_axi_wvalid;
wire  data_in_axi_wready;
wire [3:0]data_in_axi_bid;
wire [1:0]data_in_axi_bresp;
wire data_in_axi_bvalid;
wire data_in_axi_bready;
wire [3:0]data_in_axi_arid;
wire [7:0]data_in_axi_arlen;
wire [2:0]data_in_axi_arsize;
wire [1:0]data_in_axi_arburst;
wire [2:0]data_in_axi_arprot;
wire [3:0]data_in_axi_arcache;
wire data_in_axi_arvalid;
wire [31:0]data_in_axi_araddr;
wire data_in_axi_arlock;
wire  data_in_axi_arready;
wire [3:0]data_in_axi_rid;
wire [31:0]data_in_axi_rdata;
wire [1:0]data_in_axi_rresp;
wire  data_in_axi_rvalid;
wire data_in_axi_rlast;
wire data_in_axi_rready; 

reg data_out_axi_arready_one_word;
reg data_out_axi_rready_one_word;
assign data_out_axi_arready = data_out_axi_arready_one_word;
wire data_out_axi_rready_one_word_wire;
assign data_out_axi_rready_one_word_wire = data_out_axi_rready_one_word;
wire data_out_axi_rvalid_one_word_wire;
assign data_out_axi_rvalid_one_word_wire= data_out_axi_rready_one_word;
wire data_out_axi_rlast_one_word_wire;
assign data_out_axi_rlast_one_word_wire = data_out_axi_rready_one_word;



wire [3:0] weight_in_axi_awid;
wire [7:0] weight_in_axi_awlen;
wire [2:0]weight_in_axi_awsize;
wire [1:0]weight_in_axi_awburst;
wire [3:0]weight_in_axi_awcache;
wire [31:0]weight_in_axi_awaddr;
wire [2:0]weight_in_axi_awprot;
wire weight_in_axi_awvalid;
wire weight_in_axi_awready;
wire weight_in_axi_awlock;
wire [31:0]weight_in_axi_wdata;
wire [3:0]weight_in_axi_wstrb;
wire  weight_in_axi_wlast;
wire  weight_in_axi_wvalid;
wire  weight_in_axi_wready;
wire [3:0]weight_in_axi_bid;
wire [1:0]weight_in_axi_bresp;
wire weight_in_axi_bvalid;
wire weight_in_axi_bready;
wire [3:0]weight_in_axi_arid;
wire [7:0]weight_in_axi_arlen;
wire [2:0]weight_in_axi_arsize;
wire [1:0]weight_in_axi_arburst;
wire [2:0]weight_in_axi_arprot;
wire [3:0]weight_in_axi_arcache;
wire weight_in_axi_arvalid;
wire [31:0]weight_in_axi_araddr;
wire weight_in_axi_arlock;
wire  weight_in_axi_arready;
wire [3:0]weight_in_axi_rid;
wire [31:0]weight_in_axi_rdata;
wire [1:0]weight_in_axi_rresp;
wire  weight_in_axi_rvalid;
wire weight_in_axi_rlast;
wire weight_in_axi_rready; 
wire weight_in_hresp;



wire [3:0] control_in_axi_awid;
wire [7:0] control_in_axi_awlen;
wire [2:0]control_in_axi_awsize;
wire [1:0]control_in_axi_awburst;
wire [3:0]control_in_axi_awcache;
wire [31:0]control_in_axi_awaddr;
wire [2:0]control_in_axi_awprot;
wire control_in_axi_awvalid;
wire control_in_axi_awready;
wire control_in_axi_awlock;
wire [31:0]control_in_axi_wdata;
wire [3:0]control_in_axi_wstrb;
wire  control_in_axi_wlast;
wire  control_in_axi_wvalid;
wire  control_in_axi_wready;
wire [3:0]control_in_axi_bid;
wire [1:0]control_in_axi_bresp;
wire control_in_axi_bvalid;
wire control_in_axi_bready;
wire [3:0]control_in_axi_arid;
wire [7:0]control_in_axi_arlen;
wire [2:0]control_in_axi_arsize;
wire [1:0]control_in_axi_arburst;
wire [2:0]control_in_axi_arprot;
wire [3:0]control_in_axi_arcache;
wire control_in_axi_arvalid;
wire [31:0]control_in_axi_araddr;
wire control_in_axi_arlock;
wire  control_in_axi_arready;
wire [3:0]control_in_axi_rid;
wire [31:0]control_in_axi_rdata;
wire [1:0]control_in_axi_rresp;
wire  control_in_axi_rvalid;
wire control_in_axi_rlast;
wire control_in_axi_rready; 
wire control_in_hresp;



assign intr0 = 1'b0;
assign intr1 = 1'b0;
assign intr2 = 1'b0;
assign hresp0 = 2'b0;
assign hresp1 = 2'b0;
assign hresp2 = 2'b0;
assign hresp3 = 2'b0;

//assign hready0 = (data_in_axi_awready&data_in_axi_wready) ? 1'b1: 1'b0 ;
//assign hready1 = (weight_in_axi_awready&weight_in_axi_wready) ? 1'b1: 1'b0 ;
//assign hready2 = (control_in_axi_awready&control_in_axi_wready) ? 1'b1: 1'b0 ;
//assign hready3 = (data_out_axi_arready&data_out_axi_rready) ? 1'b1: 1'b0 ;

wire hready0;
wire hready1;
wire hready2;
wire hready3;

//burst setting
wire [2:0] s_ahb_hburst;
assign s_ahb_hburst = 3'b000;
wire s_ahb_aready_in;
assign s_ahb_aready_in = 1'b1;
wire data_in_hresp;

//aw and ar
assign data_in_axi_awready = 1'b1;
assign weight_in_axi_awready = 1'b1;
assign control_in_axi_awready = 1'b1;
assign data_out_axi_awready = 1'b1;

assign data_in_axi_arready = 1'b1;
assign weight_in_axi_arready = 1'b1;
assign control_in_axi_arready = 1'b1;


//response
assign data_in_axi_bvalid = 1'b1;
assign data_in_axi_bresp = 2'b0;
assign data_in_axi_bid = 3'b000;

assign weight_in_axi_bvalid = 1'b1;
assign weight_in_axi_bresp = 2'b0;
assign weight_in_axi_bid = 3'b000;

assign control_in_axi_bvalid = 1'b1;
assign control_in_axi_bresp = 2'b0;
assign control_in_axi_bid = 3'b000;
assign control_in_axi_rid = 3'b000;

assign data_out_axi_bvalid = 1'b1;
assign data_out_axi_bresp = 2'b0;
assign data_out_axi_bid = 3'b000;


//r or w
assign data_in_axi_rdata = 32'b0;
assign data_in_axi_rresp = 2'b0;
assign data_in_axi_rvalid = 1'b0;
assign data_in_axi_rlast = 1'b0;
assign data_in_axi_rid = 3'b000;


assign weight_in_axi_rdata = 32'b0;
assign weight_in_axi_rresp = 2'b0;
assign weight_in_axi_rlast = 1'b0;
assign weight_in_axi_rvalid = 1'b0;
assign weight_in_axi_rid = 3'b000;

assign control_in_axi_rdata = 32'b0;
assign control_in_axi_rresp = 2'b0;
assign control_in_axi_rlast = 1'b0;
assign control_in_axi_rvalid = 1'b0;


//assign data_out_axi_wdata = 32'b0;
assign data_out_axi_wready = 1'b1;
assign data_out_axi_wlast = 1'b0;
assign data_out_axi_rid = 3'b000;
assign data_out_axi_rresp = 2'b0;
//assign data_out_axi_rlast = data_out_axi_rready_one_word_wire;

wire [2:0] data_in_burst;
assign data_in_burst = 3'b001;

ahblite_axi_bridge_0 preprocess_data_in_axi_bridge (
  .s_ahb_hclk(hclk0),              // input wire s_ahb_hclk
  .s_ahb_hresetn(hrst_b0),        // input wire s_ahb_hresetn
  .s_ahb_hsel(hsel0),              // input wire s_ahb_hsel
  .s_ahb_haddr(haddr0),            // input wire [31 : 0] s_ahb_haddr
  .s_ahb_hprot(hprot0),            // input wire [3 : 0] s_ahb_hprot
  .s_ahb_htrans(htrans0),          // input wire [1 : 0] s_ahb_htrans
  .s_ahb_hsize(hsize0),            // input wire [2 : 0] s_ahb_hsize
  .s_ahb_hwrite(hwrite0),          // input wire s_ahb_hwrite
  .s_ahb_hburst(data_in_burst),          // input wire [2 : 0] s_ahb_hburst
  .s_ahb_hwdata(hwdata0),          // input wire [31 : 0] s_ahb_hwdata
  .s_ahb_hready_out(hready0),  // output wire s_ahb_hready_out
  .s_ahb_hready_in(s_ahb_aready_in),    // input wire s_ahb_hready_in
  .s_ahb_hrdata(hrdata0),          // output wire [31 : 0] s_ahb_hrdata
  .s_ahb_hresp(data_in_hresp),            // output wire s_ahb_hresp
  .m_axi_awid(data_in_axi_awid),              // output wire [3 : 0] m_axi_awid
  .m_axi_awlen(data_in_axi_awlen),            // output wire [7 : 0] m_axi_awlen
  .m_axi_awsize(data_in_axi_awsize),          // output wire [2 : 0] m_axi_awsize
  .m_axi_awburst(data_in_axi_awburst),        // output wire [1 : 0] m_axi_awburst
  .m_axi_awcache(data_in_axi_awcache),        // output wire [3 : 0] m_axi_awcache
  .m_axi_awaddr(data_in_axi_awaddr),          // output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot(data_in_axi_awprot),          // output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid(data_in_axi_awvalid),        // output wire m_axi_awvalid
  .m_axi_awready(data_in_axi_awready),        // input wire m_axi_awready
  .m_axi_awlock(data_in_axi_awlock),          // output wire m_axi_awlock
  .m_axi_wdata(data_in_axi_wdata),            // output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb(data_in_axi_wstrb),            // output wire [3 : 0] m_axi_wstrb
  .m_axi_wlast(data_in_axi_wlast),            // output wire m_axi_wlast
  .m_axi_wvalid(data_in_axi_wvalid),          // output wire m_axi_wvalid
  .m_axi_wready(data_in_axi_wready),          // input wire m_axi_wready
  .m_axi_bid(data_in_axi_bid),                // input wire [3 : 0] m_axi_bid
  .m_axi_bresp(data_in_axi_bresp),            // input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid(data_in_axi_bvalid),          // input wire m_axi_bvalid
  .m_axi_bready(data_in_axi_bready),          // output wire m_axi_bready
  .m_axi_arid(data_in_axi_arid),              // output wire [3 : 0] m_axi_arid
  .m_axi_arlen(data_in_axi_arlen),            // output wire [7 : 0] m_axi_arlen
  .m_axi_arsize(data_in_axi_arsize),          // output wire [2 : 0] m_axi_arsize
  .m_axi_arburst(data_in_axi_arburst),        // output wire [1 : 0] m_axi_arburst
  .m_axi_arprot(data_in_axi_arprot),          // output wire [2 : 0] m_axi_arprot
  .m_axi_arcache(data_in_axi_arcache),        // output wire [3 : 0] m_axi_arcache
  .m_axi_arvalid(data_in_axi_arvalid),        // output wire m_axi_arvalid
  .m_axi_araddr(data_in_axi_araddr),          // output wire [31 : 0] m_axi_araddr
  .m_axi_arlock(data_in_axi_arlock),          // output wire m_axi_arlock
  .m_axi_arready(data_in_axi_arready),        // input wire m_axi_arready
  .m_axi_rid(data_in_axi_rid),                // input wire [3 : 0] m_axi_rid
  .m_axi_rdata(data_in_axi_rdata),            // input wire [31 : 0] m_axi_rdata
  .m_axi_rresp(data_in_axi_rresp),            // input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid(data_in_axi_rvalid),          // input wire m_axi_rvalid
  .m_axi_rlast(data_in_axi_rlast),            // input wire m_axi_rlast
  .m_axi_rready(data_in_axi_rready)          // output wire m_axi_rready
);



ahblite_axi_bridge_0 preprocess_cosines_in_axi_bridge (
  .s_ahb_hclk(hclk1),              // input wire s_ahb_hclk
  .s_ahb_hresetn(hrst_b1),        // input wire s_ahb_hresetn
  .s_ahb_hsel(hsel1),              // input wire s_ahb_hsel
  .s_ahb_haddr(haddr1),            // input wire [31 : 0] s_ahb_haddr
  .s_ahb_hprot(hprot1),            // input wire [3 : 0] s_ahb_hprot
  .s_ahb_htrans(htrans1),          // input wire [1 : 0] s_ahb_htrans
  .s_ahb_hsize(hsize1),            // input wire [2 : 0] s_ahb_hsize
  .s_ahb_hwrite(hwrite1),          // input wire s_ahb_hwrite
  .s_ahb_hburst(s_ahb_hburst),          // input wire [2 : 0] s_ahb_hburst
  .s_ahb_hwdata(hwdata1),          // input wire [31 : 0] s_ahb_hwdata
  .s_ahb_hready_out(hready1),  // output wire s_ahb_hready_out
  .s_ahb_hready_in(s_ahb_aready_in),    // input wire s_ahb_hready_in
  .s_ahb_hrdata(hrdata1),          // output wire [31 : 0] s_ahb_hrdata
  .s_ahb_hresp(weight_in_hresp),            // output wire s_ahb_hresp
  .m_axi_awid(weight_in_axi_awid),              // output wire [3 : 0] m_axi_awid
  .m_axi_awlen(weight_in_axi_awlen),            // output wire [7 : 0] m_axi_awlen
  .m_axi_awsize(weight_in_axi_awsize),          // output wire [2 : 0] m_axi_awsize
  .m_axi_awburst(weight_in_axi_awburst),        // output wire [1 : 0] m_axi_awburst
  .m_axi_awcache(weight_in_axi_awcache),        // output wire [3 : 0] m_axi_awcache
  .m_axi_awaddr(weight_in_axi_awaddr),          // output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot(weight_in_axi_awprot),          // output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid(weight_in_axi_awvalid),        // output wire m_axi_awvalid
  .m_axi_awready(weight_in_axi_awready),        // input wire m_axi_awready
  .m_axi_awlock(weight_in_axi_awlock),          // output wire m_axi_awlock
  .m_axi_wdata(weight_in_axi_wdata),            // output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb(weight_in_axi_wstrb),            // output wire [3 : 0] m_axi_wstrb
  .m_axi_wlast(weight_in_axi_wlast),            // output wire m_axi_wlast
  .m_axi_wvalid(weight_in_axi_wvalid),          // output wire m_axi_wvalid
  .m_axi_wready(weight_in_axi_wready),          // input wire m_axi_wready
  .m_axi_bid(weight_in_axi_bid),                // input wire [3 : 0] m_axi_bid
  .m_axi_bresp(weight_in_axi_bresp),            // input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid(weight_in_axi_bvalid),          // input wire m_axi_bvalid
  .m_axi_bready(weight_in_axi_bready),          // output wire m_axi_bready
  .m_axi_arid(weight_in_axi_arid),              // output wire [3 : 0] m_axi_arid
  .m_axi_arlen(weight_in_axi_arlen),            // output wire [7 : 0] m_axi_arlen
  .m_axi_arsize(weight_in_axi_arsize),          // output wire [2 : 0] m_axi_arsize
  .m_axi_arburst(weight_in_axi_arburst),        // output wire [1 : 0] m_axi_arburst
  .m_axi_arprot(weight_in_axi_arprot),          // output wire [2 : 0] m_axi_arprot
  .m_axi_arcache(weight_in_axi_arcache),        // output wire [3 : 0] m_axi_arcache
  .m_axi_arvalid(weight_in_axi_arvalid),        // output wire m_axi_arvalid
  .m_axi_araddr(weight_in_axi_araddr),          // output wire [31 : 0] m_axi_araddr
  .m_axi_arlock(weight_in_axi_arlock),          // output wire m_axi_arlock
  .m_axi_arready(weight_in_axi_arready),        // input wire m_axi_arready
  .m_axi_rid(weight_in_axi_rid),                // input wire [3 : 0] m_axi_rid
  .m_axi_rdata(weight_in_axi_rdata),            // input wire [31 : 0] m_axi_rdata
  .m_axi_rresp(weight_in_axi_rresp),            // input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid(weight_in_axi_rvalid),          // input wire m_axi_rvalid
  .m_axi_rlast(weight_in_axi_rlast),            // input wire m_axi_rlast
  .m_axi_rready(weight_in_axi_rready)          // output wire m_axi_rready
);



ahblite_axi_bridge_0 preprocess_control_in_axi_bridge (
  .s_ahb_hclk(hclk2),              // input wire s_ahb_hclk
  .s_ahb_hresetn(hrst_b2),        // input wire s_ahb_hresetn
  .s_ahb_hsel(hsel2),              // input wire s_ahb_hsel
  .s_ahb_haddr(haddr2),            // input wire [31 : 0] s_ahb_haddr
  .s_ahb_hprot(hprot2),            // input wire [3 : 0] s_ahb_hprot
  .s_ahb_htrans(htrans2),          // input wire [1 : 0] s_ahb_htrans
  .s_ahb_hsize(hsize2),            // input wire [2 : 0] s_ahb_hsize
  .s_ahb_hwrite(hwrite2),          // input wire s_ahb_hwrite
  .s_ahb_hburst(s_ahb_hburst),          // input wire [2 : 0] s_ahb_hburst
  .s_ahb_hwdata(hwdata2),          // input wire [31 : 0] s_ahb_hwdata
  .s_ahb_hready_out(hready2),  // output wire s_ahb_hready_out
  .s_ahb_hready_in(s_ahb_aready_in),    // input wire s_ahb_hready_in
  .s_ahb_hrdata(hrdata2),          // output wire [31 : 0] s_ahb_hrdata
  .s_ahb_hresp(control_in_hresp),            // output wire s_ahb_hresp
  .m_axi_awid(control_in_axi_awid),              // output wire [3 : 0] m_axi_awid
  .m_axi_awlen(control_in_axi_awlen),            // output wire [7 : 0] m_axi_awlen
  .m_axi_awsize(control_in_axi_awsize),          // output wire [2 : 0] m_axi_awsize
  .m_axi_awburst(control_in_axi_awburst),        // output wire [1 : 0] m_axi_awburst
  .m_axi_awcache(control_in_axi_awcache),        // output wire [3 : 0] m_axi_awcache
  .m_axi_awaddr(control_in_axi_awaddr),          // output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot(control_in_axi_awprot),          // output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid(control_in_axi_awvalid),        // output wire m_axi_awvalid
  .m_axi_awready(control_in_axi_awready),        // input wire m_axi_awready
  .m_axi_awlock(control_in_axi_awlock),          // output wire m_axi_awlock
  .m_axi_wdata(control_in_axi_wdata),            // output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb(control_in_axi_wstrb),            // output wire [3 : 0] m_axi_wstrb
  .m_axi_wlast(control_in_axi_wlast),            // output wire m_axi_wlast
  .m_axi_wvalid(control_in_axi_wvalid),          // output wire m_axi_wvalid
  .m_axi_wready(control_in_axi_wready),          // input wire m_axi_wready
  .m_axi_bid(control_in_axi_bid),                // input wire [3 : 0] m_axi_bid
  .m_axi_bresp(control_in_axi_bresp),            // input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid(control_in_axi_bvalid),          // input wire m_axi_bvalid
  .m_axi_bready(control_in_axi_bready),          // output wire m_axi_bready
  .m_axi_arid(control_in_axi_arid),              // output wire [3 : 0] m_axi_arid
  .m_axi_arlen(control_in_axi_arlen),            // output wire [7 : 0] m_axi_arlen
  .m_axi_arsize(control_in_axi_arsize),          // output wire [2 : 0] m_axi_arsize
  .m_axi_arburst(control_in_axi_arburst),        // output wire [1 : 0] m_axi_arburst
  .m_axi_arprot(control_in_axi_arprot),          // output wire [2 : 0] m_axi_arprot
  .m_axi_arcache(control_in_axi_arcache),        // output wire [3 : 0] m_axi_arcache
  .m_axi_arvalid(control_in_axi_arvalid),        // output wire m_axi_arvalid
  .m_axi_araddr(control_in_axi_araddr),          // output wire [31 : 0] m_axi_araddr
  .m_axi_arlock(control_in_axi_arlock),          // output wire m_axi_arlock
  .m_axi_arready(control_in_axi_arready),        // input wire m_axi_arready
  .m_axi_rid(control_in_axi_rid),                // input wire [3 : 0] m_axi_rid
  .m_axi_rdata(control_in_axi_rdata),            // input wire [31 : 0] m_axi_rdata
  .m_axi_rresp(control_in_axi_rresp),            // input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid(control_in_axi_rvalid),          // input wire m_axi_rvalid
  .m_axi_rlast(control_in_axi_rlast),            // input wire m_axi_rlast
  .m_axi_rready(control_in_axi_rready)          // output wire m_axi_rready
);


ahblite_axi_bridge_0 preprocess_data_out_axi_bridge (
  .s_ahb_hclk(hclk3),              // input wire s_ahb_hclk
  .s_ahb_hresetn(hrst_b3),        // input wire s_ahb_hresetn
  .s_ahb_hsel(hsel3),              // input wire s_ahb_hsel
  .s_ahb_haddr(haddr3),            // input wire [31 : 0] s_ahb_haddr
  .s_ahb_hprot(hprot3),            // input wire [3 : 0] s_ahb_hprot
  .s_ahb_htrans(htrans3),          // input wire [1 : 0] s_ahb_htrans
  .s_ahb_hsize(hsize3),            // input wire [2 : 0] s_ahb_hsize
  .s_ahb_hwrite(hwrite3),          // input wire s_ahb_hwrite
  .s_ahb_hburst(s_ahb_hburst),          // input wire [2 : 0] s_ahb_hburst
  .s_ahb_hwdata(hwdata3),          // input wire [31 : 0] s_ahb_hwdata
  .s_ahb_hready_out(hready3),  // output wire s_ahb_hready_out
  .s_ahb_hready_in(s_ahb_aready_in),    // input wire s_ahb_hready_in
  .s_ahb_hrdata(hrdata3),          // output wire [31 : 0] s_ahb_hrdata
  .s_ahb_hresp(data_out_hresp),            // output wire s_ahb_hresp
  .m_axi_awid(data_out_axi_awid),              // output wire [3 : 0] m_axi_awid
  .m_axi_awlen(data_out_axi_awlen),            // output wire [7 : 0] m_axi_awlen
  .m_axi_awsize(data_out_axi_awsize),          // output wire [2 : 0] m_axi_awsize
  .m_axi_awburst(data_out_axi_awburst),        // output wire [1 : 0] m_axi_awburst
  .m_axi_awcache(data_out_axi_awcache),        // output wire [3 : 0] m_axi_awcache
  .m_axi_awaddr(data_out_axi_awaddr),          // output wire [31 : 0] m_axi_awaddr
  .m_axi_awprot(data_out_axi_awprot),          // output wire [2 : 0] m_axi_awprot
  .m_axi_awvalid(data_out_axi_awvalid),        // output wire m_axi_awvalid
  .m_axi_awready(data_out_axi_awready),        // input wire m_axi_awready
  .m_axi_awlock(data_out_axi_awlock),          // output wire m_axi_awlock
  .m_axi_wdata(data_out_axi_wdata),            // output wire [31 : 0] m_axi_wdata
  .m_axi_wstrb(data_out_axi_wstrb),            // output wire [3 : 0] m_axi_wstrb
  .m_axi_wlast(data_out_axi_wlast),            // output wire m_axi_wlast
  .m_axi_wvalid(data_out_axi_wvalid),          // output wire m_axi_wvalid
  .m_axi_wready(data_out_axi_wready),          // input wire m_axi_wready
  .m_axi_bid(data_out_axi_bid),                // input wire [3 : 0] m_axi_bid
  .m_axi_bresp(data_out_axi_bresp),            // input wire [1 : 0] m_axi_bresp
  .m_axi_bvalid(data_out_axi_bvalid),          // input wire m_axi_bvalid
  .m_axi_bready(data_out_axi_bready),          // output wire m_axi_bready
  .m_axi_arid(data_out_axi_arid),              // output wire [3 : 0] m_axi_arid
  .m_axi_arlen(data_out_axi_arlen),            // output wire [7 : 0] m_axi_arlen
  .m_axi_arsize(data_out_axi_arsize),          // output wire [2 : 0] m_axi_arsize
  .m_axi_arburst(data_out_axi_arburst),        // output wire [1 : 0] m_axi_arburst
  .m_axi_arprot(data_out_axi_arprot),          // output wire [2 : 0] m_axi_arprot
  .m_axi_arcache(data_out_axi_arcache),        // output wire [3 : 0] m_axi_arcache
  .m_axi_arvalid(data_out_axi_arvalid),        // output wire m_axi_arvalid
  .m_axi_araddr(data_out_axi_araddr),          // output wire [31 : 0] m_axi_araddr
  .m_axi_arlock(data_out_axi_arlock),          // output wire m_axi_arlock
  .m_axi_arready(data_out_axi_arready),        // input wire m_axi_arready
  .m_axi_rid(data_out_axi_rid),                // input wire [3 : 0] m_axi_rid
  .m_axi_rdata(data_out_axi_rdata),            // input wire [31 : 0] m_axi_rdata
  .m_axi_rresp(data_out_axi_rresp),            // input wire [1 : 0] m_axi_rresp
  .m_axi_rvalid(data_out_axi_rvalid_one_word_wire),          // input wire m_axi_rvalid
  .m_axi_rlast(data_out_axi_rlast_one_word_wire),            // input wire m_axi_rlast
  .m_axi_rready(data_out_axi_rready)          // output wire m_axi_rready
);


/*wire fifo_hrst_b0;
assign fifo_hrst_b0 = ~hrst_b0;
wire [31:0] fifo_data_out_axi_wdata;
assign fifo_data_out_axi_wdata = data_out_axi_rdata[31:0];
wire [31:0] fifo_data_out_axi_rdata;
wire wr_rst_busy;
wire rd_rst_busy;
wire full;
wire empty;
wire fifo_data_rvalid;

reg data_out_axi_rready_req;
always@(posedge hclk0 or negedge hrst_b0)
begin
    if(hrst_b0 == 1'b0)
        data_out_axi_rready_req <= 1'b0;
    else
        if(data_out_axi_arvalid == 1'b1)
            data_out_axi_rready_req <= 1'b1;
        else if(fifo_data_rvalid == 1'b1)
            data_out_axi_rready_req <= 1'b0;
        else;
end

wire data_out_rvalid_req;
assign data_out_rvalid_req = ~empty;

fifo_generator_0 data_out_fifo (
  .clk(hclk0),                  // input wire clk
  .srst(fifo_hrst_b0),                // input wire srst
  .din(fifo_data_out_axi_wdata),                  // input wire [31 : 0] din
  .wr_en(data_out_axi_rvalid),              // input wire wr_en
  .rd_en(data_out_axi_rready_req),              // input wire rd_en
  .dout(fifo_data_out_axi_rdata),                // output wire [31 : 0] dout
  .full(full),                // output wire full
  .empty(empty),              // output wire empty
  .valid(fifo_data_rvalid),              // output wire valid
  .wr_rst_busy(wr_rst_busy),  // output wire wr_rst_busy
  .rd_rst_busy(rd_rst_busy)  // output wire rd_rst_busy
);

wire fifo_data_out_rready;
assign fifo_data_out_rready=1'b1;*/

parameter DATA_OUT_IDLE         = 3'b000;
parameter DATA_OUT_ADDR_READY   = 3'b001;
parameter DATA_OUT_TRANS_RREADY = 3'b010;
reg [2:0] data_out_cstat;
reg [2:0] data_out_nstat;
always @(posedge hclk0 or negedge hrst_b0)
begin
    if(hrst_b0==1'b0)
        data_out_cstat <= DATA_OUT_IDLE;
    else 
        data_out_cstat <= data_out_nstat;
end
always @(*)
begin
    case(data_out_cstat)
        DATA_OUT_IDLE:begin
            if(data_out_axi_rvalid==1'b1 && data_out_axi_arvalid)
                data_out_nstat = DATA_OUT_ADDR_READY;
            else
                data_out_nstat = DATA_OUT_IDLE;end
        DATA_OUT_ADDR_READY:begin
            data_out_nstat = DATA_OUT_TRANS_RREADY;end
        DATA_OUT_TRANS_RREADY:begin
            data_out_nstat = DATA_OUT_IDLE;end
        default:begin
            data_out_nstat = data_out_cstat;end
    endcase
end
always @(posedge hclk0 or negedge hrst_b0)
begin
    if(hrst_b0==1'b0)begin
        data_out_axi_arready_one_word <= 1'b0;
        data_out_axi_rready_one_word  <= 1'b0;end
    else 
        case(data_out_cstat)
        DATA_OUT_IDLE:begin
              data_out_axi_arready_one_word <= 1'b0;
              data_out_axi_rready_one_word  <= 1'b0;end
        DATA_OUT_ADDR_READY:begin
              data_out_axi_arready_one_word <= 1'b1;
              data_out_axi_rready_one_word  <= 1'b0;end
        DATA_OUT_TRANS_RREADY:begin
            data_out_axi_arready_one_word <= 1'b0;
            data_out_axi_rready_one_word  <= 1'b1;end
        default:begin
            data_out_axi_arready_one_word <= 1'b0;
            data_out_axi_rready_one_word  <= 1'b0;
        end
         endcase
end


wire [31:0] data_in_axi_wdata_fo;
wire  data_in_axi_wready_fo;
wire  data_in_axi_wvalid_fo;
wire  data_in_axi_wlast_fo;

axis_data_fifo_0 x_data_in_fifo(
.s_axis_aclk (hclk0),
.s_axis_aresetn(hrst_b0),
.s_axis_tdata(data_in_axi_wdata),
.s_axis_tready(data_in_axi_wready),
.s_axis_tvalid(data_in_axi_wvalid),
.s_axis_tlast(data_in_axi_wlast),
.m_axis_tdata(data_in_axi_wdata_fo),
.m_axis_tready(data_in_axi_wready_fo),
.m_axis_tvalid(data_in_axi_wvalid_fo),
.m_axis_tlast(data_in_axis_wlast_fo)
);

kws_0  x_kws_0(
        .data_in_TDATA(data_in_axi_wdata_fo),
        .data_in_TLAST(data_in_axi_wlast_fo),
        .weight_in_TDATA(weight_in_axi_wdata),
        .weight_in_TLAST(weight_in_axi_wlast),
        .control_in_TDATA(control_in_axi_wdata),
        .control_in_TLAST(control_in_axi_wlast),
        .data_out_TDATA(data_out_axi_rdata),
        .data_out_TLAST(data_out_axi_rlast),
        .ap_clk(hclk0),
        .ap_rst_n(hrst_b0),
        .control_in_TVALID(control_in_axi_wvalid),
        .control_in_TREADY(control_in_axi_wready),
        .weight_in_TVALID(weight_in_axi_wvalid),
        .weight_in_TREADY(weight_in_axi_wready),
        .data_in_TVALID(data_in_axi_wvalid_fo),
        .data_in_TREADY(data_in_axi_wready_fo),
        .data_out_TVALID(data_out_axi_rvalid),
        .data_out_TREADY(data_out_axi_rready_one_word_wire)

);

assign intr3 = data_out_axi_rvalid;
endmodule

