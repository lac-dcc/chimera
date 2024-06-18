// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: lzp
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-11-03 10:23:12
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-03 12:06:06
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
//find out last 0

module lzp #(
	parameter CW = 2,
	parameter DW = 2**CW
) (
	input [DW-1:0] in_i,
	output [CW-1:0] pos_o,
	output all1,
	output all0
);

//all 0
assign all0 = &(~in_i);
//all 1
assign all1 = &in_i;





wire [127:0] invert_in = ~ (in_i | ( {{(128-DW){1'b1}} , {DW{1'b0}}} ) );

wire sel_lever0;
wire index_lever0;

wire [1:0] sel_lever1;
wire [1:0] index_lever1;

wire [3:0] sel_lever2;
wire [3:0] index_lever2;

wire [7:0] sel_lever3;
wire [7:0] index_lever3;

wire [15:0] sel_lever4;
wire [15:0] index_lever4;

wire [31:0] sel_lever5;
wire [31:0] index_lever5;

wire [63:0] sel_lever6;
wire [63:0] index_lever6;

wire [6:0] pos;
generate
	for ( genvar i = 0; i < 64; i = i + 1 ) begin
		assign index_lever6[i] = invert_in[i*2] | invert_in[i*2+1];
		assign sel_lever6[i] = ~invert_in[i*2];
	end

	for ( genvar i = 0; i < 32; i = i + 1 ) begin
		assign index_lever5[i] = index_lever6[i*2] | index_lever6[i*2+1];
		assign sel_lever5[i] = ~index_lever6[i*2];
	end

	for ( genvar i = 0; i < 16; i = i + 1 ) begin
		assign index_lever4[i] = index_lever5[i*2] | index_lever5[i*2+1];
		assign sel_lever4[i] = ~index_lever5[i*2];
	end	

	for ( genvar i = 0; i < 8; i = i + 1 ) begin
		assign index_lever3[i] = index_lever4[i*2] | index_lever4[i*2+1];
		assign sel_lever3[i] = ~index_lever4[i*2];
	end	

	for ( genvar i = 0; i < 4; i = i + 1 ) begin
		assign index_lever2[i] = index_lever3[i*2] | index_lever3[i*2+1];
		assign sel_lever2[i] = ~index_lever3[i*2];
	end	

	for ( genvar i = 0; i < 2; i = i + 1 ) begin
		assign index_lever1[i] = index_lever2[i*2] | index_lever2[i*2+1];
		assign sel_lever1[i] = ~index_lever2[i*2];
	end	


	assign index_lever0 = index_lever1[0] | index_lever1[1];
	assign sel_lever0 = ~index_lever1[0];
	

endgenerate

	assign pos[6] = sel_lever0;
	assign pos[5] = sel_lever1[pos[6]];
	assign pos[4] = sel_lever2[pos[6:5]];
	assign pos[3] = sel_lever3[pos[6:4]];
	assign pos[2] = sel_lever4[pos[6:3]];
	assign pos[1] = sel_lever5[pos[6:2]];
	assign pos[0] = sel_lever6[pos[6:1]];

	assign pos_o = pos[CW-1:0];



endmodule







