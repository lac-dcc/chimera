`include "timescale.v"
`include "define.v"

module pc_decoding (
input clk,reset_n,
input [1:0] parser_state,
input [3:0] nal_unit_state,
input [4:0] seq_parameter_set_state,
input [3:0] pic_parameter_set_state,
input [3:0] slice_header_state,
input [1:0] slice_data_state,
input [2:0] dec_ref_pic_marking_state,
input [3:0] dependent_variable_len,
input start_code_prefix_found,
	
input [4:0] cavlc_consumed_bits_len,
input [4:0] exp_golomb_len,
output [6:0] pc,
output reg [6:0] pc_reg,
output reg [4:0] pc_delta
);
	

			

reg [2:0] consumed_bits_sel;
reg [4:0] FixedLen;
	
always @ (reset_n or parser_state or nal_unit_state or seq_parameter_set_state or pic_parameter_set_state
                  or slice_header_state  or dec_ref_pic_marking_state or slice_data_state)
	 if (reset_n == 0)
		consumed_bits_sel = `rst_consumed_bits_sel; 
	 else if ((parser_state == `start_code_prefix)||(nal_unit_state == `forbidden_zero_bit_2_nal_unit_type))
		consumed_bits_sel = `fixed_length;
	else if (slice_header_state != `rst_slice_header)
		case (slice_header_state)
		`first_mb_in_slice_s                        :consumed_bits_sel = `exp_golomb;						 
		`slice_type_s                               :consumed_bits_sel = `exp_golomb;								 
		`pic_parameter_set_id_slice_header_s        :consumed_bits_sel = `exp_golomb;
		`frame_num_s                                :consumed_bits_sel = `dependent_variable;
		`idr_pic_id_s                               :consumed_bits_sel = `exp_golomb;
		`dec_ref_pic_marking:
			case (dec_ref_pic_marking_state)
			`no_output_of_prior_pics_flag_2_long_term_reference_flag:consumed_bits_sel = `fixed_length;
			`adaptive_ref_pic_marking_mode_flag_s                   :consumed_bits_sel = `fixed_length;
			`memory_management_control_operation_s			:consumed_bits_sel = `exp_golomb;
			`difference_of_pic_nums_minus1_s			:consumed_bits_sel = `exp_golomb;
			`long_term_pic_num_s					:consumed_bits_sel = `exp_golomb;
			`long_term_frame_idx_s					:consumed_bits_sel = `exp_golomb;
			`max_long_term_frame_idx_plus1_s			:consumed_bits_sel = `exp_golomb;
			default                                                 :consumed_bits_sel = `rst_consumed_bits_sel;
			endcase
		`slice_qp_delta_s               :consumed_bits_sel = `exp_golomb;			 
		`disable_deblocking_filter_idc_s:consumed_bits_sel = `exp_golomb;			  
		`slice_alpha_c0_offset_div2_s   :consumed_bits_sel = `exp_golomb;			 
		`slice_beta_offset_div2_s       :consumed_bits_sel = `exp_golomb;
		default                         :consumed_bits_sel = `rst_consumed_bits_sel;
		endcase
	else if (slice_data_state != `rst_slice_data)
		case (slice_data_state)	    
		`mb_type_s            :consumed_bits_sel = `exp_golomb_add1;	  	  	    
		//`mb_qp_delta_s        :consumed_bits_sel = `exp_golomb;	     
		`residual             :consumed_bits_sel = `cavlc_consumed;
		default               :consumed_bits_sel = `rst_consumed_bits_sel;
		endcase
	else if (seq_parameter_set_state != `rst_seq_parameter_set)
		case (seq_parameter_set_state)
		`fixed_header,`level_idc_s                :consumed_bits_sel = `fixed_length;
		`seq_parameter_set_id_sps_s               :consumed_bits_sel = `exp_golomb; 
		`chroma_format_idc								:consumed_bits_sel = `exp_golomb;
		`residual_colour_transform_flag				:consumed_bits_sel = `fixed_length;
		`bit_depth_luma_minus8,`bit_depth_chroma_minus8							
																:consumed_bits_sel = `exp_golomb;
		`qpprime_y_zero_transform_bypass_flag		:consumed_bits_sel = `fixed_length;
		`log2_max_frame_num_minus4_s              :consumed_bits_sel = `exp_golomb;      
		`pic_order_cnt_type_s                     :consumed_bits_sel = `exp_golomb;      
		`num_ref_frames_s                         :consumed_bits_sel = `exp_golomb;
		`gaps_in_frame_num_value_allowed_flag_s	  :consumed_bits_sel = `fixed_length;	
		`pic_width_in_mbs_minus1_s                :consumed_bits_sel = `exp_golomb;      
		`pic_height_in_map_units_minus1_s         :consumed_bits_sel = `exp_golomb;
		`frame_mbs_only_flag_2_frame_cropping_flag:consumed_bits_sel = `fixed_length;
		`vui_parameter_present_flag_s             :consumed_bits_sel = `fixed_length;		
		default                                   :consumed_bits_sel = `rst_consumed_bits_sel;
		endcase
	else if (pic_parameter_set_state != `rst_pic_parameter_set)
		case (pic_parameter_set_state)
		`pic_parameter_set_id_pps_s                                :consumed_bits_sel = `exp_golomb;
		`seq_parameter_set_id_pps_s                                :consumed_bits_sel = `exp_golomb;
		`entropy_coding_mode_flag_2_pic_order_present_flag         :consumed_bits_sel = `fixed_length;
		`num_slice_groups_minus1_s                                 :consumed_bits_sel = `exp_golomb;
		`num_ref_idx_l0_active_minus1_pps_s                        :consumed_bits_sel = `exp_golomb;
		`num_ref_idx_l1_active_minus1_pps_s                        :consumed_bits_sel = `exp_golomb;
		`weighted_pred_flag_2_weighted_bipred_idc                  :consumed_bits_sel = `fixed_length;
		`pic_init_qp_minus26_s                                     :consumed_bits_sel = `exp_golomb;
		`pic_init_qs_minus26_s                                     :consumed_bits_sel = `exp_golomb;
		`chroma_qp_index_offset_s                                  :consumed_bits_sel = `exp_golomb;
		`deblocking_filter_control_2_redundant_pic_cnt_present_flag:consumed_bits_sel = `fixed_length;  
		default                                                    :consumed_bits_sel = `rst_consumed_bits_sel;
		endcase		
	else if (nal_unit_state == `rbsp_trailing_one_bit)
		consumed_bits_sel = `fixed_length;
	else if (nal_unit_state == `rbsp_trailing_zero_bits)
		consumed_bits_sel = `trailing_bits;		
	else
		consumed_bits_sel = `rst_consumed_bits_sel;													
			
always @ (reset_n or parser_state or nal_unit_state or seq_parameter_set_state or pic_parameter_set_state
          or slice_header_state  or dec_ref_pic_marking_state 
          or slice_data_state  or start_code_prefix_found)
	if (reset_n == 0)
		FixedLen = 0;
	else if (parser_state == `start_code_prefix&&start_code_prefix_found)
		FixedLen = 5'd16;	
  	else if (parser_state == `start_code_prefix&&start_code_prefix_found ==0)
		FixedLen = 5'd8;	
	else if (nal_unit_state == `forbidden_zero_bit_2_nal_unit_type)
		FixedLen = 8;
	else if (dec_ref_pic_marking_state == `no_output_of_prior_pics_flag_2_long_term_reference_flag)
		FixedLen = 2;
	else if (dec_ref_pic_marking_state == `adaptive_ref_pic_marking_mode_flag_s)
		FixedLen = 1;
	else if (seq_parameter_set_state == `fixed_header)
		FixedLen = 5'd16;	
	else if (seq_parameter_set_state == `level_idc_s)
		FixedLen = 8;	
	else if (seq_parameter_set_state == `gaps_in_frame_num_value_allowed_flag_s)
		FixedLen = 1;	
	else if (seq_parameter_set_state == `frame_mbs_only_flag_2_frame_cropping_flag)
		FixedLen = 3;
	else if (seq_parameter_set_state == `delta_pic_order_always_zero_flag || 
				seq_parameter_set_state == `vui_parameter_present_flag_s ||
				seq_parameter_set_state == `residual_colour_transform_flag)
		FixedLen = 1;
	else if(seq_parameter_set_state == `qpprime_y_zero_transform_bypass_flag)
		FixedLen = 2;
	else if (pic_parameter_set_state == `entropy_coding_mode_flag_2_pic_order_present_flag)
		FixedLen = 2;
	else if (pic_parameter_set_state == `weighted_pred_flag_2_weighted_bipred_idc)
		FixedLen = 3;
	else if (pic_parameter_set_state == `deblocking_filter_control_2_redundant_pic_cnt_present_flag)
		FixedLen = 3;
	else if (nal_unit_state == `rbsp_trailing_one_bit)
		FixedLen = 1;
	else 
		FixedLen = 1;
					
wire [2:0] trailing_bits_tmp;
assign trailing_bits_tmp = 3'd0 - pc_reg[2:0];
				
always @ (consumed_bits_sel  or FixedLen or exp_golomb_len or dependent_variable_len or cavlc_consumed_bits_len
		or trailing_bits_tmp)
	 case(consumed_bits_sel)
	 `exp_golomb        :pc_delta = exp_golomb_len;
	 `exp_golomb_add1   :pc_delta = exp_golomb_len + 5'd1;
	 `fixed_length      :pc_delta = FixedLen;
	 `dependent_variable:pc_delta = {1'b0,dependent_variable_len};
	 `trailing_bits     :pc_delta = {2'b0,trailing_bits_tmp};
	 `cavlc_consumed    :pc_delta = cavlc_consumed_bits_len;
	 default            :pc_delta = 0 ;
	 endcase

assign pc = 	pc_reg + {2'b0,pc_delta}	;  



always @ (posedge clk)
	pc_reg <= (reset_n == 0)? 7'd0:pc;

endmodule	
				
			