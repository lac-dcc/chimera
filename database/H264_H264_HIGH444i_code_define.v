`define Intra4x4_Vertical            4'b0000
`define Intra4x4_Horizontal          4'b0001
`define Intra4x4_DC                  4'b0010
`define Intra4x4_Diagonal_Down_Left  4'b0011
`define Intra4x4_Diagonal_Down_Right 4'b0100
`define Intra4x4_Vertical_Right      4'b0101
`define Intra4x4_Horizontal_Down     4'b0110
`define Intra4x4_Vertical_Left       4'b0111
`define Intra4x4_Horizontal_Up       4'b1000

`define Intra_chroma_DC              2'b00
`define Intra_chroma_Horizontal      2'b01
`define Intra_chroma_Vertical        2'b10
`define Intra_chroma_Plane           2'b11

`define Intra16x16_Vertical          2'b00
`define Intra16x16_Horizontal        2'b01
`define Intra16x16_DC                2'b10
`define Intra16x16_Plane             2'b11



`define slice_type_p 3'b101
`define slice_type_b 3'b110
`define slice_type_i 3'b111


//mb_type_general
`define MB_Inter16x16            4'b0000
`define MB_Inter16x8             4'b0001
`define MB_Inter8x16             4'b0010
`define MB_P_8x8                 4'b0011
`define MB_P_8x8ref0             4'b0100	
`define MB_P_skip                4'b0101
`define MB_B_8x8                 4'b0110		
`define MB_B_skip        	 4'b0111
`define MB_Intra16x16_CBPChroma0 4'b1000
`define MB_Intra16x16_CBPChroma1 4'b1001
`define MB_Intra16x16_CBPChroma2 4'b1010
`define MB_I_PCM        	 4'b1011
`define MB_Intra4x4              4'b1100
`define MB_type_reserved2        4'b1101
`define MB_type_reserved3        4'b1110
`define MB_type_rst              4'b1111




//---pc_decoding---
`define rst_consumed_bits_sel 3'b000
`define exp_golomb            3'b001
`define fixed_length          3'b011
`define dependent_variable    3'b010
`define cavlc_consumed        3'b110
`define trailing_bits         3'b111
`define exp_golomb_add1       3'b101
`define cabac_consumed	      3'b100

`define rst_parser 		    2'b00
`define start_code_prefix 2'b01
`define nal_unit 			    2'b11
`define parser_wait 2'b10


`define rst_nal_unit				4'b0000
`define forbidden_zero_bit_2_nal_unit_type      4'b0001
`define slice_layer_non_IDR_rbsp	        4'b0011
`define slice_layer_IDR_rbsp			4'b0010
`define seq_parameter_set_rbsp			4'b0110
`define pic_parameter_set_rbsp		  	4'b0111
`define rbsp_trailing_one_bit		        4'b0101
`define rbsp_trailing_zero_bits		        4'b0100
`define sei_rbsp				4'b1000


`define rst_seq_parameter_set                     5'b00000
`define fixed_header                              5'b00001
`define level_idc_s                               5'b00011
`define seq_parameter_set_id_sps_s                5'b00010
`define chroma_format_idc								  5'b10110
`define residual_colour_transform_flag				  5'b10010
`define bit_depth_luma_minus8							  5'b10011
`define bit_depth_chroma_minus8						  5'b10100
`define qpprime_y_zero_transform_bypass_flag	 	  5'b10101
`define log2_max_frame_num_minus4_s               5'b00110
`define pic_order_cnt_type_s                      5'b00111
`define log2_max_pic_order_cnt_lsb_minus4_s       5'b00101
`define num_ref_frames_s                          5'b00100
`define gaps_in_frame_num_value_allowed_flag_s    5'b01100
`define pic_width_in_mbs_minus1_s                 5'b01101
`define pic_height_in_map_units_minus1_s          5'b01111
`define frame_mbs_only_flag_2_frame_cropping_flag 5'b01110
`define vui_parameter_present_flag_s              5'b01010
`define delta_pic_order_always_zero_flag          5'b01000
`define offset_for_non_ref_pic                    5'b01001
`define offset_for_top_to_bottom_field            5'b01011
`define num_ref_frames_in_pic_order_cnt_cycle     5'b10001
`define offset_for_ref_frame			  				  5'b10000

