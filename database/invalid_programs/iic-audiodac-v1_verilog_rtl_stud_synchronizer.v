// This program was cloned from: https://github.com/iic-jku/iic-audiodac-v1
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2022 Johannes Kepler University, Institute for 
// Integrated Circuits (H. Pretl, L. Blagojevic, M. Esen, K. Freinberger, 
// M. Golser, M. Hackl, A. Hinterdorfer, O. Kara, D. Kellerer, P. Kotek, 
// J. Mayrhofer, M. Meingast, T. Pankratz, J. Ratschenberger, R. Reddy.Mitta, 
// P. Schmidt, S. Seidl, I. Shala, M. Zöbl)
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`ifndef _SYNCHRONIZER_
`define _SYNCHRONIZER_

`include "stud_d_flip_flop.v"

module stud_synchronizer
	#(parameter N=4,
	  parameter WIDTH = 16)
	(	input clk_i, rst_n_i,
		input [WIDTH-1:0] input_i,
		output [WIDTH-1:0] output_o);

	genvar i;
	genvar w;
	wire [WIDTH-1:0] buffer [0:N-1];
	generate
		/* Generate chain for each bit in WIDTH*/
		for(w = 0; w < WIDTH; w = w + 1) begin
			/* First FF in chain*/
			stud_d_flip_flop d0(clk_i, rst_n_i, input_i[w], buffer[0][w]);
			/* Every other FF in chain*/
			for(i = 1; i < N; i = i + 1) begin
				stud_d_flip_flop d_mid (clk_i, rst_n_i, buffer[i-1][w], buffer[i][w]);
			end
		end
	endgenerate
	assign output_o = buffer[N-1];	
endmodule
`endif
