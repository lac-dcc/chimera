// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: regFiles
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-10-21 14:34:23
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:05:43
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

module regFiles
(

	output [(64*`RP*32)-1:0] regFileX_qout,
	input  [(64*`RP*32)-1:0] regFileX_dnxt,

	input CLK,
	input RSTn
);

assign regFileX_qout[64*`RP-1:0] = {64*`RP{1'b0}};

generate
	
	for ( genvar regNum = 1; regNum < 32; regNum = regNum + 1 ) begin
		for ( genvar depth = 0 ; depth < `RP; depth = depth + 1 ) begin

			localparam  SEL = regNum*4+depth;

			gen_dffr  #(.DW(64)) int_regX ( .dnxt(regFileX_dnxt[64*SEL +: 64]), .qout(regFileX_qout[64*SEL +: 64]), .CLK(CLK), .RSTn(RSTn) );

		end
	end



endgenerate









endmodule