`define rst_pic_parameter_set			  4'b0000
`define pic_parameter_set_id_pps_s		  4'b0001
`define seq_parameter_set_id_pps_s		  4'b0011
`define entropy_coding_mode_flag_2_pic_order_present_flag 4'b0010
`define num_slice_groups_minus1_s		  4'b0110
`define num_ref_idx_l0_active_minus1_pps_s	  4'b0111
`define num_ref_idx_l1_active_minus1_pps_s	  4'b0101
`define weighted_pred_flag_2_weighted_bipred_idc  4'b0100
`define pic_init_qp_minus26_s			  4'b1100
`define pic_init_qs_minus26_s			  4'b1101
`define chroma_qp_index_offset_s		  4'b1111
`define deblocking_filter_control_2_redundant_pic_cnt_present_flag 4'b1110

`define rst_slice_layer_wo_partitioning 2'b00
`define slice_header		        2'b01
`define slice_cabac_init		2'b10
`define slice_data			2'b11


`define rst_slice_header							4'b0000
`define first_mb_in_slice_s						4'b0001
`define slice_type_s			                	4'b0011
`define pic_parameter_set_id_slice_header_s	4'b0010
`define frame_num_s									4'b0110
`define idr_pic_id_s									4'b0111
`define dec_ref_pic_marking						4'b1111
`define slice_qp_delta_s							4'b1110
`define disable_deblocking_filter_idc_s		4'b1010
`define slice_alpha_c0_offset_div2_s			4'b1011
`define slice_beta_offset_div2_s					4'b1001



//dec_ref_pic_marking_state 
`define rst_dec_ref_pic_marking					3'b000
`define no_output_of_prior_pics_flag_2_long_term_reference_flag 3'b001
`define adaptive_ref_pic_marking_mode_flag_s			3'b011
`define memory_management_control_operation_s			3'b010
`define difference_of_pic_nums_minus1_s				3'b100
`define long_term_pic_num_s					3'b101
`define long_term_frame_idx_s					3'b111
`define max_long_term_frame_idx_plus1_s				3'b110


`define rst_slice_data		2'b00
`define mb_type_s				2'b10
`define residual				2'b11
`define mb_num_update		2'b01


`define rst_residual_intra16 2'b00
`define intra16_cavlc_pred   2'b10
`define intra16_updat        2'b11

`define rst_intra_pred	   3'b000
`define intra_pred_read	   3'b001
`define intra_pred_pred	   3'b011
`define intra_pred_pred_pl 3'b100
`define intra_pred_end	   3'b010



`define rst_cavlc_decoder	4'b0000	
`define cavlc_0                 4'b0001
//`define nC_decoding_s		4'b0011
`define NumCoeffTrailingOnes_LUT 4'b0010
`define TrailingOnesSignFlag	    4'b0110
`define LevelPrefix			4'b0111
`define LevelSuffix			4'b0101
`define total_zeros_LUT		        4'b0100 
`define run_before_LUT		        4'b1100
`define RunOfZeros			 4'b1101
`define LevelRunCombination	     4'b1111
`define run_cal				4'b0011


`define I8x8   2'b00 //size of inter prediction partitions
`define I16x8	2'b01
`define I8x16	2'b10
`define I16x16 2'b11

//inter16_read
`define intra16r_rst	3'b000
`define intra16r_h0r	3'b001
`define intra16r_h0	3'b011
`define intra16r_h1	3'b010
`define intra16r_h2	3'b100
`define intra16r_h3	3'b101
`define intra16r_pl	3'b111




