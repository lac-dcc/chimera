`include "timescale.v"
`include "define.v"

module Inter_read(
input clk,reset_n,
input [1:0] state,
input [4:0] intra4x4_pred_num,
input [3:0] mb_type_general,
input [3:0] mv_below8x8,
input mv_is16x16,
input [7:0] mb_num_h,mb_num_v,
input trigger_blk4x4_inter_pred,
input [7:0] pic_width_in_mbs_minus1, 
input [7:0] pic_height_in_map_units_minus1,
input [43:0] mvx_CurrMb0,mvx_CurrMb1,mvx_CurrMb2,mvx_CurrMb3,
input [43:0] mvy_CurrMb0,mvy_CurrMb1,mvy_CurrMb2,mvy_CurrMb3,
input [3:0] blk4x4_inter_calculate_counter,
input data_valid,
output IsInterLuma,IsInterChroma,
output Is_InterChromaCopy,
output reg [5:0] blk4x4_inter_preload_counter,
output reg [1:0] Inter_chroma2x2_counter,
output ref_frame_luma_RAM_rd,ref_frame_chroma_RAM_rd,
output [19:0] final_frame_luma_rd_addr,
output [18:0] final_frame_chroma_rd_addr,
output [11:0] xInt_org_unclip,
output [3:0] pos_FracL,
output [2:0] xFracC,yFracC,
output x_overflow,x_less_than_zero,
output reg mv_below8x8_curr,
output reg read_end
);
parameter inter_rst = 2'b00;
parameter inter_read = 2'b01;
parameter inter_calculate = 2'b10;
parameter inter_trigger = 2'b11;


assign IsInterLuma   = (mb_type_general[3] == 0&& intra4x4_pred_num[4] == 0)? 1'b1:1'b0;
assign IsInterChroma = (mb_type_general[3] == 0&& intra4x4_pred_num[4] == 1)? 1'b1:1'b0;



always @ (IsInterLuma or IsInterChroma or intra4x4_pred_num or mv_below8x8)
	if (IsInterLuma)
		case (intra4x4_pred_num[3:2])
			2'b00:mv_below8x8_curr = mv_below8x8[0];
			2'b01:mv_below8x8_curr = mv_below8x8[1];
			2'b10:mv_below8x8_curr = mv_below8x8[2];
			2'b11:mv_below8x8_curr = mv_below8x8[3];
		endcase
	else if (IsInterChroma)
		case (intra4x4_pred_num)
			5'd18,5'd22:mv_below8x8_curr = mv_below8x8[0];
			5'd19,5'd23:mv_below8x8_curr = mv_below8x8[1];
			5'd20,5'd24:mv_below8x8_curr = mv_below8x8[2];
			5'd21,5'd25:mv_below8x8_curr = mv_below8x8[3];
			default:;
		endcase
	else
		mv_below8x8_curr = 0;

	
