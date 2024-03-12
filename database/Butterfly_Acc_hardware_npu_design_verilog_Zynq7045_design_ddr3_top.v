//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Design Name: 
// Module Name: ddr3_top
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


module ddr3_top#
    (
    parameter ENGINE_ID       = 0  ,
    parameter ADDR_WIDTH      = 30 ,
    parameter DATA_WIDTH      = 512 ,  
    parameter ID_WIDTH        = 4 

    )(
    // DDR3     Inouts
    inout [63:0]                         ddr3_dq,
    inout [7:0]                        ddr3_dqs_n,
    inout [7:0]                        ddr3_dqs_p,

    // DDR3     Outputs
    output [14-1:0]                       ddr3_addr,
    output [2:0]                      ddr3_ba,
    output                                       ddr3_ras_n,
    output                                       ddr3_cas_n,
    output                                       ddr3_we_n,
    output                                       ddr3_reset_n,
    output [0:0]                        ddr3_ck_p,
    output [0:0]                        ddr3_ck_n,
    output [0:0]                       ddr3_cke,
    
    output [0:0]           ddr3_cs_n,
    
    output [7:0]                        ddr3_dm,
    
    output [0:0]                       ddr3_odt,
    output                                       init_calib_complete, // Can be internal

    //////////////////control and data for input/////////////
    //read
    input  wire                   start_read,
    input  wire  [32-1:0]         read_ops,
    input  wire  [32-1:0]         read_stride,
    input  wire  [ADDR_WIDTH-1:0] read_init_addr,
    input  wire  [16-1:0]         read_mem_burst_size,

    // output data from the butterfly engine 
    input wire  [DATA_WIDTH-1:0]      up_dat,
    output wire                   dn_vld,
    output wire  [DATA_WIDTH-1:0]  dn_dat,

    //write
    input wire                    start_write,
    input wire   [32-1:0]         write_ops,
    input wire   [32-1:0]         write_stride,
    input wire   [ADDR_WIDTH-1:0] write_init_addr,
    input wire   [16-1:0]         write_mem_burst_size,
    input wire                    is_auto_write,

    ////////////////// clock and reset signals/////////////
    input                                        sys_clk_p,
    input                                        sys_clk_n,
    input                                        sys_rst
    );


//////////////////AXI Wires/////////////////
wire                 axi_clk;
wire                 axi_arstn;

// AR channel
wire[ADDR_WIDTH-1:0] axi_araddr;
wire[1:0]            axi_arburst;
wire[ID_WIDTH-1:0]   axi_arid;
wire[7:0]            axi_arlen;
wire[2:0]            axi_arsize;
wire                 axi_arvalid;
wire                 axi_arready;

wire[1:0]            axi_arlock;
wire[3:0]            axi_arcache;
wire[2:0]            axi_arprot;
wire[3:0]            axi_arqos;

// Read channel
wire[DATA_WIDTH-1:0] axi_rdata;
wire[ID_WIDTH-1:0]   axi_rid;
wire                 axi_rlast;
wire[1:0]            axi_rresp;
wire                 axi_rvalid;
wire                 axi_rready;


// AW channel
wire[ADDR_WIDTH-1:0] axi_awaddr;
wire[1:0]            axi_awburst;
wire[ID_WIDTH-1:0]   axi_awid;
wire[7:0]            axi_awlen;
wire[2:0]            axi_awsize;
wire                 axi_awvalid;
wire                 axi_awready;

wire[1:0]            axi_awlock;
wire[3:0]            axi_awcache;
wire[2:0]            axi_awprot;
wire[3:0]            axi_awqos;

// W channel
wire[DATA_WIDTH-1:0]   axi_wdata;
wire                   axi_wlast;
wire[DATA_WIDTH/8-1:0] axi_wstrb;
wire                   axi_wvalid;
wire                   axi_wready;

// B channel
wire[ID_WIDTH-1:0]   axi_bid;
wire[1:0]            axi_bresp;
wire                 axi_bready;
wire                 axi_bvalid;

wire                 ui_clk;
wire                 ui_clk_sync_rst;
reg                  ui_aresetn;
wire                 ddr3_aresetn;
wire                 mmcm_locked;

wire                app_sr_active;
wire                app_ref_ack;
wire                app_zq_ack;

always @(posedge ui_clk) begin      
    ui_aresetn <= ~ui_clk_sync_rst;       
end  

assign ddr3_aresetn = ui_aresetn;

