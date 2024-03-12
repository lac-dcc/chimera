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


`define B_na      3'b000
`define B_Pred_L0 3'b001
`define B_Pred_L1 3'b010
`define B_Direct  3'b011
`define B_BiPred  3'b100

`define B_sub_Pred_L0 2'b01
`define B_sub_Pred_L1 2'b10
`define B_sub_Direct  2'b00
`define B_sub_BiPred  2'b11


//MBTypeGen_mbAddrA,MBTypeGen_mbAddrB_reg
`define MB_addrA_addrB_Inter      2'b00
`define MB_addrA_addrB_P_skip     2'b01
`define MB_addrA_addrB_Intra16x16 2'b10
`define MB_addrA_addrB_Intra4x4   2'b11

//MBTypeGen_mbAddrD
`define MB_addrD_Inter_P_skip 1'b0
`define MB_addrD_Intra        1'b1

//---pc_decoding---
`define rst_consumed_bits_sel 3'b000
`define exp_golomb            3'b001
`define fixed_length          3'b011
`define dependent_variable    3'b010
`define cavlc_consumed        3'b110
`define trailing_bits         3'b111
`define pcm_alignment         3'b101


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
`define offset_for_ref_frame			  5'b10000

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


`define rst_slice_header				5'b00000
`define first_mb_in_slice_s				5'b00001
`define slice_type_s			                5'b00011
`define pic_parameter_set_id_slice_header_s		5'b00010
`define frame_num_s					5'b00110
`define idr_pic_id_s					5'b00111
`define pic_order_cnt_lsb_s				5'b00101
`define delta_pic_order_cnt_s            		5'b10001
`define direct_spatial_mv_pred_flag_s  			5'b10010
`define num_ref_idx_active_override_flag_s		5'b00100
`define num_ref_idx_l0_active_minus1_slice_header_s 	5'b01100
`define num_ref_idx_l1_active_minus1_slice_header_s 	5'b10011
`define ref_pic_list_reordering				5'b01101
`define pred_weight_table               		5'b01000
`define dec_ref_pic_marking				5'b01111
`define cabac_init_idc_s				5'b10100
`define slice_qp_delta_s				5'b01110
`define disable_deblocking_filter_idc_s			5'b01010
`define slice_alpha_c0_offset_div2_s			5'b01011
`define slice_beta_offset_div2_s			5'b01001
`define slice_header_POC				5'b10000
`define slice_header_refbuild				5'b11000



//ref_pic_list_reordering_state 
`define rst_ref_pic_list_reordering	  3'b000
`define ref_pic_list_reordering_flag_l0_s 3'b001
`define reordering_of_pic_nums_idc_s      3'b010
`define abs_diff_pic_num_minus1		  3'b011
`define long_term_pic_num		  3'b100
`define ref_pic_list_reordering_flag_l1_s 3'b101
`define cal_abs_diff_pic_num		  3'b110
`define cal_long_term_pic_num		  3'b111


//pred_weight_table_state
`define rst_pred_weight_table            5'b00000 
`define luma_log2_weight_denom           5'b00001
`define chroma_log2_weight_denom         5'b00010
`define luma_weight_l0_flag		 5'b00011
`define luma_weight_l0			 5'b00100
`define luma_offset_l0	     	   	 5'b00101
`define chroma_weight_l0_flag		 5'b00110
`define chroma_weight_l0_j0		 5'b00111
`define chroma_offset_l0_j0		 5'b01000
`define chroma_weight_l0_j1		 5'b01001
`define chroma_offset_l0_j1		 5'b01010
`define luma_weight_l1_flag		 5'b01011		 
`define luma_weight_l1			 5'b01100		 
`define luma_offset_l1	   		 5'b01101  	   	 
`define chroma_weight_l1_flag		 5'b01110		 
`define chroma_weight_l1_j0		 5'b01111		 
`define chroma_offset_l1_j0		 5'b10000		
`define chroma_weight_l1_j1		 5'b10001
`define chroma_offset_l1_j1		 5'b10010
`define pred_weight_table_end		 5'b10011


//dec_ref_pic_marking_state 
`define rst_dec_ref_pic_marking					3'b000
`define no_output_of_prior_pics_flag_2_long_term_reference_flag 3'b001
`define adaptive_ref_pic_marking_mode_flag_s			3'b011
`define memory_management_control_operation_s			3'b010
`define difference_of_pic_nums_minus1_s				3'b100
`define long_term_pic_num_s					3'b101
`define long_term_frame_idx_s					3'b111
`define max_long_term_frame_idx_plus1_s				3'b110


`define rst_slice_data		4'b0000
`define mb_skip_run_s		4'b0001
`define skip_run_duration	4'b0011
`define skip_run_updat          4'b1001
`define mb_type_s		4'b0010
`define cabac_alignment_one_bit 4'b0110
`define mb_skip_flag		4'b0111
`define sub_mb_pred		4'b0101
`define mb_pred			4'b0100
`define coded_block_pattern_s	4'b1100
`define mb_qp_delta_s		4'b1101
`define residual		4'b1111
`define mb_num_update		4'b1110
`define b_skip_col		4'b1000
`define b_direct_col		4'b1010


