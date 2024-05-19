// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_slffr
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-18 11:43:15
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-01-18 11:53:19
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

module gen_slffr # (
	parameter DW = 1,
	parameter rstValue = 1'b0
)
(

	input [DW-1:0] set_in,
	input [DW-1:0] rst_in,

	output [DW-1:0] qout,

	input CLK,
	input RSTn
);


wire [DW-1:0] rsffr_qout;
gen_rsffr # ( .DW(DW), .rstValue(rstValue)) rsffr ( .set_in(set_in), .rst_in(rst_in), .qout(rsffr_qout), .CLK(CLK), .RSTn(RSTn));


assign qout = set_in | rsffr_qout;

//ASSERT
always @( posedge CLK ) begin
	if ( set_in & rst_in ) begin
		$display("Assert Fail at gen_slff");
		$finish;
	end
end

endmodule

