// This program was cloned from: https://github.com/qmn/riscv-invicta
// License: BSD 2-Clause "Simplified" License

/* 
 * Copyright (c) 2013, Quan Nguyen
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 *     Redistributions of source code must retain the above copyright notice, this
 * list of conditions and the following disclaimer.
 *     Redistributions in binary form must reproduce the above copyright notice,
 * this list of conditions and the following disclaimer in the documentation and/or
 * other materials provided with the distribution.
 * 
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR
 * ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
 * ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

module memory_mux (
	input select,

	input enable_0,
	input command_0,
	input [31:0] address_0,
	input [31:0] write_data_0,
	input [3:0]  write_mask_0,
	output [31:0] read_data_0,
	output valid_0,
	
	input enable_1,
	input command_1,
	input [31:0] address_1,
	input [31:0] write_data_1,
	input [3:0]  write_mask_1,
	output [31:0] read_data_1,
	output valid_1,

	output enable,
	output command,
	output [31:0] address,
	output [31:0] write_data,
	output [3:0] write_mask,
	input [31:0] read_data,
	input valid
);

	assign enable = select ? enable_1 : enable_0;
	assign command = select ? command_1 : command_0;
	assign address = select ? address_1 : address_0;
	assign write_data = select ? write_data_1 : write_data_0;
	assign write_mask = select ? write_mask_1 : write_mask_0;
	assign read_data_1 = read_data;
	assign read_data_0 = read_data;
	assign valid_1 =  select ? valid : 1'b0;
	assign valid_0 = !select ? valid : 1'b0;

endmodule
	
