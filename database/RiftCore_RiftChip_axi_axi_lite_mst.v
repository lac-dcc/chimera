// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: axi_lite_mst
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-14 17:08:41
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-15 15:14:35
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




module axi_lite_mst 
(
	output ERROR,

	output [63:0] M_AXI_AWADDR,
	output [2:0] M_AXI_AWPROT,
	output M_AXI_AWVALID,
	input M_AXI_AWREADY,

	output [63:0] M_AXI_WDATA,
	output [7:0] M_AXI_WSTRB,
	output M_AXI_WVALID,
	input M_AXI_WREADY,

	input [1:0] M_AXI_BRESP,
	input M_AXI_BVALID,
	output M_AXI_BREADY,

	output [63:0] M_AXI_ARADDR,
	output [2:0] M_AXI_ARPROT,
	output M_AXI_ARVALID,
	input M_AXI_ARREADY,

	input [63:0] M_AXI_RDATA,
	input [1:0] M_AXI_RRESP,
	input M_AXI_RVALID,
	output M_AXI_RREADY,

	input CLK,
	input RSTn
);

	wire axi_awvalid_set, axi_awvalid_rst, axi_awvalid_qout;
	wire axi_wvalid_set, axi_wvalid_rst, axi_wvalid_qout;
	wire axi_bready_set, axi_bready_rst, axi_bready_qout;

	wire axi_arvalid_set, axi_arvalid_rst, axi_arvalid_qout;
	wire axi_rready_set, axi_rready_rst, axi_rready_qout;

	wire write_resp_error, read_resp_error;  


	assign write_resp_error = (axi_bready_qout & M_AXI_BVALID & M_AXI_BRESP[1]);
	assign read_resp_error = (axi_rready_qout & M_AXI_RVALID & M_AXI_RRESP[1]);  
	assign ERROR = write_resp_error | read_resp_error;

	assign M_AXI_AWADDR	= ;
	assign M_AXI_WDATA	= ;
	assign M_AXI_AWPROT	= 3'b000;
	assign M_AXI_AWVALID = axi_awvalid_qout;

	assign M_AXI_WVALID	= axi_wvalid_qout;
	assign M_AXI_WSTRB = ;

	assign M_AXI_BREADY	= axi_bready_qout;
	assign M_AXI_ARADDR	= ;
	assign M_AXI_ARVALID = axi_arvalid_qout;
	assign M_AXI_ARPROT	= 3'b001;
	assign M_AXI_RREADY	= axi_rready_qout;



	assign axi_awvalid_set = ;
	assign axi_awvalid_rst = ~axi_awvalid_set & (M_AXI_AWREADY & axi_awvalid_qout);
	assign axi_wvalid_set = ;
	assign axi_wvalid_rst = ~axi_wvalid_set & (M_AXI_WREADY & axi_wvalid_qout);	
	assign axi_bready_set = M_AXI_BVALID & ~axi_bready_qout;
	assign axi_bready_rst = axi_bready_qout;

	gen_rsffr # (.DW(1)) axi_awvalid_rsffr (.set_in(axi_awvalid_set), .rst_in(axi_awvalid_rst), .qout(axi_awvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) axi_wvalid_rsffr (.set_in(axi_wvalid_set), .rst_in(axi_wvalid_rst), .qout(axi_wvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) axi_bready_rsffr (.set_in(axi_bready_set), .rst_in(axi_bready_rst), .qout(axi_bready_qout), .CLK(CLK), .RSTn(RSTn));








	assign axi_arvalid_set = ;
	assign axi_arvalid_rst = ~axi_arvalid_set & (M_AXI_ARREADY & axi_arvalid_qout);
	assign axi_rready_set = M_AXI_RVALID & ~axi_rready_qout;
	assign axi_rready_rst = axi_rready_qout;


	gen_rsffr # (.DW(1)) axi_arvalid_rsffr (.set_in(axi_arvalid_set), .rst_in(axi_arvalid_rst), .qout(axi_arvalid_qout), .CLK(CLK), .RSTn(RSTn));
	gen_rsffr # (.DW(1)) axi_rready_rsffr (.set_in(axi_rready_set), .rst_in(axi_rready_rst), .qout(axi_rready_qout), .CLK(CLK), .RSTn(RSTn));




endmodule







