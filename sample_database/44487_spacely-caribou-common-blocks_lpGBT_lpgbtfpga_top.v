// This program was cloned from: https://github.com/SpacelyProject/spacely-caribou-common-blocks
// License: Apache License 2.0

module lpgbtfpga_top #(
    // Width of S_AXI data bus
    parameter integer C_S_AXI_DATA_WIDTH  = 32,
    // Width of S_AXI address bus
    parameter integer C_S_AXI_ADDR_WIDTH  = 11
)(


    // INPUT HIGH SPEED DATA AND CLOCKS
    input wire 			       SMA_MGT_REFCLK_P, SMA_MGT_REFCLK_N,
    input wire 			       USER_CLOCK_P, USER_CLOCK_N,
    input wire 			       SFP0_RX_P, SFP0_RX_N,



    //  DATA OUT INTERFACE

    output wire 			       clk40_o,
    output wire 			       uplinkrdy_o,
    output wire [233:0] 		       uplinkUserData_o,
    output wire 			       uplinkFEC_o,



    //////////////////////////////
    //    AXI BUS SIGNALS       //
    //////////////////////////////

    //	Global Clock Signal
    input wire 			       S_AXI_ACLK,
    // Global Reset Signal. This Signal is Active LOW
    input wire 			       S_AXI_ARESETN,
    // Write address (issued by master, accepted by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_AWADDR,
    // Write channel Protection type. This signal indicates the
    // privilege and security level of the transaction, and whether
    // the transaction is a data access or an instruction access.
    input wire [2 : 0] 		       S_AXI_AWPROT,
    // Write address valid. This signal indicates that the master signaling
    // valid write address and control information.
    input wire 			       S_AXI_AWVALID,
    // Write address ready. This signal indicates that the slave is ready
    // to accept an address and associated control signals.
    output wire 			       S_AXI_AWREADY,
    // Write data (issued by master, accepted by Slave)
    input wire [C_S_AXI_DATA_WIDTH-1 : 0]     S_AXI_WDATA,
    // Write strobes. This signal indicates which byte lanes hold
    // valid data. There is one write strobe bit for each eight
    // bits of the write data bus.
    input wire [(C_S_AXI_DATA_WIDTH/8)-1 : 0] S_AXI_WSTRB,
    // Write valid. This signal indicates that valid write
    // data and strobes are available.
    input wire 			       S_AXI_WVALID,
    // Write ready. This signal indicates that the slave
    // can accept the write data.
    output wire 			       S_AXI_WREADY,
    // Write response. This signal indicates the status
    // of the write transaction.
    output wire [1 : 0] 		       S_AXI_BRESP,
    // Write response valid. This signal indicates that the channel
    // is signaling a valid write response.
    output wire 			       S_AXI_BVALID,
    // Response ready. This signal indicates that the master
    // can accept a write response.
    input wire 			       S_AXI_BREADY,
    // Read address (issued by master, accepted by Slave)
    input wire [C_S_AXI_ADDR_WIDTH-1 : 0]     S_AXI_ARADDR,
    // Protection type. This signal indicates the privilege
    // and security level of the transaction, and whether the
    // transaction is a data access or an instruction access.
    input wire [2 : 0] 		       S_AXI_ARPROT,
    // Read address valid. This signal indicates that the channel
    // is signaling valid read address and control information.
    input wire 			       S_AXI_ARVALID,
    // Read address ready. This signal indicates that the slave is
    // ready to accept an address and associated control signals.
    output wire 			       S_AXI_ARREADY,
    // Read data (issued by slave)
    output wire [C_S_AXI_DATA_WIDTH-1 : 0]    S_AXI_RDATA,
    // Read response. This signal indicates the status of the
    // read transfer.
    output wire [1 : 0] 		       S_AXI_RRESP,
    // Read valid. This signal indicates that the channel is
    // signaling the required read data.
    output wire 			       S_AXI_RVALID,
    // Read ready. This signal indicates that the master can
    // accept the read data and response information.
    input wire 			       S_AXI_RREADY


);

   lpgbtfpga_with_interface inst1 (.SMA_MGT_REFCLK_P(SMA_MGT_REFCLK_P),
    .SMA_MGT_REFCLK_N(SMA_MGT_REFCLK_N),
    .USER_CLOCK_P(USER_CLOCK_P),
    .USER_CLOCK_N(USER_CLOCK_N),
    .SFP0_RX_P(SFP0_RX_P),
    .SFP0_RX_N(SFP0_RX_N),
    .clk40_o(clk40_o),
    .uplinkrdy_o(uplinkrdy_o),
    .uplinkUserData_o(uplinkUserData_o),
    .uplinkFEC_o(uplinkFEC_o),
    .S_AXI_ACLK(S_AXI_ACLK),
    .S_AXI_ARESETN(S_AXI_ARESETN),
    .S_AXI_AWADDR(S_AXI_AWADDR),
    .S_AXI_AWPROT(S_AXI_AWPROT),
    .S_AXI_AWVALID(S_AXI_AWVALID),
    .S_AXI_AWREADY(S_AXI_AWREADY),
    .S_AXI_WDATA(S_AXI_WDATA),
    .S_AXI_WSTRB(S_AXI_WSTRB),
    .S_AXI_WVALID(S_AXI_WVALID),
    .S_AXI_WREADY(S_AXI_WREADY),
    .S_AXI_BRESP(S_AXI_BRESP),
    .S_AXI_BVALID(S_AXI_BVALID),
    .S_AXI_BREADY(S_AXI_BREADY),
    .S_AXI_ARADDR(S_AXI_ARADDR),
    .S_AXI_ARPROT(S_AXI_ARPROT),
    .S_AXI_ARVALID(S_AXI_ARVALID),
    .S_AXI_ARREADY(S_AXI_ARREADY),
    .S_AXI_RDATA(S_AXI_RDATA),
    .S_AXI_RRESP(S_AXI_RRESP),
    .S_AXI_RVALID(S_AXI_RVALID),
    .S_AXI_RREADY(S_AXI_RREADY));

endmodule //lpgbtfpga_top

  
