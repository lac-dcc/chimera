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

`ifndef _STROBE_
`define _STROBE_

module stud_strobe #(parameter WIDTH=8)(
	input              clk_i,
	input        	   rst_n_i,
	input  [1:0] 	   osr_i,
	output             audio_rd_o
);

reg strb, next_strb;
reg[WIDTH-1:0] counter, next_counter;
localparam [7:0] OSR32 = 8'd31;
localparam [7:0] OSR64 = 8'd63;
localparam [7:0] OSR128 = 8'd127;
localparam [7:0] OSR256 = 8'd255;


assign audio_rd_o = strb;

always @(posedge clk_i) begin
	    // we use a synchronous reset
    if (!rst_n_i) begin
	strb	   <= 1'b0;
	counter    <= {WIDTH{1'b0}};
    end else begin
	strb	   <= next_strb;
	counter    <= next_counter;
    end
  end

  always @(counter, osr_i, strb)begin
	next_counter = counter;
	next_strb  = strb;
	next_counter = counter - 1'b1;
	if (counter == 8'd0)begin
		case(osr_i)
		2'b00: begin
			next_counter = OSR32;
		end
		2'b01: begin
			next_counter = OSR64;
		end
		2'b10: begin
			next_counter = OSR128;
		end
		2'b11: begin
			next_counter = OSR256;
		end
		default: next_counter = OSR128;
		endcase
	end
	if (next_counter == 8'd0)begin //generate strobe every time the counter reaches 0
		next_strb = 1'b1;
	end else begin
		next_strb = 1'b0;
	end
  end


endmodule
`endif
