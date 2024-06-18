// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: gen_csrreg
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-02-05 11:14:21
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-02-05 14:50:15
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

module gen_csrreg #(
	parameter DW = 64,
	parameter rstValue = {DW{1'b0}},
	parameter CSRADDR = 12'b0
)
(

	input [DW-1:0] privi_data,
	input isPrivi,

	input [DW-1:0] csr_op,
	input [11:0] addr,
	input rw,
	input rs,
	input rc,

	output [DW-1:0] qout,

	input CLK,
	input RSTn
);


wire enb;
wire [DW-1:0] dnxtb;

assign enb = (addr == CSRADDR) & (rw | rs | rc);
assign dnxtb = 	  ({DW{rw}} & csr_op)
				| ({DW{rs}} & ( qout |   csr_op ) )
				| ({DW{rc}} & ( qout & (~csr_op)) );



gen_dpdffren  #( .DW(DW), .rstValue(rstValue) ) dpdffren
(
	.dnxta(privi_data),
	.ena(isPrivi),

	.dnxtb(dnxtb),
	.enb(enb),

	.qout(qout),

	.CLK(CLK),
	.RSTn(RSTn)
);







//ASSERT
always @( posedge CLK ) begin
	if ( (rw & rs) | (rs & rc) | (rw & rc) ) begin
		$display("Assert Fail at gen_csrreg");
		$finish;
	end
end


endmodule