ddr3_custom_write # (
    // The data width of input data
    .ENGINE_ID(0),
    .DATA_WIDTH(DATA_WIDTH),
    // The data width utilized for accumulated results
    .ID_WIDTH(ID_WIDTH)
) u_ddr3_custom_write
(
    .clk(ui_clk),
    .rst_n(~ui_clk_sync_rst),

    .start_write(start_write),
    .write_ops(write_ops),
    .stride(write_stride),
    .init_addr(write_init_addr),
    .mem_burst_size(write_mem_burst_size),
    .up_dat(up_dat),
    .is_auto_write(is_auto_write),

    ///////////////////////// Write Address///////////////////////// 
    .m_axi_AWVALID(axi_awvalid) , //rd address valid
    .m_axi_AWADDR(axi_awaddr)  , //rd byte address
    .m_axi_AWID(axi_awid)    , //rd address id
    .m_axi_AWLEN(axi_awlen)   , //rd burst=awlen+1,
    .m_axi_AWSIZE(axi_awsize)  , //rd 3'b101, 32B
    .m_axi_AWBURST(axi_awburst) , //rd burst type: 01 (INC), 00 (FIXED)
    .m_axi_AWREADY(axi_awready) , //rd ready to accept address.
    .m_axi_AWLOCK(axi_awlock)  , //rd no
    .m_axi_AWCACHE(axi_awcache) , //rd no
    .m_axi_AWPROT(axi_awprot)  , //rd no
    .m_axi_AWQOS(axi_awqos)   , //rd no
    .m_axi_AWREGION(), //rd no

    ///////////////////////// Write Data  /////////////////////////
    .m_axi_WVALID(axi_wvalid), //rd data valid
    .m_axi_WDATA(axi_wdata) , //rd data 
    .m_axi_WSTRB(axi_wstrb) , //rd data status.
    .m_axi_WLAST(axi_wlast) , //rd data last
    .m_axi_WID()   , //rd data id
    .m_axi_WREADY(axi_wready),

    .m_axi_BVALID(axi_bvalid),
    .m_axi_BRESP(axi_bresp),
    .m_axi_BID(axi_bid),
    .m_axi_BREADY(axi_bready)
);


ddr3_auto_read # (
    // The data width of input data
    .ENGINE_ID(0),
    .DATA_WIDTH(DATA_WIDTH),
    // The data width utilized for accumulated results
    .ID_WIDTH(ID_WIDTH)
) u_ddr_auto_read
(
    .clk(ui_clk),
    .rst_n(~ui_clk_sync_rst),
    .start_read(start_read),
    .read_ops(read_ops),
    .stride(read_stride),
    .init_addr(read_init_addr),
    .mem_burst_size(read_mem_burst_size),

    /////////////////////////Read Address///////////////////////// 
    .m_axi_ARVALID(axi_arvalid) , //rd address valid
    .m_axi_ARADDR(axi_araddr)  , //rd byte address
    .m_axi_ARID(axi_arid)    , //rd address id
    .m_axi_ARLEN(axi_arlen)   , //rd burst=awlen+1,
    .m_axi_ARSIZE(axi_arsize)  , //rd 3'b101, 32B
    .m_axi_ARBURST(axi_arburst) , //rd burst type: 01 (INC), 00 (FIXED)
    .m_axi_ARREADY(axi_arready) , //rd ready to accept address.
    .m_axi_ARLOCK(axi_arlock)  , //rd no
    .m_axi_ARCACHE(axi_arcache) , //rd no
    .m_axi_ARPROT(axi_arprot)  , //rd no
    .m_axi_ARQOS(axi_arqos)   , //rd no
    .m_axi_ARREGION(), //rd no

    /////////////////////////  Read Data  /////////////////////////
    .m_axi_RVALID(axi_rvalid), //rd data valid
    .m_axi_RDATA(axi_rdata) , //rd data 
    .m_axi_RLAST(axi_rlast) , //rd data last
    .m_axi_RID(axi_rid)   , //rd data id
    .m_axi_RRESP(axi_rresp) , //rd data status. 
    .m_axi_RREADY(axi_rready),

    /////////////////////////  Dn Data  ///////////////////////
    .dn_vld(dn_vld), 
    .dn_dat(dn_dat) 
);





