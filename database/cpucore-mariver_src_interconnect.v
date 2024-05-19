// This program was cloned from: https://github.com/HIT-MaRiver-mips/cpucore-mariver
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
`include "defs.h"

/*
    By ywy_c_asm
    AXI总线复用模块（试图取代AXI CrossBar）
    Update at 2023.7.9: 将AXI Crossbar取消，使用自己的简单AXI桥，并增加L2 Cache
*/

module interconnect(
    input           clk,
    input           resetn,
    //AXI输出
    //ar
    output[3:0]     arid,
    output[31:0]    araddr,
    output[3:0]     arlen,
    output[2:0]     arsize,
    output[1:0]     arburst,
    output[1:0]     arlock,
    output[3:0]     arcache,
    output[2:0]     arprot,
    output          arvalid,
    input           arready,
    //r
    input[3:0]      rid,
    input[31:0]     rdata,
    input[1:0]      rresp,
    input           rlast,
    input           rvalid,
    output          rready,
    //aw
    output[3:0]     awid,
    output[31:0]    awaddr,
    output[3:0]     awlen,
    output[2:0]     awsize,
    output[1:0]     awburst,
    output[1:0]     awlock,
    output[3:0]     awcache,
    output[2:0]     awprot,
    output          awvalid,
    input           awready,
    //w
    output[3:0]     wid,
    output[31:0]    wdata,
    output[3:0]     wstrb,
    output          wlast,
    output          wvalid,
    input           wready,
    //b
    input[3:0]      bid,
    input[1:0]      bresp,
    input           bvalid,
    output          bready,
    //AXI输入0
    //ar
    input[3:0]     arid0,
    input[31:0]    araddr0,
    input[3:0]     arlen0,
    input[2:0]     arsize0,
    input[1:0]     arburst0,
    input[1:0]     arlock0,
    input[3:0]     arcache0,
    input[2:0]     arprot0,
    input          arvalid0,
    output         arready0,
    //r
    output[3:0]    rid0,
    output[31:0]   rdata0,
    output[1:0]    rresp0,
    output         rlast0,
    output         rvalid0,
    input          rready0,
    //AXI输入1
    //ar
    input[3:0]     arid1,
    input[31:0]    araddr1,
    input[3:0]     arlen1,
    input[2:0]     arsize1,
    input[1:0]     arburst1,
    input[1:0]     arlock1,
    input[3:0]     arcache1,
    input[2:0]     arprot1,
    input          arvalid1,
    output         arready1,
    //r
    output[3:0]    rid1,
    output[31:0]   rdata1,
    output[1:0]    rresp1,
    output         rlast1,
    output         rvalid1,
    input          rready1,
    //aw
    input[3:0]     awid1,
    input[31:0]    awaddr1,
    input[3:0]     awlen1,
    input[2:0]     awsize1,
    input[1:0]     awburst1,
    input[1:0]     awlock1,
    input[3:0]     awcache1,
    input[2:0]     awprot1,
    input          awvalid1,
    output         awready1,
    //w
    input[3:0]     wid1,
    input[31:0]    wdata1,
    input[3:0]     wstrb1,
    input          wlast1,
    input          wvalid1,
    output         wready1,
    //b
    output[3:0]    bid1,
    output[1:0]    bresp1,
    output         bvalid1,
    input          bready1
    );

`ifdef L2_CACHE_ENABLE

