module axi_slave_stub(

    output S2M_AXI_ACLK,

    // Read interface
    input S2M_AXI_ARVALID,
    output S2M_AXI_ARREADY,
    input [31:0] S2M_AXI_ARADDR,
    input [11:0] S2M_AXI_ARID,

    output S2M_AXI_RVALID,
    input S2M_AXI_RREADY,
    output S2M_AXI_RLAST,
    output [31:0] S2M_AXI_RDATA,
    output [11:0] S2M_AXI_RID,

    output [1:0] S2M_AXI_RRESP,

    //write interface
    input S2M_AXI_AWVALID,
    output S2M_AXI_AWREADY,
    input [31:0] S2M_AXI_AWADDR,
    input [11:0] S2M_AXI_AWID,

    input S2M_AXI_WVALID,
    output S2M_AXI_WREADY,
    input [31:0] S2M_AXI_WDATA,
    input [3:0] S2M_AXI_WSTRB,

    output S2M_AXI_BVALID,
    input S2M_AXI_BREADY,
    output [1:0] S2M_AXI_BRESP,
    output [11:0] S2M_AXI_BID
);
    
    assign S2M_AXI_ACLK = 1'b0;
    // Read interface
    assign S2M_AXI_ARREADY = 1'b0;
    assign S2M_AXI_RVALID = 1'b0;
    assign S2M_AXI_RLAST = 1'b0;
    assign S2M_AXI_RDATA = 32'b0;
    assign S2M_AXI_RID = 12'b0;
    assign S2M_AXI_RRESP = 2'b0;

    //write interface
    assign S2M_AXI_AWREADY = 1'b0;
    assign S2M_AXI_WREADY = 1'b0;
    assign S2M_AXI_BVALID = 1'b0;
    assign S2M_AXI_BRESP = 2'b0;
    assign S2M_AXI_BID = 12'b0;


endmodule : axi_slave_stub


/*

    axi_slave_stub axi_slave_XXX_stub(    
        .S2M_AXI_ACLK\(S2M_XXX_AXI_ACLK),
        // Read interface
        .S2M_AXI_ARVALID(S2M_XXX_AXI_ARVALID),
        .S2M_AXI_ARREADY(S2M_XXX_AXI_ARREADY),
        .S2M_AXI_ARADDR(S2M_XXX_AXI_ARADDR[31:0]),
        .S2M_AXI_ARID(S2M_XXX_AXI_ARID[11:0]),

        .S2M_AXI_RVALID(S2M_XXX_AXI_RVALID),
        .S2M_AXI_RREADY(S2M_XXX_AXI_RREADY),
        .S2M_AXI_RLAST(S2M_XXX_AXI_RLAST),
        .S2M_AXI_RDATA(S2M_XXX_AXI_RDATA[31:0]),
        .S2M_AXI_RID(S2M_XXX_AXI_RID[11:0]),

        .S2M_AXI_RRESP(S2M_XXX_AXI_RRESP[1:0]),

        //write interface
        .S2M_AXI_AWVALID(S2M_XXX_AXI_AWVALID),
        .S2M_AXI_AWREADY(S2M_XXX_AXI_AWREADY),
        .S2M_AXI_AWADDR(S2M_XXX_AXI_AWADDR[31:0]),
        .S2M_AXI_AWID(S2M_XXX_AXI_AWID[11:0]),

        .S2M_AXI_WVALID(S2M_XXX_AXI_WVALID),
        .S2M_AXI_WREADY(S2M_XXX_AXI_WREADY),
        .S2M_AXI_WDATA(S2M_XXX_AXI_WDATA[31:0]),
        .S2M_AXI_WSTRB(S2M_XXX_AXI_WSTRB[3:0]),

        .S2M_AXI_BVALID(S2M_XXX_AXI_BVALID),
        .S2M_AXI_BREADY(S2M_XXX_AXI_BREADY),
        .S2M_AXI_BRESP(S2M_XXX_AXI_BRESP[1:0]),
        .S2M_AXI_BID(S2M_XXX_AXI_BID[11:0])
    );

*/

