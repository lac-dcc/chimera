`include "timescale.v"
`include "define.v"

module exp_golomb_decoding (	
	input reset_n,
	input [3:0] heading_one_pos,
	input [15:0] BitStream_buffer_output,
	input [31:0] BitStream_buffer_output_ex32,
	input [3:0] num_ref_idx_l0_active_minus1_curr,num_ref_idx_l1_active_minus1_curr,	
	input [4:0] slice_header_state,
	
	input [3:0] slice_data_state,
	input [2:0] mb_pred_state,
	input [2:0] sub_mb_pred_state,
	input [4:0] pred_weight_table_state,
	input [4:0] seq_parameter_set_state,
	input [3:0] pic_parameter_set_state,
	input [2:0] ref_pic_list_reordering_state,dec_ref_pic_marking_state,
	output reg [10:0] exp_golomb_decoding_output,
	output reg [4:0] exp_golomb_len
	);
	

	
	parameter rst_exp_golomb_sel = 2'b00;
	parameter ue = 2'b01;
	parameter se = 2'b10;
	parameter te = 2'b11; 
			
	reg [10:0] codeNum;
	reg [1:0] exp_golomb_sel;
	
	always @ (exp_golomb_sel or heading_one_pos or BitStream_buffer_output)
		if (exp_golomb_sel != rst_exp_golomb_sel)
			if(heading_one_pos[3] == 0)
			case (heading_one_pos)
				0:codeNum = 0;											
				1:codeNum = {9'b0,BitStream_buffer_output[14:13]} - 1;
				2:codeNum = {8'b0,BitStream_buffer_output[13:11]} - 1;
				3:codeNum = {7'b0,BitStream_buffer_output[12:9]}  - 1;
				4:codeNum = {6'b0,BitStream_buffer_output[11:7]}  - 1;
				5:codeNum = {5'b0,BitStream_buffer_output[10:5]}  - 1;
				6:codeNum = {4'b0,BitStream_buffer_output[9:3]}   - 1;
				7:codeNum = {3'b0,BitStream_buffer_output[8:1]}   - 1;
				default:codeNum = 0;
			endcase
			else
			case (heading_one_pos)
				8:codeNum = {2'b0,BitStream_buffer_output[7:0],BitStream_buffer_output_ex32[31]}   - 1;
				9:codeNum = {1'b0,BitStream_buffer_output[6:0],BitStream_buffer_output_ex32[31:29]}   - 1;
				10:codeNum = {BitStream_buffer_output[5:0],BitStream_buffer_output_ex32[31:27]}   - 1;
				default:codeNum = 0;
			endcase
		else 
			codeNum = 0; 
	
	wire [3:0] te_range;
	assign te_range = (sub_mb_pred_state == `sub_ref_idx_l1_s || mb_pred_state == `ref_idx_l1_s)?
			num_ref_idx_l1_active_minus1_curr:num_ref_idx_l0_active_minus1_curr ;
	always @ (exp_golomb_sel or heading_one_pos or te_range)
		case (exp_golomb_sel)
			ue,se:exp_golomb_len 	= {heading_one_pos,1'b0} + 5'b1;
			te	 :exp_golomb_len 	= (te_range > 1)? ({heading_one_pos,1'b0} + 1):1;
			default:exp_golomb_len 	= 0;
		endcase
		
	wire [10:0] codeNum_se_tmp; 
	assign codeNum_se_tmp = codeNum >> 1;
	always @ (exp_golomb_sel or codeNum or codeNum_se_tmp or te_range)
		case (exp_golomb_sel)
			ue:exp_golomb_decoding_output = codeNum;
			se:
			case (codeNum[0])
				1:exp_golomb_decoding_output = (codeNum + 1) >> 1;
				0:exp_golomb_decoding_output = ~codeNum_se_tmp + 1;
			endcase
			te:
			if (te_range > 1)	exp_golomb_decoding_output = codeNum ;
			else				exp_golomb_decoding_output = {10'b0,~BitStream_buffer_output[15]};
			default:exp_golomb_decoding_output = 0;
		endcase
	
	always @ (reset_n or seq_parameter_set_state or pic_parameter_set_state or slice_header_state
	                  or slice_data_state or mb_pred_state or sub_mb_pred_state or pred_weight_table_state
			  or ref_pic_list_reordering_state or dec_ref_pic_marking_state)
		if (reset_n == 0) 
			exp_golomb_sel = rst_exp_golomb_sel;
		else if (ref_pic_list_reordering_state != `rst_ref_pic_list_reordering)
			case(ref_pic_list_reordering_state)
			`reordering_of_pic_nums_idc_s:			exp_golomb_sel	= ue;
			`abs_diff_pic_num_minus1:                       exp_golomb_sel	= ue;
			`long_term_pic_num:                             exp_golomb_sel	= ue;
			default :					exp_golomb_sel	= rst_exp_golomb_sel;
			endcase
		else if(pred_weight_table_state != `rst_pred_weight_table)
			case(pred_weight_table_state)
			`luma_log2_weight_denom,`chroma_log2_weight_denom:exp_golomb_sel	= ue;
			`luma_weight_l0,`luma_offset_l0,
			`chroma_weight_l0_j0,`chroma_offset_l0_j0,
			`chroma_weight_l0_j1,`chroma_offset_l0_j1,
			`luma_weight_l1,`luma_offset_l1,
			`chroma_weight_l1_j0,`chroma_offset_l1_j0,
			`chroma_weight_l1_j1,`chroma_offset_l1_j1:	exp_golomb_sel	= se;
			default:			exp_golomb_sel	= rst_exp_golomb_sel;
			endcase	
		else if (dec_ref_pic_marking_state != `rst_dec_ref_pic_marking)
			case(dec_ref_pic_marking_state)
			`memory_management_control_operation_s:		exp_golomb_sel	= ue;
			`difference_of_pic_nums_minus1_s:		exp_golomb_sel	= ue;
			`long_term_pic_num_s:				exp_golomb_sel	= ue;
			`long_term_frame_idx_s:				exp_golomb_sel	= ue;
			`max_long_term_frame_idx_plus1_s:		exp_golomb_sel	= ue;
			default :					exp_golomb_sel	= rst_exp_golomb_sel;
			endcase
		else if (slice_header_state != `rst_slice_header)
			case (slice_header_state)
				`first_mb_in_slice_s				:exp_golomb_sel	= ue;						 
				`slice_type_s					:exp_golomb_sel	= ue;								 
				`pic_parameter_set_id_slice_header_s		:exp_golomb_sel = ue;		 
				`idr_pic_id_s					:exp_golomb_sel	= ue;	
				`delta_pic_order_cnt_s				:exp_golomb_sel	= se;
				`num_ref_idx_l0_active_minus1_slice_header_s	:exp_golomb_sel	= ue;
				`num_ref_idx_l1_active_minus1_slice_header_s	:exp_golomb_sel	= ue;	
				`cabac_init_idc_s				:exp_golomb_sel	= ue;			  
				`slice_qp_delta_s				:exp_golomb_sel	= se;							  
				`disable_deblocking_filter_idc_s		:exp_golomb_sel	= ue;			  
				`slice_alpha_c0_offset_div2_s		    	:exp_golomb_sel = se;				  
				`slice_beta_offset_div2_s			:exp_golomb_sel	= ue;
				default						:exp_golomb_sel	= rst_exp_golomb_sel;
			endcase
		else if (slice_data_state != `rst_slice_data)
			case (slice_data_state)
				`mb_skip_run_s     :exp_golomb_sel	= ue;			  
				`mb_type_s		     :exp_golomb_sel	= ue;				  
				`sub_mb_pred:
				case (sub_mb_pred_state)
					`sub_mb_type_s	 :exp_golomb_sel	= ue;	  
					`sub_ref_idx_l0_s:exp_golomb_sel	= te;
					`sub_ref_idx_l1_s:exp_golomb_sel	= te;  
					`sub_mvd_l0_s	 :exp_golomb_sel	= se;
					`sub_mvd_l1_s	 :exp_golomb_sel	= se;
					default		 :exp_golomb_sel	= rst_exp_golomb_sel;
				endcase
				`mb_pred:
				case (mb_pred_state)
					`intra_chroma_pred_mode_s:exp_golomb_sel = ue;	    
					`ref_idx_l0_s            :exp_golomb_sel = te;
					`ref_idx_l1_s            :exp_golomb_sel = te;			    
					`mvd_l0_s                :exp_golomb_sel = se;
					`mvd_l1_s                :exp_golomb_sel = se;
					default					         :exp_golomb_sel = rst_exp_golomb_sel;
				endcase
				`coded_block_pattern_s		 :exp_golomb_sel = ue;
				`mb_qp_delta_s				     :exp_golomb_sel = se;
				default						         :exp_golomb_sel = rst_exp_golomb_sel;
			endcase
		else if (seq_parameter_set_state != `rst_seq_parameter_set)
			case (seq_parameter_set_state)
				`seq_parameter_set_id_sps_s			    :exp_golomb_sel	= ue;                
				`log2_max_frame_num_minus4_s        :exp_golomb_sel	= ue;      
				`pic_order_cnt_type_s               :exp_golomb_sel	= ue;
				`log2_max_pic_order_cnt_lsb_minus4_s:exp_golomb_sel	= ue;

				`offset_for_non_ref_pic		    :exp_golomb_sel	= se;
				`offset_for_top_to_bottom_field	    :exp_golomb_sel	= se;
				`num_ref_frames_in_pic_order_cnt_cycle :exp_golomb_sel	= ue;
				`offset_for_ref_frame		    :exp_golomb_sel	= se;
      
				`num_ref_frames_s		    :exp_golomb_sel	= ue;                          
				`pic_width_in_mbs_minus1_s          :exp_golomb_sel	= ue;      
				`pic_height_in_map_units_minus1_s   :exp_golomb_sel	= ue;
				default								              :exp_golomb_sel	= rst_exp_golomb_sel;
			endcase
		else if (pic_parameter_set_state != `rst_pic_parameter_set)
			case (pic_parameter_set_state)
				`pic_parameter_set_id_pps_s			   :exp_golomb_sel	= ue;					
				`seq_parameter_set_id_pps_s			   :exp_golomb_sel	= ue;
				`num_slice_groups_minus1_s			   :exp_golomb_sel	= ue;						
				`num_ref_idx_l0_active_minus1_pps_s:exp_golomb_sel	= ue;						
				`num_ref_idx_l1_active_minus1_pps_s:exp_golomb_sel	= ue;					 
				`pic_init_qp_minus26_s				     :exp_golomb_sel	= se;						
				`pic_init_qs_minus26_s				     :exp_golomb_sel	= se;						
				`chroma_qp_index_offset_s			     :exp_golomb_sel	= se;
				default								:exp_golomb_sel	= rst_exp_golomb_sel;
			endcase
		else
			exp_golomb_sel	= rst_exp_golomb_sel;
		
endmodule
