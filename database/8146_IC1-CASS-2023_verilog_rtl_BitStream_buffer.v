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
// Design    	: BitStream_buffer
// Co-Author(s) : Qi Yang Lim, Zhi Lin Tan, Zhuofan Lin, Zixian Guo
// Email	: qiyanglim@ieee.org, zhilintan@ieee.org, henrylll0406@gmail.com, itslaleyla@gmail.com
// Mentor	: Yang Wei Lim (https://scholar.google.com.my/citations?user=NURveMkAAAAJ&hl=en)
// File      	: BitStream_buffer.v
// Modified 	: Sep 19, 2023
//-------------------------------------------------------------------------------------------------------
// Description 
// Circular buffer for bitstream
//-------------------------------------------------------------------------------------------------------

module BitStream_buffer (
	input 			clk,
	input 			reset_n,
	input 		[15:0] 	BitStream_buffer_input,
	input 		[3:0] 	exp_golomb_len,
	
	output 	reg		BitStream_buffer_valid_n,
	output 	reg 	[15:0] 	BitStream_buffer_output,

	// outputs for test_data_controller.v
	output	reg 	[3:0] 	reset_counter,
	output	reg 	[2:0] 	half_fill_counter
);
	// pc counter
	reg 	[6:0] 	pc;
	reg 	[6:0] 	pc_reg;

	reg 	[0:127]	BS_buffer;
	reg 	[6:0] 	pc_previous;
	reg 	[6:0] 	buffer_index; //for buffer write 


	// program counter
	always @ (exp_golomb_len or pc_reg) begin
			pc <= pc_reg + exp_golomb_len;
	end

	always @ (posedge clk) begin
		pc_reg <= (reset_n == 1'b0) ? 0:pc;
	end


	// circular bitstream buffer
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			pc_previous <= 0;
		else
			pc_previous <= pc;
	end
	
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			reset_counter <= 0;
		else if (reset_counter < 10)
			reset_counter <= reset_counter + 1;	
	end
	
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			half_fill_counter <= 0;
		else if (reset_counter == 10) 
		begin
			if (((pc > 63 && pc_previous <= 63) || 
					(pc <63 && pc_previous >=63)) && half_fill_counter == 0)
				half_fill_counter <= 1;
			else if (pc > 63 && half_fill_counter == 0 && buffer_index == 0)
				half_fill_counter <= 1;
			else if (pc < 63 && half_fill_counter == 0 && buffer_index == 64)
				half_fill_counter <= 1;
			else if (half_fill_counter > 0 && half_fill_counter < 5)
				half_fill_counter <= half_fill_counter + 1;
			else if (half_fill_counter == 5)
				half_fill_counter <= 0;
		end
	end
				
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			buffer_index <= 0;
		else if (reset_counter > 1 && reset_counter < 10)
			buffer_index <= buffer_index + 16; 
		else if (half_fill_counter > 1 && half_fill_counter <= 5)
			buffer_index <= buffer_index + 16;
	end
	
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			BitStream_buffer_valid_n <= 1'b1;
		else if (reset_counter == 10)
			BitStream_buffer_valid_n <= 1'b0;
	end
	
	integer	i;
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			BS_buffer <= 0;
		else if ((reset_counter > 1 && reset_counter < 10) || 
					(half_fill_counter > 1 && half_fill_counter <= 5))  
		begin
			case (buffer_index[6:4])
				3'b000:
					for (i=0;i<16;i=i+1)
						BS_buffer[i] <= BitStream_buffer_input[15-i];
				3'b001:
					for (i=0;i<16;i=i+1)
						BS_buffer[16+i] <= BitStream_buffer_input[15-i];
				3'b010:
					for (i=0;i<16;i=i+1)
						BS_buffer[32+i] <= BitStream_buffer_input[15-i];
				3'b011:
					for (i=0;i<16;i=i+1)
						BS_buffer[48+i] <= BitStream_buffer_input[15-i];
				3'b100:
					for (i=0;i<16;i=i+1)
						BS_buffer[64+i] <= BitStream_buffer_input[15-i];
				3'b101:
					for (i=0;i<16;i=i+1)
						BS_buffer[80+i] <= BitStream_buffer_input[15-i];
				3'b110:
					for (i=0;i<16;i=i+1)
						BS_buffer[96+i] <= BitStream_buffer_input[15-i];
				3'b111:
					for (i=0;i<16;i=i+1)
						BS_buffer[112+i] <= BitStream_buffer_input[15-i];
			endcase
		end
	end
				
	always @ (posedge clk) begin
		if (reset_n == 1'b0)
			BitStream_buffer_output <= 0;
		else if (BitStream_buffer_valid_n == 0)
		begin
			case (pc)
				0  : BitStream_buffer_output <=  BS_buffer[0:15];
				1  : BitStream_buffer_output <= BS_buffer[1:16];
				2  : BitStream_buffer_output <= BS_buffer[2:17];
				3  : BitStream_buffer_output <= BS_buffer[3:18];
				4  : BitStream_buffer_output <= BS_buffer[4:19];
				5  : BitStream_buffer_output <= BS_buffer[5:20];
				6  : BitStream_buffer_output <= BS_buffer[6:21];
				7  : BitStream_buffer_output <= BS_buffer[7:22];
				8  : BitStream_buffer_output <= BS_buffer[8:23];
				9  : BitStream_buffer_output <= BS_buffer[9:24];
				10 : BitStream_buffer_output <= BS_buffer[10:25];
				11 : BitStream_buffer_output <= BS_buffer[11:26];
				12 : BitStream_buffer_output <= BS_buffer[12:27];
				13 : BitStream_buffer_output <= BS_buffer[13:28];
				14 : BitStream_buffer_output <= BS_buffer[14:29];
				15 : BitStream_buffer_output <= BS_buffer[15:30];
				16 : BitStream_buffer_output <= BS_buffer[16:31];
				17 : BitStream_buffer_output <= BS_buffer[17:32];
				18 : BitStream_buffer_output <= BS_buffer[18:33];
				19 : BitStream_buffer_output <= BS_buffer[19:34];
				20 : BitStream_buffer_output <= BS_buffer[20:35];
				21 : BitStream_buffer_output <= BS_buffer[21:36];
				22 : BitStream_buffer_output <= BS_buffer[22:37];
				23 : BitStream_buffer_output <= BS_buffer[23:38];
				24 : BitStream_buffer_output <= BS_buffer[24:39];
				25 : BitStream_buffer_output <= BS_buffer[25:40];
				26 : BitStream_buffer_output <= BS_buffer[26:41];
				27 : BitStream_buffer_output <= BS_buffer[27:42];
				28 : BitStream_buffer_output <= BS_buffer[28:43];
				29 : BitStream_buffer_output <= BS_buffer[29:44];
				30 : BitStream_buffer_output <= BS_buffer[30:45];
				31 : BitStream_buffer_output <= BS_buffer[31:46];
				32 : BitStream_buffer_output <= BS_buffer[32:47];
				33 : BitStream_buffer_output <= BS_buffer[33:48];
				34 : BitStream_buffer_output <= BS_buffer[34:49];
				35 : BitStream_buffer_output <= BS_buffer[35:50];
				36 : BitStream_buffer_output <= BS_buffer[36:51];
				37 : BitStream_buffer_output <= BS_buffer[37:52];
				38 : BitStream_buffer_output <= BS_buffer[38:53];
				39 : BitStream_buffer_output <= BS_buffer[39:54];
				40 : BitStream_buffer_output <= BS_buffer[40:55];
				41 : BitStream_buffer_output <= BS_buffer[41:56];
				42 : BitStream_buffer_output <= BS_buffer[42:57];
				43 : BitStream_buffer_output <= BS_buffer[43:58];
				44 : BitStream_buffer_output <= BS_buffer[44:59];
				45 : BitStream_buffer_output <= BS_buffer[45:60];
				46 : BitStream_buffer_output <= BS_buffer[46:61];
				47 : BitStream_buffer_output <= BS_buffer[47:62];
				48 : BitStream_buffer_output <= BS_buffer[48:63];
				49 : BitStream_buffer_output <= BS_buffer[49:64];
				50 : BitStream_buffer_output <= BS_buffer[50:65];
				51 : BitStream_buffer_output <= BS_buffer[51:66];
				52 : BitStream_buffer_output <= BS_buffer[52:67];
				53 : BitStream_buffer_output <= BS_buffer[53:68];
				54 : BitStream_buffer_output <= BS_buffer[54:69];
				55 : BitStream_buffer_output <= BS_buffer[55:70];
				56 : BitStream_buffer_output <= BS_buffer[56:71];
				57 : BitStream_buffer_output <= BS_buffer[57:72];
				58 : BitStream_buffer_output <= BS_buffer[58:73];
				59 : BitStream_buffer_output <= BS_buffer[59:74];
				60 : BitStream_buffer_output <= BS_buffer[60:75];
				61 : BitStream_buffer_output <= BS_buffer[61:76];
				62 : BitStream_buffer_output <= BS_buffer[62:77];
				63 : BitStream_buffer_output <= BS_buffer[63:78];
				64 : BitStream_buffer_output <= BS_buffer[64:79];
				65 : BitStream_buffer_output <= BS_buffer[65:80];
				66 : BitStream_buffer_output <= BS_buffer[66:81];
				67 : BitStream_buffer_output <= BS_buffer[67:82];
				68 : BitStream_buffer_output <= BS_buffer[68:83];
				69 : BitStream_buffer_output <= BS_buffer[69:84];
				70 : BitStream_buffer_output <= BS_buffer[70:85];
				71 : BitStream_buffer_output <= BS_buffer[71:86];
				72 : BitStream_buffer_output <= BS_buffer[72:87];
				73 : BitStream_buffer_output <= BS_buffer[73:88];
				74 : BitStream_buffer_output <= BS_buffer[74:89];
				75 : BitStream_buffer_output <= BS_buffer[75:90];
				76 : BitStream_buffer_output <= BS_buffer[76:91];
				77 : BitStream_buffer_output <= BS_buffer[77:92];
				78 : BitStream_buffer_output <= BS_buffer[78:93];
				79 : BitStream_buffer_output <= BS_buffer[79:94];
				80 : BitStream_buffer_output <= BS_buffer[80:95];
				81 : BitStream_buffer_output <= BS_buffer[81:96];
				82 : BitStream_buffer_output <= BS_buffer[82:97];
				83 : BitStream_buffer_output <= BS_buffer[83:98];
				84 : BitStream_buffer_output <= BS_buffer[84:99];
				85 : BitStream_buffer_output <= BS_buffer[85:100];
				86 : BitStream_buffer_output <= BS_buffer[86:101];
				87 : BitStream_buffer_output <= BS_buffer[87:102];
				88 : BitStream_buffer_output <= BS_buffer[88:103];
				89 : BitStream_buffer_output <= BS_buffer[89:104];
				90 : BitStream_buffer_output <= BS_buffer[90:105];
				91 : BitStream_buffer_output <= BS_buffer[91:106];
				92 : BitStream_buffer_output <= BS_buffer[92:107];
				93 : BitStream_buffer_output <= BS_buffer[93:108];
				94 : BitStream_buffer_output <= BS_buffer[94:109];
				95 : BitStream_buffer_output <= BS_buffer[95:110];
				96 : BitStream_buffer_output <= BS_buffer[96:111];
				97 : BitStream_buffer_output <= BS_buffer[97:112];
				98 : BitStream_buffer_output <= BS_buffer[98:113];
				99 : BitStream_buffer_output <= BS_buffer[99:114];
				100: BitStream_buffer_output <= BS_buffer[100:115];
				101: BitStream_buffer_output <= BS_buffer[101:116];
				102: BitStream_buffer_output <= BS_buffer[102:117];
				103: BitStream_buffer_output <= BS_buffer[103:118];
				104: BitStream_buffer_output <= BS_buffer[104:119]; 
				105: BitStream_buffer_output <= BS_buffer[105:120];
				106: BitStream_buffer_output <= BS_buffer[106:121];
				107: BitStream_buffer_output <= BS_buffer[107:122];
				108: BitStream_buffer_output <= BS_buffer[108:123];
				109: BitStream_buffer_output <= BS_buffer[109:124];
				110: BitStream_buffer_output <= BS_buffer[110:125];
				111: BitStream_buffer_output <= BS_buffer[111:126];
				112: BitStream_buffer_output <= BS_buffer[112:127];
				113: BitStream_buffer_output <= {BS_buffer[113:127], BS_buffer[0]};
				114: BitStream_buffer_output <= {BS_buffer[114:127], BS_buffer[0:1]};
				115: BitStream_buffer_output <= {BS_buffer[115:127], BS_buffer[0:2]}; 
				116: BitStream_buffer_output <= {BS_buffer[116:127], BS_buffer[0:3]};
				117: BitStream_buffer_output <= {BS_buffer[117:127], BS_buffer[0:4]};
				118: BitStream_buffer_output <= {BS_buffer[118:127], BS_buffer[0:5]};
				119: BitStream_buffer_output <= {BS_buffer[119:127], BS_buffer[0:6]};
				120: BitStream_buffer_output <= {BS_buffer[120:127], BS_buffer[0:7]};
				121: BitStream_buffer_output <= {BS_buffer[121:127], BS_buffer[0:8]};
				122: BitStream_buffer_output <= {BS_buffer[122:127], BS_buffer[0:9]};
				123: BitStream_buffer_output <= {BS_buffer[123:127], BS_buffer[0:10]};
				124: BitStream_buffer_output <= {BS_buffer[124:127], BS_buffer[0:11]};
				125: BitStream_buffer_output <= {BS_buffer[125:127], BS_buffer[0:12]}; 
				126: BitStream_buffer_output <= {BS_buffer[126:127], BS_buffer[0:13]};
				127: BitStream_buffer_output <= {BS_buffer[127]    , BS_buffer[0:14]};
			endcase
		end
	end
endmodule
			
		
