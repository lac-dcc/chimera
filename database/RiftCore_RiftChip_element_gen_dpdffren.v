// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_dpdffren
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-05 11:03:45
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 11:33:54
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


module gen_dpdffren  #(
	parameter DW = 32,
	parameter rstValue = {DW{1'b0}}
)
(

	input [DW-1:0] dnxta,
	input ena,

	input [DW-1:0] dnxtb,
	input enb,

	output [DW-1:0] qout,

	input CLK,
	input RSTn
);

wire en;
wire [DW-1:0] dnxt;



assign en = ena | enb;
assign dnxt = 	{DW{ena}} & dnxta
				| 
				{DW{(~ena)&enb}} & dnxtb;


gen_dffren # ( .DW(DW), .rstValue(rstValue) ) dffren
(

	.dnxt(dnxt),
	.qout(qout),
	.en(en),

	.CLK(CLK),
	.RSTn(RSTn)
);




endmodule


