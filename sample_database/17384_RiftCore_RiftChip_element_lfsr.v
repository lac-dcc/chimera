// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: lfsr
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-28 17:59:22
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-26 17:38:38
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

module lfsr
(
	output [15:0] random,

	input CLK
);





reg [15:0] shiftReg;

initial begin shiftReg = $random; end

wire tap;

always @(posedge CLK) begin
	shiftReg <= #1 { shiftReg[14:0], tap };
end

assign tap = shiftReg[15] ^ shiftReg[4] ^ shiftReg[2] ^ shiftReg[1];
assign random = shiftReg;




endmodule





