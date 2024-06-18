// This program was cloned from: https://github.com/unic-cass/IC1-CASS-2023
// License: Apache License 2.0

// SPDX-FileCopyrightText: 2022 Efabless Corporation
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

//-------------------------------------------------------------------------------------------------------
// Title    	: H.264/AVC Baseline Decoder
// Author	: Ke Xu
// Released 	: April 30, 2008
// Version 	: 1.0
// Availability	: https://opencores.org/projects/nova
//-------------------------------------------------------------------------------------------------------
// Design    	: exp_golomb_decoding
// Co-Author(s) : Qi Yang Lim, Zhi Lin Tan, Zhuofan Lin, Zixian Guo
// Email	: qiyanglim@ieee.org, zhilintan@ieee.org, henrylll0406@gmail.com, itslaleyla@gmail.com
// Mentor	: Yang Wei Lim (https://scholar.google.com.my/citations?user=NURveMkAAAAJ&hl=en)
// File      	: exp_golomb_decoding.v
// Modified 	: Aug 30, 2023
//-------------------------------------------------------------------------------------------------------
// Description 
// Exp-Golomb code decoding
//-------------------------------------------------------------------------------------------------------

module exp_golomb_decoding (
	input 	    [3:0] 	heading_one_pos,
	input 	    [15:0] 	BitStream_buffer_output,
	input 	    [1:0] 	exp_golomb_sel,
	input       [2:0]       te_range,
	output 	reg [7:0] 	exp_golomb_decoding_output,
	output 	reg [3:0] 	exp_golomb_len
);	
	
	parameter rst_exp_golomb_sel = 2'b00;
	parameter ue 				 = 2'b01;
	parameter se 				 = 2'b10;
	parameter te 				 = 2'b11; 

	reg [7:0] codeNum;

	always @ (exp_golomb_sel or heading_one_pos or BitStream_buffer_output) begin
		if (exp_golomb_sel != rst_exp_golomb_sel) 
		begin
			case (heading_one_pos)
				0: codeNum <= 0;											
				1: codeNum <= {6'b0,BitStream_buffer_output[14:13]} - 1;
				2: codeNum <= {5'b0,BitStream_buffer_output[13:11]} - 1;
				3: codeNum <= {4'b0,BitStream_buffer_output[12:9]}  - 1;
				4: codeNum <= {3'b0,BitStream_buffer_output[11:7]}  - 1;
				5: codeNum <= {2'b0,BitStream_buffer_output[10:5]}  - 1;
				6: codeNum <= {1'b0,BitStream_buffer_output[9:3]}   - 1;
				7: codeNum <= BitStream_buffer_output[8:1]          - 1;
				default: codeNum <= 0;
			endcase
		end
		else
			codeNum <= 0;
	end
	
	always @ (exp_golomb_sel or heading_one_pos or te_range) begin
		case (exp_golomb_sel)
			ue, se: 
				exp_golomb_len 	<= (heading_one_pos << 1) + 1;
			te:
				exp_golomb_len 	<= (te_range == 2) ? 1 : ((heading_one_pos << 1) + 1);
			default: 
				exp_golomb_len 	<= 0;
		endcase
	end
		
	wire [7:0] codeNum_se_tmp; 
	assign codeNum_se_tmp = codeNum >> 1;

	always @ (exp_golomb_sel or codeNum or codeNum_se_tmp or te_range) begin
		case (exp_golomb_sel)
			ue:
				exp_golomb_decoding_output <= codeNum;
			se:
				case (codeNum[0])
					1:exp_golomb_decoding_output <= (codeNum + 1) >> 1;
					0:exp_golomb_decoding_output <= ~codeNum_se_tmp + 1;
				endcase
			te:
				if (te_range == 2)	
					exp_golomb_decoding_output <= (codeNum == 0)? 8'd0:8'd1;
				else				
					exp_golomb_decoding_output <= codeNum;
			default:
				exp_golomb_decoding_output <= 0;
		endcase
	end
endmodule
			
	
