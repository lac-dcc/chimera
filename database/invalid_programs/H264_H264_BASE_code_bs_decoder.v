`include "timescale.v"
`include "define.v"

module bs_decoder (
input clk,reset_n,
input end_of_MB_DEC,end_of_mb_sum,
input [7:0] mb_num_h,mb_num_v,
input disable_DF,
input [3:0] slice_data_state,
input [3:0] mb_type_general,
input Is_skipMB_mv_calc,
input [2:0] residual_inter_state,
input [4:0] intra4x4_pred_num,
input [7:0] pic_width_in_mbs_minus1, 
input [7:0] pic_height_in_map_units_minus1,
input [43:0] mvxL0_mbAddrA,mvyL0_mbAddrA,mvxL1_mbAddrA,mvyL1_mbAddrA,
input [43:0] mvxL0_mbAddrB_dout,mvyL0_mbAddrB_dout,mvxL1_mbAddrB_dout,mvyL1_mbAddrB_dout,

input [43:0] mvxL0_CurrMb0,mvxL0_CurrMb1,mvxL0_CurrMb2,mvxL0_CurrMb3,
input [43:0] mvyL0_CurrMb0,mvyL0_CurrMb1,mvyL0_CurrMb2,mvyL0_CurrMb3,
input [43:0] mvxL1_CurrMb0,mvxL1_CurrMb1,mvxL1_CurrMb2,mvxL1_CurrMb3,
input [43:0] mvyL1_CurrMb0,mvyL1_CurrMb1,mvyL1_CurrMb2,mvyL1_CurrMb3,

input res_0,
input [4:0] TotalCoeff,


input [19:0] refIdxL0_curr,refIdxL1_curr,    
input [3:0] predFlagL0_curr,predFlagL1_curr,
input [9:0] refIdxL0_addrA,refIdxL1_addrA,refIdxL0_addrB_dout,refIdxL1_addrB_dout,
input [1:0] predFlagL0_addrA,predFlagL1_addrA,predFlagL0_addrB_dout,predFlagL1_addrB_dout,

input [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,

output end_of_BS_DEC,mv_mbAddrB_rd_for_DF,ref_idx_rd_for_DF,
output reg [11:0] bs_V0,bs_V1,bs_V2,bs_V3,bs_H0,bs_H1,bs_H2,bs_H3
);


wire bs_dec_ena;
//-------------------------------------------
//mb_type_general needs to be latched for DF
//-------------------------------------------
reg [3:0] mb_type_general_DF;
reg [7:0] mb_num_h_bs,mb_num_v_bs;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mb_type_general_DF <= 4'b0;
		mb_num_h_bs <= 0; mb_num_v_bs <= 0;end
	else if (!disable_DF&&end_of_mb_sum)begin
		mb_type_general_DF <= mb_type_general;
		mb_num_h_bs <= mb_num_h; mb_num_v_bs <= mb_num_v;end

reg [1:0] MB_inter_size;		
always @ (mb_type_general_DF)	
	if (mb_type_general_DF[3] == 1'b0)
		case (mb_type_general_DF[2:0])
		3'b000,3'b101,3'b111:MB_inter_size = `I16x16;
		3'b001		    :MB_inter_size = `I16x8;
		3'b010		    :MB_inter_size = `I8x16;
		default		    :MB_inter_size = `I8x8;
		endcase
	else //Although it should be Intra,but we have no other choice
		MB_inter_size = `I8x8;

				
reg [1:0] bs_dec_counter;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		bs_dec_counter <= 0;
	else if(bs_dec_ena)
		bs_dec_counter <= bs_dec_counter - 1;
	
assign end_of_BS_DEC = (bs_dec_counter == 2'd1)? 1'b1:1'b0;
assign bs_dec_ena = ((end_of_MB_DEC == 1'b1 ) || bs_dec_counter != 0)? 1'b1:1'b0;




reg [15:0] currMB_coeff;
reg [1:0] MBTypeGen_mbAddrA_reg,MBTypeGen_mbAddrB_reg;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		MBTypeGen_mbAddrA_reg <= 0;
		MBTypeGen_mbAddrB_reg <= 0;end
	else if(end_of_mb_sum)begin
		MBTypeGen_mbAddrA_reg <= MBTypeGen_mbAddrA;
		MBTypeGen_mbAddrB_reg <= MBTypeGen_mbAddrB;end


reg [19:0] refIdxL0_DF,refIdxL1_DF;    
reg [3:0] predFlagL0_DF,predFlagL1_DF;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		refIdxL0_DF <= 0;	refIdxL1_DF <= 0;
		predFlagL0_DF <= 0;	predFlagL1_DF <= 0;end
	else if(end_of_mb_sum)begin
		refIdxL0_DF <= refIdxL0_curr;		refIdxL1_DF <= refIdxL1_curr;
		predFlagL0_DF <= predFlagL0_curr;	predFlagL1_DF <= predFlagL1_curr;end
		
		

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)
		currMB_coeff <= 16'd0;
	else if (!disable_DF)begin
		if (slice_data_state == `coded_block_pattern_s)
			currMB_coeff <= 16'd0;
		else if (mb_type_general[3] == 1'b0 && mb_type_general[2:0] != 3'b101 &&  mb_type_general[2:0] != 3'b111  )	
			if(residual_inter_state==`inter_sum&&intra4x4_pred_num[4]==0)
			case (intra4x4_pred_num[3:0])
			4'd0 :currMB_coeff[0]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd1 :currMB_coeff[1]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd2 :currMB_coeff[2]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd3 :currMB_coeff[3]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd4 :currMB_coeff[4]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd5 :currMB_coeff[5]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd6 :currMB_coeff[6]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd7 :currMB_coeff[7]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd8 :currMB_coeff[8]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd9 :currMB_coeff[9]  <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd10:currMB_coeff[10] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd11:currMB_coeff[11] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd12:currMB_coeff[12] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd13:currMB_coeff[13] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd14:currMB_coeff[14] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			4'd15:currMB_coeff[15] <= res_0||TotalCoeff == 0?1'b0:1'b1;
			default:;
			endcase
		end
			

reg [3:0] mbAddrB_coeff_reg [127:0];
always @ (posedge clk or negedge reset_n)
	if (!disable_DF && mb_type_general[3] == 1'b0 && mb_type_general[2:0] != 3'b101 && mb_type_general[2:0] != 3'b111 ) //Inter but not skip
		if(residual_inter_state==`inter_updat&&intra4x4_pred_num == 5'd25)
		mbAddrB_coeff_reg[mb_num_h[6:0]] <= {currMB_coeff[15],currMB_coeff[14],currMB_coeff[11],currMB_coeff[10]};


reg [3:0] mbAddrA_coeff;
reg [43:0] mbAddrA_mvx_L0,mbAddrA_mvx_L1,mbAddrA_mvy_L0,mbAddrA_mvy_L1;
reg [9:0] mbAddrA_refIdxL0,mbAddrA_refIdxL1;
reg [1:0] mbAddrA_predFlagL0,mbAddrA_predFlagL1;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mbAddrA_coeff <= 4'b0;
		mbAddrA_mvx_L0 <= 44'b0;	mbAddrA_mvy_L0 <= 44'b0;	
		mbAddrA_mvx_L1 <= 44'b0;	mbAddrA_mvy_L1 <= 44'b0;	
		mbAddrA_refIdxL0 <= 10'b0;	mbAddrA_refIdxL1 <= 10'b0;
		mbAddrA_predFlagL0 <= 2'b0;	mbAddrA_predFlagL1 <= 2'b0;end
	else if (!disable_DF && mb_num_h != 0 &&  MBTypeGen_mbAddrA[1] == 1'b0 &&
			((mb_type_general == `MB_P_skip && Is_skipMB_mv_calc) 				
			|| (slice_data_state == `mb_type_s && mb_type_general[3] == 1'b0)))begin	
		mbAddrA_mvx_L0 <=  mvxL0_mbAddrA;  mbAddrA_mvy_L0 <=  mvyL0_mbAddrA;                     
		mbAddrA_mvx_L1 <=  mvxL1_mbAddrA;  mbAddrA_mvy_L1 <=  mvyL1_mbAddrA;
		mbAddrA_refIdxL0 <= refIdxL0_addrA;	mbAddrA_refIdxL1 <= refIdxL1_addrA;
		mbAddrA_predFlagL0 <= predFlagL0_addrA; mbAddrA_predFlagL1 <= predFlagL1_addrA;
		if (MBTypeGen_mbAddrA[0] == 1'b0)	mbAddrA_coeff <= {currMB_coeff[15],currMB_coeff[13],currMB_coeff[7],currMB_coeff[5]};
		end


assign mv_mbAddrB_rd_for_DF = (slice_data_state == `mb_type_s && mb_type_general[3] == 1'b0 && mb_num_v != 0);
assign ref_idx_rd_for_DF = (slice_data_state == `mb_type_s && mb_type_general[3] == 1'b0 && mb_num_v != 0);

reg [3:0] mbAddrB_coeff;
reg [43:0] mbAddrB_mvx_L0,mbAddrB_mvx_L1,mbAddrB_mvy_L0,mbAddrB_mvy_L1;
reg [9:0] mbAddrB_refIdxL0,mbAddrB_refIdxL1;
reg [1:0] mbAddrB_predFlagL0,mbAddrB_predFlagL1;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		mbAddrB_coeff <= 4'b0;
		mbAddrB_mvx_L0 <= 44'b0;	mbAddrB_mvy_L0 <= 44'b0;	
		mbAddrB_mvx_L1 <= 44'b0;	mbAddrB_mvy_L1 <= 44'b0;	
		mbAddrB_refIdxL0 <= 10'b0;	mbAddrB_refIdxL1 <= 10'b0;
		mbAddrB_predFlagL0 <= 2'b0;	mbAddrB_predFlagL1 <= 2'b0;end
	else if (!disable_DF && mb_num_v != 0 && MBTypeGen_mbAddrB[1] == 1'b0 && 
			((mb_type_general == `MB_P_skip && Is_skipMB_mv_calc)	//Current MB is P_skip 
			|| (slice_data_state == `mb_type_s && mb_type_general[3] == 1'b0)))begin		//Current MB is Inter
		mbAddrB_mvx_L0 <= mvxL0_mbAddrB_dout;	mbAddrB_mvy_L0 <= mvyL0_mbAddrB_dout;
		mbAddrB_mvx_L1 <= mvxL1_mbAddrB_dout;	mbAddrB_mvy_L1 <= mvyL1_mbAddrB_dout;	
		mbAddrB_refIdxL0 <= refIdxL0_addrB_dout;	mbAddrB_refIdxL1 <= refIdxL1_addrB_dout;
		mbAddrB_predFlagL0 <= predFlagL0_addrB_dout;	mbAddrB_predFlagL1 <= predFlagL1_addrB_dout;
		//if mbAddrB is Inter (not P_skip),back up non-zero residual coeff information
		if (MBTypeGen_mbAddrB[0] == 1'b0)
			mbAddrB_coeff <= mbAddrB_coeff_reg[mb_num_h[6:0]];
		end


wire mvxL0_V0_diff_GE4,mvxL0_V1_diff_GE4,mvxL0_V2_diff_GE4,mvxL0_V3_diff_GE4;
wire mvyL0_V0_diff_GE4,mvyL0_V1_diff_GE4,mvyL0_V2_diff_GE4,mvyL0_V3_diff_GE4;
wire mvxL0_H0_diff_GE4,mvxL0_H1_diff_GE4,mvxL0_H2_diff_GE4,mvxL0_H3_diff_GE4;
wire mvyL0_H0_diff_GE4,mvyL0_H1_diff_GE4,mvyL0_H2_diff_GE4,mvyL0_H3_diff_GE4;

wire mvxL1_V0_diff_GE4,mvxL1_V1_diff_GE4,mvxL1_V2_diff_GE4,mvxL1_V3_diff_GE4;
wire mvyL1_V0_diff_GE4,mvyL1_V1_diff_GE4,mvyL1_V2_diff_GE4,mvyL1_V3_diff_GE4;
wire mvxL1_H0_diff_GE4,mvxL1_H1_diff_GE4,mvxL1_H2_diff_GE4,mvxL1_H3_diff_GE4;
wire mvyL1_H0_diff_GE4,mvyL1_H1_diff_GE4,mvyL1_H2_diff_GE4,mvyL1_H3_diff_GE4;


wire V0_mvdiff_ge,V1_mvdiff_ge,V2_mvdiff_ge,V3_mvdiff_ge;
wire H0_mvdiff_ge,H1_mvdiff_ge,H2_mvdiff_ge,H3_mvdiff_ge;


assign V0_mvdiff_ge = mvxL0_V0_diff_GE4 || mvyL0_V0_diff_GE4 || mvxL1_V0_diff_GE4 || mvyL1_V0_diff_GE4;
assign V1_mvdiff_ge = mvxL0_V1_diff_GE4 || mvyL0_V1_diff_GE4 || mvxL1_V1_diff_GE4 || mvyL1_V1_diff_GE4;
assign V2_mvdiff_ge = mvxL0_V2_diff_GE4 || mvyL0_V2_diff_GE4 || mvxL1_V2_diff_GE4 || mvyL1_V2_diff_GE4;
assign V3_mvdiff_ge = mvxL0_V3_diff_GE4 || mvyL0_V3_diff_GE4 || mvxL1_V3_diff_GE4 || mvyL1_V3_diff_GE4;
assign H0_mvdiff_ge = mvxL0_H0_diff_GE4 || mvyL0_H0_diff_GE4 || mvxL1_H0_diff_GE4 || mvyL1_H0_diff_GE4;
assign H1_mvdiff_ge = mvxL0_H1_diff_GE4 || mvyL0_H1_diff_GE4 || mvxL1_H1_diff_GE4 || mvyL1_H1_diff_GE4;
assign H2_mvdiff_ge = mvxL0_H2_diff_GE4 || mvyL0_H2_diff_GE4 || mvxL1_H2_diff_GE4 || mvyL1_H2_diff_GE4;
assign H3_mvdiff_ge = mvxL0_H3_diff_GE4 || mvyL0_H3_diff_GE4 || mvxL1_H3_diff_GE4 || mvyL1_H3_diff_GE4;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		bs_V0 <= 0;	bs_V1 <= 0;	bs_V2 <= 0;	bs_V3 <= 0;
		bs_H0 <= 0;	bs_H1 <= 0;	bs_H2 <= 0;	bs_H3 <= 0;end
	else if(disable_DF)begin 
		bs_V0 <= 0;	bs_V1 <= 0;	bs_V2 <= 0;	bs_V3 <= 0;
		bs_H0 <= 0;	bs_H1 <= 0;	bs_H2 <= 0;	bs_H3 <= 0;end
	else if(bs_dec_ena)
		if (mb_type_general_DF == `MB_P_skip ||mb_type_general_DF == `MB_B_skip)
		case (bs_dec_counter)
		2'b00:begin
			if (mb_num_h_bs == 0) 						//edge of frame,bs = 0
				bs_V0 <= 12'b0;
			else if (MBTypeGen_mbAddrA_reg[1] == 1'b1) 	//mbAddrA is Intra,bs = 4
				bs_V0 <= 12'b100100100100;
			else if (MBTypeGen_mbAddrA_reg    == `MB_addrA_addrB_P_skip)	//mbAddrA is P_skip
				bs_V0 <= (V0_mvdiff_ge|| mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])?
					12'b001001001001:12'b0;
			else begin								//mbAddrA is Interb 
				bs_V0[2:0]  <= (mbAddrA_coeff[0])? 3'd2:
					       (V0_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])?3'd1:3'd0;
				bs_V0[5:3]  <= (mbAddrA_coeff[1])? 3'd2:
					       (V1_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;	
				bs_V0[8:6]  <= (mbAddrA_coeff[2])? 3'd2:
					       (V2_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[4:0])? 3'd1:3'd0;	
				bs_V0[11:9] <= (mbAddrA_coeff[3])? 3'd2:
					       (V3_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[4:0])? 3'd1:3'd0;end
			if (mb_num_v_bs == 0)						//edge of frame,bs = 0
				bs_H0 <= 12'b0;
			else if (MBTypeGen_mbAddrB_reg[1] == 1'b1)	//mbAddrB is Intra,bs=4
				bs_H0 <= 12'b100100100100;
			else if (MBTypeGen_mbAddrB_reg == `MB_addrA_addrB_P_skip)	//mbAddrB is P_skip
				bs_H0 <= (H0_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 
					12'b001001001001:12'b0;
			else begin 
				bs_H0[2:0]  <= (mbAddrB_coeff[0])? 3'd2:
					       (H0_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_H0[5:3]  <= (mbAddrB_coeff[1])? 3'd2:
                                               (H1_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;	
				bs_H0[8:6]  <= (mbAddrB_coeff[2])? 3'd2:
				               (H2_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[4:0])? 3'd1:3'd0;	
				bs_H0[11:9] <= (mbAddrB_coeff[3])? 3'd2:
                                               (H3_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[4:0])? 3'd1:3'd0;end
				end
			2'b11:begin	bs_V1 <= 0;	bs_H1 <= 0;	end
			2'b10:begin	bs_V2 <= 0;	bs_H2 <= 0;	end
			2'b01:begin	bs_V3 <= 0;	bs_H3 <= 0;	end
			endcase
	else if (mb_type_general_DF[3] == 1'b1)
		case (bs_dec_counter)
		2'b00:begin
			bs_V0 <= (mb_num_h_bs == 0)? 12'b0:12'b100100100100; 
			bs_H0 <= (mb_num_v_bs == 0)? 12'b0:12'b100100100100;end
		2'b11:begin bs_V1 <= 12'b011011011011;	bs_H1 <= 12'b011011011011; end 
		2'b10:begin bs_V2 <= 12'b011011011011;	bs_H2 <= 12'b011011011011; end 
		2'b01:begin bs_V3 <= 12'b011011011011; 	bs_H3 <= 12'b011011011011; end
		endcase
	else 
		case (bs_dec_counter)
		2'b00:begin
			if (mb_num_h_bs == 0) 						//edge of frame,bs = 0
				bs_V0 <= 12'b0;
			else if (MBTypeGen_mbAddrA_reg[1] == 1'b1) 	//mbAddrA is Intra,bs = 4
				bs_V0 <= 12'b100100100100;
			else if (MBTypeGen_mbAddrA_reg    == `MB_addrA_addrB_P_skip)begin	//mbAddrA is P_skip				
				bs_V0[2:0]  <= (currMB_coeff[0])?  3'd2:
					       (V0_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])?3'd1:3'd0;
				bs_V0[5:3]  <= (currMB_coeff[2])?  3'd2:
					       (V1_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_V0[8:6]  <= (currMB_coeff[8])?  3'd2:
					       (V2_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[14:10] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[14:10])? 3'd1:3'd0;
				bs_V0[11:9] <= (currMB_coeff[10])? 3'd2:
					       (V3_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[14:10] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[14:10])? 3'd1:3'd0;end
			else begin 
				bs_V0[2:0]  <= (currMB_coeff[0] || mbAddrA_coeff[0])?  3'd2:
					       (V0_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])?3'd1:3'd0;
				bs_V0[5:3]  <= (currMB_coeff[2] || mbAddrA_coeff[1])?  3'd2:
					       (V1_mvdiff_ge||mbAddrA_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrA_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_V0[8:6]  <= (currMB_coeff[8] || mbAddrA_coeff[2])?  3'd2:
					       (V2_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[14:10] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[14:10])? 3'd1:3'd0;
				bs_V0[11:9] <= (currMB_coeff[10] || mbAddrA_coeff[3])? 3'd2:
					       (V3_mvdiff_ge||mbAddrA_refIdxL0[9:5] != refIdxL0_DF[14:10] || mbAddrA_refIdxL1[9:5] != refIdxL1_DF[14:10])? 3'd1:3'd0;end
			if (mb_num_v_bs == 0) 						//edge of frame,bs = 0
				bs_H0 <= 12'b0;
			else if (MBTypeGen_mbAddrB_reg[1] == 1'b1) 	//mbAddrB is Intra,bs = 4
				bs_H0 <= 12'b100100100100;
			else if (MBTypeGen_mbAddrB_reg == `MB_addrA_addrB_P_skip)begin	//mbAddrB is P_skip
				bs_H0[2:0]  <= (currMB_coeff[0])? 3'd2:
					       (H0_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_H0[5:3]  <= (currMB_coeff[1])? 3'd2:
					       (H1_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_H0[8:6]  <= (currMB_coeff[4])? 3'd2:
					       (H2_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[9:5] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[9:5])? 3'd1:3'd0;
				bs_H0[11:9] <= (currMB_coeff[5])? 3'd2:
					       (H3_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[9:5] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[9:5])? 3'd1:3'd0;end
			else begin 
				bs_H0[2:0]  <= (mbAddrB_coeff[0] || currMB_coeff[0])? 3'd2:
					       (H0_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_H0[5:3]  <= (mbAddrB_coeff[1] || currMB_coeff[1])? 3'd2:
					       (H1_mvdiff_ge|| mbAddrB_refIdxL0[4:0] != refIdxL0_DF[4:0] || mbAddrB_refIdxL1[4:0] != refIdxL1_DF[4:0])? 3'd1:3'd0;
				bs_H0[8:6]  <= (mbAddrB_coeff[2] || currMB_coeff[4])? 3'd2:
					       (H2_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[9:5] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[9:5])? 3'd1:3'd0;
				bs_H0[11:9] <= (mbAddrB_coeff[3] || currMB_coeff[5])? 3'd2:
					       (H3_mvdiff_ge|| mbAddrB_refIdxL0[9:5] != refIdxL0_DF[9:5] || mbAddrB_refIdxL1[9:5] != refIdxL1_DF[9:5])? 3'd1:3'd0;end
			end
		2'b11:begin
			bs_V1[2:0]  <= (currMB_coeff[0]  || currMB_coeff[1])?  3'd2: V0_mvdiff_ge ? 3'd1:3'd0;	  			
			bs_V1[5:3]  <= (currMB_coeff[2]  || currMB_coeff[3])?  3'd2: V1_mvdiff_ge ? 3'd1:3'd0;	
			bs_V1[8:6]  <= (currMB_coeff[8]  || currMB_coeff[9])?  3'd2: V2_mvdiff_ge ? 3'd1:3'd0;
			bs_V1[11:9] <= (currMB_coeff[10] || currMB_coeff[11])? 3'd2: V3_mvdiff_ge ? 3'd1:3'd0;
			bs_H1[2:0]  <= (currMB_coeff[0]  || currMB_coeff[2])?  3'd2: H0_mvdiff_ge ? 3'd1:3'd0;
			bs_H1[5:3]  <= (currMB_coeff[1]  || currMB_coeff[3])?  3'd2: H1_mvdiff_ge ? 3'd1:3'd0;
			bs_H1[8:6]  <= (currMB_coeff[4]  || currMB_coeff[6])?  3'd2: H2_mvdiff_ge ? 3'd1:3'd0;					
			bs_H1[11:9] <= (currMB_coeff[5]  || currMB_coeff[7])?  3'd2: H3_mvdiff_ge ? 3'd1:3'd0;end
		2'b10:begin
			bs_V2[2:0]  <= (currMB_coeff[1]  || currMB_coeff[4])?  3'd2:
				       (V0_mvdiff_ge || refIdxL0_DF[4:0] != refIdxL0_DF[9:5] || refIdxL1_DF[4:0] != refIdxL1_DF[9:5])? 3'd1:3'd0;	
			bs_V2[5:3]  <= (currMB_coeff[3]  || currMB_coeff[6])?  3'd2:
				       (V1_mvdiff_ge || refIdxL0_DF[4:0] != refIdxL0_DF[9:5] || refIdxL1_DF[4:0] != refIdxL1_DF[9:5])? 3'd1:3'd0;	 
			bs_V2[8:6]  <= (currMB_coeff[9]  || currMB_coeff[12])? 3'd2:
				       (V2_mvdiff_ge || refIdxL0_DF[14:10] != refIdxL0_DF[19:15] || refIdxL1_DF[14:10] != refIdxL1_DF[19:15])? 3'd1:3'd0;	
			bs_V2[11:9] <= (currMB_coeff[11] || currMB_coeff[14])? 3'd2:
				       (V3_mvdiff_ge || refIdxL0_DF[14:10] != refIdxL0_DF[19:15] || refIdxL1_DF[14:10] != refIdxL1_DF[19:15])? 3'd1:3'd0;	
			bs_H2[2:0]  <= (currMB_coeff[2]  || currMB_coeff[8])?  3'd2:
				       (H0_mvdiff_ge || refIdxL0_DF[4:0] != refIdxL0_DF[14:10] || refIdxL1_DF[4:0] != refIdxL1_DF[14:10])? 3'd1:3'd0;	
			bs_H2[5:3]  <= (currMB_coeff[3]  || currMB_coeff[9])?  3'd2:
				       (H1_mvdiff_ge || refIdxL0_DF[4:0] != refIdxL0_DF[14:10] || refIdxL1_DF[4:0] != refIdxL1_DF[14:10])? 3'd1:3'd0;
			bs_H2[8:6]  <= (currMB_coeff[6]  || currMB_coeff[12])? 3'd2:
				       (H2_mvdiff_ge || refIdxL0_DF[9:5] != refIdxL0_DF[19:15] || refIdxL1_DF[9:5] != refIdxL1_DF[19:15])? 3'd1:3'd0;				
			bs_H2[11:9] <= (currMB_coeff[7]  || currMB_coeff[13])? 3'd2:
				       (H3_mvdiff_ge || refIdxL0_DF[9:5] != refIdxL0_DF[19:15] || refIdxL1_DF[9:5] != refIdxL1_DF[19:15])? 3'd1:3'd0;end
		2'b01:begin
			bs_V3[2:0]  <= (currMB_coeff[4]  || currMB_coeff[5])?  3'd2: V0_mvdiff_ge ? 3'd1:3'd0;
			bs_V3[5:3]  <= (currMB_coeff[6]  || currMB_coeff[7])?  3'd2: V1_mvdiff_ge ? 3'd1:3'd0;
			bs_V3[8:6]  <= (currMB_coeff[12] || currMB_coeff[13])? 3'd2: V2_mvdiff_ge ? 3'd1:3'd0;					
			bs_V3[11:9] <= (currMB_coeff[14] || currMB_coeff[15])? 3'd2: V3_mvdiff_ge ? 3'd1:3'd0;					
			bs_H3[2:0]  <= (currMB_coeff[8]  || currMB_coeff[10])? 3'd2: H0_mvdiff_ge ? 3'd1:3'd0;
			bs_H3[5:3]  <= (currMB_coeff[9]  || currMB_coeff[11])? 3'd2: H1_mvdiff_ge ? 3'd1:3'd0;
			bs_H3[8:6]  <= (currMB_coeff[12] || currMB_coeff[14])? 3'd2: H2_mvdiff_ge ? 3'd1:3'd0;					
			bs_H3[11:9]  <= (currMB_coeff[13] || currMB_coeff[15])? 3'd2: H3_mvdiff_ge ? 3'd1:3'd0;end
		endcase

reg [10:0] mvxL0_V0_diff_a,mvxL0_V0_diff_b,mvxL0_V1_diff_a,mvxL0_V1_diff_b;
reg [10:0] mvxL0_V2_diff_a,mvxL0_V2_diff_b,mvxL0_V3_diff_a,mvxL0_V3_diff_b;
reg [10:0] mvyL0_V0_diff_a,mvyL0_V0_diff_b,mvyL0_V1_diff_a,mvyL0_V1_diff_b;
reg [10:0] mvyL0_V2_diff_a,mvyL0_V2_diff_b,mvyL0_V3_diff_a,mvyL0_V3_diff_b;
	
reg [10:0] mvxL0_H0_diff_a,mvxL0_H0_diff_b,mvxL0_H1_diff_a,mvxL0_H1_diff_b;
reg [10:0] mvxL0_H2_diff_a,mvxL0_H2_diff_b,mvxL0_H3_diff_a,mvxL0_H3_diff_b;
reg [10:0] mvyL0_H0_diff_a,mvyL0_H0_diff_b,mvyL0_H1_diff_a,mvyL0_H1_diff_b;
reg [10:0] mvyL0_H2_diff_a,mvyL0_H2_diff_b,mvyL0_H3_diff_a,mvyL0_H3_diff_b;

reg [10:0] mvxL1_V0_diff_a,mvxL1_V0_diff_b,mvxL1_V1_diff_a,mvxL1_V1_diff_b;
reg [10:0] mvxL1_V2_diff_a,mvxL1_V2_diff_b,mvxL1_V3_diff_a,mvxL1_V3_diff_b;
reg [10:0] mvyL1_V0_diff_a,mvyL1_V0_diff_b,mvyL1_V1_diff_a,mvyL1_V1_diff_b;
reg [10:0] mvyL1_V2_diff_a,mvyL1_V2_diff_b,mvyL1_V3_diff_a,mvyL1_V3_diff_b;
	
reg [10:0] mvxL1_H0_diff_a,mvxL1_H0_diff_b,mvxL1_H1_diff_a,mvxL1_H1_diff_b;
reg [10:0] mvxL1_H2_diff_a,mvxL1_H2_diff_b,mvxL1_H3_diff_a,mvxL1_H3_diff_b;
reg [10:0] mvyL1_H0_diff_a,mvyL1_H0_diff_b,mvyL1_H1_diff_a,mvyL1_H1_diff_b;
reg [10:0] mvyL1_H2_diff_a,mvyL1_H2_diff_b,mvyL1_H3_diff_a,mvyL1_H3_diff_b;



always @ (end_of_MB_DEC or disable_DF or bs_dec_counter or mb_type_general_DF
		or mb_num_h_bs or MB_inter_size or MBTypeGen_mbAddrA_reg 
		or mbAddrA_mvx_L0 or mbAddrA_mvx_L1 or mvxL0_CurrMb0 or mvxL0_CurrMb1 or mvxL0_CurrMb2 or mvxL0_CurrMb3
		or mvxL1_CurrMb0 or mvxL1_CurrMb1 or mvxL1_CurrMb2 or mvxL1_CurrMb3
		or mbAddrA_mvy_L0 or mbAddrA_mvy_L1 or mvyL0_CurrMb0 or mvyL0_CurrMb1 or mvyL0_CurrMb2 or mvyL0_CurrMb3
		or mvyL1_CurrMb0 or mvyL1_CurrMb1 or mvyL1_CurrMb2 or mvyL1_CurrMb3)

	if ((end_of_MB_DEC && disable_DF == 1'b0) || bs_dec_counter != 0)begin
		if ((mb_type_general_DF == `MB_P_skip || mb_type_general_DF == `MB_B_skip) && bs_dec_counter == 2'b00)
			if (mb_num_h_bs != 0 && MBTypeGen_mbAddrA_reg == `MB_addrA_addrB_P_skip)begin 
				mvxL0_V0_diff_a = mbAddrA_mvx_L0[10:0]; mvxL0_V0_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0;
				mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = mbAddrA_mvy_L0[10:0]; mvyL0_V0_diff_b = mvxL0_CurrMb0[10:0];
				mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0;
				mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;				
				mvxL1_V0_diff_a = mbAddrA_mvx_L1[10:0]; mvxL1_V0_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0;
				mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = mbAddrA_mvy_L1[10:0]; mvyL1_V0_diff_b = mvxL1_CurrMb0[10:0];
				mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0;
				mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
			else if (mb_num_h_bs != 0 && MBTypeGen_mbAddrA_reg == `MB_addrA_addrB_Inter)begin
				mvxL0_V0_diff_a = mbAddrA_mvx_L0[10:0]; mvxL0_V0_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_V1_diff_a = mbAddrA_mvx_L0[21:11];mvxL0_V1_diff_b = mvxL0_CurrMb0[10:0];	 
				mvxL0_V2_diff_a = mbAddrA_mvx_L0[32:22];mvxL0_V2_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_V3_diff_a = mbAddrA_mvx_L0[43:33];mvxL0_V3_diff_b = mvxL0_CurrMb0[10:0];	
				mvyL0_V0_diff_a = mbAddrA_mvy_L0[10:0]; mvyL0_V0_diff_b = mvyL0_CurrMb0[10:0];
				mvyL0_V1_diff_a = mbAddrA_mvy_L0[21:11];mvyL0_V1_diff_b = mvyL0_CurrMb0[10:0];	 
				mvyL0_V2_diff_a = mbAddrA_mvy_L0[32:22];mvyL0_V2_diff_b = mvyL0_CurrMb0[10:0];
				mvyL0_V3_diff_a = mbAddrA_mvy_L0[43:33];mvyL0_V3_diff_b = mvyL0_CurrMb0[10:0];	
			
				mvxL1_V0_diff_a = mbAddrA_mvx_L1[10:0]; mvxL1_V0_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_V1_diff_a = mbAddrA_mvx_L1[21:11];mvxL1_V1_diff_b = mvxL1_CurrMb0[10:0];	 
				mvxL1_V2_diff_a = mbAddrA_mvx_L1[32:22];mvxL1_V2_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_V3_diff_a = mbAddrA_mvx_L1[43:33];mvxL1_V3_diff_b = mvxL1_CurrMb0[10:0];	
				mvyL1_V0_diff_a = mbAddrA_mvy_L1[10:0]; mvyL1_V0_diff_b = mvyL1_CurrMb0[10:0];
				mvyL1_V1_diff_a = mbAddrA_mvy_L1[21:11];mvyL1_V1_diff_b = mvyL1_CurrMb0[10:0];	 
				mvyL1_V2_diff_a = mbAddrA_mvy_L1[32:22];mvyL1_V2_diff_b = mvyL1_CurrMb0[10:0];
				mvyL1_V3_diff_a = mbAddrA_mvy_L1[43:33];mvyL1_V3_diff_b = mvyL1_CurrMb0[10:0];	end
			else begin 
				mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
				mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
		else if (mb_type_general_DF[3] == 1'b0)
		case (bs_dec_counter)
		2'b00:	if (mb_num_h_bs != 0 && (MBTypeGen_mbAddrA_reg[1] == 1'b0))begin
				mvxL0_V0_diff_a = mbAddrA_mvx_L0[10:0];  mvxL0_V0_diff_b = mvxL0_CurrMb0[10:0]; 
				mvxL0_V1_diff_a = mbAddrA_mvx_L0[21:11]; 
				mvxL0_V1_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb0[32:22];  
				mvxL0_V2_diff_a = mbAddrA_mvx_L0[32:22]; 
				mvxL0_V2_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb2[10:0]; 
				mvxL0_V3_diff_a = mbAddrA_mvx_L0[43:33]; 
				mvxL0_V3_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb2[32:22]; 	
				mvyL0_V0_diff_a = mbAddrA_mvy_L0[10:0];  mvyL0_V0_diff_b = mvyL0_CurrMb0[10:0]; 
				mvyL0_V1_diff_a = mbAddrA_mvy_L0[21:11]; 
				mvyL0_V1_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb0[32:22];  
				mvyL0_V2_diff_a = mbAddrA_mvy_L0[32:22]; 
				mvyL0_V2_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb2[10:0]; 
				mvyL0_V3_diff_a = mbAddrA_mvy_L0[43:33]; 
				mvyL0_V3_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb2[32:22]; 	

				mvxL1_V0_diff_a = mbAddrA_mvx_L1[10:0];  mvxL1_V0_diff_b = mvxL1_CurrMb0[10:0]; 
				mvxL1_V1_diff_a = mbAddrA_mvx_L1[21:11]; 
				mvxL1_V1_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb0[32:22];  
				mvxL1_V2_diff_a = mbAddrA_mvx_L1[32:22]; 
				mvxL1_V2_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb2[10:0]; 
				mvxL1_V3_diff_a = mbAddrA_mvx_L1[43:33]; 
				mvxL1_V3_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb2[32:22]; 	
				mvyL1_V0_diff_a = mbAddrA_mvy_L1[10:0];  mvyL1_V0_diff_b = mvyL1_CurrMb0[10:0]; 
				mvyL1_V1_diff_a = mbAddrA_mvy_L1[21:11]; 
				mvyL1_V1_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb0[32:22];  
				mvyL1_V2_diff_a = mbAddrA_mvy_L1[32:22]; 
				mvyL1_V2_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb2[10:0]; 
				mvyL1_V3_diff_a = mbAddrA_mvy_L1[43:33]; 
				mvyL1_V3_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb2[32:22]; 	end
			else begin 
				mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
				mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
		2'b11:if(MB_inter_size == `I8x8)begin
				mvxL0_V0_diff_a = mvxL0_CurrMb0[10:0]; mvxL0_V0_diff_b = mvxL0_CurrMb0[21:11]; 
				mvxL0_V1_diff_a = mvxL0_CurrMb0[32:22];mvxL0_V1_diff_b = mvxL0_CurrMb0[43:33];	 
				mvxL0_V2_diff_a = mvxL0_CurrMb2[10:0]; mvxL0_V2_diff_b = mvxL0_CurrMb2[21:11]; 
				mvxL0_V3_diff_a = mvxL0_CurrMb2[32:22];mvxL0_V3_diff_b = mvxL0_CurrMb2[43:33];	
				mvyL0_V0_diff_a = mvyL0_CurrMb0[10:0]; mvyL0_V0_diff_b = mvyL0_CurrMb0[21:11]; 
				mvyL0_V1_diff_a = mvyL0_CurrMb0[32:22];mvyL0_V1_diff_b = mvyL0_CurrMb0[43:33];	 
				mvyL0_V2_diff_a = mvyL0_CurrMb2[10:0]; mvyL0_V2_diff_b = mvyL0_CurrMb2[21:11]; 
				mvyL0_V3_diff_a = mvyL0_CurrMb2[32:22];mvyL0_V3_diff_b = mvyL0_CurrMb2[43:33];	
				
				mvxL1_V0_diff_a = mvxL1_CurrMb0[10:0]; mvxL1_V0_diff_b = mvxL1_CurrMb0[21:11]; 
				mvxL1_V1_diff_a = mvxL1_CurrMb0[32:22];mvxL1_V1_diff_b = mvxL1_CurrMb0[43:33];	 
				mvxL1_V2_diff_a = mvxL1_CurrMb2[10:0]; mvxL1_V2_diff_b = mvxL1_CurrMb2[21:11]; 
				mvxL1_V3_diff_a = mvxL1_CurrMb2[32:22];mvxL1_V3_diff_b = mvxL1_CurrMb2[43:33];	
				mvyL1_V0_diff_a = mvyL1_CurrMb0[10:0]; mvyL1_V0_diff_b = mvyL1_CurrMb0[21:11]; 
				mvyL1_V1_diff_a = mvyL1_CurrMb0[32:22];mvyL1_V1_diff_b = mvyL1_CurrMb0[43:33];	 
				mvyL1_V2_diff_a = mvyL1_CurrMb2[10:0]; mvyL1_V2_diff_b = mvyL1_CurrMb2[21:11]; 
				mvyL1_V3_diff_a = mvyL1_CurrMb2[32:22];mvyL1_V3_diff_b = mvyL1_CurrMb2[43:33];	end
			else begin 
				mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
				mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
		2'b10:if(MB_inter_size == `I16x16 || MB_inter_size == `I16x8)begin
				mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
				mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
			else begin
				mvxL0_V0_diff_a = mvxL0_CurrMb0[21:11];mvxL0_V0_diff_b = mvxL0_CurrMb1[10:0];
				mvxL0_V1_diff_a = mvxL0_CurrMb0[43:33];mvxL0_V1_diff_b = mvxL0_CurrMb1[32:22];	 
				mvxL0_V2_diff_a = mvxL0_CurrMb2[21:11];mvxL0_V2_diff_b = mvxL0_CurrMb3[10:0]; 
				mvxL0_V3_diff_a = mvxL0_CurrMb2[43:33];mvxL0_V3_diff_b = mvxL0_CurrMb3[32:22];
				mvyL0_V0_diff_a = mvyL0_CurrMb0[21:11];mvyL0_V0_diff_b = mvyL0_CurrMb1[10:0];
				mvyL0_V1_diff_a = mvyL0_CurrMb0[43:33];mvyL0_V1_diff_b = mvyL0_CurrMb1[32:22];	 
				mvyL0_V2_diff_a = mvyL0_CurrMb2[21:11];mvyL0_V2_diff_b = mvyL0_CurrMb3[10:0]; 
				mvyL0_V3_diff_a = mvyL0_CurrMb2[43:33];mvyL0_V3_diff_b = mvyL0_CurrMb3[32:22];
				mvxL1_V0_diff_a = mvxL1_CurrMb0[21:11];mvxL1_V0_diff_b = mvxL1_CurrMb1[10:0];
				mvxL1_V1_diff_a = mvxL1_CurrMb0[43:33];mvxL1_V1_diff_b = mvxL1_CurrMb1[32:22];	 
				mvxL1_V2_diff_a = mvxL1_CurrMb2[21:11];mvxL1_V2_diff_b = mvxL1_CurrMb3[10:0]; 
				mvxL1_V3_diff_a = mvxL1_CurrMb2[43:33];mvxL1_V3_diff_b = mvxL1_CurrMb3[32:22];
				mvyL1_V0_diff_a = mvyL1_CurrMb0[21:11];mvyL1_V0_diff_b = mvyL1_CurrMb1[10:0];
				mvyL1_V1_diff_a = mvyL1_CurrMb0[43:33];mvyL1_V1_diff_b = mvyL1_CurrMb1[32:22];	 
				mvyL1_V2_diff_a = mvyL1_CurrMb2[21:11];mvyL1_V2_diff_b = mvyL1_CurrMb3[10:0]; 
				mvyL1_V3_diff_a = mvyL1_CurrMb2[43:33];mvyL1_V3_diff_b = mvyL1_CurrMb3[32:22];end
		2'b01:if(MB_inter_size == `I8x8)begin
				mvxL0_V0_diff_a = mvxL0_CurrMb1[10:0]; mvxL0_V0_diff_b = mvxL0_CurrMb1[21:11]; 
				mvxL0_V1_diff_a = mvxL0_CurrMb1[32:22];mvxL0_V1_diff_b = mvxL0_CurrMb1[43:33];	 
				mvxL0_V2_diff_a = mvxL0_CurrMb3[10:0]; mvxL0_V2_diff_b = mvxL0_CurrMb3[21:11]; 
				mvxL0_V3_diff_a = mvxL0_CurrMb1[32:22];mvxL0_V3_diff_b = mvxL0_CurrMb3[43:33];	
				mvyL0_V0_diff_a = mvyL0_CurrMb1[10:0]; mvyL0_V0_diff_b = mvyL0_CurrMb1[21:11]; 
				mvyL0_V1_diff_a = mvyL0_CurrMb1[32:22];mvyL0_V1_diff_b = mvyL0_CurrMb3[43:33];	 
				mvyL0_V2_diff_a = mvyL0_CurrMb3[10:0]; mvyL0_V2_diff_b = mvyL0_CurrMb3[21:11]; 
				mvyL0_V3_diff_a = mvyL0_CurrMb3[32:22];mvyL0_V3_diff_b = mvyL0_CurrMb3[43:33];	
				
				mvxL1_V0_diff_a = mvxL1_CurrMb1[10:0]; mvxL1_V0_diff_b = mvxL1_CurrMb1[21:11]; 
				mvxL1_V1_diff_a = mvxL1_CurrMb1[32:22];mvxL1_V1_diff_b = mvxL1_CurrMb1[43:33];	 
				mvxL1_V2_diff_a = mvxL1_CurrMb3[10:0]; mvxL1_V2_diff_b = mvxL1_CurrMb3[21:11]; 
				mvxL1_V3_diff_a = mvxL1_CurrMb3[32:22];mvxL1_V3_diff_b = mvxL1_CurrMb3[43:33];	
				mvyL1_V0_diff_a = mvyL1_CurrMb1[10:0]; mvyL1_V0_diff_b = mvyL1_CurrMb1[21:11]; 
				mvyL1_V1_diff_a = mvyL1_CurrMb1[32:22];mvyL1_V1_diff_b = mvyL1_CurrMb1[43:33];	 
				mvyL1_V2_diff_a = mvyL1_CurrMb3[10:0]; mvyL1_V2_diff_b = mvyL1_CurrMb3[21:11]; 
				mvyL1_V3_diff_a = mvyL1_CurrMb3[32:22];mvyL1_V3_diff_b = mvyL1_CurrMb3[43:33];	end
			else begin
				mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
				mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
				mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
				mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
				mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
				mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
				mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
				mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
		endcase
		else begin 
			mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
			mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
			mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
			mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
			mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
			mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
			mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
			mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end
		end
	else begin 
		mvxL0_V0_diff_a = 0; mvxL0_V0_diff_b = 0; mvxL0_V1_diff_a = 0; mvxL0_V1_diff_b = 0;	 
		mvxL0_V2_diff_a = 0; mvxL0_V2_diff_b = 0; mvxL0_V3_diff_a = 0; mvxL0_V3_diff_b = 0;	
		mvyL0_V0_diff_a = 0; mvyL0_V0_diff_b = 0; mvyL0_V1_diff_a = 0; mvyL0_V1_diff_b = 0;	 
		mvyL0_V2_diff_a = 0; mvyL0_V2_diff_b = 0; mvyL0_V3_diff_a = 0; mvyL0_V3_diff_b = 0;
		mvxL1_V0_diff_a = 0; mvxL1_V0_diff_b = 0; mvxL1_V1_diff_a = 0; mvxL1_V1_diff_b = 0;	 
		mvxL1_V2_diff_a = 0; mvxL1_V2_diff_b = 0; mvxL1_V3_diff_a = 0; mvxL1_V3_diff_b = 0;	
		mvyL1_V0_diff_a = 0; mvyL1_V0_diff_b = 0; mvyL1_V1_diff_a = 0; mvyL1_V1_diff_b = 0;	 
		mvyL1_V2_diff_a = 0; mvyL1_V2_diff_b = 0; mvyL1_V3_diff_a = 0; mvyL1_V3_diff_b = 0;end



				
always @ (end_of_MB_DEC or disable_DF or bs_dec_counter or mb_type_general_DF
		or mb_num_v_bs or MBTypeGen_mbAddrB_reg or MB_inter_size 
		or mbAddrB_mvx_L0 or mbAddrB_mvx_L1 or mvxL0_CurrMb0 or mvxL0_CurrMb1 or mvxL0_CurrMb2 or mvxL0_CurrMb3
		or mvxL1_CurrMb0 or mvxL1_CurrMb1 or mvxL1_CurrMb2 or mvxL1_CurrMb3
		or mbAddrB_mvy_L0 or mbAddrB_mvy_L1 or mvyL0_CurrMb0 or mvyL0_CurrMb1 or mvyL0_CurrMb2 or mvyL0_CurrMb3
		or mvyL1_CurrMb0 or mvyL1_CurrMb1 or mvyL1_CurrMb2 or mvyL1_CurrMb3)
	if ((end_of_MB_DEC && disable_DF == 1'b0) || bs_dec_counter != 0)begin
		if (mb_type_general_DF == `MB_P_skip && bs_dec_counter == 2'b00)
			if (mb_num_v_bs != 0 && MBTypeGen_mbAddrB_reg == `MB_addrA_addrB_P_skip)begin 
				mvxL0_H0_diff_a = mbAddrB_mvx_L0[10:0]; mvxL0_H0_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0;
				mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = mbAddrB_mvy_L0[10:0]; mvyL0_H0_diff_b = mvxL0_CurrMb0[10:0];
				mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0;
				mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;				
				mvxL1_H0_diff_a = mbAddrB_mvx_L1[10:0]; mvxL1_H0_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0;
				mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = mbAddrB_mvy_L1[10:0]; mvyL1_H0_diff_b = mvxL1_CurrMb0[10:0];
				mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0;
				mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end
			else if (mb_num_v_bs != 0 && MBTypeGen_mbAddrB_reg == 2'b00)begin
				mvxL0_H0_diff_a = mbAddrB_mvx_L0[43:33];mvxL0_H0_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_H1_diff_a = mbAddrB_mvx_L0[32:22];mvxL0_H1_diff_b = mvxL0_CurrMb0[10:0];	 
				mvxL0_H2_diff_a = mbAddrB_mvx_L0[21:11];mvxL0_H2_diff_b = mvxL0_CurrMb0[10:0];
				mvxL0_H3_diff_a = mbAddrB_mvx_L0[10:0]; mvxL0_H3_diff_b = mvxL0_CurrMb0[10:0];	
				mvyL0_H0_diff_a = mbAddrB_mvy_L0[43:33];mvyL0_H0_diff_b = mvyL0_CurrMb0[10:0];
				mvyL0_H1_diff_a = mbAddrB_mvy_L0[32:22];mvyL0_H1_diff_b = mvyL0_CurrMb0[10:0];	 
				mvyL0_H2_diff_a = mbAddrB_mvy_L0[21:11];mvyL0_H2_diff_b = mvyL0_CurrMb0[10:0];
				mvyL0_H3_diff_a = mbAddrB_mvy_L0[10:0]; mvyL0_H3_diff_b = mvyL0_CurrMb0[10:0];	
			
				mvxL1_H0_diff_a = mbAddrB_mvx_L1[43:33];mvxL1_H0_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_H1_diff_a = mbAddrB_mvx_L1[32:22];mvxL1_H1_diff_b = mvxL1_CurrMb0[10:0];	 
				mvxL1_H2_diff_a = mbAddrB_mvx_L1[21:11];mvxL1_H2_diff_b = mvxL1_CurrMb0[10:0];
				mvxL1_H3_diff_a = mbAddrB_mvx_L1[10:0]; mvxL1_H3_diff_b = mvxL1_CurrMb0[10:0];	
				mvyL1_H0_diff_a = mbAddrB_mvy_L1[43:33];mvyL1_H0_diff_b = mvyL1_CurrMb0[10:0];
				mvyL1_H1_diff_a = mbAddrB_mvy_L1[32:22];mvyL1_H1_diff_b = mvyL1_CurrMb0[10:0];	 
				mvyL1_H2_diff_a = mbAddrB_mvy_L1[21:11];mvyL1_H2_diff_b = mvyL1_CurrMb0[10:0];
				mvyL1_H3_diff_a = mbAddrB_mvy_L1[10:0]; mvyL1_H3_diff_b = mvyL1_CurrMb0[10:0];	end
			else begin 
				mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
				mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	
		else if (mb_type_general_DF[3] == 1'b0)
			case (bs_dec_counter)
			2'b00:if (mb_num_v_bs != 0 && (MBTypeGen_mbAddrB_reg[1] == 1'b0))begin
				mvxL0_H0_diff_a = mbAddrB_mvx_L0[43:33];  mvxL0_H0_diff_b = mvxL0_CurrMb0[10:0]; 
				mvxL0_H1_diff_a = mbAddrB_mvx_L0[32:22]; 
				mvxL0_H1_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb0[21:11];  
				mvxL0_H2_diff_a = mbAddrB_mvx_L0[21:11]; 
				mvxL0_H2_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb1[10:0]; 
				mvxL0_H3_diff_a = mbAddrA_mvx_L0[10:0]; 
				mvxL0_H3_diff_b = MB_inter_size == `I16x16 ? mvxL0_CurrMb0[10:0]:mvxL0_CurrMb1[21:11]; 
				mvyL0_H0_diff_a = mbAddrB_mvy_L0[43:33];  mvyL0_H0_diff_b = mvyL0_CurrMb0[10:0]; 
				mvyL0_H1_diff_a = mbAddrB_mvy_L0[32:22]; 
				mvyL0_H1_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb0[21:11];  
				mvyL0_H2_diff_a = mbAddrB_mvy_L0[21:11]; 
				mvyL0_H2_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb1[10:0]; 
				mvyL0_H3_diff_a = mbAddrA_mvy_L0[10:0]; 
				mvyL0_H3_diff_b = MB_inter_size == `I16x16 ? mvyL0_CurrMb0[10:0]:mvyL0_CurrMb1[21:11]; 
				mvxL1_H0_diff_a = mbAddrB_mvx_L1[43:33];  mvxL1_H0_diff_b = mvxL1_CurrMb0[10:0]; 
				mvxL1_H1_diff_a = mbAddrB_mvx_L1[32:22]; 
				mvxL1_H1_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb0[21:11];  
				mvxL1_H2_diff_a = mbAddrB_mvx_L1[21:11]; 
				mvxL1_H2_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb1[10:0]; 
				mvxL1_H3_diff_a = mbAddrA_mvx_L1[10:0]; 
				mvxL1_H3_diff_b = MB_inter_size == `I16x16 ? mvxL1_CurrMb0[10:0]:mvxL1_CurrMb1[21:11]; 
				mvyL1_H0_diff_a = mbAddrB_mvy_L1[43:33];  mvyL1_H0_diff_b = mvyL1_CurrMb0[10:0]; 
				mvyL1_H1_diff_a = mbAddrB_mvy_L1[32:22]; 
				mvyL1_H1_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb0[21:11];  
				mvyL1_H2_diff_a = mbAddrB_mvy_L1[21:11]; 
				mvyL1_H2_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb1[10:0]; 
				mvyL1_H3_diff_a = mbAddrA_mvy_L1[10:0]; 
				mvyL1_H3_diff_b = MB_inter_size == `I16x16 ? mvyL1_CurrMb0[10:0]:mvyL1_CurrMb1[21:11]; end
			      else begin 
				mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
				mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	
			2'b11:if(MB_inter_size == `I8x8)begin
				mvxL0_H0_diff_a = mvxL0_CurrMb0[10:0]; mvxL0_H0_diff_b = mvxL0_CurrMb0[32:22]; 
				mvxL0_H1_diff_a = mvxL0_CurrMb0[21:11];mvxL0_H1_diff_b = mvxL0_CurrMb0[43:33];	 
				mvxL0_H2_diff_a = mvxL0_CurrMb1[10:0]; mvxL0_H2_diff_b = mvxL0_CurrMb1[32:22]; 
				mvxL0_H3_diff_a = mvxL0_CurrMb1[21:11];mvxL0_H3_diff_b = mvxL0_CurrMb1[43:33];	
			
				mvyL0_H0_diff_a = mvyL0_CurrMb0[10:0]; mvyL0_H0_diff_b = mvyL0_CurrMb0[32:22]; 
				mvyL0_H1_diff_a = mvyL0_CurrMb0[21:11];mvyL0_H1_diff_b = mvyL0_CurrMb0[43:33];	 
				mvyL0_H2_diff_a = mvyL0_CurrMb1[10:0]; mvyL0_H2_diff_b = mvyL0_CurrMb1[32:22]; 
				mvyL0_H3_diff_a = mvyL0_CurrMb1[21:11];mvyL0_H3_diff_b = mvyL0_CurrMb1[43:33];	
				
				mvxL1_H0_diff_a = mvxL1_CurrMb0[10:0]; mvxL1_H0_diff_b = mvxL1_CurrMb0[32:22]; 
				mvxL1_H1_diff_a = mvxL1_CurrMb0[21:11];mvxL1_H1_diff_b = mvxL1_CurrMb0[43:33];	 
				mvxL1_H2_diff_a = mvxL1_CurrMb1[10:0]; mvxL1_H2_diff_b = mvxL1_CurrMb1[32:22]; 
				mvxL1_H3_diff_a = mvxL1_CurrMb1[21:11];mvxL1_H3_diff_b = mvxL1_CurrMb1[43:33];	
			
				mvyL1_H0_diff_a = mvyL1_CurrMb0[10:0]; mvyL1_H0_diff_b = mvyL1_CurrMb0[32:22]; 
				mvyL1_H1_diff_a = mvyL1_CurrMb0[21:11];mvyL1_H1_diff_b = mvyL1_CurrMb0[43:33];	 
				mvyL1_H2_diff_a = mvyL1_CurrMb1[10:0]; mvyL1_H2_diff_b = mvyL1_CurrMb1[32:22]; 
				mvyL1_H3_diff_a = mvyL1_CurrMb1[21:11];mvyL1_H3_diff_b = mvyL1_CurrMb1[43:33];	end
			      else begin 
				mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
				mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	

			2'b10:if(MB_inter_size == `I16x16 || MB_inter_size == `I8x16)begin
				mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
				mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	
			      else begin
				mvxL0_H0_diff_a = mvxL0_CurrMb0[32:22];mvxL0_H0_diff_b = mvxL0_CurrMb2[10:0];
				mvxL0_H1_diff_a = mvxL0_CurrMb0[43:33];mvxL0_H1_diff_b = mvxL0_CurrMb2[21:11];	 
				mvxL0_H2_diff_a = mvxL0_CurrMb1[32:22];mvxL0_H2_diff_b = mvxL0_CurrMb3[10:0]; 
				mvxL0_H3_diff_a = mvxL0_CurrMb1[43:33];mvxL0_H3_diff_b = mvxL0_CurrMb3[21:11];

				mvyL0_H0_diff_a = mvyL0_CurrMb0[32:22];mvyL0_H0_diff_b = mvyL0_CurrMb2[10:0];
				mvyL0_H1_diff_a = mvyL0_CurrMb0[43:33];mvyL0_H1_diff_b = mvyL0_CurrMb2[21:11];	 
				mvyL0_H2_diff_a = mvyL0_CurrMb1[32:22];mvyL0_H2_diff_b = mvyL0_CurrMb3[10:0]; 
				mvyL0_H3_diff_a = mvyL0_CurrMb1[43:33];mvyL0_H3_diff_b = mvyL0_CurrMb3[21:11];

				mvxL1_H0_diff_a = mvxL1_CurrMb0[32:22];mvxL1_H0_diff_b = mvxL1_CurrMb2[10:0];
				mvxL1_H1_diff_a = mvxL1_CurrMb0[43:33];mvxL1_H1_diff_b = mvxL1_CurrMb2[21:11];	 
				mvxL1_H2_diff_a = mvxL1_CurrMb1[32:22];mvxL1_H2_diff_b = mvxL1_CurrMb3[10:0]; 
				mvxL1_H3_diff_a = mvxL1_CurrMb1[43:33];mvxL1_H3_diff_b = mvxL1_CurrMb3[21:11];

				mvyL1_H0_diff_a = mvyL1_CurrMb0[32:22];mvyL1_H0_diff_b = mvyL1_CurrMb2[10:0];
				mvyL1_H1_diff_a = mvyL1_CurrMb0[43:33];mvyL1_H1_diff_b = mvyL1_CurrMb2[21:11];	 
				mvyL1_H2_diff_a = mvyL1_CurrMb1[32:22];mvyL1_H2_diff_b = mvyL1_CurrMb3[10:0]; 
				mvyL1_H3_diff_a = mvyL1_CurrMb1[43:33];mvyL1_H3_diff_b = mvyL1_CurrMb3[21:11];end
			2'b01:if(MB_inter_size == `I8x8)begin
				mvxL0_H0_diff_a = mvxL0_CurrMb2[10:0]; mvxL0_H0_diff_b = mvxL0_CurrMb2[32:22]; 
				mvxL0_H1_diff_a = mvxL0_CurrMb2[21:11];mvxL0_H1_diff_b = mvxL0_CurrMb2[43:33];	 
				mvxL0_H2_diff_a = mvxL0_CurrMb3[10:0]; mvxL0_H2_diff_b = mvxL0_CurrMb3[32:22]; 
				mvxL0_H3_diff_a = mvxL0_CurrMb3[21:11];mvxL0_H3_diff_b = mvxL0_CurrMb3[43:33];	
			
				mvyL0_H0_diff_a = mvyL0_CurrMb2[10:0]; mvyL0_H0_diff_b = mvyL0_CurrMb2[32:22]; 
				mvyL0_H1_diff_a = mvyL0_CurrMb2[21:11];mvyL0_H1_diff_b = mvyL0_CurrMb2[43:33];	 
				mvyL0_H2_diff_a = mvyL0_CurrMb3[10:0]; mvyL0_H2_diff_b = mvyL0_CurrMb3[32:22]; 
				mvyL0_H3_diff_a = mvyL0_CurrMb3[21:11];mvyL0_H3_diff_b = mvyL0_CurrMb3[43:33];	
				
				mvxL1_H0_diff_a = mvxL1_CurrMb2[10:0]; mvxL1_H0_diff_b = mvxL1_CurrMb2[32:22]; 
				mvxL1_H1_diff_a = mvxL1_CurrMb2[21:11];mvxL1_H1_diff_b = mvxL1_CurrMb2[43:33];	 
				mvxL1_H2_diff_a = mvxL1_CurrMb3[10:0]; mvxL1_H2_diff_b = mvxL1_CurrMb3[32:22]; 
				mvxL1_H3_diff_a = mvxL1_CurrMb3[21:11];mvxL1_H3_diff_b = mvxL1_CurrMb3[43:33];	
			
				mvyL1_H0_diff_a = mvyL1_CurrMb2[10:0]; mvyL1_H0_diff_b = mvyL1_CurrMb2[32:22]; 
				mvyL1_H1_diff_a = mvyL1_CurrMb2[21:11];mvyL1_H1_diff_b = mvyL1_CurrMb2[43:33];	 
				mvyL1_H2_diff_a = mvyL1_CurrMb3[10:0]; mvyL1_H2_diff_b = mvyL1_CurrMb3[32:22]; 
				mvyL1_H3_diff_a = mvyL1_CurrMb3[21:11];mvyL1_H3_diff_b = mvyL1_CurrMb3[43:33];	end
			      else begin 
				mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
				mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
				mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
				mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
				mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
				mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
				mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
				mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	
			endcase
		else begin 
			mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
			mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
			mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
			mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
			mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
			mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
			mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
			mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	
		end
	else begin 
		mvxL0_H0_diff_a = 0; mvxL0_H0_diff_b = 0; mvxL0_H1_diff_a = 0; mvxL0_H1_diff_b = 0;	 
		mvxL0_H2_diff_a = 0; mvxL0_H2_diff_b = 0; mvxL0_H3_diff_a = 0; mvxL0_H3_diff_b = 0;	
		mvyL0_H0_diff_a = 0; mvyL0_H0_diff_b = 0; mvyL0_H1_diff_a = 0; mvyL0_H1_diff_b = 0;	 
		mvyL0_H2_diff_a = 0; mvyL0_H2_diff_b = 0; mvyL0_H3_diff_a = 0; mvyL0_H3_diff_b = 0;
		mvxL1_H0_diff_a = 0; mvxL1_H0_diff_b = 0; mvxL1_H1_diff_a = 0; mvxL1_H1_diff_b = 0;	 
		mvxL1_H2_diff_a = 0; mvxL1_H2_diff_b = 0; mvxL1_H3_diff_a = 0; mvxL1_H3_diff_b = 0;	
		mvyL1_H0_diff_a = 0; mvyL1_H0_diff_b = 0; mvyL1_H1_diff_a = 0; mvyL1_H1_diff_b = 0;	 
		mvyL1_H2_diff_a = 0; mvyL1_H2_diff_b = 0; mvyL1_H3_diff_a = 0; mvyL1_H3_diff_b = 0;end	


	
mv_diff_GE4 mvxL0_V0_diff (.mv_a(mvxL0_V0_diff_a),.mv_b(mvxL0_V0_diff_b),.diff_GE4(mvxL0_V0_diff_GE4));
mv_diff_GE4 mvxL0_V1_diff (.mv_a(mvxL0_V1_diff_a),.mv_b(mvxL0_V1_diff_b),.diff_GE4(mvxL0_V1_diff_GE4));
mv_diff_GE4 mvxL0_V2_diff (.mv_a(mvxL0_V2_diff_a),.mv_b(mvxL0_V2_diff_b),.diff_GE4(mvxL0_V2_diff_GE4));
mv_diff_GE4 mvxL0_V3_diff (.mv_a(mvxL0_V3_diff_a),.mv_b(mvxL0_V3_diff_b),.diff_GE4(mvxL0_V3_diff_GE4));
mv_diff_GE4 mvyL0_V0_diff (.mv_a(mvyL0_V0_diff_a),.mv_b(mvyL0_V0_diff_b),.diff_GE4(mvyL0_V0_diff_GE4));
mv_diff_GE4 mvyL0_V1_diff (.mv_a(mvyL0_V1_diff_a),.mv_b(mvyL0_V1_diff_b),.diff_GE4(mvyL0_V1_diff_GE4));
mv_diff_GE4 mvyL0_V2_diff (.mv_a(mvyL0_V2_diff_a),.mv_b(mvyL0_V2_diff_b),.diff_GE4(mvyL0_V2_diff_GE4));
mv_diff_GE4 mvyL0_V3_diff (.mv_a(mvyL0_V3_diff_a),.mv_b(mvyL0_V3_diff_b),.diff_GE4(mvyL0_V3_diff_GE4));
	
mv_diff_GE4 mvxL0_H0_diff (.mv_a(mvxL0_H0_diff_a),.mv_b(mvxL0_H0_diff_b),.diff_GE4(mvxL0_H0_diff_GE4));
mv_diff_GE4 mvxL0_H1_diff (.mv_a(mvxL0_H1_diff_a),.mv_b(mvxL0_H1_diff_b),.diff_GE4(mvxL0_H1_diff_GE4));
mv_diff_GE4 mvxL0_H2_diff (.mv_a(mvxL0_H2_diff_a),.mv_b(mvxL0_H2_diff_b),.diff_GE4(mvxL0_H2_diff_GE4));
mv_diff_GE4 mvxL0_H3_diff (.mv_a(mvxL0_H3_diff_a),.mv_b(mvxL0_H3_diff_b),.diff_GE4(mvxL0_H3_diff_GE4));
mv_diff_GE4 mvyL0_H0_diff (.mv_a(mvyL0_H0_diff_a),.mv_b(mvyL0_H0_diff_b),.diff_GE4(mvyL0_H0_diff_GE4));
mv_diff_GE4 mvyL0_H1_diff (.mv_a(mvyL0_H1_diff_a),.mv_b(mvyL0_H1_diff_b),.diff_GE4(mvyL0_H1_diff_GE4));
mv_diff_GE4 mvyL0_H2_diff (.mv_a(mvyL0_H2_diff_a),.mv_b(mvyL0_H2_diff_b),.diff_GE4(mvyL0_H2_diff_GE4));
mv_diff_GE4 mvyL0_H3_diff (.mv_a(mvyL0_H3_diff_a),.mv_b(mvyL0_H3_diff_b),.diff_GE4(mvyL0_H3_diff_GE4));

mv_diff_GE4 mvxL1_V0_diff (.mv_a(mvxL1_V0_diff_a),.mv_b(mvxL1_V0_diff_b),.diff_GE4(mvxL1_V0_diff_GE4));
mv_diff_GE4 mvxL1_V1_diff (.mv_a(mvxL1_V1_diff_a),.mv_b(mvxL1_V1_diff_b),.diff_GE4(mvxL1_V1_diff_GE4));
mv_diff_GE4 mvxL1_V2_diff (.mv_a(mvxL1_V2_diff_a),.mv_b(mvxL1_V2_diff_b),.diff_GE4(mvxL1_V2_diff_GE4));
mv_diff_GE4 mvxL1_V3_diff (.mv_a(mvxL1_V3_diff_a),.mv_b(mvxL1_V3_diff_b),.diff_GE4(mvxL1_V3_diff_GE4));
mv_diff_GE4 mvyL1_V0_diff (.mv_a(mvyL1_V0_diff_a),.mv_b(mvyL1_V0_diff_b),.diff_GE4(mvyL1_V0_diff_GE4));
mv_diff_GE4 mvyL1_V1_diff (.mv_a(mvyL1_V1_diff_a),.mv_b(mvyL1_V1_diff_b),.diff_GE4(mvyL1_V1_diff_GE4));
mv_diff_GE4 mvyL1_V2_diff (.mv_a(mvyL1_V2_diff_a),.mv_b(mvyL1_V2_diff_b),.diff_GE4(mvyL1_V2_diff_GE4));
mv_diff_GE4 mvyL1_V3_diff (.mv_a(mvyL1_V3_diff_a),.mv_b(mvyL1_V3_diff_b),.diff_GE4(mvyL1_V3_diff_GE4));
	
mv_diff_GE4 mvxL1_H0_diff (.mv_a(mvxL1_H0_diff_a),.mv_b(mvxL1_H0_diff_b),.diff_GE4(mvxL1_H0_diff_GE4));
mv_diff_GE4 mvxL1_H1_diff (.mv_a(mvxL1_H1_diff_a),.mv_b(mvxL1_H1_diff_b),.diff_GE4(mvxL1_H1_diff_GE4));
mv_diff_GE4 mvxL1_H2_diff (.mv_a(mvxL1_H2_diff_a),.mv_b(mvxL1_H2_diff_b),.diff_GE4(mvxL1_H2_diff_GE4));
mv_diff_GE4 mvxL1_H3_diff (.mv_a(mvxL1_H3_diff_a),.mv_b(mvxL1_H3_diff_b),.diff_GE4(mvxL1_H3_diff_GE4));
mv_diff_GE4 mvyL1_H0_diff (.mv_a(mvyL1_H0_diff_a),.mv_b(mvyL1_H0_diff_b),.diff_GE4(mvyL1_H0_diff_GE4));
mv_diff_GE4 mvyL1_H1_diff (.mv_a(mvyL1_H1_diff_a),.mv_b(mvyL1_H1_diff_b),.diff_GE4(mvyL1_H1_diff_GE4));
mv_diff_GE4 mvyL1_H2_diff (.mv_a(mvyL1_H2_diff_a),.mv_b(mvyL1_H2_diff_b),.diff_GE4(mvyL1_H2_diff_GE4));
mv_diff_GE4 mvyL1_H3_diff (.mv_a(mvyL1_H3_diff_a),.mv_b(mvyL1_H3_diff_b),.diff_GE4(mvyL1_H3_diff_GE4));
		
endmodule

module mv_diff_GE4 (mv_a,mv_b,diff_GE4);
	input [10:0] mv_a,mv_b;
	output diff_GE4;
	wire [10:0] diff_tmp;
	wire [9:0] diff;
	assign diff_tmp = mv_a + ~ mv_b + 1;
	assign diff	= (diff_tmp[10] == 1'b1)? (~diff_tmp[9:0] + 1):diff_tmp[9:0];
	assign diff_GE4 = (diff[9:2] != 0)? 1'b1:1'b0;
endmodule

