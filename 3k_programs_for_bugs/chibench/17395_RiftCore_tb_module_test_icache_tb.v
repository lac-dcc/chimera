// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: icache_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-03-04 10:38:19
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-04 15:10:32
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

module icache_tb (

);


	wire ifu_req_ready;
	wire [63:0] ifu_data_rsp;
	wire ifu_rsp_valid;

	reg ifu_rsp_ready;
	reg ifu_req_valid;
	reg [31:0] ifu_addr_req;

	reg il1_fence;
	reg CLK;
	reg RSTn;





	wire [31:0] IL1_ARADDR;
	wire [7:0] IL1_ARLEN;
	wire [1:0] IL1_ARBURST;
	wire IL1_ARVALID;
	wire IL1_ARREADY;

	wire [63:0] IL1_RDATA;
	wire [1:0] IL1_RRESP;
	wire IL1_RLAST;
	wire IL1_RVALID;
	wire IL1_RREADY;


icache i_icache(

	.IL1_ARADDR(IL1_ARADDR),
	.IL1_ARLEN(IL1_ARLEN),
	.IL1_ARBURST(IL1_ARBURST),
	.IL1_ARVALID(IL1_ARVALID),
	.IL1_ARREADY(IL1_ARREADY),
	.IL1_RDATA(IL1_RDATA),
	.IL1_RRESP(IL1_RRESP),
	.IL1_RLAST(IL1_RLAST),
	.IL1_RVALID(IL1_RVALID),
	.IL1_RREADY(IL1_RREADY),

	.ifu_req_valid(ifu_req_valid),
	.ifu_req_ready(ifu_req_ready),
	.ifu_addr_req(ifu_addr_req),
	.ifu_data_rsp(ifu_data_rsp),
	.ifu_rsp_valid(ifu_rsp_valid),
	.ifu_rsp_ready(ifu_rsp_ready),

	.il1_fence(il1_fence),
	.CLK(CLK),
	.RSTn(RSTn)

);




axi_full_slv_sram s_axi_full_slv_sram
(

	.S_AXI_AWADDR(32'h0),
	.S_AXI_AWLEN(8'h0),
	.S_AXI_AWSIZE(3'h0),
	.S_AXI_AWBURST(2'h0),
	.S_AXI_AWVALID(1'b0),
	.S_AXI_AWREADY(),

	.S_AXI_WDATA(64'h0),
	.S_AXI_WSTRB(8'h0),
	.S_AXI_WLAST(1'b1),
	.S_AXI_WVALID(1'b0),
	.S_AXI_WREADY(),

	.S_AXI_BRESP(),
	.S_AXI_BVALID(),
	.S_AXI_BREADY(1'b1),

	.S_AXI_ARADDR(IL1_ARADDR),
	.S_AXI_ARLEN(IL1_ARLEN),
	.S_AXI_ARSIZE(3'd3),
	.S_AXI_ARBURST(IL1_ARBURST),
	.S_AXI_ARVALID(IL1_ARVALID),
	.S_AXI_ARREADY(IL1_ARREADY),

	.S_AXI_RDATA(IL1_RDATA),
	.S_AXI_RRESP(IL1_RRESP),
	.S_AXI_RLAST(IL1_RLAST),
	.S_AXI_RVALID(IL1_RVALID),
	.S_AXI_RREADY(IL1_RREADY),

	.CLK(CLK),
	.RSTn(RSTn)
);



initial
begin
	$dumpfile("../build/wave.vcd"); //生成的vcd文件名称
	$dumpvars(0, icache_tb);//tb模块名称
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
	ifu_rsp_ready = 1'b1;
	ifu_req_valid = 1'b0;
	ifu_addr_req = 32'h18;

	il1_fence = 1'b0;

#100

#22
	ifu_req_valid = 1'b1;
	ifu_addr_req = 32'h18;
#10
	ifu_req_valid = 1'b0;

#1000
	ifu_req_valid = 1'b1;
	ifu_addr_req = 32'h10;
#10
	ifu_req_valid = 1'b0;


#1000
	ifu_req_valid = 1'b1;
	ifu_addr_req = 32'h80000010;
#10
	ifu_req_valid = 1'b0;

#1000
	ifu_req_valid = 1'b1;
	ifu_addr_req = 32'h90000010;
#10
	ifu_req_valid = 1'b0;

end




endmodule



