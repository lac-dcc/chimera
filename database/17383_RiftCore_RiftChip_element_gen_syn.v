// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_syn
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-04 19:25:48
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-10 15:44:28
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


module gen_syn #
(
	parameter lever = 2
)
(

	input data_asyn,
	output data_syn,

	input CLK,
	input RSTn
	
);



wire [lever-1 : 0] syn_dnxt;
wire [lever-1 : 0] syn_qout;

assign syn_dnxt = {syn_qout[lever-2:0], data_asyn};
assign data_syn = syn_qout[lever-1];

gen_dffr # ( .DW(lever) ) syn ( .dnxt(syn_dnxt), .qout(syn_qout), .CLK(CLK), .RSTn(RSTn) );



















endmodule





