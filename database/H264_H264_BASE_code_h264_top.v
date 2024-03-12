`include "timescale.v"
`include "define.v"

module h264_top(
input clk,reset_n,
input [15:0] BitStream_buffer_output,
input [31:0] BitStream_buffer_output_ex32,
input [15:0] removed_03,


output [31:0] pc,

output end_of_lastMB_DF,
output [15:0] POC,

output luma_ram_w,chroma_ram_w,
output [19:0] luma_ram_addr,
output [18:0] chroma_ram_addr,



output [31:0] final_frame_RAM_din         //7-0 left   31-23 right
);



wire  final_frame_RAM_wr;
wire [20:0] final_frame_RAM_addr;

wire start_code_prefix_found,heading_one_en,forbidden_zero_bit,slice_header_s6,disable_DF;

wire [4:0] nal_unit_type;
wire [1:0] pic_order_cnt_type;
wire [2:0] slice_type;
wire [5:0] mb_type;
wire [1:0] sub_mb_type;

wire [1:0] parser_state; 
wire [3:0] nal_unit_state; 
wire [4:0] seq_parameter_set_state;
wire [3:0] pic_parameter_set_state;
wire [4:0] slice_header_state;
wire [3:0] slice_data_state;
wire [2:0] sub_mb_pred_state;
wire [2:0] mb_pred_state;  
wire [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state;
wire [2:0] ref_pic_list_reordering_state,dec_ref_pic_marking_state;
wire [3:0] cavlc_decoder_state;
wire [4:0] pred_weight_table_state;



wire [10:0] exp_golomb_decoding_output;
wire [9:0] dependent_variable_decoding_output;
wire [3:0] heading_one_pos;

wire [1:0] nal_ref_idc;
wire [1:0] weighted_bipred_idc;
wire [3:0] num_ref_idx_l0_active_minus1_curr,num_ref_idx_l1_active_minus1_curr;

wire [4:0] exp_golomb_len;
wire [3:0] dependent_variable_len;
wire [4:0] cavlc_consumed_bits_len;

wire num_ref_idx_active_override_flag;
wire entropy_coding_mode_flag;
wire deblocking_filter_control_present_flag;
wire constrained_intra_pred_flag;
wire weighted_pred_flag;
wire prev_intra4x4_pred_mode_flag;
wire delta_pic_order_always_zero_flag;
wire direct_spatial_mv_pred_flag;
wire long_term_reference_flag;
wire luma_weight_l0_flag,chroma_weight_l0_flag;
wire luma_weight_l1_flag,chroma_weight_l1_flag;


wire [1:0] disable_deblocking_filter_idc;
wire adaptive_ref_pic_marking_mode_flag;
wire [2:0] memory_management_control_operation;
wire [5:0] pic_init_qp_minus26;
wire [4:0] chroma_qp_index_offset;
wire [5:0] QPy,QPc;
wire [3:0] log2_max_frame_num_minus4,log2_max_pic_order_cnt_lsb_minus4;
wire [7:0] num_ref_frames_in_pic_order_cnt_cycle,num_ref_frames_in_pic_order_cnt_cycle_i;
wire [10:0] offset_for_ref_frame;
wire [3:0] mb_type_general;
wire [2:0] NumMbPart,NumSubMbPart;

wire [3:0] CodedBlockPatternLuma;
wire [1:0] CodedBlockPatternChroma;
wire [3:0] luma4x4BlkIdx;
wire [15:0] mb_num;
wire [7:0] mb_num_h,mb_num_v,mb_num_h_pred,mb_num_v_pred;

wire [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,MBTypeGen_mbAddrC;
wire [3:0] frame_num;
wire [2:0] rem_intra4x4_pred_mode;
wire [1:0] intra_chroma_pred_mode;
wire [63:0] Intra4x4PredMode_CurrMb; 
wire [15:0] ref_idx_l0,ref_idx_l1;
wire [15:0] Intra4x4PredMode_mbAddrB_dout;
wire Intra4x4PredMode_mbAddrB_cs_n,Intra4x4PredMode_mbAddrB_wr_n;
wire [7:0] Intra4x4PredMode_mbAddrB_rd_addr,Intra4x4PredMode_mbAddrB_wr_addr;
wire [15:0] Intra4x4PredMode_mbAddrB_din;

wire end_of_one_residual_block,end_of_NonZeroCoeff_CAVLC;

wire [4:0] TotalCoeff;
wire [1:0] TrailingOnes;
wire [3:0] zerosLeft,run,coeffNum,i_level,i_run,i_TotalCoeff;
wire suffix_length_initialized,IsRunLoop,idct_end;
wire [4:0] intra4x4_pred_num,intra16_pred_num;
wire [15:0] coeffLevel_0,coeffLevel_1,coeffLevel_2,coeffLevel_3;
wire [15:0] coeffLevel_4,coeffLevel_5,coeffLevel_6,coeffLevel_7;
wire [15:0] coeffLevel_8,coeffLevel_9,coeffLevel_10,coeffLevel_11;
wire [15:0] coeffLevel_12,coeffLevel_13,coeffLevel_14,coeffLevel_15;
wire [15:0] intra_pred_4x4_00,intra_pred_4x4_01,intra_pred_4x4_02,intra_pred_4x4_03;
wire [15:0] intra_pred_4x4_10,intra_pred_4x4_11,intra_pred_4x4_12,intra_pred_4x4_13;
wire [15:0] intra_pred_4x4_20,intra_pred_4x4_21,intra_pred_4x4_22,intra_pred_4x4_23;
wire [15:0] intra_pred_4x4_30,intra_pred_4x4_31,intra_pred_4x4_32,intra_pred_4x4_33;
wire [15:0] coef_00,coef_01,coef_02,coef_03,coef_10,coef_11,coef_12,coef_13;
wire [15:0] coef_20,coef_21,coef_22,coef_23,coef_30,coef_31,coef_32,coef_33;
wire [15:0] twod_output_00,twod_output_01,twod_output_02,twod_output_03;
wire [15:0] twod_output_10,twod_output_11,twod_output_12,twod_output_13;
wire [15:0] twod_output_20,twod_output_21,twod_output_22,twod_output_23;
wire [15:0] twod_output_30,twod_output_31,twod_output_32,twod_output_33;
wire [15:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03;
wire [15:0] img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13;
wire [15:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23;
wire [15:0] img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33;
wire [15:0] intra_pred_16_00,intra_pred_16_01,intra_pred_16_02,intra_pred_16_03;
wire [15:0] intra_pred_16_10,intra_pred_16_11,intra_pred_16_12,intra_pred_16_13;
wire [15:0] intra_pred_16_20,intra_pred_16_21,intra_pred_16_22,intra_pred_16_23;
wire [15:0] intra_pred_16_30,intra_pred_16_31,intra_pred_16_32,intra_pred_16_33;
wire [7:0] inter_pred_output_00,inter_pred_output_01,inter_pred_output_02,inter_pred_output_03;
wire [7:0] inter_pred_output_10,inter_pred_output_11,inter_pred_output_12,inter_pred_output_13;
wire [7:0] inter_pred_output_20,inter_pred_output_21,inter_pred_output_22,inter_pred_output_23;
wire [7:0] inter_pred_output_30,inter_pred_output_31,inter_pred_output_32,inter_pred_output_33;
wire intra4x4_cs_n,intra4x4_wr_n;
wire [12:0] intra4x4_wr_addr,intra4x4_rd_addr; 
wire [55:0] intra4x4_din,intra4x4_dout;

wire currMB_availA,currMB_availB;
wire intra4x4_read_end,intra16_read_end,cavlc_nc_end;
wire [7:0] nrblock_a,nrblock_b,nrblock_c,nrblock_d,nrblock_e,nrblock_f,nrblock_g,nrblock_h,nrblock_i,nrblock_j,nrblock_k,nrblock_l,nrblock_m;
wire [7:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3;
wire [7:0] nrblockpl_0,nrblockpl_1,nrblockpl_2,nrblockpl_3;
wire [3:0] state16;
wire [4:0] TC_dout;
wire [12:0] TC_rd_addr,TC_wr_addr;
wire TC_cs_n,TC_wr_n;
wire [4:0] TC_din;
wire [1:0] Intra16x16_predmode;
wire res_0,end_of_MB_DEC,end_of_mb_sum,end_of_BS_DEC;
wire [11:0] bs_V0,bs_V1,bs_V2,bs_V3,bs_H0,bs_H1,bs_H2,bs_H3;
wire [7:0] pic_width_in_mbs_minus1,pic_height_in_map_units_minus1;
wire [2:0] state_chromapl;
wire [3:0] slice_alpha_c0_offset_div2,slice_beta_offset_div2;
wire ref_pic_list_reordering_flag_l0,ref_pic_list_reordering_flag_l1;
wire [1:0] reordering_of_pic_nums_idc;
wire end_of_MB_DF;
wire [9:0] mb_skip_run;
wire [3:0] mv_below8x8;
wire [1:0] mbPartIdx,subMbPartIdx,SubMbPredMode;
wire [10:0] mvd;
wire MBTypeGen_mbAddrD;
wire Is_skip_run_entry,Is_skip_run_end,p_skip_end;
wire compIdx;
wire mv_mbAddrB_rd_for_DF,ref_idx_rd_for_DF;
wire skip_mv_calc,Is_skipMB_mv_calc,mv_is16x16;
wire enable_L0,enable_L1;
wire weighted_pred_en;
wire [19:0] final_frame_luma_rd_addr;
wire [18:0] final_frame_chroma_rd_addr;
wire [31:0] final_frame_luma_RAM_dout,final_frame_chroma_RAM_dout;
wire Inter_end,residual_end;
wire ref_frame_luma_RAM_rd,ref_frame_chroma_RAM_rd;
wire [21:0] ref_luma_wr_addr,ref_luma_rd_addr;
wire [20:0] ref_chroma_wr_addr,ref_chroma_rd_addr;

wire ao_valid_luma,ao_valid_chroma,data_valid;
wire [9:0] pic_order_cnt_lsb;

wire memory_management_control_operation_5,reordering_of_pic_nums_idc_l1;
wire POC_end;
wire offset_for_ref_frame_wr_n,offset_for_ref_frame_rd_n;
wire [7:0] offset_for_ref_frame_wr_addr,offset_for_ref_frame_rd_addr;
wire [10:0] offset_for_ref_frame_din,offset_for_ref_frame_i;

wire [10:0] delta_pic_order_cnt,offset_for_non_ref_pic;
wire sub_ref_idx_l0_en,sub_ref_idx_l1_en,ref_idx_l0_en,ref_idx_l1_en;
wire sub_mvd_l0_en,sub_mvd_l1_en,mvd_l0_en,mvd_l1_en;
wire [2:0] B_MbPartPredMode_0,B_MbPartPredMode_1;
wire [2:0] logWD;
wire [7:0] pred_weight_table_w0,pred_weight_table_w1;
wire [7:0] pred_weight_table_o0,pred_weight_table_o1;
wire [19:0] refIdxL0_curr,refIdxL1_curr;    
wire [3:0] predFlagL0_curr,predFlagL1_curr;
wire [9:0] refIdxL0_addrA,refIdxL1_addrA,refIdxL0_addrB_dout,refIdxL1_addrB_dout;
wire [1:0] predFlagL0_addrA,predFlagL1_addrA,predFlagL0_addrB_dout,predFlagL1_addrB_dout;
wire [3:0] ref_idx_l0_curr,ref_idx_l1_curr;
wire [43:0] mvxL0_mbAddrA,mvyL0_mbAddrA,mvxL1_mbAddrA,mvyL1_mbAddrA;
wire [43:0] mvxL0_mbAddrB_dout,mvyL0_mbAddrB_dout,mvxL1_mbAddrB_dout,mvyL1_mbAddrB_dout;
wire [43:0] mvxL0_CurrMb0,mvxL0_CurrMb1,mvxL0_CurrMb2,mvxL0_CurrMb3;
wire [43:0] mvyL0_CurrMb0,mvyL0_CurrMb1,mvyL0_CurrMb2,mvyL0_CurrMb3;
wire [43:0] mvxL1_CurrMb0,mvxL1_CurrMb1,mvxL1_CurrMb2,mvxL1_CurrMb3;
wire [43:0] mvyL1_CurrMb0,mvyL1_CurrMb1,mvyL1_CurrMb2,mvyL1_CurrMb3;
wire [3:0] difference_of_pic_nums_minus1,long_term_pic_num,long_term_frame_idx;
wire [4:0] abs_diff_pic_num_minus1;
wire [3:0] long_term_pic_num_reordering;
wire cal_abs_diff_end,cal_long_term_end;

wire b_col_end,refbuild_end;

wire [1:0] td,tb;
Inter_mv_decodor Inter_mv_decodor(
	.clk(clk),.reset_n(reset_n),
	.nal_ref_idc(nal_ref_idc),
	.slice_type(slice_type),
	.slice_data_state(slice_data_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.mb_type_general(mb_type_general),
	.sub_mb_type(sub_mb_type),
	.mbPartIdx(mbPartIdx),.subMbPartIdx(subMbPartIdx),.compIdx(compIdx),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.MBTypeGen_mbAddrC(MBTypeGen_mbAddrC),.MBTypeGen_mbAddrD(MBTypeGen_mbAddrD),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),.B_MbPartPredMode_1(B_MbPartPredMode_1),
	.ref_idx_l0(ref_idx_l0),.ref_idx_l1(ref_idx_l1),
	.SubMbPredMode(SubMbPredMode),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.ref_idx_rd_for_DF(ref_idx_rd_for_DF),.mv_mbAddrB_rd_for_DF(mv_mbAddrB_rd_for_DF),
	.Is_skip_run_entry(Is_skip_run_entry),.Is_skip_run_end(Is_skip_run_end),.p_skip_end(p_skip_end),
	.mvd(mvd),.direct_spatial_mv_pred_flag(direct_spatial_mv_pred_flag),
	.b_col_end(b_col_end),
	.td(td),.tb(tb),
	.skip_mv_calc(skip_mv_calc),.mv_is16x16(mv_is16x16),
	.Is_skipMB_mv_calc(Is_skipMB_mv_calc),
	.refIdxL0_curr(refIdxL0_curr),.refIdxL1_curr(refIdxL1_curr),
	.predFlagL0_curr(predFlagL0_curr),.predFlagL1_curr(predFlagL1_curr),
	.refIdxL0_addrA(refIdxL0_addrA),.refIdxL1_addrA(refIdxL1_addrA),
	.predFlagL0_addrA(predFlagL0_addrA),.predFlagL1_addrA(predFlagL1_addrA),
	
	.refIdxL0_addrB_dout(refIdxL0_addrB_dout),.refIdxL1_addrB_dout(refIdxL1_addrB_dout),
	.predFlagL0_addrB_dout(predFlagL0_addrB_dout),.predFlagL1_addrB_dout(predFlagL1_addrB_dout),

	.mvxL0_mbAddrA(mvxL0_mbAddrA),.mvyL0_mbAddrA(mvyL0_mbAddrA),
	.mvxL1_mbAddrA(mvxL1_mbAddrA),.mvyL1_mbAddrA(mvyL1_mbAddrA),

	.mvxL0_mbAddrB_dout(mvxL0_mbAddrB_dout),.mvyL0_mbAddrB_dout(mvyL0_mbAddrB_dout),
	.mvxL1_mbAddrB_dout(mvxL1_mbAddrB_dout),.mvyL1_mbAddrB_dout(mvyL1_mbAddrB_dout),

	.mvxL0_CurrMb0(mvxL0_CurrMb0),.mvxL0_CurrMb1(mvxL0_CurrMb1),.mvxL0_CurrMb2(mvxL0_CurrMb2),.mvxL0_CurrMb3(mvxL0_CurrMb3),
	.mvyL0_CurrMb0(mvyL0_CurrMb0),.mvyL0_CurrMb1(mvyL0_CurrMb1),.mvyL0_CurrMb2(mvyL0_CurrMb2),.mvyL0_CurrMb3(mvyL0_CurrMb3),
	.mvxL1_CurrMb0(mvxL1_CurrMb0),.mvxL1_CurrMb1(mvxL1_CurrMb1),.mvxL1_CurrMb2(mvxL1_CurrMb2),.mvxL1_CurrMb3(mvxL1_CurrMb3),
	.mvyL1_CurrMb0(mvyL1_CurrMb0),.mvyL1_CurrMb1(mvyL1_CurrMb1),.mvyL1_CurrMb2(mvyL1_CurrMb2),.mvyL1_CurrMb3(mvyL1_CurrMb3)
);



POC_decoding POC_decoding(
	.clk(clk),.reset_n(reset_n),
	.nal_unit_type(nal_unit_type),
	.pic_order_cnt_type(pic_order_cnt_type),
	.frame_num(frame_num),.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.log2_max_pic_order_cnt_lsb_minus4(log2_max_pic_order_cnt_lsb_minus4),
	.slice_header_state(slice_header_state),.seq_parameter_set_state(seq_parameter_set_state),
	.nal_ref_idc(nal_ref_idc),.delta_pic_order_cnt(delta_pic_order_cnt),
	.pic_order_cnt_lsb(pic_order_cnt_lsb),.offset_for_non_ref_pic(offset_for_non_ref_pic),
	.memory_management_control_operation_5(memory_management_control_operation_5),
	.num_ref_frames_in_pic_order_cnt_cycle(num_ref_frames_in_pic_order_cnt_cycle),
	.offset_for_ref_frame(offset_for_ref_frame),.offset_for_ref_frame_i(offset_for_ref_frame_i),
	.POC(POC),.POC_end(POC_end),

	.offset_for_ref_frame_rd_n(offset_for_ref_frame_rd_n),
	.offset_for_ref_frame_rd_addr(offset_for_ref_frame_rd_addr)
);

wire Inter_L0_end,data_valid_L0;
wire [19:0] frame_L0_luma_rd_addr;
wire [18:0] frame_L0_chroma_rd_addr;
wire [31:0] frame_L0_luma_RAM_dout,frame_L0_chroma_RAM_dout;
wire ref_L0_luma_RAM_rd,ref_L0_chroma_RAM_rd;
wire [7:0] inter_pred_output_00_L0,inter_pred_output_01_L0,inter_pred_output_02_L0,inter_pred_output_03_L0;
wire [7:0] inter_pred_output_10_L0,inter_pred_output_11_L0,inter_pred_output_12_L0,inter_pred_output_13_L0;
wire [7:0] inter_pred_output_20_L0,inter_pred_output_21_L0,inter_pred_output_22_L0,inter_pred_output_23_L0;
wire [7:0] inter_pred_output_30_L0,inter_pred_output_31_L0,inter_pred_output_32_L0,inter_pred_output_33_L0;


Inter_pred Inter_pred_L0(
	.clk(clk),.reset_n(reset_n),
	.residual_inter_state(residual_inter_state),.slice_data_state(slice_data_state),
	.intra4x4_pred_num(intra4x4_pred_num),.mb_type_general(mb_type_general),
	.mv_below8x8(mv_below8x8),.mv_is16x16(mv_is16x16),
	.enable(enable_L0),
	.mvx_CurrMb0(mvxL0_CurrMb0),.mvx_CurrMb1(mvxL0_CurrMb1),.mvx_CurrMb2(mvxL0_CurrMb2),.mvx_CurrMb3(mvxL0_CurrMb3),
	.mvy_CurrMb0(mvyL0_CurrMb0),.mvy_CurrMb1(mvyL0_CurrMb1),.mvy_CurrMb2(mvyL0_CurrMb2),.mvy_CurrMb3(mvyL0_CurrMb3),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),.data_valid(data_valid_L0),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.final_frame_luma_RAM_dout(frame_L0_luma_RAM_dout),.final_frame_chroma_RAM_dout(frame_L0_chroma_RAM_dout),
	.ref_frame_luma_RAM_rd(ref_L0_luma_RAM_rd),.ref_frame_chroma_RAM_rd(ref_L0_chroma_RAM_rd),
	.final_frame_luma_rd_addr(frame_L0_luma_rd_addr),.final_frame_chroma_rd_addr(frame_L0_chroma_rd_addr),
	.Inter_end(Inter_L0_end),
	.inter_pred_output_00(inter_pred_output_00_L0),.inter_pred_output_01(inter_pred_output_01_L0),
	.inter_pred_output_02(inter_pred_output_02_L0),.inter_pred_output_03(inter_pred_output_03_L0),
	.inter_pred_output_10(inter_pred_output_10_L0),.inter_pred_output_11(inter_pred_output_11_L0),
	.inter_pred_output_12(inter_pred_output_12_L0),.inter_pred_output_13(inter_pred_output_13_L0),
	.inter_pred_output_20(inter_pred_output_20_L0),.inter_pred_output_21(inter_pred_output_21_L0),
	.inter_pred_output_22(inter_pred_output_22_L0),.inter_pred_output_23(inter_pred_output_23_L0),
	.inter_pred_output_30(inter_pred_output_30_L0),.inter_pred_output_31(inter_pred_output_31_L0),
	.inter_pred_output_32(inter_pred_output_32_L0),.inter_pred_output_33(inter_pred_output_33_L0)
);
wire data_valid_L1;
/*wire Inter_L1_end,data_valid_L1;
wire [19:0] frame_L1_luma_rd_addr;
wire [18:0] frame_L1_chroma_rd_addr;
wire [31:0] frame_L1_luma_RAM_dout,frame_L1_chroma_RAM_dout;
wire ref_L1_luma_RAM_rd,ref_L1_chroma_RAM_rd;
wire [7:0] inter_pred_output_00_L1,inter_pred_output_01_L1,inter_pred_output_02_L1,inter_pred_output_03_L1;
wire [7:0] inter_pred_output_10_L1,inter_pred_output_11_L1,inter_pred_output_12_L1,inter_pred_output_13_L1;
wire [7:0] inter_pred_output_20_L1,inter_pred_output_21_L1,inter_pred_output_22_L1,inter_pred_output_23_L1;
wire [7:0] inter_pred_output_30_L1,inter_pred_output_31_L1,inter_pred_output_32_L1,inter_pred_output_33_L1;*/



/*Inter_pred Inter_pred_L1(
	.clk(clk),.reset_n(reset_n),
	.residual_inter_state(residual_inter_state),.slice_data_state(slice_data_state),
	.intra4x4_pred_num(intra4x4_pred_num),.mb_type_general(mb_type_general),
	.mv_below8x8(mv_below8x8),.mv_is16x16(mv_is16x16),
	.enable(enable_L1),
	.mvx_CurrMb0(mvxL1_CurrMb0),.mvx_CurrMb1(mvxL1_CurrMb1),.mvx_CurrMb2(mvxL1_CurrMb2),.mvx_CurrMb3(mvxL1_CurrMb3),
	.mvy_CurrMb0(mvyL1_CurrMb0),.mvy_CurrMb1(mvyL1_CurrMb1),.mvy_CurrMb2(mvyL1_CurrMb2),.mvy_CurrMb3(mvyL1_CurrMb3),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),.data_valid(data_valid_L1),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.final_frame_luma_RAM_dout(frame_L1_luma_RAM_dout),.final_frame_chroma_RAM_dout(frame_L1_chroma_RAM_dout),
	.ref_frame_luma_RAM_rd(ref_L1_luma_RAM_rd),.ref_frame_chroma_RAM_rd(ref_L1_chroma_RAM_rd),
	.final_frame_luma_rd_addr(frame_L1_luma_rd_addr),.final_frame_chroma_rd_addr(frame_L1_chroma_rd_addr),
	.Inter_end(Inter_L1_end),
	.inter_pred_output_00(inter_pred_output_00_L1),.inter_pred_output_01(inter_pred_output_01_L1),
	.inter_pred_output_02(inter_pred_output_02_L1),.inter_pred_output_03(inter_pred_output_03_L1),
	.inter_pred_output_10(inter_pred_output_10_L1),.inter_pred_output_11(inter_pred_output_11_L1),
	.inter_pred_output_12(inter_pred_output_12_L1),.inter_pred_output_13(inter_pred_output_13_L1),
	.inter_pred_output_20(inter_pred_output_20_L1),.inter_pred_output_21(inter_pred_output_21_L1),
	.inter_pred_output_22(inter_pred_output_22_L1),.inter_pred_output_23(inter_pred_output_23_L1),
	.inter_pred_output_30(inter_pred_output_30_L1),.inter_pred_output_31(inter_pred_output_31_L1),
	.inter_pred_output_32(inter_pred_output_32_L1),.inter_pred_output_33(inter_pred_output_33_L1)
);*/



wire ao_valid_luma_L0,ao_valid_luma_L1,ao_valid_chroma_L0,ao_valid_chroma_L1;

wire [21:0] ref_luma_rd_addr_l0,ref_luma_rd_addr_l1;
wire [20:0] ref_chroma_rd_addr_l0,ref_chroma_rd_addr_l1;

Picidx_decoding Picidx_decoding(
	.clk(clk),.reset_n(reset_n),
	.nal_unit_type(nal_unit_type),.nal_ref_idc(nal_ref_idc),
	.slice_type(slice_type),
	.long_term_reference_flag(long_term_reference_flag),
	.adaptive_ref_pic_marking_mode_flag(adaptive_ref_pic_marking_mode_flag),
	.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.slice_header_state(slice_header_state),
	.slice_data_state(slice_data_state),
	.ref_pic_list_reordering_state(ref_pic_list_reordering_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.mb_type_general(mb_type_general),
	.frame_num(frame_num),.POC(POC),
	.direct_spatial_mv_pred_flag(direct_spatial_mv_pred_flag),
	.reordering_of_pic_nums_idc(reordering_of_pic_nums_idc),
	.reordering_of_pic_nums_idc_l1(reordering_of_pic_nums_idc_l1),
	.difference_of_pic_nums_minus1(difference_of_pic_nums_minus1),
	.long_term_pic_num(long_term_pic_num),.long_term_frame_idx(long_term_frame_idx),
	.memory_management_control_operation(memory_management_control_operation),
	.num_ref_idx_l0_active_minus1_curr(num_ref_idx_l0_active_minus1_curr),
	.num_ref_idx_l1_active_minus1_curr(num_ref_idx_l1_active_minus1_curr),
	.abs_diff_pic_num_minus1(abs_diff_pic_num_minus1),
	.long_term_pic_num_reordering(long_term_pic_num_reordering),
	.intra4x4_pred_num(intra4x4_pred_num),
	.refIdxL0_curr(refIdxL0_curr),.refIdxL1_curr(refIdxL1_curr),
	.predFlagL0_curr(predFlagL0_curr),.predFlagL1_curr(predFlagL1_curr),
	.luma_ram_w(luma_ram_w),.chroma_ram_w(chroma_ram_w),
	.ref_L0_luma_RAM_rd(ref_L0_luma_RAM_rd),.ref_L1_luma_RAM_rd(1'd0),
	.ref_L0_chroma_RAM_rd(ref_L0_chroma_RAM_rd),.ref_L1_chroma_RAM_rd(1'b0),
	.frame_L0_luma_rd_addr(frame_L0_luma_rd_addr),.frame_L1_luma_rd_addr(20'd0),
	.luma_ram_addr(luma_ram_addr),
	.frame_L0_chroma_rd_addr(frame_L0_chroma_rd_addr),.frame_L1_chroma_rd_addr(19'd0),
	.chroma_ram_addr(chroma_ram_addr),
	.refbuild_end(refbuild_end),
	.ao_valid_luma_L0(ao_valid_luma_L0),.ao_valid_luma_L1(ao_valid_luma_L1),
	.ao_valid_chroma_L0(ao_valid_chroma_L0),.ao_valid_chroma_L1(ao_valid_chroma_L1),
	.end_of_lastMB_DF(end_of_lastMB_DF),
	.td(td),.tb(tb),

	.cal_abs_diff_end(cal_abs_diff_end),.cal_long_term_end(cal_long_term_end),
	.data_valid_L0(data_valid_L0),.data_valid_L1(data_valid_L1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.ref_idx_l0_curr(ref_idx_l0_curr),.ref_idx_l1_curr(ref_idx_l1_curr),
	.ref_luma_wr_addr(ref_luma_wr_addr),
	.ref_luma_rd_addr_l0(ref_luma_rd_addr_l0),.ref_luma_rd_addr_l1(ref_luma_rd_addr_l1),
	.ref_chroma_wr_addr(ref_chroma_wr_addr),
	.ref_chroma_rd_addr_l0(ref_chroma_rd_addr_l0),.ref_chroma_rd_addr_l1(ref_chroma_rd_addr_l1) 
);



Inter_average Inter_average(
	.clk(clk),.reset_n(reset_n),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.residual_inter_state(residual_inter_state),
	.Inter_L0_end(Inter_L0_end),.Inter_L1_end(1'b1),
	.weighted_pred_en(weighted_pred_en),
	.logWD(logWD),
	.pred_weight_table_w0(pred_weight_table_w0),.pred_weight_table_w1(pred_weight_table_w1),
	.pred_weight_table_o0(pred_weight_table_o0),.pred_weight_table_o1(pred_weight_table_o1),

	.inter_pred_output_00_L0(inter_pred_output_00_L0),.inter_pred_output_01_L0(inter_pred_output_01_L0),
	.inter_pred_output_02_L0(inter_pred_output_02_L0),.inter_pred_output_03_L0(inter_pred_output_03_L0),
	.inter_pred_output_10_L0(inter_pred_output_10_L0),.inter_pred_output_11_L0(inter_pred_output_11_L0),
	.inter_pred_output_12_L0(inter_pred_output_12_L0),.inter_pred_output_13_L0(inter_pred_output_13_L0),
	.inter_pred_output_20_L0(inter_pred_output_20_L0),.inter_pred_output_21_L0(inter_pred_output_21_L0),
	.inter_pred_output_22_L0(inter_pred_output_22_L0),.inter_pred_output_23_L0(inter_pred_output_23_L0),
	.inter_pred_output_30_L0(inter_pred_output_30_L0),.inter_pred_output_31_L0(inter_pred_output_31_L0),
	.inter_pred_output_32_L0(inter_pred_output_32_L0),.inter_pred_output_33_L0(inter_pred_output_33_L0),

	.inter_pred_output_00_L1(8'b0),.inter_pred_output_01_L1(8'b0),
	.inter_pred_output_02_L1(8'b0),.inter_pred_output_03_L1(8'b0),
	.inter_pred_output_10_L1(8'b0),.inter_pred_output_11_L1(8'b0),
	.inter_pred_output_12_L1(8'b0),.inter_pred_output_13_L1(8'b0),
	.inter_pred_output_20_L1(8'b0),.inter_pred_output_21_L1(8'b0),
	.inter_pred_output_22_L1(8'b0),.inter_pred_output_23_L1(8'b0),
	.inter_pred_output_30_L1(8'b0),.inter_pred_output_31_L1(8'b0),
	.inter_pred_output_32_L1(8'b0),.inter_pred_output_33_L1(8'b0),

	.Inter_end(Inter_end),
	.inter_pred_output_00(inter_pred_output_00),.inter_pred_output_01(inter_pred_output_01),
	.inter_pred_output_02(inter_pred_output_02),.inter_pred_output_03(inter_pred_output_03),
	.inter_pred_output_10(inter_pred_output_10),.inter_pred_output_11(inter_pred_output_11),
	.inter_pred_output_12(inter_pred_output_12),.inter_pred_output_13(inter_pred_output_13),
	.inter_pred_output_20(inter_pred_output_20),.inter_pred_output_21(inter_pred_output_21),
	.inter_pred_output_22(inter_pred_output_22),.inter_pred_output_23(inter_pred_output_23),
	.inter_pred_output_30(inter_pred_output_30),.inter_pred_output_31(inter_pred_output_31),
	.inter_pred_output_32(inter_pred_output_32),.inter_pred_output_33(inter_pred_output_33)
);


pred_weigth_table pred_weigth_table(
	.clk(clk),.reset_n(reset_n),
	.BitStream_buffer_output(BitStream_buffer_output),
	.exp_golomb_decoding_output(exp_golomb_decoding_output),
	.pred_weight_table_state(pred_weight_table_state),
	.intra4x4_pred_num(intra4x4_pred_num),
	.ref_idx_l0_curr(ref_idx_l0_curr),.ref_idx_l1_curr(ref_idx_l1_curr),

	.luma_weight_l0_flag(luma_weight_l0_flag),.chroma_weight_l0_flag(chroma_weight_l0_flag),
	.luma_weight_l1_flag(luma_weight_l1_flag),.chroma_weight_l1_flag(chroma_weight_l1_flag),
	.logWD(logWD),
	.pred_weight_table_w0(pred_weight_table_w0),.pred_weight_table_w1(pred_weight_table_w1),
	.pred_weight_table_o0(pred_weight_table_o0),.pred_weight_table_o1(pred_weight_table_o1)
);

DF_decoder DF_decoder(
	.clk(clk),.reset_n(reset_n),
	.end_of_MB_DEC(end_of_MB_DEC),.end_of_BS_DEC(end_of_BS_DEC),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),.QPy(QPy),.QPc(QPc),

	.bs_V0(bs_V0),.bs_V1(bs_V1),.bs_V2(bs_V2),.bs_V3(bs_V3),
	.bs_H0(bs_H0),.bs_H1(bs_H1),.bs_H2(bs_H2),.bs_H3(bs_H3),

	.slice_alpha_c0_offset_div2(slice_alpha_c0_offset_div2),.slice_beta_offset_div2(slice_beta_offset_div2),
	.img_4x4_00(img_4x4_00[7:0]),.img_4x4_01(img_4x4_01[7:0]),.img_4x4_02(img_4x4_02[7:0]),.img_4x4_03(img_4x4_03[7:0]),
	.img_4x4_10(img_4x4_10[7:0]),.img_4x4_11(img_4x4_11[7:0]),.img_4x4_12(img_4x4_12[7:0]),.img_4x4_13(img_4x4_13[7:0]),
	.img_4x4_20(img_4x4_20[7:0]),.img_4x4_21(img_4x4_21[7:0]),.img_4x4_22(img_4x4_22[7:0]),.img_4x4_23(img_4x4_23[7:0]),
	.img_4x4_30(img_4x4_30[7:0]),.img_4x4_31(img_4x4_31[7:0]),.img_4x4_32(img_4x4_32[7:0]),.img_4x4_33(img_4x4_33[7:0]),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.residual_intra4x4_state(residual_intra4x4_state),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),

	.end_of_MB_DF(end_of_MB_DF),.end_of_lastMB_DF(end_of_lastMB_DF),
	.final_frame_RAM_wr(final_frame_RAM_wr),
	.final_frame_RAM_addr(final_frame_RAM_addr),.final_frame_RAM_din(final_frame_RAM_din),
	.luma_ram_w(luma_ram_w),.chroma_ram_w(chroma_ram_w),
	.luma_ram_addr(luma_ram_addr),.chroma_ram_addr(chroma_ram_addr)
);

bs_decoder bs_decoder(
	.clk(clk),.reset_n(reset_n),
	.end_of_MB_DEC(end_of_MB_DEC),.end_of_mb_sum(end_of_mb_sum),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.disable_DF(disable_DF),
	.slice_data_state(slice_data_state),.mb_type_general(mb_type_general),
	.Is_skipMB_mv_calc(Is_skipMB_mv_calc),
	.residual_inter_state(residual_inter_state),.intra4x4_pred_num(intra4x4_pred_num),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.mvxL0_mbAddrA(mvxL0_mbAddrA),.mvyL0_mbAddrA(mvyL0_mbAddrA),
	.mvxL1_mbAddrA(mvxL1_mbAddrA),.mvyL1_mbAddrA(mvyL1_mbAddrA),
	.mvxL0_mbAddrB_dout(mvxL0_mbAddrB_dout),.mvyL0_mbAddrB_dout(mvyL0_mbAddrB_dout),
	.mvxL1_mbAddrB_dout(mvxL1_mbAddrB_dout),.mvyL1_mbAddrB_dout(mvyL1_mbAddrB_dout),
	.mvxL0_CurrMb0(mvxL0_CurrMb0),.mvxL0_CurrMb1(mvxL0_CurrMb1),.mvxL0_CurrMb2(mvxL0_CurrMb2),.mvxL0_CurrMb3(mvxL0_CurrMb3),
	.mvyL0_CurrMb0(mvyL0_CurrMb0),.mvyL0_CurrMb1(mvyL0_CurrMb1),.mvyL0_CurrMb2(mvyL0_CurrMb2),.mvyL0_CurrMb3(mvyL0_CurrMb3),
	.mvxL1_CurrMb0(mvxL1_CurrMb0),.mvxL1_CurrMb1(mvxL1_CurrMb1),.mvxL1_CurrMb2(mvxL1_CurrMb2),.mvxL1_CurrMb3(mvxL1_CurrMb3),
	.mvyL1_CurrMb0(mvyL1_CurrMb0),.mvyL1_CurrMb1(mvyL1_CurrMb1),.mvyL1_CurrMb2(mvyL1_CurrMb2),.mvyL1_CurrMb3(mvyL1_CurrMb3),
	.res_0(res_0),.TotalCoeff(TotalCoeff),
	.refIdxL0_curr(refIdxL0_curr),.refIdxL1_curr(refIdxL1_curr),
	.predFlagL0_curr(predFlagL0_curr),.predFlagL1_curr(predFlagL1_curr),
	.refIdxL0_addrA(refIdxL0_addrA),.refIdxL1_addrA(refIdxL1_addrA),
	.predFlagL0_addrA(predFlagL0_addrA),.predFlagL1_addrA(predFlagL1_addrA),
	.refIdxL0_addrB_dout(refIdxL0_addrB_dout),.refIdxL1_addrB_dout(refIdxL1_addrB_dout),
	.predFlagL0_addrB_dout(predFlagL0_addrB_dout),.predFlagL1_addrB_dout(predFlagL1_addrB_dout),

	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),

	.end_of_BS_DEC(end_of_BS_DEC),.mv_mbAddrB_rd_for_DF(mv_mbAddrB_rd_for_DF),.ref_idx_rd_for_DF(ref_idx_rd_for_DF),
	.bs_V0(bs_V0),.bs_V1(bs_V1),.bs_V2(bs_V2),.bs_V3(bs_V3),
	.bs_H0(bs_H0),.bs_H1(bs_H1),.bs_H2(bs_H2),.bs_H3(bs_H3)
);



BitStream_parser_FSM BitStream_parser_FSM(
	.clk(clk),.reset_n(reset_n),
	.start_code_prefix_found(start_code_prefix_found),
	.nal_unit_type(nal_unit_type),.nal_ref_idc(nal_ref_idc),
	.pc_2to0(pc[2:0]),.pc_6to3(pc[6:3]),.removed_03(removed_03),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.slice_type(slice_type),.weighted_pred_flag(weighted_pred_flag),
	.weighted_bipred_idc(weighted_bipred_idc),
	.num_ref_idx_active_override_flag(num_ref_idx_active_override_flag),
	.deblocking_filter_control_present_flag(deblocking_filter_control_present_flag),
	.entropy_coding_mode_flag(entropy_coding_mode_flag),
	.num_ref_frames_in_pic_order_cnt_cycle(num_ref_frames_in_pic_order_cnt_cycle),
	.mb_type_general(mb_type_general),.POC_end(POC_end),
	.NumMbPart(NumMbPart),.pic_order_cnt_type(pic_order_cnt_type),
	.disable_deblocking_filter_idc(disable_deblocking_filter_idc),
	.adaptive_ref_pic_marking_mode_flag(adaptive_ref_pic_marking_mode_flag),
	.delta_pic_order_always_zero_flag(delta_pic_order_always_zero_flag),
	.memory_management_control_operation(memory_management_control_operation),
	.prev_intra4x4_pred_mode_flag(prev_intra4x4_pred_mode_flag),
	.CodedBlockPatternLuma(CodedBlockPatternLuma),.CodedBlockPatternChroma(CodedBlockPatternChroma),
	.TotalCoeff(TotalCoeff),.TrailingOnes(TrailingOnes),
	.zerosLeft(zerosLeft),.run(run),.end_of_MB_DF(end_of_MB_DF),
	.idct_end(idct_end),.Inter_end(Inter_end),.end_of_lastMB_DF(end_of_lastMB_DF),
	.mb_num(mb_num),.num_ref_frames_in_pic_order_cnt_cycle_i(num_ref_frames_in_pic_order_cnt_cycle_i),
	.intra4x4_read_end(intra4x4_read_end),.intra16_read_end(intra16_read_end),
	.cavlc_nc_end(cavlc_nc_end),.refbuild_end(refbuild_end),.b_col_end(b_col_end),
	.end_of_one_residual_block(end_of_one_residual_block),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.ref_pic_list_reordering_flag_l0(ref_pic_list_reordering_flag_l0),
	.ref_pic_list_reordering_flag_l1(ref_pic_list_reordering_flag_l1),
	.num_ref_idx_l0_active_minus1_curr(num_ref_idx_l0_active_minus1_curr),
	.num_ref_idx_l1_active_minus1_curr(num_ref_idx_l1_active_minus1_curr),
	.luma_weight_l0_flag(luma_weight_l0_flag),.chroma_weight_l0_flag(chroma_weight_l0_flag),
	.luma_weight_l1_flag(luma_weight_l1_flag),.chroma_weight_l1_flag(chroma_weight_l1_flag),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),
	.reordering_of_pic_nums_idc(reordering_of_pic_nums_idc),
	.mb_skip_run(mb_skip_run),
	.cal_abs_diff_end(cal_abs_diff_end),.cal_long_term_end(cal_long_term_end),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.heading_one_en(heading_one_en),
	.slice_header_state(slice_header_state),
	.ref_pic_list_reordering_state(ref_pic_list_reordering_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.slice_header_s6(slice_header_s6),
	.slice_data_state(slice_data_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.pred_weight_table_state(pred_weight_table_state),
	.luma4x4BlkIdx(luma4x4BlkIdx),
	.mb_num_h(mb_num_h),.mb_num_v(mb_num_v),
	.mb_num_h_pred(mb_num_h_pred),.mb_num_v_pred(mb_num_v_pred),
	.cavlc_decoder_state(cavlc_decoder_state),
	.residual_intra4x4_state(residual_intra4x4_state),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.intra4x4_pred_num(intra4x4_pred_num),
	.intra16_pred_num(intra16_pred_num),
	.i_level(i_level),.i_run(i_run),.i_TotalCoeff(i_TotalCoeff),
	.coeffNum(coeffNum),.weighted_pred_en(weighted_pred_en),
	.suffix_length_initialized(suffix_length_initialized),
	.res_0(res_0),.end_of_MB_DEC(end_of_MB_DEC),.end_of_mb_sum(end_of_mb_sum),
	.IsRunLoop(IsRunLoop),.p_skip_end(p_skip_end),.residual_end(residual_end),
	.mbPartIdx(mbPartIdx),.subMbPartIdx(subMbPartIdx),.compIdx(compIdx),
	.NumSubMbPart(NumSubMbPart),
	.Is_skip_run_entry(Is_skip_run_entry),.Is_skip_run_end(Is_skip_run_end),
	.reordering_of_pic_nums_idc_l1(reordering_of_pic_nums_idc_l1)
	); 

intra4x4_rw intra4x4_rw(
	.clk(clk),.reset_n(reset_n),
	.img_4x4_00(img_4x4_00[7:0]),.img_4x4_01(img_4x4_01[7:0]),.img_4x4_02(img_4x4_02[7:0]),.img_4x4_03(img_4x4_03[7:0]),
	.img_4x4_10(img_4x4_10[7:0]),.img_4x4_11(img_4x4_11[7:0]),.img_4x4_12(img_4x4_12[7:0]),.img_4x4_13(img_4x4_13[7:0]),
	.img_4x4_20(img_4x4_20[7:0]),.img_4x4_21(img_4x4_21[7:0]),.img_4x4_22(img_4x4_22[7:0]),.img_4x4_23(img_4x4_23[7:0]),
	.img_4x4_30(img_4x4_30[7:0]),.img_4x4_31(img_4x4_31[7:0]),.img_4x4_32(img_4x4_32[7:0]),.img_4x4_33(img_4x4_33[7:0]),
	.res_0(res_0),.Intra16x16_predmode(Intra16x16_predmode),.intra_chroma_pred_mode(intra_chroma_pred_mode),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.residual_intra4x4_state(residual_intra4x4_state),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.intra4x4_dout(intra4x4_dout),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.TotalCoeff(TotalCoeff),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.intra4x4_cs_n(intra4x4_cs_n),.intra4x4_wr_n(intra4x4_wr_n),
	.intra4x4_rd_addr(intra4x4_rd_addr),.intra4x4_wr_addr(intra4x4_wr_addr),
	.intra4x4_din(intra4x4_din),
	.intra4x4_read_end(intra4x4_read_end),.intra16_read_end(intra16_read_end),
	.nrblock_a(nrblock_a),.nrblock_b(nrblock_b),.nrblock_c(nrblock_c),
	.nrblock_d(nrblock_d),.nrblock_e(nrblock_e),.nrblock_f(nrblock_f),
	.nrblock_g(nrblock_g),.nrblock_h(nrblock_h),.nrblock_i(nrblock_i),
	.nrblock_j(nrblock_j),.nrblock_k(nrblock_k),.nrblock_l(nrblock_l),.nrblock_m(nrblock_m),
	.nrblock16_0(nrblock16_0),.nrblock16_1(nrblock16_1),.nrblock16_2(nrblock16_2),.nrblock16_3(nrblock16_3),
	.nrblockpl_0(nrblockpl_0),.nrblockpl_1(nrblockpl_1),.nrblockpl_2(nrblockpl_2),.nrblockpl_3(nrblockpl_3),
	.state16(state16),.state_chromapl(state_chromapl),
	.currMB_availA(currMB_availA),.currMB_availB(currMB_availB),
	.TC_cs_n(TC_cs_n),.TC_wr_n(TC_wr_n),.TC_wr_addr(TC_wr_addr),.TC_din(TC_din)
	);    
 

Intra4x4_PredMode_decoding Intra4x4_PredMode_decoding(
 	.clk(clk),.reset_n(reset_n),
	.mb_pred_state(mb_pred_state),
	.luma4x4BlkIdx(luma4x4BlkIdx),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),
	.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.rem_intra4x4_pred_mode(rem_intra4x4_pred_mode),
	.prev_intra4x4_pred_mode_flag(prev_intra4x4_pred_mode_flag),
	.Intra4x4PredMode_mbAddrB_dout(Intra4x4PredMode_mbAddrB_dout),	
	.Intra4x4PredMode_CurrMb(Intra4x4PredMode_CurrMb),
	.Intra4x4PredMode_mbAddrB_cs_n(Intra4x4PredMode_mbAddrB_cs_n),
	.Intra4x4PredMode_mbAddrB_wr_n(Intra4x4PredMode_mbAddrB_wr_n),
	.Intra4x4PredMode_mbAddrB_rd_addr(Intra4x4PredMode_mbAddrB_rd_addr),
	.Intra4x4PredMode_mbAddrB_wr_addr(Intra4x4PredMode_mbAddrB_wr_addr),
	.Intra4x4PredMode_mbAddrB_din(Intra4x4PredMode_mbAddrB_din)
	);

intra_pred_4x4_normal intra_pred_4x4_normal(
	.clk(clk),.reset_n(reset_n),
	.Intra4x4PredMode_CurrMb(Intra4x4PredMode_CurrMb),
	.residual_intra4x4_state(residual_intra4x4_state),
	.intra4x4_pred_num(intra4x4_pred_num),
	.intra16_pred_num(intra16_pred_num),
	.residual_intra16_state(residual_intra16_state),
	.nrblock_a({8'b0,nrblock_a}),.nrblock_b({8'b0,nrblock_b}),.nrblock_c({8'b0,nrblock_c}),
	.nrblock_d({8'b0,nrblock_d}),.nrblock_e({8'b0,nrblock_e}),.nrblock_f({8'b0,nrblock_f}),
	.nrblock_g({8'b0,nrblock_g}),.nrblock_h({8'b0,nrblock_h}),.nrblock_i({8'b0,nrblock_i}),
	.nrblock_j({8'b0,nrblock_j}),.nrblock_k({8'b0,nrblock_k}),.nrblock_l({8'b0,nrblock_l}),.nrblock_m({8'b0,nrblock_m}),
	.nrblockpl_0({8'b0,nrblockpl_0}),.nrblockpl_1({8'b0,nrblockpl_1}),.nrblockpl_2({8'b0,nrblockpl_2}),.nrblockpl_3({8'b0,nrblockpl_3}),
	.currMB_availA(currMB_availA),.currMB_availB(currMB_availB),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.intra_chroma_pred_mode(intra_chroma_pred_mode),.state_chromapl(state_chromapl),
	.intra_pred_4x4_00(intra_pred_4x4_00),.intra_pred_4x4_01(intra_pred_4x4_01),
	.intra_pred_4x4_02(intra_pred_4x4_02),.intra_pred_4x4_03(intra_pred_4x4_03),
	.intra_pred_4x4_10(intra_pred_4x4_10),.intra_pred_4x4_11(intra_pred_4x4_11),
	.intra_pred_4x4_12(intra_pred_4x4_12),.intra_pred_4x4_13(intra_pred_4x4_13),
	.intra_pred_4x4_20(intra_pred_4x4_20),.intra_pred_4x4_21(intra_pred_4x4_21),
	.intra_pred_4x4_22(intra_pred_4x4_22),.intra_pred_4x4_23(intra_pred_4x4_23),
	.intra_pred_4x4_30(intra_pred_4x4_30),.intra_pred_4x4_31(intra_pred_4x4_31),
	.intra_pred_4x4_32(intra_pred_4x4_32),.intra_pred_4x4_33(intra_pred_4x4_33)
	);

cavlc_decoder cavlc_decoder(	
  	.clk(clk),.reset_n(reset_n),
	.cavlc_decoder_state(cavlc_decoder_state),
	.i_level(i_level),.i_run(i_run),
	.i_TotalCoeff(i_TotalCoeff),
	.coeffNum(coeffNum),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.suffix_length_initialized(suffix_length_initialized),
	.IsRunLoop(IsRunLoop),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.TC_dout(TC_dout),
	.currMB_availA(currMB_availA),.currMB_availB(currMB_availB),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.residual_intra4x4_state(residual_intra4x4_state),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.end_of_one_residual_block(end_of_one_residual_block),
	.end_of_NonZeroCoeff_CAVLC(end_of_NonZeroCoeff_CAVLC),
	.cavlc_consumed_bits_len(cavlc_consumed_bits_len),
	.TotalCoeff(TotalCoeff),.TrailingOnes(TrailingOnes),.zerosLeft(zerosLeft),.run(run),
 	.coeffLevel_0(coeffLevel_0),.coeffLevel_1(coeffLevel_1),
 	.coeffLevel_2(coeffLevel_2),.coeffLevel_3(coeffLevel_3), 
	.coeffLevel_4(coeffLevel_4),.coeffLevel_5(coeffLevel_5),
	.coeffLevel_6(coeffLevel_6),.coeffLevel_7(coeffLevel_7),
	.coeffLevel_8(coeffLevel_8),.coeffLevel_9(coeffLevel_9),
	.coeffLevel_10(coeffLevel_10),.coeffLevel_11(coeffLevel_11),
	.coeffLevel_12(coeffLevel_12),.coeffLevel_13(coeffLevel_13),
	.coeffLevel_14(coeffLevel_14),.coeffLevel_15(coeffLevel_15),
	.TC_rd_addr(TC_rd_addr),
  	.cavlc_nc_end(cavlc_nc_end)
	);

IDCT_4 IDCT_4(
	.clk(clk),.reset_n(reset_n),
 	.coeffLevel_0(coeffLevel_0),.coeffLevel_1(coeffLevel_1),
 	.coeffLevel_2(coeffLevel_2),.coeffLevel_3(coeffLevel_3), 
	.coeffLevel_4(coeffLevel_4),.coeffLevel_5(coeffLevel_5),
	.coeffLevel_6(coeffLevel_6),.coeffLevel_7(coeffLevel_7),
	.coeffLevel_8(coeffLevel_8),.coeffLevel_9(coeffLevel_9),
	.coeffLevel_10(coeffLevel_10),.coeffLevel_11(coeffLevel_11),
	.coeffLevel_12(coeffLevel_12),.coeffLevel_13(coeffLevel_13),
	.coeffLevel_14(coeffLevel_14),.coeffLevel_15(coeffLevel_15),
	.QPy(QPy),.QPc(QPc),
 	.intra4x4_pred_num(intra4x4_pred_num),
	.residual_intra4x4_state(residual_intra4x4_state),
	.intra16_pred_num(intra16_pred_num),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.twod_output_00(twod_output_00),.twod_output_01(twod_output_01),
	.twod_output_02(twod_output_02),.twod_output_03(twod_output_03),
	.twod_output_10(twod_output_10),.twod_output_11(twod_output_11),
	.twod_output_12(twod_output_12),.twod_output_13(twod_output_13),
	.twod_output_20(twod_output_20),.twod_output_21(twod_output_21),
	.twod_output_22(twod_output_22),.twod_output_23(twod_output_23),
	.twod_output_30(twod_output_30),.twod_output_31(twod_output_31),
	.twod_output_32(twod_output_32),.twod_output_33(twod_output_33),
	.idct_end(idct_end)
	);

sample_reconstruct sample_reconstruct(
	.clk(clk),.reset_n(reset_n),
	.mb_type_general(mb_type_general),
	.intra_pred_4x4_00(intra_pred_4x4_00),.intra_pred_4x4_01(intra_pred_4x4_01),
	.intra_pred_4x4_02(intra_pred_4x4_02),.intra_pred_4x4_03(intra_pred_4x4_03),
	.intra_pred_4x4_10(intra_pred_4x4_10),.intra_pred_4x4_11(intra_pred_4x4_11),
	.intra_pred_4x4_12(intra_pred_4x4_12),.intra_pred_4x4_13(intra_pred_4x4_13),
	.intra_pred_4x4_20(intra_pred_4x4_20),.intra_pred_4x4_21(intra_pred_4x4_21),
	.intra_pred_4x4_22(intra_pred_4x4_22),.intra_pred_4x4_23(intra_pred_4x4_23),
	.intra_pred_4x4_30(intra_pred_4x4_30),.intra_pred_4x4_31(intra_pred_4x4_31),
	.intra_pred_4x4_32(intra_pred_4x4_32),.intra_pred_4x4_33(intra_pred_4x4_33),
	.intra_pred_16_00(intra_pred_16_00),.intra_pred_16_01(intra_pred_16_01),
	.intra_pred_16_02(intra_pred_16_02),.intra_pred_16_03(intra_pred_16_03),
	.intra_pred_16_10(intra_pred_16_10),.intra_pred_16_11(intra_pred_16_11),
	.intra_pred_16_12(intra_pred_16_12),.intra_pred_16_13(intra_pred_16_13),
	.intra_pred_16_20(intra_pred_16_20),.intra_pred_16_21(intra_pred_16_21),
	.intra_pred_16_22(intra_pred_16_22),.intra_pred_16_23(intra_pred_16_23),
	.intra_pred_16_30(intra_pred_16_30),.intra_pred_16_31(intra_pred_16_31),
	.intra_pred_16_32(intra_pred_16_32),.intra_pred_16_33(intra_pred_16_33),
	.inter_pred_output_00({8'b0,inter_pred_output_00}),.inter_pred_output_01({8'b0,inter_pred_output_01}),
	.inter_pred_output_02({8'b0,inter_pred_output_02}),.inter_pred_output_03({8'b0,inter_pred_output_03}),
	.inter_pred_output_10({8'b0,inter_pred_output_10}),.inter_pred_output_11({8'b0,inter_pred_output_11}),
	.inter_pred_output_12({8'b0,inter_pred_output_12}),.inter_pred_output_13({8'b0,inter_pred_output_13}),
	.inter_pred_output_20({8'b0,inter_pred_output_20}),.inter_pred_output_21({8'b0,inter_pred_output_21}),
	.inter_pred_output_22({8'b0,inter_pred_output_22}),.inter_pred_output_23({8'b0,inter_pred_output_23}),
	.inter_pred_output_30({8'b0,inter_pred_output_30}),.inter_pred_output_31({8'b0,inter_pred_output_31}),
	.inter_pred_output_32({8'b0,inter_pred_output_32}),.inter_pred_output_33({8'b0,inter_pred_output_33}),
	.intra4x4_pred_num(intra4x4_pred_num),.intra16_pred_num(intra16_pred_num),
	.twod_output_00(twod_output_00),.twod_output_01(twod_output_01),
	.twod_output_02(twod_output_02),.twod_output_03(twod_output_03),
	.twod_output_10(twod_output_10),.twod_output_11(twod_output_11),
	.twod_output_12(twod_output_12),.twod_output_13(twod_output_13),
	.twod_output_20(twod_output_20),.twod_output_21(twod_output_21),
	.twod_output_22(twod_output_22),.twod_output_23(twod_output_23),
	.twod_output_30(twod_output_30),.twod_output_31(twod_output_31),
	.twod_output_32(twod_output_32),.twod_output_33(twod_output_33),
	.residual_intra4x4_state(residual_intra4x4_state),
	.residual_intra16_state(residual_intra16_state),.residual_inter_state(residual_inter_state),
	.img_4x4_00(img_4x4_00),.img_4x4_01(img_4x4_01),.img_4x4_02(img_4x4_02),.img_4x4_03(img_4x4_03),
	.img_4x4_10(img_4x4_10),.img_4x4_11(img_4x4_11),.img_4x4_12(img_4x4_12),.img_4x4_13(img_4x4_13),
	.img_4x4_20(img_4x4_20),.img_4x4_21(img_4x4_21),.img_4x4_22(img_4x4_22),.img_4x4_23(img_4x4_23),
	.img_4x4_30(img_4x4_30),.img_4x4_31(img_4x4_31),.img_4x4_32(img_4x4_32),.img_4x4_33(img_4x4_33)
	);

syntax_decoding syntax_decoding(
	.clk(clk),.reset_n(reset_n),
	.BitStream_buffer_output(BitStream_buffer_output),
	.exp_golomb_decoding_output(exp_golomb_decoding_output),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.ref_pic_list_reordering_state(ref_pic_list_reordering_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.pin_disable_DF(1'b0),.intra4x4_pred_num(intra4x4_pred_num),
	.slice_data_state(slice_data_state),
	.mb_pred_state(mb_pred_state),.sub_mb_pred_state(sub_mb_pred_state),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.num_ref_frames_in_pic_order_cnt_cycle_i(num_ref_frames_in_pic_order_cnt_cycle_i),
	.dependent_variable_decoding_output(dependent_variable_decoding_output),
	.slice_header_state(slice_header_state),
	.p_skip_end(p_skip_end),.residual_end(residual_end),
	.start_code_prefix_found(start_code_prefix_found),
	.forbidden_zero_bit(forbidden_zero_bit),
	.nal_ref_idc(nal_ref_idc),.pic_order_cnt_type(pic_order_cnt_type),
	.nal_unit_type(nal_unit_type),
	.num_ref_idx_l0_active_minus1_curr(num_ref_idx_l0_active_minus1_curr),
	.num_ref_idx_l1_active_minus1_curr(num_ref_idx_l1_active_minus1_curr),
	.slice_type(slice_type),.weighted_pred_flag(weighted_pred_flag),
	.entropy_coding_mode_flag(entropy_coding_mode_flag),
	.num_ref_idx_active_override_flag(num_ref_idx_active_override_flag),
	.deblocking_filter_control_present_flag(deblocking_filter_control_present_flag),
	.disable_deblocking_filter_idc(disable_deblocking_filter_idc),
	.pic_init_qp_minus26(pic_init_qp_minus26),
	.chroma_qp_index_offset(chroma_qp_index_offset),
	.disable_DF(disable_DF),.weighted_bipred_idc(weighted_bipred_idc),
	.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.log2_max_pic_order_cnt_lsb_minus4(log2_max_pic_order_cnt_lsb_minus4),
	.num_ref_frames_in_pic_order_cnt_cycle(num_ref_frames_in_pic_order_cnt_cycle),
	.offset_for_ref_frame(offset_for_ref_frame),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.adaptive_ref_pic_marking_mode_flag(adaptive_ref_pic_marking_mode_flag),
	.memory_management_control_operation(memory_management_control_operation),
	.memory_management_control_operation_5(memory_management_control_operation_5),
	.pic_order_cnt_lsb(pic_order_cnt_lsb),
	.mb_type_general(mb_type_general),
	.NumMbPart(NumMbPart),.NumSubMbPart(NumSubMbPart),
	.mbPartIdx(mbPartIdx),.delta_pic_order_always_zero_flag(delta_pic_order_always_zero_flag),
	.prev_intra4x4_pred_mode_flag(prev_intra4x4_pred_mode_flag),
	.mb_type(mb_type),.long_term_reference_flag(long_term_reference_flag),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),.MBTypeGen_mbAddrC(MBTypeGen_mbAddrC),
	.rem_intra4x4_pred_mode(rem_intra4x4_pred_mode),
	.Intra16x16_predmode(Intra16x16_predmode),
	.intra_chroma_pred_mode(intra_chroma_pred_mode),
	.slice_alpha_c0_offset_div2(slice_alpha_c0_offset_div2),.slice_beta_offset_div2(slice_beta_offset_div2),
	.pic_width_in_mbs_minus1(pic_width_in_mbs_minus1),.pic_height_in_map_units_minus1(pic_height_in_map_units_minus1),
	.ref_pic_list_reordering_flag_l0(ref_pic_list_reordering_flag_l0),
	.ref_pic_list_reordering_flag_l1(ref_pic_list_reordering_flag_l1),
	.reordering_of_pic_nums_idc(reordering_of_pic_nums_idc),
	.mb_skip_run(mb_skip_run),
	.frame_num(frame_num),
	.mvd(mvd),.ref_idx_l0(ref_idx_l0),.ref_idx_l1(ref_idx_l1),
	.sub_mb_type(sub_mb_type),.mv_below8x8(mv_below8x8),
	.MBTypeGen_mbAddrD(MBTypeGen_mbAddrD),
	.delta_pic_order_cnt(delta_pic_order_cnt),.offset_for_non_ref_pic(offset_for_non_ref_pic),
	.offset_for_ref_frame_wr_n(offset_for_ref_frame_wr_n),
	.offset_for_ref_frame_wr_addr(offset_for_ref_frame_wr_addr),
	.offset_for_ref_frame_din(offset_for_ref_frame_din),
	.direct_spatial_mv_pred_flag(direct_spatial_mv_pred_flag),
	.SubMbPredMode(SubMbPredMode),
	.B_MbPartPredMode_0(B_MbPartPredMode_0),.B_MbPartPredMode_1(B_MbPartPredMode_1),
	.sub_ref_idx_l0_en(sub_ref_idx_l0_en),.sub_ref_idx_l1_en(sub_ref_idx_l1_en),
	.ref_idx_l0_en(ref_idx_l0_en),.ref_idx_l1_en(ref_idx_l1_en),
	.sub_mvd_l0_en(sub_mvd_l0_en),.sub_mvd_l1_en(sub_mvd_l1_en),.mvd_l0_en(mvd_l0_en),.mvd_l1_en(mvd_l1_en),
	.abs_diff_pic_num_minus1(abs_diff_pic_num_minus1),
	.difference_of_pic_nums_minus1(difference_of_pic_nums_minus1),
	.long_term_pic_num_reordering(long_term_pic_num_reordering),
	.long_term_pic_num(long_term_pic_num),.long_term_frame_idx(long_term_frame_idx)
	);




intra_pred_16 intra_pred_16(
	.clk(clk),.reset_n(reset_n),
	.Intra16x16_predmode(Intra16x16_predmode),
	.state16(state16),
	.nrblock16_0({8'b0,nrblock16_0}),.nrblock16_1({8'b0,nrblock16_1}),.nrblock16_2({8'b0,nrblock16_2}),.nrblock16_3({8'b0,nrblock16_3}),
	.intra16_pred_num(intra16_pred_num),
	.residual_intra16_state(residual_intra16_state),
	.mb_num_h(mb_num_h_pred),.mb_num_v(mb_num_v_pred),
	.constrained_intra_pred_flag(constrained_intra_pred_flag),
	.MBTypeGen_mbAddrA(MBTypeGen_mbAddrA),.MBTypeGen_mbAddrB(MBTypeGen_mbAddrB),
	.intra_pred_16_00(intra_pred_16_00),.intra_pred_16_01(intra_pred_16_01),
	.intra_pred_16_02(intra_pred_16_02),.intra_pred_16_03(intra_pred_16_03),
	.intra_pred_16_10(intra_pred_16_10),.intra_pred_16_11(intra_pred_16_11),
	.intra_pred_16_12(intra_pred_16_12),.intra_pred_16_13(intra_pred_16_13),
	.intra_pred_16_20(intra_pred_16_20),.intra_pred_16_21(intra_pred_16_21),
	.intra_pred_16_22(intra_pred_16_22),.intra_pred_16_23(intra_pred_16_23),
	.intra_pred_16_30(intra_pred_16_30),.intra_pred_16_31(intra_pred_16_31),
	.intra_pred_16_32(intra_pred_16_32),.intra_pred_16_33(intra_pred_16_33)
);

pc_decoding pc_decoding(
	.clk(clk),.reset_n(reset_n),
	.parser_state(parser_state),.nal_unit_state(nal_unit_state),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.exp_golomb_len(exp_golomb_len),
	.slice_header_state(slice_header_state),
	.pred_weight_table_state(pred_weight_table_state),
 	.ref_pic_list_reordering_state(ref_pic_list_reordering_state),.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.slice_data_state(slice_data_state),.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),.start_code_prefix_found(start_code_prefix_found),
	.sub_ref_idx_l0_en(sub_ref_idx_l0_en),.sub_ref_idx_l1_en(sub_ref_idx_l1_en),
	.ref_idx_l0_en(ref_idx_l0_en),.ref_idx_l1_en(ref_idx_l1_en),
	.sub_mvd_l0_en(sub_mvd_l0_en),.sub_mvd_l1_en(sub_mvd_l1_en),.mvd_l0_en(mvd_l0_en),.mvd_l1_en(mvd_l1_en),
	.cavlc_consumed_bits_len(cavlc_consumed_bits_len),
	.dependent_variable_len(dependent_variable_len),
	.pc(pc)
	);
	
exp_golomb_decoding exp_golomb_decoding(	
	.reset_n(reset_n),
	.heading_one_pos(heading_one_pos),
	.BitStream_buffer_output(BitStream_buffer_output),
	.BitStream_buffer_output_ex32(BitStream_buffer_output_ex32),
	.num_ref_idx_l0_active_minus1_curr(num_ref_idx_l0_active_minus1_curr),
	.num_ref_idx_l1_active_minus1_curr(num_ref_idx_l1_active_minus1_curr),
	.seq_parameter_set_state(seq_parameter_set_state),.pic_parameter_set_state(pic_parameter_set_state),
	.slice_header_state(slice_header_state),.slice_data_state(slice_data_state),
	.ref_pic_list_reordering_state(ref_pic_list_reordering_state),
	.dec_ref_pic_marking_state(dec_ref_pic_marking_state),
	.pred_weight_table_state(pred_weight_table_state),
	.sub_mb_pred_state(sub_mb_pred_state),
	.mb_pred_state(mb_pred_state),
	.exp_golomb_decoding_output(exp_golomb_decoding_output),
	.exp_golomb_len(exp_golomb_len)
	);
	
heading_one_detector heading_one_detector (
	.heading_one_en(heading_one_en),
	.BitStream_buffer_output(BitStream_buffer_output),
	.heading_one_pos(heading_one_pos)
	); 


dependent_variable_decoding dependent_variable_decoding(
	.slice_header_state(slice_header_state),
	.log2_max_frame_num_minus4(log2_max_frame_num_minus4),
	.log2_max_pic_order_cnt_lsb_minus4(log2_max_pic_order_cnt_lsb_minus4),
	.BitStream_buffer_output(BitStream_buffer_output),
	.dependent_variable_len(dependent_variable_len),
	.dependent_variable_decoding_output(dependent_variable_decoding_output)
	);
	
QP_decoding QP_decoding( 
	.clk(clk),.reset_n(reset_n),
	.slice_header_state(slice_header_state),
	.slice_data_state(slice_data_state),
	.pic_init_qp_minus26(pic_init_qp_minus26),
	.exp_golomb_decoding_output_5to0(exp_golomb_decoding_output[5:0]),
	.chroma_qp_index_offset(chroma_qp_index_offset),
	.QPy(QPy),.QPc(QPc)
	);
	
CodedBlockPattern_decoding CodedBlockPattern_decoding(
	.clk(clk),.reset_n(reset_n),
	.slice_data_state(slice_data_state),
	.slice_type(slice_type),.mb_type(mb_type),
	.mb_type_general(mb_type_general),
	.exp_golomb_decoding_output_5to0(exp_golomb_decoding_output[5:0]),
	.CodedBlockPatternLuma(CodedBlockPatternLuma),.CodedBlockPatternChroma(CodedBlockPatternChroma)
	);


ram_Synch # (11,8)
	 ram_offset_for_ref_frame(
	.clk(clk),.rst_n(reset_n),
	.rd_n(offset_for_ref_frame_rd_n),.wr_n(offset_for_ref_frame_wr_n), 
	.rd_addr(offset_for_ref_frame_rd_addr),.wr_addr(offset_for_ref_frame_wr_addr),
	.data_in(offset_for_ref_frame_din),.data_out(offset_for_ref_frame_i)
	); 



ram # (`Intra4x4_PredMode_RF_data_width,8)
	 ram_Intra4x4_PredMode(
	.clk(clk),.reset_n(reset_n),
	.cs_n(Intra4x4PredMode_mbAddrB_cs_n),.wr_n(Intra4x4PredMode_mbAddrB_wr_n), 
	.rd_addr(Intra4x4PredMode_mbAddrB_rd_addr),.wr_addr(Intra4x4PredMode_mbAddrB_wr_addr),
	.data_in(Intra4x4PredMode_mbAddrB_din),.data_out(Intra4x4PredMode_mbAddrB_dout)
	);

ram # (5,13)
	 ram_TC(
	.clk(clk),.reset_n(reset_n),
	.cs_n(TC_cs_n),.wr_n(TC_wr_n), 
	.rd_addr(TC_rd_addr),.wr_addr(TC_wr_addr),
	.data_in(TC_din),.data_out(TC_dout)
	); 
ram # (56,13)
	 ram_intra4x4(
	.clk(clk),.reset_n(reset_n),
	.cs_n(intra4x4_cs_n),.wr_n(intra4x4_wr_n),
	.rd_addr(intra4x4_rd_addr),.wr_addr(intra4x4_wr_addr),
	.data_in(intra4x4_din),.data_out(intra4x4_dout)
	); 


spram_wait # (32,22)
	final_frame_luma_L0(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(luma_ram_w),
	.ai_oe(ref_L0_luma_RAM_rd),
	.ai_addr_w(ref_luma_wr_addr),.ai_addr_r(ref_luma_rd_addr_l0),
	.ao_data(frame_L0_luma_RAM_dout),.ai_data(final_frame_RAM_din),
   	.ao_valid(ao_valid_luma_L0)
   );

spram_wait # (32,21)
	final_frame_chroma_L0(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(chroma_ram_w),
	.ai_oe(ref_L0_chroma_RAM_rd),
	.ai_addr_w(ref_chroma_wr_addr),.ai_addr_r(ref_chroma_rd_addr_l0),
	.ao_data(frame_L0_chroma_RAM_dout),.ai_data(final_frame_RAM_din),
   	.ao_valid(ao_valid_chroma_L0)
   );

/*spram_wait # (32,24)
	final_frame_luma_L1(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(luma_ram_w),
	.ai_oe(ref_L1_luma_RAM_rd),
	.ai_addr_w(ref_luma_wr_addr),.ai_addr_r(ref_luma_rd_addr_l1),
	.ao_data(frame_L1_luma_RAM_dout),.ai_data(final_frame_RAM_din),
   	.ao_valid(ao_valid_luma_L1)
   );

spram_wait # (32,23)
	final_frame_chroma_L1(
	.clk(clk),.rst(~reset_n),
	.ai_ce(1'b1),.ai_we(chroma_ram_w),
	.ai_oe(ref_L1_chroma_RAM_rd),
	.ai_addr_w(ref_chroma_wr_addr),.ai_addr_r(ref_chroma_rd_addr_l1),
	.ao_data(frame_L1_chroma_RAM_dout),.ai_data(final_frame_RAM_din),
   	.ao_valid(ao_valid_chroma_L1)
   );*/


endmodule

