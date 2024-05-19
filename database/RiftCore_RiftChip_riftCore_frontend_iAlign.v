// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: iAlign
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-11 10:11:32
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-10 17:29:14
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

//now if pc is 64bit align
module iAlign (

	input [63:0] ic_iq_pc,
	input [63:0] ic_iq_instr,

	output [63:0] align_instr,
	output [3:0] align_instr_mask

);

	wire [2:0] pc_lsb = ic_iq_pc[2:0];


	assign align_instr = 
			( {64{pc_lsb == 3'b000}} & ic_iq_instr)
			|
			( {64{pc_lsb == 3'b010}} & {16'b0, ic_iq_instr[63:16]} )
			|
			( {64{pc_lsb == 3'b100}} & {32'b0, ic_iq_instr[63:32]})
			|
			( {64{pc_lsb == 3'b110}} & {48'b0, ic_iq_instr[63:48]});

	assign align_instr_mask = 
			( {4{pc_lsb == 3'b000}} & 4'b1111)
			|
			( {4{pc_lsb == 3'b010}} & 4'b0111 )
			|
			( {4{pc_lsb == 3'b100}} & 4'b0011)
			|
			( {4{pc_lsb == 3'b110}} & 4'b0001);





endmodule












