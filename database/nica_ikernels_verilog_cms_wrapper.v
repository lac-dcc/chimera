// This program was cloned from: https://github.com/acsl-technion/nica
// License: BSD 2-Clause "Simplified" License

// cms_wrapper.v: A top level wrapper, hosting the hls-generated cms_top.v and the manually generated cms_heap.v
// Gabi Malka, Technion, TCE
//
// Jun-2017

module cms_cms_top (
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
        ik_host_action_V_V_TDATA,
        ik_host_metadata_output_V_V_TDATA,
        ik_host_data_output_V_V_TDATA,
        ik_net_metadata_input_V_V_TDATA,
        ik_net_data_input_V_V_TDATA,
        ik_net_action_V_V_TDATA,
        ik_net_metadata_output_V_V_TDATA,
        ik_net_data_output_V_V_TDATA,
        ik_host_metadata_input_V_V_TVALID,
        ik_host_metadata_input_V_V_TREADY,
        ik_host_data_input_V_V_TVALID,
        ik_host_data_input_V_V_TREADY,
        ik_host_action_V_V_TVALID,
        ik_host_action_V_V_TREADY,
        ik_host_metadata_output_V_V_TVALID,
        ik_host_metadata_output_V_V_TREADY,
        ik_host_data_output_V_V_TVALID,
        ik_host_data_output_V_V_TREADY,
        ik_net_metadata_input_V_V_TVALID,
        ik_net_metadata_input_V_V_TREADY,
        ik_net_data_input_V_V_TVALID,
        ik_net_data_input_V_V_TREADY,
        ik_net_action_V_V_TVALID,
        ik_net_action_V_V_TREADY,
        ik_net_metadata_output_V_V_TVALID,
        ik_net_metadata_output_V_V_TREADY,
        ik_net_data_output_V_V_TVALID,
        ik_net_data_output_V_V_TREADY
);

  parameter    C_S_AXI_AXILITES_DATA_WIDTH = 32;
  parameter    C_S_AXI_AXILITES_ADDR_WIDTH = 32;
  parameter    C_S_AXI_AXILITES_WSTRB_WIDTH = (C_S_AXI_AXILITES_DATA_WIDTH / 8);
`ifdef CMS_HEAP_DEPTH
  parameter    HEAP_DEPTH                   = `CMS_HEAP_DEPTH;
`else
  parameter    HEAP_DEPTH                   = 256;
`endif  
`ifdef CMS_VALUE_WIDTH
  parameter    VALUE_WIDTH                   = `CMS_VALUE_WIDTH;
`else
  parameter    VALUE_WIDTH                   = 32;
`endif  
`ifdef CMS_KEY_WIDTH
  parameter    KEY_WIDTH                   = `CMS_KEY_WIDTH;
