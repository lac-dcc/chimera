// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: corssbar_tb
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-14 11:36:12
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-14 12:11:52
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



module corssbar_tb (

);




	reg lsu_mstReq_valid;
	wire lsu_mstReq_ready;
	reg [63:0] lsu_addr;
	reg [63:0] lsu_data_w;
	wire [63:0] lsu_data_r;
	reg [7:0] lsu_wstrb;
	reg lsu_wen;
	wire lsu_slvRsp_valid;

	reg ifu_mstReq_valid;
	wire ifu_mstReq_ready;
	reg [63:0] ifu_addr;
	reg [63:0] ifu_data_w;
	wire [63:0] ifu_data_r;
	reg [7:0] ifu_wstrb;
	reg ifu_wen;
	wire ifu_slvRsp_valid;

	wire clint_mstReq_valid;
	reg clint_mstReq_ready;
	wire [63:0] clint_addr;
	wire [63:0] clint_data_w;
	reg [63:0] clint_data_r;
	wire [7:0] clint_wstrb;
	wire clint_wen;
	reg clint_slvRsp_valid;

	wire plic_mstReq_valid;
	reg plic_mstReq_ready;
	wire [63:0] plic_addr;
	wire [63:0] plic_data_w;
	reg [63:0] plic_data_r;
	wire [7:0] plic_wstrb;
	wire plic_wen;
	reg plic_slvRsp_valid;

	wire sysbus_mstReq_valid;
	reg sysbus_mstReq_ready;
	wire [63:0] sysbus_addr;
	wire [63:0] sysbus_data_w;
	reg [63:0] sysbus_data_r;
	wire [7:0] sysbus_wstrb;
	wire sysbus_wen;
	reg sysbus_slvRsp_valid;

	wire perip_mstReq_valid;
	reg perip_mstReq_ready;
	wire [63:0] perip_addr;
	wire [63:0] perip_data_w;
	reg [63:0] perip_data_r;
	wire [7:0] perip_wstrb;
	wire perip_wen;
	reg perip_slvRsp_valid;

	wire mem_mstReq_valid;
	reg mem_mstReq_ready;
	wire [63:0] mem_addr;
	wire [63:0] mem_data_w;
	reg [63:0] mem_data_r;
	wire [7:0] mem_wstrb;
	wire mem_wen;
	reg mem_slvRsp_valid;











innerbus_crossbar  s_Xbar(

	.dm_mstReq_valid(1'b0),
	.dm_mstReq_ready(),
	.dm_addr('d0),
	.dm_data_w('d0),
	.dm_data_r(),
	.dm_wstrb('d0),
	.dm_wen('b0),
	.dm_slvRsp_valid(),

	.lsu_mstReq_valid(lsu_mstReq_valid),
	.lsu_mstReq_ready(lsu_mstReq_ready),
	.lsu_addr(lsu_addr),
	.lsu_data_w(lsu_data_w),
	.lsu_data_r(lsu_data_r),
	.lsu_wstrb(lsu_wstrb),
	.lsu_wen(lsu_wen),
	.lsu_slvRsp_valid(lsu_slvRsp_valid),

	.ifu_mstReq_valid(ifu_mstReq_valid),
	.ifu_mstReq_ready(ifu_mstReq_ready),
	.ifu_addr(ifu_addr),
	.ifu_data_w(ifu_data_w),
	.ifu_data_r(ifu_data_r),
	.ifu_wstrb(ifu_wstrb),
	.ifu_wen(ifu_wen),
	.ifu_slvRsp_valid(ifu_slvRsp_valid),

	.clint_mstReq_valid(clint_mstReq_valid),
	.clint_mstReq_ready(clint_mstReq_ready),
	.clint_addr(clint_addr),
	.clint_data_w(clint_data_w),
	.clint_data_r(clint_data_r),
	.clint_wstrb(clint_wstrb),
	.clint_wen(clint_wen),
	.clint_slvRsp_valid(clint_slvRsp_valid),

	output plic_mstReq_valid,
	input plic_mstReq_ready,
	output [63:0] plic_addr,
	output [63:0] plic_data_w,
	input [63:0] plic_data_r,
	output [7:0] plic_wstrb,
	output plic_wen,
	input plic_slvRsp_valid,

	output sysbus_mstReq_valid,
	input sysbus_mstReq_ready,
	output [63:0] sysbus_addr,
	output [63:0] sysbus_data_w,
	input [63:0] sysbus_data_r,
	output [7:0] sysbus_wstrb,
	output sysbus_wen,
	input sysbus_slvRsp_valid,

	output perip_mstReq_valid,
	input perip_mstReq_ready,
	output [63:0] perip_addr,
	output [63:0] perip_data_w,
	input [63:0] perip_data_r,
	output [7:0] perip_wstrb,
	output perip_wen,
	input perip_slvRsp_valid,

	output mem_mstReq_valid,
	input mem_mstReq_ready,
	output [63:0] mem_addr,
	output [63:0] mem_data_w,
	input [63:0] mem_data_r,
	output [7:0] mem_wstrb,
	output mem_wen,
	input mem_slvRsp_valid,

	input feflush,
	input beflush,
	input CLK,
	input RSTn


);











endmodule










