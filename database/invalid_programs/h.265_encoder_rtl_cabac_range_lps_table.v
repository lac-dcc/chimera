//-------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------
// Filename       : range_lps_table.v
// Author         : guo yong
// Created        : 2013-05
// Description    : H.264 range LPS table 64x4
//               
//-------------------------------------------------------------------
`include "enc_defines.v"

module range_lps_table(
					//input
					clk		   			,
					valid_num_bin_bae_i	,
					addr_0     			,
					addr_1				,
					addr_2				,
					addr_3				,
					//output
					range_lps_0_o		,
					range_lps_1_o		,
					range_lps_2_o		,
					range_lps_3_o			
);

// ********************************************
// 
// 			INPUT / OUTPUT DECLARATION
// 
// ********************************************

input				clk						;	//clock signal
input	[2:0]		valid_num_bin_bae_i		;	//valid number bin of bae
input 	[5:0]		addr_0					;	//address_0 for range_lps_0
input 	[5:0]		addr_1					;	//address_1 for range_lps_1
input 	[5:0]		addr_2					;	//address_2 for range_lps_2
input 	[5:0]		addr_3					;	//address_3 for range_lps_3
output	[31:0]		range_lps_0_o			;	//4-range_lps for bin 0, one range_lps is 8 bits
output	[31:0]		range_lps_1_o			;	//4-range_lps for bin 1, one range_lps is 8 bits   
output	[31:0]		range_lps_2_o			;	//4-range_lps for bin 2, one range_lps is 8 bits
output	[31:0]		range_lps_3_o			;	//4-range_lps for bin 3, one range_lps is 8 bits


// ********************************************
// 
// 			    Reg DECLARATION
// 
// ********************************************

reg		[31:0]		range_lps_0_o			;	//output 4-range_lps for bin 0, {00_01_02_03} one range_lps is 8 bits
reg		[31:0]		range_lps_1_o			;	//output 4-range_lps for bin 1, {00_01_02_03} one range_lps is 8 bits   
reg		[31:0]		range_lps_2_o			;	//output 4-range_lps for bin 2, {00_01_02_03} one range_lps is 8 bits
reg		[31:0]		range_lps_3_o			;	//output 4-range_lps for bin 3, {00_01_02_03} one range_lps is 8 bits



// ********************************************
//                                             
// 			   Combinational Logic               
//                                             
// ********************************************



// ********************************************
//                                             
// 			    Sequential Logic               
//                                             
// ********************************************

//range_lps_0
always @* begin
	if(valid_num_bin_bae_i>=3'd1) begin
		case (addr_0)
			 0:	begin range_lps_0_o = 32'h80_b0_d0_f0 ; end	
			 1: begin range_lps_0_o = 32'h80_a7_c5_e3 ; end
			 2: begin range_lps_0_o = 32'h80_9e_bb_d8 ; end
			 3: begin range_lps_0_o = 32'h7b_96_b2_cd ; end
			 4: begin range_lps_0_o = 32'h74_8e_a9_c3 ; end
			 5: begin range_lps_0_o = 32'h6f_87_a0_b9 ; end
			 6: begin range_lps_0_o = 32'h69_80_98_af ; end
			 7: begin range_lps_0_o = 32'h64_7a_90_a6 ; end
			 8: begin range_lps_0_o = 32'h5f_74_89_9e ; end
			 9: begin range_lps_0_o = 32'h5a_6e_82_96 ; end
			10: begin range_lps_0_o = 32'h55_68_7b_8e ; end
			11: begin range_lps_0_o = 32'h51_63_75_87 ; end
			12: begin range_lps_0_o = 32'h4d_5e_6f_80 ; end
			13: begin range_lps_0_o = 32'h49_59_69_7a ; end
			14: begin range_lps_0_o = 32'h45_55_64_74 ; end
			15: begin range_lps_0_o = 32'h42_50_5f_6e ; end
			16: begin range_lps_0_o = 32'h3e_4c_5a_68 ; end
			17: begin range_lps_0_o = 32'h3b_48_56_63 ; end
			18: begin range_lps_0_o = 32'h38_45_51_5e ; end
			19: begin range_lps_0_o = 32'h35_41_4d_59 ; end
			20: begin range_lps_0_o = 32'h33_3e_49_55 ; end
			21: begin range_lps_0_o = 32'h30_3b_45_50 ; end
			22: begin range_lps_0_o = 32'h2e_38_42_4c ; end
			23: begin range_lps_0_o = 32'h2b_35_3f_48 ; end
			24: begin range_lps_0_o = 32'h29_32_3b_45 ; end
			25: begin range_lps_0_o = 32'h27_30_38_41 ; end
			26: begin range_lps_0_o = 32'h25_2d_36_3e ; end
			27: begin range_lps_0_o = 32'h23_2b_33_3b ; end
			28: begin range_lps_0_o = 32'h21_29_30_38 ; end
			29: begin range_lps_0_o = 32'h20_27_2e_35 ; end
			30: begin range_lps_0_o = 32'h1e_25_2b_32 ; end
			31: begin range_lps_0_o = 32'h1d_23_29_30 ; end
			32: begin range_lps_0_o = 32'h1b_21_27_2d ; end
			33: begin range_lps_0_o = 32'h1a_1f_25_2b ; end
			34: begin range_lps_0_o = 32'h18_1e_23_29 ; end
			35: begin range_lps_0_o = 32'h17_1c_21_27 ; end
			36: begin range_lps_0_o = 32'h16_1b_20_25 ; end
			37: begin range_lps_0_o = 32'h15_1a_1e_23 ; end
			38: begin range_lps_0_o = 32'h14_18_1d_21 ; end
			39: begin range_lps_0_o = 32'h13_17_1b_1f ; end
			40: begin range_lps_0_o = 32'h12_16_1a_1e ; end
			41: begin range_lps_0_o = 32'h11_15_19_1c ; end
			42: begin range_lps_0_o = 32'h10_14_17_1b ; end
			43: begin range_lps_0_o = 32'h0f_13_16_19 ; end
			44: begin range_lps_0_o = 32'h0e_12_15_18 ; end
			45: begin range_lps_0_o = 32'h0e_11_14_17 ; end
			46: begin range_lps_0_o = 32'h0d_10_13_16 ; end
			47: begin range_lps_0_o = 32'h0c_0f_12_15 ; end
			48: begin range_lps_0_o = 32'h0c_0e_11_14 ; end
			49: begin range_lps_0_o = 32'h0b_0e_10_13 ; end
			50: begin range_lps_0_o = 32'h0b_0d_0f_12 ; end
			51: begin range_lps_0_o = 32'h0a_0c_0f_11 ; end
			52: begin range_lps_0_o = 32'h0a_0c_0e_10 ; end
			53: begin range_lps_0_o = 32'h09_0b_0d_0f ; end
			54: begin range_lps_0_o = 32'h09_0b_0c_0e ; end
			55: begin range_lps_0_o = 32'h08_0a_0c_0e ; end
			56: begin range_lps_0_o = 32'h08_09_0b_0d ; end
			57: begin range_lps_0_o = 32'h07_09_0b_0c ; end
			58: begin range_lps_0_o = 32'h07_09_0a_0c ; end
			59: begin range_lps_0_o = 32'h07_08_0a_0b ; end
			60: begin range_lps_0_o = 32'h06_08_09_0b ; end
			61: begin range_lps_0_o = 32'h06_07_09_0a ; end
			62: begin range_lps_0_o = 32'h06_07_08_09 ; end
			63: begin range_lps_0_o = 32'h02_02_02_02 ; end
			default:             
				begin range_lps_0_o = 32'h80_b0_d0_f0 ; end
		endcase       
	end
	else 
		range_lps_0_o = 32'hff_ff_ff_ff;               
end                              
                                 
//range_lps_1                    
always @* begin      
	if(valid_num_bin_bae_i>=3'd2) begin
		case (addr_1)                
			 0:	begin range_lps_1_o = 32'h80_b0_d0_f0 ; end	
			 1: begin range_lps_1_o = 32'h80_a7_c5_e3 ; end
			 2: begin range_lps_1_o = 32'h80_9e_bb_d8 ; end
			 3: begin range_lps_1_o = 32'h7b_96_b2_cd ; end
			 4: begin range_lps_1_o = 32'h74_8e_a9_c3 ; end
			 5: begin range_lps_1_o = 32'h6f_87_a0_b9 ; end
			 6: begin range_lps_1_o = 32'h69_80_98_af ; end
			 7: begin range_lps_1_o = 32'h64_7a_90_a6 ; end
			 8: begin range_lps_1_o = 32'h5f_74_89_9e ; end
			 9: begin range_lps_1_o = 32'h5a_6e_82_96 ; end
			10: begin range_lps_1_o = 32'h55_68_7b_8e ; end
			11: begin range_lps_1_o = 32'h51_63_75_87 ; end
			12: begin range_lps_1_o = 32'h4d_5e_6f_80 ; end
			13: begin range_lps_1_o = 32'h49_59_69_7a ; end
			14: begin range_lps_1_o = 32'h45_55_64_74 ; end
			15: begin range_lps_1_o = 32'h42_50_5f_6e ; end
			16: begin range_lps_1_o = 32'h3e_4c_5a_68 ; end
			17: begin range_lps_1_o = 32'h3b_48_56_63 ; end
			18: begin range_lps_1_o = 32'h38_45_51_5e ; end
			19: begin range_lps_1_o = 32'h35_41_4d_59 ; end
			20: begin range_lps_1_o = 32'h33_3e_49_55 ; end
			21: begin range_lps_1_o = 32'h30_3b_45_50 ; end
			22: begin range_lps_1_o = 32'h2e_38_42_4c ; end
			23: begin range_lps_1_o = 32'h2b_35_3f_48 ; end
			24: begin range_lps_1_o = 32'h29_32_3b_45 ; end
			25: begin range_lps_1_o = 32'h27_30_38_41 ; end
			26: begin range_lps_1_o = 32'h25_2d_36_3e ; end
			27: begin range_lps_1_o = 32'h23_2b_33_3b ; end
			28: begin range_lps_1_o = 32'h21_29_30_38 ; end
			29: begin range_lps_1_o = 32'h20_27_2e_35 ; end
			30: begin range_lps_1_o = 32'h1e_25_2b_32 ; end
			31: begin range_lps_1_o = 32'h1d_23_29_30 ; end
			32: begin range_lps_1_o = 32'h1b_21_27_2d ; end
			33: begin range_lps_1_o = 32'h1a_1f_25_2b ; end
			34: begin range_lps_1_o = 32'h18_1e_23_29 ; end
			35: begin range_lps_1_o = 32'h17_1c_21_27 ; end
			36: begin range_lps_1_o = 32'h16_1b_20_25 ; end
			37: begin range_lps_1_o = 32'h15_1a_1e_23 ; end
			38: begin range_lps_1_o = 32'h14_18_1d_21 ; end
			39: begin range_lps_1_o = 32'h13_17_1b_1f ; end
			40: begin range_lps_1_o = 32'h12_16_1a_1e ; end
			41: begin range_lps_1_o = 32'h11_15_19_1c ; end
			42: begin range_lps_1_o = 32'h10_14_17_1b ; end
			43: begin range_lps_1_o = 32'h0f_13_16_19 ; end
			44: begin range_lps_1_o = 32'h0e_12_15_18 ; end
			45: begin range_lps_1_o = 32'h0e_11_14_17 ; end
			46: begin range_lps_1_o = 32'h0d_10_13_16 ; end
			47: begin range_lps_1_o = 32'h0c_0f_12_15 ; end
			48: begin range_lps_1_o = 32'h0c_0e_11_14 ; end
			49: begin range_lps_1_o = 32'h0b_0e_10_13 ; end
			50: begin range_lps_1_o = 32'h0b_0d_0f_12 ; end
			51: begin range_lps_1_o = 32'h0a_0c_0f_11 ; end
			52: begin range_lps_1_o = 32'h0a_0c_0e_10 ; end
			53: begin range_lps_1_o = 32'h09_0b_0d_0f ; end
			54: begin range_lps_1_o = 32'h09_0b_0c_0e ; end
			55: begin range_lps_1_o = 32'h08_0a_0c_0e ; end
			56: begin range_lps_1_o = 32'h08_09_0b_0d ; end
			57: begin range_lps_1_o = 32'h07_09_0b_0c ; end
			58: begin range_lps_1_o = 32'h07_09_0a_0c ; end
			59: begin range_lps_1_o = 32'h07_08_0a_0b ; end
			60: begin range_lps_1_o = 32'h06_08_09_0b ; end
			61: begin range_lps_1_o = 32'h06_07_09_0a ; end
			62: begin range_lps_1_o = 32'h06_07_08_09 ; end
			63: begin range_lps_1_o = 32'h02_02_02_02 ; end
			default:                 
				begin range_lps_1_o = 32'h80_b0_d0_f0 ; end
		endcase    
	end
	else
		range_lps_1_o = 32'hff_ff_ff_ff;                  
end                              
                                 
//range_lps_2                    
always @* begin
	if(valid_num_bin_bae_i>=3'd3) begin      
		case (addr_2)                
			 0:	begin range_lps_2_o = 32'h80_b0_d0_f0 ; end	
			 1: begin range_lps_2_o = 32'h80_a7_c5_e3 ; end
			 2: begin range_lps_2_o = 32'h80_9e_bb_d8 ; end
			 3: begin range_lps_2_o = 32'h7b_96_b2_cd ; end
			 4: begin range_lps_2_o = 32'h74_8e_a9_c3 ; end
			 5: begin range_lps_2_o = 32'h6f_87_a0_b9 ; end
			 6: begin range_lps_2_o = 32'h69_80_98_af ; end
			 7: begin range_lps_2_o = 32'h64_7a_90_a6 ; end
			 8: begin range_lps_2_o = 32'h5f_74_89_9e ; end
			 9: begin range_lps_2_o = 32'h5a_6e_82_96 ; end
			10: begin range_lps_2_o = 32'h55_68_7b_8e ; end
			11: begin range_lps_2_o = 32'h51_63_75_87 ; end
			12: begin range_lps_2_o = 32'h4d_5e_6f_80 ; end
			13: begin range_lps_2_o = 32'h49_59_69_7a ; end
			14: begin range_lps_2_o = 32'h45_55_64_74 ; end
			15: begin range_lps_2_o = 32'h42_50_5f_6e ; end
			16: begin range_lps_2_o = 32'h3e_4c_5a_68 ; end
			17: begin range_lps_2_o = 32'h3b_48_56_63 ; end
			18: begin range_lps_2_o = 32'h38_45_51_5e ; end
			19: begin range_lps_2_o = 32'h35_41_4d_59 ; end
			20: begin range_lps_2_o = 32'h33_3e_49_55 ; end
			21: begin range_lps_2_o = 32'h30_3b_45_50 ; end
			22: begin range_lps_2_o = 32'h2e_38_42_4c ; end
			23: begin range_lps_2_o = 32'h2b_35_3f_48 ; end
			24: begin range_lps_2_o = 32'h29_32_3b_45 ; end
			25: begin range_lps_2_o = 32'h27_30_38_41 ; end
			26: begin range_lps_2_o = 32'h25_2d_36_3e ; end
			27: begin range_lps_2_o = 32'h23_2b_33_3b ; end
			28: begin range_lps_2_o = 32'h21_29_30_38 ; end
			29: begin range_lps_2_o = 32'h20_27_2e_35 ; end
			30: begin range_lps_2_o = 32'h1e_25_2b_32 ; end
			31: begin range_lps_2_o = 32'h1d_23_29_30 ; end
			32: begin range_lps_2_o = 32'h1b_21_27_2d ; end
			33: begin range_lps_2_o = 32'h1a_1f_25_2b ; end
			34: begin range_lps_2_o = 32'h18_1e_23_29 ; end
			35: begin range_lps_2_o = 32'h17_1c_21_27 ; end
			36: begin range_lps_2_o = 32'h16_1b_20_25 ; end
			37: begin range_lps_2_o = 32'h15_1a_1e_23 ; end
			38: begin range_lps_2_o = 32'h14_18_1d_21 ; end
			39: begin range_lps_2_o = 32'h13_17_1b_1f ; end
			40: begin range_lps_2_o = 32'h12_16_1a_1e ; end
			41: begin range_lps_2_o = 32'h11_15_19_1c ; end
			42: begin range_lps_2_o = 32'h10_14_17_1b ; end
			43: begin range_lps_2_o = 32'h0f_13_16_19 ; end
			44: begin range_lps_2_o = 32'h0e_12_15_18 ; end
			45: begin range_lps_2_o = 32'h0e_11_14_17 ; end
			46: begin range_lps_2_o = 32'h0d_10_13_16 ; end
			47: begin range_lps_2_o = 32'h0c_0f_12_15 ; end
			48: begin range_lps_2_o = 32'h0c_0e_11_14 ; end
			49: begin range_lps_2_o = 32'h0b_0e_10_13 ; end
			50: begin range_lps_2_o = 32'h0b_0d_0f_12 ; end
			51: begin range_lps_2_o = 32'h0a_0c_0f_11 ; end
			52: begin range_lps_2_o = 32'h0a_0c_0e_10 ; end
			53: begin range_lps_2_o = 32'h09_0b_0d_0f ; end
			54: begin range_lps_2_o = 32'h09_0b_0c_0e ; end
			55: begin range_lps_2_o = 32'h08_0a_0c_0e ; end
			56: begin range_lps_2_o = 32'h08_09_0b_0d ; end
			57: begin range_lps_2_o = 32'h07_09_0b_0c ; end
			58: begin range_lps_2_o = 32'h07_09_0a_0c ; end
			59: begin range_lps_2_o = 32'h07_08_0a_0b ; end
			60: begin range_lps_2_o = 32'h06_08_09_0b ; end
			61: begin range_lps_2_o = 32'h06_07_09_0a ; end
			62: begin range_lps_2_o = 32'h06_07_08_09 ; end
			63: begin range_lps_2_o = 32'h02_02_02_02 ; end
			default:                 
				begin range_lps_2_o = 32'h80_b0_d0_f0 ; end
		endcase    
	end
	else
		range_lps_2_o = 32'hff_ff_ff_ff;                  
end                              
                                 
//range_lps_3                    
always @* begin    
	if(valid_num_bin_bae_i==3'd4) begin  
		case (addr_3)                
			 0:	begin range_lps_3_o = 32'h80_b0_d0_f0 ; end	
			 1: begin range_lps_3_o = 32'h80_a7_c5_e3 ; end
			 2: begin range_lps_3_o = 32'h80_9e_bb_d8 ; end
			 3: begin range_lps_3_o = 32'h7b_96_b2_cd ; end
			 4: begin range_lps_3_o = 32'h74_8e_a9_c3 ; end
			 5: begin range_lps_3_o = 32'h6f_87_a0_b9 ; end
			 6: begin range_lps_3_o = 32'h69_80_98_af ; end
			 7: begin range_lps_3_o = 32'h64_7a_90_a6 ; end
			 8: begin range_lps_3_o = 32'h5f_74_89_9e ; end
			 9: begin range_lps_3_o = 32'h5a_6e_82_96 ; end
			10: begin range_lps_3_o = 32'h55_68_7b_8e ; end
			11: begin range_lps_3_o = 32'h51_63_75_87 ; end
			12: begin range_lps_3_o = 32'h4d_5e_6f_80 ; end
			13: begin range_lps_3_o = 32'h49_59_69_7a ; end
			14: begin range_lps_3_o = 32'h45_55_64_74 ; end
			15: begin range_lps_3_o = 32'h42_50_5f_6e ; end
			16: begin range_lps_3_o = 32'h3e_4c_5a_68 ; end
			17: begin range_lps_3_o = 32'h3b_48_56_63 ; end
			18: begin range_lps_3_o = 32'h38_45_51_5e ; end
			19: begin range_lps_3_o = 32'h35_41_4d_59 ; end
			20: begin range_lps_3_o = 32'h33_3e_49_55 ; end
			21: begin range_lps_3_o = 32'h30_3b_45_50 ; end
			22: begin range_lps_3_o = 32'h2e_38_42_4c ; end
			23: begin range_lps_3_o = 32'h2b_35_3f_48 ; end
			24: begin range_lps_3_o = 32'h29_32_3b_45 ; end
			25: begin range_lps_3_o = 32'h27_30_38_41 ; end
			26: begin range_lps_3_o = 32'h25_2d_36_3e ; end
			27: begin range_lps_3_o = 32'h23_2b_33_3b ; end
			28: begin range_lps_3_o = 32'h21_29_30_38 ; end
			29: begin range_lps_3_o = 32'h20_27_2e_35 ; end
			30: begin range_lps_3_o = 32'h1e_25_2b_32 ; end
			31: begin range_lps_3_o = 32'h1d_23_29_30 ; end
			32: begin range_lps_3_o = 32'h1b_21_27_2d ; end
			33: begin range_lps_3_o = 32'h1a_1f_25_2b ; end
			34: begin range_lps_3_o = 32'h18_1e_23_29 ; end
			35: begin range_lps_3_o = 32'h17_1c_21_27 ; end
			36: begin range_lps_3_o = 32'h16_1b_20_25 ; end
			37: begin range_lps_3_o = 32'h15_1a_1e_23 ; end
			38: begin range_lps_3_o = 32'h14_18_1d_21 ; end
			39: begin range_lps_3_o = 32'h13_17_1b_1f ; end
			40: begin range_lps_3_o = 32'h12_16_1a_1e ; end
			41: begin range_lps_3_o = 32'h11_15_19_1c ; end
			42: begin range_lps_3_o = 32'h10_14_17_1b ; end
			43: begin range_lps_3_o = 32'h0f_13_16_19 ; end
			44: begin range_lps_3_o = 32'h0e_12_15_18 ; end
			45: begin range_lps_3_o = 32'h0e_11_14_17 ; end
			46: begin range_lps_3_o = 32'h0d_10_13_16 ; end
			47: begin range_lps_3_o = 32'h0c_0f_12_15 ; end
			48: begin range_lps_3_o = 32'h0c_0e_11_14 ; end
			49: begin range_lps_3_o = 32'h0b_0e_10_13 ; end
			50: begin range_lps_3_o = 32'h0b_0d_0f_12 ; end
			51: begin range_lps_3_o = 32'h0a_0c_0f_11 ; end
			52: begin range_lps_3_o = 32'h0a_0c_0e_10 ; end
			53: begin range_lps_3_o = 32'h09_0b_0d_0f ; end
			54: begin range_lps_3_o = 32'h09_0b_0c_0e ; end
			55: begin range_lps_3_o = 32'h08_0a_0c_0e ; end
			56: begin range_lps_3_o = 32'h08_09_0b_0d ; end
			57: begin range_lps_3_o = 32'h07_09_0b_0c ; end
			58: begin range_lps_3_o = 32'h07_09_0a_0c ; end
			59: begin range_lps_3_o = 32'h07_08_0a_0b ; end
			60: begin range_lps_3_o = 32'h06_08_09_0b ; end
			61: begin range_lps_3_o = 32'h06_07_09_0a ; end
			62: begin range_lps_3_o = 32'h06_07_08_09 ; end
			63: begin range_lps_3_o = 32'h02_02_02_02 ; end
			default:                 
				begin range_lps_3_o = 32'h80_b0_d0_f0 ; end
		endcase
	end
	else
		range_lps_3_o = 32'hff_ff_ff_ff;
end











endmodule