//mb_pred_state 
`define rst_mb_pred		3'b000
`define prev_intra4x4_pred_mode_flag_s 3'b001
`define rem_intra4x4_pred_mode_s	3'b011
`define intra_chroma_pred_mode_s	3'b010
`define ref_idx_l0_s			3'b110
`define ref_idx_l1_s			3'b100
`define mvd_l0_s			3'b111
`define mvd_l1_s			3'b101

//sub_mb_pred_state 
`define rst_sub_mb_pred    3'b000
`define sub_mb_type_s	   3'b001
`define sub_ref_idx_l0_s   3'b011
`define sub_ref_idx_l1_s   3'b100
`define sub_mvd_l0_s	   3'b010
`define sub_mvd_l1_s	   3'b101


//residual_intra4x4_state
`define rst_residual_intra4x4 3'b000
`define intra4x4_read         3'b110
`define intra4x4_pred         3'b001
`define intra4x4_cavlc        3'b010
`define intra4x4_idct         3'b011
`define intra4x4_sum          3'b100
`define intra4x4_updat        3'b101

`define rst_residual_intra16 3'b000
`define intra16_read         3'b110
`define intra16_pred         3'b001
`define intra16_cavlc        3'b010
`define intra16_idct         3'b011
`define intra16_sum          3'b100
`define intra16_updat        3'b101

`define rst_residual_inter 3'b000
`define inter_pred_cavlc   3'b001
`define inter_idct         3'b011
`define inter_sum          3'b100
`define inter_updat        3'b101

`define rst_cavlc_decoder	4'b0000	
`define cavlc_0                 4'b0001
`define nC_decoding_s		4'b0011
`define NumCoeffTrailingOnes_LUT 4'b0010
`define TrailingOnesSignFlag	    4'b0110
`define LevelPrefix			4'b0111
`define LevelSuffix			4'b0101
`define total_zeros_LUT		        4'b0100 
`define run_before_LUT		        4'b1100
`define RunOfZeros			 4'b1101
`define LevelRunCombination	     4'b1111


`define rst_cal_reordering_pic_num   2'b00
`define cal_reordering_pic_num_move  2'b10
`define cal_reordering_pic_num_ass   2'b01
`define cal_reordering_pic_num_end   2'b11






//---Intra4x4_PredMode_RF---
`define Intra4x4_PredMode_RF_data_width 16
`define Intra4x4_PredMode_RF_data_depth 11




`define pos_Int 4'b0000
`define pos_a   4'b0100
`define pos_b   4'b1000
`define pos_c   4'b1100
`define pos_d   4'b0001
`define pos_e   4'b0101
`define pos_f   4'b1001
`define pos_g   4'b1101
`define pos_h   4'b0010
`define pos_i   4'b0110
`define pos_j   4'b1010
`define pos_k   4'b1110
`define pos_n   4'b0011
`define pos_p   4'b0111
`define pos_q   4'b1011
`define pos_r   4'b1111


`define I8x8   2'b00 //size of inter prediction partitions
`define I16x8	 2'b01
`define I8x16	 2'b10
`define I16x16 2'b11

//inter16_read
`define intra16r_rst	4'b0000
`define intra16r_v0	4'b0001
`define intra16r_v1	4'b0010
`define intra16r_v2	4'b0011
`define intra16r_v3	4'b0110
`define intra16r_h0	4'b0111
`define intra16r_h1	4'b1000
`define intra16r_h2	4'b1001
`define intra16r_h3	4'b1010
`define intra16r_pl	4'b1011

//chroma pl read
`define chromapl_rst 3'b000
`define chromapl_v1  3'b001
`define chromapl_v2  3'b010
`define chromapl_h1  3'b011
`define chromapl_h2  3'b100
`define chromapl_pl  3'b101



`define pic_flag_not_ref 2'b00
`define pic_flag_short   2'b01
`define pic_flag_long	 2'b10


