// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_cache_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-24 09:24:56
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-05 16:15:43
*/


/*
	Copyright (c) 2020 - 2021 Ruige Lee <wut.ruigeli@gmail.com>

	 Licensed under the Apache License, Version 2.0 (the "License");
	 you may not use this file except in compliance with the License.
	 You may obtain a copy of the License at

			 http://www.apache.org/licenses/LICENSE-2.0

	 Unless required by applicable law or agreed to in writing, software
	 distributed under the License is distributed on an "AS IS" BASIS,
	 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
	 See the License for the specific language governing permissions and
	 limitations under the License.
*/



`timescale 1 ns / 1 ps

`include "define.vh"


module axi_full_cache_tb
(

);
	reg CLK;
	reg RSTn;




	reg ifu_req_valid;
	reg [31:0] ifu_addr_req;
	reg ifu_rsp_ready;
	reg lsu_req_valid;
	reg [31:0] lsu_addr_req;
	reg [63:0] lsu_wdata_req;
	reg [7:0] lsu_wstrb_req;
	reg lsu_wen_req;
	reg lsu_rsp_ready;

	wire il1_fence;
	wire dl1_fence;
	wire l2c_fence;
	wire l3c_fence;

	wire ifu_req_ready;
	wire [63:0] ifu_data_rsp;
	wire ifu_rsp_valid;
	wire lsu_req_ready;
	wire [31:0] lsu_rdata_rsp;
	wire lsu_rsp_valid;

	wire dl1_fence_end;
	wire l2c_fence_end;
	wire l3c_fence_end;







	reg FENCE;


	wire dl1_fence_set;
	wire dl1_fence_rst;
	wire dl1_fence_qout;


	wire l2c_fence_set;
	wire l2c_fence_rst;
	wire l2c_fence_qout;

	wire l3c_fence_set;
	wire l3c_fence_rst;
	wire l3c_fence_qout;

	assign il1_fence = 1'b0;
	assign dl1_fence_set = FENCE;
	assign dl1_fence_rst = dl1_fence_end;
	assign dl1_fence = dl1_fence_qout;

	assign l2c_fence_set = dl1_fence;
	assign l2c_fence_rst = l2c_fence_end;
	assign l2c_fence = l2c_fence_qout;

	assign l3c_fence_set = dl1_fence;
	assign l3c_fence_rst = l3c_fence_end;
	assign l3c_fence = l3c_fence_qout;

	gen_rsffr #(.DW(1)) dl1_fence_rsffr (.set_in(dl1_fence_set), .rst_in(dl1_fence_rst), .qout(dl1_fence_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) l2c_fence_rsffr (.set_in(l2c_fence_set), .rst_in(l2c_fence_rst), .qout(l2c_fence_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr #(.DW(1)) l3c_fence_rsffr (.set_in(l3c_fence_set), .rst_in(l3c_fence_rst), .qout(l3c_fence_qout), .CLK(CLK), .RSTn(RSTn));



	wire [63:0] S_AXI_AWADDR;
	wire [7:0] S_AXI_AWLEN;
	wire [2:0] S_AXI_AWSIZE;
	wire [1:0] S_AXI_AWBURST;
	wire S_AXI_AWVALID;
	wire S_AXI_AWREADY;

	wire [63:0] S_AXI_WDATA;
	wire [7:0] S_AXI_WSTRB;
	wire S_AXI_WLAST;
	wire S_AXI_WVALID;
	wire S_AXI_WREADY;

	wire [1:0] S_AXI_BRESP;
	wire S_AXI_BVALID;
	wire S_AXI_BREADY;

	wire [63:0] S_AXI_ARADDR;
	wire [7:0] S_AXI_ARLEN;
	wire [2:0] S_AXI_ARSIZE;
	wire [1:0] S_AXI_ARBURST;
	wire S_AXI_ARVALID;
	wire S_AXI_ARREADY;

	wire [63:0] S_AXI_RDATA;
	wire [1:0] S_AXI_RRESP;
	wire S_AXI_RLAST;
	wire S_AXI_RVALID;
	wire S_AXI_RREADY;





