//-------------------------------------------------------------------------------------------
//                                                                 
//  COPYRIGHT (C) 2011, VIPcore Group, Fudan University
//                                                                  
//  THIS FILE MAY NOT BE MODIFIED OR REDISTRIBUTED WITHOUT THE      
//  EXPRESSED WRITTEN CONSENT OF VIPcore Group
//                                                                  
//  VIPcore       : http://soc.fudan.edu.cn/vip    
//  IP Owner 	  : Yibo FAN
//  Contact       : fanyibo@fudan.edu.cn             
//-------------------------------------------------------------------------------------------
// Filename       : cabac_bae_stage1.v
// Author         : chewein
// Created        : 2014-09-03
// Description    : loop up table for i_range_lut and shift_lut ,
//                  calculation bin_eq_lps  
//-------------------------------------------------------------------------------------------
`include "enc_defines.v"

module cabac_bae_stage1(
                            state_i                ,
							bin_i                  ,
							mps_i                  ,

                            range_lps_o            , 
							range_lps_update_lut_o ,                    
                            shift_lut_o            ,

							bin_eq_lps_o   
                        );
//-------------------------------------------------------------------------------------------
//
//-------------------------------------------------------------------------------------------

input       [5:0]       state_i                      ;   
input                   bin_i                        ;
input                   mps_i                        ;    

output      [31:0]      range_lps_o                  ;  
output      [35:0]      range_lps_update_lut_o       ;        
output      [15:0]      shift_lut_o                  ;
output                  bin_eq_lps_o                 ;

//-------------------------------------------------------------------------------------------
//                 loop up table for i_range_lut
//-------------------------------------------------------------------------------------------
reg       [31:0]    range_lps_r                        ;

always @* begin
		case (state_i)
			 6'd0: begin range_lps_r = 32'h80_b0_d0_f0 ; end	
			 6'd1: begin range_lps_r = 32'h80_a7_c5_e3 ; end
			 6'd2: begin range_lps_r = 32'h80_9e_bb_d8 ; end
			 6'd3: begin range_lps_r = 32'h7b_96_b2_cd ; end
			 6'd4: begin range_lps_r = 32'h74_8e_a9_c3 ; end
			 6'd5: begin range_lps_r = 32'h6f_87_a0_b9 ; end
			 6'd6: begin range_lps_r = 32'h69_80_98_af ; end
			 6'd7: begin range_lps_r = 32'h64_7a_90_a6 ; end
			 6'd8: begin range_lps_r = 32'h5f_74_89_9e ; end
			 6'd9: begin range_lps_r = 32'h5a_6e_82_96 ; end
			6'd10: begin range_lps_r = 32'h55_68_7b_8e ; end
			6'd11: begin range_lps_r = 32'h51_63_75_87 ; end
			6'd12: begin range_lps_r = 32'h4d_5e_6f_80 ; end
			6'd13: begin range_lps_r = 32'h49_59_69_7a ; end
			6'd14: begin range_lps_r = 32'h45_55_64_74 ; end
			6'd15: begin range_lps_r = 32'h42_50_5f_6e ; end
			6'd16: begin range_lps_r = 32'h3e_4c_5a_68 ; end
			6'd17: begin range_lps_r = 32'h3b_48_56_63 ; end
			6'd18: begin range_lps_r = 32'h38_45_51_5e ; end
			6'd19: begin range_lps_r = 32'h35_41_4d_59 ; end
			6'd20: begin range_lps_r = 32'h33_3e_49_55 ; end
			6'd21: begin range_lps_r = 32'h30_3b_45_50 ; end
			6'd22: begin range_lps_r = 32'h2e_38_42_4c ; end
			6'd23: begin range_lps_r = 32'h2b_35_3f_48 ; end
			6'd24: begin range_lps_r = 32'h29_32_3b_45 ; end
			6'd25: begin range_lps_r = 32'h27_30_38_41 ; end
			6'd26: begin range_lps_r = 32'h25_2d_36_3e ; end
			6'd27: begin range_lps_r = 32'h23_2b_33_3b ; end
			6'd28: begin range_lps_r = 32'h21_29_30_38 ; end
			6'd29: begin range_lps_r = 32'h20_27_2e_35 ; end
			6'd30: begin range_lps_r = 32'h1e_25_2b_32 ; end
			6'd31: begin range_lps_r = 32'h1d_23_29_30 ; end
			6'd32: begin range_lps_r = 32'h1b_21_27_2d ; end
			6'd33: begin range_lps_r = 32'h1a_1f_25_2b ; end
			6'd34: begin range_lps_r = 32'h18_1e_23_29 ; end
			6'd35: begin range_lps_r = 32'h17_1c_21_27 ; end
			6'd36: begin range_lps_r = 32'h16_1b_20_25 ; end
			6'd37: begin range_lps_r = 32'h15_1a_1e_23 ; end
			6'd38: begin range_lps_r = 32'h14_18_1d_21 ; end
			6'd39: begin range_lps_r = 32'h13_17_1b_1f ; end
			6'd40: begin range_lps_r = 32'h12_16_1a_1e ; end
			6'd41: begin range_lps_r = 32'h11_15_19_1c ; end
			6'd42: begin range_lps_r = 32'h10_14_17_1b ; end
			6'd43: begin range_lps_r = 32'h0f_13_16_19 ; end
			6'd44: begin range_lps_r = 32'h0e_12_15_18 ; end
			6'd45: begin range_lps_r = 32'h0e_11_14_17 ; end
			6'd46: begin range_lps_r = 32'h0d_10_13_16 ; end
			6'd47: begin range_lps_r = 32'h0c_0f_12_15 ; end
			6'd48: begin range_lps_r = 32'h0c_0e_11_14 ; end
			6'd49: begin range_lps_r = 32'h0b_0e_10_13 ; end
			6'd50: begin range_lps_r = 32'h0b_0d_0f_12 ; end
			6'd51: begin range_lps_r = 32'h0a_0c_0f_11 ; end
			6'd52: begin range_lps_r = 32'h0a_0c_0e_10 ; end
			6'd53: begin range_lps_r = 32'h09_0b_0d_0f ; end
			6'd54: begin range_lps_r = 32'h09_0b_0c_0e ; end
			6'd55: begin range_lps_r = 32'h08_0a_0c_0e ; end
			6'd56: begin range_lps_r = 32'h08_09_0b_0d ; end
			6'd57: begin range_lps_r = 32'h07_09_0b_0c ; end
			6'd58: begin range_lps_r = 32'h07_09_0a_0c ; end
			6'd59: begin range_lps_r = 32'h07_08_0a_0b ; end
			6'd60: begin range_lps_r = 32'h06_08_09_0b ; end
			6'd61: begin range_lps_r = 32'h06_07_09_0a ; end
			6'd62: begin range_lps_r = 32'h06_07_08_09 ; end
			6'd63: begin range_lps_r = 32'h02_02_02_02 ; end
		endcase                    
end    

//-------------------------------------------------------------------------------------------
//                 loop up table for shift_lut_r
//-------------------------------------------------------------------------------------------

reg       [15:0]    shift_lut_r                        ;
 always @* begin
		case (state_i)
			 6'd0: begin shift_lut_r = 16'h1_1_1_1 ; end // 9_9_9_9	
			 6'd1: begin shift_lut_r = 16'h1_1_1_1 ; end // 9_9_9_9
			 6'd2: begin shift_lut_r = 16'h1_1_1_1 ; end // 9_9_9_9
			 6'd3: begin shift_lut_r = 16'h2_1_1_1 ; end
			 6'd4: begin shift_lut_r = 16'h2_1_1_1 ; end
			 6'd5: begin shift_lut_r = 16'h2_1_1_1 ; end
			 6'd6: begin shift_lut_r = 16'h2_1_1_1 ; end
			 6'd7: begin shift_lut_r = 16'h2_2_1_1 ; end
			 6'd8: begin shift_lut_r = 16'h2_2_1_1 ; end
			 6'd9: begin shift_lut_r = 16'h2_2_1_1 ; end
			6'd10: begin shift_lut_r = 16'h2_2_2_1 ; end
			6'd11: begin shift_lut_r = 16'h2_2_2_1 ; end
			6'd12: begin shift_lut_r = 16'h2_2_2_1 ; end
			6'd13: begin shift_lut_r = 16'h2_2_2_2 ; end
			6'd14: begin shift_lut_r = 16'h2_2_2_2 ; end
			6'd15: begin shift_lut_r = 16'h2_2_2_2 ; end
			6'd16: begin shift_lut_r = 16'h3_2_2_2 ; end
			6'd17: begin shift_lut_r = 16'h3_2_2_2 ; end
			6'd18: begin shift_lut_r = 16'h3_2_2_2 ; end
			6'd19: begin shift_lut_r = 16'h3_2_2_2 ; end
			6'd20: begin shift_lut_r = 16'h3_3_2_2 ; end
			6'd21: begin shift_lut_r = 16'h3_3_2_2 ; end
			6'd22: begin shift_lut_r = 16'h3_3_2_2 ; end
			6'd23: begin shift_lut_r = 16'h3_3_3_2 ; end
			6'd24: begin shift_lut_r = 16'h3_3_3_2 ; end
			6'd25: begin shift_lut_r = 16'h3_3_3_2 ; end
			6'd26: begin shift_lut_r = 16'h3_3_3_3 ; end
			6'd27: begin shift_lut_r = 16'h3_3_3_3 ; end
			6'd28: begin shift_lut_r = 16'h3_3_3_3 ; end
			6'd29: begin shift_lut_r = 16'h3_3_3_3 ; end
			6'd30: begin shift_lut_r = 16'h4_3_3_3 ; end
			6'd31: begin shift_lut_r = 16'h4_3_3_3 ; end
			6'd32: begin shift_lut_r = 16'h4_3_3_3 ; end
			6'd33: begin shift_lut_r = 16'h4_4_3_3 ; end
			6'd34: begin shift_lut_r = 16'h4_4_3_3 ; end
			6'd35: begin shift_lut_r = 16'h4_4_3_3 ; end
			6'd36: begin shift_lut_r = 16'h4_4_3_3 ; end
			6'd37: begin shift_lut_r = 16'h4_4_4_3 ; end
			6'd38: begin shift_lut_r = 16'h4_4_4_3 ; end
			6'd39: begin shift_lut_r = 16'h4_4_4_4 ; end
			6'd40: begin shift_lut_r = 16'h4_4_4_4 ; end
			6'd41: begin shift_lut_r = 16'h4_4_4_4 ; end
			6'd42: begin shift_lut_r = 16'h4_4_4_4 ; end
			6'd43: begin shift_lut_r = 16'h5_4_4_4 ; end
			6'd44: begin shift_lut_r = 16'h5_4_4_4 ; end
			6'd45: begin shift_lut_r = 16'h5_4_4_4 ; end
			6'd46: begin shift_lut_r = 16'h5_4_4_4 ; end
			6'd47: begin shift_lut_r = 16'h5_5_4_4 ; end
			6'd48: begin shift_lut_r = 16'h5_5_4_4 ; end
			6'd49: begin shift_lut_r = 16'h5_5_4_4 ; end
			6'd50: begin shift_lut_r = 16'h5_5_5_4 ; end
			6'd51: begin shift_lut_r = 16'h5_5_5_4 ; end
			6'd52: begin shift_lut_r = 16'h5_5_5_4 ; end
			6'd53: begin shift_lut_r = 16'h5_5_5_5 ; end
			6'd54: begin shift_lut_r = 16'h5_5_5_5 ; end
			6'd55: begin shift_lut_r = 16'h5_5_5_5 ; end
			6'd56: begin shift_lut_r = 16'h5_5_5_5 ; end
			6'd57: begin shift_lut_r = 16'h6_5_5_5 ; end
			6'd58: begin shift_lut_r = 16'h6_5_5_5 ; end
			6'd59: begin shift_lut_r = 16'h6_5_5_5 ; end
			6'd60: begin shift_lut_r = 16'h6_5_5_5 ; end
			6'd61: begin shift_lut_r = 16'h6_6_5_5 ; end
			6'd62: begin shift_lut_r = 16'h6_6_5_5 ; end
			6'd63: begin shift_lut_r = 16'h6_6_6_6 ; end
		endcase                    
end    

//-------------------------------------------------------------------------------------------
//                calculation bin_eq_lps 
//-------------------------------------------------------------------------------------------

wire            bin_eq_lps_w    =     bin_i != mps_i ;

//-------------------------------------------------------------------------------------------
//                calculation range_lps_lut_o 
//-------------------------------------------------------------------------------------------
wire  [8:0]     range_lps_update_0_w  = range_lps_r[ 7:0 ]<<shift_lut_r[ 3:0 ];
wire  [8:0]     range_lps_update_1_w  = range_lps_r[15:8 ]<<shift_lut_r[ 7:4 ];
wire  [8:0]     range_lps_update_2_w  = range_lps_r[23:16]<<shift_lut_r[11:8 ];
wire  [8:0]     range_lps_update_3_w  = range_lps_r[31:24]<<shift_lut_r[15:12];

//-------------------------------------------------------------------------------------------
//                            output 
//-------------------------------------------------------------------------------------------
assign          range_lps_o      =     range_lps_r      ;
assign          shift_lut_o      =     shift_lut_r      ;
assign          bin_eq_lps_o     =     bin_eq_lps_w     ;

assign range_lps_update_lut_o = {range_lps_update_3_w,range_lps_update_2_w,range_lps_update_1_w,range_lps_update_0_w};



endmodule 
