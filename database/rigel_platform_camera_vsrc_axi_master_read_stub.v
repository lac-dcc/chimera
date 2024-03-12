module axi_master_read_stub(
    output M2S_AXI_ACLK,

    //Read M2S_AXI_transation

    output M2S_AXI_ARVALID,
    input M2S_AXI_ARREADY,
    output [31:0] M2S_AXI_ARADDR,
    output [1:0] M2S_AXI_ARBURST,
    output [3:0] M2S_AXI_ARLEN,
    output [1:0] M2S_AXI_ARSIZE,
    //
    input M2S_AXI_RVALID,
    output M2S_AXI_RREADY,
    input M2S_AXI_RLAST,
    input [63:0] M2S_AXI_RDATA,
    //
    input [1:0] M2S_AXI_RRESP

);
    assign M2S_AXI_ACLK = 1'b0;

    //Read M2S_AXI_transation

    assign M2S_AXI_ARVALID = 1'b0;
    assign M2S_AXI_ARADDR = 32'b0;
    assign M2S_AXI_ARBURST = 2'b0;
    assign M2S_AXI_ARLEN = 4'b0;
    assign M2S_AXI_ARSIZE = 2'b0;
    assign M2S_AXI_RREADY = 1'b0;


endmodule : axi_master_read_stub

/*

    axi_master_stub axi_master_XXX_stub (
        .M2S_AXI_ACLK(M2S_XXX_AXI_ACLK),

        //Read Transaction

        .M2S_AXI_ARVALID(M2S_XXX_AXI_ARVALID),
        .M2S_AXI_ARREADY(M2S_XXX_AXI_ARREADY),
        .M2S_AXI_ARADDR(M2S_XXX_AXI_ARADDR[31:0]),
        .M2S_AXI_ARBURST(M2S_XXX_AXI_ARBURST[1:0]),
        .M2S_AXI_ARLEN(M2S_XXX_AXI_ARLEN[3:0]),
        .M2S_AXI_ARSIZE(M2S_XXX_AXI_ARSIZE[1:0]),
        //
        .M2S_AXI_RVALID(M2S_XXX_AXI_RVALID),
        .M2S_AXI_RREADY(M2S_XXX_AXI_RREADY),
        .M2S_AXI_RLAST(M2S_XXX_AXI_RLAST),
        .M2S_AXI_RDATA(M2S_XXX_AXI_RDATA[63:0]),
        //
        .M2S_AXI_RRESP(M2S_XXX_AXI_RRESP[1:0])
    );

*/
