//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: bu_write_addr_generator
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


module hbm_top
# (
  parameter AXI_CHANNELS  = 16,
  parameter ADDR_WIDTH   = 33,  // [32] select stack 0, [33] select stack 1
  parameter ID_WIDTH     = 5,
  parameter WEIGHT_AXI_CHNL = 1, // Reuse one output channel 
  parameter INPUT_AXI_CHNL = 8,
  parameter OUTPUT_AXI_CHNL = 8,
  parameter DATA_WIDTH   = 256
)
(
  //////////////////ddr clock/////////////////
  input wire                   ddr_clk,
  input wire                   sys_clk,
  input wire                   rst_n,
  //////////////////control and data for input/////////////
  //read
  input  wire                   start_read_input,
  input  wire  [32-1:0]         input_read_ops,
  input  wire  [32-1:0]         input_read_stride,
  input  wire  [ADDR_WIDTH-1:0] input_read_init_addr,
  input  wire  [16-1:0]         input_read_mem_burst_size,
  output wire  [INPUT_AXI_CHNL-1:0]         dn_input_vld,
  output wire  [DATA_WIDTH*INPUT_AXI_CHNL-1:0]  dn_input_dat,

  //write
  input wire                    start_write_input,
  input wire   [32-1:0]         input_write_ops,
  input wire   [32-1:0]         input_write_stride,
  input wire   [ADDR_WIDTH-1:0] input_write_init_addr,
  input wire   [16-1:0]         input_write_mem_burst_size,


  //////////////////control and data for weightput/////////////
  //read
  input  wire                   start_read_weight,
  input  wire  [32-1:0]         weight_read_ops,
  input  wire  [32-1:0]         weight_read_stride,
  input  wire  [ADDR_WIDTH-1:0] weight_read_init_addr,
  input  wire  [16-1:0]         weight_read_mem_burst_size,
  output wire                   dn_weight_vld,
  output wire  [DATA_WIDTH*WEIGHT_AXI_CHNL-1:0]  dn_weight_dat,

  //write
  input wire                    start_write_weight,
  input wire   [32-1:0]         weight_write_ops,
  input wire   [32-1:0]         weight_write_stride,
  input wire   [ADDR_WIDTH-1:0] weight_write_init_addr,
  input wire   [16-1:0]         weight_write_mem_burst_size,
  input wire                    auto_write_weight,


  //////////////////control and data for output/////////////
  //raed is not used for output buffer
  //write
  input wire   [OUTPUT_AXI_CHNL-1:0]                start_write_output,
  input wire   [32-1:0]         output_write_ops,
  input wire   [32-1:0]         output_write_stride,
  input wire   [ADDR_WIDTH-1:0] output_write_init_addr,
  input wire   [16-1:0]         output_write_mem_burst_size,
  // output data from the butterfly engine 
  input wire  [OUTPUT_AXI_CHNL*DATA_WIDTH-1:0]      up_output_dat
);

genvar i;

wire               APB_0_PCLK      ;
wire               APB_0_PRESET_N  ;
wire               AXI_ACLK_IN_0   ;
wire               AXI_ARESET_N_0  ;
wire               HBM_REF_CLK_0   ;
wire               locked;


// =========================================================================== //
// Generate Wiring
// =========================================================================== //

//////////////////AXI Wires/////////////////
wire                 hbm_axi_clk[AXI_CHANNELS-1:0];
wire                 hbm_axi_arstn[AXI_CHANNELS-1:0];


// AR channel
wire[ADDR_WIDTH-1:0] hbm_axi_araddr[AXI_CHANNELS-1:0];
wire[1:0]            hbm_axi_arburst[AXI_CHANNELS-1:0];
wire[ID_WIDTH-1:0]   hbm_axi_arid[AXI_CHANNELS-1:0];
wire[7:0]            hbm_axi_arlen[AXI_CHANNELS-1:0];
wire[2:0]            hbm_axi_arsize[AXI_CHANNELS-1:0];
wire                 hbm_axi_arvalid[AXI_CHANNELS-1:0];
wire                 hbm_axi_arready[AXI_CHANNELS-1:0];

// Read channel
wire[DATA_WIDTH-1:0] hbm_axi_rdata[AXI_CHANNELS-1:0];
wire[ID_WIDTH-1:0]   hbm_axi_rid[AXI_CHANNELS-1:0];
wire                 hbm_axi_rlast[AXI_CHANNELS-1:0];
wire[1:0]            hbm_axi_rresp[AXI_CHANNELS-1:0];
wire                 hbm_axi_rvalid[AXI_CHANNELS-1:0];
wire                 hbm_axi_rready[AXI_CHANNELS-1:0];


// AW channel
wire[ADDR_WIDTH-1:0] hbm_axi_awaddr[AXI_CHANNELS-1:0];
wire[1:0]            hbm_axi_awburst[AXI_CHANNELS-1:0];
wire[ID_WIDTH-1:0]   hbm_axi_awid[AXI_CHANNELS-1:0];
wire[7:0]            hbm_axi_awlen[AXI_CHANNELS-1:0];
wire[2:0]            hbm_axi_awsize[AXI_CHANNELS-1:0];
wire                 hbm_axi_awvalid[AXI_CHANNELS-1:0];
wire                 hbm_axi_awready[AXI_CHANNELS-1:0];

// W channel
wire[DATA_WIDTH-1:0]   hbm_axi_wdata[AXI_CHANNELS-1:0];
wire                   hbm_axi_wlast[AXI_CHANNELS-1:0];
wire[DATA_WIDTH/8-1:0] hbm_axi_wstrb[AXI_CHANNELS-1:0];
wire                   hbm_axi_wvalid[AXI_CHANNELS-1:0];
wire                   hbm_axi_wready[AXI_CHANNELS-1:0];

// B channel
wire[ID_WIDTH-1:0]   hbm_axi_bid[AXI_CHANNELS-1:0];
wire[1:0]            hbm_axi_bresp[AXI_CHANNELS-1:0];
wire                 hbm_axi_bready[AXI_CHANNELS-1:0];
wire                 hbm_axi_bvalid[AXI_CHANNELS-1:0];


// =========================================================================== //
// Instantiate Clock Wizard
// =========================================================================== //