`else
  parameter    KEY_WIDTH                   = 32;
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
input  [239:0] ik_host_metadata_input_V_V_TDATA;
input  [295:0] ik_host_data_input_V_V_TDATA;
output  [7:0] ik_host_action_V_V_TDATA;
output  [239:0] ik_host_metadata_output_V_V_TDATA;
output  [295:0] ik_host_data_output_V_V_TDATA;
input  [239:0] ik_net_metadata_input_V_V_TDATA;
input  [295:0] ik_net_data_input_V_V_TDATA;
output  [7:0] ik_net_action_V_V_TDATA;
output  [239:0] ik_net_metadata_output_V_V_TDATA;
output  [295:0] ik_net_data_output_V_V_TDATA;
input   ik_host_metadata_input_V_V_TVALID;
output   ik_host_metadata_input_V_V_TREADY;
input   ik_host_data_input_V_V_TVALID;
output   ik_host_data_input_V_V_TREADY;
output   ik_host_action_V_V_TVALID;
input   ik_host_action_V_V_TREADY;
output   ik_host_metadata_output_V_V_TVALID;
input   ik_host_metadata_output_V_V_TREADY;
output   ik_host_data_output_V_V_TVALID;
input   ik_host_data_output_V_V_TREADY;
input   ik_net_metadata_input_V_V_TVALID;
output   ik_net_metadata_input_V_V_TREADY;
input   ik_net_data_input_V_V_TVALID;
output   ik_net_data_input_V_V_TREADY;
output   ik_net_action_V_V_TVALID;
input   ik_net_action_V_V_TREADY;
output   ik_net_metadata_output_V_V_TVALID;
input   ik_net_metadata_output_V_V_TREADY;
output   ik_net_data_output_V_V_TVALID;
input   ik_net_data_output_V_V_TREADY;

  wire [63:0] kv_out;              // cms to heap: A new kv pair
  wire 	      kv_valid;            // cms to heap: A new kv pair is valid
  wire 	      heap_out_ready;           // CMS has read current heap out key & value. Use this indicatioin to bubble-down the heap
  wire [63:0] heap_out_data;            // Heap bottom key & value
  wire 	      heap_out_valid;      // Heap bottom key & value is valid
  

///////////////////////////////////////////////////////////////////////////////
// cms_top:
///////////////////////////////////////////////////////////////////////////////

cms_cms_ikernel #(
    .C_S_AXI_AXILITES_ADDR_WIDTH(C_S_AXI_AXILITES_ADDR_WIDTH),
    .C_S_AXI_AXILITES_DATA_WIDTH(C_S_AXI_AXILITES_DATA_WIDTH)
) cms (

    .s_axi_AXILiteS_AWREADY(s_axi_AXILiteS_AWREADY),
    .s_axi_AXILiteS_AWVALID(s_axi_AXILiteS_AWVALID),
    .s_axi_AXILiteS_AWADDR(s_axi_AXILiteS_AWADDR),
    
    .s_axi_AXILiteS_WVALID(s_axi_AXILiteS_WVALID),
    .s_axi_AXILiteS_WREADY(s_axi_AXILiteS_WREADY),
    .s_axi_AXILiteS_WDATA(s_axi_AXILiteS_WDATA),
    .s_axi_AXILiteS_WSTRB(s_axi_AXILiteS_WSTRB),
    
    .s_axi_AXILiteS_ARVALID(s_axi_AXILiteS_ARVALID),
    .s_axi_AXILiteS_ARREADY(s_axi_AXILiteS_ARREADY),
    .s_axi_AXILiteS_ARADDR(s_axi_AXILiteS_ARADDR),
    
    .s_axi_AXILiteS_BVALID(s_axi_AXILiteS_BVALID),
    .s_axi_AXILiteS_BREADY(s_axi_AXILiteS_BREADY),
    .s_axi_AXILiteS_BRESP(s_axi_AXILiteS_BRESP),
    
    .s_axi_AXILiteS_RVALID(s_axi_AXILiteS_RVALID),
    .s_axi_AXILiteS_RREADY(s_axi_AXILiteS_RREADY),
    .s_axi_AXILiteS_RDATA(s_axi_AXILiteS_RDATA),
    .s_axi_AXILiteS_RRESP(s_axi_AXILiteS_RRESP),

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

    .ik_host_action_V_V_TDATA(ik_host_action_V_V_TDATA),
    .ik_host_action_V_V_TVALID(ik_host_action_V_V_TVALID),
    .ik_host_action_V_V_TREADY(ik_host_action_V_V_TREADY),

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

    .ik_net_action_V_V_TDATA(ik_net_action_V_V_TDATA),
    .ik_net_action_V_V_TVALID(ik_net_action_V_V_TVALID),
    .ik_net_action_V_V_TREADY(ik_net_action_V_V_TREADY),

    .to_heap(kv_out),
    .to_heap_ap_vld(kv_valid),
    .heap_out_V_TDATA(heap_out_data),
    .heap_out_V_TVALID(heap_out_valid),
    .heap_out_V_TREADY(heap_out_ready),
    .k_value_V(HEAP_DEPTH)
);


cms_heap #(
    .HEAP_DEPTH(HEAP_DEPTH),
    .VALUE_WIDTH(VALUE_WIDTH),
    .KEY_WIDTH(KEY_WIDTH)
) heap (
    .ap_clk(ap_clk),
    .ap_reset(~ap_rst_n),

    // A new {key,value} from cms:
    .key_in(kv_out[31:0]),
    .value_in(kv_out[63:32]),
    .kv_in_valid(kv_valid),
	    
    // heap reading interface:
    .kv_out_ready(heap_out_ready),
    .key_out(heap_out_data[31:0]),
    .value_out(heap_out_data[63:32]),
    .kv_out_valid(heap_out_valid)
);
    
endmodule