cache s_cache(

	.ifu_req_valid(ifu_req_valid),
	.ifu_req_ready(ifu_req_ready),
	.ifu_addr_req (ifu_addr_req),
	.ifu_data_rsp (ifu_data_rsp),
	.ifu_rsp_valid(ifu_rsp_valid),
	.ifu_rsp_ready(ifu_rsp_ready),
	.lsu_req_valid(lsu_req_valid),
	.lsu_req_ready(lsu_req_ready),
	.lsu_addr_req (lsu_addr_req),
	.lsu_wdata_req(lsu_wdata_req),
	.lsu_wstrb_req(lsu_wstrb_req),
	.lsu_wen_req  (lsu_wen_req),
	.lsu_rdata_rsp(lsu_rdata_rsp),
	.lsu_rsp_valid(lsu_rsp_valid),
	.lsu_rsp_ready(lsu_rsp_ready),



	.MEM_AWID(),
	.MEM_AWADDR(S_AXI_AWADDR),
	.MEM_AWLEN(S_AXI_AWLEN),
	.MEM_AWSIZE(S_AXI_AWSIZE),
	.MEM_AWBURST(S_AXI_AWBURST),
	.MEM_AWLOCK(),
	.MEM_AWCACHE(),
	.MEM_AWPROT(),
	.MEM_AWQOS(),
	.MEM_AWUSER(),
	.MEM_AWVALID(S_AXI_AWVALID),
	.MEM_AWREADY(S_AXI_AWREADY),

	.MEM_WDATA(S_AXI_WDATA),
	.MEM_WSTRB(S_AXI_WSTRB),
	.MEM_WLAST(S_AXI_WLAST),
	.MEM_WUSER(),
	.MEM_WVALID(S_AXI_WVALID),
	.MEM_WREADY(S_AXI_WREADY),

	.MEM_BID(1'b0),
	.MEM_BRESP(S_AXI_BRESP),
	.MEM_BUSER(1'b0),
	.MEM_BVALID(S_AXI_BVALID),
	.MEM_BREADY(S_AXI_BREADY),

	.MEM_ARID(),
	.MEM_ARADDR(S_AXI_ARADDR),
	.MEM_ARLEN(S_AXI_ARLEN),
	.MEM_ARSIZE(S_AXI_ARSIZE),
	.MEM_ARBURST(S_AXI_ARBURST),
	.MEM_ARLOCK(),
	.MEM_ARCACHE(),
	.MEM_ARPROT(),
	.MEM_ARQOS(),
	.MEM_ARUSER(),
	.MEM_ARVALID(S_AXI_ARVALID),
	.MEM_ARREADY(S_AXI_ARREADY),

	.MEM_RID(1'b0),
	.MEM_RDATA(S_AXI_RDATA),
	.MEM_RRESP(S_AXI_RRESP),
	.MEM_RLAST(S_AXI_RLAST),
	.MEM_RUSER(1'b0),
	.MEM_RVALID(S_AXI_RVALID),
	.MEM_RREADY(S_AXI_RREADY),

	.il1_fence(il1_fence),
	.dl1_fence(dl1_fence),
	.l2c_fence(l2c_fence),
	.l3c_fence(l3c_fence),
	.dl1_fence_end(dl1_fence_end),
	.l2c_fence_end(l2c_fence_end),
	.l3c_fence_end(l3c_fence_end),

	.CLK(CLK),
	.RSTn(RSTn)

);



axi_full_slv_sram s_axi_full_slv_sram
(

	.S_AXI_AWADDR(S_AXI_AWADDR[31:0]),
	.S_AXI_AWLEN(S_AXI_AWLEN),
	.S_AXI_AWSIZE(S_AXI_AWSIZE),
	.S_AXI_AWBURST(S_AXI_AWBURST),
	.S_AXI_AWVALID(S_AXI_AWVALID),
	.S_AXI_AWREADY(S_AXI_AWREADY),

	.S_AXI_WDATA(S_AXI_WDATA),
	.S_AXI_WSTRB(S_AXI_WSTRB),
	.S_AXI_WLAST(S_AXI_WLAST),
	.S_AXI_WVALID(S_AXI_WVALID),
	.S_AXI_WREADY(S_AXI_WREADY),

	.S_AXI_BRESP(S_AXI_BRESP),
	.S_AXI_BVALID(S_AXI_BVALID),
	.S_AXI_BREADY(S_AXI_BREADY),

	.S_AXI_ARADDR(S_AXI_ARADDR[31:0]),
	.S_AXI_ARLEN(S_AXI_ARLEN),
	.S_AXI_ARSIZE(S_AXI_ARSIZE),
	.S_AXI_ARBURST(S_AXI_ARBURST),
	.S_AXI_ARVALID(S_AXI_ARVALID),
	.S_AXI_ARREADY(S_AXI_ARREADY),

	.S_AXI_RDATA(S_AXI_RDATA),
	.S_AXI_RRESP(S_AXI_RRESP),
	.S_AXI_RLAST(S_AXI_RLAST),
	.S_AXI_RVALID(S_AXI_RVALID),
	.S_AXI_RREADY(S_AXI_RREADY),

	.CLK(CLK),
	.RSTn(RSTn)
);



initial
begin
	$dumpfile("../build/wave.vcd"); //生成的vcd文件名称
	$dumpvars(0, axi_full_cache_tb);//tb模块名称
end



initial begin

	CLK = 0;
	RSTn = 0;

	#20

	RSTn <= 1;

	#80000
			$display("Time Out !!!");
	 $finish;
end

initial begin
	forever begin 
		#5 CLK <= ~CLK;
	end
end

initial begin

	ifu_req_valid = 1'b0;
	ifu_addr_req = 32'd0;
	ifu_rsp_ready = 1'b1;

	lsu_req_valid = 1'd0;
	lsu_addr_req = 32'd0;
	lsu_wdata_req = 64'd0;
	lsu_wstrb_req = 8'hff;
	lsu_wen_req = 1'b0;
	lsu_rsp_ready = 1'b1;

	FENCE = 1'b0;

#23

	ifu_req_valid = 1'b1;
	lsu_req_valid = 1'd1;
	lsu_wen_req = 1'b1;
	lsu_wdata_req = 64'haa;
	lsu_addr_req = 32'h18;


#10

	ifu_req_valid = 1'b0;
	lsu_req_valid = 1'd0;
	lsu_wen_req = 1'b0;


#2000

	ifu_req_valid = 1'b1;
	ifu_addr_req = 32'h18;

	lsu_req_valid = 1'd1;
	lsu_wen_req = 1'b0;
	lsu_wdata_req = 64'haa;
	lsu_addr_req = 32'h80000018;
#10

	ifu_req_valid = 1'b0;
	lsu_req_valid = 1'd0;
	lsu_wen_req = 1'b0;


#4000
	FENCE = 1'b1;

#10
	FENCE = 1'b0;

end

endmodule