clk_wiz_0 inst_clk_wiz_0
(
  // Clock out ports
  .clk_out1(APB_0_PCLK),     // output clk_out1, 100 MHz
  .clk_out2(AXI_ACLK_IN_0),     // output clk_out2, 200 MHz
  .clk_out3(HBM_REF_CLK_0),     // output clk_out3, 100 MHz
  // Status and control signals
  .reset(1'b0), // input reset
  .locked(locked),       // output locked
  // Clock in ports
  .clk_in1(ddr_clk) // 100 MHz
);      // input clk_in1

assign APB_0_PRESET_N = locked;
assign AXI_ARESET_N_0 = locked;


generate
for(i=0 ; i<AXI_CHANNELS ; i=i+1)
begin : GENERATE_CLOCKING
    assign hbm_axi_clk[i] = AXI_ACLK_IN_0;
    assign hbm_axi_arstn[i]= AXI_ARESET_N_0;
    assign hbm_axi_bready[i]= 1'b0;
end
endgenerate

// =========================================================================== //
// Instantiate High Bandwidth Memory
// =========================================================================== //

hbm_0 hbm_u (
  .HBM_REF_CLK_0(HBM_REF_CLK_0),              // input wire HBM_REF_CLK_0

  .AXI_00_ACLK(hbm_axi_clk[0]),                  // input wire AXI_00_ACLK
  .AXI_00_ARESET_N(hbm_axi_arstn[0]),          // input wire AXI_00_ARESET_N
  .AXI_00_ARADDR(hbm_axi_araddr[0]),              // input wire [32 : 0] AXI_00_ARADDR
  .AXI_00_ARBURST(hbm_axi_arburst[0]),            // input wire [1 : 0] AXI_00_ARBURST
  .AXI_00_ARID(hbm_axi_arid[0]),                  // input wire [5 : 0] AXI_00_ARID
  .AXI_00_ARLEN(hbm_axi_arlen[0]),                // input wire [3 : 0] AXI_00_ARLEN
  .AXI_00_ARSIZE(hbm_axi_arsize[0]),              // input wire [2 : 0] AXI_00_ARSIZE
  .AXI_00_ARVALID(hbm_axi_arvalid[0]),            // input wire AXI_00_ARVALID
  .AXI_00_ARREADY(hbm_axi_arready[0]),            // output wire AXI_00_ARREADY
  .AXI_00_RDATA(hbm_axi_rdata[0]),                // output wire [255 : 0] AXI_00_RDATA
  .AXI_00_RID(hbm_axi_rid[0]),                    // output wire [5 : 0] AXI_00_RID
  .AXI_00_RLAST(hbm_axi_rlast[0]),                // output wire AXI_00_RLAST
  .AXI_00_RRESP(hbm_axi_rresp[0]),                // output wire [1 : 0] AXI_00_RRESP
  .AXI_00_RVALID(hbm_axi_rvalid[0]),              // output wire AXI_00_RVALID
  .AXI_00_RREADY(hbm_axi_rready[0]),              // input wire AXI_00_RREADY
  .AXI_00_RDATA_PARITY(),  // output wire [31 : 0] AXI_00_RDATA_PARITY
  .AXI_00_AWADDR(hbm_axi_awaddr[0]),              // input wire [32 : 0] AXI_00_AWADDR
  .AXI_00_AWBURST(hbm_axi_awburst[0]),            // input wire [1 : 0] AXI_00_AWBURST
  .AXI_00_AWID(hbm_axi_awid[0]),                  // input wire [5 : 0] AXI_00_AWID
  .AXI_00_AWLEN(hbm_axi_awlen[0]),                // input wire [3 : 0] AXI_00_AWLEN
  .AXI_00_AWSIZE(hbm_axi_awsize[0]),              // input wire [2 : 0] AXI_00_AWSIZE
  .AXI_00_AWVALID(hbm_axi_awvalid[0]),            // input wire AXI_00_AWVALID
  .AXI_00_AWREADY(hbm_axi_awready[0]),            // output wire AXI_00_AWREADY
  .AXI_00_WDATA(hbm_axi_wdata[0]),                // input wire [255 : 0] AXI_00_WDATA
  .AXI_00_WLAST(hbm_axi_wlast[0]),                // input wire AXI_00_WLAST
  .AXI_00_WSTRB(hbm_axi_wstrb[0]),                // input wire [31 : 0] AXI_00_WSTRB
  .AXI_00_WVALID(hbm_axi_wvalid[0]),              // input wire AXI_00_WVALID
  .AXI_00_WREADY(hbm_axi_wready[0]),              // output wire AXI_00_WREADY
  .AXI_00_WDATA_PARITY(0),  // input wire [31 : 0] AXI_00_WDATA_PARITY
  .AXI_00_BID(hbm_axi_bid[0]),                    // output wire [5 : 0] AXI_00_BID
  .AXI_00_BRESP(hbm_axi_bresp[0]),                // output wire [1 : 0] AXI_00_BRESP
  .AXI_00_BVALID(hbm_axi_bvalid[0]),              // output wire AXI_00_BVALID
  .AXI_00_BREADY(hbm_axi_bready[0]),              // input wire AXI_00_BREADY

  .AXI_01_ACLK(hbm_axi_clk[1]),                  // input wire AXI_01_ACLK
  .AXI_01_ARESET_N(hbm_axi_arstn[1]),          // input wire AXI_01_ARESET_N
  .AXI_01_ARADDR(hbm_axi_araddr[1]),              // input wire [32 : 0] AXI_01_ARADDR
  .AXI_01_ARBURST(hbm_axi_arburst[1]),            // input wire [1 : 0] AXI_01_ARBURST
  .AXI_01_ARID(hbm_axi_arid[1]),                  // input wire [5 : 0] AXI_01_ARID
  .AXI_01_ARLEN(hbm_axi_arlen[1]),                // input wire [3 : 0] AXI_01_ARLEN
  .AXI_01_ARSIZE(hbm_axi_arsize[1]),              // input wire [2 : 0] AXI_01_ARSIZE
  .AXI_01_ARVALID(hbm_axi_arvalid[1]),            // input wire AXI_01_ARVALID
  .AXI_01_ARREADY(hbm_axi_arready[1]),            // output wire AXI_01_ARREADY
  .AXI_01_RDATA(hbm_axi_rdata[1]),                // output wire [255 : 0] AXI_01_RDATA
  .AXI_01_RID(hbm_axi_rid[1]),                    // output wire [5 : 0] AXI_01_RID
  .AXI_01_RLAST(hbm_axi_rlast[1]),                // output wire AXI_01_RLAST
  .AXI_01_RRESP(hbm_axi_rresp[1]),                // output wire [1 : 0] AXI_01_RRESP
  .AXI_01_RVALID(hbm_axi_rvalid[1]),              // output wire AXI_01_RVALID
  .AXI_01_RREADY(hbm_axi_rready[1]),              // input wire AXI_01_RREADY
  .AXI_01_RDATA_PARITY(),  // output wire [31 : 0] AXI_01_RDATA_PARITY
  .AXI_01_AWADDR(hbm_axi_awaddr[1]),              // input wire [32 : 0] AXI_01_AWADDR
  .AXI_01_AWBURST(hbm_axi_awburst[1]),            // input wire [1 : 0] AXI_01_AWBURST
  .AXI_01_AWID(hbm_axi_awid[1]),                  // input wire [5 : 0] AXI_01_AWID
  .AXI_01_AWLEN(hbm_axi_awlen[1]),                // input wire [3 : 0] AXI_01_AWLEN
  .AXI_01_AWSIZE(hbm_axi_awsize[1]),              // input wire [2 : 0] AXI_01_AWSIZE
  .AXI_01_AWVALID(hbm_axi_awvalid[1]),            // input wire AXI_01_AWVALID
  .AXI_01_AWREADY(hbm_axi_awready[1]),            // output wire AXI_01_AWREADY
  .AXI_01_WDATA(hbm_axi_wdata[1]),                // input wire [255 : 0] AXI_01_WDATA
  .AXI_01_WLAST(hbm_axi_wlast[1]),                // input wire AXI_01_WLAST
  .AXI_01_WSTRB(hbm_axi_wstrb[1]),                // input wire [31 : 0] AXI_01_WSTRB
  .AXI_01_WVALID(hbm_axi_wvalid[1]),              // input wire AXI_01_WVALID
  .AXI_01_WREADY(hbm_axi_wready[1]),              // output wire AXI_01_WREADY
  .AXI_01_WDATA_PARITY(0),  // input wire [31 : 0] AXI_01_WDATA_PARITY
  .AXI_01_BID(hbm_axi_bid[1]),                    // output wire [5 : 0] AXI_01_BID
  .AXI_01_BRESP(hbm_axi_bresp[1]),                // output wire [1 : 0] AXI_01_BRESP
  .AXI_01_BVALID(hbm_axi_bvalid[1]),              // output wire AXI_01_BVALID
  .AXI_01_BREADY(hbm_axi_bready[1]),              // input wire AXI_01_BREADY

  .AXI_02_ACLK(hbm_axi_clk[2]),                  // input wire AXI_02_ACLK
  .AXI_02_ARESET_N(hbm_axi_arstn[2]),          // input wire AXI_02_ARESET_N
  .AXI_02_ARADDR(hbm_axi_araddr[2]),              // input wire [32 : 0] AXI_02_ARADDR
  .AXI_02_ARBURST(hbm_axi_arburst[2]),            // input wire [1 : 0] AXI_02_ARBURST
  .AXI_02_ARID(hbm_axi_arid[2]),                  // input wire [5 : 0] AXI_02_ARID
  .AXI_02_ARLEN(hbm_axi_arlen[2]),                // input wire [3 : 0] AXI_02_ARLEN
  .AXI_02_ARSIZE(hbm_axi_arsize[2]),              // input wire [2 : 0] AXI_02_ARSIZE
  .AXI_02_ARVALID(hbm_axi_arvalid[2]),            // input wire AXI_02_ARVALID
  .AXI_02_ARREADY(hbm_axi_arready[2]),            // output wire AXI_02_ARREADY
  .AXI_02_RDATA(hbm_axi_rdata[2]),                // output wire [255 : 0] AXI_02_RDATA
  .AXI_02_RID(hbm_axi_rid[2]),                    // output wire [5 : 0] AXI_02_RID
  .AXI_02_RLAST(hbm_axi_rlast[2]),                // output wire AXI_02_RLAST
  .AXI_02_RRESP(hbm_axi_rresp[2]),                // output wire [1 : 0] AXI_02_RRESP
  .AXI_02_RVALID(hbm_axi_rvalid[2]),              // output wire AXI_02_RVALID
  .AXI_02_RREADY(hbm_axi_rready[2]),              // input wire AXI_02_RREADY
  .AXI_02_RDATA_PARITY(),  // output wire [31 : 0] AXI_02_RDATA_PARITY
  .AXI_02_AWADDR(hbm_axi_awaddr[2]),              // input wire [32 : 0] AXI_02_AWADDR
  .AXI_02_AWBURST(hbm_axi_awburst[2]),            // input wire [1 : 0] AXI_02_AWBURST
  .AXI_02_AWID(hbm_axi_awid[2]),                  // input wire [5 : 0] AXI_02_AWID
  .AXI_02_AWLEN(hbm_axi_awlen[2]),                // input wire [3 : 0] AXI_02_AWLEN
  .AXI_02_AWSIZE(hbm_axi_awsize[2]),              // input wire [2 : 0] AXI_02_AWSIZE
  .AXI_02_AWVALID(hbm_axi_awvalid[2]),            // input wire AXI_02_AWVALID
  .AXI_02_AWREADY(hbm_axi_awready[2]),            // output wire AXI_02_AWREADY
  .AXI_02_WDATA(hbm_axi_wdata[2]),                // input wire [255 : 0] AXI_02_WDATA
  .AXI_02_WLAST(hbm_axi_wlast[2]),                // input wire AXI_02_WLAST
  .AXI_02_WSTRB(hbm_axi_wstrb[2]),                // input wire [31 : 0] AXI_02_WSTRB
  .AXI_02_WVALID(hbm_axi_wvalid[2]),              // input wire AXI_02_WVALID
  .AXI_02_WREADY(hbm_axi_wready[2]),              // output wire AXI_02_WREADY
  .AXI_02_WDATA_PARITY(0),  // input wire [31 : 0] AXI_02_WDATA_PARITY
  .AXI_02_BID(hbm_axi_bid[2]),                    // output wire [5 : 0] AXI_02_BID
  .AXI_02_BRESP(hbm_axi_bresp[2]),                // output wire [1 : 0] AXI_02_BRESP
  .AXI_02_BVALID(hbm_axi_bvalid[2]),              // output wire AXI_02_BVALID
  .AXI_02_BREADY(hbm_axi_bready[2]),              // input wire AXI_02_BREADY

  .AXI_03_ACLK(hbm_axi_clk[3]),                  // input wire AXI_03_ACLK
  .AXI_03_ARESET_N(hbm_axi_arstn[3]),          // input wire AXI_03_ARESET_N
  .AXI_03_ARADDR(hbm_axi_araddr[3]),              // input wire [32 : 0] AXI_03_ARADDR
  .AXI_03_ARBURST(hbm_axi_arburst[3]),            // input wire [1 : 0] AXI_03_ARBURST
  .AXI_03_ARID(hbm_axi_arid[3]),                  // input wire [5 : 0] AXI_03_ARID
  .AXI_03_ARLEN(hbm_axi_arlen[3]),                // input wire [3 : 0] AXI_03_ARLEN
  .AXI_03_ARSIZE(hbm_axi_arsize[3]),              // input wire [2 : 0] AXI_03_ARSIZE
  .AXI_03_ARVALID(hbm_axi_arvalid[3]),            // input wire AXI_03_ARVALID
  .AXI_03_ARREADY(hbm_axi_arready[3]),            // output wire AXI_03_ARREADY
  .AXI_03_RDATA(hbm_axi_rdata[3]),                // output wire [255 : 0] AXI_03_RDATA
  .AXI_03_RID(hbm_axi_rid[3]),                    // output wire [5 : 0] AXI_03_RID
  .AXI_03_RLAST(hbm_axi_rlast[3]),                // output wire AXI_03_RLAST
  .AXI_03_RRESP(hbm_axi_rresp[3]),                // output wire [1 : 0] AXI_03_RRESP
  .AXI_03_RVALID(hbm_axi_rvalid[3]),              // output wire AXI_03_RVALID
  .AXI_03_RREADY(hbm_axi_rready[3]),              // input wire AXI_03_RREADY
  .AXI_03_RDATA_PARITY(),  // output wire [31 : 0] AXI_03_RDATA_PARITY
  .AXI_03_AWADDR(hbm_axi_awaddr[3]),              // input wire [32 : 0] AXI_03_AWADDR
  .AXI_03_AWBURST(hbm_axi_awburst[3]),            // input wire [1 : 0] AXI_03_AWBURST
  .AXI_03_AWID(hbm_axi_awid[3]),                  // input wire [5 : 0] AXI_03_AWID
  .AXI_03_AWLEN(hbm_axi_awlen[3]),                // input wire [3 : 0] AXI_03_AWLEN
  .AXI_03_AWSIZE(hbm_axi_awsize[3]),              // input wire [2 : 0] AXI_03_AWSIZE
  .AXI_03_AWVALID(hbm_axi_awvalid[3]),            // input wire AXI_03_AWVALID
  .AXI_03_AWREADY(hbm_axi_awready[3]),            // output wire AXI_03_AWREADY
  .AXI_03_WDATA(hbm_axi_wdata[3]),                // input wire [255 : 0] AXI_03_WDATA
  .AXI_03_WLAST(hbm_axi_wlast[3]),                // input wire AXI_03_WLAST
  .AXI_03_WSTRB(hbm_axi_wstrb[3]),                // input wire [31 : 0] AXI_03_WSTRB
  .AXI_03_WVALID(hbm_axi_wvalid[3]),              // input wire AXI_03_WVALID
  .AXI_03_WREADY(hbm_axi_wready[3]),              // output wire AXI_03_WREADY
  .AXI_03_WDATA_PARITY(0),  // input wire [31 : 0] AXI_03_WDATA_PARITY
  .AXI_03_BID(hbm_axi_bid[3]),                    // output wire [5 : 0] AXI_03_BID
  .AXI_03_BRESP(hbm_axi_bresp[3]),                // output wire [1 : 0] AXI_03_BRESP
  .AXI_03_BVALID(hbm_axi_bvalid[3]),              // output wire AXI_03_BVALID
  .AXI_03_BREADY(hbm_axi_bready[3]),              // input wire AXI_03_BREADY

  .AXI_04_ACLK(hbm_axi_clk[4]),                  // input wire AXI_04_ACLK
  .AXI_04_ARESET_N(hbm_axi_arstn[4]),          // input wire AXI_04_ARESET_N
  .AXI_04_ARADDR(hbm_axi_araddr[4]),              // input wire [32 : 0] AXI_04_ARADDR
  .AXI_04_ARBURST(hbm_axi_arburst[4]),            // input wire [1 : 0] AXI_04_ARBURST
  .AXI_04_ARID(hbm_axi_arid[4]),                  // input wire [5 : 0] AXI_04_ARID
  .AXI_04_ARLEN(hbm_axi_arlen[4]),                // input wire [3 : 0] AXI_04_ARLEN
  .AXI_04_ARSIZE(hbm_axi_arsize[4]),              // input wire [2 : 0] AXI_04_ARSIZE
  .AXI_04_ARVALID(hbm_axi_arvalid[4]),            // input wire AXI_04_ARVALID
  .AXI_04_ARREADY(hbm_axi_arready[4]),            // output wire AXI_04_ARREADY
  .AXI_04_RDATA(hbm_axi_rdata[4]),                // output wire [255 : 0] AXI_04_RDATA
  .AXI_04_RID(hbm_axi_rid[4]),                    // output wire [5 : 0] AXI_04_RID
  .AXI_04_RLAST(hbm_axi_rlast[4]),                // output wire AXI_04_RLAST
  .AXI_04_RRESP(hbm_axi_rresp[4]),                // output wire [1 : 0] AXI_04_RRESP
  .AXI_04_RVALID(hbm_axi_rvalid[4]),              // output wire AXI_04_RVALID
  .AXI_04_RREADY(hbm_axi_rready[4]),              // input wire AXI_04_RREADY
  .AXI_04_RDATA_PARITY(),  // output wire [31 : 0] AXI_04_RDATA_PARITY
  .AXI_04_AWADDR(hbm_axi_awaddr[4]),              // input wire [32 : 0] AXI_04_AWADDR
  .AXI_04_AWBURST(hbm_axi_awburst[4]),            // input wire [1 : 0] AXI_04_AWBURST
  .AXI_04_AWID(hbm_axi_awid[4]),                  // input wire [5 : 0] AXI_04_AWID
  .AXI_04_AWLEN(hbm_axi_awlen[4]),                // input wire [3 : 0] AXI_04_AWLEN
  .AXI_04_AWSIZE(hbm_axi_awsize[4]),              // input wire [2 : 0] AXI_04_AWSIZE
  .AXI_04_AWVALID(hbm_axi_awvalid[4]),            // input wire AXI_04_AWVALID
  .AXI_04_AWREADY(hbm_axi_awready[4]),            // output wire AXI_04_AWREADY
  .AXI_04_WDATA(hbm_axi_wdata[4]),                // input wire [255 : 0] AXI_04_WDATA
  .AXI_04_WLAST(hbm_axi_wlast[4]),                // input wire AXI_04_WLAST
  .AXI_04_WSTRB(hbm_axi_wstrb[4]),                // input wire [31 : 0] AXI_04_WSTRB
  .AXI_04_WVALID(hbm_axi_wvalid[4]),              // input wire AXI_04_WVALID
  .AXI_04_WREADY(hbm_axi_wready[4]),              // output wire AXI_04_WREADY
  .AXI_04_WDATA_PARITY(0),  // input wire [31 : 0] AXI_04_WDATA_PARITY
  .AXI_04_BID(hbm_axi_bid[4]),                    // output wire [5 : 0] AXI_04_BID
  .AXI_04_BRESP(hbm_axi_bresp[4]),                // output wire [1 : 0] AXI_04_BRESP
  .AXI_04_BVALID(hbm_axi_bvalid[4]),              // output wire AXI_04_BVALID
  .AXI_04_BREADY(hbm_axi_bready[4]),              // input wire AXI_04_BREADY

  .AXI_05_ACLK(hbm_axi_clk[5]),                  // input wire AXI_05_ACLK
  .AXI_05_ARESET_N(hbm_axi_arstn[5]),          // input wire AXI_05_ARESET_N
  .AXI_05_ARADDR(hbm_axi_araddr[5]),              // input wire [32 : 0] AXI_05_ARADDR
  .AXI_05_ARBURST(hbm_axi_arburst[5]),            // input wire [1 : 0] AXI_05_ARBURST
  .AXI_05_ARID(hbm_axi_arid[5]),                  // input wire [5 : 0] AXI_05_ARID
  .AXI_05_ARLEN(hbm_axi_arlen[5]),                // input wire [3 : 0] AXI_05_ARLEN
  .AXI_05_ARSIZE(hbm_axi_arsize[5]),              // input wire [2 : 0] AXI_05_ARSIZE
  .AXI_05_ARVALID(hbm_axi_arvalid[5]),            // input wire AXI_05_ARVALID
  .AXI_05_ARREADY(hbm_axi_arready[5]),            // output wire AXI_05_ARREADY
  .AXI_05_RDATA(hbm_axi_rdata[5]),                // output wire [255 : 0] AXI_05_RDATA
  .AXI_05_RID(hbm_axi_rid[5]),                    // output wire [5 : 0] AXI_05_RID
  .AXI_05_RLAST(hbm_axi_rlast[5]),                // output wire AXI_05_RLAST
  .AXI_05_RRESP(hbm_axi_rresp[5]),                // output wire [1 : 0] AXI_05_RRESP
  .AXI_05_RVALID(hbm_axi_rvalid[5]),              // output wire AXI_05_RVALID
  .AXI_05_RREADY(hbm_axi_rready[5]),              // input wire AXI_05_RREADY
  .AXI_05_RDATA_PARITY(),  // output wire [31 : 0] AXI_05_RDATA_PARITY
  .AXI_05_AWADDR(hbm_axi_awaddr[5]),              // input wire [32 : 0] AXI_05_AWADDR
  .AXI_05_AWBURST(hbm_axi_awburst[5]),            // input wire [1 : 0] AXI_05_AWBURST
  .AXI_05_AWID(hbm_axi_awid[5]),                  // input wire [5 : 0] AXI_05_AWID
  .AXI_05_AWLEN(hbm_axi_awlen[5]),                // input wire [3 : 0] AXI_05_AWLEN
  .AXI_05_AWSIZE(hbm_axi_awsize[5]),              // input wire [2 : 0] AXI_05_AWSIZE
  .AXI_05_AWVALID(hbm_axi_awvalid[5]),            // input wire AXI_05_AWVALID
  .AXI_05_AWREADY(hbm_axi_awready[5]),            // output wire AXI_05_AWREADY
  .AXI_05_WDATA(hbm_axi_wdata[5]),                // input wire [255 : 0] AXI_05_WDATA
  .AXI_05_WLAST(hbm_axi_wlast[5]),                // input wire AXI_05_WLAST
  .AXI_05_WSTRB(hbm_axi_wstrb[5]),                // input wire [31 : 0] AXI_05_WSTRB
  .AXI_05_WVALID(hbm_axi_wvalid[5]),              // input wire AXI_05_WVALID
  .AXI_05_WREADY(hbm_axi_wready[5]),              // output wire AXI_05_WREADY
  .AXI_05_WDATA_PARITY(0),  // input wire [31 : 0] AXI_05_WDATA_PARITY
  .AXI_05_BID(hbm_axi_bid[5]),                    // output wire [5 : 0] AXI_05_BID
  .AXI_05_BRESP(hbm_axi_bresp[5]),                // output wire [1 : 0] AXI_05_BRESP
  .AXI_05_BVALID(hbm_axi_bvalid[5]),              // output wire AXI_05_BVALID
  .AXI_05_BREADY(hbm_axi_bready[5]),              // input wire AXI_05_BREADY

  .AXI_06_ACLK(hbm_axi_clk[6]),                  // input wire AXI_06_ACLK
  .AXI_06_ARESET_N(hbm_axi_arstn[6]),          // input wire AXI_06_ARESET_N
  .AXI_06_ARADDR(hbm_axi_araddr[6]),              // input wire [32 : 0] AXI_06_ARADDR
  .AXI_06_ARBURST(hbm_axi_arburst[6]),            // input wire [1 : 0] AXI_06_ARBURST
  .AXI_06_ARID(hbm_axi_arid[6]),                  // input wire [5 : 0] AXI_06_ARID
  .AXI_06_ARLEN(hbm_axi_arlen[6]),                // input wire [3 : 0] AXI_06_ARLEN
  .AXI_06_ARSIZE(hbm_axi_arsize[6]),              // input wire [2 : 0] AXI_06_ARSIZE
  .AXI_06_ARVALID(hbm_axi_arvalid[6]),            // input wire AXI_06_ARVALID
  .AXI_06_ARREADY(hbm_axi_arready[6]),            // output wire AXI_06_ARREADY
  .AXI_06_RDATA(hbm_axi_rdata[6]),                // output wire [255 : 0] AXI_06_RDATA
  .AXI_06_RID(hbm_axi_rid[6]),                    // output wire [5 : 0] AXI_06_RID
  .AXI_06_RLAST(hbm_axi_rlast[6]),                // output wire AXI_06_RLAST
  .AXI_06_RRESP(hbm_axi_rresp[6]),                // output wire [1 : 0] AXI_06_RRESP
  .AXI_06_RVALID(hbm_axi_rvalid[6]),              // output wire AXI_06_RVALID
  .AXI_06_RREADY(hbm_axi_rready[6]),              // input wire AXI_06_RREADY
  .AXI_06_RDATA_PARITY(),  // output wire [31 : 0] AXI_06_RDATA_PARITY
  .AXI_06_AWADDR(hbm_axi_awaddr[6]),              // input wire [32 : 0] AXI_06_AWADDR
  .AXI_06_AWBURST(hbm_axi_awburst[6]),            // input wire [1 : 0] AXI_06_AWBURST
  .AXI_06_AWID(hbm_axi_awid[6]),                  // input wire [5 : 0] AXI_06_AWID
  .AXI_06_AWLEN(hbm_axi_awlen[6]),                // input wire [3 : 0] AXI_06_AWLEN
  .AXI_06_AWSIZE(hbm_axi_awsize[6]),              // input wire [2 : 0] AXI_06_AWSIZE
  .AXI_06_AWVALID(hbm_axi_awvalid[6]),            // input wire AXI_06_AWVALID
  .AXI_06_AWREADY(hbm_axi_awready[6]),            // output wire AXI_06_AWREADY
  .AXI_06_WDATA(hbm_axi_wdata[6]),                // input wire [255 : 0] AXI_06_WDATA
  .AXI_06_WLAST(hbm_axi_wlast[6]),                // input wire AXI_06_WLAST
  .AXI_06_WSTRB(hbm_axi_wstrb[6]),                // input wire [31 : 0] AXI_06_WSTRB
  .AXI_06_WVALID(hbm_axi_wvalid[6]),              // input wire AXI_06_WVALID
  .AXI_06_WREADY(hbm_axi_wready[6]),              // output wire AXI_06_WREADY
  .AXI_06_WDATA_PARITY(0),  // input wire [31 : 0] AXI_06_WDATA_PARITY
  .AXI_06_BID(hbm_axi_bid[6]),                    // output wire [5 : 0] AXI_06_BID
  .AXI_06_BRESP(hbm_axi_bresp[6]),                // output wire [1 : 0] AXI_06_BRESP
  .AXI_06_BVALID(hbm_axi_bvalid[6]),              // output wire AXI_06_BVALID
  .AXI_06_BREADY(hbm_axi_bready[6]),              // input wire AXI_06_BREADY

  .AXI_07_ACLK(hbm_axi_clk[7]),                  // input wire AXI_07_ACLK
  .AXI_07_ARESET_N(hbm_axi_arstn[7]),          // input wire AXI_07_ARESET_N
  .AXI_07_ARADDR(hbm_axi_araddr[7]),              // input wire [32 : 0] AXI_07_ARADDR
  .AXI_07_ARBURST(hbm_axi_arburst[7]),            // input wire [1 : 0] AXI_07_ARBURST
  .AXI_07_ARID(hbm_axi_arid[7]),                  // input wire [5 : 0] AXI_07_ARID
  .AXI_07_ARLEN(hbm_axi_arlen[7]),                // input wire [3 : 0] AXI_07_ARLEN
  .AXI_07_ARSIZE(hbm_axi_arsize[7]),              // input wire [2 : 0] AXI_07_ARSIZE
  .AXI_07_ARVALID(hbm_axi_arvalid[7]),            // input wire AXI_07_ARVALID
  .AXI_07_ARREADY(hbm_axi_arready[7]),            // output wire AXI_07_ARREADY
  .AXI_07_RDATA(hbm_axi_rdata[7]),                // output wire [255 : 0] AXI_07_RDATA
  .AXI_07_RID(hbm_axi_rid[7]),                    // output wire [5 : 0] AXI_07_RID
  .AXI_07_RLAST(hbm_axi_rlast[7]),                // output wire AXI_07_RLAST
  .AXI_07_RRESP(hbm_axi_rresp[7]),                // output wire [1 : 0] AXI_07_RRESP
  .AXI_07_RVALID(hbm_axi_rvalid[7]),              // output wire AXI_07_RVALID
  .AXI_07_RREADY(hbm_axi_rready[7]),              // input wire AXI_07_RREADY
  .AXI_07_RDATA_PARITY(),  // output wire [31 : 0] AXI_07_RDATA_PARITY
  .AXI_07_AWADDR(hbm_axi_awaddr[7]),              // input wire [32 : 0] AXI_07_AWADDR
  .AXI_07_AWBURST(hbm_axi_awburst[7]),            // input wire [1 : 0] AXI_07_AWBURST
  .AXI_07_AWID(hbm_axi_awid[7]),                  // input wire [5 : 0] AXI_07_AWID
  .AXI_07_AWLEN(hbm_axi_awlen[7]),                // input wire [3 : 0] AXI_07_AWLEN
  .AXI_07_AWSIZE(hbm_axi_awsize[7]),              // input wire [2 : 0] AXI_07_AWSIZE
  .AXI_07_AWVALID(hbm_axi_awvalid[7]),            // input wire AXI_07_AWVALID
  .AXI_07_AWREADY(hbm_axi_awready[7]),            // output wire AXI_07_AWREADY
  .AXI_07_WDATA(hbm_axi_wdata[7]),                // input wire [255 : 0] AXI_07_WDATA
  .AXI_07_WLAST(hbm_axi_wlast[7]),                // input wire AXI_07_WLAST
  .AXI_07_WSTRB(hbm_axi_wstrb[7]),                // input wire [31 : 0] AXI_07_WSTRB
  .AXI_07_WVALID(hbm_axi_wvalid[7]),              // input wire AXI_07_WVALID
  .AXI_07_WREADY(hbm_axi_wready[7]),              // output wire AXI_07_WREADY
  .AXI_07_WDATA_PARITY(0),  // input wire [31 : 0] AXI_07_WDATA_PARITY
  .AXI_07_BID(hbm_axi_bid[7]),                    // output wire [5 : 0] AXI_07_BID
  .AXI_07_BRESP(hbm_axi_bresp[7]),                // output wire [1 : 0] AXI_07_BRESP
  .AXI_07_BVALID(hbm_axi_bvalid[7]),              // output wire AXI_07_BVALID
  .AXI_07_BREADY(hbm_axi_bready[7]),              // input wire AXI_07_BREADY

  .AXI_08_ACLK(hbm_axi_clk[8]),                  // input wire AXI_08_ACLK
  .AXI_08_ARESET_N(hbm_axi_arstn[8]),          // input wire AXI_08_ARESET_N
  .AXI_08_ARADDR(hbm_axi_araddr[8]),              // input wire [32 : 0] AXI_08_ARADDR
  .AXI_08_ARBURST(hbm_axi_arburst[8]),            // input wire [1 : 0] AXI_08_ARBURST
  .AXI_08_ARID(hbm_axi_arid[8]),                  // input wire [5 : 0] AXI_08_ARID
  .AXI_08_ARLEN(hbm_axi_arlen[8]),                // input wire [3 : 0] AXI_08_ARLEN
  .AXI_08_ARSIZE(hbm_axi_arsize[8]),              // input wire [2 : 0] AXI_08_ARSIZE
  .AXI_08_ARVALID(hbm_axi_arvalid[8]),            // input wire AXI_08_ARVALID
  .AXI_08_ARREADY(hbm_axi_arready[8]),            // output wire AXI_08_ARREADY
  .AXI_08_RDATA(hbm_axi_rdata[8]),                // output wire [255 : 0] AXI_08_RDATA
  .AXI_08_RID(hbm_axi_rid[8]),                    // output wire [5 : 0] AXI_08_RID
  .AXI_08_RLAST(hbm_axi_rlast[8]),                // output wire AXI_08_RLAST
  .AXI_08_RRESP(hbm_axi_rresp[8]),                // output wire [1 : 0] AXI_08_RRESP
  .AXI_08_RVALID(hbm_axi_rvalid[8]),              // output wire AXI_08_RVALID
  .AXI_08_RREADY(hbm_axi_rready[8]),              // input wire AXI_08_RREADY
  .AXI_08_RDATA_PARITY(),  // output wire [31 : 0] AXI_08_RDATA_PARITY
  .AXI_08_AWADDR(hbm_axi_awaddr[8]),              // input wire [32 : 0] AXI_08_AWADDR
  .AXI_08_AWBURST(hbm_axi_awburst[8]),            // input wire [1 : 0] AXI_08_AWBURST
  .AXI_08_AWID(hbm_axi_awid[8]),                  // input wire [5 : 0] AXI_08_AWID
  .AXI_08_AWLEN(hbm_axi_awlen[8]),                // input wire [3 : 0] AXI_08_AWLEN
  .AXI_08_AWSIZE(hbm_axi_awsize[8]),              // input wire [2 : 0] AXI_08_AWSIZE
  .AXI_08_AWVALID(hbm_axi_awvalid[8]),            // input wire AXI_08_AWVALID
  .AXI_08_AWREADY(hbm_axi_awready[8]),            // output wire AXI_08_AWREADY
  .AXI_08_WDATA(hbm_axi_wdata[8]),                // input wire [255 : 0] AXI_08_WDATA
  .AXI_08_WLAST(hbm_axi_wlast[8]),                // input wire AXI_08_WLAST
  .AXI_08_WSTRB(hbm_axi_wstrb[8]),                // input wire [31 : 0] AXI_08_WSTRB
  .AXI_08_WVALID(hbm_axi_wvalid[8]),              // input wire AXI_08_WVALID
  .AXI_08_WREADY(hbm_axi_wready[8]),              // output wire AXI_08_WREADY
  .AXI_08_WDATA_PARITY(0),  // input wire [31 : 0] AXI_08_WDATA_PARITY
  .AXI_08_BID(hbm_axi_bid[8]),                    // output wire [5 : 0] AXI_08_BID
  .AXI_08_BRESP(hbm_axi_bresp[8]),                // output wire [1 : 0] AXI_08_BRESP
  .AXI_08_BVALID(hbm_axi_bvalid[8]),              // output wire AXI_08_BVALID
  .AXI_08_BREADY(hbm_axi_bready[8]),              // input wire AXI_08_BREADY

  .AXI_09_ACLK(hbm_axi_clk[9]),                  // input wire AXI_09_ACLK
  .AXI_09_ARESET_N(hbm_axi_arstn[9]),          // input wire AXI_09_ARESET_N
  .AXI_09_ARADDR(hbm_axi_araddr[9]),              // input wire [32 : 0] AXI_09_ARADDR
  .AXI_09_ARBURST(hbm_axi_arburst[9]),            // input wire [1 : 0] AXI_09_ARBURST
  .AXI_09_ARID(hbm_axi_arid[9]),                  // input wire [5 : 0] AXI_09_ARID
  .AXI_09_ARLEN(hbm_axi_arlen[9]),                // input wire [3 : 0] AXI_09_ARLEN
  .AXI_09_ARSIZE(hbm_axi_arsize[9]),              // input wire [2 : 0] AXI_09_ARSIZE
  .AXI_09_ARVALID(hbm_axi_arvalid[9]),            // input wire AXI_09_ARVALID
  .AXI_09_ARREADY(hbm_axi_arready[9]),            // output wire AXI_09_ARREADY
  .AXI_09_RDATA(hbm_axi_rdata[9]),                // output wire [255 : 0] AXI_09_RDATA
  .AXI_09_RID(hbm_axi_rid[9]),                    // output wire [5 : 0] AXI_09_RID
  .AXI_09_RLAST(hbm_axi_rlast[9]),                // output wire AXI_09_RLAST
  .AXI_09_RRESP(hbm_axi_rresp[9]),                // output wire [1 : 0] AXI_09_RRESP
  .AXI_09_RVALID(hbm_axi_rvalid[9]),              // output wire AXI_09_RVALID
  .AXI_09_RREADY(hbm_axi_rready[9]),              // input wire AXI_09_RREADY
  .AXI_09_RDATA_PARITY(),  // output wire [31 : 0] AXI_09_RDATA_PARITY
  .AXI_09_AWADDR(hbm_axi_awaddr[9]),              // input wire [32 : 0] AXI_09_AWADDR
  .AXI_09_AWBURST(hbm_axi_awburst[9]),            // input wire [1 : 0] AXI_09_AWBURST
  .AXI_09_AWID(hbm_axi_awid[9]),                  // input wire [5 : 0] AXI_09_AWID
  .AXI_09_AWLEN(hbm_axi_awlen[9]),                // input wire [3 : 0] AXI_09_AWLEN
  .AXI_09_AWSIZE(hbm_axi_awsize[9]),              // input wire [2 : 0] AXI_09_AWSIZE
  .AXI_09_AWVALID(hbm_axi_awvalid[9]),            // input wire AXI_09_AWVALID
  .AXI_09_AWREADY(hbm_axi_awready[9]),            // output wire AXI_09_AWREADY
  .AXI_09_WDATA(hbm_axi_wdata[9]),                // input wire [255 : 0] AXI_09_WDATA
  .AXI_09_WLAST(hbm_axi_wlast[9]),                // input wire AXI_09_WLAST
  .AXI_09_WSTRB(hbm_axi_wstrb[9]),                // input wire [31 : 0] AXI_09_WSTRB
  .AXI_09_WVALID(hbm_axi_wvalid[9]),              // input wire AXI_09_WVALID
  .AXI_09_WREADY(hbm_axi_wready[9]),              // output wire AXI_09_WREADY
  .AXI_09_WDATA_PARITY(0),  // input wire [31 : 0] AXI_09_WDATA_PARITY
  .AXI_09_BID(hbm_axi_bid[9]),                    // output wire [5 : 0] AXI_09_BID
  .AXI_09_BRESP(hbm_axi_bresp[9]),                // output wire [1 : 0] AXI_09_BRESP
  .AXI_09_BVALID(hbm_axi_bvalid[9]),              // output wire AXI_09_BVALID
  .AXI_09_BREADY(hbm_axi_bready[9]),              // input wire AXI_09_BREADY

  .AXI_10_ACLK(hbm_axi_clk[10]),                  // input wire AXI_10_ACLK
  .AXI_10_ARESET_N(hbm_axi_arstn[10]),          // input wire AXI_10_ARESET_N
  .AXI_10_ARADDR(hbm_axi_araddr[10]),              // input wire [32 : 0] AXI_10_ARADDR
  .AXI_10_ARBURST(hbm_axi_arburst[10]),            // input wire [1 : 0] AXI_10_ARBURST
  .AXI_10_ARID(hbm_axi_arid[10]),                  // input wire [5 : 0] AXI_10_ARID
  .AXI_10_ARLEN(hbm_axi_arlen[10]),                // input wire [3 : 0] AXI_10_ARLEN
  .AXI_10_ARSIZE(hbm_axi_arsize[10]),              // input wire [2 : 0] AXI_10_ARSIZE
  .AXI_10_ARVALID(hbm_axi_arvalid[10]),            // input wire AXI_10_ARVALID
  .AXI_10_ARREADY(hbm_axi_arready[10]),            // output wire AXI_10_ARREADY
  .AXI_10_RDATA(hbm_axi_rdata[10]),                // output wire [255 : 0] AXI_10_RDATA
  .AXI_10_RID(hbm_axi_rid[10]),                    // output wire [5 : 0] AXI_10_RID
  .AXI_10_RLAST(hbm_axi_rlast[10]),                // output wire AXI_10_RLAST
  .AXI_10_RRESP(hbm_axi_rresp[10]),                // output wire [1 : 0] AXI_10_RRESP
  .AXI_10_RVALID(hbm_axi_rvalid[10]),              // output wire AXI_10_RVALID
  .AXI_10_RREADY(hbm_axi_rready[10]),              // input wire AXI_10_RREADY
  .AXI_10_RDATA_PARITY(),  // output wire [31 : 0] AXI_10_RDATA_PARITY
  .AXI_10_AWADDR(hbm_axi_awaddr[10]),              // input wire [32 : 0] AXI_10_AWADDR
  .AXI_10_AWBURST(hbm_axi_awburst[10]),            // input wire [1 : 0] AXI_10_AWBURST
  .AXI_10_AWID(hbm_axi_awid[10]),                  // input wire [5 : 0] AXI_10_AWID
  .AXI_10_AWLEN(hbm_axi_awlen[10]),                // input wire [3 : 0] AXI_10_AWLEN
  .AXI_10_AWSIZE(hbm_axi_awsize[10]),              // input wire [2 : 0] AXI_10_AWSIZE
  .AXI_10_AWVALID(hbm_axi_awvalid[10]),            // input wire AXI_10_AWVALID
  .AXI_10_AWREADY(hbm_axi_awready[10]),            // output wire AXI_10_AWREADY
  .AXI_10_WDATA(hbm_axi_wdata[10]),                // input wire [255 : 0] AXI_10_WDATA
  .AXI_10_WLAST(hbm_axi_wlast[10]),                // input wire AXI_10_WLAST
  .AXI_10_WSTRB(hbm_axi_wstrb[10]),                // input wire [31 : 0] AXI_10_WSTRB
  .AXI_10_WVALID(hbm_axi_wvalid[10]),              // input wire AXI_10_WVALID
  .AXI_10_WREADY(hbm_axi_wready[10]),              // output wire AXI_10_WREADY
  .AXI_10_WDATA_PARITY(0),  // input wire [31 : 0] AXI_10_WDATA_PARITY
  .AXI_10_BID(hbm_axi_bid[10]),                    // output wire [5 : 0] AXI_10_BID
  .AXI_10_BRESP(hbm_axi_bresp[10]),                // output wire [1 : 0] AXI_10_BRESP
  .AXI_10_BVALID(hbm_axi_bvalid[10]),              // output wire AXI_10_BVALID
  .AXI_10_BREADY(hbm_axi_bready[10]),              // input wire AXI_10_BREADY

  .AXI_11_ACLK(hbm_axi_clk[11]),                  // input wire AXI_11_ACLK
  .AXI_11_ARESET_N(hbm_axi_arstn[11]),          // input wire AXI_11_ARESET_N
  .AXI_11_ARADDR(hbm_axi_araddr[11]),              // input wire [32 : 0] AXI_11_ARADDR
  .AXI_11_ARBURST(hbm_axi_arburst[11]),            // input wire [1 : 0] AXI_11_ARBURST
  .AXI_11_ARID(hbm_axi_arid[11]),                  // input wire [5 : 0] AXI_11_ARID
  .AXI_11_ARLEN(hbm_axi_arlen[11]),                // input wire [3 : 0] AXI_11_ARLEN
  .AXI_11_ARSIZE(hbm_axi_arsize[11]),              // input wire [2 : 0] AXI_11_ARSIZE
  .AXI_11_ARVALID(hbm_axi_arvalid[11]),            // input wire AXI_11_ARVALID
  .AXI_11_ARREADY(hbm_axi_arready[11]),            // output wire AXI_11_ARREADY
  .AXI_11_RDATA(hbm_axi_rdata[11]),                // output wire [255 : 0] AXI_11_RDATA
  .AXI_11_RID(hbm_axi_rid[11]),                    // output wire [5 : 0] AXI_11_RID
  .AXI_11_RLAST(hbm_axi_rlast[11]),                // output wire AXI_11_RLAST
  .AXI_11_RRESP(hbm_axi_rresp[11]),                // output wire [1 : 0] AXI_11_RRESP
  .AXI_11_RVALID(hbm_axi_rvalid[11]),              // output wire AXI_11_RVALID
  .AXI_11_RREADY(hbm_axi_rready[11]),              // input wire AXI_11_RREADY
  .AXI_11_RDATA_PARITY(),  // output wire [31 : 0] AXI_11_RDATA_PARITY
  .AXI_11_AWADDR(hbm_axi_awaddr[11]),              // input wire [32 : 0] AXI_11_AWADDR
  .AXI_11_AWBURST(hbm_axi_awburst[11]),            // input wire [1 : 0] AXI_11_AWBURST
  .AXI_11_AWID(hbm_axi_awid[11]),                  // input wire [5 : 0] AXI_11_AWID
  .AXI_11_AWLEN(hbm_axi_awlen[11]),                // input wire [3 : 0] AXI_11_AWLEN
  .AXI_11_AWSIZE(hbm_axi_awsize[11]),              // input wire [2 : 0] AXI_11_AWSIZE
  .AXI_11_AWVALID(hbm_axi_awvalid[11]),            // input wire AXI_11_AWVALID
  .AXI_11_AWREADY(hbm_axi_awready[11]),            // output wire AXI_11_AWREADY
  .AXI_11_WDATA(hbm_axi_wdata[11]),                // input wire [255 : 0] AXI_11_WDATA
  .AXI_11_WLAST(hbm_axi_wlast[11]),                // input wire AXI_11_WLAST
  .AXI_11_WSTRB(hbm_axi_wstrb[11]),                // input wire [31 : 0] AXI_11_WSTRB
  .AXI_11_WVALID(hbm_axi_wvalid[11]),              // input wire AXI_11_WVALID
  .AXI_11_WREADY(hbm_axi_wready[11]),              // output wire AXI_11_WREADY
  .AXI_11_WDATA_PARITY(0),  // input wire [31 : 0] AXI_11_WDATA_PARITY
  .AXI_11_BID(hbm_axi_bid[11]),                    // output wire [5 : 0] AXI_11_BID
  .AXI_11_BRESP(hbm_axi_bresp[11]),                // output wire [1 : 0] AXI_11_BRESP
  .AXI_11_BVALID(hbm_axi_bvalid[11]),              // output wire AXI_11_BVALID
  .AXI_11_BREADY(hbm_axi_bready[11]),              // input wire AXI_11_BREADY

  .AXI_12_ACLK(hbm_axi_clk[12]),                  // input wire AXI_12_ACLK
  .AXI_12_ARESET_N(hbm_axi_arstn[12]),          // input wire AXI_12_ARESET_N
  .AXI_12_ARADDR(hbm_axi_araddr[12]),              // input wire [32 : 0] AXI_12_ARADDR
  .AXI_12_ARBURST(hbm_axi_arburst[12]),            // input wire [1 : 0] AXI_12_ARBURST
  .AXI_12_ARID(hbm_axi_arid[12]),                  // input wire [5 : 0] AXI_12_ARID
  .AXI_12_ARLEN(hbm_axi_arlen[12]),                // input wire [3 : 0] AXI_12_ARLEN
  .AXI_12_ARSIZE(hbm_axi_arsize[12]),              // input wire [2 : 0] AXI_12_ARSIZE
  .AXI_12_ARVALID(hbm_axi_arvalid[12]),            // input wire AXI_12_ARVALID
  .AXI_12_ARREADY(hbm_axi_arready[12]),            // output wire AXI_12_ARREADY
  .AXI_12_RDATA(hbm_axi_rdata[12]),                // output wire [255 : 0] AXI_12_RDATA
  .AXI_12_RID(hbm_axi_rid[12]),                    // output wire [5 : 0] AXI_12_RID
  .AXI_12_RLAST(hbm_axi_rlast[12]),                // output wire AXI_12_RLAST
  .AXI_12_RRESP(hbm_axi_rresp[12]),                // output wire [1 : 0] AXI_12_RRESP
  .AXI_12_RVALID(hbm_axi_rvalid[12]),              // output wire AXI_12_RVALID
  .AXI_12_RREADY(hbm_axi_rready[12]),              // input wire AXI_12_RREADY
  .AXI_12_RDATA_PARITY(),  // output wire [31 : 0] AXI_12_RDATA_PARITY
  .AXI_12_AWADDR(hbm_axi_awaddr[12]),              // input wire [32 : 0] AXI_12_AWADDR
  .AXI_12_AWBURST(hbm_axi_awburst[12]),            // input wire [1 : 0] AXI_12_AWBURST
  .AXI_12_AWID(hbm_axi_awid[12]),                  // input wire [5 : 0] AXI_12_AWID
  .AXI_12_AWLEN(hbm_axi_awlen[12]),                // input wire [3 : 0] AXI_12_AWLEN
  .AXI_12_AWSIZE(hbm_axi_awsize[12]),              // input wire [2 : 0] AXI_12_AWSIZE
  .AXI_12_AWVALID(hbm_axi_awvalid[12]),            // input wire AXI_12_AWVALID
  .AXI_12_AWREADY(hbm_axi_awready[12]),            // output wire AXI_12_AWREADY
  .AXI_12_WDATA(hbm_axi_wdata[12]),                // input wire [255 : 0] AXI_12_WDATA
  .AXI_12_WLAST(hbm_axi_wlast[12]),                // input wire AXI_12_WLAST
  .AXI_12_WSTRB(hbm_axi_wstrb[12]),                // input wire [31 : 0] AXI_12_WSTRB
  .AXI_12_WVALID(hbm_axi_wvalid[12]),              // input wire AXI_12_WVALID
  .AXI_12_WREADY(hbm_axi_wready[12]),              // output wire AXI_12_WREADY
  .AXI_12_WDATA_PARITY(0),  // input wire [31 : 0] AXI_12_WDATA_PARITY
  .AXI_12_BID(hbm_axi_bid[12]),                    // output wire [5 : 0] AXI_12_BID
  .AXI_12_BRESP(hbm_axi_bresp[12]),                // output wire [1 : 0] AXI_12_BRESP
  .AXI_12_BVALID(hbm_axi_bvalid[12]),              // output wire AXI_12_BVALID
  .AXI_12_BREADY(hbm_axi_bready[12]),              // input wire AXI_12_BREADY

  .AXI_13_ACLK(hbm_axi_clk[13]),                  // input wire AXI_13_ACLK
  .AXI_13_ARESET_N(hbm_axi_arstn[13]),          // input wire AXI_13_ARESET_N
  .AXI_13_ARADDR(hbm_axi_araddr[13]),              // input wire [32 : 0] AXI_13_ARADDR
  .AXI_13_ARBURST(hbm_axi_arburst[13]),            // input wire [1 : 0] AXI_13_ARBURST
  .AXI_13_ARID(hbm_axi_arid[13]),                  // input wire [5 : 0] AXI_13_ARID
  .AXI_13_ARLEN(hbm_axi_arlen[13]),                // input wire [3 : 0] AXI_13_ARLEN
  .AXI_13_ARSIZE(hbm_axi_arsize[13]),              // input wire [2 : 0] AXI_13_ARSIZE
  .AXI_13_ARVALID(hbm_axi_arvalid[13]),            // input wire AXI_13_ARVALID
  .AXI_13_ARREADY(hbm_axi_arready[13]),            // output wire AXI_13_ARREADY
  .AXI_13_RDATA(hbm_axi_rdata[13]),                // output wire [255 : 0] AXI_13_RDATA
  .AXI_13_RID(hbm_axi_rid[13]),                    // output wire [5 : 0] AXI_13_RID
  .AXI_13_RLAST(hbm_axi_rlast[13]),                // output wire AXI_13_RLAST
  .AXI_13_RRESP(hbm_axi_rresp[13]),                // output wire [1 : 0] AXI_13_RRESP
  .AXI_13_RVALID(hbm_axi_rvalid[13]),              // output wire AXI_13_RVALID
  .AXI_13_RREADY(hbm_axi_rready[13]),              // input wire AXI_13_RREADY
  .AXI_13_RDATA_PARITY(),  // output wire [31 : 0] AXI_13_RDATA_PARITY
  .AXI_13_AWADDR(hbm_axi_awaddr[13]),              // input wire [32 : 0] AXI_13_AWADDR
  .AXI_13_AWBURST(hbm_axi_awburst[13]),            // input wire [1 : 0] AXI_13_AWBURST
  .AXI_13_AWID(hbm_axi_awid[13]),                  // input wire [5 : 0] AXI_13_AWID
  .AXI_13_AWLEN(hbm_axi_awlen[13]),                // input wire [3 : 0] AXI_13_AWLEN
  .AXI_13_AWSIZE(hbm_axi_awsize[13]),              // input wire [2 : 0] AXI_13_AWSIZE
  .AXI_13_AWVALID(hbm_axi_awvalid[13]),            // input wire AXI_13_AWVALID
  .AXI_13_AWREADY(hbm_axi_awready[13]),            // output wire AXI_13_AWREADY
  .AXI_13_WDATA(hbm_axi_wdata[13]),                // input wire [255 : 0] AXI_13_WDATA
  .AXI_13_WLAST(hbm_axi_wlast[13]),                // input wire AXI_13_WLAST
  .AXI_13_WSTRB(hbm_axi_wstrb[13]),                // input wire [31 : 0] AXI_13_WSTRB
  .AXI_13_WVALID(hbm_axi_wvalid[13]),              // input wire AXI_13_WVALID
  .AXI_13_WREADY(hbm_axi_wready[13]),              // output wire AXI_13_WREADY
  .AXI_13_WDATA_PARITY(0),  // input wire [31 : 0] AXI_13_WDATA_PARITY
  .AXI_13_BID(hbm_axi_bid[13]),                    // output wire [5 : 0] AXI_13_BID
  .AXI_13_BRESP(hbm_axi_bresp[13]),                // output wire [1 : 0] AXI_13_BRESP
  .AXI_13_BVALID(hbm_axi_bvalid[13]),              // output wire AXI_13_BVALID
  .AXI_13_BREADY(hbm_axi_bready[13]),              // input wire AXI_13_BREADY

  .AXI_14_ACLK(hbm_axi_clk[14]),                  // input wire AXI_14_ACLK
  .AXI_14_ARESET_N(hbm_axi_arstn[14]),          // input wire AXI_14_ARESET_N
  .AXI_14_ARADDR(hbm_axi_araddr[14]),              // input wire [32 : 0] AXI_14_ARADDR
  .AXI_14_ARBURST(hbm_axi_arburst[14]),            // input wire [1 : 0] AXI_14_ARBURST
  .AXI_14_ARID(hbm_axi_arid[14]),                  // input wire [5 : 0] AXI_14_ARID
  .AXI_14_ARLEN(hbm_axi_arlen[14]),                // input wire [3 : 0] AXI_14_ARLEN
  .AXI_14_ARSIZE(hbm_axi_arsize[14]),              // input wire [2 : 0] AXI_14_ARSIZE
  .AXI_14_ARVALID(hbm_axi_arvalid[14]),            // input wire AXI_14_ARVALID
  .AXI_14_ARREADY(hbm_axi_arready[14]),            // output wire AXI_14_ARREADY
  .AXI_14_RDATA(hbm_axi_rdata[14]),                // output wire [255 : 0] AXI_14_RDATA
  .AXI_14_RID(hbm_axi_rid[14]),                    // output wire [5 : 0] AXI_14_RID
  .AXI_14_RLAST(hbm_axi_rlast[14]),                // output wire AXI_14_RLAST
  .AXI_14_RRESP(hbm_axi_rresp[14]),                // output wire [1 : 0] AXI_14_RRESP
  .AXI_14_RVALID(hbm_axi_rvalid[14]),              // output wire AXI_14_RVALID
  .AXI_14_RREADY(hbm_axi_rready[14]),              // input wire AXI_14_RREADY
  .AXI_14_RDATA_PARITY(),  // output wire [31 : 0] AXI_14_RDATA_PARITY
  .AXI_14_AWADDR(hbm_axi_awaddr[14]),              // input wire [32 : 0] AXI_14_AWADDR
  .AXI_14_AWBURST(hbm_axi_awburst[14]),            // input wire [1 : 0] AXI_14_AWBURST
  .AXI_14_AWID(hbm_axi_awid[14]),                  // input wire [5 : 0] AXI_14_AWID
  .AXI_14_AWLEN(hbm_axi_awlen[14]),                // input wire [3 : 0] AXI_14_AWLEN
  .AXI_14_AWSIZE(hbm_axi_awsize[14]),              // input wire [2 : 0] AXI_14_AWSIZE
  .AXI_14_AWVALID(hbm_axi_awvalid[14]),            // input wire AXI_14_AWVALID
  .AXI_14_AWREADY(hbm_axi_awready[14]),            // output wire AXI_14_AWREADY
  .AXI_14_WDATA(hbm_axi_wdata[14]),                // input wire [255 : 0] AXI_14_WDATA
  .AXI_14_WLAST(hbm_axi_wlast[14]),                // input wire AXI_14_WLAST
  .AXI_14_WSTRB(hbm_axi_wstrb[14]),                // input wire [31 : 0] AXI_14_WSTRB
  .AXI_14_WVALID(hbm_axi_wvalid[14]),              // input wire AXI_14_WVALID
  .AXI_14_WREADY(hbm_axi_wready[14]),              // output wire AXI_14_WREADY
  .AXI_14_WDATA_PARITY(0),  // input wire [31 : 0] AXI_14_WDATA_PARITY
  .AXI_14_BID(hbm_axi_bid[14]),                    // output wire [5 : 0] AXI_14_BID
  .AXI_14_BRESP(hbm_axi_bresp[14]),                // output wire [1 : 0] AXI_14_BRESP
  .AXI_14_BVALID(hbm_axi_bvalid[14]),              // output wire AXI_14_BVALID
  .AXI_14_BREADY(hbm_axi_bready[14]),              // input wire AXI_14_BREADY

  .AXI_15_ACLK(hbm_axi_clk[15]),                  // input wire AXI_15_ACLK
  .AXI_15_ARESET_N(hbm_axi_arstn[15]),          // input wire AXI_15_ARESET_N
  .AXI_15_ARADDR(hbm_axi_araddr[15]),              // input wire [32 : 0] AXI_15_ARADDR
  .AXI_15_ARBURST(hbm_axi_arburst[15]),            // input wire [1 : 0] AXI_15_ARBURST
  .AXI_15_ARID(hbm_axi_arid[15]),                  // input wire [5 : 0] AXI_15_ARID
  .AXI_15_ARLEN(hbm_axi_arlen[15]),                // input wire [3 : 0] AXI_15_ARLEN
  .AXI_15_ARSIZE(hbm_axi_arsize[15]),              // input wire [2 : 0] AXI_15_ARSIZE
  .AXI_15_ARVALID(hbm_axi_arvalid[15]),            // input wire AXI_15_ARVALID
  .AXI_15_ARREADY(hbm_axi_arready[15]),            // output wire AXI_15_ARREADY
  .AXI_15_RDATA(hbm_axi_rdata[15]),                // output wire [255 : 0] AXI_15_RDATA
  .AXI_15_RID(hbm_axi_rid[15]),                    // output wire [5 : 0] AXI_15_RID
  .AXI_15_RLAST(hbm_axi_rlast[15]),                // output wire AXI_15_RLAST
  .AXI_15_RRESP(hbm_axi_rresp[15]),                // output wire [1 : 0] AXI_15_RRESP
  .AXI_15_RVALID(hbm_axi_rvalid[15]),              // output wire AXI_15_RVALID
  .AXI_15_RREADY(hbm_axi_rready[15]),              // input wire AXI_15_RREADY
  .AXI_15_RDATA_PARITY(),  // output wire [31 : 0] AXI_15_RDATA_PARITY
  .AXI_15_AWADDR(hbm_axi_awaddr[15]),              // input wire [32 : 0] AXI_15_AWADDR
  .AXI_15_AWBURST(hbm_axi_awburst[15]),            // input wire [1 : 0] AXI_15_AWBURST
  .AXI_15_AWID(hbm_axi_awid[15]),                  // input wire [5 : 0] AXI_15_AWID
  .AXI_15_AWLEN(hbm_axi_awlen[15]),                // input wire [3 : 0] AXI_15_AWLEN
  .AXI_15_AWSIZE(hbm_axi_awsize[15]),              // input wire [2 : 0] AXI_15_AWSIZE
  .AXI_15_AWVALID(hbm_axi_awvalid[15]),            // input wire AXI_15_AWVALID
  .AXI_15_AWREADY(hbm_axi_awready[15]),            // output wire AXI_15_AWREADY
  .AXI_15_WDATA(hbm_axi_wdata[15]),                // input wire [255 : 0] AXI_15_WDATA
  .AXI_15_WLAST(hbm_axi_wlast[15]),                // input wire AXI_15_WLAST
  .AXI_15_WSTRB(hbm_axi_wstrb[15]),                // input wire [31 : 0] AXI_15_WSTRB
  .AXI_15_WVALID(hbm_axi_wvalid[15]),              // input wire AXI_15_WVALID
  .AXI_15_WREADY(hbm_axi_wready[15]),              // output wire AXI_15_WREADY
  .AXI_15_WDATA_PARITY(0),  // input wire [31 : 0] AXI_15_WDATA_PARITY
  .AXI_15_BID(hbm_axi_bid[15]),                    // output wire [5 : 0] AXI_15_BID
  .AXI_15_BRESP(hbm_axi_bresp[15]),                // output wire [1 : 0] AXI_15_BRESP
  .AXI_15_BVALID(hbm_axi_bvalid[15]),              // output wire AXI_15_BVALID
  .AXI_15_BREADY(hbm_axi_bready[15]),              // input wire AXI_15_BREADY

  .APB_0_PWDATA(0),                // input wire [31 : 0] APB_0_PWDATA
  .APB_0_PADDR(0),                  // input wire [21 : 0] APB_0_PADDR
  .APB_0_PCLK(APB_0_PCLK),                    // input wire APB_0_PCLK
  .APB_0_PENABLE(0),              // input wire APB_0_PENABLE
  .APB_0_PRESET_N(APB_0_PRESET_N),            // input wire APB_0_PRESET_N
  .APB_0_PSEL(0),                    // input wire APB_0_PSEL
  .APB_0_PWRITE(0),                // input wire APB_0_PWRITE
  .APB_0_PRDATA(),                // output wire [31 : 0] APB_0_PRDATA
  .APB_0_PREADY(),                // output wire APB_0_PREADY
  .APB_0_PSLVERR(),              // output wire APB_0_PSLVERR
  .apb_complete_0(),            // output wire apb_complete_0
  .DRAM_0_STAT_CATTRIP(),  // output wire DRAM_0_STAT_CATTRIP
  .DRAM_0_STAT_TEMP()        // output wire [6 : 0] DRAM_0_STAT_TEMP
);

// =========================================================================== //
// Read Engine of Buffers
// =========================================================================== //

//////////////////Read for Input Buffer/////////////////
wire[DATA_WIDTH-1:0] input_dats[INPUT_AXI_CHNL-1:0];
wire                 input_vlds[INPUT_AXI_CHNL-1:0];

generate

for(i=0 ; i< INPUT_AXI_CHNL ; i=i+1)
begin : GENERATE_READ_INPUT_WIRING
    assign dn_input_dat[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)] = input_dats[i];
    assign dn_input_vld[i] = input_vlds[i];
