// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// nicap.v: Manually generated top level for nica & ikernel IPs
// 
// Wiring procdeure:
// nicap.v interface is same as ku060_all_exp_hls_wrapper.v.
// nica IP wiring borrowed from two sources:
// 1. example_hls instantiation within ku060_all_exp_hls_wrapper.v
// 2. nica instantiation within example_hls.v:
// threshold IP wiring was not available, so manually created, to match the threshold.v interface
//
// Notes:
// 1. All ik* signals curently match between the two IPs.
// 2. ik* signals are local within nicap, and not reflected in nicap interface.
// // 3. An AXIlite crossbar was added, to support single master to multiple slaves (currently up to 4). 
//
//
// Sources:
// ./netperf-verilog/sources/vlog/ku060_all_exp_hls_wrapper.v
// ./netperf-verilog/examples/exp_hls/xci/example_hls/create_xci/create_xci.srcs/sources_1/ip/example_hls/synth/example_hls.v
// ./netperf-verilog/examples/exp_hls/ip_repo/hls/hdl/verilog/nica.v
// ./netperf-verilog/hls/threshold/40Gbps/impl/ip/hdl/verilog/top.v
//
// Gabi Malka
//
//
// Status: All wiring is done (still not checked...)
// 26-Jan-2017

// Enable sigmon by default
`ifndef SIGMON_ENABLE
`define SIGMON_ENABLE 1
`endif

module exp_hls(sbu2mlx_ieee_vendor_id, sbu2mlx_product_id, sbu2mlx_product_version, sbu2mlx_caps, sbu2mlx_caps_len,
   sbu2mlx_caps_addr, mlx2sbu_clk, mlx2sbu_reset, sbu2mlx_leds_on, sbu2mlx_leds_blink, sbu2mlx_watchdog, mlx2sbu_axi4lite_aw_rdy, mlx2sbu_axi4lite_aw_vld, mlx2sbu_axi4lite_aw_addr, mlx2sbu_axi4lite_aw_prot,
   mlx2sbu_axi4lite_w_rdy, mlx2sbu_axi4lite_w_vld, mlx2sbu_axi4lite_w_data, mlx2sbu_axi4lite_w_strobe, mlx2sbu_axi4lite_b_rdy, mlx2sbu_axi4lite_b_vld, mlx2sbu_axi4lite_b_resp, mlx2sbu_axi4lite_ar_rdy, mlx2sbu_axi4lite_ar_vld, mlx2sbu_axi4lite_ar_addr,
   mlx2sbu_axi4lite_ar_prot, mlx2sbu_axi4lite_r_rdy, mlx2sbu_axi4lite_r_vld, mlx2sbu_axi4lite_r_data, mlx2sbu_axi4lite_r_resp, sbu2mlx_axi4mm_aw_rdy, sbu2mlx_axi4mm_aw_vld, sbu2mlx_axi4mm_aw_addr, sbu2mlx_axi4mm_aw_burst, sbu2mlx_axi4mm_aw_cache,
   sbu2mlx_axi4mm_aw_id, sbu2mlx_axi4mm_aw_len, sbu2mlx_axi4mm_aw_lock, sbu2mlx_axi4mm_aw_prot, sbu2mlx_axi4mm_aw_qos, sbu2mlx_axi4mm_aw_region, sbu2mlx_axi4mm_aw_size, sbu2mlx_axi4mm_w_rdy, sbu2mlx_axi4mm_w_vld, sbu2mlx_axi4mm_w_data,
   sbu2mlx_axi4mm_w_last, sbu2mlx_axi4mm_w_strobe, sbu2mlx_axi4mm_b_rdy, sbu2mlx_axi4mm_b_vld, sbu2mlx_axi4mm_b_id, sbu2mlx_axi4mm_b_resp, sbu2mlx_axi4mm_ar_rdy, sbu2mlx_axi4mm_ar_vld, sbu2mlx_axi4mm_ar_addr, sbu2mlx_axi4mm_ar_burst,
   sbu2mlx_axi4mm_ar_cache, sbu2mlx_axi4mm_ar_id, sbu2mlx_axi4mm_ar_len, sbu2mlx_axi4mm_ar_lock, sbu2mlx_axi4mm_ar_prot, sbu2mlx_axi4mm_ar_qos, sbu2mlx_axi4mm_ar_region, sbu2mlx_axi4mm_ar_size, sbu2mlx_axi4mm_r_rdy, sbu2mlx_axi4mm_r_vld,
   sbu2mlx_axi4mm_r_data, sbu2mlx_axi4mm_r_id, sbu2mlx_axi4mm_r_last, sbu2mlx_axi4mm_r_resp, mlx2sbu_axi4stream_rdy, mlx2sbu_axi4stream_vld, mlx2sbu_axi4stream_tdata, mlx2sbu_axi4stream_tkeep, mlx2sbu_axi4stream_tlast, mlx2sbu_axi4stream_tuser,
   mlx2sbu_axi4stream_tid, sbu2mlx_axi4stream_rdy, sbu2mlx_axi4stream_vld, sbu2mlx_axi4stream_tdata, sbu2mlx_axi4stream_tkeep, sbu2mlx_axi4stream_tlast, sbu2mlx_axi4stream_tuser, sbu2mlx_axi4stream_tid, nwp2sbu_axi4stream_rdy, nwp2sbu_axi4stream_vld,
   nwp2sbu_axi4stream_tdata, nwp2sbu_axi4stream_tkeep, nwp2sbu_axi4stream_tlast, nwp2sbu_axi4stream_tuser, nwp2sbu_axi4stream_tid, sbu2nwp_axi4stream_rdy, sbu2nwp_axi4stream_vld, sbu2nwp_axi4stream_tdata, sbu2nwp_axi4stream_tkeep, sbu2nwp_axi4stream_tlast,
   sbu2nwp_axi4stream_tuser, sbu2nwp_axi4stream_tid, cxp2sbu_axi4stream_rdy, cxp2sbu_axi4stream_vld, cxp2sbu_axi4stream_tdata, cxp2sbu_axi4stream_tkeep, cxp2sbu_axi4stream_tlast, cxp2sbu_axi4stream_tuser, cxp2sbu_axi4stream_tid, sbu2cxp_axi4stream_rdy,
   sbu2cxp_axi4stream_vld, sbu2cxp_axi4stream_tdata, sbu2cxp_axi4stream_tkeep, sbu2cxp_axi4stream_tlast, sbu2cxp_axi4stream_tuser, sbu2cxp_axi4stream_tid, nwp2sbu_lossy_has_credits, nwp2sbu_lossless_has_credits, cxp2sbu_lossy_has_credits, cxp2sbu_lossless_has_credits);

output [23:0] sbu2mlx_ieee_vendor_id;
output [15:0] sbu2mlx_product_id;
output [15:0] sbu2mlx_product_version;
output [31:0] sbu2mlx_caps;
output [15:0] sbu2mlx_caps_len;
output [23:0] sbu2mlx_caps_addr;

input         mlx2sbu_clk;// Working clock of 216.25MHz
input         mlx2sbu_reset;// Synchronous reset line to the clock named 'mlx2sbu_clk', active high.
output [7:0]  sbu2mlx_leds_on;
output [7:0]  sbu2mlx_leds_blink;
output        sbu2mlx_watchdog;// Watchdog signal (Should be toggled with freq > 1Hz)

output        mlx2sbu_axi4lite_aw_rdy;
input         mlx2sbu_axi4lite_aw_vld;
input [63:0]  mlx2sbu_axi4lite_aw_addr;
input [2:0]   mlx2sbu_axi4lite_aw_prot;

output        mlx2sbu_axi4lite_w_rdy;
input         mlx2sbu_axi4lite_w_vld;
input [31:0]  mlx2sbu_axi4lite_w_data;
input [3:0]   mlx2sbu_axi4lite_w_strobe;

input         mlx2sbu_axi4lite_b_rdy;
output        mlx2sbu_axi4lite_b_vld;
output [1:0]  mlx2sbu_axi4lite_b_resp;

output        mlx2sbu_axi4lite_ar_rdy;
input         mlx2sbu_axi4lite_ar_vld;
input [63:0]  mlx2sbu_axi4lite_ar_addr;
input [2:0]   mlx2sbu_axi4lite_ar_prot;

input         mlx2sbu_axi4lite_r_rdy;
output        mlx2sbu_axi4lite_r_vld;
output [31:0] mlx2sbu_axi4lite_r_data;
output [1:0]  mlx2sbu_axi4lite_r_resp;

input         sbu2mlx_axi4mm_aw_rdy;
output        sbu2mlx_axi4mm_aw_vld;
output [63:0] sbu2mlx_axi4mm_aw_addr;
output [1:0]  sbu2mlx_axi4mm_aw_burst;
output [3:0]  sbu2mlx_axi4mm_aw_cache;
output [2:0]  sbu2mlx_axi4mm_aw_id;
output [7:0]  sbu2mlx_axi4mm_aw_len;
output        sbu2mlx_axi4mm_aw_lock;
output [2:0]  sbu2mlx_axi4mm_aw_prot;
output [3:0]  sbu2mlx_axi4mm_aw_qos;
output [3:0]  sbu2mlx_axi4mm_aw_region;
output [2:0]  sbu2mlx_axi4mm_aw_size;

input         sbu2mlx_axi4mm_w_rdy;
output        sbu2mlx_axi4mm_w_vld;
output [511:0] sbu2mlx_axi4mm_w_data;
output         sbu2mlx_axi4mm_w_last;
output [63:0]  sbu2mlx_axi4mm_w_strobe;

output         sbu2mlx_axi4mm_b_rdy;
input          sbu2mlx_axi4mm_b_vld;
input [2:0]    sbu2mlx_axi4mm_b_id;
input [1:0]    sbu2mlx_axi4mm_b_resp;

input          sbu2mlx_axi4mm_ar_rdy;
output         sbu2mlx_axi4mm_ar_vld;
output [63:0]  sbu2mlx_axi4mm_ar_addr;
output [1:0]   sbu2mlx_axi4mm_ar_burst;
output [3:0]   sbu2mlx_axi4mm_ar_cache;
output [2:0]   sbu2mlx_axi4mm_ar_id;
output [7:0]   sbu2mlx_axi4mm_ar_len;
output         sbu2mlx_axi4mm_ar_lock;
output [2:0]   sbu2mlx_axi4mm_ar_prot;
output [3:0]   sbu2mlx_axi4mm_ar_qos;
output [3:0]   sbu2mlx_axi4mm_ar_region;
output [2:0]   sbu2mlx_axi4mm_ar_size;

output         sbu2mlx_axi4mm_r_rdy;
input          sbu2mlx_axi4mm_r_vld;
input [511:0]  sbu2mlx_axi4mm_r_data;
input [2:0]    sbu2mlx_axi4mm_r_id;
input          sbu2mlx_axi4mm_r_last;
input [1:0]    sbu2mlx_axi4mm_r_resp;

output         mlx2sbu_axi4stream_rdy;
input          mlx2sbu_axi4stream_vld;
input [255:0]  mlx2sbu_axi4stream_tdata;
input [31:0]   mlx2sbu_axi4stream_tkeep;
input          mlx2sbu_axi4stream_tlast;
input [11:0]   mlx2sbu_axi4stream_tuser;
input [2:0]    mlx2sbu_axi4stream_tid;

input          sbu2mlx_axi4stream_rdy;
output         sbu2mlx_axi4stream_vld;
output [255:0] sbu2mlx_axi4stream_tdata;
output [31:0]  sbu2mlx_axi4stream_tkeep;
output         sbu2mlx_axi4stream_tlast;
output [11:0]  sbu2mlx_axi4stream_tuser;
output [2:0]   sbu2mlx_axi4stream_tid;

output         nwp2sbu_axi4stream_rdy;
input          nwp2sbu_axi4stream_vld;
input [255:0]  nwp2sbu_axi4stream_tdata;
input [31:0]   nwp2sbu_axi4stream_tkeep;
input [0:0]    nwp2sbu_axi4stream_tlast;
input [11:0]   nwp2sbu_axi4stream_tuser;
input [2:0]    nwp2sbu_axi4stream_tid;

input          sbu2nwp_axi4stream_rdy;
output         sbu2nwp_axi4stream_vld;
output [255:0] sbu2nwp_axi4stream_tdata;
output [31:0]  sbu2nwp_axi4stream_tkeep;
output         sbu2nwp_axi4stream_tlast;
output [11:0]  sbu2nwp_axi4stream_tuser;
output [2:0]   sbu2nwp_axi4stream_tid;

output         cxp2sbu_axi4stream_rdy;
input          cxp2sbu_axi4stream_vld;
input [255:0]  cxp2sbu_axi4stream_tdata;
input [31:0]   cxp2sbu_axi4stream_tkeep;
input          cxp2sbu_axi4stream_tlast;
input [11:0]   cxp2sbu_axi4stream_tuser;
input [2:0]    cxp2sbu_axi4stream_tid;

input          sbu2cxp_axi4stream_rdy;
output         sbu2cxp_axi4stream_vld;
output [255:0] sbu2cxp_axi4stream_tdata;
output [31:0]  sbu2cxp_axi4stream_tkeep;
output         sbu2cxp_axi4stream_tlast;
output [11:0]  sbu2cxp_axi4stream_tuser;
output [2:0]   sbu2cxp_axi4stream_tid;

input          nwp2sbu_lossy_has_credits;
input          nwp2sbu_lossless_has_credits;
input          cxp2sbu_lossy_has_credits;
input          cxp2sbu_lossless_has_credits;

///////////////////////////////////////////////////////////////////////////////

  reg [23:0]   sbu2mlx_ieee_vendor_id_r;

// VERSION // ID
//assign         sbu2mlx_ieee_vendor_id  = 24'h0002c9;          // Mellanox OUI
// Assigning a TCE specific ID, at AXI-lite address 0x900020
// Useful to verify that NICA bit file has been properly loaded into the FPGA
assign         sbu2mlx_ieee_vendor_id  = sbu2mlx_ieee_vendor_id_r;        // Technion, TCE. read at address 0x900020
assign         sbu2mlx_product_id      = 16'd4;                           // @address 0x900024
assign         sbu2mlx_product_version = `BUILD_NUMBER;                   // @address 0x900024
assign         sbu2mlx_caps            = 32'd0;                           // @address 0x900028
assign         sbu2mlx_caps_len        = 16'd0;                           // @address 0x90002c
assign         sbu2mlx_caps_addr       = 24'd0;                           // @address 0x900034

