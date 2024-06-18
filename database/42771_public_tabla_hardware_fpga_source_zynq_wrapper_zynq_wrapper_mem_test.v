// This program was cloned from: https://github.com/VeriGOOD-ML/public
// License: Apache License 2.0

`timescale 1ns/1ps
module zynq_wrapper_mem_test #(
  parameter integer READ_ADDR_BASE_0  = 32'h00000000,
  parameter integer WRITE_ADDR_BASE_0 = 32'h02000000,
  parameter integer TYPE              = "PU",
  parameter integer PERF_CNTR_WIDTH   = 10,
  parameter integer AXIM_DATA_WIDTH   = 64,
  parameter integer AXIM_ADDR_WIDTH   = 32,
  parameter integer AXIS_DATA_WIDTH   = 32,
  parameter integer AXIS_ADDR_WIDTH   = 32,
  parameter integer RD_BUF_ADDR_WIDTH = 8,
  parameter integer NUM_AXI           = 4,
  parameter integer DATA_WIDTH        = 16,
  parameter integer NUM_DATA          = AXIM_DATA_WIDTH*NUM_AXI/DATA_WIDTH,
  parameter integer NUM_PE            = 64,
  parameter integer VERBOSITY         = 2,
  parameter integer NAMESPACE_WIDTH   = 2,
  parameter integer TX_SIZE_WIDTH     = 10,
  parameter integer TEST_NUM_READS    = 5
// ******************************************************************
)
(
  inout wire [14:0]   DDR_addr,
  inout wire [2:0]    DDR_ba,
  inout wire          DDR_cas_n,
  inout wire          DDR_ck_n,
  inout wire          DDR_ck_p,
  inout wire          DDR_cke,
  inout wire          DDR_cs_n,
  inout wire [3:0]    DDR_dm,
  inout wire [31:0]   DDR_dq,
  inout wire [3:0]    DDR_dqs_n,
  inout wire [3:0]    DDR_dqs_p,
  inout wire          DDR_odt,
  inout wire          DDR_ras_n,
  inout wire          DDR_reset_n,
  inout wire          DDR_we_n,

  inout wire          FIXED_IO_ddr_vrn,
  inout wire          FIXED_IO_ddr_vrp,
  inout wire [53:0]   FIXED_IO_mio,
  inout wire          FIXED_IO_ps_clk,
  inout wire          FIXED_IO_ps_porb,
  inout wire          FIXED_IO_ps_srstb
);

  wire                ACLK;
  wire                ARESETN;

  wire [31:0]         M_AXI_GP0_awaddr;
  wire [2:0]          M_AXI_GP0_awprot;
  wire                M_AXI_GP0_awready;
  wire                M_AXI_GP0_awvalid;
  wire [31:0]         M_AXI_GP0_wdata;
  wire [3:0]          M_AXI_GP0_wstrb;
  wire                M_AXI_GP0_wvalid;
  wire                M_AXI_GP0_wready;
  wire [1:0]          M_AXI_GP0_bresp;
  wire                M_AXI_GP0_bvalid;
  wire                M_AXI_GP0_bready;
  wire [31:0]         M_AXI_GP0_araddr;
  wire [2:0]          M_AXI_GP0_arprot;
  wire                M_AXI_GP0_arvalid;
  wire                M_AXI_GP0_arready;
  wire [31:0]         M_AXI_GP0_rdata;
  wire [1:0]          M_AXI_GP0_rresp;
  wire                M_AXI_GP0_rvalid;
  wire                M_AXI_GP0_rready;

  wire [31:0]         S_AXI_HP0_araddr;
  wire [1:0]          S_AXI_HP0_arburst;
  wire [3:0]          S_AXI_HP0_arcache;
  wire [5:0]          S_AXI_HP0_arid;
  wire [3:0]          S_AXI_HP0_arlen;
  wire [1:0]          S_AXI_HP0_arlock;
  wire [2:0]          S_AXI_HP0_arprot;
  wire [3:0]          S_AXI_HP0_arqos;
  wire                S_AXI_HP0_arready;
  wire [2:0]          S_AXI_HP0_arsize;
  wire                S_AXI_HP0_arvalid;
  wire [31:0]         S_AXI_HP0_awaddr;
  wire [1:0]          S_AXI_HP0_awburst;
  wire [3:0]          S_AXI_HP0_awcache;
  wire [5:0]          S_AXI_HP0_awid;
  wire [3:0]          S_AXI_HP0_awlen;
  wire [1:0]          S_AXI_HP0_awlock;
  wire [2:0]          S_AXI_HP0_awprot;
  wire [3:0]          S_AXI_HP0_awqos;
  wire                S_AXI_HP0_awready;
  wire [2:0]          S_AXI_HP0_awsize;
  wire                S_AXI_HP0_awvalid;
  wire [5:0]          S_AXI_HP0_bid;
  wire                S_AXI_HP0_bready;
  wire [1:0]          S_AXI_HP0_bresp;
  wire                S_AXI_HP0_bvalid;
  wire [63:0]         S_AXI_HP0_rdata;
  wire [5:0]          S_AXI_HP0_rid;
  wire                S_AXI_HP0_rlast;
  wire                S_AXI_HP0_rready;
  wire [1:0]          S_AXI_HP0_rresp;
  wire                S_AXI_HP0_rvalid;
  wire [63:0]         S_AXI_HP0_wdata;
  wire [5:0]          S_AXI_HP0_wid;
  wire                S_AXI_HP0_wlast;
  wire                S_AXI_HP0_wready;
  wire [7:0]          S_AXI_HP0_wstrb;
  wire                S_AXI_HP0_wvalid;

  wire [31:0]         S_AXI_HP1_araddr;
  wire [1:0]          S_AXI_HP1_arburst;
  wire [3:0]          S_AXI_HP1_arcache;
  wire [5:0]          S_AXI_HP1_arid;
  wire [3:0]          S_AXI_HP1_arlen;
  wire [1:0]          S_AXI_HP1_arlock;
  wire [2:0]          S_AXI_HP1_arprot;
  wire [3:0]          S_AXI_HP1_arqos;
  wire                S_AXI_HP1_arready;
  wire [2:0]          S_AXI_HP1_arsize;
  wire                S_AXI_HP1_arvalid;
  wire [31:0]         S_AXI_HP1_awaddr;
  wire [1:0]          S_AXI_HP1_awburst;
  wire [3:0]          S_AXI_HP1_awcache;
  wire [5:0]          S_AXI_HP1_awid;
  wire [3:0]          S_AXI_HP1_awlen;
  wire [1:0]          S_AXI_HP1_awlock;
  wire [2:0]          S_AXI_HP1_awprot;
  wire [3:0]          S_AXI_HP1_awqos;
  wire                S_AXI_HP1_awready;
  wire [2:0]          S_AXI_HP1_awsize;
  wire                S_AXI_HP1_awvalid;
  wire [5:0]          S_AXI_HP1_bid;
  wire                S_AXI_HP1_bready;
  wire [1:0]          S_AXI_HP1_bresp;
  wire                S_AXI_HP1_bvalid;
  wire [63:0]         S_AXI_HP1_rdata;
  wire [5:0]          S_AXI_HP1_rid;
  wire                S_AXI_HP1_rlast;
  wire                S_AXI_HP1_rready;
  wire [1:0]          S_AXI_HP1_rresp;
  wire                S_AXI_HP1_rvalid;
  wire [63:0]         S_AXI_HP1_wdata;
  wire [5:0]          S_AXI_HP1_wid;
  wire                S_AXI_HP1_wlast;
  wire                S_AXI_HP1_wready;
  wire [7:0]          S_AXI_HP1_wstrb;
  wire                S_AXI_HP1_wvalid;

  wire [31:0]         S_AXI_HP2_araddr;
  wire [1:0]          S_AXI_HP2_arburst;
  wire [3:0]          S_AXI_HP2_arcache;
  wire [5:0]          S_AXI_HP2_arid;
  wire [3:0]          S_AXI_HP2_arlen;
  wire [1:0]          S_AXI_HP2_arlock;
  wire [2:0]          S_AXI_HP2_arprot;
  wire [3:0]          S_AXI_HP2_arqos;
  wire                S_AXI_HP2_arready;
  wire [2:0]          S_AXI_HP2_arsize;
  wire                S_AXI_HP2_arvalid;
  wire [31:0]         S_AXI_HP2_awaddr;
  wire [1:0]          S_AXI_HP2_awburst;
  wire [3:0]          S_AXI_HP2_awcache;
  wire [5:0]          S_AXI_HP2_awid;
  wire [3:0]          S_AXI_HP2_awlen;
  wire [1:0]          S_AXI_HP2_awlock;
  wire [2:0]          S_AXI_HP2_awprot;
  wire [3:0]          S_AXI_HP2_awqos;
  wire                S_AXI_HP2_awready;
  wire [2:0]          S_AXI_HP2_awsize;
  wire                S_AXI_HP2_awvalid;
  wire [5:0]          S_AXI_HP2_bid;
  wire                S_AXI_HP2_bready;
  wire [1:0]          S_AXI_HP2_bresp;
  wire                S_AXI_HP2_bvalid;
  wire [63:0]         S_AXI_HP2_rdata;
  wire [5:0]          S_AXI_HP2_rid;
  wire                S_AXI_HP2_rlast;
  wire                S_AXI_HP2_rready;
  wire [1:0]          S_AXI_HP2_rresp;
  wire                S_AXI_HP2_rvalid;
  wire [63:0]         S_AXI_HP2_wdata;
  wire [5:0]          S_AXI_HP2_wid;
  wire                S_AXI_HP2_wlast;
  wire                S_AXI_HP2_wready;
  wire [7:0]          S_AXI_HP2_wstrb;
  wire                S_AXI_HP2_wvalid;

  wire [31:0]         S_AXI_HP3_araddr;
  wire [1:0]          S_AXI_HP3_arburst;
  wire [3:0]          S_AXI_HP3_arcache;
  wire [5:0]          S_AXI_HP3_arid;
  wire [3:0]          S_AXI_HP3_arlen;
  wire [1:0]          S_AXI_HP3_arlock;
  wire [2:0]          S_AXI_HP3_arprot;
  wire [3:0]          S_AXI_HP3_arqos;
  wire                S_AXI_HP3_arready;
  wire [2:0]          S_AXI_HP3_arsize;
  wire                S_AXI_HP3_arvalid;
  wire [31:0]         S_AXI_HP3_awaddr;
  wire [1:0]          S_AXI_HP3_awburst;
  wire [3:0]          S_AXI_HP3_awcache;
  wire [5:0]          S_AXI_HP3_awid;
  wire [3:0]          S_AXI_HP3_awlen;
  wire [1:0]          S_AXI_HP3_awlock;
  wire [2:0]          S_AXI_HP3_awprot;
  wire [3:0]          S_AXI_HP3_awqos;
  wire                S_AXI_HP3_awready;
  wire [2:0]          S_AXI_HP3_awsize;
  wire                S_AXI_HP3_awvalid;
  wire [5:0]          S_AXI_HP3_bid;
  wire                S_AXI_HP3_bready;
  wire [1:0]          S_AXI_HP3_bresp;
  wire                S_AXI_HP3_bvalid;
  wire [63:0]         S_AXI_HP3_rdata;
  wire [5:0]          S_AXI_HP3_rid;
  wire                S_AXI_HP3_rlast;
  wire                S_AXI_HP3_rready;
  wire [1:0]          S_AXI_HP3_rresp;
  wire                S_AXI_HP3_rvalid;
  wire [63:0]         S_AXI_HP3_wdata;
  wire [5:0]          S_AXI_HP3_wid;
  wire                S_AXI_HP3_wlast;
  wire                S_AXI_HP3_wready;
  wire [7:0]          S_AXI_HP3_wstrb;
  wire                S_AXI_HP3_wvalid;

  wire [32*NUM_AXI       -1 : 0]   S_AXI_AWADDR;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_AWBURST;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_AWCACHE;
  wire [6*NUM_AXI        -1 : 0]   S_AXI_AWID;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_AWLEN;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_AWLOCK;
  wire [3*NUM_AXI        -1 : 0]   S_AXI_AWPROT;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_AWQOS;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_AWUSER;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_AWREADY;
  wire [3*NUM_AXI        -1 : 0]   S_AXI_AWSIZE;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_AWVALID;
  
  // Master Interface Write Data
  wire [NUM_AXI*C_M_AXI_DATA_WIDTH -1 : 0]   S_AXI_WDATA;
  wire [6*NUM_AXI        -1 : 0]   S_AXI_WID;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_WUSER;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_WLAST;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_WREADY;
  wire [8*NUM_AXI        -1 : 0]   S_AXI_WSTRB;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_WVALID;

  // Master Interface Write Response
  wire [6*NUM_AXI        -1 : 0]   S_AXI_BID;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_BUSER;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_BREADY;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_BRESP;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_BVALID;
  
  // Master Interface Read Address
  wire [32*NUM_AXI       -1 : 0]   S_AXI_ARADDR;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_ARBURST;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_ARCACHE;
  wire [6*NUM_AXI        -1 : 0]   S_AXI_ARID;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_ARLEN;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_ARLOCK;
  wire [3*NUM_AXI        -1 : 0]   S_AXI_ARPROT;
  wire [4*NUM_AXI        -1 : 0]   S_AXI_ARQOS;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_ARUSER;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_ARREADY;
  wire [3*NUM_AXI        -1 : 0]   S_AXI_ARSIZE;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_ARVALID;

  // Master Interface Read Data 
  wire [NUM_AXI*C_M_AXI_DATA_WIDTH -1 : 0]   S_AXI_RDATA;
  wire [6*NUM_AXI        -1 : 0]   S_AXI_RID;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_RUSER;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_RLAST;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_RREADY;
  wire [2*NUM_AXI        -1 : 0]   S_AXI_RRESP;
  wire [1*NUM_AXI        -1 : 0]   S_AXI_RVALID;




  localparam integer  C_S_AXI_DATA_WIDTH    = 32;
  localparam integer  C_S_AXI_ADDR_WIDTH    = 32;
  localparam integer  C_M_AXI_DATA_WIDTH    = 64;
  localparam integer  C_M_AXI_ADDR_WIDTH    = 32;

zc702 zc702_i (
  .DDR_addr               ( DDR_addr              ),
  .DDR_ba                 ( DDR_ba                ),
  .DDR_cas_n              ( DDR_cas_n             ),
  .DDR_ck_n               ( DDR_ck_n              ),
  .DDR_ck_p               ( DDR_ck_p              ),
  .DDR_cke                ( DDR_cke               ),
  .DDR_cs_n               ( DDR_cs_n              ),
  .DDR_dm                 ( DDR_dm                ),
  .DDR_dq                 ( DDR_dq                ),
  .DDR_dqs_n              ( DDR_dqs_n             ),
  .DDR_dqs_p              ( DDR_dqs_p             ),
  .DDR_odt                ( DDR_odt               ),
  .DDR_ras_n              ( DDR_ras_n             ),
  .DDR_reset_n            ( DDR_reset_n           ),
  .DDR_we_n               ( DDR_we_n              ),
  .FCLK_CLK0              ( FCLK_CLK0             ),
  .FCLK_RESET0_N          ( FCLK_RESET0_N         ),
  .FIXED_IO_ddr_vrn       ( FIXED_IO_ddr_vrn      ),
  .FIXED_IO_ddr_vrp       ( FIXED_IO_ddr_vrp      ),
  .FIXED_IO_mio           ( FIXED_IO_mio          ),
  .FIXED_IO_ps_clk        ( FIXED_IO_ps_clk       ),
  .FIXED_IO_ps_porb       ( FIXED_IO_ps_porb      ),
  .FIXED_IO_ps_srstb      ( FIXED_IO_ps_srstb     ),
  .M_AXI_GP0_araddr       ( M_AXI_GP0_araddr      ),
  .M_AXI_GP0_arprot       ( M_AXI_GP0_arprot      ),
  .M_AXI_GP0_arready      ( M_AXI_GP0_arready     ),
  .M_AXI_GP0_arvalid      ( M_AXI_GP0_arvalid     ),
  .M_AXI_GP0_awaddr       ( M_AXI_GP0_awaddr      ),
  .M_AXI_GP0_awprot       ( M_AXI_GP0_awprot      ),
  .M_AXI_GP0_awready      ( M_AXI_GP0_awready     ),
  .M_AXI_GP0_awvalid      ( M_AXI_GP0_awvalid     ),
  .M_AXI_GP0_bready       ( M_AXI_GP0_bready      ),
  .M_AXI_GP0_bresp        ( M_AXI_GP0_bresp       ),
  .M_AXI_GP0_bvalid       ( M_AXI_GP0_bvalid      ),
  .M_AXI_GP0_rdata        ( M_AXI_GP0_rdata       ),
  .M_AXI_GP0_rready       ( M_AXI_GP0_rready      ),
  .M_AXI_GP0_rresp        ( M_AXI_GP0_rresp       ),
  .M_AXI_GP0_rvalid       ( M_AXI_GP0_rvalid      ),
  .M_AXI_GP0_wdata        ( M_AXI_GP0_wdata       ),
  .M_AXI_GP0_wready       ( M_AXI_GP0_wready      ),
  .M_AXI_GP0_wstrb        ( M_AXI_GP0_wstrb       ),
  .M_AXI_GP0_wvalid       ( M_AXI_GP0_wvalid      ),

  .S_AXI_HP0_araddr       ( S_AXI_HP0_araddr      ),
  .S_AXI_HP0_arburst      ( S_AXI_HP0_arburst     ),
  .S_AXI_HP0_arcache      ( S_AXI_HP0_arcache     ),
  .S_AXI_HP0_arid         ( S_AXI_HP0_arid        ),
  .S_AXI_HP0_arlen        ( S_AXI_HP0_arlen       ),
  .S_AXI_HP0_arlock       ( S_AXI_HP0_arlock      ),
  .S_AXI_HP0_arprot       ( S_AXI_HP0_arprot      ),
  .S_AXI_HP0_arqos        ( S_AXI_HP0_arqos       ),
  .S_AXI_HP0_arready      ( S_AXI_HP0_arready     ),
  .S_AXI_HP0_arsize       ( S_AXI_HP0_arsize      ),
  .S_AXI_HP0_arvalid      ( S_AXI_HP0_arvalid     ),
  .S_AXI_HP0_awaddr       ( S_AXI_HP0_awaddr      ),
  .S_AXI_HP0_awburst      ( S_AXI_HP0_awburst     ),
  .S_AXI_HP0_awcache      ( S_AXI_HP0_awcache     ),
  .S_AXI_HP0_awid         ( S_AXI_HP0_awid        ),
  .S_AXI_HP0_awlen        ( S_AXI_HP0_awlen       ),
  .S_AXI_HP0_awlock       ( S_AXI_HP0_awlock      ),
  .S_AXI_HP0_awprot       ( S_AXI_HP0_awprot      ),
  .S_AXI_HP0_awqos        ( S_AXI_HP0_awqos       ),
  .S_AXI_HP0_awready      ( S_AXI_HP0_awready     ),
  .S_AXI_HP0_awsize       ( S_AXI_HP0_awsize      ),
  .S_AXI_HP0_awvalid      ( S_AXI_HP0_awvalid     ),
  .S_AXI_HP0_bid          ( S_AXI_HP0_bid         ),
  .S_AXI_HP0_bready       ( S_AXI_HP0_bready      ),
  .S_AXI_HP0_bresp        ( S_AXI_HP0_bresp       ),
  .S_AXI_HP0_bvalid       ( S_AXI_HP0_bvalid      ),
  .S_AXI_HP0_rdata        ( S_AXI_HP0_rdata       ),
  .S_AXI_HP0_rid          ( S_AXI_HP0_rid         ),
  .S_AXI_HP0_rlast        ( S_AXI_HP0_rlast       ),
  .S_AXI_HP0_rready       ( S_AXI_HP0_rready      ),
  .S_AXI_HP0_rresp        ( S_AXI_HP0_rresp       ),
  .S_AXI_HP0_rvalid       ( S_AXI_HP0_rvalid      ),
  .S_AXI_HP0_wdata        ( S_AXI_HP0_wdata       ),
  .S_AXI_HP0_wid          ( S_AXI_HP0_wid         ),
  .S_AXI_HP0_wlast        ( S_AXI_HP0_wlast       ),
  .S_AXI_HP0_wready       ( S_AXI_HP0_wready      ),
  .S_AXI_HP0_wstrb        ( S_AXI_HP0_wstrb       ),
  .S_AXI_HP0_wvalid       ( S_AXI_HP0_wvalid      ),

  .S_AXI_HP1_araddr       ( S_AXI_HP1_araddr      ),
  .S_AXI_HP1_arburst      ( S_AXI_HP1_arburst     ),
  .S_AXI_HP1_arcache      ( S_AXI_HP1_arcache     ),
  .S_AXI_HP1_arid         ( S_AXI_HP1_arid        ),
  .S_AXI_HP1_arlen        ( S_AXI_HP1_arlen       ),
  .S_AXI_HP1_arlock       ( S_AXI_HP1_arlock      ),
  .S_AXI_HP1_arprot       ( S_AXI_HP1_arprot      ),
  .S_AXI_HP1_arqos        ( S_AXI_HP1_arqos       ),
  .S_AXI_HP1_arready      ( S_AXI_HP1_arready     ),
  .S_AXI_HP1_arsize       ( S_AXI_HP1_arsize      ),
  .S_AXI_HP1_arvalid      ( S_AXI_HP1_arvalid     ),
  .S_AXI_HP1_awaddr       ( S_AXI_HP1_awaddr      ),
  .S_AXI_HP1_awburst      ( S_AXI_HP1_awburst     ),
  .S_AXI_HP1_awcache      ( S_AXI_HP1_awcache     ),
  .S_AXI_HP1_awid         ( S_AXI_HP1_awid        ),
  .S_AXI_HP1_awlen        ( S_AXI_HP1_awlen       ),
  .S_AXI_HP1_awlock       ( S_AXI_HP1_awlock      ),
  .S_AXI_HP1_awprot       ( S_AXI_HP1_awprot      ),
  .S_AXI_HP1_awqos        ( S_AXI_HP1_awqos       ),
  .S_AXI_HP1_awready      ( S_AXI_HP1_awready     ),
  .S_AXI_HP1_awsize       ( S_AXI_HP1_awsize      ),
  .S_AXI_HP1_awvalid      ( S_AXI_HP1_awvalid     ),
  .S_AXI_HP1_bid          ( S_AXI_HP1_bid         ),
  .S_AXI_HP1_bready       ( S_AXI_HP1_bready      ),
  .S_AXI_HP1_bresp        ( S_AXI_HP1_bresp       ),
  .S_AXI_HP1_bvalid       ( S_AXI_HP1_bvalid      ),
  .S_AXI_HP1_rdata        ( S_AXI_HP1_rdata       ),
  .S_AXI_HP1_rid          ( S_AXI_HP1_rid         ),
  .S_AXI_HP1_rlast        ( S_AXI_HP1_rlast       ),
  .S_AXI_HP1_rready       ( S_AXI_HP1_rready      ),
  .S_AXI_HP1_rresp        ( S_AXI_HP1_rresp       ),
  .S_AXI_HP1_rvalid       ( S_AXI_HP1_rvalid      ),
  .S_AXI_HP1_wdata        ( S_AXI_HP1_wdata       ),
  .S_AXI_HP1_wid          ( S_AXI_HP1_wid         ),
  .S_AXI_HP1_wlast        ( S_AXI_HP1_wlast       ),
  .S_AXI_HP1_wready       ( S_AXI_HP1_wready      ),
  .S_AXI_HP1_wstrb        ( S_AXI_HP1_wstrb       ),
  .S_AXI_HP1_wvalid       ( S_AXI_HP1_wvalid      ),

  .S_AXI_HP2_araddr       ( S_AXI_HP2_araddr      ),
  .S_AXI_HP2_arburst      ( S_AXI_HP2_arburst     ),
  .S_AXI_HP2_arcache      ( S_AXI_HP2_arcache     ),
  .S_AXI_HP2_arid         ( S_AXI_HP2_arid        ),
  .S_AXI_HP2_arlen        ( S_AXI_HP2_arlen       ),
  .S_AXI_HP2_arlock       ( S_AXI_HP2_arlock      ),
  .S_AXI_HP2_arprot       ( S_AXI_HP2_arprot      ),
  .S_AXI_HP2_arqos        ( S_AXI_HP2_arqos       ),
  .S_AXI_HP2_arready      ( S_AXI_HP2_arready     ),
  .S_AXI_HP2_arsize       ( S_AXI_HP2_arsize      ),
  .S_AXI_HP2_arvalid      ( S_AXI_HP2_arvalid     ),
  .S_AXI_HP2_awaddr       ( S_AXI_HP2_awaddr      ),
  .S_AXI_HP2_awburst      ( S_AXI_HP2_awburst     ),
  .S_AXI_HP2_awcache      ( S_AXI_HP2_awcache     ),
  .S_AXI_HP2_awid         ( S_AXI_HP2_awid        ),
  .S_AXI_HP2_awlen        ( S_AXI_HP2_awlen       ),
  .S_AXI_HP2_awlock       ( S_AXI_HP2_awlock      ),
  .S_AXI_HP2_awprot       ( S_AXI_HP2_awprot      ),
  .S_AXI_HP2_awqos        ( S_AXI_HP2_awqos       ),
  .S_AXI_HP2_awready      ( S_AXI_HP2_awready     ),
  .S_AXI_HP2_awsize       ( S_AXI_HP2_awsize      ),
  .S_AXI_HP2_awvalid      ( S_AXI_HP2_awvalid     ),
  .S_AXI_HP2_bid          ( S_AXI_HP2_bid         ),
  .S_AXI_HP2_bready       ( S_AXI_HP2_bready      ),
  .S_AXI_HP2_bresp        ( S_AXI_HP2_bresp       ),
  .S_AXI_HP2_bvalid       ( S_AXI_HP2_bvalid      ),
  .S_AXI_HP2_rdata        ( S_AXI_HP2_rdata       ),
  .S_AXI_HP2_rid          ( S_AXI_HP2_rid         ),
  .S_AXI_HP2_rlast        ( S_AXI_HP2_rlast       ),
  .S_AXI_HP2_rready       ( S_AXI_HP2_rready      ),
  .S_AXI_HP2_rresp        ( S_AXI_HP2_rresp       ),
  .S_AXI_HP2_rvalid       ( S_AXI_HP2_rvalid      ),
  .S_AXI_HP2_wdata        ( S_AXI_HP2_wdata       ),
  .S_AXI_HP2_wid          ( S_AXI_HP2_wid         ),
  .S_AXI_HP2_wlast        ( S_AXI_HP2_wlast       ),
  .S_AXI_HP2_wready       ( S_AXI_HP2_wready      ),
  .S_AXI_HP2_wstrb        ( S_AXI_HP2_wstrb       ),
  .S_AXI_HP2_wvalid       ( S_AXI_HP2_wvalid      ),

  .S_AXI_HP3_araddr       ( S_AXI_HP3_araddr      ),
  .S_AXI_HP3_arburst      ( S_AXI_HP3_arburst     ),
  .S_AXI_HP3_arcache      ( S_AXI_HP3_arcache     ),
  .S_AXI_HP3_arid         ( S_AXI_HP3_arid        ),
  .S_AXI_HP3_arlen        ( S_AXI_HP3_arlen       ),
  .S_AXI_HP3_arlock       ( S_AXI_HP3_arlock      ),
  .S_AXI_HP3_arprot       ( S_AXI_HP3_arprot      ),
  .S_AXI_HP3_arqos        ( S_AXI_HP3_arqos       ),
  .S_AXI_HP3_arready      ( S_AXI_HP3_arready     ),
  .S_AXI_HP3_arsize       ( S_AXI_HP3_arsize      ),
  .S_AXI_HP3_arvalid      ( S_AXI_HP3_arvalid     ),
  .S_AXI_HP3_awaddr       ( S_AXI_HP3_awaddr      ),
  .S_AXI_HP3_awburst      ( S_AXI_HP3_awburst     ),
  .S_AXI_HP3_awcache      ( S_AXI_HP3_awcache     ),
  .S_AXI_HP3_awid         ( S_AXI_HP3_awid        ),
  .S_AXI_HP3_awlen        ( S_AXI_HP3_awlen       ),
  .S_AXI_HP3_awlock       ( S_AXI_HP3_awlock      ),
  .S_AXI_HP3_awprot       ( S_AXI_HP3_awprot      ),
  .S_AXI_HP3_awqos        ( S_AXI_HP3_awqos       ),
  .S_AXI_HP3_awready      ( S_AXI_HP3_awready     ),
  .S_AXI_HP3_awsize       ( S_AXI_HP3_awsize      ),
  .S_AXI_HP3_awvalid      ( S_AXI_HP3_awvalid     ),
  .S_AXI_HP3_bid          ( S_AXI_HP3_bid         ),
  .S_AXI_HP3_bready       ( S_AXI_HP3_bready      ),
  .S_AXI_HP3_bresp        ( S_AXI_HP3_bresp       ),
  .S_AXI_HP3_bvalid       ( S_AXI_HP3_bvalid      ),
  .S_AXI_HP3_rdata        ( S_AXI_HP3_rdata       ),
  .S_AXI_HP3_rid          ( S_AXI_HP3_rid         ),
  .S_AXI_HP3_rlast        ( S_AXI_HP3_rlast       ),
  .S_AXI_HP3_rready       ( S_AXI_HP3_rready      ),
  .S_AXI_HP3_rresp        ( S_AXI_HP3_rresp       ),
  .S_AXI_HP3_rvalid       ( S_AXI_HP3_rvalid      ),
  .S_AXI_HP3_wdata        ( S_AXI_HP3_wdata       ),
  .S_AXI_HP3_wid          ( S_AXI_HP3_wid         ),
  .S_AXI_HP3_wlast        ( S_AXI_HP3_wlast       ),
  .S_AXI_HP3_wready       ( S_AXI_HP3_wready      ),
  .S_AXI_HP3_wstrb        ( S_AXI_HP3_wstrb       ),
  .S_AXI_HP3_wvalid       ( S_AXI_HP3_wvalid      )
);

// ******************************************************************
// Tabla
// ******************************************************************

  assign {S_AXI_HP3_araddr, S_AXI_HP2_araddr, S_AXI_HP1_araddr, S_AXI_HP0_araddr} = S_AXI_ARADDR;
  assign {S_AXI_HP3_arburst, S_AXI_HP2_arburst, S_AXI_HP1_arburst, S_AXI_HP0_arburst} = S_AXI_ARBURST;
  assign {S_AXI_HP3_arcache, S_AXI_HP2_arcache, S_AXI_HP1_arcache, S_AXI_HP0_arcache} = S_AXI_ARCACHE;
  assign {S_AXI_HP3_arid, S_AXI_HP2_arid, S_AXI_HP1_arid, S_AXI_HP0_arid} = S_AXI_ARID;
  assign {S_AXI_HP3_arlen, S_AXI_HP2_arlen, S_AXI_HP1_arlen, S_AXI_HP0_arlen} = S_AXI_ARLEN;
  assign {S_AXI_HP3_arlock, S_AXI_HP2_arlock, S_AXI_HP1_arlock, S_AXI_HP0_arlock} = S_AXI_ARLOCK;
  assign {S_AXI_HP3_arprot, S_AXI_HP2_arprot, S_AXI_HP1_arprot, S_AXI_HP0_arprot} = S_AXI_ARPROT;
  assign {S_AXI_HP3_arqos, S_AXI_HP2_arqos, S_AXI_HP1_arqos, S_AXI_HP0_arqos} = S_AXI_ARQOS;
  assign S_AXI_ARREADY = {S_AXI_HP3_arready, S_AXI_HP2_arready, S_AXI_HP1_arready, S_AXI_HP0_arready};
  assign {S_AXI_HP3_arsize, S_AXI_HP2_arsize, S_AXI_HP1_arsize, S_AXI_HP0_arsize} = S_AXI_ARSIZE;
  assign {S_AXI_HP3_arvalid, S_AXI_HP2_arvalid, S_AXI_HP1_arvalid, S_AXI_HP0_arvalid} = S_AXI_ARVALID;
  assign {S_AXI_HP3_awaddr, S_AXI_HP2_awaddr, S_AXI_HP1_awaddr, S_AXI_HP0_awaddr} = S_AXI_AWADDR;
  assign {S_AXI_HP3_awburst, S_AXI_HP2_awburst, S_AXI_HP1_awburst, S_AXI_HP0_awburst} = S_AXI_AWBURST;
  assign {S_AXI_HP3_awcache, S_AXI_HP2_awcache, S_AXI_HP1_awcache, S_AXI_HP0_awcache} = S_AXI_AWCACHE;
  assign {S_AXI_HP3_awid, S_AXI_HP2_awid, S_AXI_HP1_awid, S_AXI_HP0_awid} = S_AXI_AWID;
  assign {S_AXI_HP3_awlen, S_AXI_HP2_awlen, S_AXI_HP1_awlen, S_AXI_HP0_awlen} = S_AXI_AWLEN;
  assign {S_AXI_HP3_awlock, S_AXI_HP2_awlock, S_AXI_HP1_awlock, S_AXI_HP0_awlock} = S_AXI_AWLOCK;
  assign {S_AXI_HP3_awprot, S_AXI_HP2_awprot, S_AXI_HP1_awprot, S_AXI_HP0_awprot} = S_AXI_AWPROT;
  assign {S_AXI_HP3_awqos, S_AXI_HP2_awqos, S_AXI_HP1_awqos, S_AXI_HP0_awqos} = S_AXI_AWQOS;
  assign S_AXI_AWREADY = {S_AXI_HP3_awready, S_AXI_HP2_awready, S_AXI_HP1_awready, S_AXI_HP0_awready};
  assign {S_AXI_HP3_awsize, S_AXI_HP2_awsize, S_AXI_HP1_awsize, S_AXI_HP0_awsize} = S_AXI_AWSIZE;
  assign {S_AXI_HP3_awvalid, S_AXI_HP2_awvalid, S_AXI_HP1_awvalid, S_AXI_HP0_awvalid} = S_AXI_AWVALID;
  assign S_AXI_BID = {S_AXI_HP3_bid, S_AXI_HP2_bid, S_AXI_HP1_bid, S_AXI_HP0_bid};
  assign {S_AXI_HP3_bready, S_AXI_HP2_bready, S_AXI_HP1_bready, S_AXI_HP0_bready} = S_AXI_BREADY;
  assign S_AXI_BRESP = {S_AXI_HP3_bresp, S_AXI_HP2_bresp, S_AXI_HP1_bresp, S_AXI_HP0_bresp};
  assign S_AXI_BVALID = {S_AXI_HP3_bvalid, S_AXI_HP2_bvalid, S_AXI_HP1_bvalid, S_AXI_HP0_bvalid};
  assign S_AXI_RDATA = {S_AXI_HP3_rdata, S_AXI_HP2_rdata, S_AXI_HP1_rdata, S_AXI_HP0_rdata};
  assign S_AXI_RID = {S_AXI_HP3_rid, S_AXI_HP2_rid, S_AXI_HP1_rid, S_AXI_HP0_rid};
  assign S_AXI_RLAST = {S_AXI_HP3_rlast, S_AXI_HP2_rlast, S_AXI_HP1_rlast, S_AXI_HP0_rlast};
  assign {S_AXI_HP3_rready, S_AXI_HP2_rready, S_AXI_HP1_rready, S_AXI_HP0_rready} = S_AXI_RREADY;
  assign S_AXI_RRESP = {S_AXI_HP3_rresp, S_AXI_HP2_rresp, S_AXI_HP1_rresp, S_AXI_HP0_rresp};
  assign S_AXI_RVALID = {S_AXI_HP3_rvalid, S_AXI_HP2_rvalid, S_AXI_HP1_rvalid, S_AXI_HP0_rvalid};
  assign {S_AXI_HP3_wdata, S_AXI_HP2_wdata, S_AXI_HP1_wdata, S_AXI_HP0_wdata} = S_AXI_WDATA;
  assign {S_AXI_HP3_wid, S_AXI_HP2_wid, S_AXI_HP1_wid, S_AXI_HP0_wid} = S_AXI_WID;
  assign {S_AXI_HP3_wlast, S_AXI_HP2_wlast, S_AXI_HP1_wlast, S_AXI_HP0_wlast} = S_AXI_WLAST;
  assign S_AXI_WREADY = {S_AXI_HP3_wready, S_AXI_HP2_wready, S_AXI_HP1_wready, S_AXI_HP0_wready};
  assign {S_AXI_HP3_wstrb, S_AXI_HP2_wstrb, S_AXI_HP1_wstrb, S_AXI_HP0_wstrb} = S_AXI_WSTRB;
  assign {S_AXI_HP3_wvalid, S_AXI_HP2_wvalid, S_AXI_HP1_wvalid, S_AXI_HP0_wvalid} = S_AXI_WVALID;

  assign ACLK = FCLK_CLK0;
  assign ARESETN = FCLK_RESET0_N;

tabla_wrapper_mem_test #(

  .AXIS_DATA_WIDTH        ( AXIS_DATA_WIDTH       ),
  .AXIS_ADDR_WIDTH        ( AXIS_ADDR_WIDTH       ),
  .DATA_WIDTH             ( DATA_WIDTH            ),
  .AXIM_DATA_WIDTH        ( AXIM_DATA_WIDTH       ),
  .RD_BUF_ADDR_WIDTH      ( RD_BUF_ADDR_WIDTH     ),
  .NUM_PE                 ( NUM_PE                ),
  .NUM_AXI                ( NUM_AXI               ),
  .TX_SIZE_WIDTH          ( TX_SIZE_WIDTH         )

) u_tabla_wrapper (

  .ACLK                   ( ACLK                  ), //input
  .ARESETN                ( ARESETN               ), //input

  .S_AXI_ARADDR           ( S_AXI_ARADDR          ), //output
  .S_AXI_ARBURST          ( S_AXI_ARBURST         ), //output
  .S_AXI_ARCACHE          ( S_AXI_ARCACHE         ), //output
  .S_AXI_ARID             ( S_AXI_ARID            ), //output
  .S_AXI_ARLEN            ( S_AXI_ARLEN           ), //output
  .S_AXI_ARLOCK           ( S_AXI_ARLOCK          ), //output
  .S_AXI_ARPROT           ( S_AXI_ARPROT          ), //output
  .S_AXI_ARQOS            ( S_AXI_ARQOS           ), //output
  .S_AXI_ARUSER           (                       ), //output
  .S_AXI_ARREADY          ( S_AXI_ARREADY         ), //input
  .S_AXI_ARSIZE           ( S_AXI_ARSIZE          ), //output
  .S_AXI_ARVALID          ( S_AXI_ARVALID         ), //output
  .S_AXI_AWADDR           ( S_AXI_AWADDR          ), //output
  .S_AXI_AWBURST          ( S_AXI_AWBURST         ), //output
  .S_AXI_AWCACHE          ( S_AXI_AWCACHE         ), //output
  .S_AXI_AWID             ( S_AXI_AWID            ), //output
  .S_AXI_AWLEN            ( S_AXI_AWLEN           ), //output
  .S_AXI_AWLOCK           ( S_AXI_AWLOCK          ), //output
  .S_AXI_AWPROT           ( S_AXI_AWPROT          ), //output
  .S_AXI_AWQOS            ( S_AXI_AWQOS           ), //output
  .S_AXI_AWUSER           (                       ), //output
  .S_AXI_AWREADY          ( S_AXI_AWREADY         ), //input
  .S_AXI_AWSIZE           ( S_AXI_AWSIZE          ), //output
  .S_AXI_AWVALID          ( S_AXI_AWVALID         ), //output
  .S_AXI_BID              ( S_AXI_BID             ), //input
  .S_AXI_BUSER            ( 'b0                   ), //input
  .S_AXI_BREADY           ( S_AXI_BREADY          ), //output
  .S_AXI_BRESP            ( S_AXI_BRESP           ), //input
  .S_AXI_BVALID           ( S_AXI_BVALID          ), //input
  .S_AXI_RDATA            ( S_AXI_RDATA           ), //input
  .S_AXI_RID              ( S_AXI_RID             ), //input
  .S_AXI_RUSER            ( 'b0                   ), //input
  .S_AXI_RLAST            ( S_AXI_RLAST           ), //input
  .S_AXI_RREADY           ( S_AXI_RREADY          ), //output
  .S_AXI_RRESP            ( S_AXI_RRESP           ), //input
  .S_AXI_RVALID           ( S_AXI_RVALID          ), //input
  .S_AXI_WDATA            ( S_AXI_WDATA           ), //output
  .S_AXI_WID              ( S_AXI_WID             ), //output
  .S_AXI_WUSER            ( S_AXI_WUSER           ), //output
  .S_AXI_WLAST            ( S_AXI_WLAST           ), //output
  .S_AXI_WREADY           ( S_AXI_WREADY          ), //input
  .S_AXI_WSTRB            ( S_AXI_WSTRB           ), //output
  .S_AXI_WVALID           ( S_AXI_WVALID          ), //output

  .M_AXI_GP0_awaddr       ( M_AXI_GP0_awaddr      ), //input 
  .M_AXI_GP0_awprot       ( M_AXI_GP0_awprot      ), //input 
  .M_AXI_GP0_awready      ( M_AXI_GP0_awready     ), //output 
  .M_AXI_GP0_awvalid      ( M_AXI_GP0_awvalid     ), //input
  .M_AXI_GP0_wdata        ( M_AXI_GP0_wdata       ), //input 
  .M_AXI_GP0_wstrb        ( M_AXI_GP0_wstrb       ), //input 
  .M_AXI_GP0_wvalid       ( M_AXI_GP0_wvalid      ), //input 
  .M_AXI_GP0_wready       ( M_AXI_GP0_wready      ), //output
  .M_AXI_GP0_bresp        ( M_AXI_GP0_bresp       ), //output
  .M_AXI_GP0_bvalid       ( M_AXI_GP0_bvalid      ), //output
  .M_AXI_GP0_bready       ( M_AXI_GP0_bready      ), //input 
  .M_AXI_GP0_araddr       ( M_AXI_GP0_araddr      ), //input 
  .M_AXI_GP0_arprot       ( M_AXI_GP0_arprot      ), //input 
  .M_AXI_GP0_arvalid      ( M_AXI_GP0_arvalid     ), //input 
  .M_AXI_GP0_arready      ( M_AXI_GP0_arready     ), //output
  .M_AXI_GP0_rdata        ( M_AXI_GP0_rdata       ), //output
  .M_AXI_GP0_rresp        ( M_AXI_GP0_rresp       ), //output
  .M_AXI_GP0_rvalid       ( M_AXI_GP0_rvalid      ), //output
  .M_AXI_GP0_rready       ( M_AXI_GP0_rready      )  //input 

);
// ******************************************************************

endmodule
