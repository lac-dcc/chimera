// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_rsffr
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-29 18:02:54
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-05 19:17:21
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

module gen_rsffr # (
	parameter DW = 1,
	parameter rstValue = {DW{1'b0}}
)
(

	input [DW-1:0] set_in,
	input [DW-1:0] rst_in,

	output [DW-1:0] qout,

	input CLK,
	input RSTn
);

reg [DW-1:0] qout_r;

generate
	for ( genvar i = 0; i < DW; i = i + 1 ) begin

		always @(posedge CLK or negedge RSTn) begin
			if ( ~RSTn ) begin
				qout_r[i] <= #1 rstValue[i];
			end 
			else begin
				qout_r[i] <= #1 qout_r[i];
				if ( set_in[i] ) begin
					qout_r[i] <= #1 1'b1;
				end
				if ( rst_in[i] ) begin
					qout_r[i] <= #1 1'b0;	
				end
			end
		end
	end
endgenerate

assign qout = qout_r;

endmodule










