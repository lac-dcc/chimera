// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: pcGenerate
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-13 16:56:39
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-12 11:39:52
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

module pcGenerate (

	// from expection 	
	input [63:0] privileged_pc,
	input privileged_valid,

	//from instr_queue,
	input branch_pc_valid,
	input [63:0] branch_pc,

	//to ifetch
	output [63:0] fetch_addr_qout,
	input pcGen_fetch_ready,

	input flush,
	input CLK,
	input RSTn

);


	wire [63:0] fetch_addr_dnxt;






	assign fetch_addr_dnxt = 
				privileged_valid ? privileged_pc : 
					(branch_pc_valid ?  branch_pc :  ( (fetch_addr_qout&(~64'b111)) + 64'd8));






	gen_dffren # (.DW(64), .rstValue(64'h8000_0000)) fetch_addr_en ( .dnxt(fetch_addr_dnxt), .qout(fetch_addr_qout), .en(pcGen_fetch_ready|flush), .CLK(CLK), .RSTn(RSTn));













endmodule