wire           temp1;
wire           temp2;
 
// AXIlite crossbar: single master ==> multiple slaves
// Local signals for AXIlite outputs
  localparam
    // AXIlite IO space zones, split between the various slaves:
    AXILITE_ADDR_WIDTH = 32,
    AXILITE_BASE0   = 32'h0000, // NICA
    AXILITE_BASE1   = 32'h1000, // ik0
    AXILITE_BASE2   = 32'h2000, // ik1
    AXILITE_BASE3   = 32'h3000, // ik2
    AXILITE_BASE4   = 32'h4000, // ik3
    AXILITE_BASE5   = 32'h5000, // ik4
    AXILITE_BASE6   = 32'h6000, // ik5
    AXILITE_BASE7   = 32'h7000, // ik6
    AXILITE_BASE8   = 32'h8000, // sigmon internal registers
    AXILITE_BASE9   = 32'h9000, // ddr read/write address mapping table
    AXILITE_BASE10  = 32'ha000, // Reserved
    AXILITE_TIMEOUT = 32'd100;  // Max 100 clocks are allowed for an axilite slave to respond to read/write, after which the axilite_timeout_slave will respond
  
  localparam CONST_ZERO = 1'b0;
  localparam METADATA_WIDTH = 255;

  wire [METADATA_WIDTH:0] ik0_host_metadata_input_V_V_TDATA;
  wire [295:0] ik0_host_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik0_host_metadata_output_V_V_TDATA;
  wire [295:0] ik0_host_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik0_net_metadata_input_V_V_TDATA;
  wire [295:0] ik0_net_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik0_net_metadata_output_V_V_TDATA;
  wire [295:0] ik0_net_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik1_host_metadata_input_V_V_TDATA;
  wire [295:0] ik1_host_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik1_host_metadata_output_V_V_TDATA;
  wire [295:0] ik1_host_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik1_net_metadata_input_V_V_TDATA;
  wire [295:0] ik1_net_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik1_net_metadata_output_V_V_TDATA;
  wire [295:0] ik1_net_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik2_host_metadata_input_V_V_TDATA;
  wire [295:0] ik2_host_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik2_host_metadata_output_V_V_TDATA;
  wire [295:0] ik2_host_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik2_net_metadata_input_V_V_TDATA;
  wire [295:0] ik2_net_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik2_net_metadata_output_V_V_TDATA;
  wire [295:0] ik2_net_data_output_V_V_TDATA;
  wire [295:0] ik2_control_ikernel2host_V_V_TDATA;
  wire [295:0] ik2_control_host2ikernel_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik3_host_metadata_input_V_V_TDATA;
  wire [295:0] ik3_host_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik3_host_metadata_output_V_V_TDATA;
  wire [295:0] ik3_host_data_output_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik3_net_metadata_input_V_V_TDATA;
  wire [295:0] ik3_net_data_input_V_V_TDATA;
  wire [METADATA_WIDTH:0] ik3_net_metadata_output_V_V_TDATA;
  wire [295:0] ik3_net_data_output_V_V_TDATA;
  wire [295:0] ik3_control_ikernel2host_V_V_TDATA;
  wire [295:0] ik3_control_host2ikernel_V_V_TDATA;
  wire [31:0]  waddr2ikernels;
  wire [31:0]  raddr2ikernels;
  wire [31:0]  dram_test_status;

  reg  	       nica_AXILiteS_AWVALID;
  reg  	       nica_AXILiteS_ARVALID;
  wire 	       nica_AXILiteS_AWREADY;
  wire 	       nica_AXILiteS_ARREADY;
  wire 	       nica_AXILiteS_WREADY;
  wire 	       nica_AXILiteS_RVALID;
  wire [31:0]  nica_AXILiteS_RDATA;
  wire 	       nica_AXILiteS_BVALID;
  wire [1:0]   nica_AXILiteS_BRESP;
  wire [1:0]   nica_AXILiteS_RRESP;
  reg  	       ik0_AXILiteS_AWVALID;
  reg  	       ik0_AXILiteS_ARVALID;
  wire 	       ik0_AXILiteS_AWREADY;
  wire 	       ik0_AXILiteS_ARREADY;
  wire 	       ik0_AXILiteS_WREADY;
  wire 	       ik0_AXILiteS_RVALID;
  wire [31:0]  ik0_AXILiteS_RDATA;
  wire 	       ik0_AXILiteS_BVALID;
  wire [1:0]   ik0_AXILiteS_BRESP;
  wire [1:0]   ik0_AXILiteS_RRESP;
  reg  	       ik1_AXILiteS_AWVALID;
  reg  	       ik1_AXILiteS_ARVALID;
  wire 	       ik1_AXILiteS_AWREADY;
  wire 	       ik1_AXILiteS_ARREADY;
  wire 	       ik1_AXILiteS_WREADY;
  wire 	       ik1_AXILiteS_RVALID;
  wire [31:0]  ik1_AXILiteS_RDATA;
  wire 	       ik1_AXILiteS_BVALID;
  wire [1:0]   ik1_AXILiteS_BRESP;
  wire [1:0]   ik1_AXILiteS_RRESP;
  reg  	       ik2_AXILiteS_AWVALID;
  reg  	       ik2_AXILiteS_ARVALID;
  wire 	       ik2_AXILiteS_AWREADY;
  wire 	       ik2_AXILiteS_ARREADY;
  wire 	       ik2_AXILiteS_WREADY;
  wire 	       ik2_AXILiteS_RVALID;
  wire [31:0]  ik2_AXILiteS_RDATA;
  wire 	       ik2_AXILiteS_BVALID;
  wire [1:0]   ik2_AXILiteS_BRESP;
  wire [1:0]   ik2_AXILiteS_RRESP;
  reg  	       sigmon_AXILiteS_AWVALID;
  reg  	       sigmon_AXILiteS_ARVALID;
  wire 	       sigmon_AXILiteS_AWREADY;
  wire 	       sigmon_AXILiteS_ARREADY;
  wire 	       sigmon_AXILiteS_WREADY;
  wire 	       sigmon_AXILiteS_RVALID;
  wire [31:0]  sigmon_AXILiteS_RDATA;
  wire 	       sigmon_AXILiteS_BVALID;
  wire [1:0]   sigmon_AXILiteS_BRESP;
  wire [1:0]   sigmon_AXILiteS_RRESP;
  reg  	       ddrwrtable_AXILiteS_AWVALID;
  wire 	       ddrwrtable_AXILiteS_AWREADY;
  wire 	       ddrwrtable_AXILiteS_WREADY;
  wire 	       ddrwrtable_AXILiteS_BVALID;
  wire [1:0]   ddrwrtable_AXILiteS_BRESP;
  wire 	       ddrrdtable_AXILiteS_AWREADY_unconnected;
  wire 	       ddrrdtable_AXILiteS_WREADY_unconnected;
  wire 	       ddrrdtable_AXILiteS_BVALID_unconnected;
  wire [1:0]   ddrrdtable_AXILiteS_BRESP_unconnected;
  reg  	       timeout_AXILiteS_AWVALID;
  reg  	       timeout_AXILiteS_ARVALID;
  wire 	       timeout_AXILiteS_AWREADY;
  wire 	       timeout_AXILiteS_ARREADY;
  wire 	       timeout_AXILiteS_WREADY;
  wire 	       timeout_AXILiteS_RVALID;
  wire [31:0]  timeout_AXILiteS_RDATA;
  wire 	       timeout_AXILiteS_BVALID;
  wire [1:0]   timeout_AXILiteS_BRESP;
  wire [1:0]   timeout_AXILiteS_RRESP;

  wire [AXILITE_ADDR_WIDTH-1 : 0] waddr;
  wire [AXILITE_ADDR_WIDTH-1 : 0] raddr;

  reg  	       axilite_write_nica;
  reg  	       axilite_write_ik0;
  reg  	       axilite_write_ik1;
  reg  	       axilite_write_ik2;
  reg  	       axilite_write_sigmon;
  reg  	       axilite_write_ddrwrtable;
//  reg  	       axilite_write_ddrrdtable;
  reg  	       axilite_read_nica;
  reg  	       axilite_read_ik0;
  reg  	       axilite_read_ik1;
  reg  	       axilite_read_ik2;
  reg  	       axilite_read_sigmon;
  wire         axilite_read_none;
  wire         axilite_write_none;
  reg  	       axilite_read_timeout;
  reg  	       axilite_write_timeout;
  reg [31:0]   axilite_read_timeout_counter;
  reg [31:0]   axilite_write_timeout_counter;

// sbu to cxp data fifo
  wire [255:0] sbu2cxpfifo_axi4stream_tdata;  
  wire         sbu2cxpfifo_axi4stream_vld;
  wire         sbu2cxpfifo_axi4stream_rdy;
  wire [31:0]  sbu2cxpfifo_axi4stream_tkeep;
  wire         sbu2cxpfifo_axi4stream_tlast;
  wire [2:0]   sbu2cxpfifo_axi4stream_tid;
  wire [11:0]  sbu2cxpfifo_axi4stream_tuser;

  
// sbu to nwp data fifo
  wire [255:0] sbu2nwpfifo_axi4stream_tdata;  
  wire         sbu2nwpfifo_axi4stream_vld;
  wire         sbu2nwpfifo_axi4stream_rdy;
  wire [31:0]  sbu2nwpfifo_axi4stream_tkeep;
  wire         sbu2nwpfifo_axi4stream_tlast;
  wire [2:0]   sbu2nwpfifo_axi4stream_tid;
  wire [11:0]  sbu2nwpfifo_axi4stream_tuser;

// {cxp,nwp} fifo to credit mask
  wire sbu2nwp_m_axis_tvalid;
  wire sbu2cxp_m_axis_tvalid;
