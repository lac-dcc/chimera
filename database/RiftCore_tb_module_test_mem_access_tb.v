// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: mem_access_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-11 14:23:57
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-11 15:10:48
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


module mem_access_tb (

);

	reg CLK;
	reg RSTn;

	reg [63:0] pc_ic_addr;
	wire pc_ic_ready;

	wire [63:0] ic_iq_pc;
	wire [63:0] ic_iq_instr;
	wire ic_iq_valid;
	reg ic_iq_ready;












	wire [31:0] IL1_L2C_ARADDR;
	wire [7:0] IL1_L2C_ARLEN;
	wire [1:0] IL1_L2C_ARBURST;
	wire IL1_L2C_ARVALID;
	wire IL1_L2C_ARREADY;
	wire [63:0] IL1_L2C_RDATA;
	wire [1:0] IL1_L2C_RRESP;
	wire IL1_L2C_RLAST;
	wire IL1_L2C_RVALID;
	wire IL1_L2C_RREADY;


	wire [31:0] DL1_L2C_AWADDR;
	wire [7:0] DL1_L2C_AWLEN;
	wire [1:0] DL1_L2C_AWBURST;
	wire DL1_L2C_AWVALID;
	wire DL1_L2C_AWREADY;

	wire [63:0] DL1_L2C_WDATA;
	wire [7:0] DL1_L2C_WSTRB;
	wire DL1_L2C_WLAST;
	wire DL1_L2C_WVALID;
	wire DL1_L2C_WREADY;

	wire [1:0] DL1_L2C_BRESP;
	wire DL1_L2C_BVALID;
	wire DL1_L2C_BREADY;

	wire [31:0] DL1_L2C_ARADDR;
	wire [7:0] DL1_L2C_ARLEN;
	wire [1:0] DL1_L2C_ARBURST;
	wire DL1_L2C_ARVALID;
	wire DL1_L2C_ARREADY;

	wire [63:0] DL1_L2C_RDATA;
	wire [1:0] DL1_L2C_RRESP;
	wire DL1_L2C_RLAST;
	wire DL1_L2C_RVALID;
	wire DL1_L2C_RREADY;


	//L3Cache
	wire [31:0] L2C_L3C_AWADDR;
	wire [7:0] L2C_L3C_AWLEN;
	wire [1:0] L2C_L3C_AWBURST;
	wire L2C_L3C_AWVALID;
	wire L2C_L3C_AWREADY;
	wire [63:0] L2C_L3C_WDATA;
	wire [7:0] L2C_L3C_WSTRB;
	wire L2C_L3C_WLAST;
	wire L2C_L3C_WVALID;
	wire L2C_L3C_WREADY;

	wire [1:0] L2C_L3C_BRESP;
	wire L2C_L3C_BVALID;
	wire L2C_L3C_BREADY;

	wire [31:0] L2C_L3C_ARADDR;
	wire [7:0] L2C_L3C_ARLEN;
	wire [1:0] L2C_L3C_ARBURST;
	wire L2C_L3C_ARVALID;
	wire L2C_L3C_ARREADY;

	wire [63:0] L2C_L3C_RDATA;
	wire [1:0] L2C_L3C_RRESP;
	wire L2C_L3C_RLAST;
	wire L2C_L3C_RVALID;
	wire L2C_L3C_RREADY;

	wire [63:0] MEM_AWADDR;
	wire [7:0] MEM_AWLEN;
	wire [2:0] MEM_AWSIZE;
	wire [1:0] MEM_AWBURST;
	wire MEM_AWVALID;
	wire MEM_AWREADY;
	wire [63:0] MEM_WDATA;
	wire [7:0] MEM_WSTRB;
	wire MEM_WLAST;
	wire MEM_WVALID;
	wire MEM_WREADY;
	wire [1:0] MEM_BRESP;
	wire MEM_BVALID;
	wire MEM_BREADY;
	wire [63:0] MEM_ARADDR;
	wire [7:0] MEM_ARLEN;
	wire [2:0] MEM_ARSIZE;
	wire [1:0] MEM_ARBURST;
	wire MEM_ARVALID;
	wire MEM_ARREADY;
	wire [63:0] MEM_RDATA;
	wire [1:0] MEM_RRESP;
	wire MEM_RLAST;
	wire MEM_RVALID;
	wire MEM_RREADY;