`else

    //普通AXI二路读仲裁
    assign awid=awid1;
    assign awaddr=awaddr1;
    assign awlen=awlen1;
    assign awsize=awsize1;
    assign awburst=awburst1;
    assign awlock=awlock1;
    assign awcache=awcache1;
    assign awprot=awprot1;
    assign awvalid=awvalid1;
    assign awready1=awready;
    assign wid=wid1;
    assign wdata=wdata1;
    assign wstrb=wstrb1;
    assign wlast=wlast1;
    assign wvalid=wvalid1;
    assign wready1=wready;
    assign bid1=bid;
    assign bresp1=bresp;
    assign bvalid1=bvalid;
    assign bready=bready1;

    //缓存的ar信息
    reg[3:0]    c_arid[0:1];
    reg[31:0]   c_araddr[0:1];
    reg[3:0]    c_arlen[0:1];
    reg[2:0]    c_arsize[0:1];
    reg[1:0]    c_arburst[0:1];
    reg[1:0]    c_arlock[0:1];
    reg[3:0]    c_arcache[0:1];
    reg[2:0]    c_arprot[0:1];
    reg[1:0]    c_arvalid;
    initial begin
        c_arid[0]=0; c_arid[1]=0;
        c_araddr[0]=0; c_araddr[1]=0;
        c_arlen[0]=0; c_arlen[1]=0;
        c_arsize[0]=0; c_arsize[1]=0;
        c_arburst[0]=0; c_arburst[1]=0;
        c_arlock[0]=0; c_arlock[1]=0;
        c_arcache[0]=0; c_arcache[1]=0;
        c_arprot[0]=0; c_arprot[1]=0;
    end
    always@(posedge clk) begin
        if(~resetn) begin
            c_arvalid<=0;
        end
        else begin
            if(~c_arvalid[0]) begin
                c_arid[0]<=arid0;
                c_araddr[0]<=araddr0;
                c_arlen[0]<=arlen0;
                c_arsize[0]<=arsize0;
                c_arburst[0]<=arburst0;
                c_arlock[0]<=arlock0;
                c_arcache[0]<=arcache0;
                c_arprot[0]<=arprot0;
            end
            if(~c_arvalid[1]) begin
                c_arid[1]<=arid1;
                c_araddr[1]<=araddr1;
                c_arlen[1]<=arlen1;
                c_arsize[1]<=arsize1;
                c_arburst[1]<=arburst1;
                c_arlock[1]<=arlock1;
                c_arcache[1]<=arcache1;
                c_arprot[1]<=arprot1;
            end
            //Note: 当另一个已缓存未释放时，不能缓存请求，当两个都有请求时，优先ar1
            c_arvalid[0]<=(~(arready & c_arvalid[0])) & (c_arvalid[0] | ((~c_arvalid[1]) & arvalid0 & (~arvalid1)));
            c_arvalid[1]<=(~(arready & c_arvalid[1])) & (c_arvalid[1] | ((~c_arvalid[0]) & arvalid1));
        end
    end

    assign arready0=~(c_arvalid[1] | arvalid1);
    assign arready1=~c_arvalid[0];
    assign arid=c_arvalid[1] ? c_arid[1] : c_arid[0];
    assign araddr=c_arvalid[1] ? c_araddr[1] : c_araddr[0];
    assign arlen=c_arvalid[1] ? c_arlen[1] : c_arlen[0];
    assign arsize=c_arvalid[1] ? c_arsize[1] : c_arsize[0];
    assign arburst=c_arvalid[1] ? c_arburst[1] : c_arburst[0];
    assign arlock=c_arvalid[1] ? c_arlock[1] : c_arlock[0];
    assign arcache=c_arvalid[1] ? c_arcache[1] : c_arcache[0];
    assign arprot=c_arvalid[1] ? c_arprot[1] : c_arprot[0];
    assign arvalid=|c_arvalid;

    //数据接收-分发
    reg[31:0]       c_rdata[0:1];
    reg[1:0]        c_rresp[0:1];
    reg[1:0]        c_rlast;
    reg[1:0]        c_rvalid;
    initial begin
        c_rdata[0]=0; c_rdata[1]=0;
        c_rresp[0]=0; c_rresp[1]=0;
    end

    always@(posedge clk) begin
        if(~resetn) begin
            c_rlast<=0;
            c_rvalid<=0;
        end
        else begin
            if(rready & rvalid) begin
                if(rid == 0) begin
                    c_rdata[0]<=rdata;
                    c_rresp[0]<=rresp;
                    c_rlast[0]<=rlast;
                end
                else begin
                    c_rdata[1]<=rdata;
                    c_rresp[1]<=rresp;
                    c_rlast[1]<=rlast;
                end
            end
            if(rready & rvalid & (rid == 0))
                c_rvalid[0]<=1;
            else if(rready0)
                c_rvalid[0]<=0;
            if(rready & rvalid & (rid == 1))
                c_rvalid[1]<=1;
            else if(rready1)
                c_rvalid[1]<=0;
        end
    end

    assign rready=~((c_rvalid[0] & (rid == 0) & ~rready0) | (c_rvalid[1] & (rid == 1) & ~rready1));
    assign rid0=0;
    assign rid1=1;
    assign rdata0=c_rdata[0];
    assign rdata1=c_rdata[1];
    assign rresp0=c_rresp[0];
    assign rresp1=c_rresp[1];
    assign rlast0=c_rlast[0];
    assign rlast1=c_rlast[1];
    assign rvalid0=c_rvalid[0];
    assign rvalid1=c_rvalid[1];


`endif

endmodule