always @ (posedge clk)
	if (reset_n == 1'b0)
		Inter_chroma2x2_counter <= 0;
	//mv_below8x8_curr == 1'b1 includes the condition that "blk4x4_rec_counter > 15"
	else if (IsInterChroma &&  mv_below8x8_curr && trigger_blk4x4_inter_pred)
		Inter_chroma2x2_counter <= 2'b11;
	else if	(blk4x4_inter_calculate_counter == 4'd1 && Inter_chroma2x2_counter != 0)
		Inter_chroma2x2_counter <= Inter_chroma2x2_counter - 1;

reg trigger_blk2x2_inter_pred;
always @ (posedge clk)
	if (reset_n == 1'b0)
		trigger_blk2x2_inter_pred <= 0;
	else if ((IsInterChroma && trigger_blk4x4_inter_pred && mv_below8x8_curr) || 
		(blk4x4_inter_calculate_counter == 4'd1 && Inter_chroma2x2_counter != 0))
		trigger_blk2x2_inter_pred <= 1'b1;
	else
		trigger_blk2x2_inter_pred <= 1'b0;


reg [10:0] Inter_blk_mvx,Inter_blk_mvy;

always @ (intra4x4_pred_num or mv_below8x8_curr or Inter_chroma2x2_counter   
 	or IsInterLuma or IsInterChroma or mv_is16x16  
	or mvx_CurrMb0 or mvx_CurrMb1 or mvx_CurrMb2 or mvx_CurrMb3
	or mvy_CurrMb0 or mvy_CurrMb1 or mvy_CurrMb2 or mvy_CurrMb3)
	//Inter luma
	if (IsInterLuma)begin
		if (mv_is16x16)begin	
			Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0]; end
		else
		case (mv_below8x8_curr)
			1'b0:
				case (intra4x4_pred_num[3:2])
				2'b00:begin	Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0]; end
				2'b01:begin	Inter_blk_mvx = mvx_CurrMb1[10:0];  Inter_blk_mvy = mvy_CurrMb1[10:0]; end
				2'b10:begin	Inter_blk_mvx = mvx_CurrMb2[10:0];  Inter_blk_mvy = mvy_CurrMb2[10:0]; end
				2'b11:begin	Inter_blk_mvx = mvx_CurrMb3[10:0];  Inter_blk_mvy = mvy_CurrMb3[10:0]; end
				endcase
			1'b1:
				case (intra4x4_pred_num)
				0 :begin Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0];   end
				1 :begin Inter_blk_mvx = mvx_CurrMb0[21:11]; Inter_blk_mvy = mvy_CurrMb0[21:11];  end
				2 :begin Inter_blk_mvx = mvx_CurrMb0[32:22];Inter_blk_mvy = mvy_CurrMb0[32:22]; end
				3 :begin Inter_blk_mvx = mvx_CurrMb0[43:33];Inter_blk_mvy = mvy_CurrMb0[43:33]; end
				4 :begin Inter_blk_mvx = mvx_CurrMb1[10:0];  Inter_blk_mvy = mvy_CurrMb1[10:0];   end
				5 :begin Inter_blk_mvx = mvx_CurrMb1[21:11]; Inter_blk_mvy = mvy_CurrMb1[21:11];  end
				6 :begin Inter_blk_mvx = mvx_CurrMb1[32:22];Inter_blk_mvy = mvy_CurrMb1[32:22]; end
				7 :begin Inter_blk_mvx = mvx_CurrMb1[43:33];Inter_blk_mvy = mvy_CurrMb1[43:33]; end
				8 :begin Inter_blk_mvx = mvx_CurrMb2[10:0];  Inter_blk_mvy = mvy_CurrMb2[10:0];   end
				9 :begin Inter_blk_mvx = mvx_CurrMb2[21:11]; Inter_blk_mvy = mvy_CurrMb2[21:11];  end
				10:begin Inter_blk_mvx = mvx_CurrMb2[32:22];Inter_blk_mvy = mvy_CurrMb2[32:22]; end
				11:begin Inter_blk_mvx = mvx_CurrMb2[43:33];Inter_blk_mvy = mvy_CurrMb2[43:33]; end
				12:begin Inter_blk_mvx = mvx_CurrMb3[10:0];  Inter_blk_mvy = mvy_CurrMb3[10:0];   end
				13:begin Inter_blk_mvx = mvx_CurrMb3[21:11]; Inter_blk_mvy = mvy_CurrMb3[21:11];  end
				14:begin Inter_blk_mvx = mvx_CurrMb3[32:22];Inter_blk_mvy = mvy_CurrMb3[32:22]; end
				15:begin Inter_blk_mvx = mvx_CurrMb3[43:33];Inter_blk_mvy = mvy_CurrMb3[43:33]; end
				default:begin Inter_blk_mvx = 0;Inter_blk_mvy = 0; end
				endcase
			endcase
		end
	//Inter chroma
	else if (IsInterChroma)begin
		if (mv_is16x16)
			begin	Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0]; end
		else	
			case (intra4x4_pred_num)
			5'd18,5'd22:
				if (mv_below8x8_curr)	//chroma2x2 prediction
					case (Inter_chroma2x2_counter)
					3:begin Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0];   end
					2:begin Inter_blk_mvx = mvx_CurrMb0[21:11]; Inter_blk_mvy = mvy_CurrMb0[21:11];  end
					1:begin Inter_blk_mvx = mvx_CurrMb0[32:22];Inter_blk_mvy = mvy_CurrMb0[32:22]; end
					0:begin Inter_blk_mvx = mvx_CurrMb0[43:33];Inter_blk_mvy = mvy_CurrMb0[43:33]; end
					endcase
				else 				//chroma 4x4 prediction
					begin Inter_blk_mvx = mvx_CurrMb0[10:0];  Inter_blk_mvy = mvy_CurrMb0[10:0];   end
			5'd19,5'd23:
				if (mv_below8x8_curr)	//need chroma2x2 prediction
					case (Inter_chroma2x2_counter)
					3:begin Inter_blk_mvx = mvx_CurrMb1[10:0];  Inter_blk_mvy = mvy_CurrMb1[10:0];   end
					2:begin Inter_blk_mvx = mvx_CurrMb1[21:11]; Inter_blk_mvy = mvy_CurrMb1[21:11];  end
					1:begin Inter_blk_mvx = mvx_CurrMb1[32:22];Inter_blk_mvy = mvy_CurrMb1[32:22]; end
					0:begin Inter_blk_mvx = mvx_CurrMb1[43:33];Inter_blk_mvy = mvy_CurrMb1[43:33]; end
					endcase
				else 				//chroma 4x4 prediction
					begin Inter_blk_mvx = mvx_CurrMb1[10:0];  Inter_blk_mvy = mvy_CurrMb1[10:0];   end
			5'd20,5'd24:
				if (mv_below8x8_curr)	//chroma2x2 prediction
					case (Inter_chroma2x2_counter)
					3:begin Inter_blk_mvx = mvx_CurrMb2[10:0];  Inter_blk_mvy = mvy_CurrMb2[10:0];   end
					2:begin Inter_blk_mvx = mvx_CurrMb2[21:11]; Inter_blk_mvy = mvy_CurrMb2[21:11];  end
					1:begin Inter_blk_mvx = mvx_CurrMb2[32:22];Inter_blk_mvy = mvy_CurrMb2[32:22]; end
					0:begin Inter_blk_mvx = mvx_CurrMb2[43:33];Inter_blk_mvy = mvy_CurrMb2[43:33]; end
					endcase
				else 				//chroma 4x4 prediction
					begin Inter_blk_mvx = mvx_CurrMb2[10:0];  Inter_blk_mvy = mvy_CurrMb2[10:0];   end
			5'd21,5'd25:
				if (mv_below8x8_curr)	//chroma2x2 prediction
					case (Inter_chroma2x2_counter)
					3:begin Inter_blk_mvx = mvx_CurrMb3[10:0];  Inter_blk_mvy = mvy_CurrMb3[10:0];   end
					2:begin Inter_blk_mvx = mvx_CurrMb3[21:11]; Inter_blk_mvy = mvy_CurrMb3[21:11];  end
					1:begin Inter_blk_mvx = mvx_CurrMb3[32:22];Inter_blk_mvy = mvy_CurrMb3[32:22]; end
					0:begin Inter_blk_mvx = mvx_CurrMb3[43:33];Inter_blk_mvy = mvy_CurrMb3[43:33]; end
					endcase
				else 				//chroma 4x4 prediction
					begin Inter_blk_mvx = mvx_CurrMb3[10:0];  Inter_blk_mvy = mvy_CurrMb3[10:0];   end
			default:;
			endcase
		end
	else
		begin Inter_blk_mvx = 0;  Inter_blk_mvy = 0;   end

reg [3:0] xOffsetL,yOffsetL;
always @ (IsInterLuma or mv_below8x8_curr or intra4x4_pred_num[2] or intra4x4_pred_num[0])
	if (IsInterLuma)begin
		if (!mv_below8x8_curr)
			xOffsetL = (intra4x4_pred_num[2])? 4'd8:4'd0;
		else
			case ({intra4x4_pred_num[2],intra4x4_pred_num[0]})
			2'b00:xOffsetL = 4'd0;
			2'b01:xOffsetL = 4'd4;
			2'b10:xOffsetL = 4'd8;
			2'b11:xOffsetL = 4'd12;
			endcase
		end
	else
		xOffsetL = 0;
	
always @ (IsInterLuma or mv_below8x8_curr or intra4x4_pred_num[3] or intra4x4_pred_num[1])
	if (IsInterLuma)begin
		if (!mv_below8x8_curr)
			yOffsetL = (intra4x4_pred_num[3])? 4'd8:4'd0;
		else
			case ({intra4x4_pred_num[3],intra4x4_pred_num[1]})
			2'b00:yOffsetL = 4'd0;
			2'b01:yOffsetL = 4'd4;
			2'b10:yOffsetL = 4'd8;
			2'b11:yOffsetL = 4'd12;
			endcase
		end
	else
			yOffsetL = 0;

reg [2:0] xOffsetC,yOffsetC;
always @ (IsInterChroma or mv_below8x8_curr or intra4x4_pred_num[0] or Inter_chroma2x2_counter[0])
	if (IsInterChroma)begin
		if (mv_below8x8_curr == 1'b0)
			xOffsetC = (intra4x4_pred_num[0] == 1'b0)? 3'd0:3'd4;
		else 
			case (intra4x4_pred_num[0])
				1'b0:xOffsetC = (Inter_chroma2x2_counter[0] == 1'b1)? 3'd0:3'd2;
				1'b1:xOffsetC = (Inter_chroma2x2_counter[0] == 1'b1)? 3'd4:3'd6;
				endcase
			end
		else
			xOffsetC = 0; 
			
always @ (IsInterChroma or mv_below8x8_curr or intra4x4_pred_num or Inter_chroma2x2_counter[1])
	if (IsInterChroma)begin
		if (mv_below8x8_curr == 1'b0)
			yOffsetC = (intra4x4_pred_num == 5'd18||intra4x4_pred_num == 5'd19||
				     intra4x4_pred_num == 5'd22||intra4x4_pred_num == 5'd23)? 3'd0:3'd4;
		else 
			case (intra4x4_pred_num)
			18,19,22,23:yOffsetC = (Inter_chroma2x2_counter[1] == 1'b1)? 3'd0:3'd2;
			20,21,24,25:yOffsetC = (Inter_chroma2x2_counter[1] == 1'b1)? 3'd4:3'd6;
			default:;
			endcase
		end
	else
		yOffsetC = 3'd0;
wire [11:0] xIntL_unclip,yIntL_unclip;	// 2's complement,bit[8] is the sign bit
wire [10:0] xIntC_unclip,yIntC_unclip;	// 2's complement,bit[7] is the sign bit
assign xIntL_unclip = (IsInterLuma)?   ({1'b0,mb_num_h[6:0],4'b0} + {8'b0,xOffsetL} + {{3{Inter_blk_mvx[10]}},Inter_blk_mvx[10:2]}):0;
assign yIntL_unclip = (IsInterLuma)?   ({1'b0,mb_num_v[6:0],4'b0} + {8'b0,yOffsetL} + {{3{Inter_blk_mvy[10]}},Inter_blk_mvy[10:2]}):0;
assign xIntC_unclip = (IsInterChroma)? ({1'b0,mb_num_h[6:0],3'b0} + {8'b0,xOffsetC} + {{3{Inter_blk_mvx[10]}},Inter_blk_mvx[10:3]}):0;
assign yIntC_unclip = (IsInterChroma)? ({1'b0,mb_num_v[6:0],3'b0} + {8'b0,yOffsetC} + {{3{Inter_blk_mvy[10]}},Inter_blk_mvy[10:3]}):0;
 

wire [11:0] yInt_org_unclip;
assign xInt_org_unclip = (IsInterLuma)? xIntL_unclip:{xIntC_unclip[10],xIntC_unclip};
assign yInt_org_unclip = (IsInterLuma)? yIntL_unclip:{yIntC_unclip[10],yIntC_unclip};


wire [1:0] xFracL,yFracL;

	
assign xFracL = (IsInterLuma)?   Inter_blk_mvx[1:0]:0;
assign yFracL = (IsInterLuma)?   Inter_blk_mvy[1:0]:0;
assign xFracC = (IsInterChroma)? Inter_blk_mvx[2:0]:0;
assign yFracC = (IsInterChroma)? Inter_blk_mvy[2:0]:0;
assign pos_FracL = {xFracL,yFracL};
assign Is_InterChromaCopy = (IsInterChroma && xFracC == 0 && yFracC == 0)? 1'b1:1'b0;

always @ (posedge clk)
	if (reset_n == 1'b0)
		blk4x4_inter_preload_counter <= 0;
	//luma
	else if (trigger_blk4x4_inter_pred&&IsInterLuma)begin
		if (!mv_below8x8_curr && intra4x4_pred_num[1:0] == 2'b00)
			case (pos_FracL)
			`pos_Int                          :blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b00)? 6'd17:6'd25;
			`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:blk4x4_inter_preload_counter <= 6'd53;
			`pos_d,`pos_h,`pos_n              :blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b00)? 6'd27:6'd40;
			`pos_a,`pos_b,`pos_c              :blk4x4_inter_preload_counter <= 6'd33;
			`pos_e,`pos_g,`pos_p,`pos_r       :blk4x4_inter_preload_counter <= 6'd49;
			endcase
		else if (mv_below8x8_curr)	//partition below 8x8block
			case (pos_FracL)
			`pos_Int			  :blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b00)? 6'd5:6'd9;
			`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:blk4x4_inter_preload_counter <= 6'd28;
			`pos_d,`pos_h,`pos_n		  :blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b00)? 6'd10:6'd19;
			`pos_a,`pos_b,`pos_c		  :blk4x4_inter_preload_counter <= 6'd13;
			`pos_e,`pos_g,`pos_p,`pos_r	  :blk4x4_inter_preload_counter <= 6'd24;
			endcase	
		end
	//chroma
	else if (trigger_blk4x4_inter_pred && IsInterChroma && mv_below8x8_curr == 1'b0)begin
		if (xFracC == 0 && yFracC == 0)
			blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b00)? 6'd5:6'd9;
		else
			blk4x4_inter_preload_counter <= 6'd11;
		end
	else if (trigger_blk2x2_inter_pred && IsInterChroma && mv_below8x8_curr == 1'b1)begin
		if (xFracC == 0 && yFracC == 0)
			blk4x4_inter_preload_counter <= (xInt_org_unclip[1:0] == 2'b11)? 6'd5:6'd3;
		else
			blk4x4_inter_preload_counter <= (xInt_org_unclip[1]   == 1'b0 )? 6'd4:6'd7;end
	else if (blk4x4_inter_preload_counter != 0 && data_valid)
			blk4x4_inter_preload_counter <= blk4x4_inter_preload_counter - 1;



assign ref_frame_luma_RAM_rd = IsInterLuma &&
				 blk4x4_inter_preload_counter != 6'd0 && blk4x4_inter_preload_counter != 6'd1;

assign ref_frame_chroma_RAM_rd = IsInterChroma &&
				 blk4x4_inter_preload_counter != 6'd0 && blk4x4_inter_preload_counter != 6'd1;


wire [5:0] blk4x4_inter_preload_counter_m2;	
assign blk4x4_inter_preload_counter_m2 = (blk4x4_inter_preload_counter == 6'd0 || blk4x4_inter_preload_counter == 6'd1)?
							6'd0:(blk4x4_inter_preload_counter - 2);

reg [4:0] xInt_curr_offset;
always @ (IsInterLuma or mv_below8x8_curr or pos_FracL or xFracC or yFracC 
	or xInt_org_unclip[1:0] or blk4x4_inter_preload_counter_m2 or blk4x4_inter_preload_counter)
	if (blk4x4_inter_preload_counter != 6'd0 && blk4x4_inter_preload_counter != 6'd1)begin
		if (IsInterLuma)begin
			if (!mv_below8x8_curr)
				case (pos_FracL)
				`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
					case (blk4x4_inter_preload_counter_m2[1:0])
					2'b00:xInt_curr_offset = 5'b01010; //+10
					2'b01:xInt_curr_offset = 5'b00110; //+6
					2'b10:xInt_curr_offset = 5'b00010; //+2
					2'b11:xInt_curr_offset = 5'b11110; //-2
					endcase
				`pos_d,`pos_h,`pos_n:
					if (xInt_org_unclip[1:0] == 2'b00)
					xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0])? 5'b0:5'b00100; //+0 or +4
					else
					case (blk4x4_inter_preload_counter_m2)
					6'd38,6'd35,6'd32,6'd29,6'd26,6'd23,6'd20,6'd17,6'd14,6'd11,6'd8,6'd5,6'd2:
						xInt_curr_offset = 5'b0; 			//+0
					6'd37,6'd34,6'd31,6'd28,6'd25,6'd22,6'd19,6'd16,6'd13,6'd10,6'd7,6'd4,6'd1:
						xInt_curr_offset = 5'b00100;		//+4
					default:xInt_curr_offset = 5'b01000;//+8
					endcase
				`pos_a,`pos_b,`pos_c:
					case (blk4x4_inter_preload_counter_m2[1:0])
					2'b00:xInt_curr_offset = 5'b01010; //+10
					2'b01:xInt_curr_offset = 5'b00110; //+6
					2'b10:xInt_curr_offset = 5'b00010; //+2
					2'b11:xInt_curr_offset = 5'b11110; //-2
					endcase
				`pos_Int:
					if (xInt_org_unclip[1:0] == 2'b00)
					xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0])? 5'b0:5'b0100; //+0 or +4
					else
					case (blk4x4_inter_preload_counter_m2)
					6'd23,6'd20,6'd17,6'd14,6'd11,6'd8,6'd5,6'd2:
						xInt_curr_offset = 5'b00000;	   	//+0
					6'd22,6'd19,6'd16,6'd13,6'd10,6'd7,6'd4,6'd1:
						xInt_curr_offset = 5'b00100;	   	//+4
					default:xInt_curr_offset = 5'b01000;//+8
					endcase
				`pos_e,`pos_g,`pos_p,`pos_r:
					case (blk4x4_inter_preload_counter_m2)
					6'd47,6'd44,6'd5,6'd2:
						xInt_curr_offset = 5'b00000;	//+0
					6'd46,6'd43,6'd4,6'd1:
						xInt_curr_offset = 5'b00100;	//+4
					6'd45,6'd42,6'd3,6'd0:
						xInt_curr_offset = 5'b01000;	//+8
					default:
						case (blk4x4_inter_preload_counter_m2[1:0])
						2'b00:xInt_curr_offset = 5'b00010; //+2
						2'b01:xInt_curr_offset = 5'b11110; //-2
						2'b10:xInt_curr_offset = 5'b01010; //+10
						2'b11:xInt_curr_offset = 5'b00110; //+6
						endcase
					endcase
				endcase
			else		//block partition below 8x8
				case (pos_FracL)
				`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
					case (blk4x4_inter_preload_counter_m2)
					6'd26,6'd23,6'd20,6'd17,6'd14,6'd11,6'd8,6'd5,6'd2:xInt_curr_offset = 5'b11110;//-2
					6'd25,6'd22,6'd19,6'd16,6'd13,6'd10,6'd7,6'd4,6'd1:xInt_curr_offset = 5'b00010;//+2
					default:xInt_curr_offset = 5'b00110;											//+6
					endcase
				`pos_d,`pos_h,`pos_n:
					if (xInt_org_unclip[1:0] == 2'b00)
						xInt_curr_offset = 5'b0;	//+0
					else
						xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0])? 5'b0:5'b00100;//+0 or +4
				`pos_a,`pos_b,`pos_c:
					case (blk4x4_inter_preload_counter_m2)
					6'd11,6'd8,6'd5,6'd2:xInt_curr_offset = 5'b11110;	//-2
					6'd10,6'd7,6'd4,6'd1:xInt_curr_offset = 5'b00010;	//+2
					default:xInt_curr_offset = 5'b00110;				//+6
					endcase
				`pos_Int:
					if (xInt_org_unclip[1:0] == 2'b00)
						xInt_curr_offset = 5'b0;	//+0
					else
						xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0])? 5'b0:5'b00100;	//+0 or +4
				`pos_e,`pos_g,`pos_p,`pos_r:
					case (blk4x4_inter_preload_counter_m2)
					6'd22,6'd20,6'd3,6'd1:xInt_curr_offset = 5'b0;			//+0	
					6'd21,6'd19,6'd2,6'd0:xInt_curr_offset = 5'b00100;		//+4 
					6'd18,6'd15,6'd12,6'd9,6'd6:xInt_curr_offset = 5'b11110;//-2
					6'd17,6'd14,6'd11,6'd8,6'd5:xInt_curr_offset = 5'b00010;//+2
					6'd16,6'd13,6'd10,6'd7,6'd4:xInt_curr_offset = 5'b00110;//+6
					default:xInt_curr_offset = 5'b0;
					endcase
				endcase
			end
		else	//IsInterChroma
			begin
			if (!mv_below8x8_curr)begin
				if (xFracC == 0 && yFracC == 0)begin
					if (xInt_org_unclip[1:0] == 2'b00)
						xInt_curr_offset = 5'b0;
					else
						xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0] == 1'b1)? 5'b0:5'b0100;end
				else
					xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0] == 1'b1)? 5'b0:5'b0100;end
			else //mv_below8x8_curr == 1'b1
				begin
				if (xFracC == 0 && yFracC == 0)begin
					if (xInt_org_unclip[1:0] == 2'b11)	// 4 preload cycles
						xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0] == 1'b1)? 5'b0:5'b0100;
					else
						xInt_curr_offset = 0;end
		else begin
			if (xInt_org_unclip[1] == 1'b0)
				xInt_curr_offset = 0;
			else
				xInt_curr_offset = (blk4x4_inter_preload_counter_m2[0] == 1'b1)? 5'b0:5'b0100;
			end
		end
		end
	end
	else	//blk4x4_inter_preload_counter == 0 || blk4x4_inter_preload_counter == 1 
			xInt_curr_offset = 5'b0; 


wire [11:0] xInt_addr_unclip;
assign xInt_addr_unclip = xInt_org_unclip + {{7{xInt_curr_offset[4]}},xInt_curr_offset};


//yInt_p1:when loading from Xth line to (X-1)th line,yInt_p1 is set to 1'b1 at the last
//loading cycle of current Xth line
reg yInt_p1;
always @ (IsInterLuma or mv_below8x8_curr or pos_FracL or xFracC or yFracC 
	or blk4x4_inter_preload_counter or blk4x4_inter_preload_counter_m2 or xInt_org_unclip[1:0] or xInt_org_unclip[1])
	if (blk4x4_inter_preload_counter != 6'd0 && blk4x4_inter_preload_counter != 6'd1)begin
		if (IsInterLuma)
			case (mv_below8x8_curr)
			1'b0:
				case (pos_FracL)
				`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
					yInt_p1 = (blk4x4_inter_preload_counter_m2[1:0] == 2'b00)? 1'b1:1'b0;
				`pos_d,`pos_h,`pos_n:
					if (xInt_org_unclip[1:0] == 2'b00)
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
					else
						case (blk4x4_inter_preload_counter_m2)
						6'd36,6'd33,6'd30,6'd27,6'd24,6'd21,6'd18,6'd15,6'd12,6'd9,6'd6,6'd3,6'd0:
							yInt_p1 = 1'b1;
						default:yInt_p1 = 1'b0;
						endcase
				`pos_a,`pos_b,`pos_c:
					yInt_p1 = (blk4x4_inter_preload_counter_m2[1:0] == 2'b00)? 1'b1:1'b0;
				`pos_Int:
					if (xInt_org_unclip[1:0] == 2'b00)
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
					else
						case (blk4x4_inter_preload_counter_m2)
						6'd21,6'd18,6'd15,6'd12,6'd9,6'd6,6'd3,6'd0:yInt_p1 = 1'b1;
						default:				    yInt_p1 = 1'b0;
						endcase
				`pos_e,`pos_g,`pos_p,`pos_r:
					case (blk4x4_inter_preload_counter_m2)
					6'd45,6'd42,6'd3,6'd0:yInt_p1 = 1'b1;
					6'd6,6'd10,6'd14,6'd18,6'd22,6'd26,6'd30,6'd34,6'd38:yInt_p1 = 1'b1;
					default:yInt_p1 = 1'b0;
					endcase
				endcase
			1'b1:		//block partition below 8x8
				case (pos_FracL)
				`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
					case (blk4x4_inter_preload_counter_m2)
					6'd24,6'd21,6'd18,6'd15,6'd12,6'd9,6'd6,6'd3,6'd0:yInt_p1 = 1'b1;
					default:yInt_p1 = 1'b0;
					endcase
				`pos_d,`pos_h,`pos_n:
					if (xInt_org_unclip[1:0] == 2'b00)
						yInt_p1 = 1'b1;	
					else
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
				`pos_a,`pos_b,`pos_c:
					case (blk4x4_inter_preload_counter_m2)
					6'd9,6'd6,6'd3,6'd0	:yInt_p1 = 1'b1;
					default				:yInt_p1 = 1'b0;
					endcase
				`pos_Int:
					if (xInt_org_unclip[1:0] == 2'b00)
						yInt_p1 = 1'b1;
					else
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
				`pos_e,`pos_g,`pos_p,`pos_r:
					case (blk4x4_inter_preload_counter_m2)
					6'd21,6'd19,6'd2,6'd0		:yInt_p1 = 1'b1;
					6'd4,6'd7,6'd10,6'd13,6'd16	:yInt_p1 = 1'b1;
					default				:yInt_p1 = 1'b0;
					endcase
				endcase
			endcase
		else	//IsInterChroma
			case (mv_below8x8_curr)
			1'b0:
				if (xFracC == 0 && yFracC == 0)begin
					if (xInt_org_unclip[1:0] == 2'b00)
						yInt_p1 = 1'b1;
					else
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
					end
				else
					yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
			1'b1:
				if (xFracC == 0 && yFracC == 0)begin
					if (xInt_org_unclip[1:0] != 2'b11)
						yInt_p1 = 1'b1;
					else
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
					end
				else begin
					if (xInt_org_unclip[1] == 1'b0)
						yInt_p1 = 1'b1;
					else 
						yInt_p1 = (blk4x4_inter_preload_counter_m2[0] == 1'b0)? 1'b1:1'b0;
					end
			endcase
		end
	else	// blk4x4_inter_preload_counter == 0 || blk4x4_inter_preload_counter == 1			
		yInt_p1 = 1'b0; 
	
	//Derive unclipped y pos for each preload cycle
reg [11:0] yInt_addr_unclip;
always @ (posedge clk)
	if (reset_n == 1'b0)
		yInt_addr_unclip <= 0;
	else if ((IsInterLuma && (trigger_blk4x4_inter_pred && (mv_below8x8_curr ||
		(!mv_below8x8_curr && intra4x4_pred_num[1:0] == 2'b00)))) ||
		(IsInterChroma && (!mv_below8x8_curr && trigger_blk4x4_inter_pred) ||
					(mv_below8x8_curr && trigger_blk2x2_inter_pred)))begin
		if (IsInterLuma)	//Luma
			case (pos_FracL)
			`pos_a,`pos_b,`pos_c,`pos_Int:
				yInt_addr_unclip <= yInt_org_unclip;
			default:				//need -2 here
				yInt_addr_unclip <= yInt_org_unclip + 12'b111111111110;
			endcase
		else			   //Chroma
			yInt_addr_unclip <= yInt_org_unclip;
		end
	else if (blk4x4_inter_preload_counter_m2 != 0 && yInt_p1 == 1'b1 && data_valid )
			yInt_addr_unclip <= yInt_addr_unclip + 1;
		
reg [10:0] xInt_addr,yInt_addr;
wire [10:0] pic_width,pic_height;

assign pic_width = {(pic_width_in_mbs_minus1[6:0] + 7'b1),4'd0};
assign pic_height= {(pic_height_in_map_units_minus1[6:0] + 7'b1),4'd0};
assign x_overflow =  (xInt_addr_unclip[11] == 1'b0)&&((IsInterLuma&&(xInt_addr_unclip[10:0] > (pic_width - 1)))||
		     (IsInterChroma&&(xInt_addr_unclip[10:0] > ({1'b0,pic_width[10:1]} - 1))));
assign x_less_than_zero = xInt_addr_unclip[11] == 1'b1&&(IsInterLuma||IsInterChroma);

always @ (xInt_addr_unclip or IsInterLuma or IsInterChroma)
	if (xInt_addr_unclip[11] == 1'b1)	//negative
		xInt_addr = 0;
	else if (IsInterLuma)
		xInt_addr = (xInt_addr_unclip[10:0] > (pic_width - 4))? (pic_width - 4):xInt_addr_unclip[10:0];
	else if (IsInterChroma)
		xInt_addr = (xInt_addr_unclip[10:0] > ({1'b0,pic_width[10:1]} - 4))? ({1'b0,pic_width[10:1]} - 4):xInt_addr_unclip[10:0];
	else
		xInt_addr = 0;

always @ (yInt_addr_unclip or IsInterLuma or IsInterChroma)
	if (yInt_addr_unclip[11] == 1'b1)	//negative
		yInt_addr = 0;
	else if (IsInterLuma)
		yInt_addr = (yInt_addr_unclip[10:0] > (pic_height - 1))? (pic_height - 1):yInt_addr_unclip[10:0];
	else if (IsInterChroma)
		yInt_addr = (yInt_addr_unclip[10:0] > ({1'b0,pic_height[10:1]} - 1))? ({1'b0,pic_height[10:1]} - 1):yInt_addr_unclip[10:0];
	else
		yInt_addr = 0;

wire cr_or_cb;
assign cr_or_cb = (intra4x4_pred_num == 22||intra4x4_pred_num == 23||intra4x4_pred_num == 24||intra4x4_pred_num == 25);
assign final_frame_luma_rd_addr = IsInterLuma?{xInt_addr[10:2],yInt_addr}:0;
assign final_frame_chroma_rd_addr = IsInterChroma?{cr_or_cb,xInt_addr[9:2],yInt_addr[9:0]}:0;



always @ (posedge clk)
	if (reset_n == 1'b0)
		read_end <= 0;
	//luma
	else if (IsInterLuma && ((!mv_below8x8_curr && (
				(intra4x4_pred_num[1:0] == 2'b00 && blk4x4_inter_preload_counter == 1) || 
				(intra4x4_pred_num[1:0] != 2'b00 && trigger_blk4x4_inter_pred))) ||
				(mv_below8x8_curr && blk4x4_inter_preload_counter == 1))) 
		read_end <= 1;
	//chroma
	else if (blk4x4_inter_preload_counter == 1 && IsInterChroma == 1'b1)
		read_end <= 1;
	else    read_end <= 0;
endmodule
