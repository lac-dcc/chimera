// This program was cloned from: https://github.com/whutddk/RiftCore
// License: Apache License 2.0

/*
* @File name: preDecode
* @Author: Ruige Lee
* @Email: wut.ruigeli@gmail.com
* @Date:   2021-01-05 16:23:28
* @Last Modified by:   Ruige Lee
* @Last Modified time: 2021-03-11 11:04:35
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




module preDecode (
	input [255:0] instr_load,
	input [15:0] iq_instr_mask_load,

	output instr_buf_empty,
	output isJal,
	output isJalr,
	output isBranch,
	output isCall,
	output isReturn,
	output isRVC,
	output isFencei,
	output [63:0] imm
);

	assign instr_buf_empty = ((iq_instr_mask_load[1] != 1'b1) & instr_load[1:0] == 2'b11)
							|
							((iq_instr_mask_load[0] != 1'b1) );

	wire [31:0] instr = instr_load[31:0];

	assign isRVC = ~instr_buf_empty & (instr[1:0] != 2'b11);

	wire isIJal = ~isRVC & (instr[6:0] == 7'b1101111);			
	wire isCJal =	 instr[1:0] == 2'b01 & instr[15:13] == 3'b101;

	wire isIJalr = ~isRVC & (instr[6:0] == 7'b1100111);
	wire isCJalr = (instr[1:0] == 2'b10 & instr[15:13] == 3'b100)
					&
					(
						(~instr[12] & (instr[6:2] == 0)) 
						| 
						( instr[12] & (|instr[11:7]) & (&(~instr[6:2])))
					);

	wire isIBranch = ~isRVC & (instr[6:0] == 7'b1100011);
	wire isCBranch = instr[1:0] == 2'b01 & instr[15:14] == 2'b11;

	wire isICall = (isIJalr | isIJal) & ((instr[11:7] == 5'd1) | instr[11:7] == 5'd5);
	wire isCCall = isCJalr & instr[12];

	wire isIReturn = isIJalr & ((instr[19:15] == 5'd1) | instr[19:15] == 5'd5)
									& (instr[19:15] != instr[11:7]);

	wire isCReturn = isCJalr & ~instr[12]
							& ((instr[11:7] == 5'd1) | (instr[11:7] == 5'd5));


	wire [63:0] Iimm = 
		({64{isIJal}} & {{44{instr[31]}},instr[19:12],instr[20],instr[30:21],1'b0})
		|
		({64{isIJalr}} & {{52{instr[31]}},instr[31:20]})
		|
		({64{isIBranch}} & {{52{instr[31]}},instr[7],instr[30:25],instr[11:8],1'b0});

	wire [63:0] Cimm = 
		({64{isCJal}} & {{52{instr[12]}}, instr[12], instr[8], instr[10:9], instr[6], instr[7], instr[2], instr[11], instr[5:3], 1'b0})
		|
		({64{isCJalr}} & 64'b0)
		|
		({64{isCBranch}} & {{55{instr[12]}}, instr[12], instr[6:5], instr[2], instr[11:10], instr[4:3], 1'b0});

	assign isJal = ~instr_buf_empty & (isIJal | isCJal); 
	assign isJalr = ~instr_buf_empty & (isIJalr | isCJalr);
	assign isBranch = ~instr_buf_empty & (isIBranch | isCBranch);
	assign isCall = ~instr_buf_empty & (isICall | isCCall);
	assign isReturn = ~instr_buf_empty & (isIReturn | isCReturn);

	assign isFencei = (instr[6:0] == 7'b0001111) & (instr[14:12] == 3'b001);

	assign imm = isRVC ? Cimm : Iimm;


endmodule









