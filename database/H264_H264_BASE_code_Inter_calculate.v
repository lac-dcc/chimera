`include "timescale.v"
`include "define.v"

module Inter_calculate(
input clk,reset_n,
input [5:0] blk4x4_inter_preload_counter,
input [1:0] Inter_chroma2x2_counter,
input [4:0] intra4x4_pred_num,
input [31:0] final_frame_luma_RAM_dout,final_frame_chroma_RAM_dout,
input IsInterLuma,IsInterChroma,
input Is_InterChromaCopy,
input [1:0] xInt_org_unclip_1to0,
input [3:0] pos_FracL,
input [2:0] xFracC,yFracC,
input mv_below8x8_curr,
input trigger_blk4x4_inter_pred,
input data_valid,
input x_overflow,x_less_than_zero,

output reg [3:0] blk4x4_inter_calculate_counter,
output reg [7:0] LPE0_out,LPE1_out,LPE2_out,LPE3_out,
output  [7:0] CPE0_out,CPE1_out,CPE2_out,CPE3_out,
output reg [7:0] Inter_pix_copy0,Inter_pix_copy1,Inter_pix_copy2,Inter_pix_copy3,
output calulate_end

	

);
reg [14:0] b0_raw_reg,b1_raw_reg,b2_raw_reg,b3_raw_reg,b4_raw_reg,b5_raw_reg,b6_raw_reg,b7_raw_reg,b8_raw_reg;
reg [7:0] b0_reg,b1_reg,b2_reg,b3_reg,h0_reg,h1_reg,h2_reg,h3_reg;
reg [7:0] Inter_ref_00_00,Inter_ref_01_00,Inter_ref_02_00,Inter_ref_03_00,Inter_ref_04_00,Inter_ref_05_00;
reg [7:0] Inter_ref_06_00,Inter_ref_07_00,Inter_ref_08_00,Inter_ref_09_00,Inter_ref_10_00,Inter_ref_11_00,Inter_ref_12_00;
reg [7:0] Inter_ref_00_01,Inter_ref_01_01,Inter_ref_02_01,Inter_ref_03_01,Inter_ref_04_01,Inter_ref_05_01;
reg [7:0] Inter_ref_06_01,Inter_ref_07_01,Inter_ref_08_01,Inter_ref_09_01,Inter_ref_10_01,Inter_ref_11_01,Inter_ref_12_01;
reg [7:0] Inter_ref_00_02,Inter_ref_01_02,Inter_ref_02_02,Inter_ref_03_02,Inter_ref_04_02,Inter_ref_05_02;
reg [7:0] Inter_ref_06_02,Inter_ref_07_02,Inter_ref_08_02,Inter_ref_09_02,Inter_ref_10_02,Inter_ref_11_02,Inter_ref_12_02;
reg [7:0] Inter_ref_00_03,Inter_ref_01_03,Inter_ref_02_03,Inter_ref_03_03,Inter_ref_04_03,Inter_ref_05_03;
reg [7:0] Inter_ref_06_03,Inter_ref_07_03,Inter_ref_08_03,Inter_ref_09_03,Inter_ref_10_03,Inter_ref_11_03,Inter_ref_12_03;
reg [7:0] Inter_ref_00_04,Inter_ref_01_04,Inter_ref_02_04,Inter_ref_03_04,Inter_ref_04_04,Inter_ref_05_04;
reg [7:0] Inter_ref_06_04,Inter_ref_07_04,Inter_ref_08_04,Inter_ref_09_04,Inter_ref_10_04,Inter_ref_11_04,Inter_ref_12_04;
reg [7:0] Inter_ref_00_05,Inter_ref_01_05,Inter_ref_02_05,Inter_ref_03_05,Inter_ref_04_05,Inter_ref_05_05;
reg [7:0] Inter_ref_06_05,Inter_ref_07_05,Inter_ref_08_05,Inter_ref_09_05,Inter_ref_10_05,Inter_ref_11_05,Inter_ref_12_05;
reg [7:0] Inter_ref_00_06,Inter_ref_01_06,Inter_ref_02_06,Inter_ref_03_06,Inter_ref_04_06,Inter_ref_05_06;
reg [7:0] Inter_ref_06_06,Inter_ref_07_06,Inter_ref_08_06,Inter_ref_09_06,Inter_ref_10_06,Inter_ref_11_06,Inter_ref_12_06;
reg [7:0] Inter_ref_00_07,Inter_ref_01_07,Inter_ref_02_07,Inter_ref_03_07,Inter_ref_04_07,Inter_ref_05_07;
reg [7:0] Inter_ref_06_07,Inter_ref_07_07,Inter_ref_08_07,Inter_ref_09_07,Inter_ref_10_07,Inter_ref_11_07,Inter_ref_12_07;
reg [7:0] Inter_ref_00_08,Inter_ref_01_08,Inter_ref_02_08,Inter_ref_03_08,Inter_ref_04_08,Inter_ref_05_08;
reg [7:0] Inter_ref_06_08,Inter_ref_07_08,Inter_ref_08_08,Inter_ref_09_08,Inter_ref_10_08,Inter_ref_11_08,Inter_ref_12_08;
reg [7:0] Inter_ref_00_09,Inter_ref_01_09,Inter_ref_02_09,Inter_ref_03_09,Inter_ref_04_09,Inter_ref_05_09;
reg [7:0] Inter_ref_06_09,Inter_ref_07_09,Inter_ref_08_09,Inter_ref_09_09,Inter_ref_10_09,Inter_ref_11_09,Inter_ref_12_09;
reg [7:0] Inter_ref_00_10,Inter_ref_01_10,Inter_ref_02_10,Inter_ref_03_10,Inter_ref_04_10,Inter_ref_05_10;
reg [7:0] Inter_ref_06_10,Inter_ref_07_10,Inter_ref_08_10,Inter_ref_09_10,Inter_ref_10_10,Inter_ref_11_10,Inter_ref_12_10;
reg [7:0] Inter_ref_00_11,Inter_ref_01_11,Inter_ref_02_11,Inter_ref_03_11,Inter_ref_04_11,Inter_ref_05_11;
reg [7:0] Inter_ref_06_11,Inter_ref_07_11,Inter_ref_08_11,Inter_ref_09_11,Inter_ref_10_11,Inter_ref_11_11,Inter_ref_12_11;
reg [7:0] Inter_ref_00_12,Inter_ref_01_12,Inter_ref_02_12,Inter_ref_03_12,Inter_ref_04_12,Inter_ref_05_12;
reg [7:0] Inter_ref_06_12,Inter_ref_07_12,Inter_ref_08_12,Inter_ref_09_12,Inter_ref_10_12,Inter_ref_11_12,Inter_ref_12_12;

reg [7:0] Inter_H_window_0_0,Inter_H_window_1_0,Inter_H_window_2_0,Inter_H_window_3_0,Inter_H_window_4_0,Inter_H_window_5_0;
reg [7:0] Inter_H_window_0_1,Inter_H_window_1_1,Inter_H_window_2_1,Inter_H_window_3_1,Inter_H_window_4_1,Inter_H_window_5_1;
reg [7:0] Inter_H_window_0_2,Inter_H_window_1_2,Inter_H_window_2_2,Inter_H_window_3_2,Inter_H_window_4_2,Inter_H_window_5_2;
reg [7:0] Inter_H_window_0_3,Inter_H_window_1_3,Inter_H_window_2_3,Inter_H_window_3_3,Inter_H_window_4_3,Inter_H_window_5_3;
reg [7:0] Inter_H_window_0_4,Inter_H_window_1_4,Inter_H_window_2_4,Inter_H_window_3_4,Inter_H_window_4_4,Inter_H_window_5_4;
reg [7:0] Inter_H_window_0_5,Inter_H_window_1_5,Inter_H_window_2_5,Inter_H_window_3_5,Inter_H_window_4_5,Inter_H_window_5_5;
reg [7:0] Inter_H_window_0_6,Inter_H_window_1_6,Inter_H_window_2_6,Inter_H_window_3_6,Inter_H_window_4_6,Inter_H_window_5_6;
reg [7:0] Inter_H_window_0_7,Inter_H_window_1_7,Inter_H_window_2_7,Inter_H_window_3_7,Inter_H_window_4_7,Inter_H_window_5_7;
reg [7:0] Inter_H_window_0_8,Inter_H_window_1_8,Inter_H_window_2_8,Inter_H_window_3_8,Inter_H_window_4_8,Inter_H_window_5_8;
reg [7:0] Inter_V_window_0,Inter_V_window_1,Inter_V_window_2,Inter_V_window_3,Inter_V_window_4;
reg [7:0] Inter_V_window_5,Inter_V_window_6,Inter_V_window_7,Inter_V_window_8;
reg [7:0] Inter_C_window_0_0,Inter_C_window_1_0,Inter_C_window_2_0;
reg [7:0] Inter_C_window_0_1,Inter_C_window_1_1,Inter_C_window_2_1;
reg [7:0] Inter_C_window_0_2,Inter_C_window_1_2,Inter_C_window_2_2;
reg [7:0] Inter_bi_window_0,Inter_bi_window_1,Inter_bi_window_2,Inter_bi_window_3;



