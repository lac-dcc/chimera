// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_l2l3c_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-24 09:24:56
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-01 16:26:50
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


module axi_full_l2l3c_tb
(

);
	reg CLK;
	reg RSTn;

	reg L2_FENCE;
	reg L3_FENCE;




	wire IL1_ARVALID = il1_arvalid_qout;
	wire IL1_RREADY = il1_rready_qout;
	wire [1:0] IL1_ARBURST = 2'b01;
	reg [2:0] IL1_ARSIZE;
	reg [7:0] IL1_ARLEN;
	reg [31:0] IL1_ARADDR;


	reg il1_start_single_burst_read;

	wire IL1_ARREADY;
	wire [63:0] IL1_RDATA;
	wire [1:0] IL1_RRESP;
	wire IL1_RLAST;
	wire IL1_RVALID;





	wire il1_arvalid_set, il1_arvalid_rst, il1_arvalid_qout;
	wire [7:0] il1_read_index_dnxt;
	wire [7:0] il1_read_index_qout;
	wire il1_rready_set, il1_rready_rst, il1_rready_qout;
	wire il1_rnext;


	assign il1_arvalid_set = ~il1_arvalid_qout & il1_start_single_burst_read;
	assign il1_arvalid_rst = il1_arvalid_qout & IL1_ARREADY ;
	gen_rsffr il1_arvalid_rsffr (.set_in(il1_arvalid_set), .rst_in(il1_arvalid_rst), .qout(il1_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign il1_rnext = IL1_RVALID && il1_rready_qout;



	assign il1_read_index_dnxt = il1_start_single_burst_read ? 8'd0 :
								(
									(il1_rnext & (il1_read_index_qout != IL1_ARLEN)) ? (il1_read_index_qout + 8'd1) : il1_read_index_qout
								);              
	gen_dffr # (.DW(8)) il1_read_index_dffr (.dnxt(il1_read_index_dnxt), .qout(il1_read_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign il1_rready_set = IL1_RVALID & (~IL1_RLAST | ~il1_rready_qout);
	assign il1_rready_rst = IL1_RVALID &   IL1_RLAST &  il1_rready_qout;
	gen_rsffr il1_rready_rsffr (.set_in(il1_rready_set), .rst_in(il1_rready_rst), .qout(il1_rready_qout), .CLK(CLK), .RSTn(RSTn));


















// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 
// 








	wire DL1_ARVALID = dl1_arvalid_qout;
	wire DL1_RREADY = dl1_rready_qout;
	wire [1:0] DL1_AWBURST = 2'b00;
	wire [1:0] DL1_ARBURST = 2'b01;
	reg [2:0] DL1_AWSIZE;
	reg [2:0] DL1_ARSIZE;
	reg [7:0] DL1_AWLEN;
	reg [7:0] DL1_ARLEN;
	reg [31:0] DL1_AWADDR;
	reg [31:0] DL1_ARADDR;
	reg [7:0] DL1_WSTRB;

	reg dl1_start_single_burst_read, dl1_start_single_burst_write;

	wire DL1_ARREADY;
	wire [63:0] DL1_RDATA;
	wire [1:0] DL1_RRESP;
	wire DL1_RLAST;
	wire DL1_RVALID;
	wire DL1_AWREADY;
	reg [63:0] DL1_WDATA;
	wire DL1_WREADY;
	wire [1:0] DL1_BRESP;
	wire DL1_BVALID;

	wire DL1_AWVALID = dl1_awvalid_qout;
	wire DL1_WLAST = dl1_wlast_qout;
	wire DL1_WVALID = dl1_wvalid_qout;
	wire DL1_BREADY = dl1_bready_qout;

	wire dl1_awvalid_set, dl1_awvalid_rst, dl1_awvalid_qout;
	wire dl1_wvalid_set, dl1_wvalid_rst, dl1_wvalid_qout;
	wire dl1_wlast_set, dl1_wlast_rst, dl1_wlast_qout;
	wire [7:0] dl1_write_index_dnxt;
	wire [7:0] dl1_write_index_qout;
	wire dl1_bready_set, dl1_bready_rst, dl1_bready_qout;
	wire dl1_arvalid_set, dl1_arvalid_rst, dl1_arvalid_qout;
	wire [7:0] dl1_read_index_dnxt;
	wire [7:0] dl1_read_index_qout;
	wire dl1_rready_set, dl1_rready_rst, dl1_rready_qout;
	wire dl1_wnext, dl1_rnext;



	assign dl1_awvalid_set = ~dl1_awvalid_qout & dl1_start_single_burst_write;
	assign dl1_awvalid_rst =  dl1_awvalid_qout & DL1_AWREADY ;
	gen_rsffr dl1_awvalid_rsffr (.set_in(dl1_awvalid_set), .rst_in(dl1_awvalid_rst), .qout(dl1_awvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_wnext = DL1_WREADY & dl1_wvalid_qout;

	assign dl1_wvalid_set = (~dl1_wvalid_qout & dl1_start_single_burst_write);
	assign dl1_wvalid_rst = (dl1_wnext & dl1_wlast_qout) ;
	gen_rsffr dl1_wvalid_rsffr (.set_in(dl1_wvalid_set), .rst_in(dl1_wvalid_rst), .qout(dl1_wvalid_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_wlast_set = ((dl1_write_index_qout == DL1_AWLEN-1 & DL1_AWLEN >= 1) & dl1_wnext) || (DL1_AWLEN == 0 );
	assign dl1_wlast_rst = ~dl1_wlast_set & ( dl1_wnext | (dl1_wlast_qout & DL1_AWLEN == 0) );
	gen_rsffr dl1_wlast_rsffr (.set_in(dl1_wlast_set), .rst_in(dl1_wlast_rst), .qout(dl1_wlast_qout), .CLK(CLK), .RSTn(RSTn));

	assign dl1_write_index_dnxt = dl1_start_single_burst_write ? 8'd0 :
								(
									(dl1_wnext & (dl1_write_index_qout != DL1_AWLEN)) ? (dl1_write_index_qout + 8'd1) : dl1_write_index_qout
								);              
	gen_dffr # (.DW(8)) dl1_write_index_dffr (.dnxt(dl1_write_index_dnxt), .qout(dl1_write_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign dl1_bready_set = (DL1_BVALID && ~dl1_bready_qout);
	assign dl1_bready_rst = dl1_bready_qout;
	gen_rsffr dl1_bready_rsffr (.set_in(dl1_bready_set), .rst_in(dl1_bready_rst), .qout(dl1_bready_qout), .CLK(CLK), .RSTn(RSTn));
	


	assign dl1_arvalid_set = ~dl1_arvalid_qout & dl1_start_single_burst_read;
	assign dl1_arvalid_rst = dl1_arvalid_qout & DL1_ARREADY ;
	gen_rsffr dl1_arvalid_rsffr (.set_in(dl1_arvalid_set), .rst_in(dl1_arvalid_rst), .qout(dl1_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign dl1_rnext = DL1_RVALID && dl1_rready_qout;



	assign dl1_read_index_dnxt = dl1_start_single_burst_read ? 8'd0 :
								(
									(dl1_rnext & (dl1_read_index_qout != DL1_ARLEN)) ? (dl1_read_index_qout + 8'd1) : dl1_read_index_qout
								);              
	gen_dffr # (.DW(8)) dl1_read_index_dffr (.dnxt(dl1_read_index_dnxt), .qout(dl1_read_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign dl1_rready_set = DL1_RVALID & (~DL1_RLAST | ~dl1_rready_qout);
	assign dl1_rready_rst = DL1_RVALID &   DL1_RLAST &  dl1_rready_qout;
	gen_rsffr dl1_rready_rsffr (.set_in(dl1_rready_set), .rst_in(dl1_rready_rst), .qout(dl1_rready_qout), .CLK(CLK), .RSTn(RSTn));







//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------
//-------------------------------------------------------------------------------------------




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

	//L1 I Cache
	.IL1_L2C_ARADDR(IL1_ARADDR),
	.IL1_L2C_ARLEN(IL1_ARLEN),
	.IL1_L2C_ARBURST(IL1_ARBURST),
	.IL1_L2C_ARVALID(IL1_ARVALID),
	.IL1_L2C_ARREADY(IL1_ARREADY),

	.IL1_L2C_RDATA(IL1_RDATA),
	.IL1_L2C_RRESP(IL1_RRESP),
	.IL1_L2C_RLAST(IL1_RLAST),
	.IL1_L2C_RVALID(IL1_RVALID),
	.IL1_L2C_RREADY(IL1_RREADY),

	//L1 D cache
	.DL1_L2C_AWADDR(DL1_AWADDR),
	.DL1_L2C_AWLEN(DL1_AWLEN),
	.DL1_L2C_AWBURST(DL1_AWBURST),
	.DL1_L2C_AWVALID(DL1_AWVALID),
	.DL1_L2C_AWREADY(DL1_AWREADY),

	.DL1_L2C_WDATA(DL1_WDATA),
	.DL1_L2C_WSTRB(DL1_WSTRB),
	.DL1_L2C_WLAST(DL1_WLAST),
	.DL1_L2C_WVALID(DL1_WVALID),
	.DL1_L2C_WREADY(DL1_WREADY),

	.DL1_L2C_BRESP(DL1_BRESP),
	.DL1_L2C_BVALID(DL1_BVALID),
	.DL1_L2C_BREADY(DL1_BREADY),

	.DL1_L2C_ARADDR(DL1_ARADDR),
	.DL1_L2C_ARLEN(DL1_ARLEN),
	.DL1_L2C_ARBURST(DL1_ARBURST),
	.DL1_L2C_ARVALID(DL1_ARVALID),
	.DL1_L2C_ARREADY(DL1_ARREADY),

	.DL1_L2C_RDATA(DL1_RDATA),
	.DL1_L2C_RRESP(DL1_RRESP),
	.DL1_L2C_RLAST(DL1_RLAST),
	.DL1_L2C_RVALID(DL1_RVALID),
	.DL1_L2C_RREADY(DL1_RREADY),



	//from DDR
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

	.l3c_fence(L3_FENCE),
	.l2c_fence(L2_FENCE),
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
	$dumpvars(0, axi_full_l2l3c_tb);//tb模块名称
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

	IL1_ARADDR = 32'b0;


	DL1_AWADDR = 32'h0;
	DL1_ARADDR = 32'h0;
	DL1_WDATA = 64'd0;
	DL1_WSTRB = 8'b0;
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;
	DL1_AWLEN = 8'b0;
	DL1_ARLEN = 8'd3;
	IL1_ARLEN = 8'd3;
	L2_FENCE = 1'b0;
	L3_FENCE = 1'b0;


	#52
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b1;
	DL1_AWADDR = 32'b11000;
	DL1_WDATA = 64'haa;
	DL1_WSTRB = 8'hff;
	DL1_ARADDR = 32'h0;

	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;

	#2000
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;
	DL1_AWADDR = 32'b11000;

	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;


	#2000
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;


	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;

	#2000
	il1_start_single_burst_read = 1'b1;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;


	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;

	#2000
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b1;
	DL1_WDATA = 64'hbb;

	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;

	#2000
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b1;
	dl1_start_single_burst_write = 1'b0;


	#10
	il1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_read = 1'b0;
	dl1_start_single_burst_write = 1'b0;

	# 6000
	L2_FENCE = 1;

	# 10
	L2_FENCE = 0;

end





endmodule