// {cxp,nwp} fifo from credit mask
  wire sbu2nwp_m_axis_tready;
  wire sbu2cxp_m_axis_tready;
  
  reg  sbu2cxp_packet_in_flight;
  reg  sbu2nwp_packet_in_flight;

  wire [15:0] nica_events;

  wire [7:0] not_connected;
  wire 	     ikernel_event0, ikernel_event1, ikernel_event2, ikernel_event3, ikernel_event4;
  reg 	     ikernel_event0_Q, ikernel_event1_Q, ikernel_event2_Q, ikernel_event3_Q, ikernel_event4_Q;
  reg 	     ikernel_event0_on, ikernel_event1_on, ikernel_event2_on, ikernel_event3_on, ikernel_event4_on;
  reg 	     ikernel_event0_off, ikernel_event1_off, ikernel_event2_off, ikernel_event3_off, ikernel_event4_off;
  
  wire not_connected_mem_mem_V_AWUSER,
       not_connected_mem_mem_V_WUSER,
       not_connected_mem_mem_V_ARUSER;
  wire [2:0] not_connected_mem_mem_V_WID;
  wire not_connected_mem_mem_V_BUSER = 1'b0;
  wire not_connected_mem_mem_V_RUSER = 1'b0;
  wire [63:0] ik2map_axi4mm_aw_addr;
  wire [63:0] ik2map_axi4mm_ar_addr;
  wire [31:0] sbu2mlx_axi4mm_aw_addr_low;
  wire [31:0] sbu2mlx_axi4mm_ar_addr_low;

  wire 	      ik2map_axi4mm_aw_vld;
  wire 	      ik2map_axi4mm_aw_rdy;
  wire [2:0]  ik2map_axi4mm_aw_id = 0;
  wire [7:0]  ik2map_axi4mm_aw_len = 0;
  wire [2:0]  ik2map_axi4mm_aw_size = 3'd6;
  wire [1:0]  ik2map_axi4mm_aw_burst = 2'b01;
  wire [1:0]  ik2map_axi4mm_aw_lock = 0;
  wire [3:0]  ik2map_axi4mm_aw_cache = 0;
  wire [2:0]  ik2map_axi4mm_aw_prot = 0;
  wire [3:0]  ik2map_axi4mm_aw_qos = 0;
  wire [3:0]  ik2map_axi4mm_aw_region = 0;
  wire 	      ik2map_axi4mm_ar_vld;
  wire 	      ik2map_axi4mm_ar_rdy;
  wire [2:0]  ik2map_axi4mm_ar_id = 0;
  wire [7:0]  ik2map_axi4mm_ar_len = 0;
  wire [2:0]  ik2map_axi4mm_ar_size = 3'd6;
  wire [1:0]  ik2map_axi4mm_ar_burst = 2'b01;
  wire [1:0]  ik2map_axi4mm_ar_lock = 0;
  wire [3:0]  ik2map_axi4mm_ar_cache = 0;
  wire [2:0]  ik2map_axi4mm_ar_prot = 0;
  wire [3:0]  ik2map_axi4mm_ar_qos = 0;
  wire [3:0]  ik2map_axi4mm_ar_region = 0;

  wire [1:0]  sbu2mlx_axi4mm_aw_lock_axi3;
  wire [1:0]  sbu2mlx_axi4mm_ar_lock_axi3;

  
  assign ik2map_axi4mm_aw_addr[5:0] = 0;
  assign ik2map_axi4mm_ar_addr[5:0] = 0;
  assign sbu2mlx_axi4mm_aw_addr = {32'h00000004, sbu2mlx_axi4mm_aw_addr_low};
  assign sbu2mlx_axi4mm_ar_addr = {32'h00000004, sbu2mlx_axi4mm_ar_addr_low};


// Testing: Cancelling nica to nwp pushback in nwp2sbu port
// test_mode, originated from sigmon, is qualified to packet start/end, before being used for pushback
// See sigmon_top.v for more details
  wire 	      nwp2sbu_axi4stream_rdy_temp, test_mode;
  reg 	      force_sbu2nwp_rdy;

  always @(posedge mlx2sbu_clk) begin
    if (mlx2sbu_reset) begin
      force_sbu2nwp_rdy <= 1'b0;
    end
    else begin
      if (nwp2sbu_axi4stream_rdy & nwp2sbu_axi4stream_vld & nwp2sbu_axi4stream_tlast)
	force_sbu2nwp_rdy <= test_mode;
    end
  end

  assign nwp2sbu_axi4stream_rdy = nwp2sbu_axi4stream_rdy_temp | force_sbu2nwp_rdy;


`define NUM_TC 3

  localparam TC_FIFO_METADATA_WIDTH = 249;
  localparam TC_FIFO_DATA_WIDTH = 288;

  wire [TC_FIFO_METADATA_WIDTH:0] h2n_tc_meta_din[`NUM_TC:0];
  wire [TC_FIFO_METADATA_WIDTH:0] h2n_tc_meta_dout[`NUM_TC:0];
  wire         h2n_tc_meta_full[`NUM_TC:0];
  wire         h2n_tc_meta_empty[`NUM_TC:0];
  wire         h2n_tc_meta_read[`NUM_TC:0];
  wire         h2n_tc_meta_write[`NUM_TC:0];
  wire [9:0]   h2n_tc_meta_count[`NUM_TC:0];

  wire [TC_FIFO_DATA_WIDTH:0] h2n_tc_data_din[`NUM_TC:0];
  wire [TC_FIFO_DATA_WIDTH:0] h2n_tc_data_dout[`NUM_TC:0];
  wire         h2n_tc_data_full[`NUM_TC:0];
  wire         h2n_tc_data_empty[`NUM_TC:0];
  wire         h2n_tc_data_read[`NUM_TC:0];
  wire         h2n_tc_data_write[`NUM_TC:0];
  wire [9:0]   h2n_tc_data_count[`NUM_TC:0];

  wire [TC_FIFO_METADATA_WIDTH:0] n2h_tc_meta_din[`NUM_TC:0];
  wire [TC_FIFO_METADATA_WIDTH:0] n2h_tc_meta_dout[`NUM_TC:0];
  wire         n2h_tc_meta_full[`NUM_TC:0];
  wire         n2h_tc_meta_empty[`NUM_TC:0];
  wire         n2h_tc_meta_read[`NUM_TC:0];
  wire         n2h_tc_meta_write[`NUM_TC:0];
  wire [9:0]   n2h_tc_meta_count[`NUM_TC:0];

  wire [TC_FIFO_DATA_WIDTH:0] n2h_tc_data_din[`NUM_TC:0];
  wire [TC_FIFO_DATA_WIDTH:0] n2h_tc_data_dout[`NUM_TC:0];
  wire         n2h_tc_data_full[`NUM_TC:0];
  wire         n2h_tc_data_empty[`NUM_TC:0];
  wire         n2h_tc_data_read[`NUM_TC:0];
  wire         n2h_tc_data_write[`NUM_TC:0];
  wire [9:0]   n2h_tc_data_count[`NUM_TC:0];

  localparam TC_COUNTS_WIDTH = (`NUM_TC + 1) * 10 - 1;
  reg [TC_COUNTS_WIDTH:0] n2h_tc_data_counts;
  reg [TC_COUNTS_WIDTH:0] n2h_tc_meta_counts;
  reg [TC_COUNTS_WIDTH:0] h2n_tc_data_counts;
  reg [TC_COUNTS_WIDTH:0] h2n_tc_meta_counts;

  /* Concatenate all counts for HLS */
  integer counts_tc_index;
  always @(*) begin
    for (counts_tc_index = 0; counts_tc_index <= `NUM_TC; counts_tc_index = counts_tc_index + 1) begin
      n2h_tc_meta_counts[counts_tc_index * 10 +: 10] = n2h_tc_meta_count[counts_tc_index];
      n2h_tc_data_counts[counts_tc_index * 10 +: 10] = n2h_tc_data_count[counts_tc_index];
      h2n_tc_meta_counts[counts_tc_index * 10 +: 10] = h2n_tc_meta_count[counts_tc_index];
      h2n_tc_data_counts[counts_tc_index * 10 +: 10] = h2n_tc_data_count[counts_tc_index];
    end
  end

// FIFOs
genvar i;
generate
  for (i = 0; i <= `NUM_TC; i = i + 1) begin : tc
    tc_data_512x289b h2n_tc_data0 (
      .clk(mlx2sbu_clk),
      .srst(mlx2sbu_reset),

      .din(h2n_tc_data_din[i]),
      .dout(h2n_tc_data_dout[i]),
      .wr_en(h2n_tc_data_write[i]),
      .rd_en(h2n_tc_data_read[i]),
      .full(h2n_tc_data_full[i]),
      .empty(h2n_tc_data_empty[i]),
      .data_count(h2n_tc_data_count[i])
    );
    tc_meta_512 h2n_tc_meta0 (
      .clk(mlx2sbu_clk),
      .srst(mlx2sbu_reset),

      .din(h2n_tc_meta_din[i]),
      .dout(h2n_tc_meta_dout[i]),
      .wr_en(h2n_tc_meta_write[i]),
      .rd_en(h2n_tc_meta_read[i]),
      .full(h2n_tc_meta_full[i]),
      .empty(h2n_tc_meta_empty[i]),
      .data_count(h2n_tc_meta_count[i])
    );

    tc_data_512x289b n2h_tc_data0 (
      .clk(mlx2sbu_clk),
      .srst(mlx2sbu_reset),

      .din(n2h_tc_data_din[i]),
      .dout(n2h_tc_data_dout[i]),
      .wr_en(n2h_tc_data_write[i]),
      .rd_en(n2h_tc_data_read[i]),
      .full(n2h_tc_data_full[i]),
      .empty(n2h_tc_data_empty[i]),
      .data_count(n2h_tc_data_count[i])
    );
    tc_meta_512 n2h_tc_meta0 (
      .clk(mlx2sbu_clk),
      .srst(mlx2sbu_reset),

      .din(n2h_tc_meta_din[i]),
      .dout(n2h_tc_meta_dout[i]),
      .wr_en(n2h_tc_meta_write[i]),
      .rd_en(n2h_tc_meta_read[i]),
      .full(n2h_tc_meta_full[i]),
      .empty(n2h_tc_meta_empty[i]),
      .data_count(n2h_tc_meta_count[i])
    );
  end
endgenerate
///////////////////////////////////////////////////////////////////////////////
// nica IP:
///////////////////////////////////////////////////////////////////////////////
  
  nica_nica #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(32),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
  ) nica0 (

// nica wiring borrowed from example_hls instantiation within ku060_all_exp_hls_wrapper.v:
        .ap_clk(mlx2sbu_clk),
        .ap_rst_n(~mlx2sbu_reset),


        .prt_nw2sbu_TDATA(nwp2sbu_axi4stream_tdata),
        .prt_nw2sbu_TVALID(nwp2sbu_axi4stream_vld),
        .prt_nw2sbu_TREADY(nwp2sbu_axi4stream_rdy_temp),
        .prt_nw2sbu_TKEEP(nwp2sbu_axi4stream_tkeep),
        .prt_nw2sbu_TLAST(nwp2sbu_axi4stream_tlast),
        .prt_nw2sbu_TID(nwp2sbu_axi4stream_tid),
        .prt_nw2sbu_TUSER(nwp2sbu_axi4stream_tuser),

        .prt_cx2sbu_TDATA(cxp2sbu_axi4stream_tdata),
        .prt_cx2sbu_TVALID(cxp2sbu_axi4stream_vld),
        .prt_cx2sbu_TREADY(cxp2sbu_axi4stream_rdy),
        .prt_cx2sbu_TKEEP(cxp2sbu_axi4stream_tkeep),
        .prt_cx2sbu_TLAST(cxp2sbu_axi4stream_tlast),
        .prt_cx2sbu_TID(cxp2sbu_axi4stream_tid),
        .prt_cx2sbu_TUSER(cxp2sbu_axi4stream_tuser),

        .sbu2prt_nw_TDATA(sbu2nwpfifo_axi4stream_tdata),
        .sbu2prt_nw_TVALID(sbu2nwpfifo_axi4stream_vld),
        .sbu2prt_nw_TREADY(sbu2nwpfifo_axi4stream_rdy),
        .sbu2prt_nw_TKEEP(sbu2nwpfifo_axi4stream_tkeep),
        .sbu2prt_nw_TLAST(sbu2nwpfifo_axi4stream_tlast),
        .sbu2prt_nw_TID(sbu2nwpfifo_axi4stream_tid),
        .sbu2prt_nw_TUSER(sbu2nwpfifo_axi4stream_tuser),

        .sbu2prt_cx_TDATA(sbu2cxpfifo_axi4stream_tdata),
        .sbu2prt_cx_TVALID(sbu2cxpfifo_axi4stream_vld),
        .sbu2prt_cx_TREADY(sbu2cxpfifo_axi4stream_rdy),
        .sbu2prt_cx_TKEEP(sbu2cxpfifo_axi4stream_tkeep),
        .sbu2prt_cx_TLAST(sbu2cxpfifo_axi4stream_tlast),
        .sbu2prt_cx_TID(sbu2cxpfifo_axi4stream_tid),
        .sbu2prt_cx_TUSER(sbu2cxpfifo_axi4stream_tuser),

        .s_axi_AXILiteS_AWREADY(nica_AXILiteS_AWREADY),
        .s_axi_AXILiteS_AWVALID(nica_AXILiteS_AWVALID),
        .s_axi_AXILiteS_AWADDR(waddr2ikernels),
        // .axi4lite_aw_prot(mlx2sbu_axi4lite_aw_prot),

        .s_axi_AXILiteS_WVALID(mlx2sbu_axi4lite_w_vld),
        .s_axi_AXILiteS_WREADY(nica_AXILiteS_WREADY),
        .s_axi_AXILiteS_WDATA(mlx2sbu_axi4lite_w_data),
        .s_axi_AXILiteS_WSTRB(mlx2sbu_axi4lite_w_strobe),

        .s_axi_AXILiteS_ARVALID(nica_AXILiteS_ARVALID),
        .s_axi_AXILiteS_ARREADY(nica_AXILiteS_ARREADY),
        .s_axi_AXILiteS_ARADDR(raddr2ikernels),
        // .axi4lite_ar_prot(mlx2sbu_axi4lite_ar_prot),

        .s_axi_AXILiteS_BVALID(nica_AXILiteS_BVALID),
        .s_axi_AXILiteS_BREADY(mlx2sbu_axi4lite_b_rdy),
        .s_axi_AXILiteS_BRESP(nica_AXILiteS_BRESP),

        .s_axi_AXILiteS_RVALID(nica_AXILiteS_RVALID),
        .s_axi_AXILiteS_RREADY(mlx2sbu_axi4lite_r_rdy),
        .s_axi_AXILiteS_RDATA(nica_AXILiteS_RDATA),
        .s_axi_AXILiteS_RRESP(nica_AXILiteS_RRESP),
// end of nica wiring borrowed from ku060_all_exp_hls_wrapper.v

    .events_0_V(not_connected[0]),
    .events_1_V(not_connected[1]),
    .events_2_V(not_connected[2]),
    .events_3_V(not_connected[3]),
    .events_4_V(not_connected[4]),
    .events_5_V(not_connected[5]),
    .events_6_V(not_connected[6]),
    .events_7_V(not_connected[7]),

        .ik0_events_0_V(CONST_ZERO),
        .ik0_events_1_V(CONST_ZERO),
        .ik0_events_2_V(CONST_ZERO),
        .ik0_events_3_V(CONST_ZERO),
        .ik0_events_4_V(CONST_ZERO),
        .ik0_events_5_V(CONST_ZERO),
        .ik0_events_6_V(CONST_ZERO),
	.ik0_events_7_V(CONST_ZERO),

// nica wiring borrowed from nica instantiation within example_hls.v:
// nica to/from first ikernel
    .ik0_host_metadata_input_V_V_TVALID(ik0_host_metadata_input_V_V_TVALID),
    .ik0_host_metadata_input_V_V_TREADY(ik0_host_metadata_input_V_V_TREADY),
    .ik0_host_metadata_input_V_V_TDATA(ik0_host_metadata_input_V_V_TDATA),
    .ik0_host_data_input_V_V_TVALID(ik0_host_data_input_V_V_TVALID),
    .ik0_host_data_input_V_V_TREADY(ik0_host_data_input_V_V_TREADY),
    .ik0_host_data_input_V_V_TDATA(ik0_host_data_input_V_V_TDATA),
    .ik0_host_metadata_output_V_V_TVALID(ik0_host_metadata_output_V_V_TVALID),
    .ik0_host_metadata_output_V_V_TREADY(ik0_host_metadata_output_V_V_TREADY),
    .ik0_host_metadata_output_V_V_TDATA(ik0_host_metadata_output_V_V_TDATA),
    .ik0_host_data_output_V_V_TVALID(ik0_host_data_output_V_V_TVALID),
    .ik0_host_data_output_V_V_TREADY(ik0_host_data_output_V_V_TREADY),
    .ik0_host_data_output_V_V_TDATA(ik0_host_data_output_V_V_TDATA),
    .ik0_net_metadata_input_V_V_TVALID(ik0_net_metadata_input_V_V_TVALID),
    .ik0_net_metadata_input_V_V_TREADY(ik0_net_metadata_input_V_V_TREADY),
    .ik0_net_metadata_input_V_V_TDATA(ik0_net_metadata_input_V_V_TDATA),
    .ik0_net_data_input_V_V_TVALID(ik0_net_data_input_V_V_TVALID),
    .ik0_net_data_input_V_V_TREADY(ik0_net_data_input_V_V_TREADY),
    .ik0_net_data_input_V_V_TDATA(ik0_net_data_input_V_V_TDATA),
    .ik0_net_metadata_output_V_V_TVALID(ik0_net_metadata_output_V_V_TVALID),
    .ik0_net_metadata_output_V_V_TREADY(ik0_net_metadata_output_V_V_TREADY),
    .ik0_net_metadata_output_V_V_TDATA(ik0_net_metadata_output_V_V_TDATA),
    .ik0_net_data_output_V_V_TVALID(ik0_net_data_output_V_V_TVALID),
    .ik0_net_data_output_V_V_TREADY(ik0_net_data_output_V_V_TREADY),
    .ik0_net_data_output_V_V_TDATA(ik0_net_data_output_V_V_TDATA),

// nica to/from second ikernel
`ifdef NUM_IKERNELS_GT_1
    ,
    .ik1_host_metadata_input_V_V_TVALID(ik1_host_metadata_input_V_V_TVALID),
    .ik1_host_metadata_input_V_V_TREADY(ik1_host_metadata_input_V_V_TREADY),
    .ik1_host_metadata_input_V_V_TDATA(ik1_host_metadata_input_V_V_TDATA),
    .ik1_host_data_input_V_V_TVALID(ik1_host_data_input_V_V_TVALID),
    .ik1_host_data_input_V_V_TREADY(ik1_host_data_input_V_V_TREADY),
    .ik1_host_data_input_V_V_TDATA(ik1_host_data_input_V_V_TDATA),
    .ik1_host_metadata_output_V_V_TVALID(ik1_host_metadata_output_V_V_TVALID),
    .ik1_host_metadata_output_V_V_TREADY(ik1_host_metadata_output_V_V_TREADY),
    .ik1_host_metadata_output_V_V_TDATA(ik1_host_metadata_output_V_V_TDATA),
    .ik1_host_data_output_V_V_TVALID(ik1_host_data_output_V_V_TVALID),
    .ik1_host_data_output_V_V_TREADY(ik1_host_data_output_V_V_TREADY),
    .ik1_host_data_output_V_V_TDATA(ik1_host_data_output_V_V_TDATA),
    .ik1_net_metadata_input_V_V_TVALID(ik1_net_metadata_input_V_V_TVALID),
    .ik1_net_metadata_input_V_V_TREADY(ik1_net_metadata_input_V_V_TREADY),
    .ik1_net_metadata_input_V_V_TDATA(ik1_net_metadata_input_V_V_TDATA),
    .ik1_net_data_input_V_V_TVALID(ik1_net_data_input_V_V_TVALID),
    .ik1_net_data_input_V_V_TREADY(ik1_net_data_input_V_V_TREADY),
    .ik1_net_data_input_V_V_TDATA(ik1_net_data_input_V_V_TDATA),
    .ik1_net_metadata_output_V_V_TVALID(ik1_net_metadata_output_V_V_TVALID),
    .ik1_net_metadata_output_V_V_TREADY(ik1_net_metadata_output_V_V_TREADY),
    .ik1_net_metadata_output_V_V_TDATA(ik1_net_metadata_output_V_V_TDATA),
    .ik1_net_data_output_V_V_TVALID(ik1_net_data_output_V_V_TVALID),
    .ik1_net_data_output_V_V_TREADY(ik1_net_data_output_V_V_TREADY),
    .ik1_net_data_output_V_V_TDATA(ik1_net_data_output_V_V_TDATA),
// end of nica wiring borrowed from example_hls.v
`endif

    // h2n TC meta0
    .h2n_tc_out_meta0_V_V_din(h2n_tc_meta_din[0]),
    .h2n_tc_out_meta0_V_V_full_n(~h2n_tc_meta_full[0]),
    .h2n_tc_out_meta0_V_V_write(h2n_tc_meta_write[0]),
    .h2n_tc_in_meta0_V_V_dout(h2n_tc_meta_dout[0]),
    .h2n_tc_in_meta0_V_V_empty_n(~h2n_tc_meta_empty[0]),
    .h2n_tc_in_meta0_V_V_read(h2n_tc_meta_read[0]),

    // h2n TC data0
    .h2n_tc_out_data0_V_V_din(h2n_tc_data_din[0]),
    .h2n_tc_out_data0_V_V_full_n(~h2n_tc_data_full[0]),
    .h2n_tc_out_data0_V_V_write(h2n_tc_data_write[0]),
    .h2n_tc_in_data0_V_V_dout(h2n_tc_data_dout[0]),
    .h2n_tc_in_data0_V_V_empty_n(~h2n_tc_data_empty[0]),
    .h2n_tc_in_data0_V_V_read(h2n_tc_data_read[0]),

    // n2h TC meta0
    .n2h_tc_out_meta0_V_V_din(n2h_tc_meta_din[0]),
    .n2h_tc_out_meta0_V_V_full_n(~n2h_tc_meta_full[0]),
    .n2h_tc_out_meta0_V_V_write(n2h_tc_meta_write[0]),
    .n2h_tc_in_meta0_V_V_dout(n2h_tc_meta_dout[0]),
    .n2h_tc_in_meta0_V_V_empty_n(~n2h_tc_meta_empty[0]),
    .n2h_tc_in_meta0_V_V_read(n2h_tc_meta_read[0]),

    // n2h TC data0
    .n2h_tc_out_data0_V_V_din(n2h_tc_data_din[0]),
    .n2h_tc_out_data0_V_V_full_n(~n2h_tc_data_full[0]),
    .n2h_tc_out_data0_V_V_write(n2h_tc_data_write[0]),
    .n2h_tc_in_data0_V_V_dout(n2h_tc_data_dout[0]),
    .n2h_tc_in_data0_V_V_empty_n(~n2h_tc_data_empty[0]),
    .n2h_tc_in_data0_V_V_read(n2h_tc_data_read[0]),

    // h2n TC meta1
    .h2n_tc_out_meta1_V_V_din(h2n_tc_meta_din[1]),
    .h2n_tc_out_meta1_V_V_full_n(~h2n_tc_meta_full[1]),
    .h2n_tc_out_meta1_V_V_write(h2n_tc_meta_write[1]),
    .h2n_tc_in_meta1_V_V_dout(h2n_tc_meta_dout[1]),
    .h2n_tc_in_meta1_V_V_empty_n(~h2n_tc_meta_empty[1]),
    .h2n_tc_in_meta1_V_V_read(h2n_tc_meta_read[1]),

    // h2n TC data1
    .h2n_tc_out_data1_V_V_din(h2n_tc_data_din[1]),
    .h2n_tc_out_data1_V_V_full_n(~h2n_tc_data_full[1]),
    .h2n_tc_out_data1_V_V_write(h2n_tc_data_write[1]),
    .h2n_tc_in_data1_V_V_dout(h2n_tc_data_dout[1]),
    .h2n_tc_in_data1_V_V_empty_n(~h2n_tc_data_empty[1]),
    .h2n_tc_in_data1_V_V_read(h2n_tc_data_read[1]),

    // n2h TC meta1
    .n2h_tc_out_meta1_V_V_din(n2h_tc_meta_din[1]),
    .n2h_tc_out_meta1_V_V_full_n(~n2h_tc_meta_full[1]),
    .n2h_tc_out_meta1_V_V_write(n2h_tc_meta_write[1]),
    .n2h_tc_in_meta1_V_V_dout(n2h_tc_meta_dout[1]),
    .n2h_tc_in_meta1_V_V_empty_n(~n2h_tc_meta_empty[1]),
    .n2h_tc_in_meta1_V_V_read(n2h_tc_meta_read[1]),

    // n2h TC data1
    .n2h_tc_out_data1_V_V_din(n2h_tc_data_din[1]),
    .n2h_tc_out_data1_V_V_full_n(~n2h_tc_data_full[1]),
    .n2h_tc_out_data1_V_V_write(n2h_tc_data_write[1]),
    .n2h_tc_in_data1_V_V_dout(n2h_tc_data_dout[1]),
    .n2h_tc_in_data1_V_V_empty_n(~n2h_tc_data_empty[1]),
    .n2h_tc_in_data1_V_V_read(n2h_tc_data_read[1]),

    // h2n TC meta2
    .h2n_tc_out_meta2_V_V_din(h2n_tc_meta_din[2]),
    .h2n_tc_out_meta2_V_V_full_n(~h2n_tc_meta_full[2]),
    .h2n_tc_out_meta2_V_V_write(h2n_tc_meta_write[2]),
    .h2n_tc_in_meta2_V_V_dout(h2n_tc_meta_dout[2]),
    .h2n_tc_in_meta2_V_V_empty_n(~h2n_tc_meta_empty[2]),
    .h2n_tc_in_meta2_V_V_read(h2n_tc_meta_read[2]),

    // h2n TC data2
    .h2n_tc_out_data2_V_V_din(h2n_tc_data_din[2]),
    .h2n_tc_out_data2_V_V_full_n(~h2n_tc_data_full[2]),
    .h2n_tc_out_data2_V_V_write(h2n_tc_data_write[2]),
    .h2n_tc_in_data2_V_V_dout(h2n_tc_data_dout[2]),
    .h2n_tc_in_data2_V_V_empty_n(~h2n_tc_data_empty[2]),
    .h2n_tc_in_data2_V_V_read(h2n_tc_data_read[2]),

    // n2h TC meta2
    .n2h_tc_out_meta2_V_V_din(n2h_tc_meta_din[2]),
    .n2h_tc_out_meta2_V_V_full_n(~n2h_tc_meta_full[2]),
    .n2h_tc_out_meta2_V_V_write(n2h_tc_meta_write[2]),
    .n2h_tc_in_meta2_V_V_dout(n2h_tc_meta_dout[2]),
    .n2h_tc_in_meta2_V_V_empty_n(~n2h_tc_meta_empty[2]),
    .n2h_tc_in_meta2_V_V_read(n2h_tc_meta_read[2]),

    // n2h TC data2
    .n2h_tc_out_data2_V_V_din(n2h_tc_data_din[2]),
    .n2h_tc_out_data2_V_V_full_n(~n2h_tc_data_full[2]),
    .n2h_tc_out_data2_V_V_write(n2h_tc_data_write[2]),
    .n2h_tc_in_data2_V_V_dout(n2h_tc_data_dout[2]),
    .n2h_tc_in_data2_V_V_empty_n(~n2h_tc_data_empty[2]),
    .n2h_tc_in_data2_V_V_read(n2h_tc_data_read[2]),

    // h2n TC meta3
    .h2n_tc_out_meta3_V_V_din(h2n_tc_meta_din[3]),
    .h2n_tc_out_meta3_V_V_full_n(~h2n_tc_meta_full[3]),
    .h2n_tc_out_meta3_V_V_write(h2n_tc_meta_write[3]),
    .h2n_tc_in_meta3_V_V_dout(h2n_tc_meta_dout[3]),
    .h2n_tc_in_meta3_V_V_empty_n(~h2n_tc_meta_empty[3]),
    .h2n_tc_in_meta3_V_V_read(h2n_tc_meta_read[3]),

    // h2n TC data3
    .h2n_tc_out_data3_V_V_din(h2n_tc_data_din[3]),
    .h2n_tc_out_data3_V_V_full_n(~h2n_tc_data_full[3]),
    .h2n_tc_out_data3_V_V_write(h2n_tc_data_write[3]),
    .h2n_tc_in_data3_V_V_dout(h2n_tc_data_dout[3]),
    .h2n_tc_in_data3_V_V_empty_n(~h2n_tc_data_empty[3]),
    .h2n_tc_in_data3_V_V_read(h2n_tc_data_read[3]),

    // n2h TC meta3
    .n2h_tc_out_meta3_V_V_din(n2h_tc_meta_din[3]),
    .n2h_tc_out_meta3_V_V_full_n(~n2h_tc_meta_full[3]),
    .n2h_tc_out_meta3_V_V_write(n2h_tc_meta_write[3]),
    .n2h_tc_in_meta3_V_V_dout(n2h_tc_meta_dout[3]),
    .n2h_tc_in_meta3_V_V_empty_n(~n2h_tc_meta_empty[3]),
    .n2h_tc_in_meta3_V_V_read(n2h_tc_meta_read[3]),

    // n2h TC data3
    .n2h_tc_out_data3_V_V_din(n2h_tc_data_din[3]),
    .n2h_tc_out_data3_V_V_full_n(~n2h_tc_data_full[3]),
    .n2h_tc_out_data3_V_V_write(n2h_tc_data_write[3]),
    .n2h_tc_in_data3_V_V_dout(n2h_tc_data_dout[3]),
    .n2h_tc_in_data3_V_V_empty_n(~n2h_tc_data_empty[3]),
    .n2h_tc_in_data3_V_V_read(n2h_tc_data_read[3])
   );
  

