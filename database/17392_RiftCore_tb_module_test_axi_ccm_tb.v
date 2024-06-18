// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_ccm_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-21 16:46:54
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-21 17:07:23
*/


`timescale 1 ns / 1 ps



module axi_ccm_tb (

);







	reg [63:0] S_AXI_AWADDR;
	reg S_AXI_AWVALID;
	wire S_AXI_AWREADY;
	reg [63:0] S_AXI_WDATA;
	reg [7:0] S_AXI_WSTRB;
	reg S_AXI_WVALID;
	wire S_AXI_WREADY;
	wire [1:0] S_AXI_BRESP;
	wire S_AXI_BVALID;
	reg S_AXI_BREADY;
	reg [63:0] S_AXI_ARADDR;
	reg S_AXI_ARVALID;
	wire S_AXI_ARREADY;
	wire [63:0] S_AXI_RDATA;
	wire [1:0] S_AXI_RRESP;
	wire S_AXI_RVALID;
	reg S_AXI_RREADY;
	reg CLK;
	reg RSTn;




axi_ccm s_axi_ccm
(
	.S_AXI_AWADDR (S_AXI_AWADDR),
	.S_AXI_AWVALID(S_AXI_AWVALID),
	.S_AXI_AWREADY(S_AXI_AWREADY),
	.S_AXI_WDATA  (S_AXI_WDATA),
	.S_AXI_WSTRB  (S_AXI_WSTRB),
	.S_AXI_WVALID (S_AXI_WVALID),
	.S_AXI_WREADY (S_AXI_WREADY),
	.S_AXI_BRESP  (S_AXI_BRESP),
	.S_AXI_BVALID (S_AXI_BVALID),
	.S_AXI_BREADY (S_AXI_BREADY),
	.S_AXI_ARADDR (S_AXI_ARADDR),
	.S_AXI_ARVALID(S_AXI_ARVALID),
	.S_AXI_ARREADY(S_AXI_ARREADY),
	.S_AXI_RDATA  (S_AXI_RDATA),
	.S_AXI_RRESP  (S_AXI_RRESP),
	.S_AXI_RVALID (S_AXI_RVALID),
	.S_AXI_RREADY (S_AXI_RREADY),
	.CLK          (CLK),
	.RSTn         (RSTn)
);


initial begin
	forever
	begin 
		 #5 CLK <= ~CLK;
	end
end

initial begin


	CLK = 0;
	RSTn = 0;

	s_axi_ccm.i_sram_odd.ram[0] = 64'h01234567_89abcdef;
	s_axi_ccm.i_sram_eve.ram[0] = 64'hfedcba98_76543210;

	S_AXI_AWADDR = 64'b0;
	S_AXI_AWVALID = 1'b0;
	S_AXI_WDATA = 64'b0;
	S_AXI_WSTRB = 8'b0;
	S_AXI_WVALID = 1'b0;
	S_AXI_BREADY = 1'b0;
	S_AXI_ARADDR = 64'b0;
	S_AXI_ARVALID = 1'b0;
	S_AXI_RREADY = 1'b0;

	#20

	RSTn <= 1;

	#50

	S_AXI_AWADDR = 64'b0;
	S_AXI_AWVALID = 1'b0;
	S_AXI_WDATA = 64'b0;
	S_AXI_WSTRB = 8'b0;
	S_AXI_WVALID = 1'b0;
	S_AXI_BREADY = 1'b0;
	S_AXI_ARADDR = 64'h80000009;
	S_AXI_ARVALID = 1'b1;
	S_AXI_RREADY = 1'b0;



	#80000

	$finish;
end


initial
begin
	$dumpfile("../build/axi_ccm.vcd"); //生成的vcd文件名称
	$dumpvars(0, axi_ccm_tb);//tb模块名称
end

endmodule



