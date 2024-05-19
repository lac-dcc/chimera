// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_dffr
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-09-14 10:25:09
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-18 11:43:32
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

module gen_dffr # (
	parameter DW = 32,
	parameter rstValue = {DW{1'b0}}
)
(

	input [DW-1:0] dnxt,
	output [DW-1:0] qout,

	input CLK,
	input RSTn
);

reg [DW-1:0] qout_r;

always @(posedge CLK or negedge RSTn) begin
	if ( ~RSTn )
		qout_r <= #1 rstValue;
	else                  
		qout_r <= #1 dnxt;
end

assign qout = qout_r;

endmodule