end

for(i=0 ; i< INPUT_AXI_CHNL ; i=i+1)
begin : GENERATE_READ_INPUT_BUFFER
    hbm_auto_read # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_auto_read_input
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_read(start_read_input),
      .read_ops(input_read_ops),
      .stride(input_read_stride),
      .init_addr(input_read_init_addr),
      .mem_burst_size(input_read_mem_burst_size),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_ARVALID(hbm_axi_arvalid[i]) , //rd address valid
      .m_axi_ARADDR(hbm_axi_araddr[i])  , //rd byte address
      .m_axi_ARID(hbm_axi_arid[i])    , //rd address id
      .m_axi_ARLEN(hbm_axi_arlen[i])   , //rd burst=awlen+1,
      .m_axi_ARSIZE(hbm_axi_arsize[i])  , //rd 3'b101, 32B
      .m_axi_ARBURST(hbm_axi_arburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_ARREADY(hbm_axi_arready[i]) , //rd ready to accept address.
      .m_axi_ARLOCK()  , //rd no
      .m_axi_ARCACHE() , //rd no
      .m_axi_ARPROT()  , //rd no
      .m_axi_ARQOS()   , //rd no
      .m_axi_ARREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_RVALID(hbm_axi_rvalid[i]), //rd data valid
      .m_axi_RDATA(hbm_axi_rdata[i]) , //rd data 
      .m_axi_RLAST(hbm_axi_rlast[i]) , //rd data last
      .m_axi_RID(hbm_axi_rid[i])   , //rd data id
      .m_axi_RRESP(hbm_axi_rresp[i]) , //rd data status. 
      .m_axi_RREADY(hbm_axi_rready[i]),

      /////////////////////////  Dn Data  ///////////////////////
      .dn_vld(input_vlds[i]), 
      .dn_dat(input_dats[i]) 
    );
