// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// coap_top.v: A top level wrapper, hosting the hls-generated coap.v and the manually generated sha256_top.v
// Gabi Malka, Technion, TCE
//
// May-2018

module coap_coap_top (
        s_axi_AXILiteS_AWVALID,
        s_axi_AXILiteS_AWREADY,
        s_axi_AXILiteS_AWADDR,
        s_axi_AXILiteS_WVALID,
        s_axi_AXILiteS_WREADY,
        s_axi_AXILiteS_WDATA,
        s_axi_AXILiteS_WSTRB,
        s_axi_AXILiteS_ARVALID,
        s_axi_AXILiteS_ARREADY,
        s_axi_AXILiteS_ARADDR,
        s_axi_AXILiteS_RVALID,
        s_axi_AXILiteS_RREADY,
        s_axi_AXILiteS_RDATA,
        s_axi_AXILiteS_RRESP,
        s_axi_AXILiteS_BVALID,
        s_axi_AXILiteS_BREADY,
        s_axi_AXILiteS_BRESP,
        ap_clk,
        ap_rst_n,
        ik_host_metadata_input_V_V_TDATA,
        ik_host_data_input_V_V_TDATA,
        ik_host_metadata_output_V_V_TDATA,
        ik_host_data_output_V_V_TDATA,
        ik_net_metadata_input_V_V_TDATA,
        ik_net_data_input_V_V_TDATA,
        ik_net_metadata_output_V_V_TDATA,
        ik_net_data_output_V_V_TDATA,
        ik_host_metadata_input_V_V_TVALID,
        ik_host_metadata_input_V_V_TREADY,
        ik_host_data_input_V_V_TVALID,
        ik_host_data_input_V_V_TREADY,
        ik_host_metadata_output_V_V_TVALID,
        ik_host_metadata_output_V_V_TREADY,
        ik_host_data_output_V_V_TVALID,
        ik_host_data_output_V_V_TREADY,
        ik_net_metadata_input_V_V_TVALID,
        ik_net_metadata_input_V_V_TREADY,
        ik_net_data_input_V_V_TVALID,
        ik_net_data_input_V_V_TREADY,
        ik_net_metadata_output_V_V_TVALID,
        ik_net_metadata_output_V_V_TREADY,
        ik_net_data_output_V_V_TVALID,
        ik_net_data_output_V_V_TREADY,

    m_axi_ik_mem_mem_V_AWVALID,
    m_axi_ik_mem_mem_V_AWREADY,
    m_axi_ik_mem_mem_V_AWADDR,
    m_axi_ik_mem_mem_V_AWID,
    m_axi_ik_mem_mem_V_AWLEN,
    m_axi_ik_mem_mem_V_AWSIZE,
    m_axi_ik_mem_mem_V_AWBURST,
    m_axi_ik_mem_mem_V_AWLOCK,
    m_axi_ik_mem_mem_V_AWCACHE,
    m_axi_ik_mem_mem_V_AWPROT,
    m_axi_ik_mem_mem_V_AWQOS,
    m_axi_ik_mem_mem_V_AWREGION,
    m_axi_ik_mem_mem_V_AWUSER,

    m_axi_ik_mem_mem_V_WVALID,
    m_axi_ik_mem_mem_V_WREADY,
    m_axi_ik_mem_mem_V_WDATA,
    m_axi_ik_mem_mem_V_WSTRB,
    m_axi_ik_mem_mem_V_WLAST,
    m_axi_ik_mem_mem_V_WID,
    m_axi_ik_mem_mem_V_WUSER,

    m_axi_ik_mem_mem_V_BREADY,
    m_axi_ik_mem_mem_V_BVALID,
    m_axi_ik_mem_mem_V_BRESP,
    m_axi_ik_mem_mem_V_BID,
    m_axi_ik_mem_mem_V_BUSER,

    m_axi_ik_mem_mem_V_ARVALID,
    m_axi_ik_mem_mem_V_ARREADY,
    m_axi_ik_mem_mem_V_ARADDR,
    m_axi_ik_mem_mem_V_ARID,
    m_axi_ik_mem_mem_V_ARLEN,
    m_axi_ik_mem_mem_V_ARSIZE,
    m_axi_ik_mem_mem_V_ARBURST,
    m_axi_ik_mem_mem_V_ARLOCK,
    m_axi_ik_mem_mem_V_ARCACHE,
    m_axi_ik_mem_mem_V_ARPROT,
    m_axi_ik_mem_mem_V_ARQOS,
    m_axi_ik_mem_mem_V_ARREGION,
    m_axi_ik_mem_mem_V_ARUSER,

    m_axi_ik_mem_mem_V_RVALID,
    m_axi_ik_mem_mem_V_RREADY,
    m_axi_ik_mem_mem_V_RDATA,
    m_axi_ik_mem_mem_V_RLAST,
    m_axi_ik_mem_mem_V_RID,
    m_axi_ik_mem_mem_V_RRESP,
    m_axi_ik_mem_mem_V_RUSER,

    ik_events_0_V,
    ik_events_1_V,
    ik_events_2_V,
    ik_events_3_V,
    ik_events_4_V,
    ik_events_5_V,
    ik_events_6_V,
    ik_events_7_V,

    tc_net_tc_data_counts_V,
    tc_net_tc_meta_counts_V,
    tc_host_tc_data_counts_V,
    tc_host_tc_meta_counts_V
);

  parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
  parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 32;
  parameter    C_S_AXI_AXILITES_WSTRB_WIDTH = (C_S_AXI_AXILITES_DATA_WIDTH / 8);

  parameter    C_M_AXI_IK_MEM_MEM_V_CACHE_VALUE = 0;
  parameter    C_M_AXI_IK_MEM_MEM_V_ID_WIDTH = 1;
  parameter    C_M_AXI_IK_MEM_MEM_V_ADDR_WIDTH = 64;
  parameter    C_M_AXI_IK_MEM_MEM_V_DATA_WIDTH = 512;
  parameter    C_M_AXI_IK_MEM_MEM_V_AWUSER_WIDTH = 1;
  parameter    C_M_AXI_IK_MEM_MEM_V_ARUSER_WIDTH = 1;
  parameter    C_M_AXI_IK_MEM_MEM_V_WUSER_WIDTH = 1;
  parameter    C_M_AXI_IK_MEM_MEM_V_RUSER_WIDTH = 1;
  parameter    C_M_AXI_IK_MEM_MEM_V_BUSER_WIDTH = 1;
  parameter    C_M_AXI_ID_WIDTH = 1;
  parameter    C_M_AXI_ADDR_WIDTH = 64;
  parameter    C_M_AXI_DATA_WIDTH = 32;
  parameter    C_M_AXI_AWUSER_WIDTH = 1;
  parameter    C_M_AXI_ARUSER_WIDTH = 1;
  parameter    C_M_AXI_WUSER_WIDTH = 1;
  parameter    C_M_AXI_RUSER_WIDTH = 1;
  parameter    C_M_AXI_BUSER_WIDTH = 1;
  
  parameter C_M_AXI_IK_MEM_MEM_V_WSTRB_WIDTH = (C_M_AXI_IK_MEM_MEM_V_DATA_WIDTH / 8);
  parameter C_M_AXI_WSTRB_WIDTH = (C_M_AXI_DATA_WIDTH / 8);



