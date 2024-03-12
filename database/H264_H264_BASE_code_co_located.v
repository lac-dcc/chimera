`include "timescale.v"
`include "define.v"

module co_located(
input clk,reset_n,
input [1:0] nal_ref_idc,
input [2:0] slice_type,
input [3:0] slice_data_state,
input [2:0] mb_pred_state,sub_mb_pred_state,
input [7:0] mb_num_h,mb_num_v,
input p_skip_end,Is_skipMB_mv_calc,
input [3:0] mb_type_general,
input [1:0] mbPartIdx,
input [1:0] sub_mb_type,
input [1:0] SubMbPredMode,
input [2:0] B_MbPartPredMode_0,
input [19:0] refIdxL0_curr,
input [43:0] mvxL0_CurrMb0,mvxL0_CurrMb1,mvxL0_CurrMb2,mvxL0_CurrMb3,
input [43:0] mvyL0_CurrMb0,mvyL0_CurrMb1,mvyL0_CurrMb2,mvyL0_CurrMb3,

input [19:0] col_refidx_dout,
input [43:0] col_mvx_dout,col_mvy_dout,
input ao_valid_refidx,ao_valid_mvx,ao_valid_mvy,

output reg col_wr_n,col_rd_n,
output reg [13:0] col_wr_addr,col_rd_addr,
output reg [19:0] col_refidx_din,
output reg [43:0] col_mvx_din,col_mvy_din,

output b_col_end,

output reg [5:0] refidx_col,
output reg [10:0] mvx_col,mvy_col
);


wire valid;
assign valid = ao_valid_refidx && ao_valid_mvx && ao_valid_mvy;

reg [1:0] state;

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= 0;
	else if(slice_data_state == `b_skip_col || slice_data_state == `b_direct_col)
		case(state)
		0:	state <= 1;				//rst
		1:	state <= 2;				//rd
		2:	state <= valid ? 3:2;			//store
		3:	state <= 0;				//end
		default:;
		endcase		
			
assign b_col_end = state == 3;

reg [19:0] refidx_col_r;
reg [43:0] mvx_col_r,mvy_col_r;

always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		refidx_col_r <= 0;
		mvx_col_r <= 0;	mvy_col_r <= 0;end
	else if(state == 2 && valid)begin
		refidx_col_r <= col_refidx_dout;
		mvx_col_r <= col_mvx_dout;	mvy_col_r <= col_mvy_dout;end


always@(Is_skipMB_mv_calc or slice_type or mb_pred_state or sub_mb_pred_state or B_MbPartPredMode_0 or sub_mb_type or SubMbPredMode or reset_n
	or refidx_col_r or mvx_col_r or mvy_col_r or mbPartIdx)
	if(reset_n == 0)begin
		refidx_col = 0; mvx_col = 0; mvy_col = 0; end
	else if(slice_type == `slice_type_b)begin
		if(Is_skipMB_mv_calc)begin
			refidx_col = refidx_col_r[4:0];
			mvx_col = mvx_col_r[10:0];	mvy_col = mvy_col_r[10:0];	end
		else if(mb_pred_state == `mvd_l0_s && B_MbPartPredMode_0 == `B_Direct)begin
			refidx_col = refidx_col_r[4:0];
			mvx_col = mvx_col_r[10:0];	mvy_col = mvy_col_r[10:0];	end
		else if(sub_mb_pred_state == `sub_mvd_l0_s && sub_mb_type == 0 && SubMbPredMode == `B_sub_Direct)
			case(mbPartIdx)
			0:begin
				refidx_col = refidx_col_r[4:0];
				mvx_col = mvx_col_r[10:0];	mvy_col = mvy_col_r[10:0];	end
			1:begin
				refidx_col = refidx_col_r[9:5];
				mvx_col = mvx_col_r[21:11];	mvy_col = mvy_col_r[21:11];	end
			2:begin
				refidx_col = refidx_col_r[14:10];
				mvx_col = mvx_col_r[32:22];	mvy_col = mvy_col_r[32:22];	end
			3:begin
				refidx_col = refidx_col_r[19:15];
				mvx_col = mvx_col_r[43:33];	mvy_col = mvy_col_r[43:33];	end
			endcase
		end
	else begin
		refidx_col = 0; mvx_col = 0; mvy_col = 0; end
		


always@(state or mb_num_v or mb_num_h or reset_n)
	if(reset_n == 0)begin
		col_rd_n = 1;	col_rd_addr = 0;end
	else if(state == 1)begin
		col_rd_n = 0;
		col_rd_addr = {mb_num_h[6:0],mb_num_v[6:0]};end
	else begin
		col_rd_n = 1;	col_rd_addr = 0;end


always@(posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		col_wr_n <= 1;
		col_wr_addr <= 0;
		col_refidx_din <= 0;
		col_mvx_din <= 0; col_mvy_din <= 0;end
	else if(nal_ref_idc != 0 && slice_type == `slice_type_p)begin
		if(slice_data_state == `skip_run_duration && p_skip_end)begin
			col_wr_n <= 0;
			col_wr_addr <= {mb_num_h[6:0],mb_num_v[6:0]};
			col_refidx_din <= refIdxL0_curr;
			col_mvx_din <= {4{mvxL0_CurrMb0[10:0]}};
			col_mvy_din <= {4{mvyL0_CurrMb0[10:0]}};end
		else if(slice_data_state == `mb_num_update && mb_type_general == `MB_Inter16x16)begin
			col_wr_n <= 0;
			col_wr_addr <= {mb_num_h[6:0],mb_num_v[6:0]};
			col_refidx_din <= refIdxL0_curr;
			col_mvx_din  <= {4{mvxL0_CurrMb0[10:0]}};
			col_mvy_din  <= {4{mvyL0_CurrMb0[10:0]}};end
		else if(slice_data_state == `mb_num_update)begin
			col_wr_n <= 0;
			col_wr_addr <= {mb_num_h[6:0],mb_num_v[6:0]};
			col_refidx_din <= refIdxL0_curr;
			col_mvx_din  <= {mvxL0_CurrMb3[43:33],mvxL0_CurrMb2[32:22],mvxL0_CurrMb1[21:11],mvxL0_CurrMb0[10:0]};
			col_mvy_din  <= {mvyL0_CurrMb3[43:33],mvyL0_CurrMb2[32:22],mvyL0_CurrMb1[21:11],mvyL0_CurrMb0[10:0]};end
		else begin
			col_wr_n <= 1;
			col_wr_addr <= 0;
			col_refidx_din <= 0;
			col_mvx_din <= 0; col_mvy_din <= 0;end
		end
	else begin
		col_wr_n <= 1;
		col_wr_addr <= 0;
		col_refidx_din <= 0;
		col_mvx_din <= 0; col_mvy_din <= 0;end













endmodule
