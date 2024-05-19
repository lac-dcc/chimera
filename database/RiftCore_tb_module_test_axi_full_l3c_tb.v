// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_full_l3c_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-24 09:24:56
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-26 17:48:40
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


module axi_full_mst_tb
(

);
	reg CLK;
	reg RSTn;

	reg FENCE;



	wire M_AXI_ARVALID = axi_arvalid_qout;
	wire M_AXI_RREADY = axi_rready_qout;
	wire [1:0] M_AXI_AWBURST = 2'b00;
	wire [1:0] M_AXI_ARBURST = 2'b01;
	reg [2:0] M_AXI_AWSIZE;
	reg [2:0] M_AXI_ARSIZE;
	reg [7:0] M_AXI_AWLEN;
	reg [7:0] M_AXI_ARLEN;
	reg [31:0] M_AXI_AWADDR;
	reg [31:0] M_AXI_ARADDR;
	reg [7:0] M_AXI_WSTRB;

	reg start_single_burst_read, start_single_burst_write;


	wire M_AXI_ARREADY;
	wire [63:0] M_AXI_RDATA;
	wire [1:0] M_AXI_RRESP;
	wire M_AXI_RLAST;
	wire M_AXI_RVALID;
	wire M_AXI_AWREADY;
	reg [63:0] M_AXI_WDATA;
	wire M_AXI_WREADY;
	wire [1:0] M_AXI_BRESP;
	wire M_AXI_BVALID;

	wire M_AXI_AWVALID = axi_awvalid_qout;
	wire M_AXI_WLAST = axi_wlast_qout;
	wire M_AXI_WVALID = axi_wvalid_qout;
	wire M_AXI_BREADY = axi_bready_qout;

	wire axi_awvalid_set, axi_awvalid_rst, axi_awvalid_qout;
	wire axi_wvalid_set, axi_wvalid_rst, axi_wvalid_qout;
	wire axi_wlast_set, axi_wlast_rst, axi_wlast_qout;
	wire [7:0] write_index_dnxt;
	wire [7:0] write_index_qout;
	wire axi_bready_set, axi_bready_rst, axi_bready_qout;
	wire axi_arvalid_set, axi_arvalid_rst, axi_arvalid_qout;
	wire [7:0] read_index_dnxt;
	wire [7:0] read_index_qout;
	wire axi_rready_set, axi_rready_rst, axi_rready_qout;
	wire wnext, rnext;
	wire write_resp_error, read_resp_error;









	assign axi_awvalid_set = ~axi_awvalid_qout & start_single_burst_write;
	assign axi_awvalid_rst =  axi_awvalid_qout & M_AXI_AWREADY ;
	gen_rsffr axi_awvalid_rsffr (.set_in(axi_awvalid_set), .rst_in(axi_awvalid_rst), .qout(axi_awvalid_qout), .CLK(CLK), .RSTn(RSTn));



	assign wnext = M_AXI_WREADY & axi_wvalid_qout;


	assign axi_wvalid_set = (~axi_wvalid_qout & start_single_burst_write);
	assign axi_wvalid_rst = (wnext & axi_wlast_qout) ;
	gen_rsffr axi_wvalid_rsffr (.set_in(axi_wvalid_set), .rst_in(axi_wvalid_rst), .qout(axi_wvalid_qout), .CLK(CLK), .RSTn(RSTn));




	assign axi_wlast_set = ((write_index_qout == M_AXI_AWLEN-1 & M_AXI_AWLEN >= 1) & wnext) || (M_AXI_AWLEN == 0 );
	assign axi_wlast_rst = ~axi_wlast_set & ( wnext | (axi_wlast_qout & M_AXI_AWLEN == 0) );
	gen_rsffr axi_wlast_rsffr (.set_in(axi_wlast_set), .rst_in(axi_wlast_rst), .qout(axi_wlast_qout), .CLK(CLK), .RSTn(RSTn));


	assign write_index_dnxt = start_single_burst_write ? 8'd0 :
								(
									(wnext & (write_index_qout != M_AXI_AWLEN)) ? (write_index_qout + 8'd1) : write_index_qout
								);              
	gen_dffr # (.DW(8)) write_index_dffr (.dnxt(write_index_dnxt), .qout(write_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign axi_bready_set = (M_AXI_BVALID && ~axi_bready_qout);
	assign axi_bready_rst = axi_bready_qout;
	gen_rsffr axi_bready_rsffr (.set_in(axi_bready_set), .rst_in(axi_bready_rst), .qout(axi_bready_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign write_resp_error = axi_bready_qout & M_AXI_BVALID & M_AXI_BRESP[1]; 




	assign axi_arvalid_set = ~axi_arvalid_qout & start_single_burst_read;
	assign axi_arvalid_rst = axi_arvalid_qout & M_AXI_ARREADY ;
	gen_rsffr axi_arvalid_rsffr (.set_in(axi_arvalid_set), .rst_in(axi_arvalid_rst), .qout(axi_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	

	assign rnext = M_AXI_RVALID && axi_rready_qout;



	assign read_index_dnxt = start_single_burst_read ? 8'd0 :
								(
									(rnext & (read_index_qout != M_AXI_ARLEN)) ? (read_index_qout + 8'd1) : read_index_qout
								);              
	gen_dffr # (.DW(8)) read_index_dffr (.dnxt(read_index_dnxt), .qout(read_index_qout), .CLK(CLK), .RSTn(RSTn));


	assign axi_rready_set = M_AXI_RVALID & (~M_AXI_RLAST | ~axi_rready_qout);
	assign axi_rready_rst = M_AXI_RVALID &   M_AXI_RLAST &  axi_rready_qout;
	gen_rsffr axi_rready_rsffr (.set_in(axi_rready_set), .rst_in(axi_rready_rst), .qout(axi_rready_qout), .CLK(CLK), .RSTn(RSTn));


	assign read_resp_error = axi_rready_qout & M_AXI_RVALID & M_AXI_RRESP[1];





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





L3cache s_L3cache
(

	//form L2cache
	.L2C_AWID(1'b0),
	.L2C_AWADDR(M_AXI_AWADDR),
	.L2C_AWLEN(8'd0),
	.L2C_AWSIZE(M_AXI_AWSIZE),
	.L2C_AWBURST(M_AXI_AWBURST),
	.L2C_AWPROT(3'h0),
	.L2C_AWVALID(M_AXI_AWVALID),
	.L2C_AWREADY(M_AXI_AWREADY),

	.L2C_WDATA(M_AXI_WDATA),
	.L2C_WSTRB(M_AXI_WSTRB),
	.L2C_WLAST(M_AXI_WLAST),
	.L2C_WVALID(M_AXI_WVALID),
	.L2C_WREADY(M_AXI_WREADY),

	.L2C_BID(),
	.L2C_BRESP(M_AXI_BRESP),
	.L2C_BVALID(M_AXI_BVALID),
	.L2C_BREADY(M_AXI_BREADY),

	.L2C_ARID(1'b0),
	.L2C_ARADDR(M_AXI_ARADDR),
	.L2C_ARLEN(M_AXI_ARLEN),
	.L2C_ARSIZE(M_AXI_ARSIZE),
	.L2C_ARBURST(M_AXI_ARBURST),
	.L2C_ARPROT(3'h0),
	.L2C_ARVALID(M_AXI_ARVALID),
	.L2C_ARREADY(M_AXI_ARREADY),

	.L2C_RID(),
	.L2C_RDATA(M_AXI_RDATA),
	.L2C_RRESP(M_AXI_RRESP),
	.L2C_RLAST(M_AXI_RLAST),
	.L2C_RVALID(M_AXI_RVALID),
	.L2C_RREADY(M_AXI_RREADY),

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

	.l3c_fence(FENCE),
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
	$dumpvars(0, axi_full_mst_tb);//tb模块名称
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
	M_AXI_AWADDR = 32'h0;
	M_AXI_ARADDR = 32'h0;
	M_AXI_WDATA = 64'd0;
	M_AXI_WSTRB = 8'b0;
	start_single_burst_read = 1'b0;
	start_single_burst_write = 1'b0;
	M_AXI_AWLEN = 8'b0;
	M_AXI_ARLEN = 8'd15;
	M_AXI_AWSIZE = $clog2(64/8);
	M_AXI_ARSIZE = $clog2(64/8);
	FENCE = 1'b0;

	#52
	start_single_burst_write = 1'b1;
	start_single_burst_read = 1'b0;
	M_AXI_AWADDR = 32'b11000;
	M_AXI_WDATA = 64'haa;
	M_AXI_WSTRB = 8'hff;
	M_AXI_ARADDR = 32'h0;

	#10
	start_single_burst_write = 1'b0;
	start_single_burst_read = 1'b0;

	#2000
	start_single_burst_write = 1'b1;
	start_single_burst_read = 1'b0;
	M_AXI_AWADDR = 32'b11000;

	#10
	start_single_burst_write = 1'b0;
	start_single_burst_read = 1'b0;


	#2000
	start_single_burst_write = 1'b1;
	start_single_burst_read = 1'b0;
	M_AXI_AWADDR = 32'h200;

	#10
	start_single_burst_write = 1'b0;
	start_single_burst_read = 1'b0;

	#2000
	start_single_burst_write = 1'b1;
	start_single_burst_read = 1'b0;
	M_AXI_AWADDR = 32'h200;

	#10
	start_single_burst_write = 1'b0;
	start_single_burst_read = 1'b0;

	#2000
	start_single_burst_write = 1'b1;
	start_single_burst_read = 1'b0;
	M_AXI_AWADDR = 32'h400;

	#10
	start_single_burst_write = 1'b0;
	start_single_burst_read = 1'b0;



	# 6000
	FENCE = 1;

	# 10
	FENCE = 0;

end





endmodule




