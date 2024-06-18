// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: dcache_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-04 10:38:19
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-04 14:27:37
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

module dcache_tb (

);

	reg lsu_req_valid;
	reg [31:0] lsu_addr_req;
	reg [63:0] lsu_wdata_req;
	reg [7:0] lsu_wstrb_req;
	reg lsu_wen_req;
	reg lsu_rsp_ready;	

	wire lsu_req_ready;
	wire [31:0] lsu_rdata_rsp;
	wire lsu_rsp_valid;




	reg dl1_fence;
	reg CLK;
	reg RSTn;





	wire [31:0] DL1_AWADDR;
	wire [7:0] DL1_AWLEN;
	wire [1:0] DL1_AWBURST;
	wire DL1_AWVALID;
	wire DL1_AWREADY;

	wire [63:0] DL1_WDATA;
	wire [7:0] DL1_WSTRB;
	wire DL1_WLAST;
	wire DL1_WVALID;
	wire DL1_WREADY;

	wire [1:0] DL1_BRESP;
	wire DL1_BVALID;
	wire DL1_BREADY;

	wire [31:0] DL1_ARADDR;
	wire [7:0] DL1_ARLEN;
	wire [1:0] DL1_ARBURST;
	wire DL1_ARVALID;
	wire DL1_ARREADY;

	wire [63:0] DL1_RDATA;
	wire [1:0] DL1_RRESP;
	wire DL1_RLAST;
	wire DL1_RVALID;
	wire DL1_RREADY;



dcache i_dcache
(
	.DL1_AWADDR(DL1_AWADDR),
	.DL1_AWLEN(DL1_AWLEN),
	.DL1_AWBURST(DL1_AWBURST),
	.DL1_AWVALID(DL1_AWVALID),
	.DL1_AWREADY(DL1_AWREADY),

	.DL1_WDATA(DL1_WDATA),
	.DL1_WSTRB(DL1_WSTRB),
	.DL1_WLAST(DL1_WLAST),
	.DL1_WVALID(DL1_WVALID),
	.DL1_WREADY(DL1_WREADY),

	.DL1_BRESP(DL1_BRESP),
	.DL1_BVALID(DL1_BVALID),
	.DL1_BREADY(DL1_BREADY),

	.DL1_ARADDR(DL1_ARADDR),
	.DL1_ARLEN(DL1_ARLEN),
	.DL1_ARBURST(DL1_ARBURST),
	.DL1_ARVALID(DL1_ARVALID),
	.DL1_ARREADY(DL1_ARREADY),

	.DL1_RDATA(DL1_RDATA),
	.DL1_RRESP(DL1_RRESP),
	.DL1_RLAST(DL1_RLAST),
	.DL1_RVALID(DL1_RVALID),
	.DL1_RREADY(DL1_RREADY),

	//from lsu
	.lsu_req_valid(lsu_req_valid),
	.lsu_req_ready(lsu_req_ready),
	.lsu_addr_req(lsu_addr_req),
	.lsu_wdata_req(lsu_wdata_req),
	.lsu_wstrb_req(lsu_wstrb_req),
	.lsu_wen_req(lsu_wen_req),

	.lsu_rdata_rsp(lsu_rdata_rsp),
	.lsu_rsp_valid(lsu_rsp_valid),
	.lsu_rsp_ready(lsu_rsp_ready),



	.dl1_fence(dl1_fence),
	.CLK(CLK),
	.RSTn(RSTn)
);




axi_full_slv_sram s_axi_full_slv_sram
(

	.S_AXI_AWADDR(DL1_AWADDR),
	.S_AXI_AWLEN(DL1_AWLEN),
	.S_AXI_AWSIZE(3'd3),
	.S_AXI_AWBURST(DL1_AWBURST),
	.S_AXI_AWVALID(DL1_AWVALID),
	.S_AXI_AWREADY(DL1_AWREADY),

	.S_AXI_WDATA(DL1_WDATA),
	.S_AXI_WSTRB(DL1_WSTRB),
	.S_AXI_WLAST(DL1_WLAST),
	.S_AXI_WVALID(DL1_WVALID),
	.S_AXI_WREADY(DL1_WREADY),

	.S_AXI_BRESP(DL1_BRESP),
	.S_AXI_BVALID(DL1_BVALID),
	.S_AXI_BREADY(DL1_BREADY),

	.S_AXI_ARADDR(DL1_ARADDR),
	.S_AXI_ARLEN(DL1_ARLEN),
	.S_AXI_ARSIZE(3'd3),
	.S_AXI_ARBURST(DL1_ARBURST),
	.S_AXI_ARVALID(DL1_ARVALID),
	.S_AXI_ARREADY(DL1_ARREADY),

	.S_AXI_RDATA(DL1_RDATA),
	.S_AXI_RRESP(DL1_RRESP),
	.S_AXI_RLAST(DL1_RLAST),
	.S_AXI_RVALID(DL1_RVALID),
	.S_AXI_RREADY(DL1_RREADY),

	.CLK(CLK),
	.RSTn(RSTn)
);



initial
begin
	$dumpfile("../build/wave.vcd"); //生成的vcd文件名称
	$dumpvars(0, dcache_tb);//tb模块名称
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

	lsu_addr_req = 32'h18;
	lsu_wdata_req = 8'haa;
	lsu_wstrb_req = 8'hff;
	lsu_wen_req = 1'b0;

	lsu_rsp_ready = 1'b1;	
	lsu_req_valid = 1'b0;
	dl1_fence = 1'b0;
#100
	
#22
	lsu_req_valid = 1'b1;
	lsu_wen_req = 1'b0;
#10
	lsu_req_valid = 1'b0;
	lsu_wen_req = 1'b0;

#1000
	lsu_req_valid = 1'b1;
	lsu_wen_req = 1'b1;

#10
	lsu_req_valid = 1'b0;
	lsu_wen_req = 1'b0;

	#1000
	lsu_req_valid = 1'b1;
	lsu_wen_req = 1'b0;

#10
	lsu_req_valid = 1'b0;
	lsu_wen_req = 1'b0;
end




endmodule