always @ (posedge clk)
	if (reset_n == 1'b0)
		blk4x4_inter_calculate_counter <= 0;
	//luma
	else if (IsInterLuma && ((!mv_below8x8_curr && (
				(intra4x4_pred_num[1:0] == 2'b00 && blk4x4_inter_preload_counter == 1) || 
				(intra4x4_pred_num[1:0] != 2'b00 && trigger_blk4x4_inter_pred))) ||
						(mv_below8x8_curr && blk4x4_inter_preload_counter == 1))) 
		case (pos_FracL)
		`pos_j,`pos_f,`pos_q:blk4x4_inter_calculate_counter <= 4'd5;
		`pos_i,`pos_k       :blk4x4_inter_calculate_counter <= 4'd8;
		default             :blk4x4_inter_calculate_counter <= 4'd4;
		endcase
	//chroma
	else if (blk4x4_inter_preload_counter == 1 && IsInterChroma == 1'b1)
		case (mv_below8x8_curr)
		1'b0:blk4x4_inter_calculate_counter <= 4'd4;
		1'b1:blk4x4_inter_calculate_counter <= 4'd1;
		endcase
	else if (blk4x4_inter_calculate_counter != 0)
		blk4x4_inter_calculate_counter <= blk4x4_inter_calculate_counter - 1;



wire Is_blk4x4_0;//When inter 8x8(or above) predicted: top-left blk4x4
					 //When inter 4x4           predicted: each blk4x4
wire Is_blk4x4_1;
wire Is_blk4x4_2;
wire Is_blk4x4_3;

assign Is_blk4x4_0 = (IsInterLuma && (mv_below8x8_curr || (!mv_below8x8_curr && 
							intra4x4_pred_num[1:0] == 2'b00))); 									//top-left
assign Is_blk4x4_1 = (IsInterLuma && (!mv_below8x8_curr && intra4x4_pred_num[1:0] == 2'b01));	//top-right
assign Is_blk4x4_2 = (IsInterLuma && (!mv_below8x8_curr && intra4x4_pred_num[1:0] == 2'b10));	//bottom-left
assign Is_blk4x4_3 = (IsInterLuma && (!mv_below8x8_curr && intra4x4_pred_num[1:0] == 2'b11)); 	//bottom-right

always @ (IsInterLuma or pos_FracL or blk4x4_inter_calculate_counter
		or Is_blk4x4_0 or Is_blk4x4_1 or Is_blk4x4_2 or Is_blk4x4_3 or Is_InterChromaCopy or mv_below8x8_curr
		or Inter_ref_00_00 or Inter_ref_01_00 or Inter_ref_02_00 or Inter_ref_03_00
		or Inter_ref_00_01 or Inter_ref_01_01 or Inter_ref_02_01 or Inter_ref_03_01
		or Inter_ref_00_02 or Inter_ref_01_02 or Inter_ref_02_02 or Inter_ref_03_02 
		or Inter_ref_04_02 or Inter_ref_05_02 or Inter_ref_06_02 or Inter_ref_07_02 
		or Inter_ref_08_02 or Inter_ref_09_02 or Inter_ref_00_03 or Inter_ref_01_03
		or Inter_ref_02_03 or Inter_ref_03_03 or Inter_ref_04_03 or Inter_ref_05_03
		or Inter_ref_06_03 or Inter_ref_07_03 or Inter_ref_08_03 or Inter_ref_09_03
		or Inter_ref_02_04 or Inter_ref_03_04 or Inter_ref_04_04 or Inter_ref_05_04
		or Inter_ref_06_04 or Inter_ref_07_04 or Inter_ref_08_04 or Inter_ref_09_04
		or Inter_ref_02_05 or Inter_ref_03_05 or Inter_ref_04_05 or Inter_ref_05_05
		or Inter_ref_06_05 or Inter_ref_07_05 or Inter_ref_08_05 or Inter_ref_09_05
		or Inter_ref_02_06 or Inter_ref_03_06 or Inter_ref_04_06 or Inter_ref_05_06
		or Inter_ref_06_06 or Inter_ref_07_06 or Inter_ref_08_06 or Inter_ref_09_06
		or Inter_ref_02_07 or Inter_ref_03_07 or Inter_ref_04_07 or Inter_ref_05_07
		or Inter_ref_06_07 or Inter_ref_07_07 or Inter_ref_08_07 or Inter_ref_09_07
		or Inter_ref_02_08 or Inter_ref_03_08 or Inter_ref_04_08 or Inter_ref_05_08
		or Inter_ref_06_08 or Inter_ref_07_08 or Inter_ref_08_08 or Inter_ref_09_08
		or Inter_ref_02_09 or Inter_ref_03_09 or Inter_ref_04_09 or Inter_ref_05_09
		or Inter_ref_06_09 or Inter_ref_07_09 or Inter_ref_08_09 or Inter_ref_09_09)
		if (IsInterLuma && pos_FracL == `pos_Int)
			case ({Is_blk4x4_0,Is_blk4x4_1,Is_blk4x4_2,Is_blk4x4_3})
				4'b1000:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_pix_copy0 = Inter_ref_02_02;	Inter_pix_copy1 = Inter_ref_02_03;
							Inter_pix_copy2 = Inter_ref_02_04;	Inter_pix_copy3 = Inter_ref_02_05;end
					4'd3:begin	Inter_pix_copy0 = Inter_ref_03_02;	Inter_pix_copy1 = Inter_ref_03_03;
							Inter_pix_copy2 = Inter_ref_03_04;	Inter_pix_copy3 = Inter_ref_03_05;end
					4'd2:begin	Inter_pix_copy0 = Inter_ref_04_02;	Inter_pix_copy1 = Inter_ref_04_03;
							Inter_pix_copy2 = Inter_ref_04_04;	Inter_pix_copy3 = Inter_ref_04_05;end
					4'd1:begin	Inter_pix_copy0 = Inter_ref_05_02;	Inter_pix_copy1 = Inter_ref_05_03;
							Inter_pix_copy2 = Inter_ref_05_04;	Inter_pix_copy3 = Inter_ref_05_05;end
					default:begin	Inter_pix_copy0 = 0;	Inter_pix_copy1 = 0;
							Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;end
			  	endcase
				4'b0100:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_pix_copy0 = Inter_ref_06_02;	Inter_pix_copy1 = Inter_ref_06_03;
							Inter_pix_copy2 = Inter_ref_06_04;	Inter_pix_copy3 = Inter_ref_06_05;end
					4'd3:begin	Inter_pix_copy0 = Inter_ref_07_02;	Inter_pix_copy1 = Inter_ref_07_03;
							Inter_pix_copy2 = Inter_ref_07_04;	Inter_pix_copy3 = Inter_ref_07_05;end
					4'd2:begin	Inter_pix_copy0 = Inter_ref_08_02;	Inter_pix_copy1 = Inter_ref_08_03;
							Inter_pix_copy2 = Inter_ref_08_04;	Inter_pix_copy3 = Inter_ref_08_05;end
					4'd1:begin	Inter_pix_copy0 = Inter_ref_09_02;	Inter_pix_copy1 = Inter_ref_09_03;
							Inter_pix_copy2 = Inter_ref_09_04;	Inter_pix_copy3 = Inter_ref_09_05;end
					default:begin	Inter_pix_copy0 = 0;	Inter_pix_copy1 = 0;
							Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;end
			  	endcase 
				4'b0010:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_pix_copy0 = Inter_ref_02_06;	Inter_pix_copy1 = Inter_ref_02_07;
							Inter_pix_copy2 = Inter_ref_02_08;	Inter_pix_copy3 = Inter_ref_02_09;end
					4'd3:begin	Inter_pix_copy0 = Inter_ref_03_06;	Inter_pix_copy1 = Inter_ref_03_07;
							Inter_pix_copy2 = Inter_ref_03_08;	Inter_pix_copy3 = Inter_ref_03_09;end
					4'd2:begin	Inter_pix_copy0 = Inter_ref_04_06;	Inter_pix_copy1 = Inter_ref_04_07;
							Inter_pix_copy2 = Inter_ref_04_08;	Inter_pix_copy3 = Inter_ref_04_09;end
					4'd1:begin	Inter_pix_copy0 = Inter_ref_05_06;	Inter_pix_copy1 = Inter_ref_05_07;
							Inter_pix_copy2 = Inter_ref_05_08;	Inter_pix_copy3 = Inter_ref_05_09;end
					default:begin	Inter_pix_copy0 = 0;	Inter_pix_copy1 = 0;
							Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;end
			  	endcase
				4'b0001:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_pix_copy0 = Inter_ref_06_06;	Inter_pix_copy1 = Inter_ref_06_07;
							Inter_pix_copy2 = Inter_ref_06_08;	Inter_pix_copy3 = Inter_ref_06_09;end
					4'd3:begin	Inter_pix_copy0 = Inter_ref_07_06;	Inter_pix_copy1 = Inter_ref_07_07;
							Inter_pix_copy2 = Inter_ref_07_08;	Inter_pix_copy3 = Inter_ref_07_09;end
					4'd2:begin	Inter_pix_copy0 = Inter_ref_08_06;	Inter_pix_copy1 = Inter_ref_08_07;
							Inter_pix_copy2 = Inter_ref_08_08;	Inter_pix_copy3 = Inter_ref_08_09;end
					4'd1:begin	Inter_pix_copy0 = Inter_ref_09_06;	Inter_pix_copy1 = Inter_ref_09_07;
							Inter_pix_copy2 = Inter_ref_09_08;	Inter_pix_copy3 = Inter_ref_09_09;end
					default:begin	Inter_pix_copy0 = 0;	Inter_pix_copy1 = 0;
							Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;end
			  	endcase
				default:begin	Inter_pix_copy0 = 0;	Inter_pix_copy1 = 0;
						Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;end
			endcase
		else if (Is_InterChromaCopy)
			case (mv_below8x8_curr)
				1'b1://only one cycle
				begin
					Inter_pix_copy0 = (blk4x4_inter_calculate_counter != 0)? Inter_ref_00_00:0;
					Inter_pix_copy1 = (blk4x4_inter_calculate_counter != 0)? Inter_ref_01_00:0;
					Inter_pix_copy2 = (blk4x4_inter_calculate_counter != 0)? Inter_ref_00_01:0;
					Inter_pix_copy3 = (blk4x4_inter_calculate_counter != 0)? Inter_ref_01_01:0;
				end
				1'b0://4 cycles,each cycle for one blk2x2 in blk2x2-zig-zag order
					case (blk4x4_inter_calculate_counter)
						4'd4:
						begin 
							Inter_pix_copy0 = Inter_ref_00_00; Inter_pix_copy1 = Inter_ref_01_00;
							Inter_pix_copy2 = Inter_ref_00_01; Inter_pix_copy3 = Inter_ref_01_01;
						end
						4'd3:
						begin
							Inter_pix_copy0 = Inter_ref_02_00; Inter_pix_copy1 = Inter_ref_03_00;
							Inter_pix_copy2 = Inter_ref_02_01; Inter_pix_copy3 = Inter_ref_03_01;
						end
						4'd2:
						begin
							Inter_pix_copy0 = Inter_ref_00_02; Inter_pix_copy1 = Inter_ref_01_02;
							Inter_pix_copy2 = Inter_ref_00_03; Inter_pix_copy3 = Inter_ref_01_03;
						end
						4'd1:
						begin
							Inter_pix_copy0 = Inter_ref_02_02; Inter_pix_copy1 = Inter_ref_03_02;
							Inter_pix_copy2 = Inter_ref_02_03; Inter_pix_copy3 = Inter_ref_03_03;
						end
						default:
						begin
							Inter_pix_copy0 = 0; Inter_pix_copy1 = 0;	Inter_pix_copy2 = 0;	Inter_pix_copy3 = 0;
						end
					endcase
			endcase
		else begin	
			Inter_pix_copy0 = 0; Inter_pix_copy1 = 0; Inter_pix_copy2 = 0; Inter_pix_copy3 = 0; end

reg [2:0] Inter_H_window_counter0;
always @ (pos_FracL or blk4x4_inter_calculate_counter)
	if  ((pos_FracL == `pos_j && blk4x4_inter_calculate_counter == 4'd5) 			||
	((pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd5)||
	((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd8))
			Inter_H_window_counter0 = 3'd4;
	else if ((pos_FracL == `pos_j && blk4x4_inter_calculate_counter == 4'd4) 			||
		((pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd4)||
		((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd6))
			Inter_H_window_counter0 = 3'd3;
	else if ((pos_FracL == `pos_j && blk4x4_inter_calculate_counter == 4'd3) 			||
		((pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd3)||
		((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd4))
			Inter_H_window_counter0 = 3'd2;
	else if ((pos_FracL == `pos_j && blk4x4_inter_calculate_counter == 4'd2) 			||
		((pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd2)||
		((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd2))
			Inter_H_window_counter0 = 3'd1;
	else
			Inter_H_window_counter0 = 0;


always @ (Is_blk4x4_0 or Is_blk4x4_1 or Is_blk4x4_2 or Is_blk4x4_3 or Inter_H_window_counter0
		or Inter_ref_00_00 or Inter_ref_01_00 or Inter_ref_02_00 or Inter_ref_03_00
		or Inter_ref_04_00 or Inter_ref_05_00 or Inter_ref_06_00 or Inter_ref_07_00
		or Inter_ref_08_00 or Inter_ref_09_00 or Inter_ref_10_00 or Inter_ref_11_00 or Inter_ref_12_00
		or Inter_ref_00_01 or Inter_ref_01_01 or Inter_ref_02_01 or Inter_ref_03_01
		or Inter_ref_04_01 or Inter_ref_05_01 or Inter_ref_06_01 or Inter_ref_07_01
		or Inter_ref_08_01 or Inter_ref_09_01 or Inter_ref_10_01 or Inter_ref_11_01 or Inter_ref_12_01
		or Inter_ref_00_06 or Inter_ref_01_06 or Inter_ref_02_06 or Inter_ref_03_06
		or Inter_ref_04_06 or Inter_ref_05_06 or Inter_ref_06_06 or Inter_ref_07_06
		or Inter_ref_08_06 or Inter_ref_09_06 or Inter_ref_10_06 or Inter_ref_11_06 or Inter_ref_12_06
		or Inter_ref_00_07 or Inter_ref_01_07 or Inter_ref_02_07 or Inter_ref_03_07
		or Inter_ref_04_07 or Inter_ref_05_07 or Inter_ref_06_07 or Inter_ref_07_07
		or Inter_ref_08_07 or Inter_ref_09_07 or Inter_ref_10_07 or Inter_ref_11_07 or Inter_ref_12_07
		or Inter_ref_00_08 or Inter_ref_01_08 or Inter_ref_02_08 or Inter_ref_03_08
		or Inter_ref_04_08 or Inter_ref_05_08 or Inter_ref_06_08 or Inter_ref_07_08
		or Inter_ref_08_08 or Inter_ref_09_08 or Inter_ref_10_08 or Inter_ref_11_08 or Inter_ref_12_08 
		or Inter_ref_00_04 or Inter_ref_01_04 or Inter_ref_02_04 or Inter_ref_03_04
		or Inter_ref_04_04 or Inter_ref_05_04 or Inter_ref_06_04 or Inter_ref_07_04
		or Inter_ref_08_04 or Inter_ref_09_04 or Inter_ref_10_04 or Inter_ref_11_04 or Inter_ref_12_04
		or Inter_ref_00_05 or Inter_ref_01_05 or Inter_ref_02_05 or Inter_ref_03_05
		or Inter_ref_04_05 or Inter_ref_05_05 or Inter_ref_06_05 or Inter_ref_07_05
		or Inter_ref_08_05 or Inter_ref_09_05 or Inter_ref_10_05 or Inter_ref_11_05 or Inter_ref_12_05
		or Inter_ref_00_10 or Inter_ref_01_10 or Inter_ref_02_10 or Inter_ref_03_10
		or Inter_ref_04_10 or Inter_ref_05_10 or Inter_ref_06_10 or Inter_ref_07_10
		or Inter_ref_08_10 or Inter_ref_09_10 or Inter_ref_10_10 or Inter_ref_11_10 or Inter_ref_12_10 
		or Inter_ref_00_11 or Inter_ref_01_11 or Inter_ref_02_11 or Inter_ref_03_11
		or Inter_ref_04_11 or Inter_ref_05_11 or Inter_ref_06_11 or Inter_ref_07_11
		or Inter_ref_08_11 or Inter_ref_09_11 or Inter_ref_10_11 or Inter_ref_11_11 or Inter_ref_12_11
		or Inter_ref_00_12 or Inter_ref_01_12 or Inter_ref_02_12 or Inter_ref_03_12
		or Inter_ref_04_12 or Inter_ref_05_12 or Inter_ref_06_12 or Inter_ref_07_12
		or Inter_ref_08_12 or Inter_ref_09_12 or Inter_ref_10_12 or Inter_ref_11_12 or Inter_ref_12_12 
		)
		case ({Is_blk4x4_0,Is_blk4x4_1,Is_blk4x4_2,Is_blk4x4_3}) 
		4'b1000: //Left top blk4x4
			case (Inter_H_window_counter0)
			3'd4:begin 	
				Inter_H_window_0_0 = Inter_ref_00_00;Inter_H_window_1_0 = Inter_ref_01_00;
				Inter_H_window_2_0 = Inter_ref_02_00;Inter_H_window_3_0 = Inter_ref_03_00;
				Inter_H_window_4_0 = Inter_ref_04_00;Inter_H_window_5_0 = Inter_ref_05_00;
				Inter_H_window_0_1 = Inter_ref_00_01;Inter_H_window_1_1 = Inter_ref_01_01; 
				Inter_H_window_2_1 = Inter_ref_02_01;Inter_H_window_3_1 = Inter_ref_03_01;
				Inter_H_window_4_1 = Inter_ref_04_01;Inter_H_window_5_1 = Inter_ref_05_01;
				Inter_H_window_0_6 = Inter_ref_00_06;Inter_H_window_1_6 = Inter_ref_01_06; 
				Inter_H_window_2_6 = Inter_ref_02_06;Inter_H_window_3_6 = Inter_ref_03_06;
				Inter_H_window_4_6 = Inter_ref_04_06;Inter_H_window_5_6 = Inter_ref_05_06;					
				Inter_H_window_0_7 = Inter_ref_00_07;Inter_H_window_1_7 = Inter_ref_01_07; 
				Inter_H_window_2_7 = Inter_ref_02_07;Inter_H_window_3_7 = Inter_ref_03_07;
				Inter_H_window_4_7 = Inter_ref_04_07;Inter_H_window_5_7 = Inter_ref_05_07;						
				Inter_H_window_0_8 = Inter_ref_00_08;Inter_H_window_1_8 = Inter_ref_01_08; 
				Inter_H_window_2_8 = Inter_ref_02_08;Inter_H_window_3_8 = Inter_ref_03_08;
				Inter_H_window_4_8 = Inter_ref_04_08;Inter_H_window_5_8 = Inter_ref_05_08;end
			3'd3:begin 	
				Inter_H_window_0_0 = Inter_ref_01_00;Inter_H_window_1_0 = Inter_ref_02_00;
				Inter_H_window_2_0 = Inter_ref_03_00;Inter_H_window_3_0 = Inter_ref_04_00;
				Inter_H_window_4_0 = Inter_ref_05_00;Inter_H_window_5_0 = Inter_ref_06_00;						
				Inter_H_window_0_1 = Inter_ref_01_01;Inter_H_window_1_1 = Inter_ref_02_01; 
				Inter_H_window_2_1 = Inter_ref_03_01;Inter_H_window_3_1 = Inter_ref_04_01;
				Inter_H_window_4_1 = Inter_ref_05_01;Inter_H_window_5_1 = Inter_ref_06_01;						
				Inter_H_window_0_6 = Inter_ref_01_06;Inter_H_window_1_6 = Inter_ref_02_06; 
				Inter_H_window_2_6 = Inter_ref_03_06;Inter_H_window_3_6 = Inter_ref_04_06;
				Inter_H_window_4_6 = Inter_ref_05_06;Inter_H_window_5_6 = Inter_ref_06_06;			
				Inter_H_window_0_7 = Inter_ref_01_07;Inter_H_window_1_7 = Inter_ref_02_07; 
				Inter_H_window_2_7 = Inter_ref_03_07;Inter_H_window_3_7 = Inter_ref_04_07;
				Inter_H_window_4_7 = Inter_ref_05_07;Inter_H_window_5_7 = Inter_ref_06_07;			
				Inter_H_window_0_8 = Inter_ref_01_08;Inter_H_window_1_8 = Inter_ref_02_08; 
				Inter_H_window_2_8 = Inter_ref_03_08;Inter_H_window_3_8 = Inter_ref_04_08;
				Inter_H_window_4_8 = Inter_ref_05_08;Inter_H_window_5_8 = Inter_ref_06_08;end
			3'd2:begin 	
				Inter_H_window_0_0 = Inter_ref_02_00;Inter_H_window_1_0 = Inter_ref_03_00;
				Inter_H_window_2_0 = Inter_ref_04_00;Inter_H_window_3_0 = Inter_ref_05_00;
				Inter_H_window_4_0 = Inter_ref_06_00;Inter_H_window_5_0 = Inter_ref_07_00;	
				Inter_H_window_0_1 = Inter_ref_02_01;Inter_H_window_1_1 = Inter_ref_03_01; 
				Inter_H_window_2_1 = Inter_ref_04_01;Inter_H_window_3_1 = Inter_ref_05_01;
				Inter_H_window_4_1 = Inter_ref_06_01;Inter_H_window_5_1 = Inter_ref_07_01;					
				Inter_H_window_0_6 = Inter_ref_02_06;Inter_H_window_1_6 = Inter_ref_03_06; 
				Inter_H_window_2_6 = Inter_ref_04_06;Inter_H_window_3_6 = Inter_ref_05_06;
				Inter_H_window_4_6 = Inter_ref_06_06;Inter_H_window_5_6 = Inter_ref_07_06;						
				Inter_H_window_0_7 = Inter_ref_02_07;Inter_H_window_1_7 = Inter_ref_03_07; 
				Inter_H_window_2_7 = Inter_ref_04_07;Inter_H_window_3_7 = Inter_ref_05_07;
				Inter_H_window_4_7 = Inter_ref_06_07;Inter_H_window_5_7 = Inter_ref_07_07;						
				Inter_H_window_0_8 = Inter_ref_02_08;Inter_H_window_1_8 = Inter_ref_03_08; 
				Inter_H_window_2_8 = Inter_ref_04_08;Inter_H_window_3_8 = Inter_ref_05_08;
				Inter_H_window_4_8 = Inter_ref_06_08;Inter_H_window_5_8 = Inter_ref_07_08;end
			3'd1:begin 	
				Inter_H_window_0_0 = Inter_ref_03_00;Inter_H_window_1_0 = Inter_ref_04_00;
				Inter_H_window_2_0 = Inter_ref_05_00;Inter_H_window_3_0 = Inter_ref_06_00;
				Inter_H_window_4_0 = Inter_ref_07_00;Inter_H_window_5_0 = Inter_ref_08_00;
				Inter_H_window_0_1 = Inter_ref_03_01;Inter_H_window_1_1 = Inter_ref_04_01; 
				Inter_H_window_2_1 = Inter_ref_05_01;Inter_H_window_3_1 = Inter_ref_06_01;
				Inter_H_window_4_1 = Inter_ref_07_01;Inter_H_window_5_1 = Inter_ref_08_01;
						
				Inter_H_window_0_6 = Inter_ref_03_06;Inter_H_window_1_6 = Inter_ref_04_06; 
				Inter_H_window_2_6 = Inter_ref_05_06;Inter_H_window_3_6 = Inter_ref_06_06;
				Inter_H_window_4_6 = Inter_ref_07_06;Inter_H_window_5_6 = Inter_ref_08_06;
						
				Inter_H_window_0_7 = Inter_ref_03_07;Inter_H_window_1_7 = Inter_ref_04_07; 
				Inter_H_window_2_7 = Inter_ref_05_07;Inter_H_window_3_7 = Inter_ref_06_07;
				Inter_H_window_4_7 = Inter_ref_07_07;Inter_H_window_5_7 = Inter_ref_08_07;
							
				Inter_H_window_0_8 = Inter_ref_03_08;Inter_H_window_1_8 = Inter_ref_04_08; 
				Inter_H_window_2_8 = Inter_ref_05_08;Inter_H_window_3_8 = Inter_ref_06_08;
				Inter_H_window_4_8 = Inter_ref_07_08;Inter_H_window_5_8 = Inter_ref_08_08;end
			default:begin
				Inter_H_window_0_0 = 0;Inter_H_window_1_0 = 0;Inter_H_window_2_0 = 0;
				Inter_H_window_3_0 = 0;Inter_H_window_4_0 = 0;Inter_H_window_5_0 = 0;
						
				Inter_H_window_0_1 = 0;Inter_H_window_1_1 = 0;Inter_H_window_2_1 = 0;
				Inter_H_window_3_1 = 0;Inter_H_window_4_1 = 0;Inter_H_window_5_1 = 0;
						
				Inter_H_window_0_6 = 0;Inter_H_window_1_6 = 0;Inter_H_window_2_6 = 0;
				Inter_H_window_3_6 = 0;Inter_H_window_4_6 = 0;Inter_H_window_5_6 = 0;
							
				Inter_H_window_0_7 = 0;Inter_H_window_1_7 = 0;Inter_H_window_2_7 = 0;
				Inter_H_window_3_7 = 0;Inter_H_window_4_7 = 0;Inter_H_window_5_7 = 0;
							
				Inter_H_window_0_8 = 0;Inter_H_window_1_8 = 0;Inter_H_window_2_8 = 0;
				Inter_H_window_3_8 = 0;Inter_H_window_4_8 = 0;Inter_H_window_5_8 = 0;end
			endcase
		4'b0100: //Right top blk8x8
			case (Inter_H_window_counter0)
			3'd4:begin 	
				Inter_H_window_0_0 = Inter_ref_04_00;Inter_H_window_1_0 = Inter_ref_05_00;
				Inter_H_window_2_0 = Inter_ref_06_00;Inter_H_window_3_0 = Inter_ref_07_00;
				Inter_H_window_4_0 = Inter_ref_08_00;Inter_H_window_5_0 = Inter_ref_09_00;
							
				Inter_H_window_0_1 = Inter_ref_04_01;Inter_H_window_1_1 = Inter_ref_05_01; 
				Inter_H_window_2_1 = Inter_ref_06_01;Inter_H_window_3_1 = Inter_ref_07_01;
				Inter_H_window_4_1 = Inter_ref_08_01;Inter_H_window_5_1 = Inter_ref_09_01;
						
				Inter_H_window_0_6 = Inter_ref_04_06;Inter_H_window_1_6 = Inter_ref_05_06; 
				Inter_H_window_2_6 = Inter_ref_06_06;Inter_H_window_3_6 = Inter_ref_07_06;
				Inter_H_window_4_6 = Inter_ref_08_06;Inter_H_window_5_6 = Inter_ref_09_06;
							
				Inter_H_window_0_7 = Inter_ref_04_07;Inter_H_window_1_7 = Inter_ref_05_07; 
				Inter_H_window_2_7 = Inter_ref_06_07;Inter_H_window_3_7 = Inter_ref_07_07;
				Inter_H_window_4_7 = Inter_ref_08_07;Inter_H_window_5_7 = Inter_ref_09_07;
							
				Inter_H_window_0_8 = Inter_ref_04_08;Inter_H_window_1_8 = Inter_ref_05_08; 
				Inter_H_window_2_8 = Inter_ref_06_08;Inter_H_window_3_8 = Inter_ref_07_08;
				Inter_H_window_4_8 = Inter_ref_08_08;Inter_H_window_5_8 = Inter_ref_09_08;end
			3'd3:begin 	
				Inter_H_window_0_0 = Inter_ref_05_00;Inter_H_window_1_0 = Inter_ref_06_00;
				Inter_H_window_2_0 = Inter_ref_07_00;Inter_H_window_3_0 = Inter_ref_08_00;
				Inter_H_window_4_0 = Inter_ref_09_00;Inter_H_window_5_0 = Inter_ref_10_00;
							
				Inter_H_window_0_1 = Inter_ref_05_01;Inter_H_window_1_1 = Inter_ref_06_01; 
				Inter_H_window_2_1 = Inter_ref_07_01;Inter_H_window_3_1 = Inter_ref_08_01;
				Inter_H_window_4_1 = Inter_ref_09_01;Inter_H_window_5_1 = Inter_ref_10_01;
					
				Inter_H_window_0_6 = Inter_ref_05_06;Inter_H_window_1_6 = Inter_ref_06_06; 
				Inter_H_window_2_6 = Inter_ref_07_06;Inter_H_window_3_6 = Inter_ref_08_06;
				Inter_H_window_4_6 = Inter_ref_09_06;Inter_H_window_5_6 = Inter_ref_10_06;
							
				Inter_H_window_0_7 = Inter_ref_05_07;Inter_H_window_1_7 = Inter_ref_06_07; 
				Inter_H_window_2_7 = Inter_ref_07_07;Inter_H_window_3_7 = Inter_ref_08_07;
				Inter_H_window_4_7 = Inter_ref_09_07;Inter_H_window_5_7 = Inter_ref_10_07;
							
				Inter_H_window_0_8 = Inter_ref_05_08;Inter_H_window_1_8 = Inter_ref_06_08; 
				Inter_H_window_2_8 = Inter_ref_07_08;Inter_H_window_3_8 = Inter_ref_08_08;
				Inter_H_window_4_8 = Inter_ref_09_08;Inter_H_window_5_8 = Inter_ref_10_08;end
			3'd2:begin 	
				Inter_H_window_0_0 = Inter_ref_06_00;Inter_H_window_1_0 = Inter_ref_07_00;
				Inter_H_window_2_0 = Inter_ref_08_00;Inter_H_window_3_0 = Inter_ref_09_00;
				Inter_H_window_4_0 = Inter_ref_10_00;Inter_H_window_5_0 = Inter_ref_11_00;
						
				Inter_H_window_0_1 = Inter_ref_06_01;Inter_H_window_1_1 = Inter_ref_07_01; 
				Inter_H_window_2_1 = Inter_ref_08_01;Inter_H_window_3_1 = Inter_ref_09_01;
				Inter_H_window_4_1 = Inter_ref_10_01;Inter_H_window_5_1 = Inter_ref_11_01;
					
				Inter_H_window_0_6 = Inter_ref_06_06;Inter_H_window_1_6 = Inter_ref_07_06; 
				Inter_H_window_2_6 = Inter_ref_08_06;Inter_H_window_3_6 = Inter_ref_09_06;
				Inter_H_window_4_6 = Inter_ref_10_06;Inter_H_window_5_6 = Inter_ref_11_06;
							
				Inter_H_window_0_7 = Inter_ref_06_07;Inter_H_window_1_7 = Inter_ref_07_07; 
				Inter_H_window_2_7 = Inter_ref_08_07;Inter_H_window_3_7 = Inter_ref_09_07;
				Inter_H_window_4_7 = Inter_ref_10_07;Inter_H_window_5_7 = Inter_ref_11_07;
							
				Inter_H_window_0_8 = Inter_ref_06_08;Inter_H_window_1_8 = Inter_ref_07_08; 
				Inter_H_window_2_8 = Inter_ref_08_08;Inter_H_window_3_8 = Inter_ref_09_08;
				Inter_H_window_4_8 = Inter_ref_10_08;Inter_H_window_5_8 = Inter_ref_11_08;end
			3'd1:begin 	
				Inter_H_window_0_0 = Inter_ref_07_00;Inter_H_window_1_0 = Inter_ref_08_00;
				Inter_H_window_2_0 = Inter_ref_09_00;Inter_H_window_3_0 = Inter_ref_10_00;
				Inter_H_window_4_0 = Inter_ref_11_00;Inter_H_window_5_0 = Inter_ref_12_00;
						
				Inter_H_window_0_1 = Inter_ref_07_01;Inter_H_window_1_1 = Inter_ref_08_01; 
				Inter_H_window_2_1 = Inter_ref_09_01;Inter_H_window_3_1 = Inter_ref_10_01;
				Inter_H_window_4_1 = Inter_ref_11_01;Inter_H_window_5_1 = Inter_ref_12_01;
					
				Inter_H_window_0_6 = Inter_ref_07_06;Inter_H_window_1_6 = Inter_ref_08_06; 
				Inter_H_window_2_6 = Inter_ref_09_06;Inter_H_window_3_6 = Inter_ref_10_06;
				Inter_H_window_4_6 = Inter_ref_11_06;Inter_H_window_5_6 = Inter_ref_12_06;
							
				Inter_H_window_0_7 = Inter_ref_07_07;Inter_H_window_1_7 = Inter_ref_08_07; 
				Inter_H_window_2_7 = Inter_ref_09_07;Inter_H_window_3_7 = Inter_ref_10_07;
				Inter_H_window_4_7 = Inter_ref_11_07;Inter_H_window_5_7 = Inter_ref_12_07;
							
				Inter_H_window_0_8 = Inter_ref_07_08;Inter_H_window_1_8 = Inter_ref_08_08; 
				Inter_H_window_2_8 = Inter_ref_09_08;Inter_H_window_3_8 = Inter_ref_10_08;
				Inter_H_window_4_8 = Inter_ref_11_08;Inter_H_window_5_8 = Inter_ref_12_08;end
			default:begin
				Inter_H_window_0_0 = 0;Inter_H_window_1_0 = 0;Inter_H_window_2_0 = 0;
				Inter_H_window_3_0 = 0;Inter_H_window_4_0 = 0;Inter_H_window_5_0 = 0;
						
				Inter_H_window_0_1 = 0;Inter_H_window_1_1 = 0;Inter_H_window_2_1 = 0;
				Inter_H_window_3_1 = 0;Inter_H_window_4_1 = 0;Inter_H_window_5_1 = 0;
						
				Inter_H_window_0_6 = 0;Inter_H_window_1_6 = 0;Inter_H_window_2_6 = 0;
				Inter_H_window_3_6 = 0;Inter_H_window_4_6 = 0;Inter_H_window_5_6 = 0;
							
				Inter_H_window_0_7 = 0;Inter_H_window_1_7 = 0;Inter_H_window_2_7 = 0;
				Inter_H_window_3_7 = 0;Inter_H_window_4_7 = 0;Inter_H_window_5_7 = 0;
							
				Inter_H_window_0_8 = 0;Inter_H_window_1_8 = 0;Inter_H_window_2_8 = 0;
				Inter_H_window_3_8 = 0;Inter_H_window_4_8 = 0;Inter_H_window_5_8 = 0;end
			endcase
		4'b0010: //Left bottom blk4x4
			case (Inter_H_window_counter0)
			3'd4:begin 	
				Inter_H_window_0_0 = Inter_ref_00_04;Inter_H_window_1_0 = Inter_ref_01_04;
				Inter_H_window_2_0 = Inter_ref_02_04;Inter_H_window_3_0 = Inter_ref_03_04;
				Inter_H_window_4_0 = Inter_ref_04_04;Inter_H_window_5_0 = Inter_ref_05_04;
							
				Inter_H_window_0_1 = Inter_ref_00_05;Inter_H_window_1_1 = Inter_ref_01_05; 
				Inter_H_window_2_1 = Inter_ref_02_05;Inter_H_window_3_1 = Inter_ref_03_05;
				Inter_H_window_4_1 = Inter_ref_04_05;Inter_H_window_5_1 = Inter_ref_05_05;
						
				Inter_H_window_0_6 = Inter_ref_00_10;Inter_H_window_1_6 = Inter_ref_01_10; 
				Inter_H_window_2_6 = Inter_ref_02_10;Inter_H_window_3_6 = Inter_ref_03_10;
				Inter_H_window_4_6 = Inter_ref_04_10;Inter_H_window_5_6 = Inter_ref_05_10;
							
				Inter_H_window_0_7 = Inter_ref_00_11;Inter_H_window_1_7 = Inter_ref_01_11; 
				Inter_H_window_2_7 = Inter_ref_02_11;Inter_H_window_3_7 = Inter_ref_03_11;
				Inter_H_window_4_7 = Inter_ref_04_11;Inter_H_window_5_7 = Inter_ref_05_11;
							
				Inter_H_window_0_8 = Inter_ref_00_12;Inter_H_window_1_8 = Inter_ref_01_12; 
				Inter_H_window_2_8 = Inter_ref_02_12;Inter_H_window_3_8 = Inter_ref_03_12;
				Inter_H_window_4_8 = Inter_ref_04_12;Inter_H_window_5_8 = Inter_ref_05_12;end
			3'd3:begin
				Inter_H_window_0_0 = Inter_ref_01_04;Inter_H_window_1_0 = Inter_ref_02_04;
				Inter_H_window_2_0 = Inter_ref_03_04;Inter_H_window_3_0 = Inter_ref_04_04;
				Inter_H_window_4_0 = Inter_ref_05_04;Inter_H_window_5_0 = Inter_ref_06_04;
							
				Inter_H_window_0_1 = Inter_ref_01_05;Inter_H_window_1_1 = Inter_ref_02_05; 
				Inter_H_window_2_1 = Inter_ref_03_05;Inter_H_window_3_1 = Inter_ref_04_05;
				Inter_H_window_4_1 = Inter_ref_05_05;Inter_H_window_5_1 = Inter_ref_06_05;
						
				Inter_H_window_0_6 = Inter_ref_01_10;Inter_H_window_1_6 = Inter_ref_02_10; 
				Inter_H_window_2_6 = Inter_ref_03_10;Inter_H_window_3_6 = Inter_ref_04_10;
				Inter_H_window_4_6 = Inter_ref_05_10;Inter_H_window_5_6 = Inter_ref_06_10;
							
				Inter_H_window_0_7 = Inter_ref_01_11;Inter_H_window_1_7 = Inter_ref_02_11; 
				Inter_H_window_2_7 = Inter_ref_03_11;Inter_H_window_3_7 = Inter_ref_04_11;
				Inter_H_window_4_7 = Inter_ref_05_11;Inter_H_window_5_7 = Inter_ref_06_11;
							
				Inter_H_window_0_8 = Inter_ref_01_12;Inter_H_window_1_8 = Inter_ref_02_12; 
				Inter_H_window_2_8 = Inter_ref_03_12;Inter_H_window_3_8 = Inter_ref_04_12;
				Inter_H_window_4_8 = Inter_ref_05_12;Inter_H_window_5_8 = Inter_ref_06_12;end
			3'd2:begin 	
				Inter_H_window_0_0 = Inter_ref_02_04;Inter_H_window_1_0 = Inter_ref_03_04;
				Inter_H_window_2_0 = Inter_ref_04_04;Inter_H_window_3_0 = Inter_ref_05_04;
				Inter_H_window_4_0 = Inter_ref_06_04;Inter_H_window_5_0 = Inter_ref_07_04;
							
				Inter_H_window_0_1 = Inter_ref_02_05;Inter_H_window_1_1 = Inter_ref_03_05; 
				Inter_H_window_2_1 = Inter_ref_04_05;Inter_H_window_3_1 = Inter_ref_05_05;
				Inter_H_window_4_1 = Inter_ref_06_05;Inter_H_window_5_1 = Inter_ref_07_05;
					
				Inter_H_window_0_6 = Inter_ref_02_10;Inter_H_window_1_6 = Inter_ref_03_10; 
				Inter_H_window_2_6 = Inter_ref_04_10;Inter_H_window_3_6 = Inter_ref_05_10;
				Inter_H_window_4_6 = Inter_ref_06_10;Inter_H_window_5_6 = Inter_ref_07_10;
							
				Inter_H_window_0_7 = Inter_ref_02_11;Inter_H_window_1_7 = Inter_ref_03_11; 
				Inter_H_window_2_7 = Inter_ref_04_11;Inter_H_window_3_7 = Inter_ref_05_11;
				Inter_H_window_4_7 = Inter_ref_06_11;Inter_H_window_5_7 = Inter_ref_07_11;
							
				Inter_H_window_0_8 = Inter_ref_02_12;Inter_H_window_1_8 = Inter_ref_03_12; 
				Inter_H_window_2_8 = Inter_ref_04_12;Inter_H_window_3_8 = Inter_ref_05_12;
				Inter_H_window_4_8 = Inter_ref_06_12;Inter_H_window_5_8 = Inter_ref_07_12;
				end
			3'd1:begin 	
				Inter_H_window_0_0 = Inter_ref_03_04;Inter_H_window_1_0 = Inter_ref_04_04;
				Inter_H_window_2_0 = Inter_ref_05_04;Inter_H_window_3_0 = Inter_ref_06_04;
				Inter_H_window_4_0 = Inter_ref_07_04;Inter_H_window_5_0 = Inter_ref_08_04;
							
				Inter_H_window_0_1 = Inter_ref_03_05;Inter_H_window_1_1 = Inter_ref_04_05; 
				Inter_H_window_2_1 = Inter_ref_05_05;Inter_H_window_3_1 = Inter_ref_06_05;
				Inter_H_window_4_1 = Inter_ref_07_05;Inter_H_window_5_1 = Inter_ref_08_05;
						
				Inter_H_window_0_6 = Inter_ref_03_10;Inter_H_window_1_6 = Inter_ref_04_10; 
				Inter_H_window_2_6 = Inter_ref_05_10;Inter_H_window_3_6 = Inter_ref_06_10;
				Inter_H_window_4_6 = Inter_ref_07_10;Inter_H_window_5_6 = Inter_ref_08_10;
							
				Inter_H_window_0_7 = Inter_ref_03_11;Inter_H_window_1_7 = Inter_ref_04_11; 
				Inter_H_window_2_7 = Inter_ref_05_11;Inter_H_window_3_7 = Inter_ref_06_11;
				Inter_H_window_4_7 = Inter_ref_07_11;Inter_H_window_5_7 = Inter_ref_08_11;
							
				Inter_H_window_0_8 = Inter_ref_03_12;Inter_H_window_1_8 = Inter_ref_04_12; 
				Inter_H_window_2_8 = Inter_ref_05_12;Inter_H_window_3_8 = Inter_ref_06_12;
				Inter_H_window_4_8 = Inter_ref_07_12;Inter_H_window_5_8 = Inter_ref_08_12;end
			default:begin
				Inter_H_window_0_0 = 0;Inter_H_window_1_0 = 0;Inter_H_window_2_0 = 0;
				Inter_H_window_3_0 = 0;Inter_H_window_4_0 = 0;Inter_H_window_5_0 = 0;
						
				Inter_H_window_0_1 = 0;Inter_H_window_1_1 = 0;Inter_H_window_2_1 = 0;
				Inter_H_window_3_1 = 0;Inter_H_window_4_1 = 0;Inter_H_window_5_1 = 0;
						
				Inter_H_window_0_6 = 0;Inter_H_window_1_6 = 0;Inter_H_window_2_6 = 0;
				Inter_H_window_3_6 = 0;Inter_H_window_4_6 = 0;Inter_H_window_5_6 = 0;
							
				Inter_H_window_0_7 = 0;Inter_H_window_1_7 = 0;Inter_H_window_2_7 = 0;
				Inter_H_window_3_7 = 0;Inter_H_window_4_7 = 0;Inter_H_window_5_7 = 0;
							
				Inter_H_window_0_8 = 0;Inter_H_window_1_8 = 0;Inter_H_window_2_8 = 0;
				Inter_H_window_3_8 = 0;Inter_H_window_4_8 = 0;Inter_H_window_5_8 = 0;end
			endcase
		4'b0001: //Right bottom blk4x4
			case (Inter_H_window_counter0)
			3'd4:begin
				Inter_H_window_0_0 = Inter_ref_04_04;Inter_H_window_1_0 = Inter_ref_05_04;
				Inter_H_window_2_0 = Inter_ref_06_04;Inter_H_window_3_0 = Inter_ref_07_04;
				Inter_H_window_4_0 = Inter_ref_08_04;Inter_H_window_5_0 = Inter_ref_09_04;
						
				Inter_H_window_0_1 = Inter_ref_04_05;Inter_H_window_1_1 = Inter_ref_05_05; 
				Inter_H_window_2_1 = Inter_ref_06_05;Inter_H_window_3_1 = Inter_ref_07_05;
				Inter_H_window_4_1 = Inter_ref_08_05;Inter_H_window_5_1 = Inter_ref_09_05;
						
				Inter_H_window_0_6 = Inter_ref_04_10;Inter_H_window_1_6 = Inter_ref_05_10; 
				Inter_H_window_2_6 = Inter_ref_06_10;Inter_H_window_3_6 = Inter_ref_07_10;
				Inter_H_window_4_6 = Inter_ref_08_10;Inter_H_window_5_6 = Inter_ref_09_10;
							
				Inter_H_window_0_7 = Inter_ref_04_11;Inter_H_window_1_7 = Inter_ref_05_11; 
				Inter_H_window_2_7 = Inter_ref_06_11;Inter_H_window_3_7 = Inter_ref_07_11;
				Inter_H_window_4_7 = Inter_ref_08_11;Inter_H_window_5_7 = Inter_ref_09_11;
							
				Inter_H_window_0_8 = Inter_ref_04_12;Inter_H_window_1_8 = Inter_ref_05_12; 
				Inter_H_window_2_8 = Inter_ref_06_12;Inter_H_window_3_8 = Inter_ref_07_12;
				Inter_H_window_4_8 = Inter_ref_08_12;Inter_H_window_5_8 = Inter_ref_09_12;end
			3'd3:begin 	
				Inter_H_window_0_0 = Inter_ref_05_04;Inter_H_window_1_0 = Inter_ref_06_04;
				Inter_H_window_2_0 = Inter_ref_07_04;Inter_H_window_3_0 = Inter_ref_08_04;
				Inter_H_window_4_0 = Inter_ref_09_04;Inter_H_window_5_0 = Inter_ref_10_04;
							
				Inter_H_window_0_1 = Inter_ref_05_05;Inter_H_window_1_1 = Inter_ref_06_05; 
				Inter_H_window_2_1 = Inter_ref_07_05;Inter_H_window_3_1 = Inter_ref_08_05;
				Inter_H_window_4_1 = Inter_ref_09_05;Inter_H_window_5_1 = Inter_ref_10_05;
						
				Inter_H_window_0_6 = Inter_ref_05_10;Inter_H_window_1_6 = Inter_ref_06_10; 
				Inter_H_window_2_6 = Inter_ref_07_10;Inter_H_window_3_6 = Inter_ref_08_10;
				Inter_H_window_4_6 = Inter_ref_09_10;Inter_H_window_5_6 = Inter_ref_10_10;
							
				Inter_H_window_0_7 = Inter_ref_05_11;Inter_H_window_1_7 = Inter_ref_06_11; 
				Inter_H_window_2_7 = Inter_ref_07_11;Inter_H_window_3_7 = Inter_ref_08_11;
				Inter_H_window_4_7 = Inter_ref_09_11;Inter_H_window_5_7 = Inter_ref_10_11;
							
				Inter_H_window_0_8 = Inter_ref_05_12;Inter_H_window_1_8 = Inter_ref_06_12; 
				Inter_H_window_2_8 = Inter_ref_07_12;Inter_H_window_3_8 = Inter_ref_08_12;
				Inter_H_window_4_8 = Inter_ref_09_12;Inter_H_window_5_8 = Inter_ref_10_12;end
			3'd2:begin 	
				Inter_H_window_0_0 = Inter_ref_06_04;Inter_H_window_1_0 = Inter_ref_07_04;
				Inter_H_window_2_0 = Inter_ref_08_04;Inter_H_window_3_0 = Inter_ref_09_04;
				Inter_H_window_4_0 = Inter_ref_10_04;Inter_H_window_5_0 = Inter_ref_11_04;
							
				Inter_H_window_0_1 = Inter_ref_06_05;Inter_H_window_1_1 = Inter_ref_07_05; 
				Inter_H_window_2_1 = Inter_ref_08_05;Inter_H_window_3_1 = Inter_ref_09_05;
				Inter_H_window_4_1 = Inter_ref_10_05;Inter_H_window_5_1 = Inter_ref_11_05;
						
				Inter_H_window_0_6 = Inter_ref_06_10;Inter_H_window_1_6 = Inter_ref_07_10; 
				Inter_H_window_2_6 = Inter_ref_08_10;Inter_H_window_3_6 = Inter_ref_09_10;
				Inter_H_window_4_6 = Inter_ref_10_10;Inter_H_window_5_6 = Inter_ref_11_10;
							
				Inter_H_window_0_7 = Inter_ref_06_11;Inter_H_window_1_7 = Inter_ref_07_11; 
				Inter_H_window_2_7 = Inter_ref_08_11;Inter_H_window_3_7 = Inter_ref_09_11;
				Inter_H_window_4_7 = Inter_ref_10_11;Inter_H_window_5_7 = Inter_ref_11_11;
							
				Inter_H_window_0_8 = Inter_ref_06_12;Inter_H_window_1_8 = Inter_ref_07_12; 
				Inter_H_window_2_8 = Inter_ref_08_12;Inter_H_window_3_8 = Inter_ref_09_12;
				Inter_H_window_4_8 = Inter_ref_10_12;Inter_H_window_5_8 = Inter_ref_11_12;end
			3'd1:begin 	
				Inter_H_window_0_0 = Inter_ref_07_04;Inter_H_window_1_0 = Inter_ref_08_04;
				Inter_H_window_2_0 = Inter_ref_09_04;Inter_H_window_3_0 = Inter_ref_10_04;
				Inter_H_window_4_0 = Inter_ref_11_04;Inter_H_window_5_0 = Inter_ref_12_04;
							
				Inter_H_window_0_1 = Inter_ref_07_05;Inter_H_window_1_1 = Inter_ref_08_05; 
				Inter_H_window_2_1 = Inter_ref_09_05;Inter_H_window_3_1 = Inter_ref_10_05;
				Inter_H_window_4_1 = Inter_ref_11_05;Inter_H_window_5_1 = Inter_ref_12_05;
						
				Inter_H_window_0_6 = Inter_ref_07_10;Inter_H_window_1_6 = Inter_ref_08_10; 
				Inter_H_window_2_6 = Inter_ref_09_10;Inter_H_window_3_6 = Inter_ref_10_10;
				Inter_H_window_4_6 = Inter_ref_11_10;Inter_H_window_5_6 = Inter_ref_12_10;
							
				Inter_H_window_0_7 = Inter_ref_07_11;Inter_H_window_1_7 = Inter_ref_08_11; 
				Inter_H_window_2_7 = Inter_ref_09_11;Inter_H_window_3_7 = Inter_ref_10_11;
				Inter_H_window_4_7 = Inter_ref_11_11;Inter_H_window_5_7 = Inter_ref_12_11;
							
				Inter_H_window_0_8 = Inter_ref_07_12;Inter_H_window_1_8 = Inter_ref_08_12; 
				Inter_H_window_2_8 = Inter_ref_09_12;Inter_H_window_3_8 = Inter_ref_10_12;
				Inter_H_window_4_8 = Inter_ref_11_12;Inter_H_window_5_8 = Inter_ref_12_12;end
			default:begin
				Inter_H_window_0_0 = 0;Inter_H_window_1_0 = 0;Inter_H_window_2_0 = 0;
				Inter_H_window_3_0 = 0;Inter_H_window_4_0 = 0;Inter_H_window_5_0 = 0;
						
				Inter_H_window_0_1 = 0;Inter_H_window_1_1 = 0;Inter_H_window_2_1 = 0;
				Inter_H_window_3_1 = 0;Inter_H_window_4_1 = 0;Inter_H_window_5_1 = 0;
						
				Inter_H_window_0_6 = 0;Inter_H_window_1_6 = 0;Inter_H_window_2_6 = 0;
				Inter_H_window_3_6 = 0;Inter_H_window_4_6 = 0;Inter_H_window_5_6 = 0;
							
				Inter_H_window_0_7 = 0;Inter_H_window_1_7 = 0;Inter_H_window_2_7 = 0;
				Inter_H_window_3_7 = 0;Inter_H_window_4_7 = 0;Inter_H_window_5_7 = 0;
							
				Inter_H_window_0_8 = 0;Inter_H_window_1_8 = 0;Inter_H_window_2_8 = 0;
				Inter_H_window_3_8 = 0;Inter_H_window_4_8 = 0;Inter_H_window_5_8 = 0;end
			endcase
		default:begin
				Inter_H_window_0_0 = 0;Inter_H_window_1_0 = 0;Inter_H_window_2_0 = 0;
				Inter_H_window_3_0 = 0;Inter_H_window_4_0 = 0;Inter_H_window_5_0 = 0;
					
				Inter_H_window_0_1 = 0;Inter_H_window_1_1 = 0;Inter_H_window_2_1 = 0;
				Inter_H_window_3_1 = 0;Inter_H_window_4_1 = 0;Inter_H_window_5_1 = 0;
						
				Inter_H_window_0_6 = 0;Inter_H_window_1_6 = 0;Inter_H_window_2_6 = 0;
				Inter_H_window_3_6 = 0;Inter_H_window_4_6 = 0;Inter_H_window_5_6 = 0;
							
				Inter_H_window_0_7 = 0;Inter_H_window_1_7 = 0;Inter_H_window_2_7 = 0;
				Inter_H_window_3_7 = 0;Inter_H_window_4_7 = 0;Inter_H_window_5_7 = 0;
							
				Inter_H_window_0_8 = 0;Inter_H_window_1_8 = 0;Inter_H_window_2_8 = 0;
				Inter_H_window_3_8 = 0;Inter_H_window_4_8 = 0;Inter_H_window_5_8 = 0;
			end
		endcase


reg [2:0] Inter_H_window_counter1;
	always @ (pos_FracL or blk4x4_inter_calculate_counter)
		if (((pos_FracL == `pos_b || pos_FracL == `pos_a || pos_FracL == `pos_c || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd4) 					 ||
			((pos_FracL == `pos_j || pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd5) ||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd8))
			Inter_H_window_counter1 = 3'd4;
		else if (((pos_FracL == `pos_b || pos_FracL == `pos_a || pos_FracL == `pos_c || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd3) 					 ||
			((pos_FracL == `pos_j || pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd4) ||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd6))
			Inter_H_window_counter1 = 3'd3;
		else if (((pos_FracL == `pos_b || pos_FracL == `pos_a || pos_FracL == `pos_c || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd2) 					 ||
			((pos_FracL == `pos_j || pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd3) ||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd4))
			Inter_H_window_counter1 = 3'd2;
		else if (((pos_FracL == `pos_b || pos_FracL == `pos_a || pos_FracL == `pos_c || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd1) 					 ||
			((pos_FracL == `pos_j || pos_FracL == `pos_f || pos_FracL == `pos_q) && blk4x4_inter_calculate_counter == 4'd2) ||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd2))
			Inter_H_window_counter1 = 3'd1;
		else
			Inter_H_window_counter1 = 0;
			
	//Inter_H_window_x_2,Inter_H_window_x_3,Inter_H_window_x_4,Inter_H_window_x_5
	always @ (Is_blk4x4_0 or Is_blk4x4_1 or Is_blk4x4_2 or Is_blk4x4_3 or pos_FracL or Inter_H_window_counter1 
		or Inter_ref_00_02 or Inter_ref_01_02 or Inter_ref_02_02 or Inter_ref_03_02
		or Inter_ref_04_02 or Inter_ref_05_02 or Inter_ref_06_02 or Inter_ref_07_02
		or Inter_ref_08_02 or Inter_ref_09_02 or Inter_ref_10_02 or Inter_ref_11_02 or Inter_ref_12_02
		
		or Inter_ref_00_03 or Inter_ref_01_03 or Inter_ref_02_03 or Inter_ref_03_03
		or Inter_ref_04_03 or Inter_ref_05_03 or Inter_ref_06_03 or Inter_ref_07_03
		or Inter_ref_08_03 or Inter_ref_09_03 or Inter_ref_10_03 or Inter_ref_11_03 or Inter_ref_12_03
		
		or Inter_ref_00_04 or Inter_ref_01_04 or Inter_ref_02_04 or Inter_ref_03_04
		or Inter_ref_04_04 or Inter_ref_05_04 or Inter_ref_06_04 or Inter_ref_07_04
		or Inter_ref_08_04 or Inter_ref_09_04 or Inter_ref_10_04 or Inter_ref_11_04 or Inter_ref_12_04
		
		or Inter_ref_00_05 or Inter_ref_01_05 or Inter_ref_02_05 or Inter_ref_03_05
		or Inter_ref_04_05 or Inter_ref_05_05 or Inter_ref_06_05 or Inter_ref_07_05
		or Inter_ref_08_05 or Inter_ref_09_05 or Inter_ref_10_05 or Inter_ref_11_05 or Inter_ref_12_05
		
		or Inter_ref_00_06 or Inter_ref_01_06 or Inter_ref_02_06 or Inter_ref_03_06
		or Inter_ref_04_06 or Inter_ref_05_06 or Inter_ref_06_06 or Inter_ref_07_06
		or Inter_ref_08_06 or Inter_ref_09_06 or Inter_ref_10_06 or Inter_ref_11_06 or Inter_ref_12_06
		
		or Inter_ref_00_07 or Inter_ref_01_07 or Inter_ref_02_07 or Inter_ref_03_07
		or Inter_ref_04_07 or Inter_ref_05_07 or Inter_ref_06_07 or Inter_ref_07_07
		or Inter_ref_08_07 or Inter_ref_09_07 or Inter_ref_10_07 or Inter_ref_11_07 or Inter_ref_12_07
		
		or Inter_ref_00_08 or Inter_ref_01_08 or Inter_ref_02_08 or Inter_ref_03_08
		or Inter_ref_04_08 or Inter_ref_05_08 or Inter_ref_06_08 or Inter_ref_07_08
		or Inter_ref_08_08 or Inter_ref_09_08 or Inter_ref_10_08 or Inter_ref_11_08 or Inter_ref_12_08
		
		or Inter_ref_00_09 or Inter_ref_01_09 or Inter_ref_02_09 or Inter_ref_03_09
		or Inter_ref_04_09 or Inter_ref_05_09 or Inter_ref_06_09 or Inter_ref_07_09
		or Inter_ref_08_09 or Inter_ref_09_09 or Inter_ref_10_09 or Inter_ref_11_09 or Inter_ref_12_09
		
		or Inter_ref_00_10 or Inter_ref_01_10 or Inter_ref_02_10 or Inter_ref_03_10
		or Inter_ref_04_10 or Inter_ref_05_10 or Inter_ref_06_10 or Inter_ref_07_10
		or Inter_ref_08_10 or Inter_ref_09_10 or Inter_ref_10_10 or Inter_ref_11_10 or Inter_ref_12_10
		)
		case ({Is_blk4x4_0,Is_blk4x4_1,Is_blk4x4_2,Is_blk4x4_3}) 
			4'b1000: //Left top blk4x4
			case (Inter_H_window_counter1)
				3'd4:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_00_03;Inter_H_window_1_2 = Inter_ref_01_03;
						Inter_H_window_2_2 = Inter_ref_02_03;Inter_H_window_3_2 = Inter_ref_03_03;
						Inter_H_window_4_2 = Inter_ref_04_03;Inter_H_window_5_2 = Inter_ref_05_03;
							
						Inter_H_window_0_3 = Inter_ref_00_04;Inter_H_window_1_3 = Inter_ref_01_04;
						Inter_H_window_2_3 = Inter_ref_02_04;Inter_H_window_3_3 = Inter_ref_03_04;
						Inter_H_window_4_3 = Inter_ref_04_04;Inter_H_window_5_3 = Inter_ref_05_04;
						
						Inter_H_window_0_4 = Inter_ref_00_05;Inter_H_window_1_4 = Inter_ref_01_05;
						Inter_H_window_2_4 = Inter_ref_02_05;Inter_H_window_3_4 = Inter_ref_03_05;
						Inter_H_window_4_4 = Inter_ref_04_05;Inter_H_window_5_4 = Inter_ref_05_05;
							
						Inter_H_window_0_5 = Inter_ref_00_06;Inter_H_window_1_5 = Inter_ref_01_06;
						Inter_H_window_2_5 = Inter_ref_02_06;Inter_H_window_3_5 = Inter_ref_03_06;
						Inter_H_window_4_5 = Inter_ref_04_06;Inter_H_window_5_5 = Inter_ref_05_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_00_02;Inter_H_window_1_2 = Inter_ref_01_02;
						Inter_H_window_2_2 = Inter_ref_02_02;Inter_H_window_3_2 = Inter_ref_03_02;
						Inter_H_window_4_2 = Inter_ref_04_02;Inter_H_window_5_2 = Inter_ref_05_02;
							
						Inter_H_window_0_3 = Inter_ref_00_03;Inter_H_window_1_3 = Inter_ref_01_03;
						Inter_H_window_2_3 = Inter_ref_02_03;Inter_H_window_3_3 = Inter_ref_03_03;
						Inter_H_window_4_3 = Inter_ref_04_03;Inter_H_window_5_3 = Inter_ref_05_03;
						
						Inter_H_window_0_4 = Inter_ref_00_04;Inter_H_window_1_4 = Inter_ref_01_04;
						Inter_H_window_2_4 = Inter_ref_02_04;Inter_H_window_3_4 = Inter_ref_03_04;
						Inter_H_window_4_4 = Inter_ref_04_04;Inter_H_window_5_4 = Inter_ref_05_04;
							
						Inter_H_window_0_5 = Inter_ref_00_05;Inter_H_window_1_5 = Inter_ref_01_05;
						Inter_H_window_2_5 = Inter_ref_02_05;Inter_H_window_3_5 = Inter_ref_03_05;
						Inter_H_window_4_5 = Inter_ref_04_05;Inter_H_window_5_5 = Inter_ref_05_05;
					end
				3'd3:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_01_03;Inter_H_window_1_2 = Inter_ref_02_03;
						Inter_H_window_2_2 = Inter_ref_03_03;Inter_H_window_3_2 = Inter_ref_04_03;
						Inter_H_window_4_2 = Inter_ref_05_03;Inter_H_window_5_2 = Inter_ref_06_03;
							
						Inter_H_window_0_3 = Inter_ref_01_04;Inter_H_window_1_3 = Inter_ref_02_04;
						Inter_H_window_2_3 = Inter_ref_03_04;Inter_H_window_3_3 = Inter_ref_04_04;
						Inter_H_window_4_3 = Inter_ref_05_04;Inter_H_window_5_3 = Inter_ref_06_04;
						
						Inter_H_window_0_4 = Inter_ref_01_05;Inter_H_window_1_4 = Inter_ref_02_05;
						Inter_H_window_2_4 = Inter_ref_03_05;Inter_H_window_3_4 = Inter_ref_04_05;
						Inter_H_window_4_4 = Inter_ref_05_05;Inter_H_window_5_4 = Inter_ref_06_05;
							
						Inter_H_window_0_5 = Inter_ref_01_06;Inter_H_window_1_5 = Inter_ref_02_06;
						Inter_H_window_2_5 = Inter_ref_03_06;Inter_H_window_3_5 = Inter_ref_04_06;
						Inter_H_window_4_5 = Inter_ref_05_06;Inter_H_window_5_5 = Inter_ref_06_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_01_02;Inter_H_window_1_2 = Inter_ref_02_02;
						Inter_H_window_2_2 = Inter_ref_03_02;Inter_H_window_3_2 = Inter_ref_04_02;
						Inter_H_window_4_2 = Inter_ref_05_02;Inter_H_window_5_2 = Inter_ref_06_02;
							
						Inter_H_window_0_3 = Inter_ref_01_03;Inter_H_window_1_3 = Inter_ref_02_03;
						Inter_H_window_2_3 = Inter_ref_03_03;Inter_H_window_3_3 = Inter_ref_04_03;
						Inter_H_window_4_3 = Inter_ref_05_03;Inter_H_window_5_3 = Inter_ref_06_03;
						
						Inter_H_window_0_4 = Inter_ref_01_04;Inter_H_window_1_4 = Inter_ref_02_04;
						Inter_H_window_2_4 = Inter_ref_03_04;Inter_H_window_3_4 = Inter_ref_04_04;
						Inter_H_window_4_4 = Inter_ref_05_04;Inter_H_window_5_4 = Inter_ref_06_04;
							
						Inter_H_window_0_5 = Inter_ref_01_05;Inter_H_window_1_5 = Inter_ref_02_05;
						Inter_H_window_2_5 = Inter_ref_03_05;Inter_H_window_3_5 = Inter_ref_04_05;
						Inter_H_window_4_5 = Inter_ref_05_05;Inter_H_window_5_5 = Inter_ref_06_05;
					end
				3'd2:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_02_03;Inter_H_window_1_2 = Inter_ref_03_03;
						Inter_H_window_2_2 = Inter_ref_04_03;Inter_H_window_3_2 = Inter_ref_05_03;
						Inter_H_window_4_2 = Inter_ref_06_03;Inter_H_window_5_2 = Inter_ref_07_03;
							
						Inter_H_window_0_3 = Inter_ref_02_04;Inter_H_window_1_3 = Inter_ref_03_04;
						Inter_H_window_2_3 = Inter_ref_04_04;Inter_H_window_3_3 = Inter_ref_05_04;
						Inter_H_window_4_3 = Inter_ref_06_04;Inter_H_window_5_3 = Inter_ref_07_04;
						
						Inter_H_window_0_4 = Inter_ref_02_05;Inter_H_window_1_4 = Inter_ref_03_05;
						Inter_H_window_2_4 = Inter_ref_04_05;Inter_H_window_3_4 = Inter_ref_05_05;
						Inter_H_window_4_4 = Inter_ref_06_05;Inter_H_window_5_4 = Inter_ref_07_05;
							
						Inter_H_window_0_5 = Inter_ref_02_06;Inter_H_window_1_5 = Inter_ref_03_06;
						Inter_H_window_2_5 = Inter_ref_04_06;Inter_H_window_3_5 = Inter_ref_05_06;
						Inter_H_window_4_5 = Inter_ref_06_06;Inter_H_window_5_5 = Inter_ref_07_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_02_02;Inter_H_window_1_2 = Inter_ref_03_02;
						Inter_H_window_2_2 = Inter_ref_04_02;Inter_H_window_3_2 = Inter_ref_05_02;
						Inter_H_window_4_2 = Inter_ref_06_02;Inter_H_window_5_2 = Inter_ref_07_02;
							
						Inter_H_window_0_3 = Inter_ref_02_03;Inter_H_window_1_3 = Inter_ref_03_03;
						Inter_H_window_2_3 = Inter_ref_04_03;Inter_H_window_3_3 = Inter_ref_05_03;
						Inter_H_window_4_3 = Inter_ref_06_03;Inter_H_window_5_3 = Inter_ref_07_03;
						
						Inter_H_window_0_4 = Inter_ref_02_04;Inter_H_window_1_4 = Inter_ref_03_04;
						Inter_H_window_2_4 = Inter_ref_04_04;Inter_H_window_3_4 = Inter_ref_05_04;
						Inter_H_window_4_4 = Inter_ref_06_04;Inter_H_window_5_4 = Inter_ref_07_04;
							
						Inter_H_window_0_5 = Inter_ref_02_05;Inter_H_window_1_5 = Inter_ref_03_05;
						Inter_H_window_2_5 = Inter_ref_04_05;Inter_H_window_3_5 = Inter_ref_05_05;
						Inter_H_window_4_5 = Inter_ref_06_05;Inter_H_window_5_5 = Inter_ref_07_05;
					end	
				3'd1:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_03_03;Inter_H_window_1_2 = Inter_ref_04_03;
						Inter_H_window_2_2 = Inter_ref_05_03;Inter_H_window_3_2 = Inter_ref_06_03;
						Inter_H_window_4_2 = Inter_ref_07_03;Inter_H_window_5_2 = Inter_ref_08_03;
							
						Inter_H_window_0_3 = Inter_ref_03_04;Inter_H_window_1_3 = Inter_ref_04_04;
						Inter_H_window_2_3 = Inter_ref_05_04;Inter_H_window_3_3 = Inter_ref_06_04;
						Inter_H_window_4_3 = Inter_ref_07_04;Inter_H_window_5_3 = Inter_ref_08_04;
						
						Inter_H_window_0_4 = Inter_ref_03_05;Inter_H_window_1_4 = Inter_ref_04_05;
						Inter_H_window_2_4 = Inter_ref_05_05;Inter_H_window_3_4 = Inter_ref_06_05;
						Inter_H_window_4_4 = Inter_ref_07_05;Inter_H_window_5_4 = Inter_ref_08_05;
							
						Inter_H_window_0_5 = Inter_ref_03_06;Inter_H_window_1_5 = Inter_ref_04_06;
						Inter_H_window_2_5 = Inter_ref_05_06;Inter_H_window_3_5 = Inter_ref_06_06;
						Inter_H_window_4_5 = Inter_ref_07_06;Inter_H_window_5_5 = Inter_ref_08_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_03_02;Inter_H_window_1_2 = Inter_ref_04_02;
						Inter_H_window_2_2 = Inter_ref_05_02;Inter_H_window_3_2 = Inter_ref_06_02;
						Inter_H_window_4_2 = Inter_ref_07_02;Inter_H_window_5_2 = Inter_ref_08_02;
							
						Inter_H_window_0_3 = Inter_ref_03_03;Inter_H_window_1_3 = Inter_ref_04_03;
						Inter_H_window_2_3 = Inter_ref_05_03;Inter_H_window_3_3 = Inter_ref_06_03;
						Inter_H_window_4_3 = Inter_ref_07_03;Inter_H_window_5_3 = Inter_ref_08_03;
						
						Inter_H_window_0_4 = Inter_ref_03_04;Inter_H_window_1_4 = Inter_ref_04_04;
						Inter_H_window_2_4 = Inter_ref_05_04;Inter_H_window_3_4 = Inter_ref_06_04;
						Inter_H_window_4_4 = Inter_ref_07_04;Inter_H_window_5_4 = Inter_ref_08_04;
							
						Inter_H_window_0_5 = Inter_ref_03_05;Inter_H_window_1_5 = Inter_ref_04_05;
						Inter_H_window_2_5 = Inter_ref_05_05;Inter_H_window_3_5 = Inter_ref_06_05;
						Inter_H_window_4_5 = Inter_ref_07_05;Inter_H_window_5_5 = Inter_ref_08_05;
					end
				default:
				begin
					Inter_H_window_0_2 = 0;Inter_H_window_1_2 = 0;Inter_H_window_2_2 = 0;
					Inter_H_window_3_2 = 0;Inter_H_window_4_2 = 0;Inter_H_window_5_2 = 0;
						
					Inter_H_window_0_3 = 0;Inter_H_window_1_3 = 0;Inter_H_window_2_3 = 0;
					Inter_H_window_3_3 = 0;Inter_H_window_4_3 = 0;Inter_H_window_5_3 = 0;
						
					Inter_H_window_0_4 = 0;Inter_H_window_1_4 = 0;Inter_H_window_2_4 = 0;
					Inter_H_window_3_4 = 0;Inter_H_window_4_4 = 0;Inter_H_window_5_4 = 0;
							
					Inter_H_window_0_5 = 0;Inter_H_window_1_5 = 0;Inter_H_window_2_5 = 0;
					Inter_H_window_3_5 = 0;Inter_H_window_4_5 = 0;Inter_H_window_5_5 = 0;
				end
			endcase
			4'b0100: //Right top blk4x4
			case (Inter_H_window_counter1)
				3'd4:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_04_03;Inter_H_window_1_2 = Inter_ref_05_03;
						Inter_H_window_2_2 = Inter_ref_06_03;Inter_H_window_3_2 = Inter_ref_07_03;
						Inter_H_window_4_2 = Inter_ref_08_03;Inter_H_window_5_2 = Inter_ref_09_03;
							
						Inter_H_window_0_3 = Inter_ref_04_04;Inter_H_window_1_3 = Inter_ref_05_04;
						Inter_H_window_2_3 = Inter_ref_06_04;Inter_H_window_3_3 = Inter_ref_07_04;
						Inter_H_window_4_3 = Inter_ref_08_04;Inter_H_window_5_3 = Inter_ref_09_04;
						
						Inter_H_window_0_4 = Inter_ref_04_05;Inter_H_window_1_4 = Inter_ref_05_05;
						Inter_H_window_2_4 = Inter_ref_06_05;Inter_H_window_3_4 = Inter_ref_07_05;
						Inter_H_window_4_4 = Inter_ref_08_05;Inter_H_window_5_4 = Inter_ref_09_05;
							
						Inter_H_window_0_5 = Inter_ref_04_06;Inter_H_window_1_5 = Inter_ref_05_06;
						Inter_H_window_2_5 = Inter_ref_06_06;Inter_H_window_3_5 = Inter_ref_07_06;
						Inter_H_window_4_5 = Inter_ref_08_06;Inter_H_window_5_5 = Inter_ref_09_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_04_02;Inter_H_window_1_2 = Inter_ref_05_02;
						Inter_H_window_2_2 = Inter_ref_06_02;Inter_H_window_3_2 = Inter_ref_07_02;
						Inter_H_window_4_2 = Inter_ref_08_02;Inter_H_window_5_2 = Inter_ref_09_02;
							
						Inter_H_window_0_3 = Inter_ref_04_03;Inter_H_window_1_3 = Inter_ref_05_03;
						Inter_H_window_2_3 = Inter_ref_06_03;Inter_H_window_3_3 = Inter_ref_07_03;
						Inter_H_window_4_3 = Inter_ref_08_03;Inter_H_window_5_3 = Inter_ref_09_03;
						
						Inter_H_window_0_4 = Inter_ref_04_04;Inter_H_window_1_4 = Inter_ref_05_04;
						Inter_H_window_2_4 = Inter_ref_06_04;Inter_H_window_3_4 = Inter_ref_07_04;
						Inter_H_window_4_4 = Inter_ref_08_04;Inter_H_window_5_4 = Inter_ref_09_04;
							
						Inter_H_window_0_5 = Inter_ref_04_05;Inter_H_window_1_5 = Inter_ref_05_05;
						Inter_H_window_2_5 = Inter_ref_06_05;Inter_H_window_3_5 = Inter_ref_07_05;
						Inter_H_window_4_5 = Inter_ref_08_05;Inter_H_window_5_5 = Inter_ref_09_05;
					end
				3'd3:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_05_03;Inter_H_window_1_2 = Inter_ref_06_03;
						Inter_H_window_2_2 = Inter_ref_07_03;Inter_H_window_3_2 = Inter_ref_08_03;
						Inter_H_window_4_2 = Inter_ref_09_03;Inter_H_window_5_2 = Inter_ref_10_03;
							
						Inter_H_window_0_3 = Inter_ref_05_04;Inter_H_window_1_3 = Inter_ref_06_04;
						Inter_H_window_2_3 = Inter_ref_07_04;Inter_H_window_3_3 = Inter_ref_08_04;
						Inter_H_window_4_3 = Inter_ref_09_04;Inter_H_window_5_3 = Inter_ref_10_04;
						
						Inter_H_window_0_4 = Inter_ref_05_05;Inter_H_window_1_4 = Inter_ref_06_05;
						Inter_H_window_2_4 = Inter_ref_07_05;Inter_H_window_3_4 = Inter_ref_08_05;
						Inter_H_window_4_4 = Inter_ref_09_05;Inter_H_window_5_4 = Inter_ref_10_05;
							
						Inter_H_window_0_5 = Inter_ref_05_06;Inter_H_window_1_5 = Inter_ref_06_06;
						Inter_H_window_2_5 = Inter_ref_07_06;Inter_H_window_3_5 = Inter_ref_08_06;
						Inter_H_window_4_5 = Inter_ref_09_06;Inter_H_window_5_5 = Inter_ref_10_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_05_02;Inter_H_window_1_2 = Inter_ref_06_02;
						Inter_H_window_2_2 = Inter_ref_07_02;Inter_H_window_3_2 = Inter_ref_08_02;
						Inter_H_window_4_2 = Inter_ref_09_02;Inter_H_window_5_2 = Inter_ref_10_02;
							
						Inter_H_window_0_3 = Inter_ref_05_03;Inter_H_window_1_3 = Inter_ref_06_03;
						Inter_H_window_2_3 = Inter_ref_07_03;Inter_H_window_3_3 = Inter_ref_08_03;
						Inter_H_window_4_3 = Inter_ref_09_03;Inter_H_window_5_3 = Inter_ref_10_03;
						
						Inter_H_window_0_4 = Inter_ref_05_04;Inter_H_window_1_4 = Inter_ref_06_04;
						Inter_H_window_2_4 = Inter_ref_07_04;Inter_H_window_3_4 = Inter_ref_08_04;
						Inter_H_window_4_4 = Inter_ref_09_04;Inter_H_window_5_4 = Inter_ref_10_04;
							
						Inter_H_window_0_5 = Inter_ref_05_05;Inter_H_window_1_5 = Inter_ref_06_05;
						Inter_H_window_2_5 = Inter_ref_07_05;Inter_H_window_3_5 = Inter_ref_08_05;
						Inter_H_window_4_5 = Inter_ref_09_05;Inter_H_window_5_5 = Inter_ref_10_05;
					end
				3'd2:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_06_03;Inter_H_window_1_2 = Inter_ref_07_03;
						Inter_H_window_2_2 = Inter_ref_08_03;Inter_H_window_3_2 = Inter_ref_09_03;
						Inter_H_window_4_2 = Inter_ref_10_03;Inter_H_window_5_2 = Inter_ref_11_03;
							
						Inter_H_window_0_3 = Inter_ref_06_04;Inter_H_window_1_3 = Inter_ref_07_04;
						Inter_H_window_2_3 = Inter_ref_08_04;Inter_H_window_3_3 = Inter_ref_09_04;
						Inter_H_window_4_3 = Inter_ref_10_04;Inter_H_window_5_3 = Inter_ref_11_04;
						
						Inter_H_window_0_4 = Inter_ref_06_05;Inter_H_window_1_4 = Inter_ref_07_05;
						Inter_H_window_2_4 = Inter_ref_08_05;Inter_H_window_3_4 = Inter_ref_09_05;
						Inter_H_window_4_4 = Inter_ref_10_05;Inter_H_window_5_4 = Inter_ref_11_05;
							
						Inter_H_window_0_5 = Inter_ref_06_06;Inter_H_window_1_5 = Inter_ref_07_06;
						Inter_H_window_2_5 = Inter_ref_08_06;Inter_H_window_3_5 = Inter_ref_09_06;
						Inter_H_window_4_5 = Inter_ref_10_06;Inter_H_window_5_5 = Inter_ref_11_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_06_02;Inter_H_window_1_2 = Inter_ref_07_02;
						Inter_H_window_2_2 = Inter_ref_08_02;Inter_H_window_3_2 = Inter_ref_09_02;
						Inter_H_window_4_2 = Inter_ref_10_02;Inter_H_window_5_2 = Inter_ref_11_02;
							
						Inter_H_window_0_3 = Inter_ref_06_03;Inter_H_window_1_3 = Inter_ref_07_03;
						Inter_H_window_2_3 = Inter_ref_08_03;Inter_H_window_3_3 = Inter_ref_09_03;
						Inter_H_window_4_3 = Inter_ref_10_03;Inter_H_window_5_3 = Inter_ref_11_03;
						
						Inter_H_window_0_4 = Inter_ref_06_04;Inter_H_window_1_4 = Inter_ref_07_04;
						Inter_H_window_2_4 = Inter_ref_08_04;Inter_H_window_3_4 = Inter_ref_09_04;
						Inter_H_window_4_4 = Inter_ref_10_04;Inter_H_window_5_4 = Inter_ref_11_04;
							
						Inter_H_window_0_5 = Inter_ref_06_05;Inter_H_window_1_5 = Inter_ref_07_05;
						Inter_H_window_2_5 = Inter_ref_08_05;Inter_H_window_3_5 = Inter_ref_09_05;
						Inter_H_window_4_5 = Inter_ref_10_05;Inter_H_window_5_5 = Inter_ref_11_05;
					end	
				3'd1:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_07_03;Inter_H_window_1_2 = Inter_ref_08_03;
						Inter_H_window_2_2 = Inter_ref_09_03;Inter_H_window_3_2 = Inter_ref_10_03;
						Inter_H_window_4_2 = Inter_ref_11_03;Inter_H_window_5_2 = Inter_ref_12_03;
							
						Inter_H_window_0_3 = Inter_ref_07_04;Inter_H_window_1_3 = Inter_ref_08_04;
						Inter_H_window_2_3 = Inter_ref_09_04;Inter_H_window_3_3 = Inter_ref_10_04;
						Inter_H_window_4_3 = Inter_ref_11_04;Inter_H_window_5_3 = Inter_ref_12_04;
						
						Inter_H_window_0_4 = Inter_ref_07_05;Inter_H_window_1_4 = Inter_ref_08_05;
						Inter_H_window_2_4 = Inter_ref_09_05;Inter_H_window_3_4 = Inter_ref_10_05;
						Inter_H_window_4_4 = Inter_ref_11_05;Inter_H_window_5_4 = Inter_ref_12_05;
							                                                                
						Inter_H_window_0_5 = Inter_ref_07_06;Inter_H_window_1_5 = Inter_ref_08_06;
						Inter_H_window_2_5 = Inter_ref_09_06;Inter_H_window_3_5 = Inter_ref_10_06;
						Inter_H_window_4_5 = Inter_ref_11_06;Inter_H_window_5_5 = Inter_ref_12_06;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_07_02;Inter_H_window_1_2 = Inter_ref_08_02;
						Inter_H_window_2_2 = Inter_ref_09_02;Inter_H_window_3_2 = Inter_ref_10_02;
						Inter_H_window_4_2 = Inter_ref_11_02;Inter_H_window_5_2 = Inter_ref_12_02;
							                                                                
						Inter_H_window_0_3 = Inter_ref_07_03;Inter_H_window_1_3 = Inter_ref_08_03;
						Inter_H_window_2_3 = Inter_ref_09_03;Inter_H_window_3_3 = Inter_ref_10_03;
						Inter_H_window_4_3 = Inter_ref_11_03;Inter_H_window_5_3 = Inter_ref_12_03;
						                                                                        
						Inter_H_window_0_4 = Inter_ref_07_04;Inter_H_window_1_4 = Inter_ref_08_04;
						Inter_H_window_2_4 = Inter_ref_09_04;Inter_H_window_3_4 = Inter_ref_10_04;
						Inter_H_window_4_4 = Inter_ref_11_04;Inter_H_window_5_4 = Inter_ref_12_04;
							                                                                
						Inter_H_window_0_5 = Inter_ref_07_05;Inter_H_window_1_5 = Inter_ref_08_05;
						Inter_H_window_2_5 = Inter_ref_09_05;Inter_H_window_3_5 = Inter_ref_10_05;
						Inter_H_window_4_5 = Inter_ref_11_05;Inter_H_window_5_5 = Inter_ref_12_05;
					end
				default:
				begin
					Inter_H_window_0_2 = 0;Inter_H_window_1_2 = 0;Inter_H_window_2_2 = 0;
					Inter_H_window_3_2 = 0;Inter_H_window_4_2 = 0;Inter_H_window_5_2 = 0;
						
					Inter_H_window_0_3 = 0;Inter_H_window_1_3 = 0;Inter_H_window_2_3 = 0;
					Inter_H_window_3_3 = 0;Inter_H_window_4_3 = 0;Inter_H_window_5_3 = 0;
						
					Inter_H_window_0_4 = 0;Inter_H_window_1_4 = 0;Inter_H_window_2_4 = 0;
					Inter_H_window_3_4 = 0;Inter_H_window_4_4 = 0;Inter_H_window_5_4 = 0;
							
					Inter_H_window_0_5 = 0;Inter_H_window_1_5 = 0;Inter_H_window_2_5 = 0;
					Inter_H_window_3_5 = 0;Inter_H_window_4_5 = 0;Inter_H_window_5_5 = 0;
				end
			endcase
			4'b0010: //Left bottom blk4x4
			case (Inter_H_window_counter1)
				3'd4:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_00_07;Inter_H_window_1_2 = Inter_ref_01_07;
						Inter_H_window_2_2 = Inter_ref_02_07;Inter_H_window_3_2 = Inter_ref_03_07;
						Inter_H_window_4_2 = Inter_ref_04_07;Inter_H_window_5_2 = Inter_ref_05_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_00_08;Inter_H_window_1_3 = Inter_ref_01_08;
						Inter_H_window_2_3 = Inter_ref_02_08;Inter_H_window_3_3 = Inter_ref_03_08;
						Inter_H_window_4_3 = Inter_ref_04_08;Inter_H_window_5_3 = Inter_ref_05_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_00_09;Inter_H_window_1_4 = Inter_ref_01_09;
						Inter_H_window_2_4 = Inter_ref_02_09;Inter_H_window_3_4 = Inter_ref_03_09;
						Inter_H_window_4_4 = Inter_ref_04_09;Inter_H_window_5_4 = Inter_ref_05_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_00_10;Inter_H_window_1_5 = Inter_ref_01_10;
						Inter_H_window_2_5 = Inter_ref_02_10;Inter_H_window_3_5 = Inter_ref_03_10;
						Inter_H_window_4_5 = Inter_ref_04_10;Inter_H_window_5_5 = Inter_ref_05_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_00_06;Inter_H_window_1_2 = Inter_ref_01_06;
						Inter_H_window_2_2 = Inter_ref_02_06;Inter_H_window_3_2 = Inter_ref_03_06;
						Inter_H_window_4_2 = Inter_ref_04_06;Inter_H_window_5_2 = Inter_ref_05_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_00_07;Inter_H_window_1_3 = Inter_ref_01_07;
						Inter_H_window_2_3 = Inter_ref_02_07;Inter_H_window_3_3 = Inter_ref_03_07;
						Inter_H_window_4_3 = Inter_ref_04_07;Inter_H_window_5_3 = Inter_ref_05_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_00_08;Inter_H_window_1_4 = Inter_ref_01_08;
						Inter_H_window_2_4 = Inter_ref_02_08;Inter_H_window_3_4 = Inter_ref_03_08;
						Inter_H_window_4_4 = Inter_ref_04_08;Inter_H_window_5_4 = Inter_ref_05_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_00_09;Inter_H_window_1_5 = Inter_ref_01_09;
						Inter_H_window_2_5 = Inter_ref_02_09;Inter_H_window_3_5 = Inter_ref_03_09;
						Inter_H_window_4_5 = Inter_ref_04_09;Inter_H_window_5_5 = Inter_ref_05_09;
					end
				3'd3:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_01_07;Inter_H_window_1_2 = Inter_ref_02_07;
						Inter_H_window_2_2 = Inter_ref_03_07;Inter_H_window_3_2 = Inter_ref_04_07;
						Inter_H_window_4_2 = Inter_ref_05_07;Inter_H_window_5_2 = Inter_ref_06_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_01_08;Inter_H_window_1_3 = Inter_ref_02_08;
						Inter_H_window_2_3 = Inter_ref_03_08;Inter_H_window_3_3 = Inter_ref_04_08;
						Inter_H_window_4_3 = Inter_ref_05_08;Inter_H_window_5_3 = Inter_ref_06_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_01_09;Inter_H_window_1_4 = Inter_ref_02_09;
						Inter_H_window_2_4 = Inter_ref_03_09;Inter_H_window_3_4 = Inter_ref_04_09;
						Inter_H_window_4_4 = Inter_ref_05_09;Inter_H_window_5_4 = Inter_ref_06_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_01_10;Inter_H_window_1_5 = Inter_ref_02_10;
						Inter_H_window_2_5 = Inter_ref_03_10;Inter_H_window_3_5 = Inter_ref_04_10;
						Inter_H_window_4_5 = Inter_ref_05_10;Inter_H_window_5_5 = Inter_ref_06_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_01_06;Inter_H_window_1_2 = Inter_ref_02_06;
						Inter_H_window_2_2 = Inter_ref_03_06;Inter_H_window_3_2 = Inter_ref_04_06;
						Inter_H_window_4_2 = Inter_ref_05_06;Inter_H_window_5_2 = Inter_ref_06_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_01_07;Inter_H_window_1_3 = Inter_ref_02_07;
						Inter_H_window_2_3 = Inter_ref_03_07;Inter_H_window_3_3 = Inter_ref_04_07;
						Inter_H_window_4_3 = Inter_ref_05_07;Inter_H_window_5_3 = Inter_ref_06_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_01_08;Inter_H_window_1_4 = Inter_ref_02_08;
						Inter_H_window_2_4 = Inter_ref_03_08;Inter_H_window_3_4 = Inter_ref_04_08;
						Inter_H_window_4_4 = Inter_ref_05_08;Inter_H_window_5_4 = Inter_ref_06_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_01_09;Inter_H_window_1_5 = Inter_ref_02_09;
						Inter_H_window_2_5 = Inter_ref_03_09;Inter_H_window_3_5 = Inter_ref_04_09;
						Inter_H_window_4_5 = Inter_ref_05_09;Inter_H_window_5_5 = Inter_ref_06_09;
					end
				3'd2:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_02_07;Inter_H_window_1_2 = Inter_ref_03_07;
						Inter_H_window_2_2 = Inter_ref_04_07;Inter_H_window_3_2 = Inter_ref_05_07;
						Inter_H_window_4_2 = Inter_ref_06_07;Inter_H_window_5_2 = Inter_ref_07_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_02_08;Inter_H_window_1_3 = Inter_ref_03_08;
						Inter_H_window_2_3 = Inter_ref_04_08;Inter_H_window_3_3 = Inter_ref_05_08;
						Inter_H_window_4_3 = Inter_ref_06_08;Inter_H_window_5_3 = Inter_ref_07_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_02_09;Inter_H_window_1_4 = Inter_ref_03_09;
						Inter_H_window_2_4 = Inter_ref_04_09;Inter_H_window_3_4 = Inter_ref_05_09;
						Inter_H_window_4_4 = Inter_ref_06_09;Inter_H_window_5_4 = Inter_ref_07_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_02_10;Inter_H_window_1_5 = Inter_ref_03_10;
						Inter_H_window_2_5 = Inter_ref_04_10;Inter_H_window_3_5 = Inter_ref_05_10;
						Inter_H_window_4_5 = Inter_ref_06_10;Inter_H_window_5_5 = Inter_ref_07_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_02_06;Inter_H_window_1_2 = Inter_ref_03_06;
						Inter_H_window_2_2 = Inter_ref_04_06;Inter_H_window_3_2 = Inter_ref_05_06;
						Inter_H_window_4_2 = Inter_ref_06_06;Inter_H_window_5_2 = Inter_ref_07_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_02_07;Inter_H_window_1_3 = Inter_ref_03_07;
						Inter_H_window_2_3 = Inter_ref_04_07;Inter_H_window_3_3 = Inter_ref_05_07;
						Inter_H_window_4_3 = Inter_ref_06_07;Inter_H_window_5_3 = Inter_ref_07_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_02_08;Inter_H_window_1_4 = Inter_ref_03_08;
						Inter_H_window_2_4 = Inter_ref_04_08;Inter_H_window_3_4 = Inter_ref_05_08;
						Inter_H_window_4_4 = Inter_ref_06_08;Inter_H_window_5_4 = Inter_ref_07_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_02_09;Inter_H_window_1_5 = Inter_ref_03_09;
						Inter_H_window_2_5 = Inter_ref_04_09;Inter_H_window_3_5 = Inter_ref_05_09;
						Inter_H_window_4_5 = Inter_ref_06_09;Inter_H_window_5_5 = Inter_ref_07_09;
					end	
				3'd1:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_03_07;Inter_H_window_1_2 = Inter_ref_04_07;
						Inter_H_window_2_2 = Inter_ref_05_07;Inter_H_window_3_2 = Inter_ref_06_07;
						Inter_H_window_4_2 = Inter_ref_07_07;Inter_H_window_5_2 = Inter_ref_08_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_03_08;Inter_H_window_1_3 = Inter_ref_04_08;
						Inter_H_window_2_3 = Inter_ref_05_08;Inter_H_window_3_3 = Inter_ref_06_08;
						Inter_H_window_4_3 = Inter_ref_07_08;Inter_H_window_5_3 = Inter_ref_08_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_03_09;Inter_H_window_1_4 = Inter_ref_04_09;
						Inter_H_window_2_4 = Inter_ref_05_09;Inter_H_window_3_4 = Inter_ref_06_09;
						Inter_H_window_4_4 = Inter_ref_07_09;Inter_H_window_5_4 = Inter_ref_08_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_03_10;Inter_H_window_1_5 = Inter_ref_04_10;
						Inter_H_window_2_5 = Inter_ref_05_10;Inter_H_window_3_5 = Inter_ref_06_10;
						Inter_H_window_4_5 = Inter_ref_07_10;Inter_H_window_5_5 = Inter_ref_08_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_03_06;Inter_H_window_1_2 = Inter_ref_04_06;
						Inter_H_window_2_2 = Inter_ref_05_06;Inter_H_window_3_2 = Inter_ref_06_06;
						Inter_H_window_4_2 = Inter_ref_07_06;Inter_H_window_5_2 = Inter_ref_08_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_03_07;Inter_H_window_1_3 = Inter_ref_04_07;
						Inter_H_window_2_3 = Inter_ref_05_07;Inter_H_window_3_3 = Inter_ref_06_07;
						Inter_H_window_4_3 = Inter_ref_07_07;Inter_H_window_5_3 = Inter_ref_08_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_03_08;Inter_H_window_1_4 = Inter_ref_04_08;
						Inter_H_window_2_4 = Inter_ref_05_08;Inter_H_window_3_4 = Inter_ref_06_08;
						Inter_H_window_4_4 = Inter_ref_07_08;Inter_H_window_5_4 = Inter_ref_08_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_03_09;Inter_H_window_1_5 = Inter_ref_04_09;
						Inter_H_window_2_5 = Inter_ref_05_09;Inter_H_window_3_5 = Inter_ref_06_09;
						Inter_H_window_4_5 = Inter_ref_07_09;Inter_H_window_5_5 = Inter_ref_08_09;
					end
				default:
				begin
					Inter_H_window_0_2 = 0;Inter_H_window_1_2 = 0;Inter_H_window_2_2 = 0;
					Inter_H_window_3_2 = 0;Inter_H_window_4_2 = 0;Inter_H_window_5_2 = 0;
						
					Inter_H_window_0_3 = 0;Inter_H_window_1_3 = 0;Inter_H_window_2_3 = 0;
					Inter_H_window_3_3 = 0;Inter_H_window_4_3 = 0;Inter_H_window_5_3 = 0;
						
					Inter_H_window_0_4 = 0;Inter_H_window_1_4 = 0;Inter_H_window_2_4 = 0;
					Inter_H_window_3_4 = 0;Inter_H_window_4_4 = 0;Inter_H_window_5_4 = 0;
							
					Inter_H_window_0_5 = 0;Inter_H_window_1_5 = 0;Inter_H_window_2_5 = 0;
					Inter_H_window_3_5 = 0;Inter_H_window_4_5 = 0;Inter_H_window_5_5 = 0;
				end
			endcase
			4'b0001: //Right bottom blk4x4
			case (Inter_H_window_counter1)
				3'd4:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_04_07;Inter_H_window_1_2 = Inter_ref_05_07;
						Inter_H_window_2_2 = Inter_ref_06_07;Inter_H_window_3_2 = Inter_ref_07_07;
						Inter_H_window_4_2 = Inter_ref_08_07;Inter_H_window_5_2 = Inter_ref_09_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_04_08;Inter_H_window_1_3 = Inter_ref_05_08;
						Inter_H_window_2_3 = Inter_ref_06_08;Inter_H_window_3_3 = Inter_ref_07_08;
						Inter_H_window_4_3 = Inter_ref_08_08;Inter_H_window_5_3 = Inter_ref_09_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_04_09;Inter_H_window_1_4 = Inter_ref_05_09;
						Inter_H_window_2_4 = Inter_ref_06_09;Inter_H_window_3_4 = Inter_ref_07_09;
						Inter_H_window_4_4 = Inter_ref_08_09;Inter_H_window_5_4 = Inter_ref_09_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_04_10;Inter_H_window_1_5 = Inter_ref_05_10;
						Inter_H_window_2_5 = Inter_ref_06_10;Inter_H_window_3_5 = Inter_ref_07_10;
						Inter_H_window_4_5 = Inter_ref_08_10;Inter_H_window_5_5 = Inter_ref_09_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_04_06;Inter_H_window_1_2 = Inter_ref_05_06;
						Inter_H_window_2_2 = Inter_ref_06_06;Inter_H_window_3_2 = Inter_ref_07_06;
						Inter_H_window_4_2 = Inter_ref_08_06;Inter_H_window_5_2 = Inter_ref_09_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_04_07;Inter_H_window_1_3 = Inter_ref_05_07;
						Inter_H_window_2_3 = Inter_ref_06_07;Inter_H_window_3_3 = Inter_ref_07_07;
						Inter_H_window_4_3 = Inter_ref_08_07;Inter_H_window_5_3 = Inter_ref_09_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_04_08;Inter_H_window_1_4 = Inter_ref_05_08;
						Inter_H_window_2_4 = Inter_ref_06_08;Inter_H_window_3_4 = Inter_ref_07_08;
						Inter_H_window_4_4 = Inter_ref_08_08;Inter_H_window_5_4 = Inter_ref_09_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_04_09;Inter_H_window_1_5 = Inter_ref_05_09;
						Inter_H_window_2_5 = Inter_ref_06_09;Inter_H_window_3_5 = Inter_ref_07_09;
						Inter_H_window_4_5 = Inter_ref_08_09;Inter_H_window_5_5 = Inter_ref_09_09;
					end
				3'd3:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_05_07;Inter_H_window_1_2 = Inter_ref_06_07;
						Inter_H_window_2_2 = Inter_ref_07_07;Inter_H_window_3_2 = Inter_ref_08_07;
						Inter_H_window_4_2 = Inter_ref_09_07;Inter_H_window_5_2 = Inter_ref_10_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_05_08;Inter_H_window_1_3 = Inter_ref_06_08;
						Inter_H_window_2_3 = Inter_ref_07_08;Inter_H_window_3_3 = Inter_ref_08_08;
						Inter_H_window_4_3 = Inter_ref_09_08;Inter_H_window_5_3 = Inter_ref_10_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_05_09;Inter_H_window_1_4 = Inter_ref_06_09;
						Inter_H_window_2_4 = Inter_ref_07_09;Inter_H_window_3_4 = Inter_ref_08_09;
						Inter_H_window_4_4 = Inter_ref_09_09;Inter_H_window_5_4 = Inter_ref_10_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_05_10;Inter_H_window_1_5 = Inter_ref_06_10;
						Inter_H_window_2_5 = Inter_ref_07_10;Inter_H_window_3_5 = Inter_ref_08_10;
						Inter_H_window_4_5 = Inter_ref_09_10;Inter_H_window_5_5 = Inter_ref_10_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_05_06;Inter_H_window_1_2 = Inter_ref_06_06;
						Inter_H_window_2_2 = Inter_ref_07_06;Inter_H_window_3_2 = Inter_ref_08_06;
						Inter_H_window_4_2 = Inter_ref_09_06;Inter_H_window_5_2 = Inter_ref_10_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_05_07;Inter_H_window_1_3 = Inter_ref_06_07;
						Inter_H_window_2_3 = Inter_ref_07_07;Inter_H_window_3_3 = Inter_ref_08_07;
						Inter_H_window_4_3 = Inter_ref_09_07;Inter_H_window_5_3 = Inter_ref_10_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_05_08;Inter_H_window_1_4 = Inter_ref_06_08;
						Inter_H_window_2_4 = Inter_ref_07_08;Inter_H_window_3_4 = Inter_ref_08_08;
						Inter_H_window_4_4 = Inter_ref_09_08;Inter_H_window_5_4 = Inter_ref_10_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_05_09;Inter_H_window_1_5 = Inter_ref_06_09;
						Inter_H_window_2_5 = Inter_ref_07_09;Inter_H_window_3_5 = Inter_ref_08_09;
						Inter_H_window_4_5 = Inter_ref_09_09;Inter_H_window_5_5 = Inter_ref_10_09;
					end
				3'd2:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_06_07;Inter_H_window_1_2 = Inter_ref_07_07;
						Inter_H_window_2_2 = Inter_ref_08_07;Inter_H_window_3_2 = Inter_ref_09_07;
						Inter_H_window_4_2 = Inter_ref_10_07;Inter_H_window_5_2 = Inter_ref_11_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_06_08;Inter_H_window_1_3 = Inter_ref_07_08;
						Inter_H_window_2_3 = Inter_ref_08_08;Inter_H_window_3_3 = Inter_ref_09_08;
						Inter_H_window_4_3 = Inter_ref_10_08;Inter_H_window_5_3 = Inter_ref_11_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_06_09;Inter_H_window_1_4 = Inter_ref_07_09;
						Inter_H_window_2_4 = Inter_ref_08_09;Inter_H_window_3_4 = Inter_ref_09_09;
						Inter_H_window_4_4 = Inter_ref_10_09;Inter_H_window_5_4 = Inter_ref_11_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_06_10;Inter_H_window_1_5 = Inter_ref_07_10;
						Inter_H_window_2_5 = Inter_ref_08_10;Inter_H_window_3_5 = Inter_ref_09_10;
						Inter_H_window_4_5 = Inter_ref_10_10;Inter_H_window_5_5 = Inter_ref_11_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_06_06;Inter_H_window_1_2 = Inter_ref_07_06;
						Inter_H_window_2_2 = Inter_ref_08_06;Inter_H_window_3_2 = Inter_ref_09_06;
						Inter_H_window_4_2 = Inter_ref_10_06;Inter_H_window_5_2 = Inter_ref_11_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_06_07;Inter_H_window_1_3 = Inter_ref_07_07;
						Inter_H_window_2_3 = Inter_ref_08_07;Inter_H_window_3_3 = Inter_ref_09_07;
						Inter_H_window_4_3 = Inter_ref_10_07;Inter_H_window_5_3 = Inter_ref_11_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_06_08;Inter_H_window_1_4 = Inter_ref_07_08;
						Inter_H_window_2_4 = Inter_ref_08_08;Inter_H_window_3_4 = Inter_ref_09_08;
						Inter_H_window_4_4 = Inter_ref_10_08;Inter_H_window_5_4 = Inter_ref_11_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_06_09;Inter_H_window_1_5 = Inter_ref_07_09;
						Inter_H_window_2_5 = Inter_ref_08_09;Inter_H_window_3_5 = Inter_ref_09_09;
						Inter_H_window_4_5 = Inter_ref_10_09;Inter_H_window_5_5 = Inter_ref_11_09;
					end	
				3'd1:
				if (pos_FracL == `pos_p || pos_FracL == `pos_r)
					begin
						Inter_H_window_0_2 = Inter_ref_07_07;Inter_H_window_1_2 = Inter_ref_08_07;
						Inter_H_window_2_2 = Inter_ref_09_07;Inter_H_window_3_2 = Inter_ref_10_07;
						Inter_H_window_4_2 = Inter_ref_11_07;Inter_H_window_5_2 = Inter_ref_12_07;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_07_08;Inter_H_window_1_3 = Inter_ref_08_08;
						Inter_H_window_2_3 = Inter_ref_09_08;Inter_H_window_3_3 = Inter_ref_10_08;
						Inter_H_window_4_3 = Inter_ref_11_08;Inter_H_window_5_3 = Inter_ref_12_08;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_07_09;Inter_H_window_1_4 = Inter_ref_08_09;
						Inter_H_window_2_4 = Inter_ref_09_09;Inter_H_window_3_4 = Inter_ref_10_09;
						Inter_H_window_4_4 = Inter_ref_11_09;Inter_H_window_5_4 = Inter_ref_12_09;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_07_10;Inter_H_window_1_5 = Inter_ref_08_10;
						Inter_H_window_2_5 = Inter_ref_09_10;Inter_H_window_3_5 = Inter_ref_10_10;
						Inter_H_window_4_5 = Inter_ref_11_10;Inter_H_window_5_5 = Inter_ref_12_10;
					end
				else
					begin
						Inter_H_window_0_2 = Inter_ref_07_06;Inter_H_window_1_2 = Inter_ref_08_06;
						Inter_H_window_2_2 = Inter_ref_09_06;Inter_H_window_3_2 = Inter_ref_10_06;
						Inter_H_window_4_2 = Inter_ref_11_06;Inter_H_window_5_2 = Inter_ref_12_06;
							                                                                   
						Inter_H_window_0_3 = Inter_ref_07_07;Inter_H_window_1_3 = Inter_ref_08_07;
						Inter_H_window_2_3 = Inter_ref_09_07;Inter_H_window_3_3 = Inter_ref_10_07;
						Inter_H_window_4_3 = Inter_ref_11_07;Inter_H_window_5_3 = Inter_ref_12_07;
						                                                                           
						Inter_H_window_0_4 = Inter_ref_07_08;Inter_H_window_1_4 = Inter_ref_08_08;
						Inter_H_window_2_4 = Inter_ref_09_08;Inter_H_window_3_4 = Inter_ref_10_08;
						Inter_H_window_4_4 = Inter_ref_11_08;Inter_H_window_5_4 = Inter_ref_12_08;
							                                                                   
						Inter_H_window_0_5 = Inter_ref_07_09;Inter_H_window_1_5 = Inter_ref_08_09;
						Inter_H_window_2_5 = Inter_ref_09_09;Inter_H_window_3_5 = Inter_ref_10_09;
						Inter_H_window_4_5 = Inter_ref_11_09;Inter_H_window_5_5 = Inter_ref_12_09;
					end
				default:
				begin
					Inter_H_window_0_2 = 0;Inter_H_window_1_2 = 0;Inter_H_window_2_2 = 0;
					Inter_H_window_3_2 = 0;Inter_H_window_4_2 = 0;Inter_H_window_5_2 = 0;
						
					Inter_H_window_0_3 = 0;Inter_H_window_1_3 = 0;Inter_H_window_2_3 = 0;
					Inter_H_window_3_3 = 0;Inter_H_window_4_3 = 0;Inter_H_window_5_3 = 0;
						
					Inter_H_window_0_4 = 0;Inter_H_window_1_4 = 0;Inter_H_window_2_4 = 0;
					Inter_H_window_3_4 = 0;Inter_H_window_4_4 = 0;Inter_H_window_5_4 = 0;
							
					Inter_H_window_0_5 = 0;Inter_H_window_1_5 = 0;Inter_H_window_2_5 = 0;
					Inter_H_window_3_5 = 0;Inter_H_window_4_5 = 0;Inter_H_window_5_5 = 0;
				end
			endcase
			default:
			begin
				Inter_H_window_0_2 = 0;Inter_H_window_1_2 = 0;Inter_H_window_2_2 = 0;
				Inter_H_window_3_2 = 0;Inter_H_window_4_2 = 0;Inter_H_window_5_2 = 0;
						
				Inter_H_window_0_3 = 0;Inter_H_window_1_3 = 0;Inter_H_window_2_3 = 0;
				Inter_H_window_3_3 = 0;Inter_H_window_4_3 = 0;Inter_H_window_5_3 = 0;
						
				Inter_H_window_0_4 = 0;Inter_H_window_1_4 = 0;Inter_H_window_2_4 = 0;
				Inter_H_window_3_4 = 0;Inter_H_window_4_4 = 0;Inter_H_window_5_4 = 0;
							
				Inter_H_window_0_5 = 0;Inter_H_window_1_5 = 0;Inter_H_window_2_5 = 0;
				Inter_H_window_3_5 = 0;Inter_H_window_4_5 = 0;Inter_H_window_5_5 = 0;
			end
		endcase
		
	//Inter_V_window_counter:for Inter_V_window_0 ~ Inter_V_window_8
	reg [2:0] Inter_V_window_counter;
	always @ (pos_FracL or blk4x4_inter_calculate_counter)
		if  (((pos_FracL == `pos_h || pos_FracL == `pos_d || pos_FracL == `pos_n || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd4)	||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd8))
			Inter_V_window_counter = 3'd4;
		else if  (((pos_FracL == `pos_h || pos_FracL == `pos_d || pos_FracL == `pos_n || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd3)	||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd6))
			Inter_V_window_counter = 3'd3;
		else if  (((pos_FracL == `pos_h || pos_FracL == `pos_d || pos_FracL == `pos_n || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd2)	||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd4))
			Inter_V_window_counter = 3'd2;
		else if  (((pos_FracL == `pos_h || pos_FracL == `pos_d || pos_FracL == `pos_n || pos_FracL == `pos_e || pos_FracL == `pos_g 
			|| pos_FracL == `pos_p || pos_FracL == `pos_r) && blk4x4_inter_calculate_counter == 4'd1)	||
			((pos_FracL == `pos_i || pos_FracL == `pos_k) && blk4x4_inter_calculate_counter == 4'd2))
			Inter_V_window_counter = 3'd1;
		else
			Inter_V_window_counter = 0;
	
	//Inter_V_window_0 ~ Inter_V_window_8
	always @ (Is_blk4x4_0 or Is_blk4x4_1 or Is_blk4x4_2 or Is_blk4x4_3 or pos_FracL or Inter_V_window_counter
		or Inter_ref_02_00 or Inter_ref_02_01 or Inter_ref_02_02 or Inter_ref_02_03 or Inter_ref_02_04
		or Inter_ref_02_05 or Inter_ref_02_06 or Inter_ref_02_07 or Inter_ref_02_08 or Inter_ref_02_09
		or Inter_ref_02_10 or Inter_ref_02_11 or Inter_ref_02_12
		
		or Inter_ref_03_00 or Inter_ref_03_01 or Inter_ref_03_02 or Inter_ref_03_03 or Inter_ref_03_04
		or Inter_ref_03_05 or Inter_ref_03_06 or Inter_ref_03_07 or Inter_ref_03_08 or Inter_ref_03_09
		or Inter_ref_03_10 or Inter_ref_03_11 or Inter_ref_03_12
		
		or Inter_ref_04_00 or Inter_ref_04_01 or Inter_ref_04_02 or Inter_ref_04_03 or Inter_ref_04_04
		or Inter_ref_04_05 or Inter_ref_04_06 or Inter_ref_04_07 or Inter_ref_04_08 or Inter_ref_04_09
		or Inter_ref_04_10 or Inter_ref_04_11 or Inter_ref_04_12
		
		or Inter_ref_05_00 or Inter_ref_05_01 or Inter_ref_05_02 or Inter_ref_05_03 or Inter_ref_05_04
		or Inter_ref_05_05 or Inter_ref_05_06 or Inter_ref_05_07 or Inter_ref_05_08 or Inter_ref_05_09
		or Inter_ref_05_10 or Inter_ref_05_11 or Inter_ref_05_12
		
		or Inter_ref_06_00 or Inter_ref_06_01 or Inter_ref_06_02 or Inter_ref_06_03 or Inter_ref_06_04
		or Inter_ref_06_05 or Inter_ref_06_06 or Inter_ref_06_07 or Inter_ref_06_08 or Inter_ref_06_09
		or Inter_ref_06_10 or Inter_ref_06_11 or Inter_ref_06_12
		
		or Inter_ref_07_00 or Inter_ref_07_01 or Inter_ref_07_02 or Inter_ref_07_03 or Inter_ref_07_04
		or Inter_ref_07_05 or Inter_ref_07_06 or Inter_ref_07_07 or Inter_ref_07_08 or Inter_ref_07_09
		or Inter_ref_07_10 or Inter_ref_07_11 or Inter_ref_07_12
		
		or Inter_ref_08_00 or Inter_ref_08_01 or Inter_ref_08_02 or Inter_ref_08_03 or Inter_ref_08_04
		or Inter_ref_08_05 or Inter_ref_08_06 or Inter_ref_08_07 or Inter_ref_08_08 or Inter_ref_08_09
		or Inter_ref_08_10 or Inter_ref_08_11 or Inter_ref_08_12
		
		or Inter_ref_09_00 or Inter_ref_09_01 or Inter_ref_09_02 or Inter_ref_09_03 or Inter_ref_09_04
		or Inter_ref_09_05 or Inter_ref_09_06 or Inter_ref_09_07 or Inter_ref_09_08 or Inter_ref_09_09
		or Inter_ref_09_10 or Inter_ref_09_11 or Inter_ref_09_12
		
		or Inter_ref_10_00 or Inter_ref_10_01 or Inter_ref_10_02 or Inter_ref_10_03 or Inter_ref_10_04
		or Inter_ref_10_05 or Inter_ref_10_06 or Inter_ref_10_07 or Inter_ref_10_08 or Inter_ref_10_09
		or Inter_ref_10_10 or Inter_ref_10_11 or Inter_ref_10_12
		)	
		case ({Is_blk4x4_0,Is_blk4x4_1,Is_blk4x4_2,Is_blk4x4_3}) 
			4'b1000: //Left top blk4x4
			case (Inter_V_window_counter)
				3'd4:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_03_00;Inter_V_window_1 = Inter_ref_03_01;
						Inter_V_window_2 = Inter_ref_03_02;Inter_V_window_3 = Inter_ref_03_03;
						Inter_V_window_4 = Inter_ref_03_04;Inter_V_window_5 = Inter_ref_03_05;
						Inter_V_window_6 = Inter_ref_03_06;Inter_V_window_7 = Inter_ref_03_07;
						Inter_V_window_8 = Inter_ref_03_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_02_00;Inter_V_window_1 = Inter_ref_02_01;
						Inter_V_window_2 = Inter_ref_02_02;Inter_V_window_3 = Inter_ref_02_03;
						Inter_V_window_4 = Inter_ref_02_04;Inter_V_window_5 = Inter_ref_02_05;
						Inter_V_window_6 = Inter_ref_02_06;Inter_V_window_7 = Inter_ref_02_07;
						Inter_V_window_8 = Inter_ref_02_08;
					end
				3'd3:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_04_00;Inter_V_window_1 = Inter_ref_04_01;
						Inter_V_window_2 = Inter_ref_04_02;Inter_V_window_3 = Inter_ref_04_03;
						Inter_V_window_4 = Inter_ref_04_04;Inter_V_window_5 = Inter_ref_04_05;
						Inter_V_window_6 = Inter_ref_04_06;Inter_V_window_7 = Inter_ref_04_07;
						Inter_V_window_8 = Inter_ref_04_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_03_00;Inter_V_window_1 = Inter_ref_03_01;
						Inter_V_window_2 = Inter_ref_03_02;Inter_V_window_3 = Inter_ref_03_03;
						Inter_V_window_4 = Inter_ref_03_04;Inter_V_window_5 = Inter_ref_03_05;
						Inter_V_window_6 = Inter_ref_03_06;Inter_V_window_7 = Inter_ref_03_07;
						Inter_V_window_8 = Inter_ref_03_08;
					end
				3'd2:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_05_00;Inter_V_window_1 = Inter_ref_05_01;
						Inter_V_window_2 = Inter_ref_05_02;Inter_V_window_3 = Inter_ref_05_03;
						Inter_V_window_4 = Inter_ref_05_04;Inter_V_window_5 = Inter_ref_05_05;
						Inter_V_window_6 = Inter_ref_05_06;Inter_V_window_7 = Inter_ref_05_07;
						Inter_V_window_8 = Inter_ref_05_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_04_00;Inter_V_window_1 = Inter_ref_04_01;
						Inter_V_window_2 = Inter_ref_04_02;Inter_V_window_3 = Inter_ref_04_03;
						Inter_V_window_4 = Inter_ref_04_04;Inter_V_window_5 = Inter_ref_04_05;
						Inter_V_window_6 = Inter_ref_04_06;Inter_V_window_7 = Inter_ref_04_07;
						Inter_V_window_8 = Inter_ref_04_08;
					end
				3'd1:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_06_00;Inter_V_window_1 = Inter_ref_06_01;
						Inter_V_window_2 = Inter_ref_06_02;Inter_V_window_3 = Inter_ref_06_03;
						Inter_V_window_4 = Inter_ref_06_04;Inter_V_window_5 = Inter_ref_06_05;
						Inter_V_window_6 = Inter_ref_06_06;Inter_V_window_7 = Inter_ref_06_07;
						Inter_V_window_8 = Inter_ref_06_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_05_00;Inter_V_window_1 = Inter_ref_05_01;
						Inter_V_window_2 = Inter_ref_05_02;Inter_V_window_3 = Inter_ref_05_03;
						Inter_V_window_4 = Inter_ref_05_04;Inter_V_window_5 = Inter_ref_05_05;
						Inter_V_window_6 = Inter_ref_05_06;Inter_V_window_7 = Inter_ref_05_07;
						Inter_V_window_8 = Inter_ref_05_08;
					end
				default:
				begin 
					Inter_V_window_0 = 0;Inter_V_window_1 = 0;Inter_V_window_2 = 0;
					Inter_V_window_3 = 0;Inter_V_window_4 = 0;Inter_V_window_5 = 0;
					Inter_V_window_6 = 0;Inter_V_window_7 = 0;Inter_V_window_8 = 0;
				end
			endcase
			4'b0100: //Right top blk4x4
			case (Inter_V_window_counter)
				3'd4:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_07_00;Inter_V_window_1 = Inter_ref_07_01;
						Inter_V_window_2 = Inter_ref_07_02;Inter_V_window_3 = Inter_ref_07_03;
						Inter_V_window_4 = Inter_ref_07_04;Inter_V_window_5 = Inter_ref_07_05;
						Inter_V_window_6 = Inter_ref_07_06;Inter_V_window_7 = Inter_ref_07_07;
						Inter_V_window_8 = Inter_ref_07_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_06_00;Inter_V_window_1 = Inter_ref_06_01;
						Inter_V_window_2 = Inter_ref_06_02;Inter_V_window_3 = Inter_ref_06_03;
						Inter_V_window_4 = Inter_ref_06_04;Inter_V_window_5 = Inter_ref_06_05;
						Inter_V_window_6 = Inter_ref_06_06;Inter_V_window_7 = Inter_ref_06_07;
						Inter_V_window_8 = Inter_ref_06_08;
					end
				3'd3:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_08_00;Inter_V_window_1 = Inter_ref_08_01;
						Inter_V_window_2 = Inter_ref_08_02;Inter_V_window_3 = Inter_ref_08_03;
						Inter_V_window_4 = Inter_ref_08_04;Inter_V_window_5 = Inter_ref_08_05;
						Inter_V_window_6 = Inter_ref_08_06;Inter_V_window_7 = Inter_ref_08_07;
						Inter_V_window_8 = Inter_ref_08_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_07_00;Inter_V_window_1 = Inter_ref_07_01;
						Inter_V_window_2 = Inter_ref_07_02;Inter_V_window_3 = Inter_ref_07_03;
						Inter_V_window_4 = Inter_ref_07_04;Inter_V_window_5 = Inter_ref_07_05;
						Inter_V_window_6 = Inter_ref_07_06;Inter_V_window_7 = Inter_ref_07_07;
						Inter_V_window_8 = Inter_ref_07_08;
					end
				3'd2:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_09_00;Inter_V_window_1 = Inter_ref_09_01;
						Inter_V_window_2 = Inter_ref_09_02;Inter_V_window_3 = Inter_ref_09_03;
						Inter_V_window_4 = Inter_ref_09_04;Inter_V_window_5 = Inter_ref_09_05;
						Inter_V_window_6 = Inter_ref_09_06;Inter_V_window_7 = Inter_ref_09_07;
						Inter_V_window_8 = Inter_ref_09_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_08_00;Inter_V_window_1 = Inter_ref_08_01;
						Inter_V_window_2 = Inter_ref_08_02;Inter_V_window_3 = Inter_ref_08_03;
						Inter_V_window_4 = Inter_ref_08_04;Inter_V_window_5 = Inter_ref_08_05;
						Inter_V_window_6 = Inter_ref_08_06;Inter_V_window_7 = Inter_ref_08_07;
						Inter_V_window_8 = Inter_ref_08_08;
					end
				3'd1:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_10_00;Inter_V_window_1 = Inter_ref_10_01;
						Inter_V_window_2 = Inter_ref_10_02;Inter_V_window_3 = Inter_ref_10_03;
						Inter_V_window_4 = Inter_ref_10_04;Inter_V_window_5 = Inter_ref_10_05;
						Inter_V_window_6 = Inter_ref_10_06;Inter_V_window_7 = Inter_ref_10_07;
						Inter_V_window_8 = Inter_ref_10_08;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_09_00;Inter_V_window_1 = Inter_ref_09_01;
						Inter_V_window_2 = Inter_ref_09_02;Inter_V_window_3 = Inter_ref_09_03;
						Inter_V_window_4 = Inter_ref_09_04;Inter_V_window_5 = Inter_ref_09_05;
						Inter_V_window_6 = Inter_ref_09_06;Inter_V_window_7 = Inter_ref_09_07;
						Inter_V_window_8 = Inter_ref_09_08;
					end
				default:
				begin 
					Inter_V_window_0 = 0;Inter_V_window_1 = 0;Inter_V_window_2 = 0;
					Inter_V_window_3 = 0;Inter_V_window_4 = 0;Inter_V_window_5 = 0;
					Inter_V_window_6 = 0;Inter_V_window_7 = 0;Inter_V_window_8 = 0;
				end
			endcase
			4'b0010: //Left bottom blk4x4
			case (Inter_V_window_counter)
				3'd4:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_03_04;Inter_V_window_1 = Inter_ref_03_05;
						Inter_V_window_2 = Inter_ref_03_06;Inter_V_window_3 = Inter_ref_03_07;
						Inter_V_window_4 = Inter_ref_03_08;Inter_V_window_5 = Inter_ref_03_09;
						Inter_V_window_6 = Inter_ref_03_10;Inter_V_window_7 = Inter_ref_03_11;
						Inter_V_window_8 = Inter_ref_03_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_02_04;Inter_V_window_1 = Inter_ref_02_05;
						Inter_V_window_2 = Inter_ref_02_06;Inter_V_window_3 = Inter_ref_02_07;
						Inter_V_window_4 = Inter_ref_02_08;Inter_V_window_5 = Inter_ref_02_09;
						Inter_V_window_6 = Inter_ref_02_10;Inter_V_window_7 = Inter_ref_02_11;
						Inter_V_window_8 = Inter_ref_02_12;
					end
				3'd3:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_04_04;Inter_V_window_1 = Inter_ref_04_05;
						Inter_V_window_2 = Inter_ref_04_06;Inter_V_window_3 = Inter_ref_04_07;
						Inter_V_window_4 = Inter_ref_04_08;Inter_V_window_5 = Inter_ref_04_09;
						Inter_V_window_6 = Inter_ref_04_10;Inter_V_window_7 = Inter_ref_04_11;
						Inter_V_window_8 = Inter_ref_04_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_03_04;Inter_V_window_1 = Inter_ref_03_05;
						Inter_V_window_2 = Inter_ref_03_06;Inter_V_window_3 = Inter_ref_03_07;
						Inter_V_window_4 = Inter_ref_03_08;Inter_V_window_5 = Inter_ref_03_09;
						Inter_V_window_6 = Inter_ref_03_10;Inter_V_window_7 = Inter_ref_03_11;
						Inter_V_window_8 = Inter_ref_03_12;
					end
				3'd2:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_05_04;Inter_V_window_1 = Inter_ref_05_05;
						Inter_V_window_2 = Inter_ref_05_06;Inter_V_window_3 = Inter_ref_05_07;
						Inter_V_window_4 = Inter_ref_05_08;Inter_V_window_5 = Inter_ref_05_09;
						Inter_V_window_6 = Inter_ref_05_10;Inter_V_window_7 = Inter_ref_05_11;
						Inter_V_window_8 = Inter_ref_05_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_04_04;Inter_V_window_1 = Inter_ref_04_05;
						Inter_V_window_2 = Inter_ref_04_06;Inter_V_window_3 = Inter_ref_04_07;
						Inter_V_window_4 = Inter_ref_04_08;Inter_V_window_5 = Inter_ref_04_09;
						Inter_V_window_6 = Inter_ref_04_10;Inter_V_window_7 = Inter_ref_04_11;
						Inter_V_window_8 = Inter_ref_04_12;
					end
				3'd1:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_06_04;Inter_V_window_1 = Inter_ref_06_05;
						Inter_V_window_2 = Inter_ref_06_06;Inter_V_window_3 = Inter_ref_06_07;
						Inter_V_window_4 = Inter_ref_06_08;Inter_V_window_5 = Inter_ref_06_09;
						Inter_V_window_6 = Inter_ref_06_10;Inter_V_window_7 = Inter_ref_06_11;
						Inter_V_window_8 = Inter_ref_06_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_05_04;Inter_V_window_1 = Inter_ref_05_05;
						Inter_V_window_2 = Inter_ref_05_06;Inter_V_window_3 = Inter_ref_05_07;
						Inter_V_window_4 = Inter_ref_05_08;Inter_V_window_5 = Inter_ref_05_09;
						Inter_V_window_6 = Inter_ref_05_10;Inter_V_window_7 = Inter_ref_05_11;
						Inter_V_window_8 = Inter_ref_05_12;
					end
				default:
				begin 
					Inter_V_window_0 = 0;Inter_V_window_1 = 0;Inter_V_window_2 = 0;
					Inter_V_window_3 = 0;Inter_V_window_4 = 0;Inter_V_window_5 = 0;
					Inter_V_window_6 = 0;Inter_V_window_7 = 0;Inter_V_window_8 = 0;
				end
			endcase
			4'b0001: //Right bottom blk4x4
			case (Inter_V_window_counter)
				3'd4:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_07_04;Inter_V_window_1 = Inter_ref_07_05;
						Inter_V_window_2 = Inter_ref_07_06;Inter_V_window_3 = Inter_ref_07_07;
						Inter_V_window_4 = Inter_ref_07_08;Inter_V_window_5 = Inter_ref_07_09;
						Inter_V_window_6 = Inter_ref_07_10;Inter_V_window_7 = Inter_ref_07_11;
						Inter_V_window_8 = Inter_ref_07_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_06_04;Inter_V_window_1 = Inter_ref_06_05;
						Inter_V_window_2 = Inter_ref_06_06;Inter_V_window_3 = Inter_ref_06_07;
						Inter_V_window_4 = Inter_ref_06_08;Inter_V_window_5 = Inter_ref_06_09;
						Inter_V_window_6 = Inter_ref_06_10;Inter_V_window_7 = Inter_ref_06_11;
						Inter_V_window_8 = Inter_ref_06_12;
					end
				3'd3:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_08_04;Inter_V_window_1 = Inter_ref_08_05;
						Inter_V_window_2 = Inter_ref_08_06;Inter_V_window_3 = Inter_ref_08_07;
						Inter_V_window_4 = Inter_ref_08_08;Inter_V_window_5 = Inter_ref_08_09;
						Inter_V_window_6 = Inter_ref_08_10;Inter_V_window_7 = Inter_ref_08_11;
						Inter_V_window_8 = Inter_ref_08_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_07_04;Inter_V_window_1 = Inter_ref_07_05;
						Inter_V_window_2 = Inter_ref_07_06;Inter_V_window_3 = Inter_ref_07_07;
						Inter_V_window_4 = Inter_ref_07_08;Inter_V_window_5 = Inter_ref_07_09;
						Inter_V_window_6 = Inter_ref_07_10;Inter_V_window_7 = Inter_ref_07_11;
						Inter_V_window_8 = Inter_ref_07_12;
					end
				3'd2:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_09_04;Inter_V_window_1 = Inter_ref_09_05;
						Inter_V_window_2 = Inter_ref_09_06;Inter_V_window_3 = Inter_ref_09_07;
						Inter_V_window_4 = Inter_ref_09_08;Inter_V_window_5 = Inter_ref_09_09;
						Inter_V_window_6 = Inter_ref_09_10;Inter_V_window_7 = Inter_ref_09_11;
						Inter_V_window_8 = Inter_ref_09_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_08_04;Inter_V_window_1 = Inter_ref_08_05;
						Inter_V_window_2 = Inter_ref_08_06;Inter_V_window_3 = Inter_ref_08_07;
						Inter_V_window_4 = Inter_ref_08_08;Inter_V_window_5 = Inter_ref_08_09;
						Inter_V_window_6 = Inter_ref_08_10;Inter_V_window_7 = Inter_ref_08_11;
						Inter_V_window_8 = Inter_ref_08_12;
					end
				3'd1:
				if (pos_FracL == `pos_g || pos_FracL == `pos_r || pos_FracL == `pos_k)
					begin
						Inter_V_window_0 = Inter_ref_10_04;Inter_V_window_1 = Inter_ref_10_05;
						Inter_V_window_2 = Inter_ref_10_06;Inter_V_window_3 = Inter_ref_10_07;
						Inter_V_window_4 = Inter_ref_10_08;Inter_V_window_5 = Inter_ref_10_09;
						Inter_V_window_6 = Inter_ref_10_10;Inter_V_window_7 = Inter_ref_10_11;
						Inter_V_window_8 = Inter_ref_10_12;
					end
				else
					begin
						Inter_V_window_0 = Inter_ref_09_04;Inter_V_window_1 = Inter_ref_09_05;
						Inter_V_window_2 = Inter_ref_09_06;Inter_V_window_3 = Inter_ref_09_07;
						Inter_V_window_4 = Inter_ref_09_08;Inter_V_window_5 = Inter_ref_09_09;
						Inter_V_window_6 = Inter_ref_09_10;Inter_V_window_7 = Inter_ref_09_11;
						Inter_V_window_8 = Inter_ref_09_12;
					end
				default:
				begin 
					Inter_V_window_0 = 0;Inter_V_window_1 = 0;Inter_V_window_2 = 0;
					Inter_V_window_3 = 0;Inter_V_window_4 = 0;Inter_V_window_5 = 0;
					Inter_V_window_6 = 0;Inter_V_window_7 = 0;Inter_V_window_8 = 0;
				end
			endcase
			default:
			begin 
				Inter_V_window_0 = 0;Inter_V_window_1 = 0;Inter_V_window_2 = 0;
				Inter_V_window_3 = 0;Inter_V_window_4 = 0;Inter_V_window_5 = 0;
				Inter_V_window_6 = 0;Inter_V_window_7 = 0;Inter_V_window_8 = 0;
			end
		endcase
	
	//Luma bilinear window
	always @ (Is_blk4x4_0 or Is_blk4x4_1 or Is_blk4x4_2 or Is_blk4x4_3 or pos_FracL or blk4x4_inter_calculate_counter
		or Inter_ref_02_02 or Inter_ref_03_02 or Inter_ref_04_02 or Inter_ref_05_02 or Inter_ref_06_02
		or Inter_ref_07_02 or Inter_ref_08_02 or Inter_ref_09_02 or Inter_ref_10_02
		or Inter_ref_02_03 or Inter_ref_03_03 or Inter_ref_04_03 or Inter_ref_05_03 or Inter_ref_06_03
		or Inter_ref_07_03 or Inter_ref_08_03 or Inter_ref_09_03 or Inter_ref_10_03
		or Inter_ref_02_04 or Inter_ref_03_04 or Inter_ref_04_04 or Inter_ref_05_04 or Inter_ref_06_04
		or Inter_ref_07_04 or Inter_ref_08_04 or Inter_ref_09_04 or Inter_ref_10_04
		or Inter_ref_02_05 or Inter_ref_03_05 or Inter_ref_04_05 or Inter_ref_05_05 or Inter_ref_06_05
		or Inter_ref_07_05 or Inter_ref_08_05 or Inter_ref_09_05 or Inter_ref_10_05
		or Inter_ref_02_06 or Inter_ref_03_06 or Inter_ref_04_06 or Inter_ref_05_06 or Inter_ref_06_06
		or Inter_ref_07_06 or Inter_ref_08_06 or Inter_ref_09_06 or Inter_ref_10_06
		or Inter_ref_02_07 or Inter_ref_03_07 or Inter_ref_04_07 or Inter_ref_05_07 or Inter_ref_06_07
		or Inter_ref_07_07 or Inter_ref_08_07 or Inter_ref_09_07 or Inter_ref_10_07
		or Inter_ref_02_08 or Inter_ref_03_08 or Inter_ref_04_08 or Inter_ref_05_08 or Inter_ref_06_08
		or Inter_ref_07_08 or Inter_ref_08_08 or Inter_ref_09_08 or Inter_ref_10_08
		or Inter_ref_02_09 or Inter_ref_03_09 or Inter_ref_04_09 or Inter_ref_05_09 or Inter_ref_06_09
		or Inter_ref_07_09 or Inter_ref_08_09 or Inter_ref_09_09 or Inter_ref_10_09
		or Inter_ref_02_10 or Inter_ref_03_10 or Inter_ref_04_10 or Inter_ref_05_10 or Inter_ref_06_10
		or Inter_ref_07_10 or Inter_ref_08_10 or Inter_ref_09_10)
		case ({Is_blk4x4_0,Is_blk4x4_1,Is_blk4x4_2,Is_blk4x4_3})
			4'b1000: //Left top blk4x4
			case (pos_FracL)
				`pos_a,`pos_d:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_02_02;Inter_bi_window_1 = Inter_ref_02_03;
								Inter_bi_window_2 = Inter_ref_02_04;Inter_bi_window_3 = Inter_ref_02_05;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_03_02;Inter_bi_window_1 = Inter_ref_03_03;
								Inter_bi_window_2 = Inter_ref_03_04;Inter_bi_window_3 = Inter_ref_03_05;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_04_02;Inter_bi_window_1 = Inter_ref_04_03;
								Inter_bi_window_2 = Inter_ref_04_04;Inter_bi_window_3 = Inter_ref_04_05;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_05_02;Inter_bi_window_1 = Inter_ref_05_03;
								Inter_bi_window_2 = Inter_ref_05_04;Inter_bi_window_3 = Inter_ref_05_05;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase			
				`pos_c:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_03_02;Inter_bi_window_1 = Inter_ref_03_03;
								Inter_bi_window_2 = Inter_ref_03_04;Inter_bi_window_3 = Inter_ref_03_05;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_04_02;Inter_bi_window_1 = Inter_ref_04_03;
								Inter_bi_window_2 = Inter_ref_04_04;Inter_bi_window_3 = Inter_ref_04_05;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_05_02;Inter_bi_window_1 = Inter_ref_05_03;
								Inter_bi_window_2 = Inter_ref_05_04;Inter_bi_window_3 = Inter_ref_05_05;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_06_02;Inter_bi_window_1 = Inter_ref_06_03;
								Inter_bi_window_2 = Inter_ref_06_04;Inter_bi_window_3 = Inter_ref_06_05;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				`pos_n:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_02_03;Inter_bi_window_1 = Inter_ref_02_04;
								Inter_bi_window_2 = Inter_ref_02_05;Inter_bi_window_3 = Inter_ref_02_06;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_03_03;Inter_bi_window_1 = Inter_ref_03_04;
								Inter_bi_window_2 = Inter_ref_03_05;Inter_bi_window_3 = Inter_ref_03_06;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_04_03;Inter_bi_window_1 = Inter_ref_04_04;
								Inter_bi_window_2 = Inter_ref_04_05;Inter_bi_window_3 = Inter_ref_04_06;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_05_03;Inter_bi_window_1 = Inter_ref_05_04;
								Inter_bi_window_2 = Inter_ref_05_05;Inter_bi_window_3 = Inter_ref_05_06;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				default:
				begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
						Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
			endcase
			4'b0100: //Right top blk4x4
			case (pos_FracL)
				`pos_a,`pos_d:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_06_02;Inter_bi_window_1 = Inter_ref_06_03;
								Inter_bi_window_2 = Inter_ref_06_04;Inter_bi_window_3 = Inter_ref_06_05;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_07_02;Inter_bi_window_1 = Inter_ref_07_03;
								Inter_bi_window_2 = Inter_ref_07_04;Inter_bi_window_3 = Inter_ref_07_05;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_08_02;Inter_bi_window_1 = Inter_ref_08_03;
								Inter_bi_window_2 = Inter_ref_08_04;Inter_bi_window_3 = Inter_ref_08_05;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_09_02;Inter_bi_window_1 = Inter_ref_09_03;
								Inter_bi_window_2 = Inter_ref_09_04;Inter_bi_window_3 = Inter_ref_09_05;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase			
				`pos_c:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_07_02;Inter_bi_window_1 = Inter_ref_07_03;
								Inter_bi_window_2 = Inter_ref_07_04;Inter_bi_window_3 = Inter_ref_07_05;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_08_02;Inter_bi_window_1 = Inter_ref_08_03;
								Inter_bi_window_2 = Inter_ref_08_04;Inter_bi_window_3 = Inter_ref_08_05;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_09_02;Inter_bi_window_1 = Inter_ref_09_03;
								Inter_bi_window_2 = Inter_ref_09_04;Inter_bi_window_3 = Inter_ref_09_05;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_10_02;Inter_bi_window_1 = Inter_ref_10_03;
								Inter_bi_window_2 = Inter_ref_10_04;Inter_bi_window_3 = Inter_ref_10_05;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				`pos_n:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_06_03;Inter_bi_window_1 = Inter_ref_06_04;
								Inter_bi_window_2 = Inter_ref_06_05;Inter_bi_window_3 = Inter_ref_06_06;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_07_03;Inter_bi_window_1 = Inter_ref_07_04;
								Inter_bi_window_2 = Inter_ref_07_05;Inter_bi_window_3 = Inter_ref_07_06;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_08_03;Inter_bi_window_1 = Inter_ref_08_04;
								Inter_bi_window_2 = Inter_ref_08_05;Inter_bi_window_3 = Inter_ref_08_06;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_09_03;Inter_bi_window_1 = Inter_ref_09_04;
								Inter_bi_window_2 = Inter_ref_09_05;Inter_bi_window_3 = Inter_ref_09_06;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				default:
				begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
						Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
			endcase
			4'b0010: //Left bottom blk4x4
			case (pos_FracL)
				`pos_a,`pos_d:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_02_06;Inter_bi_window_1 = Inter_ref_02_07;
								Inter_bi_window_2 = Inter_ref_02_08;Inter_bi_window_3 = Inter_ref_02_09;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_03_06;Inter_bi_window_1 = Inter_ref_03_07;
								Inter_bi_window_2 = Inter_ref_03_08;Inter_bi_window_3 = Inter_ref_03_09;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_04_06;Inter_bi_window_1 = Inter_ref_04_07;
								Inter_bi_window_2 = Inter_ref_04_08;Inter_bi_window_3 = Inter_ref_04_09;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_05_06;Inter_bi_window_1 = Inter_ref_05_07;
								Inter_bi_window_2 = Inter_ref_05_08;Inter_bi_window_3 = Inter_ref_05_09;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase			
				`pos_c:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_03_06;Inter_bi_window_1 = Inter_ref_03_07;
								Inter_bi_window_2 = Inter_ref_03_08;Inter_bi_window_3 = Inter_ref_03_09;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_04_06;Inter_bi_window_1 = Inter_ref_04_07;
								Inter_bi_window_2 = Inter_ref_04_08;Inter_bi_window_3 = Inter_ref_04_09;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_05_06;Inter_bi_window_1 = Inter_ref_05_07;
								Inter_bi_window_2 = Inter_ref_05_08;Inter_bi_window_3 = Inter_ref_05_09;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_06_06;Inter_bi_window_1 = Inter_ref_06_07;
								Inter_bi_window_2 = Inter_ref_06_08;Inter_bi_window_3 = Inter_ref_06_09;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				`pos_n:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_02_07;Inter_bi_window_1 = Inter_ref_02_08;
								Inter_bi_window_2 = Inter_ref_02_09;Inter_bi_window_3 = Inter_ref_02_10;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_03_07;Inter_bi_window_1 = Inter_ref_03_08;
								Inter_bi_window_2 = Inter_ref_03_09;Inter_bi_window_3 = Inter_ref_03_10;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_04_07;Inter_bi_window_1 = Inter_ref_04_08;
								Inter_bi_window_2 = Inter_ref_04_09;Inter_bi_window_3 = Inter_ref_04_10;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_05_07;Inter_bi_window_1 = Inter_ref_05_08;
								Inter_bi_window_2 = Inter_ref_05_09;Inter_bi_window_3 = Inter_ref_05_10;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				default:
				begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
						Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
			endcase
			4'b0001: //Right bottom blk4x4
			case (pos_FracL)
				`pos_a,`pos_d:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_06_06;Inter_bi_window_1 = Inter_ref_06_07;
								Inter_bi_window_2 = Inter_ref_06_08;Inter_bi_window_3 = Inter_ref_06_09;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_07_06;Inter_bi_window_1 = Inter_ref_07_07;
								Inter_bi_window_2 = Inter_ref_07_08;Inter_bi_window_3 = Inter_ref_07_09;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_08_06;Inter_bi_window_1 = Inter_ref_08_07;
								Inter_bi_window_2 = Inter_ref_08_08;Inter_bi_window_3 = Inter_ref_08_09;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_09_06;Inter_bi_window_1 = Inter_ref_09_07;
								Inter_bi_window_2 = Inter_ref_09_08;Inter_bi_window_3 = Inter_ref_09_09;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase			
				`pos_c:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_07_06;Inter_bi_window_1 = Inter_ref_07_07;
								Inter_bi_window_2 = Inter_ref_07_08;Inter_bi_window_3 = Inter_ref_07_09;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_08_06;Inter_bi_window_1 = Inter_ref_08_07;
								Inter_bi_window_2 = Inter_ref_08_08;Inter_bi_window_3 = Inter_ref_08_09;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_09_06;Inter_bi_window_1 = Inter_ref_09_07;
								Inter_bi_window_2 = Inter_ref_09_08;Inter_bi_window_3 = Inter_ref_09_09;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_10_06;Inter_bi_window_1 = Inter_ref_10_07;
								Inter_bi_window_2 = Inter_ref_10_08;Inter_bi_window_3 = Inter_ref_10_09;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				`pos_n:
				case (blk4x4_inter_calculate_counter)
					4'd4:begin	Inter_bi_window_0 = Inter_ref_06_07;Inter_bi_window_1 = Inter_ref_06_08;
								Inter_bi_window_2 = Inter_ref_06_09;Inter_bi_window_3 = Inter_ref_06_10;	end
					4'd3:begin	Inter_bi_window_0 = Inter_ref_07_07;Inter_bi_window_1 = Inter_ref_07_08;
								Inter_bi_window_2 = Inter_ref_07_09;Inter_bi_window_3 = Inter_ref_07_10;	end
					4'd2:begin	Inter_bi_window_0 = Inter_ref_08_07;Inter_bi_window_1 = Inter_ref_08_08;
								Inter_bi_window_2 = Inter_ref_08_09;Inter_bi_window_3 = Inter_ref_08_10;	end
					4'd1:begin	Inter_bi_window_0 = Inter_ref_09_07;Inter_bi_window_1 = Inter_ref_09_08;
								Inter_bi_window_2 = Inter_ref_09_09;Inter_bi_window_3 = Inter_ref_09_10;	end
					default:begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
									Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
				endcase
				default:
				begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
						Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
			endcase
			default:
			begin	Inter_bi_window_0 = 0;Inter_bi_window_1 = 0;
					Inter_bi_window_2 = 0;Inter_bi_window_3 = 0;	end
		endcase
		
	//chroma sliding window:Inter_C_window_0 ~ Inter_C_window_3 
	always @ (IsInterChroma or blk4x4_inter_calculate_counter or mv_below8x8_curr
		or Inter_ref_00_00 or Inter_ref_01_00 or Inter_ref_02_00 or Inter_ref_03_00 or Inter_ref_04_00
		or Inter_ref_00_01 or Inter_ref_01_01 or Inter_ref_02_01 or Inter_ref_03_01 or Inter_ref_04_01
		or Inter_ref_00_02 or Inter_ref_01_02 or Inter_ref_02_02 or Inter_ref_03_02 or Inter_ref_04_02
		or Inter_ref_00_03 or Inter_ref_01_03 or Inter_ref_02_03 or Inter_ref_03_03 or Inter_ref_04_03
		or Inter_ref_00_04 or Inter_ref_01_04 or Inter_ref_02_04 or Inter_ref_03_04 or Inter_ref_04_04
		)
		if (IsInterChroma && mv_below8x8_curr == 1'b0)
			case (blk4x4_inter_calculate_counter)
				4'd4:
				begin 
					Inter_C_window_0_0 = Inter_ref_00_00; Inter_C_window_1_0 = Inter_ref_01_00;
					Inter_C_window_2_0 = Inter_ref_02_00;
					Inter_C_window_0_1 = Inter_ref_00_01; Inter_C_window_1_1 = Inter_ref_01_01;
					Inter_C_window_2_1 = Inter_ref_02_01;
					Inter_C_window_0_2 = Inter_ref_00_02; Inter_C_window_1_2 = Inter_ref_01_02;
					Inter_C_window_2_2 = Inter_ref_02_02;
				end
				4'd3:
				begin 
					Inter_C_window_0_0 = Inter_ref_02_00; Inter_C_window_1_0 = Inter_ref_03_00;
					Inter_C_window_2_0 = Inter_ref_04_00;
					Inter_C_window_0_1 = Inter_ref_02_01; Inter_C_window_1_1 = Inter_ref_03_01;
					Inter_C_window_2_1 = Inter_ref_04_01;
					Inter_C_window_0_2 = Inter_ref_02_02; Inter_C_window_1_2 = Inter_ref_03_02;
					Inter_C_window_2_2 = Inter_ref_04_02;
				end
				4'd2:
				begin 
					Inter_C_window_0_0 = Inter_ref_00_02; Inter_C_window_1_0 = Inter_ref_01_02;
					Inter_C_window_2_0 = Inter_ref_02_02;
					Inter_C_window_0_1 = Inter_ref_00_03; Inter_C_window_1_1 = Inter_ref_01_03;
					Inter_C_window_2_1 = Inter_ref_02_03;
					Inter_C_window_0_2 = Inter_ref_00_04; Inter_C_window_1_2 = Inter_ref_01_04;
					Inter_C_window_2_2 = Inter_ref_02_04;
				end
				4'd1:
				begin 
					Inter_C_window_0_0 = Inter_ref_02_02; Inter_C_window_1_0 = Inter_ref_03_02;
					Inter_C_window_2_0 = Inter_ref_04_02;
					Inter_C_window_0_1 = Inter_ref_02_03; Inter_C_window_1_1 = Inter_ref_03_03;
					Inter_C_window_2_1 = Inter_ref_04_03;
					Inter_C_window_0_2 = Inter_ref_02_04; Inter_C_window_1_2 = Inter_ref_03_04;
					Inter_C_window_2_2 = Inter_ref_04_04;
				end
				default:
				begin 
					Inter_C_window_0_0 = 0; Inter_C_window_1_0 = 0;Inter_C_window_2_0 = 0;
					Inter_C_window_0_1 = 0; Inter_C_window_1_1 = 0;Inter_C_window_2_1 = 0;
					Inter_C_window_0_2 = 0; Inter_C_window_1_2 = 0;Inter_C_window_2_2 = 0;
				end
			endcase
		else if (IsInterChroma && mv_below8x8_curr == 1'b1)
			case (blk4x4_inter_calculate_counter)
				4'd1:
				begin 
					Inter_C_window_0_0 = Inter_ref_00_00; Inter_C_window_1_0 = Inter_ref_01_00;
					Inter_C_window_2_0 = Inter_ref_02_00;
					Inter_C_window_0_1 = Inter_ref_00_01; Inter_C_window_1_1 = Inter_ref_01_01;
					Inter_C_window_2_1 = Inter_ref_02_01;
					Inter_C_window_0_2 = Inter_ref_00_02; Inter_C_window_1_2 = Inter_ref_01_02;
					Inter_C_window_2_2 = Inter_ref_02_02;
				end
				default:
				begin 
					Inter_C_window_0_0 = 0; Inter_C_window_1_0 = 0;Inter_C_window_2_0 = 0;
					Inter_C_window_0_1 = 0; Inter_C_window_1_1 = 0;Inter_C_window_2_1 = 0;
					Inter_C_window_0_2 = 0; Inter_C_window_1_2 = 0;Inter_C_window_2_2 = 0;
				end
			endcase	
		else
			begin 
				Inter_C_window_0_0 = 0; Inter_C_window_1_0 = 0;Inter_C_window_2_0 = 0;
				Inter_C_window_0_1 = 0; Inter_C_window_1_1 = 0;Inter_C_window_2_1 = 0;
				Inter_C_window_0_2 = 0; Inter_C_window_1_2 = 0;Inter_C_window_2_2 = 0;
			end



wire Is_V_jfqik; //Is_V_jfqik: whether read from original [7:0] integer pixels and round as +16 >> 5 or read from b_raw[14:0] and round as +512 >> 10
wire [14:0] V_6tapfilter0_A,V_6tapfilter0_B,V_6tapfilter0_C,V_6tapfilter0_D,V_6tapfilter0_E,V_6tapfilter0_F;	
wire [14:0] V_6tapfilter1_A,V_6tapfilter1_B,V_6tapfilter1_C,V_6tapfilter1_D,V_6tapfilter1_E,V_6tapfilter1_F;
wire [14:0] V_6tapfilter2_A,V_6tapfilter2_B,V_6tapfilter2_C,V_6tapfilter2_D,V_6tapfilter2_E,V_6tapfilter2_F;
wire [14:0] V_6tapfilter3_A,V_6tapfilter3_B,V_6tapfilter3_C,V_6tapfilter3_D,V_6tapfilter3_E,V_6tapfilter3_F;
wire [7:0] V_6tapfilter0_round_out,V_6tapfilter1_round_out,V_6tapfilter2_round_out,V_6tapfilter3_round_out;
filterV_6tap V_6tapfilter0 (
		.A(V_6tapfilter0_A),
		.B(V_6tapfilter0_B),
		.C(V_6tapfilter0_C),
		.D(V_6tapfilter0_D),
		.E(V_6tapfilter0_E),
		.F(V_6tapfilter0_F),
		.Is_jfqik(Is_V_jfqik),
		.round_out(V_6tapfilter0_round_out)
		);
filterV_6tap V_6tapfilter1 (
		.A(V_6tapfilter1_A),
		.B(V_6tapfilter1_B),
		.C(V_6tapfilter1_C),
		.D(V_6tapfilter1_D),
		.E(V_6tapfilter1_E),
		.F(V_6tapfilter1_F),
		.Is_jfqik(Is_V_jfqik),
		.round_out(V_6tapfilter1_round_out)
		);
filterV_6tap V_6tapfilter2 (
		.A(V_6tapfilter2_A),
		.B(V_6tapfilter2_B),
		.C(V_6tapfilter2_C),
		.D(V_6tapfilter2_D),
		.E(V_6tapfilter2_E),
		.F(V_6tapfilter2_F),
		.Is_jfqik(Is_V_jfqik),
		.round_out(V_6tapfilter2_round_out)
		);
filterV_6tap V_6tapfilter3 (
		.A(V_6tapfilter3_A),
		.B(V_6tapfilter3_B),
		.C(V_6tapfilter3_C),
		.D(V_6tapfilter3_D),
		.E(V_6tapfilter3_E),
		.F(V_6tapfilter3_F),
		.Is_jfqik(Is_V_jfqik),
		.round_out(V_6tapfilter3_round_out)
		);
assign Is_V_jfqik = (
	(pos_FracL == `pos_j && (
			blk4x4_inter_calculate_counter == 4'd4 || blk4x4_inter_calculate_counter == 4'd3 ||
			blk4x4_inter_calculate_counter == 4'd2 || blk4x4_inter_calculate_counter == 4'd1)) ||
	((pos_FracL == `pos_f || pos_FracL == `pos_q) && (	
			blk4x4_inter_calculate_counter == 4'd4 || blk4x4_inter_calculate_counter == 4'd3 ||
			blk4x4_inter_calculate_counter == 4'd2 || blk4x4_inter_calculate_counter == 4'd1))||
	((pos_FracL == `pos_i || pos_FracL == `pos_k) && (	
			blk4x4_inter_calculate_counter == 4'd7 || blk4x4_inter_calculate_counter == 4'd5 ||
			blk4x4_inter_calculate_counter == 4'd3 || blk4x4_inter_calculate_counter == 4'd1)))? 1'b1:1'b0;	
	
assign V_6tapfilter0_A = (Is_V_jfqik)? b0_raw_reg:{7'b0,Inter_V_window_0};
assign V_6tapfilter0_B = (Is_V_jfqik)? b1_raw_reg:{7'b0,Inter_V_window_1};
assign V_6tapfilter0_C = (Is_V_jfqik)? b2_raw_reg:{7'b0,Inter_V_window_2};
assign V_6tapfilter0_D = (Is_V_jfqik)? b3_raw_reg:{7'b0,Inter_V_window_3};
assign V_6tapfilter0_E = (Is_V_jfqik)? b4_raw_reg:{7'b0,Inter_V_window_4};
assign V_6tapfilter0_F = (Is_V_jfqik)? b5_raw_reg:{7'b0,Inter_V_window_5};
	
assign V_6tapfilter1_A = (Is_V_jfqik)? b1_raw_reg:{7'b0,Inter_V_window_1};
assign V_6tapfilter1_B = (Is_V_jfqik)? b2_raw_reg:{7'b0,Inter_V_window_2};
assign V_6tapfilter1_C = (Is_V_jfqik)? b3_raw_reg:{7'b0,Inter_V_window_3};
assign V_6tapfilter1_D = (Is_V_jfqik)? b4_raw_reg:{7'b0,Inter_V_window_4};
assign V_6tapfilter1_E = (Is_V_jfqik)? b5_raw_reg:{7'b0,Inter_V_window_5};
assign V_6tapfilter1_F = (Is_V_jfqik)? b6_raw_reg:{7'b0,Inter_V_window_6};
	
assign V_6tapfilter2_A = (Is_V_jfqik)? b2_raw_reg:{7'b0,Inter_V_window_2};
assign V_6tapfilter2_B = (Is_V_jfqik)? b3_raw_reg:{7'b0,Inter_V_window_3};
assign V_6tapfilter2_C = (Is_V_jfqik)? b4_raw_reg:{7'b0,Inter_V_window_4};
assign V_6tapfilter2_D = (Is_V_jfqik)? b5_raw_reg:{7'b0,Inter_V_window_5};
assign V_6tapfilter2_E = (Is_V_jfqik)? b6_raw_reg:{7'b0,Inter_V_window_6};
assign V_6tapfilter2_F = (Is_V_jfqik)? b7_raw_reg:{7'b0,Inter_V_window_7};
	
assign V_6tapfilter3_A = (Is_V_jfqik)? b3_raw_reg:{7'b0,Inter_V_window_3};
assign V_6tapfilter3_B = (Is_V_jfqik)? b4_raw_reg:{7'b0,Inter_V_window_4};
assign V_6tapfilter3_C = (Is_V_jfqik)? b5_raw_reg:{7'b0,Inter_V_window_5};
assign V_6tapfilter3_D = (Is_V_jfqik)? b6_raw_reg:{7'b0,Inter_V_window_6};
assign V_6tapfilter3_E = (Is_V_jfqik)? b7_raw_reg:{7'b0,Inter_V_window_7};
assign V_6tapfilter3_F = (Is_V_jfqik)? b8_raw_reg:{7'b0,Inter_V_window_8};
			
//------------------------
//Horizontal 6tap filter
//------------------------
wire H_need_round;
wire [14:0] H_6tapfilter0_raw_out,H_6tapfilter1_raw_out,H_6tapfilter2_raw_out,H_6tapfilter3_raw_out;
wire [14:0] H_6tapfilter4_raw_out,H_6tapfilter5_raw_out,H_6tapfilter6_raw_out,H_6tapfilter7_raw_out,H_6tapfilter8_raw_out;
wire [7:0]  H_6tapfilter0_round_out,H_6tapfilter1_round_out,H_6tapfilter2_round_out,H_6tapfilter3_round_out;
wire [7:0]  H_6tapfilter4_round_out,H_6tapfilter5_round_out,H_6tapfilter6_round_out,H_6tapfilter7_round_out,H_6tapfilter8_round_out;
	
assign H_need_round = (blk4x4_inter_calculate_counter != 0 && pos_FracL != `pos_Int && pos_FracL != `pos_i 
	&& pos_FracL != `pos_j && pos_FracL != `pos_k && pos_FracL != `pos_d && pos_FracL != `pos_n); 
	
filterH_6tap H_6tapfilter0 (
		.A(Inter_H_window_0_0),
		.B(Inter_H_window_1_0),
		.C(Inter_H_window_2_0),
		.D(Inter_H_window_3_0),
		.E(Inter_H_window_4_0),
		.F(Inter_H_window_5_0),
		.H_need_round(1'b0),
		.raw_out(H_6tapfilter0_raw_out),
		.round_out(H_6tapfilter0_round_out)
		);
filterH_6tap H_6tapfilter1 (
		.A(Inter_H_window_0_1),
		.B(Inter_H_window_1_1),
		.C(Inter_H_window_2_1),
		.D(Inter_H_window_3_1),
		.E(Inter_H_window_4_1),
		.F(Inter_H_window_5_1),
		.H_need_round(1'b0),
		.raw_out(H_6tapfilter1_raw_out),
		.round_out(H_6tapfilter1_round_out)
		);
filterH_6tap H_6tapfilter2 (
		.A(Inter_H_window_0_2),
		.B(Inter_H_window_1_2),
		.C(Inter_H_window_2_2),
		.D(Inter_H_window_3_2),
		.E(Inter_H_window_4_2),
		.F(Inter_H_window_5_2),
		.H_need_round(H_need_round),
		.raw_out(H_6tapfilter2_raw_out),
		.round_out(H_6tapfilter2_round_out)
		);
filterH_6tap H_6tapfilter3 (
		.A(Inter_H_window_0_3),
		.B(Inter_H_window_1_3),
		.C(Inter_H_window_2_3),
		.D(Inter_H_window_3_3),
		.E(Inter_H_window_4_3),
		.F(Inter_H_window_5_3),
		.H_need_round(H_need_round),
		.raw_out(H_6tapfilter3_raw_out),
		.round_out(H_6tapfilter3_round_out)
		);
filterH_6tap H_6tapfilter4 (
		.A(Inter_H_window_0_4),
		.B(Inter_H_window_1_4),
		.C(Inter_H_window_2_4),
		.D(Inter_H_window_3_4),
		.E(Inter_H_window_4_4),
		.F(Inter_H_window_5_4),
		.H_need_round(H_need_round),
		.raw_out(H_6tapfilter4_raw_out),
		.round_out(H_6tapfilter4_round_out)
		);
filterH_6tap H_6tapfilter5 (
		.A(Inter_H_window_0_5),
		.B(Inter_H_window_1_5),
		.C(Inter_H_window_2_5),
		.D(Inter_H_window_3_5),
		.E(Inter_H_window_4_5),
		.F(Inter_H_window_5_5),
		.H_need_round(H_need_round),
		.raw_out(H_6tapfilter5_raw_out),
		.round_out(H_6tapfilter5_round_out)
		);
filterH_6tap H_6tapfilter6 (
		.A(Inter_H_window_0_6),
		.B(Inter_H_window_1_6),
		.C(Inter_H_window_2_6),
		.D(Inter_H_window_3_6),
		.E(Inter_H_window_4_6),
		.F(Inter_H_window_5_6),
		.H_need_round(H_need_round),
		.raw_out(H_6tapfilter6_raw_out),
		.round_out(H_6tapfilter6_round_out)
		);
filterH_6tap H_6tapfilter7 (
		.A(Inter_H_window_0_7),
		.B(Inter_H_window_1_7),
		.C(Inter_H_window_2_7),
		.D(Inter_H_window_3_7),
		.E(Inter_H_window_4_7),
		.F(Inter_H_window_5_7),
		.H_need_round(1'b0),
		.raw_out(H_6tapfilter7_raw_out),
		.round_out(H_6tapfilter7_round_out)
		);
filterH_6tap H_6tapfilter8 (
		.A(Inter_H_window_0_8),
		.B(Inter_H_window_1_8),
		.C(Inter_H_window_2_8),
		.D(Inter_H_window_3_8),
		.E(Inter_H_window_4_8),
		.F(Inter_H_window_5_8),
		.H_need_round(1'b0),
		.raw_out(H_6tapfilter8_raw_out),
		.round_out(H_6tapfilter8_round_out)
		);
	
//--------------------
//bilinear filter
//--------------------
reg [7:0] bilinear0_A,bilinear0_B,bilinear1_A,bilinear1_B;
reg [7:0] bilinear2_A,bilinear2_B,bilinear3_A,bilinear3_B;
wire [7:0] bilinear0_out,bilinear1_out,bilinear2_out,bilinear3_out;
bilinear bilinear0 (
		.A(bilinear0_A),
		.B(bilinear0_B),
		.bilinear_out(bilinear0_out)
		);
bilinear bilinear1 (
		.A(bilinear1_A),
		.B(bilinear1_B),
		.bilinear_out(bilinear1_out)
		);
bilinear bilinear2 (
		.A(bilinear2_A),
		.B(bilinear2_B),
		.bilinear_out(bilinear2_out)
		);
bilinear bilinear3 (
		.A(bilinear3_A),
		.B(bilinear3_B),
		.bilinear_out(bilinear3_out)
		);
always @ (IsInterLuma or pos_FracL or blk4x4_inter_calculate_counter
		or Inter_bi_window_0 or Inter_bi_window_1 or Inter_bi_window_2 or Inter_bi_window_3
		or H_6tapfilter2_round_out or H_6tapfilter3_round_out or H_6tapfilter4_round_out or H_6tapfilter5_round_out
		or V_6tapfilter0_round_out or V_6tapfilter1_round_out or V_6tapfilter2_round_out or V_6tapfilter3_round_out
		or b0_reg or b1_reg or b2_reg or b3_reg or h0_reg or h1_reg or h2_reg or h3_reg)
		if (IsInterLuma)
			case ({pos_FracL})
				`pos_a,`pos_c:
				if (blk4x4_inter_calculate_counter != 4'd0)
					begin 
						bilinear0_A = Inter_bi_window_0; bilinear0_B = H_6tapfilter2_round_out;
						bilinear1_A = Inter_bi_window_1; bilinear1_B = H_6tapfilter3_round_out;
						bilinear2_A = Inter_bi_window_2; bilinear2_B = H_6tapfilter4_round_out;
						bilinear3_A = Inter_bi_window_3; bilinear3_B = H_6tapfilter5_round_out;
					end
				else 
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
				`pos_d,`pos_n:
				if (blk4x4_inter_calculate_counter != 4'd0)
					begin 
						bilinear0_A = Inter_bi_window_0; bilinear0_B = V_6tapfilter0_round_out;
						bilinear1_A = Inter_bi_window_1; bilinear1_B = V_6tapfilter1_round_out;
						bilinear2_A = Inter_bi_window_2; bilinear2_B = V_6tapfilter2_round_out;
						bilinear3_A = Inter_bi_window_3; bilinear3_B = V_6tapfilter3_round_out;
					end
				else 
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
				`pos_e,`pos_g,`pos_p,`pos_r:
				if (blk4x4_inter_calculate_counter != 4'd0)
					begin 
						bilinear0_A = H_6tapfilter2_round_out;	bilinear0_B = V_6tapfilter0_round_out;
						bilinear1_A = H_6tapfilter3_round_out;	bilinear1_B = V_6tapfilter1_round_out;
						bilinear2_A = H_6tapfilter4_round_out;	bilinear2_B = V_6tapfilter2_round_out;
						bilinear3_A = H_6tapfilter5_round_out;	bilinear3_B = V_6tapfilter3_round_out;
					end
				else
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
				`pos_i,`pos_k:
				if (blk4x4_inter_calculate_counter == 4'd7 || blk4x4_inter_calculate_counter == 4'd5 ||
					blk4x4_inter_calculate_counter == 4'd3 || blk4x4_inter_calculate_counter == 4'd1)
					begin 
						bilinear0_A = h0_reg; 	bilinear0_B = V_6tapfilter0_round_out;
						bilinear1_A = h1_reg; 	bilinear1_B = V_6tapfilter1_round_out;
						bilinear2_A = h2_reg; 	bilinear2_B = V_6tapfilter2_round_out;
						bilinear3_A = h3_reg; 	bilinear3_B = V_6tapfilter3_round_out;
					end
				else 
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
				`pos_f,`pos_q:
				if (blk4x4_inter_calculate_counter != 4'd5 && blk4x4_inter_calculate_counter != 4'd0)
					begin 
						bilinear0_A = b0_reg;	bilinear0_B = V_6tapfilter0_round_out;
						bilinear1_A = b1_reg;	bilinear1_B = V_6tapfilter1_round_out;
						bilinear2_A = b2_reg;	bilinear2_B = V_6tapfilter2_round_out;
						bilinear3_A = b3_reg;	bilinear3_B = V_6tapfilter3_round_out;
					end
				else
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
				default:
					begin 
						bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
						bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
					end
			endcase
		else
			begin 
				bilinear0_A = 0; bilinear0_B = 0; bilinear1_A = 0; bilinear1_B = 0;
				bilinear2_A = 0; bilinear2_B = 0; bilinear3_A = 0; bilinear3_B = 0;
			end
			
//------------------------------------------------------------------------------------------		
//only "b","h" and "j" of half-pel positions need to be stored to predict quater-pel samples
//------------------------------------------------------------------------------------------
	
//b0_raw_reg0 ~ b8_raw_reg:update after j/f/q/i/k horizontal filtering
wire b_raw_reg_ena;
assign b_raw_reg_ena = (IsInterLuma && 
	((pos_FracL == `pos_j && blk4x4_inter_calculate_counter != 4'd1 && blk4x4_inter_calculate_counter != 4'd0) ||
	((pos_FracL == `pos_f || pos_FracL == `pos_q) && (blk4x4_inter_calculate_counter == 4'd5 || 
												    blk4x4_inter_calculate_counter == 4'd4 ||
												    blk4x4_inter_calculate_counter == 4'd3 ||
												    blk4x4_inter_calculate_counter == 4'd2))	||
	((pos_FracL == `pos_i || pos_FracL == `pos_k) && (blk4x4_inter_calculate_counter == 4'd8 || 
													blk4x4_inter_calculate_counter == 4'd6 ||
													blk4x4_inter_calculate_counter == 4'd4 ||
													blk4x4_inter_calculate_counter == 4'd2))));
	
always @ (posedge clk)
	if (reset_n == 1'b0)begin
		b0_raw_reg <= 0; b1_raw_reg <= 0; b2_raw_reg <= 0; b3_raw_reg <= 0; b4_raw_reg <= 0;
		b5_raw_reg <= 0; b6_raw_reg <= 0; b7_raw_reg <= 0; b8_raw_reg <= 0; end
	else if (b_raw_reg_ena)begin
		b0_raw_reg <= H_6tapfilter0_raw_out;b1_raw_reg <= H_6tapfilter1_raw_out;b2_raw_reg <= H_6tapfilter2_raw_out;
		b3_raw_reg <= H_6tapfilter3_raw_out;b4_raw_reg <= H_6tapfilter4_raw_out;b5_raw_reg <= H_6tapfilter5_raw_out;
		b6_raw_reg <= H_6tapfilter6_raw_out;b7_raw_reg <= H_6tapfilter7_raw_out;b8_raw_reg <= H_6tapfilter8_raw_out;end
			
//b0_reg ~ b3_reg:update for decoding f,q
//Note:position q needs "b" of next line
wire b_reg_ena;
assign b_reg_ena = (IsInterLuma && ((pos_FracL == `pos_f || pos_FracL == `pos_q) && (blk4x4_inter_calculate_counter == 4'd5 ||
	blk4x4_inter_calculate_counter == 4'd4 || blk4x4_inter_calculate_counter == 4'd3 || blk4x4_inter_calculate_counter == 4'd2)));
	
always @ (posedge clk)
	if (reset_n == 1'b0)begin
		b0_reg <= 0; b1_reg <= 0; b2_reg <= 0; b3_reg <= 0;end
	else if (b_reg_ena)begin
		if (pos_FracL == `pos_q)begin
			b0_reg <= H_6tapfilter3_round_out; b1_reg <= H_6tapfilter4_round_out;
			b2_reg <= H_6tapfilter5_round_out; b3_reg <= H_6tapfilter6_round_out;end
		else begin
			b0_reg <= H_6tapfilter2_round_out; b1_reg <= H_6tapfilter3_round_out;
			b2_reg <= H_6tapfilter4_round_out; b3_reg <= H_6tapfilter5_round_out;end
	end
			
	//h0_reg ~ h3_reg:update for decoding i,k
wire h_reg_ena;
assign h_reg_ena = (IsInterLuma && ((pos_FracL == `pos_i || pos_FracL == `pos_k) && (blk4x4_inter_calculate_counter == 4'd8 ||
	blk4x4_inter_calculate_counter == 4'd6 || blk4x4_inter_calculate_counter == 4'd4 || blk4x4_inter_calculate_counter == 4'd2)));
	
always @ (posedge clk)
	if (reset_n == 1'b0)begin
		h0_reg <= 0; h1_reg <= 0; h2_reg <= 0; h3_reg <= 0;end
	else if (h_reg_ena)begin
		h0_reg <= V_6tapfilter0_round_out; h1_reg <= V_6tapfilter1_round_out;
		h2_reg <= V_6tapfilter2_round_out; h3_reg <= V_6tapfilter3_round_out;end
//------------------------------------------------------------------------------------------		
//LPE output
//------------------------------------------------------------------------------------------
always @ (IsInterLuma or pos_FracL or blk4x4_inter_calculate_counter  
		or V_6tapfilter0_round_out or V_6tapfilter1_round_out or V_6tapfilter2_round_out or V_6tapfilter3_round_out
		or H_6tapfilter2_round_out or H_6tapfilter3_round_out or H_6tapfilter4_round_out or H_6tapfilter5_round_out
		or bilinear0_out or bilinear1_out or bilinear2_out or bilinear3_out)
		if (IsInterLuma)
			case (pos_FracL)
				//pos_Int: directly bypassed by Inter_pix_copy0 ~ Inter_pix_copy3
				`pos_b:
				if (blk4x4_inter_calculate_counter != 0)
					begin
						LPE0_out = H_6tapfilter2_round_out; LPE1_out = H_6tapfilter3_round_out;
						LPE2_out = H_6tapfilter4_round_out; LPE3_out = H_6tapfilter5_round_out;	
					end
				else
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
				`pos_h:
				if (blk4x4_inter_calculate_counter != 0)
					begin
						LPE0_out = V_6tapfilter0_round_out; LPE1_out = V_6tapfilter1_round_out;
						LPE2_out = V_6tapfilter2_round_out; LPE3_out = V_6tapfilter3_round_out;	
					end
				else
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
				`pos_j:
				if (blk4x4_inter_calculate_counter != 4'd5 && blk4x4_inter_calculate_counter != 0)
					begin
						LPE0_out = V_6tapfilter0_round_out; LPE1_out = V_6tapfilter1_round_out;
						LPE2_out = V_6tapfilter2_round_out; LPE3_out = V_6tapfilter3_round_out;	
					end
				else
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end	
				`pos_a,`pos_c,`pos_d,`pos_e,`pos_g,`pos_n,`pos_p,`pos_r,`pos_f,`pos_q:
				if (blk4x4_inter_calculate_counter == 4'd4 || blk4x4_inter_calculate_counter == 4'd3 ||
					blk4x4_inter_calculate_counter == 4'd2 || blk4x4_inter_calculate_counter == 4'd1)
					begin
						LPE0_out = bilinear0_out; LPE1_out = bilinear1_out;
						LPE2_out = bilinear2_out; LPE3_out = bilinear3_out;	
					end
				else
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
				`pos_i,`pos_k:
				if (blk4x4_inter_calculate_counter == 4'd7 || blk4x4_inter_calculate_counter == 4'd5 ||
					blk4x4_inter_calculate_counter == 4'd3 || blk4x4_inter_calculate_counter == 4'd1)
					begin
						LPE0_out = bilinear0_out; LPE1_out = bilinear1_out;
						LPE2_out = bilinear2_out; LPE3_out = bilinear3_out;	
					end
				else
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
				default:
					begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
			endcase
		else 
			begin LPE0_out = 0; LPE1_out = 0;LPE2_out = 0; LPE3_out = 0;end
			


wire [3:0] xFracC_n,yFracC_n;
assign xFracC_n = 4'b1000 - xFracC;
assign yFracC_n = 4'b1000 - yFracC;
	
CPE CPE0 (
		.xFracC(xFracC),
		.yFracC(yFracC),
		.xFracC_n(xFracC_n),
		.yFracC_n(yFracC_n),
		.a(Inter_C_window_0_0),
		.b(Inter_C_window_1_0),
		.c(Inter_C_window_0_1),
		.d(Inter_C_window_1_1),
		.out(CPE0_out)
		);
CPE CPE1 (
		.xFracC(xFracC),
		.yFracC(yFracC),
		.xFracC_n(xFracC_n),
		.yFracC_n(yFracC_n),
		.a(Inter_C_window_1_0),
		.b(Inter_C_window_2_0),
		.c(Inter_C_window_1_1),
		.d(Inter_C_window_2_1),
		.out(CPE1_out)
		); 
CPE CPE2 (
		.xFracC(xFracC),
		.yFracC(yFracC),
		.xFracC_n(xFracC_n),
		.yFracC_n(yFracC_n),
		.a(Inter_C_window_0_1),
		.b(Inter_C_window_1_1),
		.c(Inter_C_window_0_2),
		.d(Inter_C_window_1_2),
		.out(CPE2_out)
		); 
CPE CPE3 (
		.xFracC(xFracC),
		.yFracC(yFracC),
		.xFracC_n(xFracC_n),
		.yFracC_n(yFracC_n),
		.a(Inter_C_window_1_1),
		.b(Inter_C_window_2_1),
		.c(Inter_C_window_1_2),
		.d(Inter_C_window_2_2),
		.out(CPE3_out)
		); 



reg x_overflow_reg,x_less_than_zero_reg;
always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		x_overflow_reg <= 0;
		x_less_than_zero_reg <= 0;end
	else if(data_valid)begin
		x_overflow_reg <= x_overflow;
		x_less_than_zero_reg <= x_less_than_zero;end



					
reg [31:0] RefFrameOutPadding; 
always @ (final_frame_luma_RAM_dout or final_frame_chroma_RAM_dout or IsInterLuma or IsInterChroma or data_valid or x_overflow_reg or x_less_than_zero_reg)
	if (IsInterLuma && data_valid)
		if(x_overflow_reg)
			RefFrameOutPadding = {4{final_frame_luma_RAM_dout[31:24]}};	
		else if(x_less_than_zero_reg)
			RefFrameOutPadding = {4{final_frame_luma_RAM_dout[7:0]}};
		else					
			RefFrameOutPadding = final_frame_luma_RAM_dout;
	else if(IsInterChroma && data_valid)
		if(x_overflow_reg)
			RefFrameOutPadding = {4{final_frame_chroma_RAM_dout[31:24]}};	
		else if(x_less_than_zero_reg)	
			RefFrameOutPadding = {4{final_frame_chroma_RAM_dout[7:0]}};
		else			
			RefFrameOutPadding = final_frame_chroma_RAM_dout;

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		Inter_ref_00_00 <= 0;Inter_ref_01_00 <= 0;Inter_ref_02_00 <= 0;Inter_ref_03_00 <= 0;
		Inter_ref_04_00 <= 0;Inter_ref_05_00 <= 0;Inter_ref_06_00 <= 0;Inter_ref_07_00 <= 0;
		Inter_ref_08_00 <= 0;Inter_ref_09_00 <= 0;Inter_ref_10_00 <= 0;Inter_ref_11_00 <= 0;Inter_ref_12_00 <= 0;
		Inter_ref_00_01 <= 0;Inter_ref_01_01 <= 0;Inter_ref_02_01 <= 0;Inter_ref_03_01 <= 0;
		Inter_ref_04_01 <= 0;Inter_ref_05_01 <= 0;Inter_ref_06_01 <= 0;Inter_ref_07_01 <= 0;
		Inter_ref_08_01 <= 0;Inter_ref_09_01 <= 0;Inter_ref_10_01 <= 0;Inter_ref_11_01 <= 0;Inter_ref_12_01 <= 0;
		Inter_ref_00_02 <= 0;Inter_ref_01_02 <= 0;Inter_ref_02_02 <= 0;Inter_ref_03_02 <= 0;
		Inter_ref_04_02 <= 0;Inter_ref_05_02 <= 0;Inter_ref_06_02 <= 0;Inter_ref_07_02 <= 0;
		Inter_ref_08_02 <= 0;Inter_ref_09_02 <= 0;Inter_ref_10_02 <= 0;Inter_ref_11_02 <= 0;Inter_ref_12_02 <= 0;
		Inter_ref_00_03 <= 0;Inter_ref_01_03 <= 0;Inter_ref_02_03 <= 0;Inter_ref_03_03 <= 0;
		Inter_ref_04_03 <= 0;Inter_ref_05_03 <= 0;Inter_ref_06_03 <= 0;Inter_ref_07_03 <= 0;
		Inter_ref_08_03 <= 0;Inter_ref_09_03 <= 0;Inter_ref_10_03 <= 0;Inter_ref_11_03 <= 0;Inter_ref_12_03 <= 0;
		Inter_ref_00_04 <= 0;Inter_ref_01_04 <= 0;Inter_ref_02_04 <= 0;Inter_ref_03_04 <= 0;
		Inter_ref_04_04 <= 0;Inter_ref_05_04 <= 0;Inter_ref_06_04 <= 0;Inter_ref_07_04 <= 0;
		Inter_ref_08_04 <= 0;Inter_ref_09_04 <= 0;Inter_ref_10_04 <= 0;Inter_ref_11_04 <= 0;Inter_ref_12_04 <= 0;
		Inter_ref_00_05 <= 0;Inter_ref_01_05 <= 0;Inter_ref_02_05 <= 0;Inter_ref_03_05 <= 0;
		Inter_ref_04_05 <= 0;Inter_ref_05_05 <= 0;Inter_ref_06_05 <= 0;Inter_ref_07_05 <= 0;
		Inter_ref_08_05 <= 0;Inter_ref_09_05 <= 0;Inter_ref_10_05 <= 0;Inter_ref_11_05 <= 0;Inter_ref_12_05 <= 0;
		Inter_ref_00_06 <= 0;Inter_ref_01_06 <= 0;Inter_ref_02_06 <= 0;Inter_ref_03_06 <= 0;
		Inter_ref_04_06 <= 0;Inter_ref_05_06 <= 0;Inter_ref_06_06 <= 0;Inter_ref_07_06 <= 0;
		Inter_ref_08_06 <= 0;Inter_ref_09_06 <= 0;Inter_ref_10_06 <= 0;Inter_ref_11_06 <= 0;Inter_ref_12_06 <= 0;
		Inter_ref_00_07 <= 0;Inter_ref_01_07 <= 0;Inter_ref_02_07 <= 0;Inter_ref_03_07 <= 0;
		Inter_ref_04_07 <= 0;Inter_ref_05_07 <= 0;Inter_ref_06_07 <= 0;Inter_ref_07_07 <= 0;
		Inter_ref_08_07 <= 0;Inter_ref_09_07 <= 0;Inter_ref_10_07 <= 0;Inter_ref_11_07 <= 0;Inter_ref_12_07 <= 0;
		Inter_ref_00_08 <= 0;Inter_ref_01_08 <= 0;Inter_ref_02_08 <= 0;Inter_ref_03_08 <= 0;
		Inter_ref_04_08 <= 0;Inter_ref_05_08 <= 0;Inter_ref_06_08 <= 0;Inter_ref_07_08 <= 0;
		Inter_ref_08_08 <= 0;Inter_ref_09_08 <= 0;Inter_ref_10_08 <= 0;Inter_ref_11_08 <= 0;Inter_ref_12_08 <= 0;
		Inter_ref_00_09 <= 0;Inter_ref_01_09 <= 0;Inter_ref_02_09 <= 0;Inter_ref_03_09 <= 0;
		Inter_ref_04_09 <= 0;Inter_ref_05_09 <= 0;Inter_ref_06_09 <= 0;Inter_ref_07_09 <= 0;
		Inter_ref_08_09 <= 0;Inter_ref_09_09 <= 0;Inter_ref_10_09 <= 0;Inter_ref_11_09 <= 0;Inter_ref_12_09 <= 0;
		Inter_ref_00_10 <= 0;Inter_ref_01_10 <= 0;Inter_ref_02_10 <= 0;Inter_ref_03_10 <= 0;
		Inter_ref_04_10 <= 0;Inter_ref_05_10 <= 0;Inter_ref_06_10 <= 0;Inter_ref_07_10 <= 0;
		Inter_ref_08_10 <= 0;Inter_ref_09_10 <= 0;Inter_ref_10_10 <= 0;Inter_ref_11_10 <= 0;Inter_ref_12_10 <= 0;
		Inter_ref_00_11 <= 0;Inter_ref_01_11 <= 0;Inter_ref_02_11 <= 0;Inter_ref_03_11 <= 0;
		Inter_ref_04_11 <= 0;Inter_ref_05_11 <= 0;Inter_ref_06_11 <= 0;Inter_ref_07_11 <= 0;
		Inter_ref_08_11 <= 0;Inter_ref_09_11 <= 0;Inter_ref_10_11 <= 0;Inter_ref_11_11 <= 0;Inter_ref_12_11 <= 0;
		Inter_ref_00_12 <= 0;Inter_ref_01_12 <= 0;Inter_ref_02_12 <= 0;Inter_ref_03_12 <= 0;
		Inter_ref_04_12 <= 0;Inter_ref_05_12 <= 0;Inter_ref_06_12 <= 0;Inter_ref_07_12 <= 0;
		Inter_ref_08_12 <= 0;Inter_ref_09_12 <= 0;Inter_ref_10_12 <= 0;Inter_ref_11_12 <= 0;Inter_ref_12_12 <= 0;end
	else if (IsInterLuma && blk4x4_inter_preload_counter != 0)
		case (mv_below8x8_curr)
		1'b0:
			case (pos_FracL)
			`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd52:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd51:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding;
					6'd50:{Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00} <= RefFrameOutPadding;
					6'd49:{Inter_ref_12_00,Inter_ref_11_00,Inter_ref_10_00} <= RefFrameOutPadding[23:0];
					6'd48:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					6'd47:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding;
					6'd46:{Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01} <= RefFrameOutPadding;
					6'd45:{Inter_ref_12_01,Inter_ref_11_01,Inter_ref_10_01} <= RefFrameOutPadding[23:0];
					6'd44:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd43:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd42:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding;
					6'd41:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02} <= RefFrameOutPadding[23:0];
					6'd40:{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd39:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd38:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding;
					6'd37:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03} <= RefFrameOutPadding[23:0];
					6'd36:{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];
					6'd35:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd34:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding;
					6'd33:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04} <= RefFrameOutPadding[23:0];
					6'd32:{Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:16];
					6'd31:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd30:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding;
					6'd29:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05}<= RefFrameOutPadding[23:0];
					6'd28:{Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:16];
					6'd27:{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd26:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding;
					6'd25:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06} <= RefFrameOutPadding[23:0];
					6'd24:{Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:16];
					6'd23:{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding;
					6'd21:{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07} <= RefFrameOutPadding[23:0];
					6'd20:{Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:16];
					6'd19:{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					6'd18:{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding;
					6'd17:{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08} <= RefFrameOutPadding[23:0];
					6'd16:{Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding[31:16];
					6'd15:{Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding;
					6'd14:{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09} <= RefFrameOutPadding;
					6'd13:{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09} <= RefFrameOutPadding[23:0];
					6'd12:{Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_12_10,Inter_ref_11_10,Inter_ref_10_10} <= RefFrameOutPadding[23:0];
					6'd8 :{Inter_ref_01_11,Inter_ref_00_11} <= RefFrameOutPadding[31:16];
					6'd7 :{Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_12_11,Inter_ref_11_11,Inter_ref_10_11} <= RefFrameOutPadding[23:0];
					6'd4 :{Inter_ref_01_12,Inter_ref_00_12} <= RefFrameOutPadding[31:16];
					6'd3 :{Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_12_12,Inter_ref_11_12,Inter_ref_10_12} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd52:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd51:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00} <= RefFrameOutPadding;
					6'd50:{Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00} <= RefFrameOutPadding;
					6'd49:{Inter_ref_12_00,Inter_ref_11_00,Inter_ref_10_00,Inter_ref_09_00} <= RefFrameOutPadding;
					6'd48:Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd47:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01} <= RefFrameOutPadding;
					6'd46:{Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01} <= RefFrameOutPadding;
					6'd45:{Inter_ref_12_01,Inter_ref_11_01,Inter_ref_10_01,Inter_ref_09_01} <= RefFrameOutPadding;
					6'd44:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd43:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd42:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd41:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02} <= RefFrameOutPadding;
					6'd40:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd39:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd38:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd37:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03} <= RefFrameOutPadding;
					6'd36:Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd35:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd34:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd33:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04} <= RefFrameOutPadding;
					6'd32:Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd31:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd30:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd29:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05} <= RefFrameOutPadding;
					6'd28:Inter_ref_00_06 <= RefFrameOutPadding[31:24];
					6'd27:{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06} <= RefFrameOutPadding;
					6'd26:{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd25:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06} <= RefFrameOutPadding;
					6'd24:Inter_ref_00_07 <= RefFrameOutPadding[31:24];
					6'd23:{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07} <= RefFrameOutPadding;
					6'd22:{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd21:{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07} <= RefFrameOutPadding;
					6'd20:Inter_ref_00_08 <= RefFrameOutPadding[31:24];
					6'd19:{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08} <= RefFrameOutPadding;
					6'd18:{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					6'd17:{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08} <= RefFrameOutPadding;
					6'd16:Inter_ref_00_09 <= RefFrameOutPadding[31:24];
					6'd15:{Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09} <= RefFrameOutPadding;
					6'd14:{Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09} <= RefFrameOutPadding;
					6'd13:{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09} <= RefFrameOutPadding;
					6'd12:Inter_ref_00_10 <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10,Inter_ref_01_10} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_12_10,Inter_ref_11_10,Inter_ref_10_10,Inter_ref_09_10} <= RefFrameOutPadding;
					6'd8 :Inter_ref_00_11 <= RefFrameOutPadding[31:24];
					6'd7 :{Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11,Inter_ref_01_11} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_12_11,Inter_ref_11_11,Inter_ref_10_11,Inter_ref_09_11} <= RefFrameOutPadding;
					6'd4 :Inter_ref_00_12 <= RefFrameOutPadding[31:24];
					6'd3 :{Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12,Inter_ref_01_12} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_12_12,Inter_ref_11_12,Inter_ref_10_12,Inter_ref_09_12} <= RefFrameOutPadding;
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd52:{Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding;
					6'd51:{Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding;
					6'd50:{Inter_ref_11_00,Inter_ref_10_00,Inter_ref_09_00,Inter_ref_08_00} <= RefFrameOutPadding;
					6'd49:Inter_ref_12_00 <= RefFrameOutPadding[7:0];
					6'd48:{Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding;
					6'd47:{Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding;
					6'd46:{Inter_ref_11_01,Inter_ref_10_01,Inter_ref_09_01,Inter_ref_08_01} <= RefFrameOutPadding;
					6'd45:Inter_ref_12_01 <= RefFrameOutPadding[7:0];
					6'd44:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd43:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd42:{Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02} <= RefFrameOutPadding;
					6'd41:Inter_ref_12_02 <= RefFrameOutPadding[7:0];
					6'd40:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd39:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd38:{Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03} <= RefFrameOutPadding;
					6'd37:Inter_ref_12_03 <= RefFrameOutPadding[7:0];
					6'd36:{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd35:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd34:{Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04} <= RefFrameOutPadding;
					6'd33:Inter_ref_12_04 <= RefFrameOutPadding[7:0];
					6'd32:{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd31:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd30:{Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05} <= RefFrameOutPadding;
					6'd29:Inter_ref_12_05 <= RefFrameOutPadding[7:0];
					6'd28:{Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding;
					6'd27:{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd26:{Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06} <= RefFrameOutPadding;
					6'd25:Inter_ref_12_06 <= RefFrameOutPadding[7:0];
					6'd24:{Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding;
					6'd23:{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd22:{Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07} <= RefFrameOutPadding;
					6'd21:Inter_ref_12_07 <= RefFrameOutPadding[7:0];
					6'd20:{Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding;
					6'd19:{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd18:{Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08} <= RefFrameOutPadding;
					6'd17:Inter_ref_12_08 <= RefFrameOutPadding[7:0];
					6'd16:{Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding;
					6'd15:{Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09} <= RefFrameOutPadding;
					6'd14:{Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09} <= RefFrameOutPadding;
					6'd13:Inter_ref_12_09 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_03_10,Inter_ref_02_10,Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding;
					6'd11:{Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10} <= RefFrameOutPadding;
					6'd10:{Inter_ref_11_10,Inter_ref_10_10,Inter_ref_09_10,Inter_ref_08_10} <= RefFrameOutPadding;
					6'd9 :Inter_ref_12_10 <= RefFrameOutPadding[7:0];
					6'd8 :{Inter_ref_03_11,Inter_ref_02_11,Inter_ref_01_11,Inter_ref_00_11} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_11_11,Inter_ref_10_11,Inter_ref_09_11,Inter_ref_08_11} <= RefFrameOutPadding;
					6'd5 :Inter_ref_12_11 <= RefFrameOutPadding[7:0];
					6'd4 :{Inter_ref_03_12,Inter_ref_02_12,Inter_ref_01_12,Inter_ref_00_12} <= RefFrameOutPadding;
					6'd3 :{Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_11_12,Inter_ref_10_12,Inter_ref_09_12,Inter_ref_08_12} <= RefFrameOutPadding;
					6'd1 :Inter_ref_12_12 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd52:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:8];
					6'd51:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding;
					6'd50:{Inter_ref_10_00,Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00} <= RefFrameOutPadding;
					6'd49:{Inter_ref_12_00,Inter_ref_11_00} <= RefFrameOutPadding[15:0];
					6'd48:{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:8];
					6'd47:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding;
					6'd46:{Inter_ref_10_01,Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01} <= RefFrameOutPadding;
					6'd45:{Inter_ref_12_01,Inter_ref_11_01} <= RefFrameOutPadding[15:0];
					6'd44:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd43:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd42:{Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding;
					6'd41:{Inter_ref_12_02,Inter_ref_11_02} <= RefFrameOutPadding[15:0];
					6'd40:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd39:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd38:{Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding;
					6'd37:{Inter_ref_12_03,Inter_ref_11_03} <= RefFrameOutPadding[15:0];
					6'd36:{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd35:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd34:{Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding;
					6'd33:{Inter_ref_12_04,Inter_ref_11_04} <= RefFrameOutPadding[15:0];
					6'd32:{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd31:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd30:{Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding;
					6'd29:{Inter_ref_12_05,Inter_ref_11_05} <= RefFrameOutPadding[15:0];
					6'd28:{Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:8];
					6'd27:{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd26:{Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding;
					6'd25:{Inter_ref_12_06,Inter_ref_11_06} <= RefFrameOutPadding[15:0];
					6'd24:{Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:8];
					6'd23:{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd22:{Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding;
					6'd21:{Inter_ref_12_07,Inter_ref_11_07} <= RefFrameOutPadding[15:0];
					6'd20:{Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:8];
					6'd19:{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd18:{Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding;
					6'd17:{Inter_ref_12_08,Inter_ref_11_08} <= RefFrameOutPadding[15:0];
					6'd16:{Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding[31:8];
					6'd15:{Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09} <= RefFrameOutPadding;
					6'd14:{Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09} <= RefFrameOutPadding;
					6'd13:{Inter_ref_12_09,Inter_ref_11_09} <= RefFrameOutPadding[15:0];
					6'd12:{Inter_ref_02_10,Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10} <= RefFrameOutPadding;
					6'd10:{Inter_ref_10_10,Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_12_10,Inter_ref_11_10} <= RefFrameOutPadding[15:0];
					6'd8 :{Inter_ref_02_11,Inter_ref_01_11,Inter_ref_00_11} <= RefFrameOutPadding[31:8];
					6'd7 :{Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_10_11,Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_12_11,Inter_ref_11_11} <= RefFrameOutPadding[15:0];
					6'd4 :{Inter_ref_02_12,Inter_ref_01_12,Inter_ref_00_12} <= RefFrameOutPadding[31:8];
					6'd3 :{Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_10_12,Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_12_12,Inter_ref_11_12} <= RefFrameOutPadding[15:0];
					default:;
					endcase	
				endcase
			`pos_d,`pos_h,`pos_n:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)	
					6'd26:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00}	<= RefFrameOutPadding;
					6'd25:{Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00} <= RefFrameOutPadding;
					6'd24:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01}	<= RefFrameOutPadding;
					6'd23:{Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01} <= RefFrameOutPadding;
					6'd22:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02}	<= RefFrameOutPadding;
					6'd21:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding;
					6'd20:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03}	<= RefFrameOutPadding;
					6'd19:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding;
					6'd18:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04}	<= RefFrameOutPadding;
					6'd17:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding;
					6'd16:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05}	<= RefFrameOutPadding;
					6'd15:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding;
					6'd14:{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06}	<= RefFrameOutPadding;
					6'd13:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding;
					6'd12:{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07}	<= RefFrameOutPadding;
					6'd11:{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding;
					6'd10:{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08}	<= RefFrameOutPadding;
					6'd9 :{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09}	<= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10}	<= RefFrameOutPadding;
					6'd5 :{Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11}	<= RefFrameOutPadding;
					6'd3 :{Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12}	<= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12} <= RefFrameOutPadding;
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd39:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:8];
					6'd38:{Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00} <= RefFrameOutPadding;
					6'd37:Inter_ref_09_00 <= RefFrameOutPadding[7:0]; 
					6'd36:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:8];
					6'd35:{Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01} <= RefFrameOutPadding;
					6'd34:Inter_ref_09_01 <= RefFrameOutPadding[7:0];
					6'd33:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:8];
					6'd32:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd31:Inter_ref_09_02 <= RefFrameOutPadding[7:0];
					6'd30:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:8];
					6'd29:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd28:Inter_ref_09_03 <= RefFrameOutPadding[7:0];
					6'd27:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:8];
					6'd26:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd25:Inter_ref_09_04 <= RefFrameOutPadding[7:0];
					6'd24:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:8];
					6'd23:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd22:Inter_ref_09_05 <= RefFrameOutPadding[7:0];
					6'd21:{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:8];
					6'd20:{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd19:Inter_ref_09_06 <= RefFrameOutPadding[7:0];
					6'd18:{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:8];
					6'd17:{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd16:Inter_ref_09_07 <= RefFrameOutPadding[7:0];
					6'd15:{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:8];
					6'd14:{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					6'd13:Inter_ref_09_08 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09} <= RefFrameOutPadding;
					6'd10:Inter_ref_09_09 <= RefFrameOutPadding[7:0];
					6'd9 :{Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10} <= RefFrameOutPadding[31:8];
					6'd8 :{Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10} <= RefFrameOutPadding;
					6'd7 :Inter_ref_09_10 <= RefFrameOutPadding[7:0];
					6'd6 :{Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11} <= RefFrameOutPadding;
					6'd4 :Inter_ref_09_11 <= RefFrameOutPadding[7:0];
					6'd3 :{Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding[31:8];
					6'd2 :{Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12} <= RefFrameOutPadding;
					6'd1 :Inter_ref_09_12 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd39:{Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:16];
					6'd38:{Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding;
					6'd37:{Inter_ref_09_00,Inter_ref_08_00} <= RefFrameOutPadding[15:0]; 
					6'd36:{Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:16];
					6'd35:{Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding;
					6'd34:{Inter_ref_09_01,Inter_ref_08_01} <= RefFrameOutPadding[15:0];
					6'd33:{Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:16];
					6'd32:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd31:{Inter_ref_09_02,Inter_ref_08_02} <= RefFrameOutPadding[15:0];
					6'd30:{Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:16];
					6'd29:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd28:{Inter_ref_09_03,Inter_ref_08_03} <= RefFrameOutPadding[15:0];
					6'd27:{Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:16];
					6'd26:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd25:{Inter_ref_09_04,Inter_ref_08_04} <= RefFrameOutPadding[15:0];
					6'd24:{Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:16];
					6'd23:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_05,Inter_ref_08_05} <= RefFrameOutPadding[15:0];
					6'd21:{Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:16];
					6'd20:{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd19:{Inter_ref_09_06,Inter_ref_08_06} <= RefFrameOutPadding[15:0];
					6'd18:{Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:16];
					6'd17:{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd16:{Inter_ref_09_07,Inter_ref_08_07} <= RefFrameOutPadding[15:0];
					6'd15:{Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:16];
					6'd14:{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd13:{Inter_ref_09_08,Inter_ref_08_08} <= RefFrameOutPadding[15:0];
					6'd12:{Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_09,Inter_ref_08_09} <= RefFrameOutPadding[15:0];
					6'd9 :{Inter_ref_03_10,Inter_ref_02_10} <= RefFrameOutPadding[31:16];
					6'd8 :{Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_10,Inter_ref_08_10} <= RefFrameOutPadding[15:0];
					6'd6 :{Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_09_11,Inter_ref_08_11} <= RefFrameOutPadding[15:0];
					6'd3 :{Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding[31:16];
					6'd2 :{Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_12,Inter_ref_08_12} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd39:{Inter_ref_02_00} <= RefFrameOutPadding[31:24];
					6'd38:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding;
					6'd37:{Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00} <= RefFrameOutPadding[23:0];
					6'd36:{Inter_ref_02_01} <= RefFrameOutPadding[31:24];
					6'd35:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding;
					6'd34:{Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01} <= RefFrameOutPadding[23:0]; 
					6'd33:{Inter_ref_02_02} <= RefFrameOutPadding[31:24];
					6'd32:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd31:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding[23:0]; 
					6'd30:{Inter_ref_02_03} <= RefFrameOutPadding[31:24];
					6'd29:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd28:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding[23:0]; 
					6'd27:{Inter_ref_02_04} <= RefFrameOutPadding[31:24];
					6'd26:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd25:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding[23:0]; 
					6'd24:{Inter_ref_02_05} <= RefFrameOutPadding[31:24];
					6'd23:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding[23:0]; 
					6'd21:{Inter_ref_02_06} <= RefFrameOutPadding[31:24];
					6'd20:{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd19:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding[23:0]; 
					6'd18:{Inter_ref_02_07} <= RefFrameOutPadding[31:24];
					6'd17:{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd16:{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding[23:0]; 
					6'd15:{Inter_ref_02_08} <= RefFrameOutPadding[31:24];
					6'd14:{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd13:{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding[23:0]; 
					6'd12:{Inter_ref_02_09} <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09} <= RefFrameOutPadding[23:0]; 
					6'd9 :{Inter_ref_02_10} <= RefFrameOutPadding[31:24];
					6'd8 :{Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10} <= RefFrameOutPadding[23:0]; 
					6'd6 :{Inter_ref_02_11} <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11} <= RefFrameOutPadding[23:0]; 
					6'd3 :{Inter_ref_02_12} <= RefFrameOutPadding[31:24];
					6'd2 :{Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12} <= RefFrameOutPadding[23:0]; 
					default:;
					endcase
				endcase
			`pos_a,`pos_b,`pos_c:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)	
					6'd32:{Inter_ref_01_02,Inter_ref_00_02}	<= RefFrameOutPadding[31:16];
					6'd31:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd30:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding;
					6'd29:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02} <= RefFrameOutPadding[23:0];
					6'd28:{Inter_ref_01_03,Inter_ref_00_03}	<= RefFrameOutPadding[31:16];
					6'd27:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd26:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding;
					6'd25:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03} <= RefFrameOutPadding[23:0];
					6'd24:{Inter_ref_01_04,Inter_ref_00_04}	<= RefFrameOutPadding[31:16];
					6'd23:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding;
					6'd21:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04} <= RefFrameOutPadding[23:0];
					6'd20:{Inter_ref_01_05,Inter_ref_00_05}	<= RefFrameOutPadding[31:16];
					6'd19:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd18:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding;
					6'd17:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05} <= RefFrameOutPadding[23:0];
					6'd16:{Inter_ref_01_06,Inter_ref_00_06}	<= RefFrameOutPadding[31:16];
					6'd15:{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd14:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding;
					6'd13:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06} <= RefFrameOutPadding[23:0];
					6'd12:{Inter_ref_01_07,Inter_ref_00_07}	<= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07} <= RefFrameOutPadding[23:0];
					6'd8 :{Inter_ref_01_08,Inter_ref_00_08}	<= RefFrameOutPadding[31:16];
					6'd7 :{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08} <= RefFrameOutPadding[23:0];
					6'd4 :{Inter_ref_01_09,Inter_ref_00_09}	<= RefFrameOutPadding[31:16];
					6'd3 :{Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)	
					6'd32:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd31:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd30:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd29:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02} <= RefFrameOutPadding;
					6'd28:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd27:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd26:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd25:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03} <= RefFrameOutPadding;
					6'd24:Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd23:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd22:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd21:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04} <= RefFrameOutPadding;
					6'd20:Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd19:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd18:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd17:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05} <= RefFrameOutPadding;
					6'd16:Inter_ref_00_06 <= RefFrameOutPadding[31:24];
					6'd15:{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06} <= RefFrameOutPadding;
					6'd14:{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd13:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06} <= RefFrameOutPadding;
					6'd12:Inter_ref_00_07 <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07} <= RefFrameOutPadding;
					6'd8 :Inter_ref_00_08 <= RefFrameOutPadding[31:24];
					6'd7 :{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08} <= RefFrameOutPadding;
					6'd4 :Inter_ref_00_09 <= RefFrameOutPadding[31:24];
					6'd3 :{Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09} <= RefFrameOutPadding;
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)	
					6'd32:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd31:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd30:{Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02} <= RefFrameOutPadding;	
					6'd29:Inter_ref_12_02 <= RefFrameOutPadding[7:0];
					6'd28:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd27:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd26:{Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03} <= RefFrameOutPadding;	
					6'd25:Inter_ref_12_03 <= RefFrameOutPadding[7:0];
					6'd24:{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd23:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd22:{Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04} <= RefFrameOutPadding;	
					6'd21:Inter_ref_12_04 <= RefFrameOutPadding[7:0];
					6'd20:{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd19:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd18:{Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05} <= RefFrameOutPadding;	
					6'd17:Inter_ref_12_05 <= RefFrameOutPadding[7:0];
					6'd16:{Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding;
					6'd15:{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd14:{Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06} <= RefFrameOutPadding;	
					6'd13:Inter_ref_12_06 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding;
					6'd11:{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd10:{Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07} <= RefFrameOutPadding;	
					6'd9 :Inter_ref_12_07 <= RefFrameOutPadding[7:0];
					6'd8 :{Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08} <= RefFrameOutPadding;	
					6'd5 :Inter_ref_12_08 <= RefFrameOutPadding[7:0];
					6'd4 :{Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding;
					6'd3 :{Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09} <= RefFrameOutPadding;	
					6'd1 :Inter_ref_12_09 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd32:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd31:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd30:{Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding;	
					6'd29:{Inter_ref_12_02,Inter_ref_11_02} <= RefFrameOutPadding[15:0];
					6'd28:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd27:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd26:{Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding;	
					6'd25:{Inter_ref_12_03,Inter_ref_11_03} <= RefFrameOutPadding[15:0];
					6'd24:{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd23:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd22:{Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding;	
					6'd21:{Inter_ref_12_04,Inter_ref_11_04} <= RefFrameOutPadding[15:0];
					6'd20:{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd19:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd18:{Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding;	
					6'd17:{Inter_ref_12_05,Inter_ref_11_05} <= RefFrameOutPadding[15:0];
					6'd16:{Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:8];
					6'd15:{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd14:{Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding;	
					6'd13:{Inter_ref_12_06,Inter_ref_11_06} <= RefFrameOutPadding[15:0];
					6'd12:{Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd10:{Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding;	
					6'd9 :{Inter_ref_12_07,Inter_ref_11_07} <= RefFrameOutPadding[15:0];
					6'd8 :{Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:8];
					6'd7 :{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding;	
					6'd5 :{Inter_ref_12_08,Inter_ref_11_08} <= RefFrameOutPadding[15:0];
					6'd4 :{Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding[31:8];
					6'd3 :{Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09} <= RefFrameOutPadding;	
					6'd1 :{Inter_ref_12_09,Inter_ref_11_09} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				endcase
			`pos_Int:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)	
					6'd16:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02}	<= RefFrameOutPadding;
					6'd15:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding;
					6'd14:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03}	<= RefFrameOutPadding;
					6'd13:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding;
					6'd12:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04}	<= RefFrameOutPadding;
					6'd11:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding;
					6'd10:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05}	<= RefFrameOutPadding;
					6'd9 :{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06}	<= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07}	<= RefFrameOutPadding;
					6'd5 :{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08}	<= RefFrameOutPadding;
					6'd3 :{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09}	<= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09} <= RefFrameOutPadding;
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd24:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:8];
					6'd23:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd22:Inter_ref_09_02 <= RefFrameOutPadding[7:0]; 
					6'd21:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:8];
					6'd20:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd19:Inter_ref_09_03 <= RefFrameOutPadding[7:0];
					6'd18:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:8];
					6'd17:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd16:Inter_ref_09_04 <= RefFrameOutPadding[7:0];
					6'd15:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:8];
					6'd14:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd13:Inter_ref_09_05 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd10:Inter_ref_09_06 <= RefFrameOutPadding[7:0];
					6'd9 :{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:8];
					6'd8 :{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd7 :Inter_ref_09_07 <= RefFrameOutPadding[7:0];
					6'd6 :{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					6'd4 :Inter_ref_09_08 <= RefFrameOutPadding[7:0];
					6'd3 :{Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding[31:8];
					6'd2 :{Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09} <= RefFrameOutPadding;
					6'd1 :Inter_ref_09_09 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd24:{Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:16];
					6'd23:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_02,Inter_ref_08_02} <= RefFrameOutPadding[15:0];
					6'd21:{Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:16];
					6'd20:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd19:{Inter_ref_09_03,Inter_ref_08_03} <= RefFrameOutPadding[15:0];
					6'd18:{Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:16];
					6'd17:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd16:{Inter_ref_09_04,Inter_ref_08_04} <= RefFrameOutPadding[15:0];
					6'd15:{Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:16];
					6'd14:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd13:{Inter_ref_09_05,Inter_ref_08_05} <= RefFrameOutPadding[15:0];
					6'd12:{Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_06,Inter_ref_08_06} <= RefFrameOutPadding[15:0];
					6'd9 :{Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:16];
					6'd8 :{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_07,Inter_ref_08_07} <= RefFrameOutPadding[15:0];
					6'd6 :{Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_09_08,Inter_ref_08_08} <= RefFrameOutPadding[15:0];
					6'd3 :{Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding[31:16];
					6'd2 :{Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_09,Inter_ref_08_09} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd24:{Inter_ref_02_02} <= RefFrameOutPadding[31:24];
					6'd23:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd22:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding[23:0];
					6'd21:{Inter_ref_02_03} <= RefFrameOutPadding[31:24];
					6'd20:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd19:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding[23:0];
					6'd18:{Inter_ref_02_04} <= RefFrameOutPadding[31:24];
					6'd17:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd16:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding[23:0];
					6'd15:{Inter_ref_02_05} <= RefFrameOutPadding[31:24];
					6'd14:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd13:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding[23:0];
					6'd12:{Inter_ref_02_06} <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd10:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding[23:0];
					6'd9 :{Inter_ref_02_07} <= RefFrameOutPadding[31:24];
					6'd8 :{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding[23:0];
					6'd6 :{Inter_ref_02_08} <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding[23:0];
					6'd3 :{Inter_ref_02_09} <= RefFrameOutPadding[31:24];
					6'd2 :{Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				endcase
			`pos_e,`pos_g,`pos_p,`pos_r:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd48:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding;
					6'd47:{Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00} <= RefFrameOutPadding;
					6'd46:Inter_ref_10_00 <= RefFrameOutPadding[7:0];
					6'd45:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding;
					6'd44:{Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01} <= RefFrameOutPadding;
					6'd43:Inter_ref_10_01 <= RefFrameOutPadding[7:0];
					6'd42:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd41:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd40:{Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding;
					6'd39:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02} <= RefFrameOutPadding[23:0];
					6'd38:{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd37:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd36:{Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding;
					6'd35:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03} <= RefFrameOutPadding[23:0];
					6'd34:{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];
					6'd33:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd32:{Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding;
					6'd31:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04} <= RefFrameOutPadding[23:0];
					6'd30:{Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:16];
					6'd29:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd28:{Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding;
					6'd27:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05} <= RefFrameOutPadding[23:0];
					6'd26:{Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:16];
					6'd25:{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd24:{Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding;
					6'd23:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06} <= RefFrameOutPadding[23:0];
					6'd22:{Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:16];
					6'd21:{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd20:{Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding;
					6'd19:{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07} <= RefFrameOutPadding[23:0];
					6'd18:{Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:16];
					6'd17:{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					6'd16:{Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding;
					6'd15:{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08} <= RefFrameOutPadding[23:0];
					6'd14:{Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding[31:16];
					6'd13:{Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09} <= RefFrameOutPadding;
					6'd12:{Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09} <= RefFrameOutPadding;
					6'd11:{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09} <= RefFrameOutPadding[23:0];
					6'd10:{Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding[31:16];
					6'd9 :{Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_12_10,Inter_ref_11_10,Inter_ref_10_10} <= RefFrameOutPadding[23:0];
					6'd6 :{Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11} <= RefFrameOutPadding;
					6'd4 :Inter_ref_10_11 <= RefFrameOutPadding[7:0];
					6'd3 :{Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12} <= RefFrameOutPadding;
					6'd1 :Inter_ref_10_12 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd48:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:8];
					6'd47:{Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00} <= RefFrameOutPadding;
					6'd46:{Inter_ref_10_00,Inter_ref_09_00} <= RefFrameOutPadding[15:0];
					6'd45:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:8];
					6'd44:{Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01} <= RefFrameOutPadding;
					6'd43:{Inter_ref_10_01,Inter_ref_09_01} <= RefFrameOutPadding[15:0];
					6'd42:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd41:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd40:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd39:{Inter_ref_12_02,Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02} <= RefFrameOutPadding;
					6'd38:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd37:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd36:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd35:{Inter_ref_12_03,Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03} <= RefFrameOutPadding;
					6'd34:Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd33:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd32:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd31:{Inter_ref_12_04,Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04} <= RefFrameOutPadding;
					6'd30:Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd29:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd28:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd27:{Inter_ref_12_05,Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05} <= RefFrameOutPadding;
					6'd26:Inter_ref_00_06 <= RefFrameOutPadding[31:24];
					6'd25:{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06} <= RefFrameOutPadding;
					6'd24:{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd23:{Inter_ref_12_06,Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06} <= RefFrameOutPadding;
					6'd22:Inter_ref_00_07 <= RefFrameOutPadding[31:24];
					6'd21:{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07} <= RefFrameOutPadding;
					6'd20:{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd19:{Inter_ref_12_07,Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07} <= RefFrameOutPadding;
					6'd18:Inter_ref_00_08 <= RefFrameOutPadding[31:24];
					6'd17:{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08} <= RefFrameOutPadding;
					6'd16:{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					6'd15:{Inter_ref_12_08,Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08} <= RefFrameOutPadding;
					6'd14:Inter_ref_00_09 <= RefFrameOutPadding[31:24];
					6'd13:{Inter_ref_04_09,Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09} <= RefFrameOutPadding;
					6'd12:{Inter_ref_08_09,Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09} <= RefFrameOutPadding;
					6'd11:{Inter_ref_12_09,Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09} <= RefFrameOutPadding;
					6'd10:Inter_ref_00_10 <= RefFrameOutPadding[31:24];
					6'd9 :{Inter_ref_04_10,Inter_ref_03_10,Inter_ref_02_10,Inter_ref_01_10} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_08_10,Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_12_10,Inter_ref_11_10,Inter_ref_10_10,Inter_ref_09_10} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_04_11,Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_08_11,Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_10_11,Inter_ref_09_11} <= RefFrameOutPadding[15:0];
					6'd3 :{Inter_ref_04_12,Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding[31:8];
					6'd2 :{Inter_ref_08_12,Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_10_12,Inter_ref_09_12} <= RefFrameOutPadding[15:0]; 
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd48:{Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:16];
					6'd47:{Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding;
					6'd46:{Inter_ref_10_00,Inter_ref_09_00,Inter_ref_08_00} <= RefFrameOutPadding[23:0];
					6'd45:{Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:16];
					6'd44:{Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding;
					6'd43:{Inter_ref_10_01,Inter_ref_09_01,Inter_ref_08_01} <= RefFrameOutPadding[23:0]; 
					6'd42:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd41:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd40:{Inter_ref_11_02,Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02} <= RefFrameOutPadding;
					6'd39:Inter_ref_12_02 <= RefFrameOutPadding[7:0];
					6'd38:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd37:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd36:{Inter_ref_11_03,Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03} <= RefFrameOutPadding;
					6'd35:Inter_ref_12_03 <= RefFrameOutPadding[7:0];
					6'd34:{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd33:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd32:{Inter_ref_11_04,Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04} <= RefFrameOutPadding;
					6'd31:Inter_ref_12_04 <= RefFrameOutPadding[7:0];
					6'd30:{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd29:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd28:{Inter_ref_11_05,Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05} <= RefFrameOutPadding;
					6'd27:Inter_ref_12_05 <= RefFrameOutPadding[7:0];
					6'd26:{Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding;
					6'd25:{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd24:{Inter_ref_11_06,Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06} <= RefFrameOutPadding;
					6'd23:Inter_ref_12_06 <= RefFrameOutPadding[7:0];
					6'd22:{Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding;
					6'd21:{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd20:{Inter_ref_11_07,Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07} <= RefFrameOutPadding;
					6'd19:Inter_ref_12_07 <= RefFrameOutPadding[7:0];
					6'd18:{Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding;
					6'd17:{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd16:{Inter_ref_11_08,Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08} <= RefFrameOutPadding;
					6'd15:Inter_ref_12_08 <= RefFrameOutPadding[7:0];
					6'd14:{Inter_ref_03_09,Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding;
					6'd13:{Inter_ref_07_09,Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09} <= RefFrameOutPadding;
					6'd12:{Inter_ref_11_09,Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09} <= RefFrameOutPadding;
					6'd11:Inter_ref_12_09 <= RefFrameOutPadding[7:0];
					6'd10:{Inter_ref_03_10,Inter_ref_02_10,Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_07_10,Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_11_10,Inter_ref_10_10,Inter_ref_09_10,Inter_ref_08_10} <= RefFrameOutPadding;
					6'd7 :Inter_ref_12_10 <= RefFrameOutPadding[7:0];
					6'd6 :{Inter_ref_03_11,Inter_ref_02_11} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_07_11,Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_10_11,Inter_ref_09_11,Inter_ref_08_11} <= RefFrameOutPadding[23:0];
					6'd3 :{Inter_ref_03_12,Inter_ref_02_12} <= RefFrameOutPadding[31:16];
					6'd2 :{Inter_ref_07_12,Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_10_12,Inter_ref_09_12,Inter_ref_08_12} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd48:{Inter_ref_02_00} <= RefFrameOutPadding[31:24];
					6'd47:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding;
					6'd46:{Inter_ref_10_00,Inter_ref_09_00,Inter_ref_08_00,Inter_ref_07_00} <= RefFrameOutPadding;
					6'd45:{Inter_ref_02_01} <= RefFrameOutPadding[31:24];
					6'd44:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding;
					6'd43:{Inter_ref_10_01,Inter_ref_09_01,Inter_ref_08_01,Inter_ref_07_01} <= RefFrameOutPadding;
					6'd42:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd41:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd40:{Inter_ref_10_02,Inter_ref_09_02,Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding;
					6'd39:{Inter_ref_12_02,Inter_ref_11_02} <= RefFrameOutPadding[15:0];
					6'd38:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd37:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd36:{Inter_ref_10_03,Inter_ref_09_03,Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding;
					6'd35:{Inter_ref_12_03,Inter_ref_11_03} <= RefFrameOutPadding[15:0];
					6'd34:{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd33:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd32:{Inter_ref_10_04,Inter_ref_09_04,Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding;
					6'd31:{Inter_ref_12_04,Inter_ref_11_04} <= RefFrameOutPadding[15:0];
					6'd30:{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd29:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd28:{Inter_ref_10_05,Inter_ref_09_05,Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding;
					6'd27:{Inter_ref_12_05,Inter_ref_11_05} <= RefFrameOutPadding[15:0];
					6'd26:{Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:8];
					6'd25:{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd24:{Inter_ref_10_06,Inter_ref_09_06,Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding;
					6'd23:{Inter_ref_12_06,Inter_ref_11_06} <= RefFrameOutPadding[15:0];
					6'd22:{Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:8];
					6'd21:{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd20:{Inter_ref_10_07,Inter_ref_09_07,Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding;
					6'd19:{Inter_ref_12_07,Inter_ref_11_07} <= RefFrameOutPadding[15:0];
					6'd18:{Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:8];
					6'd17:{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd16:{Inter_ref_10_08,Inter_ref_09_08,Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding;
					6'd15:{Inter_ref_12_08,Inter_ref_11_08} <= RefFrameOutPadding[15:0];
					6'd14:{Inter_ref_02_09,Inter_ref_01_09,Inter_ref_00_09} <= RefFrameOutPadding[31:8];
					6'd13:{Inter_ref_06_09,Inter_ref_05_09,Inter_ref_04_09,Inter_ref_03_09} <= RefFrameOutPadding;
					6'd12:{Inter_ref_10_09,Inter_ref_09_09,Inter_ref_08_09,Inter_ref_07_09} <= RefFrameOutPadding;
					6'd11:{Inter_ref_12_09,Inter_ref_11_09} <= RefFrameOutPadding[15:0];
					6'd10:{Inter_ref_02_10,Inter_ref_01_10,Inter_ref_00_10} <= RefFrameOutPadding[31:8];
					6'd9 :{Inter_ref_06_10,Inter_ref_05_10,Inter_ref_04_10,Inter_ref_03_10} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_10_10,Inter_ref_09_10,Inter_ref_08_10,Inter_ref_07_10} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_12_10,Inter_ref_11_10} <= RefFrameOutPadding[15:0];
					6'd6 :{Inter_ref_02_11} <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_06_11,Inter_ref_05_11,Inter_ref_04_11,Inter_ref_03_11} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_10_11,Inter_ref_09_11,Inter_ref_08_11,Inter_ref_07_11} <= RefFrameOutPadding;
					6'd3 :{Inter_ref_02_12} <= RefFrameOutPadding[31:24];
					6'd2 :{Inter_ref_06_12,Inter_ref_05_12,Inter_ref_04_12,Inter_ref_03_12} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_10_12,Inter_ref_09_12,Inter_ref_08_12,Inter_ref_07_12} <= RefFrameOutPadding;
					default:;
					endcase
				endcase
			endcase
		1'b1:	//mv_below8x8_curr == 1'b1
			case (pos_FracL)
			`pos_f,`pos_q,`pos_i,`pos_k,`pos_j:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd27:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd26:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding;
					6'd25:{Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00} <= RefFrameOutPadding[23:0];
					6'd24:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					6'd23:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding;
					6'd22:{Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01} <= RefFrameOutPadding[23:0];
					6'd21:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd20:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd19:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding[23:0];
					6'd18:{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd17:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd16:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding[23:0];
					6'd15:{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];
					6'd14:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd13:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding[23:0];	
					6'd12:{Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding[23:0];
					6'd9 :{Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:16];
					6'd8 :{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding[23:0];
					6'd6 :{Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07} <= RefFrameOutPadding[23:0];
					6'd3 :{Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:16];
					6'd2 :{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd27:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd26:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00} <= RefFrameOutPadding;
					6'd25:{Inter_ref_08_00,Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00} <= RefFrameOutPadding;
					6'd24:Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd23:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01} <= RefFrameOutPadding;
					6'd22:{Inter_ref_08_01,Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01} <= RefFrameOutPadding;
					6'd21:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd20:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd19:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd18:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd17:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd16:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd15:Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd14:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd13:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd12:Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd9 :Inter_ref_00_06 <= RefFrameOutPadding[31:24];
					6'd8 :{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
					6'd6 :Inter_ref_00_07 <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_07,Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding;
					6'd3 :Inter_ref_00_08 <= RefFrameOutPadding[31:24];
					6'd2 :{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_08,Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding;
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd27:{Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding;
					6'd26:{Inter_ref_07_00,Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding;
					6'd25:Inter_ref_08_00 <= RefFrameOutPadding[7:0];
					6'd24:{Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding;
					6'd23:{Inter_ref_07_01,Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding;
					6'd22:Inter_ref_08_01 <= RefFrameOutPadding[7:0];
					6'd21:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd20:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd19:Inter_ref_08_02 <= RefFrameOutPadding[7:0]; 
					6'd18:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd17:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd16:Inter_ref_08_03 <= RefFrameOutPadding[7:0];
					6'd15:{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd14:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd13:Inter_ref_08_04 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd11:{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd10:Inter_ref_08_05 <= RefFrameOutPadding[7:0];
					6'd9 :{Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd7 :Inter_ref_08_06 <= RefFrameOutPadding[7:0];
					6'd6 :{Inter_ref_03_07,Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_07_07,Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding;
					6'd4 :Inter_ref_08_07 <= RefFrameOutPadding[7:0];
					6'd3 :{Inter_ref_03_08,Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_07_08,Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding;
					6'd1 :Inter_ref_08_08 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd27:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:8];
					6'd26:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding;
					6'd25:{Inter_ref_08_00,Inter_ref_07_00} <= RefFrameOutPadding[15:0];
					6'd24:{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:8];
					6'd23:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding;
					6'd22:{Inter_ref_08_01,Inter_ref_07_01} <= RefFrameOutPadding[15:0]; 
					6'd21:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd20:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd19:{Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding[15:0];							
					6'd18:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd17:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd16:{Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding[15:0];						
					6'd15:{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd14:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd13:{Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding[15:0];						
					6'd12:{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding[15:0]; 						
					6'd9 :{Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:8];
					6'd8 :{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding[15:0];						
					6'd6 :{Inter_ref_02_07,Inter_ref_01_07,Inter_ref_00_07} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_07,Inter_ref_07_07} <= RefFrameOutPadding[15:0];						
					6'd3 :{Inter_ref_02_08,Inter_ref_01_08,Inter_ref_00_08} <= RefFrameOutPadding[31:8];
					6'd2 :{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_08,Inter_ref_07_08} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				endcase
			`pos_d,`pos_h,`pos_n:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd9:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding;
					6'd8:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding;
					6'd7:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd6:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd5:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd4:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd3:{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd2:{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd1:{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd18:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:8];
					6'd17:Inter_ref_05_00 <= RefFrameOutPadding[7:0];
					6'd16:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:8];
					6'd15:Inter_ref_05_01 <= RefFrameOutPadding[7:0];						
					6'd14:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:8];
					6'd13:Inter_ref_05_02 <= RefFrameOutPadding[7:0];
					6'd12:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:8];
					6'd11:Inter_ref_05_03 <= RefFrameOutPadding[7:0];
					6'd10:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:8];
					6'd9 :Inter_ref_05_04 <= RefFrameOutPadding[7:0];			
					6'd8 :{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:8];
					6'd7 :Inter_ref_05_05 <= RefFrameOutPadding[7:0];		
					6'd6 :{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:8];
					6'd5 :Inter_ref_05_06 <= RefFrameOutPadding[7:0];
					6'd4 :{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:8];
					6'd3 :Inter_ref_05_07 <= RefFrameOutPadding[7:0];
					6'd2 :{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:8];
					6'd1 :Inter_ref_05_08 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd18:{Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:16];
					6'd17:{Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding[15:0];
					6'd16:{Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:16];
					6'd15:{Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding[15:0];
					6'd14:{Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:16];
					6'd13:{Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding[15:0];		
					6'd12:{Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding[15:0];
					6'd10:{Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:16];
					6'd9 :{Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding[15:0];
					6'd8 :{Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:16];
					6'd7 :{Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding[15:0];
					6'd6 :{Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding[15:0];
					6'd4 :{Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:16];
					6'd3 :{Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding[15:0];
					6'd2 :{Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:16];
					6'd1 :{Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd18:Inter_ref_02_00 <= RefFrameOutPadding[31:24];
					6'd17:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding[23:0];
					6'd16:Inter_ref_02_01 <= RefFrameOutPadding[31:24];
					6'd15:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding[23:0];
					6'd14:Inter_ref_02_02 <= RefFrameOutPadding[31:24];
					6'd13:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding[23:0];
							
					6'd12:Inter_ref_02_03 <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding[23:0];
							
					6'd10:Inter_ref_02_04 <= RefFrameOutPadding[31:24];
					6'd9 :{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding[23:0];
							
					6'd8 :Inter_ref_02_05 <= RefFrameOutPadding[31:24];
					6'd7 :{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding[23:0];
							
					6'd6 :Inter_ref_02_06 <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding[23:0];
							
					6'd4 :Inter_ref_02_07 <= RefFrameOutPadding[31:24];
					6'd3 :{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding[23:0];
							
					6'd2 :Inter_ref_02_08 <= RefFrameOutPadding[31:24];
					6'd1 :{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				endcase
			`pos_a,`pos_b,`pos_c:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd12:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd11:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding[23:0];
							
					6'd9 :{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd8 :{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding[23:0];
							
					6'd6 :{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding[23:0];	
							
					6'd3 :{Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:16];
					6'd2 :{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd12:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd11:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
							
					6'd9 :Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd8 :{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
							
					6'd6 :Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
							
					6'd3 :Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd2 :{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd12:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd11:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd10:Inter_ref_08_02 <= RefFrameOutPadding[7:0]; 
							
					6'd9 :{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd7 :Inter_ref_08_03 <= RefFrameOutPadding[7:0]; 
							
					6'd6 :{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd4 :Inter_ref_08_04 <= RefFrameOutPadding[7:0];
							
					6'd3 :{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd2 :{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd1 :Inter_ref_08_05 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd12:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd11:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd10:{Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding[15:0];
							
					6'd9 :{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd8 :{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd7 :{Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding[15:0];
							
					6'd6 :{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd4 :{Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding[15:0];
							
					6'd3 :{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd2 :{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd1 :{Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding[15:0];	
					default:;
					endcase
				endcase
			`pos_Int:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd4:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd3:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd2:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd1:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd8:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:8];
					6'd7:Inter_ref_05_02 <= RefFrameOutPadding[7:0];
							
					6'd6:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:8];
					6'd5:Inter_ref_05_03 <= RefFrameOutPadding[7:0];
							
					6'd4:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:8];
					6'd3:Inter_ref_05_04 <= RefFrameOutPadding[7:0];
							
					6'd2:{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:8];
					6'd1:Inter_ref_05_05 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd8:{Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[31:16];
					6'd7:{Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding[15:0];
							
					6'd6:{Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[31:16];
					6'd5:{Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding[15:0];
							
					6'd4:{Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[31:16];
					6'd3:{Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding[15:0];
							
					6'd2:{Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding[31:16];
					6'd1:{Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd8:Inter_ref_02_02 <= RefFrameOutPadding[31:24];
					6'd7:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding[23:0];
							
					6'd6:Inter_ref_02_03 <= RefFrameOutPadding[31:24];
					6'd5:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding[23:0];
							
					6'd4:Inter_ref_02_04 <= RefFrameOutPadding[31:24];
					6'd3:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding[23:0];
							
					6'd2:Inter_ref_02_05 <= RefFrameOutPadding[31:24];
					6'd1:{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				endcase
			`pos_e,`pos_g,`pos_p,`pos_r:
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd23:{Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding;
					6'd22:Inter_ref_06_00 <= RefFrameOutPadding[7:0];
					6'd21:{Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding;
					6'd20:Inter_ref_06_01 <= RefFrameOutPadding[7:0];
					
					6'd19:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd18:{Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding;
					6'd17:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02} <= RefFrameOutPadding[23:0];
					6'd16:{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];                          
					6'd15:{Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding;
					6'd14:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03} <= RefFrameOutPadding[23:0];          
					6'd13:{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];                          
					6'd12:{Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding;
					6'd11:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04} <= RefFrameOutPadding[23:0];          
					6'd10:{Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:16];                          
					6'd9 :{Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05} <= RefFrameOutPadding[23:0];          
					6'd7 :{Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:16];                          
					6'd6 :{Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06} <= RefFrameOutPadding[23:0];          
							
					6'd4 :{Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding;
					6'd3 :Inter_ref_06_07 <= RefFrameOutPadding[7:0];
					6'd2 :{Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding;
					6'd1 :Inter_ref_06_08 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd23:{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:8];
					6'd22:{Inter_ref_06_00,Inter_ref_05_00} <= RefFrameOutPadding[15:0];
					6'd21:{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:8];
					6'd20:{Inter_ref_06_01,Inter_ref_05_01} <= RefFrameOutPadding[15:0];
					
					6'd19:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd18:{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd17:{Inter_ref_08_02,Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02} <= RefFrameOutPadding;
					6'd16:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd15:{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd14:{Inter_ref_08_03,Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03} <= RefFrameOutPadding;
					6'd13:Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd12:{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					6'd11:{Inter_ref_08_04,Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04} <= RefFrameOutPadding;
					6'd10:Inter_ref_00_05 <= RefFrameOutPadding[31:24];
					6'd9 :{Inter_ref_04_05,Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_08_05,Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05} <= RefFrameOutPadding;
					6'd7 :Inter_ref_00_06 <= RefFrameOutPadding[31:24];
					6'd6 :{Inter_ref_04_06,Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_08_06,Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06} <= RefFrameOutPadding;
							
					6'd4 :{Inter_ref_04_07,Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:8];
					6'd3 :{Inter_ref_06_07,Inter_ref_05_07} <= RefFrameOutPadding[15:0];
					6'd2 :{Inter_ref_04_08,Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:8];
					6'd1 :{Inter_ref_06_08,Inter_ref_05_08} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd23:{Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[31:16];
					6'd22:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00} <= RefFrameOutPadding[23:0];
					6'd21:{Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[31:16];
					6'd20:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01} <= RefFrameOutPadding[23:0];	
							
					6'd19:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd18:{Inter_ref_07_02,Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02} <= RefFrameOutPadding;
					6'd17:Inter_ref_08_02 <= RefFrameOutPadding[7:0]; 
					6'd16:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd15:{Inter_ref_07_03,Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03} <= RefFrameOutPadding;
					6'd14:Inter_ref_08_03 <= RefFrameOutPadding[7:0]; 
					6'd13:{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd12:{Inter_ref_07_04,Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04} <= RefFrameOutPadding;
					6'd11:Inter_ref_08_04 <= RefFrameOutPadding[7:0];
					6'd10:{Inter_ref_03_05,Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding;
					6'd9 :{Inter_ref_07_05,Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05} <= RefFrameOutPadding;
					6'd8 :Inter_ref_08_05 <= RefFrameOutPadding[7:0];
					6'd7 :{Inter_ref_03_06,Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding;
					6'd6 :{Inter_ref_07_06,Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06} <= RefFrameOutPadding;
					6'd5 :Inter_ref_08_06 <= RefFrameOutPadding[7:0];
							
					6'd4 :{Inter_ref_03_07,Inter_ref_02_07} <= RefFrameOutPadding[31:16];
					6'd3 :{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07} <= RefFrameOutPadding[23:0];
					6'd2 :{Inter_ref_03_08,Inter_ref_02_08} <= RefFrameOutPadding[31:16];
					6'd1 :{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)	
					6'd23:Inter_ref_02_00 <= RefFrameOutPadding[31:24];
					6'd22:{Inter_ref_06_00,Inter_ref_05_00,Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding;
					6'd21:Inter_ref_02_01 <= RefFrameOutPadding[31:24];
					6'd20:{Inter_ref_06_01,Inter_ref_05_01,Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding;
							
					6'd19:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd18:{Inter_ref_06_02,Inter_ref_05_02,Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding;
					6'd17:{Inter_ref_08_02,Inter_ref_07_02} <= RefFrameOutPadding[15:0];
					6'd16:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd15:{Inter_ref_06_03,Inter_ref_05_03,Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding;
					6'd14:{Inter_ref_08_03,Inter_ref_07_03} <= RefFrameOutPadding[15:0];
					6'd13:{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd12:{Inter_ref_06_04,Inter_ref_05_04,Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding;
					6'd11:{Inter_ref_08_04,Inter_ref_07_04} <= RefFrameOutPadding[15:0];
					6'd10:{Inter_ref_02_05,Inter_ref_01_05,Inter_ref_00_05} <= RefFrameOutPadding[31:8];
					6'd9 :{Inter_ref_06_05,Inter_ref_05_05,Inter_ref_04_05,Inter_ref_03_05} <= RefFrameOutPadding;
					6'd8 :{Inter_ref_08_05,Inter_ref_07_05} <= RefFrameOutPadding[15:0];	
					6'd7 :{Inter_ref_02_06,Inter_ref_01_06,Inter_ref_00_06} <= RefFrameOutPadding[31:8];
					6'd6 :{Inter_ref_06_06,Inter_ref_05_06,Inter_ref_04_06,Inter_ref_03_06} <= RefFrameOutPadding;
					6'd5 :{Inter_ref_08_06,Inter_ref_07_06} <= RefFrameOutPadding[15:0];
							
					6'd4 :Inter_ref_02_07 <= RefFrameOutPadding[31:24];
					6'd3 :{Inter_ref_06_07,Inter_ref_05_07,Inter_ref_04_07,Inter_ref_03_07} <= RefFrameOutPadding;
					6'd2 :Inter_ref_02_08 <= RefFrameOutPadding[31:24];
					6'd1 :{Inter_ref_06_08,Inter_ref_05_08,Inter_ref_04_08,Inter_ref_03_08} <= RefFrameOutPadding;
					default:;
					endcase
				endcase
			endcase
		endcase
	else if (IsInterChroma && blk4x4_inter_preload_counter != 0)begin
		if (mv_below8x8_curr == 1'b0)begin
			if (xFracC == 0 && yFracC == 0)	// 8 or 4 cycles
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd4:{Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding;
					6'd3:{Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding;
					6'd2:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd1:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd8:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:8];
					6'd7:Inter_ref_03_00 <= RefFrameOutPadding[7:0];
					6'd6:{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:8];
					6'd5:Inter_ref_03_01 <= RefFrameOutPadding[7:0];
					6'd4:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd3:Inter_ref_03_02 <= RefFrameOutPadding[7:0];
					6'd2:{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd1:Inter_ref_03_03 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd8:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd7:{Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[15:0];
					6'd6:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					6'd5:{Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[15:0];
					6'd4:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd3:{Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[15:0];
					6'd2:{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd1:{Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd8:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd7:{Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00} <= RefFrameOutPadding[23:0];
					6'd6:Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd5:{Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01} <= RefFrameOutPadding[23:0];
					6'd4:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd3:{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding[23:0];
					6'd2:Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd1:{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				endcase
			else
				case (xInt_org_unclip_1to0)
				2'b00:
					case(blk4x4_inter_preload_counter)
					6'd10:{Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding;
					6'd9 :Inter_ref_04_00 <= RefFrameOutPadding[7:0];
					6'd8 :{Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding;
					6'd7 :Inter_ref_04_01 <= RefFrameOutPadding[7:0];
					6'd6 :{Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding;
					6'd5 :Inter_ref_04_02 <= RefFrameOutPadding[7:0];
					6'd4 :{Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding;
					6'd3 :Inter_ref_04_03 <= RefFrameOutPadding[7:0];
					6'd2 :{Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding;
					6'd1 :Inter_ref_04_04 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd10:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:8];
					6'd9 :{Inter_ref_04_00,Inter_ref_03_00} <= RefFrameOutPadding[15:0];
					6'd8 :{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:8];
					6'd7 :{Inter_ref_04_01,Inter_ref_03_01} <= RefFrameOutPadding[15:0];
					6'd6 :{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					6'd5 :{Inter_ref_04_02,Inter_ref_03_02} <= RefFrameOutPadding[15:0];
					6'd4 :{Inter_ref_02_03,Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:8];
					6'd3 :{Inter_ref_04_03,Inter_ref_03_03} <= RefFrameOutPadding[15:0];
					6'd2 :{Inter_ref_02_04,Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:8];
					6'd1 :{Inter_ref_04_04,Inter_ref_03_04} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd10:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd9 :{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00} <= RefFrameOutPadding[23:0];
					6'd8 :{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					6'd7 :{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01} <= RefFrameOutPadding[23:0];
					6'd6 :{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd5 :{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02} <= RefFrameOutPadding[23:0];
					6'd4 :{Inter_ref_01_03,Inter_ref_00_03} <= RefFrameOutPadding[31:16];
					6'd3 :{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03} <= RefFrameOutPadding[23:0];
					6'd2 :{Inter_ref_01_04,Inter_ref_00_04} <= RefFrameOutPadding[31:16];
					6'd1 :{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd10:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd9 :{Inter_ref_04_00,Inter_ref_03_00,Inter_ref_02_00,Inter_ref_01_00} <= RefFrameOutPadding;
					6'd8 :Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd7 :{Inter_ref_04_01,Inter_ref_03_01,Inter_ref_02_01,Inter_ref_01_01} <= RefFrameOutPadding;
					6'd6 :Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd5 :{Inter_ref_04_02,Inter_ref_03_02,Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding;
					6'd4 :Inter_ref_00_03 <= RefFrameOutPadding[31:24];
					6'd3 :{Inter_ref_04_03,Inter_ref_03_03,Inter_ref_02_03,Inter_ref_01_03} <= RefFrameOutPadding;
					6'd2 :Inter_ref_00_04 <= RefFrameOutPadding[31:24];
					6'd1 :{Inter_ref_04_04,Inter_ref_03_04,Inter_ref_02_04,Inter_ref_01_04} <= RefFrameOutPadding;
					default:;
					endcase
				endcase
			end
		else	// mv_below8x8_curr == 1'b1
			begin
			if (xFracC == 0 && yFracC == 0)	// 4 or 2 cycles
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd2:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[15:0];
					6'd1:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd2:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[23:8];
					6'd1:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[23:8];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd2:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd1:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd4:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd3:Inter_ref_01_00 <= RefFrameOutPadding[7:0];
					6'd2:Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd1:Inter_ref_01_01 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				endcase
			else	// 6 or 3 cycles
				case (xInt_org_unclip_1to0)
				2'b00:
					case (blk4x4_inter_preload_counter)
					6'd3:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[23:0];
					6'd2:{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[23:0];
					6'd1:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[23:0];
					default:;
					endcase
				2'b01:
					case (blk4x4_inter_preload_counter)
					6'd3:{Inter_ref_02_00,Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:8];
					6'd2:{Inter_ref_02_01,Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:8];
					6'd1:{Inter_ref_02_02,Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:8];
					default:;
					endcase
				2'b10:
					case (blk4x4_inter_preload_counter)
					6'd6:{Inter_ref_01_00,Inter_ref_00_00} <= RefFrameOutPadding[31:16];
					6'd5:Inter_ref_02_00 <= RefFrameOutPadding[7:0];
					6'd4:{Inter_ref_01_01,Inter_ref_00_01} <= RefFrameOutPadding[31:16];
					6'd3:Inter_ref_02_01 <= RefFrameOutPadding[7:0];
					6'd2:{Inter_ref_01_02,Inter_ref_00_02} <= RefFrameOutPadding[31:16];
					6'd1:Inter_ref_02_02 <= RefFrameOutPadding[7:0];
					default:;
					endcase
				2'b11:
					case (blk4x4_inter_preload_counter)
					6'd6:Inter_ref_00_00 <= RefFrameOutPadding[31:24];
					6'd5:{Inter_ref_02_00,Inter_ref_01_00} <= RefFrameOutPadding[15:0];
					6'd4:Inter_ref_00_01 <= RefFrameOutPadding[31:24];
					6'd3:{Inter_ref_02_01,Inter_ref_01_01} <= RefFrameOutPadding[15:0];
					6'd2:Inter_ref_00_02 <= RefFrameOutPadding[31:24];
					6'd1:{Inter_ref_02_02,Inter_ref_01_02} <= RefFrameOutPadding[15:0];
					default:;
					endcase
				endcase
			end
		end


assign calulate_end = (blk4x4_inter_calculate_counter == 4'd1 &&
	((IsInterChroma && mv_below8x8_curr && Inter_chroma2x2_counter == 2'b00) ||
	!(IsInterChroma && mv_below8x8_curr)));






			
endmodule


module filterH_6tap(A,B,C,D,E,F,H_need_round,raw_out,round_out);
	input [7:0] A,B,C,D,E,F;
	input H_need_round;
	output [14:0] raw_out; 	//always output
	output [7:0]  round_out;
	
	wire [8:0] sum_AF;
	wire [8:0] sum_BE;
	wire [8:0] sum_CD;
	wire [10:0] sum_4CD;
	wire [11:0] sum_1;
	wire [12:0] sum_2;
	wire [13:0] sum_3;
	wire [14:0] sum_round;
	wire [9:0] round_tmp;
	
	assign sum_AF = A + F;
	assign sum_BE = B + E;
	assign sum_CD = C + D;
	assign sum_4CD = {sum_CD,2'b0};
	assign sum_1 = {1'b0,sum_4CD} + {3'b111,~sum_BE} + 1;
	assign sum_2 = {4'b0,sum_AF} + {sum_1[11],sum_1};
	assign sum_3 = {sum_1,2'b0};
	assign raw_out = {{2{sum_2[12]}},sum_2} + {sum_3[13],sum_3};
	//round
	assign sum_round = (H_need_round)? (raw_out + 16):0;
	assign round_tmp = (H_need_round)? sum_round[14:5]:0;
	assign round_out = (round_tmp[9])? 8'd0:((round_tmp[8])? 8'd255:round_tmp[7:0]);
endmodule

module filterV_6tap(A,B,C,D,E,F,Is_jfqik,round_out);
	input [14:0] A,B,C,D,E,F;
	input Is_jfqik;
	output [7:0] round_out;
	
	wire [15:0] sum_AF;
	wire [15:0] sum_BE;
	wire [15:0] sum_CD;
	wire [17:0] sum_4CD;
	wire [17:0] sum_1;
	wire [17:0] sum_2;
	wire [19:0] sum_3;
	wire [19:0] raw_out;
	
	wire [19:0] sum_round;
	wire [9:0] round_tmp;
	
	assign sum_AF = {A[14],A} + {F[14],F};
	assign sum_BE = {B[14],B} + {E[14],E};
	assign sum_CD = {C[14],C} + {D[14],D};
	assign sum_4CD = {sum_CD,2'b0};
	assign sum_1 = sum_4CD + {~sum_BE[15],~sum_BE[15],~sum_BE} + 1;
	assign sum_2 = {{2{sum_AF[15]}},sum_AF} + sum_1;
	assign sum_3 = {sum_1,2'b0};
	assign raw_out = {{2{sum_2[17]}},sum_2} + sum_3;
	//round
	assign sum_round = (Is_jfqik)? (raw_out + 512):(raw_out + 16);
	assign round_tmp = (Is_jfqik)? sum_round[19:10]:sum_round[14:5];
	assign round_out = (round_tmp[9])? 8'd0:((round_tmp[8])? 8'd255:round_tmp[7:0]);
endmodule

module bilinear (A,B,bilinear_out);
	input [7:0] A,B;
	output [7:0] bilinear_out;
	wire [8:0] sum_AB;
	
	assign sum_AB = A + B + 1; //here A and B should NOT extend as {A[7],A}
	assign bilinear_out = sum_AB[8:1];
endmodule

module CPE (xFracC,yFracC,xFracC_n,yFracC_n,a,b,c,d,out);
	input [2:0] xFracC,yFracC;
	input [3:0] xFracC_n,yFracC_n;
	input [7:0] a,b,c,d;
	output [7:0] out;
	
	wire [13:0] CPE_base0_out,CPE_base1_out,CPE_base2_out,CPE_base3_out;
	wire [13:0] out_tmp; 
	
	CPE_base CPE_base0 (
		.x(xFracC_n),
		.y(yFracC_n),
		.Int_pel(a),
		.out(CPE_base0_out)
		);
	CPE_base CPE_base1 (
		.x({1'b0,xFracC}),
		.y(yFracC_n),
		.Int_pel(b),
		.out(CPE_base1_out)
		); 
	CPE_base CPE_base2 (
		.x(xFracC_n),
		.y({1'b0,yFracC}),
		.Int_pel(c),
		.out(CPE_base2_out)
		);
	CPE_base CPE_base3 (
		.x({1'b0,xFracC}),
		.y({1'b0,yFracC}),
		.Int_pel(d),
		.out(CPE_base3_out)
		);
	assign out_tmp = (CPE_base0_out + CPE_base1_out) + (CPE_base2_out + CPE_base3_out) + 32;
	assign out = out_tmp[13:6];
endmodule

module CPE_base (x,y,Int_pel,out);
	input [3:0] x;	
	input [3:0] y;	
	input [7:0] Int_pel;
	output [13:0] out;
	
	wire [10:0] sum_x3;
	wire [9:0] sum_x2;
	wire [8:0] sum_x1;
	wire [7:0] sum_x0;
	wire [10:0] sum_x;
	
	wire [13:0] sum_y3;
	wire [12:0] sum_y2;
	wire [11:0] sum_y1;
	wire [10:0] sum_y0;
	
	assign sum_x3 = (x[3] == 1'b1)? {Int_pel,3'b0}:0;
	assign sum_x2 = (x[2] == 1'b1)? {Int_pel,2'b0}:0;
	assign sum_x1 = (x[1] == 1'b1)? {Int_pel,1'b0}:0;
	assign sum_x0 = (x[0] == 1'b1)? Int_pel:0; 
	assign sum_x = (sum_x3 + {1'b0,sum_x2}) + ({2'b0,sum_x1} + {3'b0,sum_x0});
	
	assign sum_y3 = (y[3] == 1'b1)? {sum_x,3'b0}:0;
	assign sum_y2 = (y[2] == 1'b1)? {sum_x,2'b0}:0;
	assign sum_y1 = (y[1] == 1'b1)? {sum_x,1'b0}:0;
	assign sum_y0 = (y[0] == 1'b1)? sum_x:0; 
	assign out = (sum_y3 + {1'b0,sum_y2}) + ({2'b0,sum_y1} + {3'b0,sum_y0});
endmodule