///////////////////////////////////////////////////////////////////////////////
// ikernel IP:
///////////////////////////////////////////////////////////////////////////////

`define ADD_TOP(name) ``name``_``name``_top

`ADD_TOP(`IKERNEL0) #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(32),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
) ikernel0 (

    .s_axi_AXILiteS_AWREADY(ik0_AXILiteS_AWREADY),
    .s_axi_AXILiteS_AWVALID(ik0_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWADDR(waddr2ikernels),
    // .axi4lite_aw_prot(mlx2sbu_axi4lite_aw_prot),
    
    .s_axi_AXILiteS_WVALID(mlx2sbu_axi4lite_w_vld),
    .s_axi_AXILiteS_WREADY(ik0_AXILiteS_WREADY),
    .s_axi_AXILiteS_WDATA(mlx2sbu_axi4lite_w_data),
    .s_axi_AXILiteS_WSTRB(mlx2sbu_axi4lite_w_strobe),
    
    .s_axi_AXILiteS_ARVALID(ik0_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(ik0_AXILiteS_ARREADY),
    .s_axi_AXILiteS_ARADDR(raddr2ikernels),
    // .axi4lite_ar_prot(mlx2sbu_axi4lite_ar_prot),
    
    .s_axi_AXILiteS_BVALID(ik0_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(mlx2sbu_axi4lite_b_rdy),
    .s_axi_AXILiteS_BRESP(ik0_AXILiteS_BRESP),
    
    .s_axi_AXILiteS_RVALID(ik0_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(mlx2sbu_axi4lite_r_rdy),
    .s_axi_AXILiteS_RDATA(ik0_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(ik0_AXILiteS_RRESP),

    .ap_clk(mlx2sbu_clk),
    .ap_rst_n(~mlx2sbu_reset),

    .ik_host_metadata_output_V_V_TDATA(ik0_host_metadata_output_V_V_TDATA),
    .ik_host_metadata_output_V_V_TVALID(ik0_host_metadata_output_V_V_TVALID),
    .ik_host_metadata_output_V_V_TREADY(ik0_host_metadata_output_V_V_TREADY),

    .ik_host_metadata_input_V_V_TDATA(ik0_host_metadata_input_V_V_TDATA),
    .ik_host_metadata_input_V_V_TVALID(ik0_host_metadata_input_V_V_TVALID),
    .ik_host_metadata_input_V_V_TREADY(ik0_host_metadata_input_V_V_TREADY),

    .ik_host_data_output_V_V_TDATA(ik0_host_data_output_V_V_TDATA),
    .ik_host_data_output_V_V_TVALID(ik0_host_data_output_V_V_TVALID),
    .ik_host_data_output_V_V_TREADY(ik0_host_data_output_V_V_TREADY),

    .ik_host_data_input_V_V_TDATA(ik0_host_data_input_V_V_TDATA),
    .ik_host_data_input_V_V_TVALID(ik0_host_data_input_V_V_TVALID),
    .ik_host_data_input_V_V_TREADY(ik0_host_data_input_V_V_TREADY),

    .ik_net_metadata_output_V_V_TDATA(ik0_net_metadata_output_V_V_TDATA),
    .ik_net_metadata_output_V_V_TVALID(ik0_net_metadata_output_V_V_TVALID),
    .ik_net_metadata_output_V_V_TREADY(ik0_net_metadata_output_V_V_TREADY),

    .ik_net_metadata_input_V_V_TDATA(ik0_net_metadata_input_V_V_TDATA),
    .ik_net_metadata_input_V_V_TVALID(ik0_net_metadata_input_V_V_TVALID),
    .ik_net_metadata_input_V_V_TREADY(ik0_net_metadata_input_V_V_TREADY),

    .ik_net_data_output_V_V_TDATA(ik0_net_data_output_V_V_TDATA),
    .ik_net_data_output_V_V_TVALID(ik0_net_data_output_V_V_TVALID),
    .ik_net_data_output_V_V_TREADY(ik0_net_data_output_V_V_TREADY),

    .ik_net_data_input_V_V_TDATA(ik0_net_data_input_V_V_TDATA),
    .ik_net_data_input_V_V_TVALID(ik0_net_data_input_V_V_TVALID),
    .ik_net_data_input_V_V_TREADY(ik0_net_data_input_V_V_TREADY),

//DRAM interface:
    .ik_mem_aw_stream_V_V_TVALID(ik2map_axi4mm_aw_vld),
    .ik_mem_aw_stream_V_V_TREADY(ik2map_axi4mm_aw_rdy),
    .ik_mem_aw_stream_V_V_TDATA(ik2map_axi4mm_aw_addr[45:6]),

    .ik_mem_w_stream_V_V_TVALID(sbu2mlx_axi4mm_w_vld),
    .ik_mem_w_stream_V_V_TREADY(sbu2mlx_axi4mm_w_rdy),
    .ik_mem_w_stream_V_V_TDATA(sbu2mlx_axi4mm_w_data),

    .ik_mem_b_stream_V_TREADY(sbu2mlx_axi4mm_b_rdy),
    .ik_mem_b_stream_V_TVALID(sbu2mlx_axi4mm_b_vld),
    .ik_mem_b_stream_V_TDATA({7'b0, ~|sbu2mlx_axi4mm_b_resp}),

    .ik_mem_ar_stream_V_V_TVALID(ik2map_axi4mm_ar_vld),
    .ik_mem_ar_stream_V_V_TREADY(ik2map_axi4mm_ar_rdy),
    .ik_mem_ar_stream_V_V_TDATA(ik2map_axi4mm_ar_addr[45:6]),

    .ik_mem_r_stream_V_V_TVALID(sbu2mlx_axi4mm_r_vld),
    .ik_mem_r_stream_V_V_TREADY(sbu2mlx_axi4mm_r_rdy),
    .ik_mem_r_stream_V_V_TDATA(sbu2mlx_axi4mm_r_data),

        .ik_events_0_V(ikernel_event0),
        .ik_events_1_V(ikernel_event1),
        .ik_events_2_V(ikernel_event2),
        .ik_events_3_V(ikernel_event3),
        .ik_events_4_V(ikernel_event4),
        .ik_events_5_V(CONST_ZERO),
        .ik_events_6_V(CONST_ZERO),
        .ik_events_7_V(CONST_ZERO),

    .tc_net_tc_data_counts_V(n2h_tc_data_counts),
    .tc_net_tc_meta_counts_V(n2h_tc_meta_counts),
    .tc_host_tc_data_counts_V(h2n_tc_data_counts),
    .tc_host_tc_meta_counts_V(h2n_tc_meta_counts)
);

assign sbu2mlx_axi4mm_w_strobe = 64'hffffffff_ffffffff;
assign sbu2mlx_axi4mm_w_last = 1'b1;

`ifdef NUM_IKERNELS_GT_1
`ADD_TOP(`IKERNEL1) #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(32),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
) ikernel1 (

    .s_axi_AXILiteS_AWREADY(ik1_AXILiteS_AWREADY),
    .s_axi_AXILiteS_AWVALID(ik1_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWADDR(waddr2ikernels),
    // .axi4lite_aw_prot(mlx2sbu_axi4lite_aw_prot),
    
    .s_axi_AXILiteS_WVALID(mlx2sbu_axi4lite_w_vld),
    .s_axi_AXILiteS_WREADY(ik1_AXILiteS_WREADY),
    .s_axi_AXILiteS_WDATA(mlx2sbu_axi4lite_w_data),
    .s_axi_AXILiteS_WSTRB(mlx2sbu_axi4lite_w_strobe),
    
    .s_axi_AXILiteS_ARVALID(ik1_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(ik1_AXILiteS_ARREADY),
    .s_axi_AXILiteS_ARADDR(raddr2ikernels),
    // .axi4lite_ar_prot(mlx2sbu_axi4lite_ar_prot),
    
    .s_axi_AXILiteS_BVALID(ik1_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(mlx2sbu_axi4lite_b_rdy),
    .s_axi_AXILiteS_BRESP(ik1_AXILiteS_BRESP),
    
    .s_axi_AXILiteS_RVALID(ik1_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(mlx2sbu_axi4lite_r_rdy),
    .s_axi_AXILiteS_RDATA(ik1_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(ik1_AXILiteS_RRESP),

    .ap_clk(mlx2sbu_clk),
    .ap_rst_n(~mlx2sbu_reset),

    .ik_host_metadata_output_V_V_TDATA(ik1_host_metadata_output_V_V_TDATA),
    .ik_host_metadata_output_V_V_TVALID(ik1_host_metadata_output_V_V_TVALID),
    .ik_host_metadata_output_V_V_TREADY(ik1_host_metadata_output_V_V_TREADY),

    .ik_host_metadata_input_V_V_TDATA(ik1_host_metadata_input_V_V_TDATA),
    .ik_host_metadata_input_V_V_TVALID(ik1_host_metadata_input_V_V_TVALID),
    .ik_host_metadata_input_V_V_TREADY(ik1_host_metadata_input_V_V_TREADY),

    .ik_host_data_output_V_V_TDATA(ik1_host_data_output_V_V_TDATA),
    .ik_host_data_output_V_V_TVALID(ik1_host_data_output_V_V_TVALID),
    .ik_host_data_output_V_V_TREADY(ik1_host_data_output_V_V_TREADY),

    .ik_host_data_input_V_V_TDATA(ik1_host_data_input_V_V_TDATA),
    .ik_host_data_input_V_V_TVALID(ik1_host_data_input_V_V_TVALID),
    .ik_host_data_input_V_V_TREADY(ik1_host_data_input_V_V_TREADY),

    .ik_net_metadata_output_V_V_TDATA(ik1_net_metadata_output_V_V_TDATA),
    .ik_net_metadata_output_V_V_TVALID(ik1_net_metadata_output_V_V_TVALID),
    .ik_net_metadata_output_V_V_TREADY(ik1_net_metadata_output_V_V_TREADY),

    .ik_net_metadata_input_V_V_TDATA(ik1_net_metadata_input_V_V_TDATA),
    .ik_net_metadata_input_V_V_TVALID(ik1_net_metadata_input_V_V_TVALID),
    .ik_net_metadata_input_V_V_TREADY(ik1_net_metadata_input_V_V_TREADY),

    .ik_net_data_output_V_V_TDATA(ik1_net_data_output_V_V_TDATA),
    .ik_net_data_output_V_V_TVALID(ik1_net_data_output_V_V_TVALID),
    .ik_net_data_output_V_V_TREADY(ik1_net_data_output_V_V_TREADY),

    .ik_net_data_input_V_V_TDATA(ik1_net_data_input_V_V_TDATA),
    .ik_net_data_input_V_V_TVALID(ik1_net_data_input_V_V_TVALID),
    .ik_net_data_input_V_V_TREADY(ik1_net_data_input_V_V_TREADY)
);
`endif

// end of ikernel axilite signals  

// while ik2 axilite port is not used...
  assign ik2_AXILiteS_AWREADY = 1'b0;
  assign ik2_AXILiteS_WREADY = 1'b0;
  assign ik2_AXILiteS_BVALID = 1'b0;
  assign ik2_AXILiteS_BRESP = 2'b0;
  assign ik2_AXILiteS_ARREADY = 1'b0;
  assign ik2_AXILiteS_RVALID = 1'b0;
  assign ik2_AXILiteS_RDATA = 32'b0;
  assign ik2_AXILiteS_RRESP = 2'b0;

// AXI4-Lite crossbar: single master ==> multiple slaves
//
// AXIlite write:

// Actual write addres to nica & ikernels
  assign waddr2ikernels = {19'b0,
                           mlx2sbu_axi4lite_aw_addr[15] | mlx2sbu_axi4lite_aw_addr[14] | mlx2sbu_axi4lite_aw_addr[13] | mlx2sbu_axi4lite_aw_addr[12],
                           mlx2sbu_axi4lite_aw_addr[11:0]};
  assign waddr = mlx2sbu_axi4lite_aw_addr[AXILITE_ADDR_WIDTH-1:0];
  assign axilite_write_none = !axilite_write_nica & !axilite_write_ik0 & !axilite_write_ik1 & !axilite_write_ik2 & !axilite_write_sigmon & !axilite_write_ddrwrtable & !axilite_write_timeout;
  assign mlx2sbu_axi4lite_aw_rdy = axilite_write_nica & nica_AXILiteS_AWREADY |
				    axilite_write_ik0  &  ik0_AXILiteS_AWREADY |
				    axilite_write_ik1  &  ik1_AXILiteS_AWREADY |
				    axilite_write_ik2  &  ik2_AXILiteS_AWREADY |
				    axilite_write_sigmon  &  sigmon_AXILiteS_AWREADY |
				    axilite_write_ddrwrtable  &  ddrwrtable_AXILiteS_AWREADY |
//				    axilite_write_ddrrdtable  &  ddrrdtable_AXILiteS_AWREADY |
				    axilite_write_timeout  &  timeout_AXILiteS_AWREADY;

  assign  mlx2sbu_axi4lite_w_rdy = (axilite_write_nica) & nica_AXILiteS_WREADY | 
			       	   (axilite_write_ik0) & ik0_AXILiteS_WREADY   |
			       	   (axilite_write_ik1) & ik1_AXILiteS_WREADY   |
			       	   (axilite_write_ik2) & ik2_AXILiteS_WREADY   |
			       	   (axilite_write_sigmon) & sigmon_AXILiteS_WREADY   |
			       	   (axilite_write_ddrwrtable) & ddrwrtable_AXILiteS_WREADY   |
//			       	   (axilite_write_ddrrdtable) & ddrrdtable_AXILiteS_WREADY   |
			       	   (axilite_write_timeout) & timeout_AXILiteS_WREADY;

  assign  mlx2sbu_axi4lite_b_vld = (axilite_write_nica) & nica_AXILiteS_BVALID | 
			       	   (axilite_write_ik0) & ik0_AXILiteS_BVALID   |
			       	   (axilite_write_ik1) & ik1_AXILiteS_BVALID   |
			       	   (axilite_write_ik2) & ik2_AXILiteS_BVALID   |
			       	   (axilite_write_sigmon) & sigmon_AXILiteS_BVALID   |
			       	   (axilite_write_ddrwrtable) & ddrwrtable_AXILiteS_BVALID   |
//			       	   (axilite_write_ddrrdtable) & ddrrdtable_AXILiteS_BVALID   |
			       	   (axilite_write_timeout) & timeout_AXILiteS_BVALID;

  assign  mlx2sbu_axi4lite_b_resp = (axilite_write_timeout) ? timeout_AXILiteS_BRESP :
                                    (axilite_write_nica) ? nica_AXILiteS_BRESP : 
			       	    (axilite_write_ik0) ? ik0_AXILiteS_BRESP   :
			       	    (axilite_write_ik1) ? ik1_AXILiteS_BRESP   :
			       	    (axilite_write_ik2) ? ik2_AXILiteS_BRESP   :
			       	    (axilite_write_ddrwrtable) ? ddrwrtable_AXILiteS_BRESP   :
//			       	    (axilite_write_ddrrdtable) ? ddrrdtable_AXILiteS_BRESP   :
			       	    (axilite_write_sigmon) ? sigmon_AXILiteS_BRESP   : 2'b0;

//AXIlite read:
  assign raddr2ikernels = {19'b0,
                           mlx2sbu_axi4lite_ar_addr[15] | mlx2sbu_axi4lite_ar_addr[14] | mlx2sbu_axi4lite_ar_addr[13] | mlx2sbu_axi4lite_ar_addr[12],
                           mlx2sbu_axi4lite_ar_addr[11:0]};
  assign raddr = mlx2sbu_axi4lite_ar_addr[AXILITE_ADDR_WIDTH-1:0];
  assign axilite_read_none = !axilite_read_nica & !axilite_read_ik0 & !axilite_read_ik1 & !axilite_read_ik2 & !axilite_read_sigmon & !axilite_read_timeout;
  assign mlx2sbu_axi4lite_ar_rdy = axilite_read_nica & nica_AXILiteS_ARREADY |
				    axilite_read_ik0  &  ik0_AXILiteS_ARREADY |
				    axilite_read_ik1  &  ik1_AXILiteS_ARREADY |
				    axilite_read_ik2  &  ik2_AXILiteS_ARREADY |
				    axilite_read_sigmon  &  sigmon_AXILiteS_ARREADY |
                                    axilite_read_timeout & timeout_AXILiteS_ARREADY;

  assign  mlx2sbu_axi4lite_r_vld = (axilite_read_nica) & nica_AXILiteS_RVALID | 
			       	   (axilite_read_ik0) & ik0_AXILiteS_RVALID   |
			       	   (axilite_read_ik1) & ik1_AXILiteS_RVALID   |
			       	   (axilite_read_ik2) & ik2_AXILiteS_RVALID   |
			       	   (axilite_read_sigmon) & sigmon_AXILiteS_RVALID   |
			       	   (axilite_read_timeout) & timeout_AXILiteS_RVALID;

  assign  mlx2sbu_axi4lite_r_data = (axilite_read_timeout) ? timeout_AXILiteS_RDATA :
                                    (axilite_read_nica) ? nica_AXILiteS_RDATA : 
			       	    (axilite_read_ik0) ? ik0_AXILiteS_RDATA   :
			       	    (axilite_read_ik1) ? ik1_AXILiteS_RDATA   :
			       	    (axilite_read_ik2) ? ik2_AXILiteS_RDATA   :
			       	    (axilite_read_sigmon) ? sigmon_AXILiteS_RDATA   : 32'b0;

  assign  mlx2sbu_axi4lite_r_resp = (axilite_read_timeout) ? timeout_AXILiteS_RRESP :
                                    (axilite_read_nica) ? nica_AXILiteS_RRESP : 
			       	    (axilite_read_ik0) ? ik0_AXILiteS_RRESP   :
			       	    (axilite_read_ik1) ? ik1_AXILiteS_RRESP   :
			       	    (axilite_read_ik2) ? ik2_AXILiteS_RRESP   :
			       	    (axilite_read_sigmon) ? sigmon_AXILiteS_RRESP   : 2'b0;
  


// Check which slave IO space is being addressed
  always @(posedge mlx2sbu_clk) begin
    if (mlx2sbu_reset) begin
      nica_AXILiteS_AWVALID <= 1'b0;
      ik0_AXILiteS_AWVALID <= 1'b0;
      ik1_AXILiteS_AWVALID <= 1'b0;
      ik2_AXILiteS_AWVALID <= 1'b0;
      sigmon_AXILiteS_AWVALID <= 1'b0;
      ddrwrtable_AXILiteS_AWVALID <= 1'b0;
//      ddrrdtable_AXILiteS_AWVALID <= 1'b0;
      timeout_AXILiteS_AWVALID <= 1'b0;
      nica_AXILiteS_ARVALID <= 1'b0;
      ik0_AXILiteS_ARVALID <= 1'b0;
      ik1_AXILiteS_ARVALID <= 1'b0;
      ik2_AXILiteS_ARVALID <= 1'b0;
      sigmon_AXILiteS_ARVALID <= 1'b0;
//      ddrwrtable_AXILiteS_ARVALID <= 1'b0;
//      ddrrdtable_AXILiteS_ARVALID <= 1'b0;
      timeout_AXILiteS_ARVALID <= 1'b0;
      axilite_write_nica <= 1'b0;
      axilite_write_ik0 <= 1'b0;
      axilite_write_ik1 <= 1'b0;
      axilite_write_ik2 <= 1'b0;
      axilite_write_sigmon <= 1'b0;
      axilite_write_ddrwrtable <= 1'b0;
//      axilite_write_ddrrdtable <= 1'b0;
      axilite_read_nica <= 1'b0;
      axilite_read_ik0 <= 1'b0;
      axilite_read_ik1 <= 1'b0;
      axilite_read_ik2 <= 1'b0;
      axilite_read_sigmon <= 1'b0;
      axilite_read_timeout <= 1'b0;
      axilite_write_timeout <= 1'b0;
      axilite_read_timeout_counter <= 32'b0;
      axilite_write_timeout_counter <= 32'b0;
      

// Setting a unique NICA ID, readable from AXI-lite address 0x900020.
      sbu2mlx_ieee_vendor_id_r <= 24'hace2ce;
    end
    else begin       

// Check & register the accessed AXI-lite slave:
// nica_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE0 && waddr < AXILITE_BASE1) & axilite_write_none) begin
	axilite_write_nica <= 1'b1;
	nica_AXILiteS_AWVALID <= 1'b1;
      end
      if (nica_AXILiteS_AWVALID & axilite_write_nica & nica_AXILiteS_AWREADY)
	nica_AXILiteS_AWVALID <= 1'b0;

// ik0_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE1 && waddr < AXILITE_BASE2) & axilite_write_none) begin
	axilite_write_ik0 <= 1'b1;
	ik0_AXILiteS_AWVALID <= 1'b1;
      end
      if (ik0_AXILiteS_AWVALID & axilite_write_ik0 & ik0_AXILiteS_AWREADY)
	ik0_AXILiteS_AWVALID <= 1'b0;

// ik1_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE2 && waddr < AXILITE_BASE3) & axilite_write_none) begin
	axilite_write_ik1 <= 1'b1;
	ik1_AXILiteS_AWVALID <= 1'b1;
      end
      if (ik1_AXILiteS_AWVALID & axilite_write_ik1 & ik1_AXILiteS_AWREADY)
	ik1_AXILiteS_AWVALID <= 1'b0;

// ik2_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE3 && waddr < AXILITE_BASE4) & axilite_write_none) begin
	axilite_write_ik2 <= 1'b1;
	ik2_AXILiteS_AWVALID <= 1'b1;
      end
      if (ik2_AXILiteS_AWVALID & axilite_write_ik2 & ik2_AXILiteS_AWREADY)
	ik2_AXILiteS_AWVALID <= 1'b0;
      
// sigmon_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE8 && waddr < AXILITE_BASE9) & axilite_write_none) begin
	axilite_write_sigmon <= 1'b1;
	sigmon_AXILiteS_AWVALID <= 1'b1;
      end
      if (sigmon_AXILiteS_AWVALID & axilite_write_sigmon & sigmon_AXILiteS_AWREADY)
	sigmon_AXILiteS_AWVALID <= 1'b0;
      
// ddr_wradrs_table_write
      if (mlx2sbu_axi4lite_aw_vld & (waddr >= AXILITE_BASE9 && waddr < AXILITE_BASE10) & axilite_write_none) begin
	axilite_write_ddrwrtable <= 1'b1;
	ddrwrtable_AXILiteS_AWVALID <= 1'b1;
      end
      if (ddrwrtable_AXILiteS_AWVALID & axilite_write_ddrwrtable & ddrwrtable_AXILiteS_AWREADY)
	ddrwrtable_AXILiteS_AWVALID <= 1'b0;
            
// timeout_write
      if (mlx2sbu_axi4lite_aw_vld & (axilite_write_timeout_counter >= AXILITE_TIMEOUT)) begin
	axilite_write_timeout <= 1'b1;
	timeout_AXILiteS_AWVALID <= 1'b1;
      end
      if (timeout_AXILiteS_AWVALID & axilite_write_timeout & timeout_AXILiteS_AWREADY)
	timeout_AXILiteS_AWVALID <= 1'b0;

      
// nica_read
      if (mlx2sbu_axi4lite_ar_vld & (raddr >= AXILITE_BASE0 && raddr < AXILITE_BASE1) & axilite_read_none) begin
	axilite_read_nica <= 1'b1;
	nica_AXILiteS_ARVALID <= 1'b1;
      end
      if (nica_AXILiteS_ARVALID & axilite_read_nica & nica_AXILiteS_ARREADY)
	nica_AXILiteS_ARVALID <= 1'b0;

// ik0_read
      if (mlx2sbu_axi4lite_ar_vld & (raddr >= AXILITE_BASE1 && raddr < AXILITE_BASE2) & axilite_read_none) begin
	axilite_read_ik0 <= 1'b1;
	ik0_AXILiteS_ARVALID <= 1'b1;
      end
      if (ik0_AXILiteS_ARVALID & axilite_read_ik0 & ik0_AXILiteS_ARREADY)
	ik0_AXILiteS_ARVALID <= 1'b0;

// ik1_read
      if (mlx2sbu_axi4lite_ar_vld & (raddr >= AXILITE_BASE2 && raddr < AXILITE_BASE3) & axilite_read_none) begin
	axilite_read_ik1 <= 1'b1;
	ik1_AXILiteS_ARVALID <= 1'b1;
      end
      if (ik1_AXILiteS_ARVALID & axilite_read_ik1 & ik1_AXILiteS_ARREADY)
	ik1_AXILiteS_ARVALID <= 1'b0;

// ik2_read
      if (mlx2sbu_axi4lite_ar_vld & (raddr >= AXILITE_BASE3 && raddr < AXILITE_BASE4) & axilite_read_none) begin
	axilite_read_ik2 <= 1'b1;
	ik2_AXILiteS_ARVALID <= 1'b1;
      end
      if (ik2_AXILiteS_ARVALID & axilite_read_ik2 & ik2_AXILiteS_ARREADY)
	ik2_AXILiteS_ARVALID <= 1'b0;

// sigmon_read
      if (mlx2sbu_axi4lite_ar_vld & (raddr >= AXILITE_BASE8 && raddr < AXILITE_BASE9) & axilite_read_none) begin
	axilite_read_sigmon <= 1'b1;
	sigmon_AXILiteS_ARVALID <= 1'b1;
      end
      if (sigmon_AXILiteS_ARVALID & axilite_read_sigmon & sigmon_AXILiteS_ARREADY)
	sigmon_AXILiteS_ARVALID <= 1'b0;

// timeout_read
      if (mlx2sbu_axi4lite_ar_vld & (axilite_read_timeout_counter >= AXILITE_TIMEOUT)) begin
	axilite_read_timeout <= 1'b1;
	timeout_AXILiteS_ARVALID <= 1'b1;
      end
      if (timeout_AXILiteS_ARVALID & axilite_read_timeout & timeout_AXILiteS_ARREADY)
	timeout_AXILiteS_ARVALID <= 1'b0;


// AXIlite timeout counters
// As long as ar_vld, aw_vld, the counters are ticking.
// Will be cleared once a read/write operation ended normally.
      if (mlx2sbu_axi4lite_ar_vld) begin
	axilite_read_timeout_counter <= axilite_read_timeout_counter + 1;
      end
      if (mlx2sbu_axi4lite_aw_vld) begin
	axilite_write_timeout_counter <= axilite_write_timeout_counter + 1;
      end
      

// Clear all write_select signals if a write to either of the slaves is on going and BVALID & BREADY.
// Since all write_select signals are mutex, it does not matter which slave drove the BVALID.
	if (!axilite_write_none & mlx2sbu_axi4lite_b_vld & mlx2sbu_axi4lite_b_rdy) begin
	  axilite_write_nica <= 1'b0;
	  axilite_write_ik0 <= 1'b0;
	  axilite_write_ik1 <= 1'b0;
	  axilite_write_ik2 <= 1'b0;
	  axilite_write_sigmon <= 1'b0;
	  axilite_write_ddrwrtable <= 1'b0;
//	  axilite_write_ddrrdtable <= 1'b0;
	  axilite_write_timeout <= 1'b0;
	  axilite_write_timeout_counter <= 32'b0;
	end

// Clear all read_select signals if a read from either of the slaves is on going and RVALID & RREADY.
// Since all read_select signals are mutex, it does not matter which slave drove the RVALID.
	if (!axilite_read_none & mlx2sbu_axi4lite_r_vld & mlx2sbu_axi4lite_r_rdy) begin
	  axilite_read_nica <= 1'b0;
	  axilite_read_ik0 <= 1'b0;
	  axilite_read_ik1 <= 1'b0;
	  axilite_read_ik2 <= 1'b0;
	  axilite_read_sigmon <= 1'b0;
	  axilite_read_timeout <= 1'b0;
	  axilite_read_timeout_counter <= 32'b0;
	end
      
    end
  end

  // 64 deep store & forward fifos.
  // For more fifo details, see <netperf-verilog_workarea>/sources/xci/axis_data_fifo_0/axis_data_fifo_0.xci
  axis_data_fifo_0 sbu2cxp_data_fifo (
  .s_axis_aresetn(~mlx2sbu_reset),          // input wire s_axis_aresetn
  .s_axis_aclk(mlx2sbu_clk),                // input wire s_axis_aclk
  .s_axis_tvalid(sbu2cxpfifo_axi4stream_vld),            // input wire s_axis_tvalid
  .s_axis_tready(sbu2cxpfifo_axi4stream_rdy),            // output wire s_axis_tready
  .s_axis_tdata(sbu2cxpfifo_axi4stream_tdata),              // input wire [255 : 0] s_axis_tdata
  .s_axis_tkeep(sbu2cxpfifo_axi4stream_tkeep),              // input wire [31 : 0] s_axis_tkeep
  .s_axis_tlast(sbu2cxpfifo_axi4stream_tlast),              // input wire s_axis_tlast
  .s_axis_tid(sbu2cxpfifo_axi4stream_tid),                  // input wire [2 : 0] s_axis_tid
  .s_axis_tuser(sbu2cxpfifo_axi4stream_tuser),              // input wire [11 : 0] s_axis_tuser
  .m_axis_tvalid(sbu2cxp_m_axis_tvalid),   // output wire m_axis_tvalid
  .m_axis_tready(sbu2cxp_m_axis_tready),   // input wire m_axis_tready
  .m_axis_tdata(sbu2cxp_axi4stream_tdata),  // output wire [255 : 0] m_axis_tdata
  .m_axis_tkeep(sbu2cxp_axi4stream_tkeep),  // output wire [31 : 0] m_axis_tkeep
  .m_axis_tlast(sbu2cxp_axi4stream_tlast),  // output wire m_axis_tlast
  .m_axis_tid(sbu2cxp_axi4stream_tid),      // output wire [2 : 0] m_axis_tid
  .m_axis_tuser(sbu2cxp_axi4stream_tuser)   // output wire [11 : 0] m_axis_tuser
);

  axis_data_fifo_0 sbu2nwp_data_fifo (
  .s_axis_aresetn(~mlx2sbu_reset),          // input wire s_axis_aresetn
  .s_axis_aclk(mlx2sbu_clk),                // input wire s_axis_aclk
  .s_axis_tvalid(sbu2nwpfifo_axi4stream_vld),            // input wire s_axis_tvalid
  .s_axis_tready(sbu2nwpfifo_axi4stream_rdy),            // output wire s_axis_tready
  .s_axis_tdata(sbu2nwpfifo_axi4stream_tdata),              // input wire [255 : 0] s_axis_tdata
  .s_axis_tkeep(sbu2nwpfifo_axi4stream_tkeep),              // input wire [31 : 0] s_axis_tkeep
  .s_axis_tlast(sbu2nwpfifo_axi4stream_tlast),              // input wire s_axis_tlast
  .s_axis_tid(sbu2nwpfifo_axi4stream_tid),                  // input wire [2 : 0] s_axis_tid
  .s_axis_tuser(sbu2nwpfifo_axi4stream_tuser),              // input wire [11 : 0] s_axis_tuser
  .m_axis_tvalid(sbu2nwp_m_axis_tvalid),   // output wire m_axis_tvalid
  .m_axis_tready(sbu2nwp_m_axis_tready),   // input wire m_axis_tready
  .m_axis_tdata(sbu2nwp_axi4stream_tdata),  // output wire [255 : 0] m_axis_tdata
  .m_axis_tkeep(sbu2nwp_axi4stream_tkeep),  // output wire [31 : 0] m_axis_tkeep
  .m_axis_tlast(sbu2nwp_axi4stream_tlast),  // output wire m_axis_tlast
  .m_axis_tid(sbu2nwp_axi4stream_tid),      // output wire [2 : 0] m_axis_tid
  .m_axis_tuser(sbu2nwp_axi4stream_tuser)   // output wire [11 : 0] m_axis_tuser
);

// Mark packets end at each axi-stream interface
// This indication is used to generate next packet start (*_sop) indication
always @(posedge mlx2sbu_clk) begin
  if (mlx2sbu_reset) begin
    sbu2cxp_packet_in_flight <= 1'b0;
    sbu2nwp_packet_in_flight <= 1'b0;
  end
  else begin
// sbu2cxp:
    if (sbu2cxp_axi4stream_vld & sbu2cxp_axi4stream_rdy) begin
       sbu2cxp_packet_in_flight <= ~sbu2cxp_axi4stream_tlast;
    end
// sbu2nwp:
    if (sbu2nwp_axi4stream_vld & sbu2nwp_axi4stream_rdy) begin
       sbu2nwp_packet_in_flight <= ~sbu2nwp_axi4stream_tlast;
    end
  end
end

// Derive ikernel events:
always @(posedge mlx2sbu_clk) begin
  if (mlx2sbu_reset) begin
    ikernel_event0_Q <= 1'b0;
    ikernel_event1_Q <= 1'b0;
    ikernel_event0_on <= 1'b0;
    ikernel_event0_off <= 1'b0;
    ikernel_event1_on <= 1'b0;
    ikernel_event1_off <= 1'b0;
    ikernel_event2_on <= 1'b0;
    ikernel_event2_off <= 1'b0;
    ikernel_event3_on <= 1'b0;
    ikernel_event3_off <= 1'b0;
    ikernel_event4_on <= 1'b0;
    ikernel_event4_off <= 1'b0;
  end
  else begin
    ikernel_event0_Q <= ikernel_event0;
    ikernel_event1_Q <= ikernel_event1;
    ikernel_event2_Q <= ikernel_event2;
    ikernel_event3_Q <= ikernel_event3;
    ikernel_event4_Q <= ikernel_event4;

    if (~ikernel_event0_Q & ikernel_event0)
      ikernel_event0_on <= 1'b1;
    if (ikernel_event0_on)
      ikernel_event0_on <= 1'b0;

    if (ikernel_event0_Q & ~ikernel_event0)
      ikernel_event0_off <= 1'b1;
    if (ikernel_event0_off)
      ikernel_event0_off <= 1'b0;

    if (~ikernel_event1_Q & ikernel_event1)
      ikernel_event1_on <= 1'b1;
    if (ikernel_event1_on)
      ikernel_event1_on <= 1'b0;

    if (ikernel_event1_Q & ~ikernel_event1)
      ikernel_event1_off <= 1'b1;
    if (ikernel_event1_off)
      ikernel_event1_off <= 1'b0;

    if (~ikernel_event2_Q & ikernel_event2)
      ikernel_event2_on <= 1'b1;
    if (ikernel_event2_on)
      ikernel_event2_on <= 1'b0;

    if (ikernel_event2_Q & ~ikernel_event2)
      ikernel_event2_off <= 1'b1;
    if (ikernel_event2_off)
      ikernel_event2_off <= 1'b0;

    if (~ikernel_event3_Q & ikernel_event3)
      ikernel_event3_on <= 1'b1;
    if (ikernel_event3_on)
      ikernel_event3_on <= 1'b0;

    if (ikernel_event3_Q & ~ikernel_event3)
      ikernel_event3_off <= 1'b1;
    if (ikernel_event3_off)
      ikernel_event3_off <= 1'b0;

    if (~ikernel_event4_Q & ikernel_event4)
      ikernel_event4_on <= 1'b1;
    if (ikernel_event4_on)
      ikernel_event4_on <= 1'b0;

    if (ikernel_event4_Q & ~ikernel_event4)
      ikernel_event4_off <= 1'b1;
    if (ikernel_event4_off)
      ikernel_event4_off <= 1'b0;
  end
end

// TODO separate generated and passthrough packets
wire sbu2nwp_allowed = nwp2sbu_lossless_has_credits | sbu2nwp_packet_in_flight;
wire sbu2cxp_allowed = cxp2sbu_lossless_has_credits | sbu2cxp_packet_in_flight;
assign sbu2nwp_axi4stream_vld = sbu2nwp_m_axis_tvalid & sbu2nwp_allowed;
assign sbu2nwp_m_axis_tready = sbu2nwp_axi4stream_rdy & sbu2nwp_allowed;
assign sbu2cxp_axi4stream_vld = sbu2cxp_m_axis_tvalid & sbu2cxp_allowed;
assign sbu2cxp_m_axis_tready = sbu2cxp_axi4stream_rdy & sbu2cxp_allowed;

// sbu2mlx
assign sbu2mlx_axi4stream_tdata = 256'h0;
assign sbu2mlx_axi4stream_vld = 1'b0;
assign sbu2mlx_axi4stream_tkeep = 32'h0;
assign sbu2mlx_axi4stream_tlast = 1'b0;
assign sbu2mlx_axi4stream_tid = 3'h0;
assign sbu2mlx_axi4stream_tuser = 12'h0;

// mlx2sbu
assign mlx2sbu_axi4stream_rdy = 1'b0;


///////////////////////////////////////////////////////////////////////////////////////
//   
// Timeout axilite slave, to respond in case no other slave responded, to avoid host hang  
// Write operation will write to sink
// Read operation will be responded with 32'hdeadf00d
//
localparam
    WRIDLE                     = 2'd0,
    WRDATA                     = 2'd1,
    WRRESP                     = 2'd2,
    RDIDLE                     = 2'd0,
    RDDATA                     = 2'd1;

  reg [1:0]                    timeout_wstate;
  reg [1:0] 		       timeout_wnext;
  reg [1:0] 		       timeout_rstate;
  reg [1:0] 		       timeout_rnext;
  reg [31:0] 		       timeout_rdata;
  wire 			       timeout_ar_hs;
  
//------------------------Timeout AXI write fsm------------------
assign timeout_AXILiteS_AWREADY = (timeout_wstate == WRIDLE);
assign timeout_AXILiteS_WREADY  = (timeout_wstate == WRDATA);
assign timeout_AXILiteS_BRESP   = 2'b00;  // OKAY
assign timeout_AXILiteS_BVALID  = (timeout_wstate == WRRESP);

// wstate
always @(posedge mlx2sbu_clk) begin
    if (mlx2sbu_reset)
        timeout_wstate <= WRIDLE;
    else
        timeout_wstate <= timeout_wnext;
end

// wnext
always @(*) begin
    case (timeout_wstate)
        WRIDLE:
            if (timeout_AXILiteS_AWVALID)
                timeout_wnext = WRDATA;
            else
                timeout_wnext = WRIDLE;
        WRDATA:
            if (mlx2sbu_axi4lite_w_vld)
                timeout_wnext = WRRESP;
            else
                timeout_wnext = WRDATA;
        WRRESP:
            if (mlx2sbu_axi4lite_b_rdy)
                timeout_wnext = WRIDLE;
            else
                timeout_wnext = WRRESP;
        default:
            timeout_wnext = WRIDLE;
    endcase
end

//------------------------Timeout AXI read fsm-------------------
assign timeout_AXILiteS_ARREADY = (timeout_rstate == RDIDLE);
assign timeout_AXILiteS_RDATA   = timeout_rdata;
assign timeout_AXILiteS_RRESP   = 2'b00;  // OKAY
assign timeout_AXILiteS_RVALID  = (timeout_rstate == RDDATA);
assign timeout_ar_hs   = timeout_AXILiteS_ARVALID & timeout_AXILiteS_ARREADY;

// rstate
always @(posedge mlx2sbu_clk) begin
    if (mlx2sbu_reset)
        timeout_rstate <= RDIDLE;
    else
        timeout_rstate <= timeout_rnext;
end

// rnext
always @(*) begin
    case (timeout_rstate)
        RDIDLE:
            if (timeout_AXILiteS_ARVALID)
                timeout_rnext = RDDATA;
            else
                timeout_rnext = RDIDLE;
        RDDATA:
            if (mlx2sbu_axi4lite_r_rdy & timeout_AXILiteS_RVALID)
                timeout_rnext = RDIDLE;
            else
                timeout_rnext = RDDATA;
        default:
            timeout_rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge mlx2sbu_clk) begin
        if (timeout_ar_hs) begin
            timeout_rdata <= 32'hdeadf00d;
        end
end

  
/////////////////////////////////////////////////////////////////////////////////////////
// Signals monitoring
/////////////////////////////////////////////////////////////////////////////////////////
// For sigmon configuration options, see sigmon_top.v

// DDR Test: Used for DDR read/write testing, via special ikernel
// Keep cleared in regular nica & ikernel scheme
  assign dram_test_status = 32'h00000000;

// Assign the desired nica event(s) to nica_events[]
// Configure sigmon_ctrl to monitor these events.
  assign nica_events = {7'b0000000, ikernel_event4, ikernel_event3_off, ikernel_event3_on, 
                        ikernel_event2_off, ikernel_event2_on, ikernel_event1_off,
                        ikernel_event1_on, ikernel_event0_off, ikernel_event0_on};

localparam SIGMON_ENABLE = `SIGMON_ENABLE;
generate if (SIGMON_ENABLE) begin : sigmon_top_cond

sigmon_top #(
    .AXILITE_ADDR_WIDTH(32),
    .AXILITE_DATA_WIDTH(32)
) sigmon (

    .clk(mlx2sbu_clk),
    .reset(mlx2sbu_reset),
// AXI-Lite interface:
    .axi_AWREADY(sigmon_AXILiteS_AWREADY),
    .axi_AWVALID(sigmon_AXILiteS_AWVALID),
    .axi_AWADDR(waddr2ikernels),
    .axi_WVALID(mlx2sbu_axi4lite_w_vld),
    .axi_WREADY(sigmon_AXILiteS_WREADY),
    .axi_WDATA(mlx2sbu_axi4lite_w_data),
    .axi_WSTRB(mlx2sbu_axi4lite_w_strobe),
    .axi_ARVALID(sigmon_AXILiteS_ARVALID),
    .axi_ARREADY(sigmon_AXILiteS_ARREADY),
    .axi_ARADDR(raddr2ikernels),
    .axi_BVALID(sigmon_AXILiteS_BVALID),
    .axi_BREADY(mlx2sbu_axi4lite_b_rdy),
    .axi_BRESP(sigmon_AXILiteS_BRESP),
    .axi_RVALID(sigmon_AXILiteS_RVALID),
    .axi_RREADY(mlx2sbu_axi4lite_r_rdy),
    .axi_RDATA(sigmon_AXILiteS_RDATA),
    .axi_RRESP(sigmon_AXILiteS_RRESP),

// test mode, see sigmon_top.v for details
    .test_mode(test_mode),

// Monitored signals (can be selected/deselected, enabled/disabled via sigmon_ctrl):
// Notice that the ready & valid signals of each axistream interface are not monitored. Instead these signals are used to generate the trigger for sampling tlast
    .nwp2sbu_rdy_in(nwp2sbu_axi4stream_rdy),
    .nwp2sbu_rdy_temp_in(nwp2sbu_axi4stream_rdy_temp),
    .nwp2sbu_vld_in(nwp2sbu_axi4stream_vld),
    .nwp2sbu_tlast_in(nwp2sbu_axi4stream_tlast),
    .nwp2sbu_data_in(nwp2sbu_axi4stream_tdata),
    .sbu2nwp_rdy_in(sbu2nwp_axi4stream_rdy),
    .sbu2nwp_vld_in(sbu2nwp_axi4stream_vld),
    .sbu2nwp_tlast_in(sbu2nwp_axi4stream_tlast),
    .sbu2nwp_data_in(sbu2nwp_axi4stream_tdata),
    .cxp2sbu_rdy_in(cxp2sbu_axi4stream_rdy),
    .cxp2sbu_vld_in(cxp2sbu_axi4stream_vld),
    .cxp2sbu_tlast_in(cxp2sbu_axi4stream_tlast),
    .cxp2sbu_data_in(cxp2sbu_axi4stream_tdata),
    .sbu2cxp_rdy_in(sbu2cxp_axi4stream_rdy),
    .sbu2cxp_vld_in(sbu2cxp_axi4stream_vld),
    .sbu2cxp_tlast_in(sbu2cxp_axi4stream_tlast),
    .sbu2cxp_data_in(sbu2cxp_axi4stream_tdata),
    .sbu2cxpfifo_vld_in(sbu2cxpfifo_axi4stream_vld),
    .sbu2cxpfifo_rdy_in(sbu2cxpfifo_axi4stream_rdy),
    .sbu2cxpfifo_tlast_in(sbu2cxpfifo_axi4stream_tlast),
    .sbu2nwpfifo_vld_in(sbu2nwpfifo_axi4stream_vld),
    .sbu2nwpfifo_rdy_in(sbu2nwpfifo_axi4stream_rdy),
    .sbu2nwpfifo_tlast_in(sbu2nwpfifo_axi4stream_tlast),
    .nwp2sbu_lossless_credits_in(nwp2sbu_lossless_has_credits),
    .cxp2sbu_lossless_credits_in(cxp2sbu_lossless_has_credits),
    .ik2map_axi4mm_aw_rdy_in(ik2map_axi4mm_aw_rdy),
    .ik2map_axi4mm_aw_vld_in(ik2map_axi4mm_aw_vld),
    .axi4mm_aw_rdy_in(sbu2mlx_axi4mm_aw_rdy),
    .axi4mm_aw_vld_in(sbu2mlx_axi4mm_aw_vld),
    .axi4mm_w_rdy_in(sbu2mlx_axi4mm_w_rdy),
    .axi4mm_w_vld_in(sbu2mlx_axi4mm_w_vld),
    .axi4mm_w_last_in(sbu2mlx_axi4mm_w_last),
    .axi4mm_b_rdy_in(sbu2mlx_axi4mm_b_rdy),
    .axi4mm_b_vld_in(sbu2mlx_axi4mm_b_vld),
    .ik2map_axi4mm_ar_rdy_in(ik2map_axi4mm_ar_rdy),
    .ik2map_axi4mm_ar_vld_in(ik2map_axi4mm_ar_vld),
    .axi4mm_ar_rdy_in(sbu2mlx_axi4mm_ar_rdy),
    .axi4mm_ar_vld_in(sbu2mlx_axi4mm_ar_vld),

    .ik2map_axi4mm_aw_addr_in(ik2map_axi4mm_aw_addr),
    .ik2map_axi4mm_ar_addr_in(ik2map_axi4mm_ar_addr),
    .sbu2mlx_axi4mm_aw_addr_in(sbu2mlx_axi4mm_aw_addr_low),
    .sbu2mlx_axi4mm_ar_addr_in(sbu2mlx_axi4mm_ar_addr_low),
	  
    .axi4mm_r_rdy_in(sbu2mlx_axi4mm_r_rdy),
    .axi4mm_r_vld_in(sbu2mlx_axi4mm_r_vld),
    .axi4mm_r_last_in(sbu2mlx_axi4mm_r_last),

// events originated in nica
    .nica_events_in(nica_events),

// dram control
    .dram_ctrl_in(dram_test_status)

);

end endgenerate


////////////////////////////////////////////////////////////////////////////////////////////////  
// ddr wr/rd address mapping scheme:
// =================================
// Mapping the ikernel originated axi4mm address to its physical ddr address.
// 4K pages are assumed. Only the page section is mapped. Page offset is unchanged
//
// Mapping highlight:
// 1. adrs_map table lookup: ikernel_adrs[40:31] is assumed as the ikernel_id:
//    ddr_adrs_base <= map_table[ikernel_adrs[40:31]]  // map_table[] assumed preloaded (via axilite)
//
// 2. Final ddr address:
//    ddr_adrs[30:0] <= {ikernel_adrs[30:12] + adrs_map_base[18:0], ikernel_adrs[11:0]} 
//
// See more details inside ddr_address_mapping.v
//
ddr_address_mapping  #(
    .AXILITE_ADDR_WIDTH(32),
    .AXILITE_DATA_WIDTH(32)
) ddr_wraddr_map (
    .clk(mlx2sbu_clk),
    .reset(mlx2sbu_reset),
    .rdwr_mode(1'b0),

// AXI-Lite write interface, for ddr_wr address map table loading
    .axi_AWADDR(waddr2ikernels),
    .axi_AWVALID(ddrwrtable_AXILiteS_AWVALID),
    .axi_AWREADY(ddrwrtable_AXILiteS_AWREADY),
    .axi_WDATA(mlx2sbu_axi4lite_w_data),
    .axi_WVALID(mlx2sbu_axi4lite_w_vld),
    .axi_WREADY(ddrwrtable_AXILiteS_WREADY),
    .axi_WSTRB(mlx2sbu_axi4lite_w_strobe),
    .axi_BVALID(ddrwrtable_AXILiteS_BVALID),
    .axi_BREADY(mlx2sbu_axi4lite_b_rdy),
    .axi_BRESP(ddrwrtable_AXILiteS_BRESP),

// ikernel_aw ==> wr_addr_map
.ik2map_rdy(ik2map_axi4mm_aw_rdy),
.ik2map_vld(ik2map_axi4mm_aw_vld),
.ik2map_addr({23'b00000000000000000000000, ik2map_axi4mm_aw_addr[40:0]}),
.ik2map_burst(ik2map_axi4mm_aw_burst),
.ik2map_cache(ik2map_axi4mm_aw_cache),
.ik2map_id(ik2map_axi4mm_aw_id),
.ik2map_len(ik2map_axi4mm_aw_len),
.ik2map_lock(ik2map_axi4mm_aw_lock),
.ik2map_prot(ik2map_axi4mm_aw_prot),
.ik2map_qos(ik2map_axi4mm_aw_qos),
.ik2map_region(ik2map_axi4mm_aw_region),
.ik2map_size(ik2map_axi4mm_aw_size),

// wr_addr_map ==> axi4mm_aw:
.map2ddr_rdy(sbu2mlx_axi4mm_aw_rdy),
.map2ddr_vld(sbu2mlx_axi4mm_aw_vld),
.map2ddr_addr(sbu2mlx_axi4mm_aw_addr_low),
.map2ddr_burst(sbu2mlx_axi4mm_aw_burst),
.map2ddr_cache(sbu2mlx_axi4mm_aw_cache),
.map2ddr_id(sbu2mlx_axi4mm_aw_id),
.map2ddr_len(sbu2mlx_axi4mm_aw_len),
.map2ddr_lock(sbu2mlx_axi4mm_aw_lock_axi3),
.map2ddr_prot(sbu2mlx_axi4mm_aw_prot),
.map2ddr_qos(sbu2mlx_axi4mm_aw_qos),
.map2ddr_region(sbu2mlx_axi4mm_aw_region),
.map2ddr_size(sbu2mlx_axi4mm_aw_size)
);

assign         sbu2mlx_axi4mm_aw_lock = sbu2mlx_axi4mm_aw_lock_axi3[0];
assign         sbu2mlx_axi4mm_ar_lock = sbu2mlx_axi4mm_ar_lock_axi3[0];

ddr_address_mapping  #(
    .AXILITE_ADDR_WIDTH(32),
    .AXILITE_DATA_WIDTH(32)
) ddr_rdaddr_map (
    .clk(mlx2sbu_clk),
    .reset(mlx2sbu_reset),
    .rdwr_mode(1'b1),

// AXI-Lite write interface, for ddr_rd address map table loading
// Notice that both ddr_wr and ddr_rd address map tables share the same axilite address space, such that both tables are written at same time.
// Consequently, only axilite input signals are used below, while axilite outputs are unconnected, to avoid signal conflicts with ddr_wr axilite outputs.
    .axi_AWADDR(waddr2ikernels),
    .axi_AWVALID(ddrwrtable_AXILiteS_AWVALID),
    .axi_AWREADY(ddrrdtable_AXILiteS_AWREADY_unconnected),
    .axi_WDATA(mlx2sbu_axi4lite_w_data),
    .axi_WVALID(mlx2sbu_axi4lite_w_vld),
    .axi_WREADY(ddrrdtable_AXILiteS_WREADY_unconnected),
    .axi_WSTRB(mlx2sbu_axi4lite_w_strobe),
    .axi_BVALID(ddrrdtable_AXILiteS_BVALID_unconnected),
    .axi_BREADY(mlx2sbu_axi4lite_b_rdy),
    .axi_BRESP(ddrrdtable_AXILiteS_BRESP_unconnected),

// ikernel_ar ==> rd_addr_map
.ik2map_rdy(ik2map_axi4mm_ar_rdy),
.ik2map_vld(ik2map_axi4mm_ar_vld),
.ik2map_addr({23'b00000000000000000000000, ik2map_axi4mm_ar_addr[40:0]}),
.ik2map_burst(ik2map_axi4mm_ar_burst),
.ik2map_cache(ik2map_axi4mm_ar_cache),
.ik2map_id(ik2map_axi4mm_ar_id),
.ik2map_len(ik2map_axi4mm_ar_len),
.ik2map_lock(ik2map_axi4mm_ar_lock),
.ik2map_prot(ik2map_axi4mm_ar_prot),
.ik2map_qos(ik2map_axi4mm_ar_qos),
.ik2map_region(ik2map_axi4mm_ar_region),
.ik2map_size(ik2map_axi4mm_ar_size),

// rd_addr_map ==> axi4mm_ar:
.map2ddr_rdy(sbu2mlx_axi4mm_ar_rdy),
.map2ddr_vld(sbu2mlx_axi4mm_ar_vld),
.map2ddr_addr(sbu2mlx_axi4mm_ar_addr_low),
.map2ddr_burst(sbu2mlx_axi4mm_ar_burst),
.map2ddr_cache(sbu2mlx_axi4mm_ar_cache),
.map2ddr_id(sbu2mlx_axi4mm_ar_id),
.map2ddr_len(sbu2mlx_axi4mm_ar_len),
.map2ddr_lock(sbu2mlx_axi4mm_ar_lock_axi3),
.map2ddr_prot(sbu2mlx_axi4mm_ar_prot),
.map2ddr_qos(sbu2mlx_axi4mm_ar_qos),
.map2ddr_region(sbu2mlx_axi4mm_ar_region),
.map2ddr_size(sbu2mlx_axi4mm_ar_size)
);

exp_hls_watchdog exp_hls_watchdog(
   .clk(mlx2sbu_clk),
   .reset(mlx2sbu_reset),
   .watchdog_counter(sbu2mlx_watchdog)
);

assign         sbu2mlx_axi4mm_aw_id = 3'd0;
assign         sbu2mlx_axi4mm_ar_id = 3'd0;
assign         sbu2mlx_axi4mm_aw_lock = 1'b0;
assign         sbu2mlx_leds_on =8'd23;
assign         sbu2mlx_leds_blink = 8'd0;

wire           unconnected_sbu2mlx_axi4mm           =
                                                      sbu2mlx_axi4mm_w_rdy |
                                                      sbu2mlx_axi4mm_aw_rdy |
                                                      sbu2mlx_axi4mm_r_vld |
                                                      sbu2mlx_axi4mm_r_last
                                                      ;

wire           unconnect_axi = |{sbu2mlx_axi4mm_r_resp,sbu2mlx_axi4mm_b_id,sbu2mlx_axi4mm_r_id};

wire           unconnected_axi_lite = |{mlx2sbu_axi4lite_aw_prot, mlx2sbu_axi4lite_ar_prot};

endmodule