end
endgenerate


//////////////////Read for Weight Buffer/////////////////
wire[DATA_WIDTH-1:0] weight_dats[WEIGHT_AXI_CHNL-1:0];
wire                 weight_vlds[WEIGHT_AXI_CHNL-1:0];

assign dn_weight_vld = weight_vlds[0];

generate

for(i=0 ; i< WEIGHT_AXI_CHNL ; i=i+1)
begin : GENERATE_READ_WEIGHT_WIRING
    assign dn_weight_dat[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)] = weight_dats[i];
end

for(i=INPUT_AXI_CHNL ; i< INPUT_AXI_CHNL+WEIGHT_AXI_CHNL ; i=i+1)
begin : GENERATE_READ_WEIGHT_BUFFER
    hbm_auto_read # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_auto_read_weight
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_read(start_read_weight),
      .read_ops(weight_read_ops),
      .stride(weight_read_stride),
      .init_addr(weight_read_init_addr),
      .mem_burst_size(weight_read_mem_burst_size),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_ARVALID(hbm_axi_arvalid[i]) , //rd address valid
      .m_axi_ARADDR(hbm_axi_araddr[i])  , //rd byte address
      .m_axi_ARID(hbm_axi_arid[i])    , //rd address id
      .m_axi_ARLEN(hbm_axi_arlen[i])   , //rd burst=awlen+1,
      .m_axi_ARSIZE(hbm_axi_arsize[i])  , //rd 3'b101, 32B
      .m_axi_ARBURST(hbm_axi_arburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_ARREADY(hbm_axi_arready[i]) , //rd ready to accept address.
      .m_axi_ARLOCK()  , //rd no
      .m_axi_ARCACHE() , //rd no
      .m_axi_ARPROT()  , //rd no
      .m_axi_ARQOS()   , //rd no
      .m_axi_ARREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_RVALID(hbm_axi_rvalid[i]), //rd data valid
      .m_axi_RDATA(hbm_axi_rdata[i]) , //rd data 
      .m_axi_RLAST(hbm_axi_rlast[i]) , //rd data last
      .m_axi_RID(hbm_axi_rid[i])   , //rd data id
      .m_axi_RRESP(hbm_axi_rresp[i]) , //rd data status. 
      .m_axi_RREADY(hbm_axi_rready[i]),

      /////////////////////////  Dn Data  ///////////////////////
      .dn_vld(weight_vlds[i-INPUT_AXI_CHNL]), 
      .dn_dat(weight_dats[i-INPUT_AXI_CHNL]) 
    );
