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
// Design    	: heading_one_detector
// Co-Author(s) : Qi Yang Lim, Zhi Lin Tan, Zhuofan Lin, Zixian Guo
// Email	: qiyanglim@ieee.org, zhilintan@ieee.org, henrylll0406@gmail.com, itslaleyla@gmail.com
// Mentor	: Yang Wei Lim (https://scholar.google.com.my/citations?user=NURveMkAAAAJ&hl=en)
// File      	: heading_one_detector.v
// Modified 	: Aug 30, 2023
//-------------------------------------------------------------------------------------------------------
// Description 
// Priority based heading one detection
//-------------------------------------------------------------------------------------------------------

module heading_one_detector (
	input 			heading_one_en,
	input 	    [15:0] 	BitStream_buffer_output,
	output 	reg [3:0] 	heading_one_pos
);
	
	always @ (heading_one_en or BitStream_buffer_output) begin
		if (heading_one_en == 1'b0) 
		begin
			if (BitStream_buffer_output[15] == 1'b1 || BitStream_buffer_output[14] == 1'b1) 
			begin
				if (BitStream_buffer_output[15] == 1'b1)		heading_one_pos <= 0;
				else                                     		heading_one_pos <= 4'd1; 
			end
			else if (BitStream_buffer_output[13] == 1'b1 || BitStream_buffer_output[12] == 1'b1 || 
				BitStream_buffer_output[11] == 1'b1 || BitStream_buffer_output[10] == 1'b1) 
			begin
				if      (BitStream_buffer_output[13] == 1'b1)	heading_one_pos <= 4'd2;
				else if (BitStream_buffer_output[12] == 1'b1)	heading_one_pos <= 4'd3;
				else if (BitStream_buffer_output[11] == 1'b1)	heading_one_pos <= 4'd4;
				else                                          	heading_one_pos <= 4'd5;
			end
			else 
			begin
				if      (BitStream_buffer_output[9] == 1'b1)	heading_one_pos <= 4'd6;
				else if (BitStream_buffer_output[8] == 1'b1)	heading_one_pos <= 4'd7;
				else if (BitStream_buffer_output[7] == 1'b1)	heading_one_pos <= 4'd8;
				else if (BitStream_buffer_output[6] == 1'b1)	heading_one_pos <= 4'd9;
				else if (BitStream_buffer_output[5] == 1'b1)	heading_one_pos <= 4'd10; 
				else if (BitStream_buffer_output[4] == 1'b1)	heading_one_pos <= 4'd11;
				else if (BitStream_buffer_output[3] == 1'b1)	heading_one_pos <= 4'd12;
				else if (BitStream_buffer_output[2] == 1'b1)	heading_one_pos <= 4'd13;
				else if (BitStream_buffer_output[1] == 1'b1)	heading_one_pos <= 4'd14;
				else                                          	heading_one_pos <= 4'd15;
			end
		end
		else
			heading_one_pos <= 0;													
	end
endmodule
			
		
					
						