icache i_cache(
	.IL1_ARADDR   (IL1_L2C_ARADDR),
	.IL1_ARLEN    (IL1_L2C_ARLEN),
	.IL1_ARBURST  (IL1_L2C_ARBURST),
	.IL1_ARVALID  (IL1_L2C_ARVALID),
	.IL1_ARREADY  (IL1_L2C_ARREADY),
	.IL1_RDATA    (IL1_L2C_RDATA),
	.IL1_RRESP    (IL1_L2C_RRESP),
	.IL1_RLAST    (IL1_L2C_RLAST),
	.IL1_RVALID   (IL1_L2C_RVALID),
	.IL1_RREADY   (IL1_L2C_RREADY),

	.pc_ic_addr   (pc_ic_addr),
	.pc_ic_ready  (pc_ic_ready),
	.ic_iq_pc     (ic_iq_pc),
	.ic_iq_instr  (ic_iq_instr),
	.ic_iq_valid  (ic_iq_valid),
	.ic_iq_ready  (ic_iq_ready),

	.il1_fence    (1'b0),
	.il1_fence_end(),

	.flush        (1'b0),
	.CLK          (CLK),
	.RSTn         (RSTn)
);













dcache i_dcache(
	.DL1_AWADDR(DL1_L2C_AWADDR),
	.DL1_AWLEN(DL1_L2C_AWLEN),
	.DL1_AWBURST(DL1_L2C_AWBURST),
	.DL1_AWVALID(DL1_L2C_AWVALID),
	.DL1_AWREADY(DL1_L2C_AWREADY),
	.DL1_WDATA(DL1_L2C_WDATA),
	.DL1_WSTRB(DL1_L2C_WSTRB),
	.DL1_WLAST(DL1_L2C_WLAST),
	.DL1_WVALID(DL1_L2C_WVALID),
	.DL1_WREADY(DL1_L2C_WREADY),
	.DL1_BRESP(DL1_L2C_BRESP),
	.DL1_BVALID(DL1_L2C_BVALID),
	.DL1_BREADY(DL1_L2C_BREADY),

	.DL1_ARADDR(DL1_L2C_ARADDR),
	.DL1_ARLEN(DL1_L2C_ARLEN),
	.DL1_ARBURST(DL1_L2C_ARBURST),
	.DL1_ARVALID(DL1_L2C_ARVALID),
	.DL1_ARREADY(DL1_L2C_ARREADY),
	.DL1_RDATA(DL1_L2C_RDATA),
	.DL1_RRESP(DL1_L2C_RRESP),
	.DL1_RLAST(DL1_L2C_RLAST),
	.DL1_RVALID(DL1_L2C_RVALID),
	.DL1_RREADY(DL1_L2C_RREADY),

	.lsu_req_valid(1'b0),
	.lsu_req_ready(),
	.lsu_addr_req(32'b0),
	.lsu_wdata_req(64'b0),
	.lsu_wstrb_req(8'b0),
	.lsu_wen_req(1'b0),

	.lsu_rdata_rsp(),
	.lsu_rsp_valid(),
	.lsu_rsp_ready(1'b1),

	.dl1_fence(1'b0),
	.dl1_fence_end(),
	.CLK(CLK),
	.RSTn(RSTn)
);


L2cache i_L2cache(

	//L1 I Cache
	.IL1_ARADDR   (IL1_L2C_ARADDR),
	.IL1_ARLEN    (IL1_L2C_ARLEN),
	.IL1_ARBURST  (IL1_L2C_ARBURST),
	.IL1_ARVALID  (IL1_L2C_ARVALID),
	.IL1_ARREADY  (IL1_L2C_ARREADY),
	.IL1_RDATA    (IL1_L2C_RDATA),
	.IL1_RRESP    (IL1_L2C_RRESP),
	.IL1_RLAST    (IL1_L2C_RLAST),
	.IL1_RVALID   (IL1_L2C_RVALID),
	.IL1_RREADY   (IL1_L2C_RREADY),

	.DL1_AWADDR(DL1_L2C_AWADDR),
	.DL1_AWLEN(DL1_L2C_AWLEN),
	.DL1_AWBURST(DL1_L2C_AWBURST),
	.DL1_AWVALID(DL1_L2C_AWVALID),
	.DL1_AWREADY(DL1_L2C_AWREADY),
	.DL1_WDATA(DL1_L2C_WDATA),
	.DL1_WSTRB(DL1_L2C_WSTRB),
	.DL1_WLAST(DL1_L2C_WLAST),
	.DL1_WVALID(DL1_L2C_WVALID),
	.DL1_WREADY(DL1_L2C_WREADY),
	.DL1_BRESP(DL1_L2C_BRESP),
	.DL1_BVALID(DL1_L2C_BVALID),
	.DL1_BREADY(DL1_L2C_BREADY),
	.DL1_ARADDR(DL1_L2C_ARADDR),
	.DL1_ARLEN(DL1_L2C_ARLEN),
	.DL1_ARBURST(DL1_L2C_ARBURST),
	.DL1_ARVALID(DL1_L2C_ARVALID),
	.DL1_ARREADY(DL1_L2C_ARREADY),
	.DL1_RDATA(DL1_L2C_RDATA),
	.DL1_RRESP(DL1_L2C_RRESP),
	.DL1_RLAST(DL1_L2C_RLAST),
	.DL1_RVALID(DL1_L2C_RVALID),
	.DL1_RREADY(DL1_L2C_RREADY),

	.MEM_AWADDR(L2C_L3C_AWADDR),
	.MEM_AWLEN(L2C_L3C_AWLEN),
	.MEM_AWBURST(L2C_L3C_AWBURST),
	.MEM_AWVALID(L2C_L3C_AWVALID),
	.MEM_AWREADY(L2C_L3C_AWREADY),
	.MEM_WDATA(L2C_L3C_WDATA),
	.MEM_WSTRB(L2C_L3C_WSTRB),
	.MEM_WLAST(L2C_L3C_WLAST),
	.MEM_WVALID(L2C_L3C_WVALID),
	.MEM_WREADY(L2C_L3C_WREADY),
	.MEM_BRESP(L2C_L3C_BRESP),
	.MEM_BVALID(L2C_L3C_BVALID),
	.MEM_BREADY(L2C_L3C_BREADY),
	.MEM_ARADDR(L2C_L3C_ARADDR),
	.MEM_ARLEN(L2C_L3C_ARLEN),
	.MEM_ARBURST(L2C_L3C_ARBURST),
	.MEM_ARVALID(L2C_L3C_ARVALID),
	.MEM_ARREADY(L2C_L3C_ARREADY),
	.MEM_RDATA(L2C_L3C_RDATA),
	.MEM_RRESP(L2C_L3C_RRESP),
	.MEM_RLAST(L2C_L3C_RLAST),
	.MEM_RVALID(L2C_L3C_RVALID),
	.MEM_RREADY(L2C_L3C_RREADY),

	.l2c_fence(1'b0),
	.l2c_fence_end(),
	.CLK(CLK),
	.RSTn(RSTn)
);


L3cache i_L3cache(

	//form L2cache
	.L2C_AWADDR(L2C_L3C_AWADDR),
	.L2C_AWLEN(L2C_L3C_AWLEN),
	.L2C_AWBURST(L2C_L3C_AWBURST),
	.L2C_AWVALID(L2C_L3C_AWVALID),
	.L2C_AWREADY(L2C_L3C_AWREADY),
	.L2C_WDATA(L2C_L3C_WDATA),
	.L2C_WSTRB(L2C_L3C_WSTRB),
	.L2C_WLAST(L2C_L3C_WLAST),
	.L2C_WVALID(L2C_L3C_WVALID),
	.L2C_WREADY(L2C_L3C_WREADY),
	.L2C_BRESP(L2C_L3C_BRESP),
	.L2C_BVALID(L2C_L3C_BVALID),
	.L2C_BREADY(L2C_L3C_BREADY),


	.L2C_ARADDR(L2C_L3C_ARADDR),
	.L2C_ARLEN(L2C_L3C_ARLEN),
	.L2C_ARBURST(L2C_L3C_ARBURST),
	.L2C_ARVALID(L2C_L3C_ARVALID),
	.L2C_ARREADY(L2C_L3C_ARREADY),
	.L2C_RDATA(L2C_L3C_RDATA),
	.L2C_RRESP(L2C_L3C_RRESP),
	.L2C_RLAST(L2C_L3C_RLAST),
	.L2C_RVALID(L2C_L3C_RVALID),
	.L2C_RREADY(L2C_L3C_RREADY),


	//from DDR
	.MEM_AWID(),
	.MEM_AWADDR(MEM_AWADDR),
	.MEM_AWLEN(MEM_AWLEN),
	.MEM_AWSIZE(MEM_AWSIZE),
	.MEM_AWBURST(MEM_AWBURST),
	.MEM_AWLOCK(),
	.MEM_AWCACHE(),
	.MEM_AWPROT(),
	.MEM_AWQOS(),
	.MEM_AWUSER(),
	.MEM_AWVALID(MEM_AWVALID),
	.MEM_AWREADY(MEM_AWREADY),

	.MEM_WDATA(MEM_WDATA),
	.MEM_WSTRB(MEM_WSTRB),
	.MEM_WLAST(MEM_WLAST),
	.MEM_WUSER(),
	.MEM_WVALID(MEM_WVALID),
	.MEM_WREADY(MEM_WREADY),

	.MEM_BID(1'b0),
	.MEM_BRESP(MEM_BRESP),
	.MEM_BUSER(1'b0),
	.MEM_BVALID(MEM_BVALID),
	.MEM_BREADY(MEM_BREADY),

	.MEM_ARID(),
	.MEM_ARADDR(MEM_ARADDR),
	.MEM_ARLEN(MEM_ARLEN),
	.MEM_ARSIZE(MEM_ARSIZE),
	.MEM_ARBURST(MEM_ARBURST),
	.MEM_ARLOCK(),
	.MEM_ARCACHE(),
	.MEM_ARPROT(),
	.MEM_ARQOS(),
	.MEM_ARUSER(),
	.MEM_ARVALID(MEM_ARVALID),
	.MEM_ARREADY(MEM_ARREADY),

	.MEM_RID(1'b0),
	.MEM_RDATA(MEM_RDATA),
	.MEM_RRESP(MEM_RRESP),
	.MEM_RLAST(MEM_RLAST),
	.MEM_RUSER(1'b0),
	.MEM_RVALID(MEM_RVALID),
	.MEM_RREADY(MEM_RREADY),

	.l3c_fence(1'b0),
	.l3c_fence_end(),
	.CLK(CLK),
	.RSTn(RSTn)

);




axi_full_slv_sram i_sram
(
	.MEM_AWADDR (MEM_AWADDR[31:0]),
	.MEM_AWLEN  (MEM_AWLEN),
	.MEM_AWSIZE (MEM_AWSIZE),
	.MEM_AWBURST(MEM_AWBURST),
	.MEM_AWVALID(MEM_AWVALID),
	.MEM_AWREADY(MEM_AWREADY),
	.MEM_WDATA  (MEM_WDATA),
	.MEM_WSTRB  (MEM_WSTRB),
	.MEM_WLAST  (MEM_WLAST),
	.MEM_WVALID (MEM_WVALID),
	.MEM_WREADY (MEM_WREADY),
	.MEM_BRESP  (MEM_BRESP),
	.MEM_BVALID (MEM_BVALID),
	.MEM_BREADY (MEM_BREADY),
	.MEM_ARADDR (MEM_ARADDR[31:0]),
	.MEM_ARLEN  (MEM_ARLEN),
	.MEM_ARSIZE (MEM_ARSIZE),
	.MEM_ARBURST(MEM_ARBURST),
	.MEM_ARVALID(MEM_ARVALID),
	.MEM_ARREADY(MEM_ARREADY),
	.MEM_RDATA  (MEM_RDATA),
	.MEM_RRESP  (MEM_RRESP),
	.MEM_RLAST  (MEM_RLAST),
	.MEM_RVALID (MEM_RVALID),
	.MEM_RREADY (MEM_RREADY),

	.CLK        (CLK),
	.RSTn       (RSTn)
);






initial
begin
	$dumpfile("../build/wave.vcd"); //生成的vcd文件名称
	$dumpvars(0, mem_access_tb);//tb模块名称
end



initial begin

	CLK = 0;
	RSTn = 0;
	#20

	RSTn <= 1;

	// #80000
	// 		$display("Time Out !!!");
	// $finish;
end


initial begin
	forever begin 
		#5 CLK <= ~CLK;
	end
end




// wire pc_ic_ready;

// wire [63:0] ic_iq_pc;
// wire [63:0] ic_iq_instr;
// wire ic_iq_valid;
// reg ic_iq_ready;

// reg [63:0] pc_ic_addr;

initial begin
	pc_ic_addr = 64'h00000000;
	ic_iq_ready = 1'b1;
end

localparam SRAM_ADDR = 2**14;
integer i;
initial begin
	for ( i = 0; i < SRAM_ADDR; i = i + 1 ) begin
		i_sram.i_sram.ram[i] = i;
	end

end



always @(negedge CLK) begin
	if ( ic_iq_valid ) begin
		if ( (ic_iq_pc>>3) != ic_iq_instr ) begin
			$stop;
		end
	end


end


always @(posedge CLK) begin
	if ( pc_ic_ready ) begin
		pc_ic_addr <= pc_ic_addr + 64'b1000;
	end
end


endmodule






