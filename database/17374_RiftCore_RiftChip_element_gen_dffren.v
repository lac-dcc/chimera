// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_dffren
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2020-12-28 10:04:54
* @Last Modified by:   Ruige Lee
<<<<<<< HEAD:element/gen_dffren.v
* @Last Modified time: 2020-12-28 10:09:35
=======
* @Last Modified time: 2021-01-03 12:04:22
>>>>>>> master:core/debug/DMI.v
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


module gen_dffren # (
	parameter DW = 32,
	parameter rstValue = {DW{1'b0}}
)
(

	input [DW-1:0] dnxt,
	output [DW-1:0] qout,
	input en,

	input CLK,
	input RSTn
);



wire [DW-1:0] dffren_dnxt;
wire [DW-1:0] dffren_qout;


gen_dffr # ( .DW(DW), .rstValue(rstValue) ) dffren
(
	.dnxt(dffren_dnxt),
	.qout(dffren_qout),

	.CLK(CLK),
	.RSTn(RSTn)
);


assign dffren_dnxt = en ? dnxt : dffren_qout;
assign qout = dffren_qout;


endmodule