`ifdef FIRST_SHA_UNITS
  parameter    NUM1_SHA_UNITS                   = `FIRST_SHA_UNITS;
`else
  parameter    NUM1_SHA_UNITS                   = 12;
`endif  

`ifdef SECOND_SHA_UNITS
  parameter    NUM2_SHA_UNITS                   = `SECOND_SHA_UNITS;
`else
  parameter    NUM2_SHA_UNITS                   = 8;
`endif  

  
input   s_axi_AXILiteS_AWVALID;
output   s_axi_AXILiteS_AWREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_AWADDR;
input   s_axi_AXILiteS_WVALID;
output   s_axi_AXILiteS_WREADY;
input  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_WDATA;
input  [C_S_AXI_AXILITES_WSTRB_WIDTH - 1 : 0] s_axi_AXILiteS_WSTRB;
input   s_axi_AXILiteS_ARVALID;
output   s_axi_AXILiteS_ARREADY;
input  [C_S_AXI_AXILITES_ADDR_WIDTH - 1 : 0] s_axi_AXILiteS_ARADDR;
output   s_axi_AXILiteS_RVALID;
input   s_axi_AXILiteS_RREADY;
output  [C_S_AXI_AXILITES_DATA_WIDTH - 1 : 0] s_axi_AXILiteS_RDATA;
output  [1:0] s_axi_AXILiteS_RRESP;
output   s_axi_AXILiteS_BVALID;
input   s_axi_AXILiteS_BREADY;
output  [1:0] s_axi_AXILiteS_BRESP;
input   ap_clk;
input   ap_rst_n;
input  [255:0] ik_host_metadata_input_V_V_TDATA;
input  [295:0] ik_host_data_input_V_V_TDATA;
output  [255:0] ik_host_metadata_output_V_V_TDATA;
output  [295:0] ik_host_data_output_V_V_TDATA;
input  [255:0] ik_net_metadata_input_V_V_TDATA;
input  [295:0] ik_net_data_input_V_V_TDATA;
output  [255:0] ik_net_metadata_output_V_V_TDATA;
output  [295:0] ik_net_data_output_V_V_TDATA;
input   ik_host_metadata_input_V_V_TVALID;
output   ik_host_metadata_input_V_V_TREADY;
input   ik_host_data_input_V_V_TVALID;
output   ik_host_data_input_V_V_TREADY;
output   ik_host_metadata_output_V_V_TVALID;
input   ik_host_metadata_output_V_V_TREADY;
output   ik_host_data_output_V_V_TVALID;
input   ik_host_data_output_V_V_TREADY;
input   ik_net_metadata_input_V_V_TVALID;
output   ik_net_metadata_input_V_V_TREADY;
input   ik_net_data_input_V_V_TVALID;
output   ik_net_data_input_V_V_TREADY;
output   ik_net_metadata_output_V_V_TVALID;
input   ik_net_metadata_output_V_V_TREADY;
output   ik_net_data_output_V_V_TVALID;
input   ik_net_data_output_V_V_TREADY;

