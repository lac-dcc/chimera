`include "timescale.v"
`include "define.v"

module syntax_decoding(
input clk,reset_n,
input [15:0] BitStream_buffer_output,
input [7:0] exp_golomb_decoding_output,
input [1:0] parser_state,
input [3:0] nal_unit_state,
input [4:0] seq_parameter_set_state,
input [3:0] pic_parameter_set_state,
input [3:0] slice_header_state,
input [1:0] slice_data_state,
input [2:0] dec_ref_pic_marking_state,

input [9:0] dependent_variable_decoding_output,
output reg start_code_prefix_found,

output [1:0] nal_ref_idc,chroma_format_idc,
output [4:0] nal_unit_type,
output [7:0] profile_idc,
output [2:0] slice_type,
output reg [1:0] weighted_bipred_idc,
output reg [1:0] pic_order_cnt_type,
output reg deblocking_filter_control_present_flag,
output adaptive_ref_pic_marking_mode_flag,
output [2:0] memory_management_control_operation,
output [1:0] disable_deblocking_filter_idc,
output [3:0] log2_max_frame_num_minus4,
output reg [5:0] pic_init_qp_minus26,
output reg [4:0] chroma_qp_index_offset,
output reg constrained_intra_pred_flag,
output reg [3:0] frame_num,
output reg [5:0] mb_type,
output reg [3:0] mb_type_general,
output reg [1:0] Intra16x16_predmode,
output reg [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
output reg sps_complete

);

always @ (parser_state or BitStream_buffer_output)
	if (parser_state == `start_code_prefix)begin
		if (BitStream_buffer_output == 16'b0000000000000001)
			start_code_prefix_found = 1;
		else	start_code_prefix_found = 0;end
	else	start_code_prefix_found = 0; 


reg  forbidden_zero_bit_reg;
wire forbidden_zero_bit;
reg [1:0] nal_ref_idc_reg;
reg [4:0] nal_unit_type_reg;

assign forbidden_zero_bit = nal_unit_state == `forbidden_zero_bit_2_nal_unit_type ?
					BitStream_buffer_output[15] : forbidden_zero_bit_reg;
assign nal_ref_idc = nal_unit_state == `forbidden_zero_bit_2_nal_unit_type ? 
					BitStream_buffer_output[14:13] : nal_ref_idc_reg;
assign nal_unit_type = nal_unit_state == `forbidden_zero_bit_2_nal_unit_type ? 
					BitStream_buffer_output[12:8] : nal_unit_type_reg;


always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		forbidden_zero_bit_reg 	<= 0;
		nal_ref_idc_reg      <= 0;
		nal_unit_type_reg		<= 0;end
	else if (nal_unit_state == `forbidden_zero_bit_2_nal_unit_type)begin
		forbidden_zero_bit_reg 	<= forbidden_zero_bit;
		nal_ref_idc_reg    		<= nal_ref_idc;
		nal_unit_type_reg	 		<= nal_unit_type;end
		
	
//sps
wire [7:0] level_idc;
reg  [7:0] level_idc_reg,profile_idc_reg;
wire [4:0] seq_parameter_set_id_sps;
reg  [4:0] seq_parameter_set_id_sps_reg;
reg  [3:0] log2_max_frame_num_minus4_reg;
reg  [1:0] chroma_format_idc_reg;

assign level_idc = seq_parameter_set_state == `level_idc_s ? 
				BitStream_buffer_output[15:8] : level_idc_reg;
assign seq_parameter_set_id_sps = seq_parameter_set_state == `seq_parameter_set_id_sps_s ?
				exp_golomb_decoding_output[4:0] : seq_parameter_set_id_sps_reg;
assign log2_max_frame_num_minus4 = seq_parameter_set_state == `log2_max_frame_num_minus4_s ?
				exp_golomb_decoding_output[3:0] : log2_max_frame_num_minus4_reg;
assign chroma_format_idc = (seq_parameter_set_state == `chroma_format_idc) ?
				exp_golomb_decoding_output[1:0] : chroma_format_idc_reg;
assign profile_idc = (seq_parameter_set_state == `fixed_header) ?
				BitStream_buffer_output[15:8] : profile_idc_reg;

always @ (posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		profile_idc_reg <= 0;
		level_idc_reg <= 0;
		seq_parameter_set_id_sps_reg <= 0;
		log2_max_frame_num_minus4_reg <= 0;
		pic_order_cnt_type <= 0;
		chroma_format_idc_reg <= 0;
		pic_width_in_mbs_minus1 <= 0;
		pic_height_in_map_units_minus1 <= 0;
	end
	else 
		case(seq_parameter_set_state)
		`fixed_header									:profile_idc_reg						<= profile_idc;
		`level_idc_s									:level_idc_reg							<= level_idc;
		`seq_parameter_set_id_sps_s            :seq_parameter_set_id_sps_reg		<= seq_parameter_set_id_sps;
		`log2_max_frame_num_minus4_s				:log2_max_frame_num_minus4_reg	<= log2_max_frame_num_minus4;
		`pic_order_cnt_type_s                  :pic_order_cnt_type              <= exp_golomb_decoding_output[1:0];
		`chroma_format_idc 							:chroma_format_idc_reg				<= chroma_format_idc;
		`pic_width_in_mbs_minus1_s             :pic_width_in_mbs_minus1         <= exp_golomb_decoding_output[7:0];
		`pic_height_in_map_units_minus1_s      :pic_height_in_map_units_minus1  <= exp_golomb_decoding_output[7:0];
		default:;
		endcase


always@(posedge clk or negedge reset_n)
	if(reset_n == 0)
		sps_complete <= 0;
	else if(seq_parameter_set_state == `vui_parameter_present_flag_s)
		sps_complete <= 1;
	else if(seq_parameter_set_state == `fixed_header)
		sps_complete <= 0;
		


//pps		
/*reg [7:0] pic_parameter_set_id_pps;
reg [4:0] seq_parameter_set_id_pps;
reg pic_order_present_flag;
reg [2:0] num_slice_groups_minus1;
reg [3:0] num_ref_idx_l0_active_minus1,num_ref_idx_l1_active_minus1;
reg [5:0] pic_init_qs_minus26;
reg redundant_pic_cnt_present_flag;
reg entropy_coding_mode_flag,weighted_pred_flag;*/

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		/*pic_parameter_set_id_pps <= 0; seq_parameter_set_id_pps <= 0;
		entropy_coding_mode_flag <= 0; pic_order_present_flag <= 0;
		num_slice_groups_minus1 <= 0;
		num_ref_idx_l0_active_minus1 <= 0; num_ref_idx_l1_active_minus1 <= 0;
		weighted_pred_flag <= 0; pic_init_qs_minus26 <= 0;
		redundant_pic_cnt_present_flag <= 0;*/
		weighted_bipred_idc <= 0;
		pic_init_qp_minus26 <= 0; 
		chroma_qp_index_offset <= 0;
		deblocking_filter_control_present_flag <= 0;
		constrained_intra_pred_flag <= 0; 
		end
	else 
		case (pic_parameter_set_state)
			/*`pic_parameter_set_id_pps_s:pic_parameter_set_id_pps <= exp_golomb_decoding_output[7:0];
			`seq_parameter_set_id_pps_s:seq_parameter_set_id_pps <= exp_golomb_decoding_output[4:0];
			`entropy_coding_mode_flag_2_pic_order_present_flag:begin
				entropy_coding_mode_flag <= BitStream_buffer_output[15];
				pic_order_present_flag   <= BitStream_buffer_output[14];end
			`num_slice_groups_minus1_s         :num_slice_groups_minus1 <= exp_golomb_decoding_output[2:0];
			`num_ref_idx_l0_active_minus1_pps_s:num_ref_idx_l0_active_minus1 <= exp_golomb_decoding_output[3:0];
			`num_ref_idx_l1_active_minus1_pps_s:num_ref_idx_l1_active_minus1 <= exp_golomb_decoding_output[3:0];*/
			`weighted_pred_flag_2_weighted_bipred_idc:begin
				//weighted_pred_flag  <= BitStream_buffer_output[15];
				weighted_bipred_idc <= BitStream_buffer_output[14:13];end
			`pic_init_qp_minus26_s   :pic_init_qp_minus26 <= exp_golomb_decoding_output[5:0];
			//`pic_init_qs_minus26_s   :pic_init_qs_minus26 <= exp_golomb_decoding_output[5:0];
			`chroma_qp_index_offset_s:chroma_qp_index_offset <= exp_golomb_decoding_output[4:0];
			`deblocking_filter_control_2_redundant_pic_cnt_present_flag:begin
				deblocking_filter_control_present_flag <= BitStream_buffer_output[15];
				constrained_intra_pred_flag            <= BitStream_buffer_output[14];
				//redundant_pic_cnt_present_flag         <= BitStream_buffer_output[13];
				end
			default:;
		endcase		

//--------------------------
//slice_header
//--------------------------
reg [2:0] slice_type_reg;
reg [1:0] disable_deblocking_filter_idc_reg;

assign slice_type = slice_header_state == `slice_type_s ? 
			exp_golomb_decoding_output[2:0] : slice_type_reg;
			
assign disable_deblocking_filter_idc = slice_header_state == `disable_deblocking_filter_idc_s ?
			exp_golomb_decoding_output[1:0] : disable_deblocking_filter_idc_reg;
			
always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		slice_type_reg <= 0;
		frame_num <= 0;
		disable_deblocking_filter_idc_reg <= 0;end
	else 
		case(slice_header_state)
		`slice_type_s:	slice_type_reg <= slice_type;
		`frame_num_s :	frame_num <= dependent_variable_decoding_output[3:0];
		`disable_deblocking_filter_idc_s:	disable_deblocking_filter_idc_reg <= disable_deblocking_filter_idc;
		default:;
		endcase

//dec_ref_pic_marking_state
reg adaptive_ref_pic_marking_mode_flag_reg;
reg [2:0] memory_management_control_operation_reg;

assign adaptive_ref_pic_marking_mode_flag = dec_ref_pic_marking_state == `adaptive_ref_pic_marking_mode_flag_s ?
				BitStream_buffer_output[15] : adaptive_ref_pic_marking_mode_flag_reg;
assign memory_management_control_operation = dec_ref_pic_marking_state == `memory_management_control_operation_s ?
				exp_golomb_decoding_output[2:0] : memory_management_control_operation_reg;
				
				
always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		adaptive_ref_pic_marking_mode_flag_reg <= 0;
		memory_management_control_operation_reg <= 0;end
	else case(dec_ref_pic_marking_state)
			`adaptive_ref_pic_marking_mode_flag_s:
				adaptive_ref_pic_marking_mode_flag_reg <= adaptive_ref_pic_marking_mode_flag;
			`memory_management_control_operation_s:
				memory_management_control_operation_reg <= memory_management_control_operation;
		default:;
		endcase




//--------------------------
//slice_data
//--------------------------
reg [3:0] mb_type_general_reg;

always @ (slice_data_state or exp_golomb_decoding_output or mb_type_general_reg or reset_n)
	if (reset_n == 0)
		 mb_type_general = `MB_type_rst;
	else if (slice_data_state == `mb_type_s)begin
			case (exp_golomb_decoding_output[7:0])
			0:                      mb_type_general = `MB_Intra4x4;
			1,2,3,4,13,14,15,16:    mb_type_general = `MB_Intra16x16_CBPChroma0;
			5,6,7,8,17,18,19,20:    mb_type_general = `MB_Intra16x16_CBPChroma1;
			9,10,11,12,21,22,23,24: mb_type_general = `MB_Intra16x16_CBPChroma2;
			default:                mb_type_general = `MB_Inter16x16;
			endcase
	end
	else
		mb_type_general = mb_type_general_reg;
			
//Intra16x16_predmode
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		Intra16x16_predmode <= 2'b0;
	else if (slice_data_state == `mb_type_s)begin
				case (exp_golomb_decoding_output[1:0])
				2'b00:Intra16x16_predmode <= 2'b11;
				2'b01:Intra16x16_predmode <= 2'b00;
				2'b10:Intra16x16_predmode <= 2'b01;
				2'b11:Intra16x16_predmode <= 2'b10;
				endcase
		end							

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
			mb_type <= 0; mb_type_general_reg <= `MB_type_rst;end
	else if (slice_data_state == `mb_type_s)begin
				mb_type <= exp_golomb_decoding_output[5:0];
				mb_type_general_reg <= mb_type_general;end



/*reg [3:0] num_ref_frames; 
reg residual_colour_transform_flag;
reg [2:0] bit_depth_luma_minus8,bit_depth_chroma_minus8;
reg qpprime_y_zero_transform_bypass_flag;
reg seq_scaling_matrix_present_flag;
reg gaps_in_frame_num_value_allowed_flag;
reg frame_mbs_only_flag;
reg direct_8x8_inference_flag;
reg frame_cropping_flag;
reg vui_parameter_present_flag;
reg [10:0] offset_for_top_to_bottom_field;
reg [10:0] offset_for_ref_frame;

		
always @ (reset_n or seq_parameter_set_state or BitStream_buffer_output or exp_golomb_decoding_output)
	if (reset_n == 0)begin
		residual_colour_transform_flag		 = 0;
		bit_depth_luma_minus8					 = 0;
		bit_depth_chroma_minus8					 = 0;
		qpprime_y_zero_transform_bypass_flag = 0;
		seq_scaling_matrix_present_flag		 = 0;
		num_ref_frames                       = 0; 
		gaps_in_frame_num_value_allowed_flag = 0;
		frame_mbs_only_flag                  = 0;
		direct_8x8_inference_flag            = 0;
		frame_cropping_flag                  = 0;
		vui_parameter_present_flag           = 0;end
	else 
		case (seq_parameter_set_state)
		`residual_colour_transform_flag			:residual_colour_transform_flag		  = BitStream_buffer_output[15];
		`bit_depth_luma_minus8						:bit_depth_luma_minus8  				  = exp_golomb_decoding_output[2:0];
		`bit_depth_chroma_minus8					:bit_depth_chroma_minus8				  = exp_golomb_decoding_output[2:0];
		`qpprime_y_zero_transform_bypass_flag	:begin
												qpprime_y_zero_transform_bypass_flag = BitStream_buffer_output[15];
												seq_scaling_matrix_present_flag	    = BitStream_buffer_output[14];end
		`num_ref_frames_s                      :num_ref_frames                       = exp_golomb_decoding_output[3:0];
		`gaps_in_frame_num_value_allowed_flag_s:gaps_in_frame_num_value_allowed_flag = BitStream_buffer_output[15];
		`frame_mbs_only_flag_2_frame_cropping_flag:begin
			frame_mbs_only_flag       = BitStream_buffer_output[15];
			direct_8x8_inference_flag = BitStream_buffer_output[14];
			frame_cropping_flag       = BitStream_buffer_output[13];end
		`vui_parameter_present_flag_s:vui_parameter_present_flag = BitStream_buffer_output[15];
		default:;
		endcase

*/

/*reg first_mb_in_slice;
reg [7:0] pic_parameter_set_id_slice_header;
reg idr_pic_id;
reg [3:0] slice_alpha_c0_offset_div2_dec;
reg [3:0] slice_beta_offset_div2_dec;
reg [5:0] slice_qp_delta;*/	
		
/*always @ (slice_header_state or exp_golomb_decoding_output  or BitStream_buffer_output or reset_n)
	if (reset_n == 0)begin
		first_mb_in_slice                 = 0;
		pic_parameter_set_id_slice_header = 0;
		idr_pic_id                        = 0;
		slice_alpha_c0_offset_div2_dec    = 0;
		slice_beta_offset_div2_dec        = 0;end
	else
		case (slice_header_state)
			`first_mb_in_slice_s                :first_mb_in_slice                 = exp_golomb_decoding_output[0];
			`pic_parameter_set_id_slice_header_s:pic_parameter_set_id_slice_header = exp_golomb_decoding_output[7:0];
			`idr_pic_id_s                       :idr_pic_id                        = exp_golomb_decoding_output[0];
			`slice_qp_delta_s                   :slice_qp_delta                    = exp_golomb_decoding_output[5:0];
			`slice_alpha_c0_offset_div2_s       :slice_alpha_c0_offset_div2_dec    = exp_golomb_decoding_output[3:0];
			`slice_beta_offset_div2_s           :slice_beta_offset_div2_dec 	     = exp_golomb_decoding_output[3:0];
			default:;
		endcase
*/		

endmodule