mig_ddr3 u_mig_ddr3 (

    // Memory interface ports
    .ddr3_addr                      (ddr3_addr),  // output [13:0]		ddr3_addr
    .ddr3_ba                        (ddr3_ba),  // output [2:0]		ddr3_ba
    .ddr3_cas_n                     (ddr3_cas_n),  // output			ddr3_cas_n
    .ddr3_ck_n                      (ddr3_ck_n),  // output [0:0]		ddr3_ck_n
    .ddr3_ck_p                      (ddr3_ck_p),  // output [0:0]		ddr3_ck_p
    .ddr3_cke                       (ddr3_cke),  // output [0:0]		ddr3_cke
    .ddr3_ras_n                     (ddr3_ras_n),  // output			ddr3_ras_n
    .ddr3_reset_n                   (ddr3_reset_n),  // output			ddr3_reset_n
    .ddr3_we_n                      (ddr3_we_n),  // output			ddr3_we_n
    .ddr3_dq                        (ddr3_dq),  // inout [63:0]		ddr3_dq
    .ddr3_dqs_n                     (ddr3_dqs_n),  // inout [7:0]		ddr3_dqs_n
    .ddr3_dqs_p                     (ddr3_dqs_p),  // inout [7:0]		ddr3_dqs_p
    .init_calib_complete            (init_calib_complete),  // output			init_calib_complete
    
    .ddr3_cs_n                      (ddr3_cs_n),  // output [0:0]		ddr3_cs_n
    .ddr3_dm                        (ddr3_dm),  // output [7:0]		ddr3_dm
    .ddr3_odt                       (ddr3_odt),  // output [0:0]		ddr3_odt
    
    // Application interface ports
    .ui_clk                         (ui_clk),  // output			ui_clk
    .ui_clk_sync_rst                (ui_clk_sync_rst),  // output			ui_clk_sync_rst
    .mmcm_locked                    (mmcm_locked),  // output			mmcm_locked
    .aresetn                        (ddr3_aresetn ),  // input			aresetn
    .app_sr_req                     (1'b0),  // input			app_sr_req
    .app_ref_req                    (1'b0),  // input			app_ref_req
    .app_zq_req                     (1'b0),  // input			app_zq_req
    .app_sr_active                  (app_sr_active),  // output			app_sr_active
    .app_ref_ack                    (app_ref_ack),  // output			app_ref_ack
    .app_zq_ack                     (app_zq_ack),  // output			app_zq_ack

    // Slave Interface Write Address Ports
    .s_axi_awid                     (axi_awid),  // input [3:0]			s_axi_awid
    .s_axi_awaddr                   (axi_awaddr),  // input [29:0]			s_axi_awaddr
    .s_axi_awlen                    (axi_awlen),  // input [7:0]			s_axi_awlen
    .s_axi_awsize                   (axi_awsize),  // input [2:0]			s_axi_awsize
    .s_axi_awburst                  (axi_awburst),  // input [1:0]			s_axi_awburst
    .s_axi_awlock                   (axi_awlock),  // input [0:0]			s_axi_awlock
    .s_axi_awcache                  (axi_awcache),  // input [3:0]			s_axi_awcache
    .s_axi_awprot                   (axi_awprot),  // input [2:0]			s_axi_awprot
    .s_axi_awqos                    (axi_awqos),  // input [3:0]			s_axi_awqos
    .s_axi_awvalid                  (axi_awvalid),  // input			s_axi_awvalid
    .s_axi_awready                  (axi_awready),  // output			s_axi_awready
    // Slave Interface Write Data Ports
    .s_axi_wdata                    (axi_wdata),  // input [511:0]			s_axi_wdata
    .s_axi_wstrb                    (axi_wstrb),  // input [63:0]			s_axi_wstrb
    .s_axi_wlast                    (axi_wlast),  // input			s_axi_wlast
    .s_axi_wvalid                   (axi_wvalid),  // input			s_axi_wvalid
    .s_axi_wready                   (axi_wready),  // output			s_axi_wready
    // Slave Interface Write Response Ports
    .s_axi_bid                      (axi_bid),  // output [3:0]			s_axi_bid
    .s_axi_bresp                    (axi_bresp),  // output [1:0]			s_axi_bresp
    .s_axi_bvalid                   (axi_bvalid),  // output			s_axi_bvalid
    .s_axi_bready                   (axi_bready),  // input			s_axi_bready

    // Slave Interface Read Address Ports
    .s_axi_arid                     (axi_arid),  // input [3:0]			s_axi_arid
    .s_axi_araddr                   (axi_araddr),  // input [29:0]			s_axi_araddr
    .s_axi_arlen                    (axi_arlen),  // input [7:0]			s_axi_arlen
    .s_axi_arsize                   (axi_arsize),  // input [2:0]			s_axi_arsize
    .s_axi_arburst                  (axi_arburst),  // input [1:0]			s_axi_arburst
    .s_axi_arlock                   (axi_arlock),  // input [0:0]			s_axi_arlock
    .s_axi_arcache                  (axi_arcache),  // input [3:0]			s_axi_arcache
    .s_axi_arprot                   (axi_arprot),  // input [2:0]			s_axi_arprot
    .s_axi_arqos                    (axi_arqos),  // input [3:0]			s_axi_arqos
    .s_axi_arvalid                  (axi_arvalid),  // input			s_axi_arvalid
    .s_axi_arready                  (axi_arready),  // output			s_axi_arready
    // Slave Interface Read Data Ports
    .s_axi_rid                      (axi_rid),  // output [3:0]			s_axi_rid
    .s_axi_rdata                    (axi_rdata),  // output [511:0]			s_axi_rdata
    .s_axi_rresp                    (axi_rresp),  // output [1:0]			s_axi_rresp
    .s_axi_rlast                    (axi_rlast),  // output			s_axi_rlast
    .s_axi_rvalid                   (axi_rvalid),  // output			s_axi_rvalid
    .s_axi_rready                   (axi_rready),  // input			s_axi_rready

    // System Clock Ports
    .sys_clk_p                       (sys_clk_p),  // input				sys_clk_p
    .sys_clk_n                       (sys_clk_n),  // input				sys_clk_n
    .sys_rst                        (sys_rst) // input sys_rst
    );



endmodule
