// This program was cloned from: https://github.com/jameshegarty/rigel
// License: MIT License

module axi_master_write_stub(
    output M2S_AXI_ACLK,


    // Write Transaction
    output M2S_AXI_AWVALID,
    input M2S_AXI_AWREADY,
    output [31:0] M2S_AXI_AWADDR,
    output [1:0] M2S_AXI_AWBURST,
    output [3:0] M2S_AXI_AWLEN,
    output [1:0] M2S_AXI_AWSIZE,
    //
    output M2S_AXI_WVALID,
    input M2S_AXI_WREADY,
    output M2S_AXI_WLAST,
    output [63:0] M2S_AXI_WDATA,
    output [7:0] M2S_AXI_WSTRB,
    //
    input M2S_AXI_BVALID,
    output M2S_AXI_BREADY,
    input [1:0] M2S_AXI_BRESP

);
    assign M2S_AXI_ACLK = 1'b0;

    // Write Transaction
    assign M2S_AXI_AWVALID = 1'b0;
    assign M2S_AXI_AWADDR = 33'b0;
    assign M2S_AXI_AWBURST = 2'b0;
    assign M2S_AXI_AWLEN = 4'b0;
    assign M2S_AXI_AWSIZE = 2'b0;
    assign M2S_AXI_WVALID = 1'b0;
    assign M2S_AXI_WLAST = 1'b0;
    assign M2S_AXI_WDATA = 64'b0;
    assign M2S_AXI_WSTRB = 8'b0;
    assign M2S_AXI_BREADY = 1'b0;


endmodule : axi_master_write_stub


/*

    axi_master_stub axi_master_XXX_stub (
        .M2S_AXI_ACLK(M2S_XXX_AXI_ACLK),

        // Write Transaction
        .M2S_AXI_AWVALID(M2S_XXX_AXI_AWVALID),
        .M2S_AXI_AWREADY(M2S_XXX_AXI_AWREADY),
        .M2S_AXI_AWADDR(M2S_XXX_AXI_AWADDR[31:0]),
        .M2S_AXI_AWBURST(M2S_XXX_AXI_AWBURST[1:0]),
        .M2S_AXI_AWLEN(M2S_XXX_AXI_AWLEN[3:0]),
        .M2S_AXI_AWSIZE(M2S_XXX_AXI_AWSIZE[1:0]),
        //
        .M2S_AXI_WVALID(M2S_XXX_AXI_WVALID),
        .M2S_AXI_WREADY(M2S_XXX_AXI_WREADY),
        .M2S_AXI_WLAST(M2S_XXX_AXI_WLAST),
        .M2S_AXI_WDATA(M2S_XXX_AXI_WDATA[63:0]),
        .M2S_AXI_WSTRB(M2S_XXX_AXI_WSTRB[7:0]),
        //
        .M2S_AXI_BVALID(M2S_XXX_AXI_BVALID),
        .M2S_AXI_BREADY(M2S_XXX_AXI_BREADY),
        .M2S_AXI_BRESP(M2S_XXX_AXI_BRESP[1:0])
    );

*/
