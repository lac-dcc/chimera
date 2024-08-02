// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_sram
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-04 17:37:00
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-24 17:38:10
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



module gen_sram #
(
	parameter DW = 32,
	parameter AW = 14
)
(

	input [DW-1:0] data_w,
	input [AW-1:0] addr_w,
	input [(DW+7)/8-1:0] data_wstrb,
	input en_w,


	output [DW-1:0] data_r,
	input [AW-1:0] addr_r,
	input en_r,

	input CLK

);

	localparam DP = 2**AW;
	localparam DW_ZM = (DW+7)/8*8;

	reg [DW_ZM-1:0] ram[0:DP-1];
	reg [DW_ZM-1:0] data_r_reg;
	wire [DW_ZM-1:0] data_w_zmask = {DW_ZM{1'b0}} | data_w;


	generate
		for ( genvar i = 0; i < (DW+7)/8; i = i + 1) begin
			always @(posedge CLK) begin
				if (en_w) begin
					if (data_wstrb[i]) begin
						ram[addr_w][i*8+:8] <= #1 data_w_zmask[i*8+:8] ;					
					end
				end

				if (en_r) begin
					data_r_reg[i*8+:8] <= #1 ram[addr_r][i*8+:8];
				end
			end


		end
	endgenerate
	
	assign data_r = data_r_reg[DW-1:0];


integer i;
initial begin
	for ( i = 0; i < DP; i = i + 1 ) begin
		ram[i] = $random;
	end
	
	data_r_reg = $random;
end


endmodule