output   m_axi_ik_mem_mem_V_AWVALID;
input   m_axi_ik_mem_mem_V_AWREADY;
output  [C_M_AXI_IK_MEM_MEM_V_ADDR_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_AWADDR;
output  [C_M_AXI_IK_MEM_MEM_V_ID_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_AWID;
output  [7:0] m_axi_ik_mem_mem_V_AWLEN;
output  [2:0] m_axi_ik_mem_mem_V_AWSIZE;
output  [1:0] m_axi_ik_mem_mem_V_AWBURST;
output  [1:0] m_axi_ik_mem_mem_V_AWLOCK;
output  [3:0] m_axi_ik_mem_mem_V_AWCACHE;
output  [2:0] m_axi_ik_mem_mem_V_AWPROT;
output  [3:0] m_axi_ik_mem_mem_V_AWQOS;
output  [3:0] m_axi_ik_mem_mem_V_AWREGION;
output  [C_M_AXI_IK_MEM_MEM_V_AWUSER_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_AWUSER;
output   m_axi_ik_mem_mem_V_WVALID;
input   m_axi_ik_mem_mem_V_WREADY;
output  [C_M_AXI_IK_MEM_MEM_V_DATA_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_WDATA;
output  [C_M_AXI_IK_MEM_MEM_V_WSTRB_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_WSTRB;
output   m_axi_ik_mem_mem_V_WLAST;
output  [C_M_AXI_IK_MEM_MEM_V_ID_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_WID;
output  [C_M_AXI_IK_MEM_MEM_V_WUSER_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_WUSER;
output   m_axi_ik_mem_mem_V_ARVALID;
input   m_axi_ik_mem_mem_V_ARREADY;
output  [C_M_AXI_IK_MEM_MEM_V_ADDR_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_ARADDR;
output  [C_M_AXI_IK_MEM_MEM_V_ID_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_ARID;
output  [7:0] m_axi_ik_mem_mem_V_ARLEN;
output  [2:0] m_axi_ik_mem_mem_V_ARSIZE;
output  [1:0] m_axi_ik_mem_mem_V_ARBURST;
output  [1:0] m_axi_ik_mem_mem_V_ARLOCK;
output  [3:0] m_axi_ik_mem_mem_V_ARCACHE;
output  [2:0] m_axi_ik_mem_mem_V_ARPROT;
output  [3:0] m_axi_ik_mem_mem_V_ARQOS;
output  [3:0] m_axi_ik_mem_mem_V_ARREGION;
output  [C_M_AXI_IK_MEM_MEM_V_ARUSER_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_ARUSER;
input   m_axi_ik_mem_mem_V_RVALID;
output   m_axi_ik_mem_mem_V_RREADY;
input  [C_M_AXI_IK_MEM_MEM_V_DATA_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_RDATA;
input   m_axi_ik_mem_mem_V_RLAST;
input  [C_M_AXI_IK_MEM_MEM_V_ID_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_RID;
input  [C_M_AXI_IK_MEM_MEM_V_RUSER_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_RUSER;
input  [1:0] m_axi_ik_mem_mem_V_RRESP;
input   m_axi_ik_mem_mem_V_BVALID;
output   m_axi_ik_mem_mem_V_BREADY;
input  [1:0] m_axi_ik_mem_mem_V_BRESP;
input  [C_M_AXI_IK_MEM_MEM_V_ID_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_BID;
input  [C_M_AXI_IK_MEM_MEM_V_BUSER_WIDTH - 1 : 0] m_axi_ik_mem_mem_V_BUSER;
input  [0:0] ik_events_0_V;
input  [0:0] ik_events_1_V;
input  [0:0] ik_events_2_V;
input  [0:0] ik_events_3_V;
input  [0:0] ik_events_4_V;
input  [0:0] ik_events_5_V;
input  [0:0] ik_events_6_V;
input  [0:0] ik_events_7_V;

input  [39:0] tc_host_tc_meta_counts_V;
input  [39:0] tc_host_tc_data_counts_V;
input  [39:0] tc_net_tc_meta_counts_V;
input  [39:0] tc_net_tc_data_counts_V;

wire   first_pass_sha_unit_input_stream_TVALID;
wire   first_pass_sha_unit_input_stream_TREADY;
wire  [511:0] first_pass_sha_unit_input_stream_TDATA;
wire  [0:0] first_pass_sha_unit_input_stream_TLAST;

wire   first_pass_sha_unit_output_stream_V_data_V_TVALID;
wire   first_pass_sha_unit_output_stream_V_data_V_TREADY;
wire  [255:0] first_pass_sha_unit_output_stream_V_data_V_TDATA;

wire  [511:0] second_pass_sha_unit_input_stream_TDATA;
wire  [0:0] second_pass_sha_unit_input_stream_TLAST;
wire   second_pass_sha_unit_input_stream_TVALID;
wire   second_pass_sha_unit_input_stream_TREADY;

wire  [255:0] second_pass_sha_unit_output_stream_V_data_V_TDATA;
wire   second_pass_sha_unit_output_stream_V_data_V_TVALID;
wire   second_pass_sha_unit_output_stream_V_data_V_TREADY;


///////////////////////////////////////////////////////////////////////////////
// coap_top:
///////////////////////////////////////////////////////////////////////////////

coap_coap_ikernel #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(32),
    .C_S_AXI_AXILITES_DATA_WIDTH(32)
) coap_ikernel (

    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),

    .ap_clk(ap_clk),
    .ap_rst_n(ap_rst_n),

    .ik_host_metadata_output_V_V_TDATA(ik_host_metadata_output_V_V_TDATA),
    .ik_host_metadata_output_V_V_TVALID(ik_host_metadata_output_V_V_TVALID),
    .ik_host_metadata_output_V_V_TREADY(ik_host_metadata_output_V_V_TREADY),

    .ik_host_metadata_input_V_V_TDATA(ik_host_metadata_input_V_V_TDATA),
    .ik_host_metadata_input_V_V_TVALID(ik_host_metadata_input_V_V_TVALID),
    .ik_host_metadata_input_V_V_TREADY(ik_host_metadata_input_V_V_TREADY),

    .ik_host_data_output_V_V_TDATA(ik_host_data_output_V_V_TDATA),
    .ik_host_data_output_V_V_TVALID(ik_host_data_output_V_V_TVALID),
    .ik_host_data_output_V_V_TREADY(ik_host_data_output_V_V_TREADY),

    .ik_host_data_input_V_V_TDATA(ik_host_data_input_V_V_TDATA),
    .ik_host_data_input_V_V_TVALID(ik_host_data_input_V_V_TVALID),
    .ik_host_data_input_V_V_TREADY(ik_host_data_input_V_V_TREADY),

    .ik_net_metadata_output_V_V_TDATA(ik_net_metadata_output_V_V_TDATA),
    .ik_net_metadata_output_V_V_TVALID(ik_net_metadata_output_V_V_TVALID),
    .ik_net_metadata_output_V_V_TREADY(ik_net_metadata_output_V_V_TREADY),

    .ik_net_metadata_input_V_V_TDATA(ik_net_metadata_input_V_V_TDATA),
    .ik_net_metadata_input_V_V_TVALID(ik_net_metadata_input_V_V_TVALID),
    .ik_net_metadata_input_V_V_TREADY(ik_net_metadata_input_V_V_TREADY),

    .ik_net_data_output_V_V_TDATA(ik_net_data_output_V_V_TDATA),
    .ik_net_data_output_V_V_TVALID(ik_net_data_output_V_V_TVALID),
    .ik_net_data_output_V_V_TREADY(ik_net_data_output_V_V_TREADY),

    .ik_net_data_input_V_V_TDATA(ik_net_data_input_V_V_TDATA),
    .ik_net_data_input_V_V_TVALID(ik_net_data_input_V_V_TVALID),
    .ik_net_data_input_V_V_TREADY(ik_net_data_input_V_V_TREADY),

    .m_axi_ik_mem_mem_V_AWVALID(m_axi_ik_mem_mem_V_AWVALID),
    .m_axi_ik_mem_mem_V_AWREADY(m_axi_ik_mem_mem_V_AWREADY),
    .m_axi_ik_mem_mem_V_AWADDR(m_axi_ik_mem_mem_V_AWADDR),
    .m_axi_ik_mem_mem_V_AWID(m_axi_ik_mem_mem_V_AWID),
    .m_axi_ik_mem_mem_V_AWLEN(m_axi_ik_mem_mem_V_AWLEN),
    .m_axi_ik_mem_mem_V_AWSIZE(m_axi_ik_mem_mem_V_AWSIZE),
    .m_axi_ik_mem_mem_V_AWBURST(m_axi_ik_mem_mem_V_AWBURST),
    .m_axi_ik_mem_mem_V_AWLOCK(m_axi_ik_mem_mem_V_AWLOCK),
    .m_axi_ik_mem_mem_V_AWCACHE(m_axi_ik_mem_mem_V_AWCACHE),
    .m_axi_ik_mem_mem_V_AWPROT(m_axi_ik_mem_mem_V_AWPROT),
    .m_axi_ik_mem_mem_V_AWQOS(m_axi_ik_mem_mem_V_AWQOS),
    .m_axi_ik_mem_mem_V_AWREGION(m_axi_ik_mem_mem_V_AWREGION),
    .m_axi_ik_mem_mem_V_AWUSER(m_axi_ik_mem_mem_V_AWUSER),

    .m_axi_ik_mem_mem_V_WVALID(m_axi_ik_mem_mem_V_WVALID),
    .m_axi_ik_mem_mem_V_WREADY(m_axi_ik_mem_mem_V_WREADY),
    .m_axi_ik_mem_mem_V_WDATA(m_axi_ik_mem_mem_V_WDATA),
    .m_axi_ik_mem_mem_V_WSTRB(m_axi_ik_mem_mem_V_WSTRB),
    .m_axi_ik_mem_mem_V_WLAST(m_axi_ik_mem_mem_V_WLAST),
    .m_axi_ik_mem_mem_V_WID(m_axi_ik_mem_mem_V_WID),
    .m_axi_ik_mem_mem_V_WUSER(m_axi_ik_mem_mem_V_WUSER),

    .m_axi_ik_mem_mem_V_BREADY(m_axi_ik_mem_mem_V_BREADY),
    .m_axi_ik_mem_mem_V_BVALID(m_axi_ik_mem_mem_V_BVALID),
    .m_axi_ik_mem_mem_V_BRESP(m_axi_ik_mem_mem_V_BRESP),
    .m_axi_ik_mem_mem_V_BID(m_axi_ik_mem_mem_V_BID),
    .m_axi_ik_mem_mem_V_BUSER(m_axi_ik_mem_mem_V_BUSER),

    .m_axi_ik_mem_mem_V_ARVALID(m_axi_ik_mem_mem_V_ARVALID),
    .m_axi_ik_mem_mem_V_ARREADY(m_axi_ik_mem_mem_V_ARREADY),
    .m_axi_ik_mem_mem_V_ARADDR(m_axi_ik_mem_mem_V_ARADDR),
    .m_axi_ik_mem_mem_V_ARID(m_axi_ik_mem_mem_V_ARID),
    .m_axi_ik_mem_mem_V_ARLEN(m_axi_ik_mem_mem_V_ARLEN),
    .m_axi_ik_mem_mem_V_ARSIZE(m_axi_ik_mem_mem_V_ARSIZE),
    .m_axi_ik_mem_mem_V_ARBURST(m_axi_ik_mem_mem_V_ARBURST),
    .m_axi_ik_mem_mem_V_ARLOCK(m_axi_ik_mem_mem_V_ARLOCK),
    .m_axi_ik_mem_mem_V_ARCACHE(m_axi_ik_mem_mem_V_ARCACHE),
    .m_axi_ik_mem_mem_V_ARPROT(m_axi_ik_mem_mem_V_ARPROT),
    .m_axi_ik_mem_mem_V_ARQOS(m_axi_ik_mem_mem_V_ARQOS),
    .m_axi_ik_mem_mem_V_ARREGION(m_axi_ik_mem_mem_V_ARREGION),
    .m_axi_ik_mem_mem_V_ARUSER(m_axi_ik_mem_mem_V_ARUSER),

    .m_axi_ik_mem_mem_V_RVALID(m_axi_ik_mem_mem_V_RVALID),
    .m_axi_ik_mem_mem_V_RREADY(m_axi_ik_mem_mem_V_RREADY),
    .m_axi_ik_mem_mem_V_RDATA(m_axi_ik_mem_mem_V_RDATA),
    .m_axi_ik_mem_mem_V_RLAST(m_axi_ik_mem_mem_V_RLAST),
    .m_axi_ik_mem_mem_V_RID(m_axi_ik_mem_mem_V_RID),
    .m_axi_ik_mem_mem_V_RRESP(m_axi_ik_mem_mem_V_RRESP),
    .m_axi_ik_mem_mem_V_RUSER(m_axi_ik_mem_mem_V_RUSER),

    .ik_events_0_V(ik_events_0_V),
    .ik_events_1_V(ik_events_1_V),
    .ik_events_2_V(ik_events_2_V),
    .ik_events_3_V(ik_events_3_V),
    .ik_events_4_V(ik_events_4_V),
    .ik_events_5_V(ik_events_5_V),
    .ik_events_6_V(ik_events_6_V),
    .ik_events_7_V(ik_events_7_V),

    .tc_net_tc_data_counts_V(tc_net_tc_data_counts_V),
    .tc_net_tc_meta_counts_V(tc_net_tc_meta_counts_V),
    .tc_host_tc_data_counts_V(tc_host_tc_data_counts_V),
    .tc_host_tc_meta_counts_V(tc_host_tc_meta_counts_V),

    .first_pass_sha_unit_input_stream_TDATA(first_pass_sha_unit_input_stream_TDATA),
    .first_pass_sha_unit_input_stream_TLAST(first_pass_sha_unit_input_stream_TLAST),
    .first_pass_sha_unit_input_stream_TVALID(first_pass_sha_unit_input_stream_TVALID),
    .first_pass_sha_unit_input_stream_TREADY(first_pass_sha_unit_input_stream_TREADY),
    
    .first_pass_sha_unit_output_stream_V_data_V_TVALID(first_pass_sha_unit_output_stream_V_data_V_TVALID),
    .first_pass_sha_unit_output_stream_V_data_V_TREADY(first_pass_sha_unit_output_stream_V_data_V_TREADY),
    .first_pass_sha_unit_output_stream_V_data_V_TDATA(first_pass_sha_unit_output_stream_V_data_V_TDATA),

    .second_pass_sha_unit_input_stream_TDATA(second_pass_sha_unit_input_stream_TDATA),
    .second_pass_sha_unit_input_stream_TLAST(second_pass_sha_unit_input_stream_TLAST),
    .second_pass_sha_unit_input_stream_TVALID(second_pass_sha_unit_input_stream_TVALID),
    .second_pass_sha_unit_input_stream_TREADY(second_pass_sha_unit_input_stream_TREADY),
    
    .second_pass_sha_unit_output_stream_V_data_V_TDATA(second_pass_sha_unit_output_stream_V_data_V_TDATA),
    .second_pass_sha_unit_output_stream_V_data_V_TVALID(second_pass_sha_unit_output_stream_V_data_V_TVALID),
    .second_pass_sha_unit_output_stream_V_data_V_TREADY(second_pass_sha_unit_output_stream_V_data_V_TREADY)

);



///////////////////////////////////////////////////////////////////////////////
// sha1_top:
///////////////////////////////////////////////////////////////////////////////

sha256_top #(
	.NUM_SHA_UNITS(NUM1_SHA_UNITS)
  ) sha1_top (
        .clk(ap_clk),
        .reset(~ap_rst_n),

	.ik2sha_vld(first_pass_sha_unit_input_stream_TVALID),
	.ik2sha_last(first_pass_sha_unit_input_stream_TLAST),
	.ik2sha_rdy(first_pass_sha_unit_input_stream_TREADY),
	.ik2sha_data(first_pass_sha_unit_input_stream_TDATA),
	.sha2ik_vld(first_pass_sha_unit_output_stream_V_data_V_TVALID),
	.sha2ik_rdy(first_pass_sha_unit_output_stream_V_data_V_TREADY),
	.sha2ik_data(first_pass_sha_unit_output_stream_V_data_V_TDATA)
  );


///////////////////////////////////////////////////////////////////////////////
// sha2_top:
///////////////////////////////////////////////////////////////////////////////

sha256_top #(
	.NUM_SHA_UNITS(NUM2_SHA_UNITS)
  ) sha2_top (
        .clk(ap_clk),
        .reset(~ap_rst_n),

	.ik2sha_vld(second_pass_sha_unit_input_stream_TVALID),
	.ik2sha_last(second_pass_sha_unit_input_stream_TLAST),
	.ik2sha_rdy(second_pass_sha_unit_input_stream_TREADY),
	.ik2sha_data(second_pass_sha_unit_input_stream_TDATA),
	.sha2ik_vld(second_pass_sha_unit_output_stream_V_data_V_TVALID),
	.sha2ik_rdy(second_pass_sha_unit_output_stream_V_data_V_TREADY),
	.sha2ik_data(second_pass_sha_unit_output_stream_V_data_V_TDATA)
  );


    
endmodule
