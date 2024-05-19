// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: DMI
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-24 11:35:08
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2020-12-30 17:13:18
*/

/*
  Copyright (c) 2020 - 2020 Ruige Lee <wut.ruigeli@gmail.com>

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


module DMI (

	// master
	input [4:0] M_DTM_AXI_AWADDR,
	input [2:0] M_DTM_AXI_AWPROT,
	input M_DTM_AXI_AWVALID,
	output M_DTM_AXI_AWREADY,

	input [31:0] M_DTM_AXI_WDATA,
	input [3:0] M_DTM_AXI_WSTRB,
	input M_DTM_AXI_WVALID,
	output M_DTM_AXI_WREADY,

	output [1:0] M_DTM_AXI_BRESP,
	output M_DTM_AXI_BVALID,
	input M_DTM_AXI_BREADY,

	input [4:0] M_DTM_AXI_ARADDR,
	input [2:0] M_DTM_AXI_ARPROT,
	input M_DTM_AXI_ARVALID,
	output M_DTM_AXI_ARREADY,

	output [31:0] M_DTM_AXI_RDATA,
	output [1:0] M_DTM_AXI_RRESP,
	output M_DTM_AXI_RVALID,
	input M_DTM_AXI_RREADY,

	input TCK,
	input TRST,


	output [7:0] S_DM_AXI_AWADDR,
	output [2:0] S_DM_AXI_AWPROT,
	output S_DM_AXI_AWVALID,
	input S_DM_AXI_AWREADY,

	output [31:0] S_DM_AXI_WDATA,  
	output [3:0] S_DM_AXI_WSTRB,
	output S_DM_AXI_WVALID,
	input S_DM_AXI_WREADY,

	input [1:0] S_DM_AXI_BRESP,
	input S_DM_AXI_BVALID,
	output S_DM_AXI_BREADY,

	output [7:0] S_DM_AXI_ARADDR,
	output [2:0] S_DM_AXI_ARPROT,
	output S_DM_AXI_ARVALID,
	input S_DM_AXI_ARREADY,

	input [31:0] S_DM_AXI_RDATA,
	input [1:0] S_DM_AXI_RRESP,
	input S_DM_AXI_RVALID,
	output S_DM_AXI_RREADY

	input CLK,
	input RSTn

);




	assign M_DTM_AXI_BRESP = S_DM_AXI_BRESP;

	assign M_DTM_AXI_RDATA = S_DM_AXI_RDATA;
	assign M_DTM_AXI_RRESP = S_DM_AXI_RRESP;

	assign S_DM_AXI_AWADDR = M_DTM_AXI_AWADDR;
	assign S_DM_AXI_AWPROT = M_DTM_AXI_AWPROT;

	assign S_DM_AXI_WDATA = M_DTM_AXI_WDATA;
	assign S_DM_AXI_WSTRB = M_DTM_AXI_WSTRB;

	assign S_DM_AXI_ARADDR = M_DTM_AXI_ARADDR;
	assign S_DM_AXI_ARPROT = M_DTM_AXI_ARPROT;


	gen_syn # ( .lever(3)) AWREADY ( .data_asyn(S_DM_AXI_AWREADY), .data_syn(M_DTM_AXI_AWREADY), .CLK(TCK), .RSTn(~TRST) );
	gen_syn # ( .lever(3)) WREADY ( .data_asyn(S_DM_AXI_WREADY), .data_syn(M_DTM_AXI_WREADY), .CLK(TCK), .RSTn(~TRST) );
	gen_syn # ( .lever(3)) BVALID ( .data_asyn(S_DM_AXI_BVALID), .data_syn(M_DTM_AXI_BVALID), .CLK(TCK), .RSTn(~TRST) );
	gen_syn # ( .lever(3)) ARREADY ( .data_asyn(S_DM_AXI_ARREADY), .data_syn(M_DTM_AXI_ARREADY), .CLK(TCK), .RSTn(~TRST) );
	gen_syn # ( .lever(3)) RVALID ( .data_asyn(S_DM_AXI_RVALID), .data_syn(M_DTM_AXI_RVALID), .CLK(TCK), .RSTn(~TRST) );



	gen_syn # ( .lever(3)) AWVALID ( .data_asyn(M_DTM_AXI_AWVALID), .data_syn(S_DM_AXI_AWVALID), .CLK(CLK), .RSTn(RSTn) );
	gen_syn # ( .lever(3)) WVALID ( .data_asyn(M_DTM_AXI_WVALID), .data_syn(S_DM_AXI_WVALID), .CLK(CLK), .RSTn(RSTn) );
	gen_syn # ( .lever(3)) BREADY ( .data_asyn(M_DTM_AXI_BREADY), .data_syn(S_DM_AXI_BREADY), .CLK(CLK), .RSTn(RSTn) );
	gen_syn # ( .lever(3)) ARVALID ( .data_asyn(M_DTM_AXI_ARVALID), .data_syn(S_DM_AXI_ARVALID), .CLK(CLK), .RSTn(RSTn) );
	gen_syn # ( .lever(3)) RREADY ( .data_asyn(M_DTM_AXI_RREADY), .data_syn(S_DM_AXI_RREADY), .CLK(CLK), .RSTn(RSTn) );










endmodule

