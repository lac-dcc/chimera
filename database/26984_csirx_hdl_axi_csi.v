// This program was cloned from: https://github.com/stevenbell/csirx
// License: GNU Lesser General Public License v3.0

/* axi_csi  Top-level wrapper for the CSI receiver with AXI-Lite control
 * interface.
 */

`timescale 1 ns / 1 ps

module axi_csi #
(
    localparam CONTROL_DATA_WIDTH = 32,
    localparam CONTROL_ADDR_WIDTH = 5
)
(
    // interrupt line
    output wire csi_intr,
    
    // reset signal, synchronized to ppi_rxbyteclkhs_clk
    input wire rxbyteclkhs_resetn,
    
    // PPI interface
    input wire ppi_cl_stopstate,
    output wire ppi_cl_enable,         // clock enable
    input wire ppi_rxbyteclkhs_clk,   // receive byte clock
    
    input wire ppi_dl0_rxactivehs,    // whether high-speed receive is active on this lane
    input wire ppi_dl0_rxsynchs,      // pulse at beginning of high-speed transmission
    output wire ppi_dl0_enable,        // enable this lane
    output wire ppi_dl0_forcerxmode,   
    input wire ppi_dl0_rxvalidhs,     // this lane is valid
    input wire [7:0] ppi_dl0_rxdatahs,// data for this lane
    
    input wire ppi_dl1_rxactivehs,    // whether high-speed receive is active on this lane
    input wire ppi_dl1_rxsynchs,      // pulse at beginning of high-speed transmission
    output wire ppi_dl1_enable,        // enable this lane
    output wire ppi_dl1_forcerxmode,   
    input wire ppi_dl1_rxvalidhs,     // this lane is valid
    input wire [7:0] ppi_dl1_rxdatahs,// data for this lane
        
    // AXI-Lite control bus
    input wire  regspace_s_axi_aclk,
    input wire  regspace_s_axi_aresetn,
    input wire [CONTROL_ADDR_WIDTH-1 : 0] regspace_s_axi_awaddr,
    input wire [2 : 0] regspace_s_axi_awprot,
    input wire  regspace_s_axi_awvalid,
    output wire  regspace_s_axi_awready,
    input wire [CONTROL_DATA_WIDTH-1 : 0] regspace_s_axi_wdata,
    input wire [(CONTROL_DATA_WIDTH/8)-1 : 0] regspace_s_axi_wstrb,
    input wire  regspace_s_axi_wvalid,
    output wire  regspace_s_axi_wready,
    output wire [1 : 0] regspace_s_axi_bresp,
    output wire  regspace_s_axi_bvalid,
    input wire  regspace_s_axi_bready,
    input wire [CONTROL_ADDR_WIDTH-1 : 0] regspace_s_axi_araddr,
    input wire [2 : 0] regspace_s_axi_arprot,
    input wire  regspace_s_axi_arvalid,
    output wire  regspace_s_axi_arready,
    output wire [CONTROL_DATA_WIDTH-1 : 0] regspace_s_axi_rdata,
    output wire [1 : 0] regspace_s_axi_rresp,
    output wire  regspace_s_axi_rvalid,
    input wire  regspace_s_axi_rready,


    // AXI-Stream master output
    // synchronized to the ppi_rxbyteclkhs_clk clock signal
    output wire  output_m_axis_tvalid,
    output wire [63: 0] output_m_axis_tdata,
    output wire [7: 0] output_m_axis_tstrb,
    output wire  output_m_axis_tlast,
    input wire  output_m_axis_tready
);
    
// Instantiation of Axi Bus Interface RegSpace_S_AXI
// All logic is embedded inside RegSpace_S_AXI
axilite_control # (
    .N_DATA_LANES(2), 
    .C_S_AXI_DATA_WIDTH(32),
    .C_S_AXI_ADDR_WIDTH(5)
) axilite_control_inst (
    // interrupt line
    .csi_intr(csi_intr),
    
    // reset signal
    .rxbyteclkhs_resetn(rxbyteclkhs_resetn),
    
    // PPI interface
    .cl_stopstate(ppi_cl_stopstate),
    .cl_enable(ppi_cl_enable),
    .rxbyteclkhs(ppi_rxbyteclkhs_clk),
    
    .dl0_rxactivehs(ppi_dl0_rxactivehs),
    .dl0_rxsynchs(ppi_dl0_rxsynchs),
    .dl0_enable(ppi_dl0_enable),
    .dl0_forcerxmode(ppi_dl0_forcerxmode),
    .dl0_rxvalidhs(ppi_dl0_rxvalidhs),
    .dl0_rxdatahs(ppi_dl0_rxdatahs),
    
    .dl1_rxactivehs(ppi_dl1_rxactivehs),
    .dl1_rxsynchs(ppi_dl1_rxsynchs),
    .dl1_enable(ppi_dl1_enable),
    .dl1_forcerxmode(ppi_dl1_forcerxmode),
    .dl1_rxvalidhs(ppi_dl1_rxvalidhs),
    .dl1_rxdatahs(ppi_dl1_rxdatahs),
    
    // AXI Stream Interface Outpout
    .m_axis_tvalid(output_m_axis_tvalid),
    .m_axis_tdata(output_m_axis_tdata),
    .m_axis_tstrb(output_m_axis_tstrb),
    .m_axis_tlast(output_m_axis_tlast),
    .m_axis_tready(output_m_axis_tready),
    
    // AXI Lite Interface RegSpace
    .S_AXI_ACLK(regspace_s_axi_aclk),
    .S_AXI_ARESETN(regspace_s_axi_aresetn),
    .S_AXI_AWADDR(regspace_s_axi_awaddr),
    .S_AXI_AWPROT(regspace_s_axi_awprot),
    .S_AXI_AWVALID(regspace_s_axi_awvalid),
    .S_AXI_AWREADY(regspace_s_axi_awready),
    .S_AXI_WDATA(regspace_s_axi_wdata),
    .S_AXI_WSTRB(regspace_s_axi_wstrb),
    .S_AXI_WVALID(regspace_s_axi_wvalid),
    .S_AXI_WREADY(regspace_s_axi_wready),
    .S_AXI_BRESP(regspace_s_axi_bresp),
    .S_AXI_BVALID(regspace_s_axi_bvalid),
    .S_AXI_BREADY(regspace_s_axi_bready),
    .S_AXI_ARADDR(regspace_s_axi_araddr),
    .S_AXI_ARPROT(regspace_s_axi_arprot),
    .S_AXI_ARVALID(regspace_s_axi_arvalid),
    .S_AXI_ARREADY(regspace_s_axi_arready),
    .S_AXI_RDATA(regspace_s_axi_rdata),
    .S_AXI_RRESP(regspace_s_axi_rresp),
    .S_AXI_RVALID(regspace_s_axi_rvalid),
    .S_AXI_RREADY(regspace_s_axi_rready)
);

endmodule