end
endgenerate


//////////////////Read for Output Buffer/////////////////

generate
for(i=INPUT_AXI_CHNL+WEIGHT_AXI_CHNL ; i< AXI_CHANNELS ; i=i+1)
begin : GENERATE_READ_OUTPUT_BUFFER
    hbm_dummy_read # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_dummy_read_output
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_read(1'b0),
      .read_ops({32{1'b0}}),
      .stride({32{1'b0}}),
      .init_addr({ADDR_WIDTH{1'b0}}),
      .mem_burst_size({16{1'b0}}),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_ARVALID(hbm_axi_arvalid[i]) , //rd address valid
      .m_axi_ARADDR(hbm_axi_araddr[i])  , //rd byte address
      .m_axi_ARID(hbm_axi_arid[i])    , //rd address id
      .m_axi_ARLEN(hbm_axi_arlen[i])   , //rd burst=awlen+1,
      .m_axi_ARSIZE(hbm_axi_arsize[i])  , //rd 3'b101, 32B
      .m_axi_ARBURST(hbm_axi_arburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_ARREADY(hbm_axi_arready[i]) , //rd ready to accept address.
      .m_axi_ARLOCK()  , //rd no
      .m_axi_ARCACHE() , //rd no
      .m_axi_ARPROT()  , //rd no
      .m_axi_ARQOS()   , //rd no
      .m_axi_ARREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_RVALID(hbm_axi_rvalid[i]), //rd data valid
      .m_axi_RDATA(hbm_axi_rdata[i]) , //rd data 
      .m_axi_RLAST(hbm_axi_rlast[i]) , //rd data last
      .m_axi_RID(hbm_axi_rid[i])   , //rd data id
      .m_axi_RRESP(hbm_axi_rresp[i]) , //rd data status. 
      .m_axi_RREADY(hbm_axi_rready[i]),

      /////////////////////////  Dn Data  ///////////////////////
      .dn_vld(), 
      .dn_dat() 
    );
end
endgenerate

// =========================================================================== //
// Write Engine of Buffers
// =========================================================================== //

//////////////////Write for Input Buffer/////////////////

generate
for(i=0 ; i< INPUT_AXI_CHNL ; i=i+1)
begin : GENERATE_WRITE_INPUT_BUFFER
    hbm_dummy_write # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_dummy_write_input
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_write(start_write_input),
      .write_ops(input_write_ops),
      .stride(input_write_stride),
      .init_addr(input_write_init_addr),
      .mem_burst_size(input_write_mem_burst_size),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_AWVALID(hbm_axi_awvalid[i]) , //rd address valid
      .m_axi_AWADDR(hbm_axi_awaddr[i])  , //rd byte address
      .m_axi_AWID(hbm_axi_awid[i])    , //rd address id
      .m_axi_AWLEN(hbm_axi_awlen[i])   , //rd burst=awlen+1,
      .m_axi_AWSIZE(hbm_axi_awsize[i])  , //rd 3'b101, 32B
      .m_axi_AWBURST(hbm_axi_awburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_AWREADY(hbm_axi_awready[i]) , //rd ready to accept address.
      .m_axi_AWLOCK()  , //rd no
      .m_axi_AWCACHE() , //rd no
      .m_axi_AWPROT()  , //rd no
      .m_axi_AWQOS()   , //rd no
      .m_axi_AWREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_WVALID(hbm_axi_wvalid[i]), //rd data valid
      .m_axi_WDATA(hbm_axi_wdata[i]) , //rd data 
      .m_axi_WSTRB(hbm_axi_wstrb[i]) , //rd data status.
      .m_axi_WLAST(hbm_axi_wlast[i]) , //rd data last
      .m_axi_WID()   , //rd data id
      .m_axi_WREADY(hbm_axi_wready[i]),

      .m_axi_BVALID(),
      .m_axi_BRESP(),
      .m_axi_BID(),
      .m_axi_BREADY()
    );
end
endgenerate

//////////////////Write for Weight Buffer/////////////////
wire[DATA_WIDTH-1:0] up_output_dats[OUTPUT_AXI_CHNL - 1:0];
reg [DATA_WIDTH-1:0] up_output_dats_r[OUTPUT_AXI_CHNL - 1:0];

wire                   start_write_hybrid;
wire  [32-1:0]         hybrid_write_ops;
wire  [32-1:0]         hybrid_write_stride;
wire  [ADDR_WIDTH-1:0] hybrid_write_init_addr;
wire  [16-1:0]         hybrid_write_mem_burst_size;
reg   [OUTPUT_AXI_CHNL-1:0]                start_write_output_r;
always @(posedge sys_clk)
begin
    start_write_output_r <= start_write_output;
end


assign start_write_hybrid = auto_write_weight? start_write_weight : start_write_output_r[0];
assign hybrid_write_ops = auto_write_weight? weight_write_ops : output_write_ops;
assign hybrid_write_stride = auto_write_weight? weight_write_stride : output_write_stride;
assign hybrid_write_init_addr = auto_write_weight? weight_write_init_addr : output_write_init_addr;
assign hybrid_write_mem_burst_size = auto_write_weight? weight_write_mem_burst_size : output_write_mem_burst_size;

generate
for(i=0 ; i< OUTPUT_AXI_CHNL ; i=i+1)
begin : GENERATE_OUTPUT_WIRING
    assign up_output_dats[i] = up_output_dat[(DATA_WIDTH*i + DATA_WIDTH-1) : (DATA_WIDTH*i)];
end
endgenerate

generate
for(i=0 ; i< OUTPUT_AXI_CHNL ; i=i+1)
begin : GENERATE_OUTPUT_TIMING
    always @(posedge sys_clk)
    begin
        up_output_dats_r[i] <= up_output_dats[i];
    end
end
endgenerate


generate
for(i=INPUT_AXI_CHNL ; i< INPUT_AXI_CHNL+WEIGHT_AXI_CHNL ; i=i+1)
begin : GENERATE_WRITE_WEIGHT_BUFFER
    hbm_custom_write # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_custom_write_weight
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_write(start_write_hybrid),
      .write_ops(hybrid_write_ops),
      .stride(hybrid_write_stride),
      .init_addr(hybrid_write_init_addr),
      .mem_burst_size(hybrid_write_mem_burst_size),
      .up_dat(up_output_dats_r[i-INPUT_AXI_CHNL]),
      .is_auto_write(auto_write_weight),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_AWVALID(hbm_axi_awvalid[i]) , //rd address valid
      .m_axi_AWADDR(hbm_axi_awaddr[i])  , //rd byte address
      .m_axi_AWID(hbm_axi_awid[i])    , //rd address id
      .m_axi_AWLEN(hbm_axi_awlen[i])   , //rd burst=awlen+1,
      .m_axi_AWSIZE(hbm_axi_awsize[i])  , //rd 3'b101, 32B
      .m_axi_AWBURST(hbm_axi_awburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_AWREADY(hbm_axi_awready[i]) , //rd ready to accept address.
      .m_axi_AWLOCK()  , //rd no
      .m_axi_AWCACHE() , //rd no
      .m_axi_AWPROT()  , //rd no
      .m_axi_AWQOS()   , //rd no
      .m_axi_AWREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_WVALID(hbm_axi_wvalid[i]), //rd data valid
      .m_axi_WDATA(hbm_axi_wdata[i]) , //rd data 
      .m_axi_WSTRB(hbm_axi_wstrb[i]) , //rd data status.
      .m_axi_WLAST(hbm_axi_wlast[i]) , //rd data last
      .m_axi_WID()   , //rd data id
      .m_axi_WREADY(hbm_axi_wready[i]),

      .m_axi_BVALID(),
      .m_axi_BRESP(),
      .m_axi_BID(),
      .m_axi_BREADY()
    );
end
endgenerate



//////////////////Write for Output Buffer/////////////////
generate
for(i=INPUT_AXI_CHNL+WEIGHT_AXI_CHNL ; i< AXI_CHANNELS ; i=i+1)
begin : GENERATE_WRITE_OUTPUT_BUFFER
    hbm_custom_write # (
      // The data width of input data
      .ENGINE_ID(i),
      // The data width utilized for accumulated results
      .ID_WIDTH(ID_WIDTH)
    ) u_hbm_custom_write_output
    (
      .clk(sys_clk),
      .rst_n(rst_n),
      .start_write(start_write_output_r[i-INPUT_AXI_CHNL]),
      .write_ops(output_write_ops),
      .stride(output_write_stride),
      .init_addr(output_write_init_addr),
      .mem_burst_size(output_write_mem_burst_size),
      .up_dat(up_output_dats_r[i-INPUT_AXI_CHNL]),
      .is_auto_write(1'b1),

      /////////////////////////Read Address///////////////////////// 
      .m_axi_AWVALID(hbm_axi_awvalid[i]) , //rd address valid
      .m_axi_AWADDR(hbm_axi_awaddr[i])  , //rd byte address
      .m_axi_AWID(hbm_axi_awid[i])    , //rd address id
      .m_axi_AWLEN(hbm_axi_awlen[i])   , //rd burst=awlen+1,
      .m_axi_AWSIZE(hbm_axi_awsize[i])  , //rd 3'b101, 32B
      .m_axi_AWBURST(hbm_axi_awburst[i]) , //rd burst type: 01 (INC), 00 (FIXED)
      .m_axi_AWREADY(hbm_axi_awready[i]) , //rd ready to accept address.
      .m_axi_AWLOCK()  , //rd no
      .m_axi_AWCACHE() , //rd no
      .m_axi_AWPROT()  , //rd no
      .m_axi_AWQOS()   , //rd no
      .m_axi_AWREGION(), //rd no

      /////////////////////////  Read Data  /////////////////////////
      .m_axi_WVALID(hbm_axi_wvalid[i]), //rd data valid
      .m_axi_WDATA(hbm_axi_wdata[i]) , //rd data 
      .m_axi_WSTRB(hbm_axi_wstrb[i]) , //rd data status.
      .m_axi_WLAST(hbm_axi_wlast[i]) , //rd data last
      .m_axi_WID()   , //rd data id
      .m_axi_WREADY(hbm_axi_wready[i]),

      .m_axi_BVALID(),
      .m_axi_BRESP(),
      .m_axi_BID(),
      .m_axi_BREADY()
    );
end
endgenerate



endmodule