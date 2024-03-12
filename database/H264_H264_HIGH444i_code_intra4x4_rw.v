`include "timescale.v"
`include "define.v"

module intra4x4_rw(
input clk,reset_n,res_0,
input [7:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,
input [7:0] img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
input [7:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,
input [7:0] img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33,
input [1:0] Intra16x16_predmode,
input [4:0] TotalCoeff,
input [5:0] intra16_pred_num,
input [1:0] residual_intra16_state,
input [2:0] intra_pred_state, 
input [31:0] intra4x4_dout,
input [7:0] mb_num_h,mb_num_v,pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input cavlc_end,

output reg intra4x4_rd_n,intra4x4_wr_n,
output reg [11:0] intra4x4_rd_addr,intra4x4_wr_addr,
output reg [31:0] intra4x4_din,
output intra16_read_end,
output reg [7:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3,
output reg [2:0] state16,

output reg TC_wr_n,
output reg [5:0] TC_A_wr_addr,
output reg [12:0] TC_B_wr_addr,
output reg [4:0] TC_din,
output [1:0] chroma_i8x8,chroma_i4x4,
output img_wr_n,

output reg [31:0] img_addra_y0,img_addra_y1,img_addra_y2,img_addra_y3,
output reg [31:0] img_addra_u0,img_addra_u1,img_addra_u2,img_addra_u3,
output reg [31:0] img_addra_v0,img_addra_v1,img_addra_v2,img_addra_v3

);


assign intra16_read_end= (intra_pred_state == `intra_pred_read  && 
			(mb_num_v == 0 || state16 == `intra16r_pl ||
			(state16 == `intra16r_h3 && Intra16x16_predmode != `Intra16x16_Plane)
			));

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state16 <= `intra16r_rst;
	else if(intra_pred_state == `intra_pred_read)
		case(state16)
		`intra16r_rst:	state16<= mb_num_v == 0 ? `intra16r_rst:`intra16r_h0r;
		`intra16r_h0r:	state16 <= `intra16r_h0;
		`intra16r_h0:	state16 <= `intra16r_h1;
		`intra16r_h1:	state16 <= `intra16r_h2;
		`intra16r_h2:	state16 <= `intra16r_h3;
		`intra16r_h3:	state16 <= (Intra16x16_predmode == `Intra16x16_Plane)?`intra16r_pl:`intra16r_rst;
		`intra16r_pl:	state16 <= `intra16r_rst;
		default:	state16 <= `intra16r_rst;
		endcase



always @(state16 or mb_num_h or mb_num_v  or reset_n  or intra16_pred_num )
	if (reset_n == 0)begin
		intra4x4_rd_n = 1;	intra4x4_rd_addr = 0;end
 	else if(state16 != `intra16r_rst && intra16_pred_num == 0)begin
		intra4x4_rd_n = 0; 
		case(state16)
		`intra16r_h0r:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd0};
		`intra16r_h0: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd1};
		`intra16r_h1: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd2};
		`intra16r_h2: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd3};
		`intra16r_h3: intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,~mb_num_v[0],4'd3};
		default:intra4x4_rd_addr = 0;
		endcase
	end
	else if(state16 != `intra16r_rst && intra16_pred_num == 18)begin
		intra4x4_rd_n = 0; 
		case(state16)
		`intra16r_h0r:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd4};
		`intra16r_h0: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd5};
		`intra16r_h1: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd6};
		`intra16r_h2: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd7};
		`intra16r_h3: intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,~mb_num_v[0],4'd7};
		default:intra4x4_rd_addr = 0;
		endcase
	end
	else if(state16 != `intra16r_rst && intra16_pred_num == 6'd34)begin
		intra4x4_rd_n = 0; 
		case(state16)
		`intra16r_h0r:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd8};
		`intra16r_h0: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd9};
		`intra16r_h1: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd10};
		`intra16r_h2: intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],4'd11};
		`intra16r_h3: intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,~mb_num_v[0],4'd11};
		default:intra4x4_rd_addr = 0;
		endcase
	end
	else begin
		intra4x4_rd_n = 1;	intra4x4_rd_addr = 0;end


always @ (reset_n or state16 or intra4x4_dout)
	if (reset_n == 0)begin
		nrblock16_0 = 0;nrblock16_1 = 0;nrblock16_2 = 0;nrblock16_3 = 0;end
	else 
		case(state16)
		`intra16r_h0,`intra16r_h1,`intra16r_h2,`intra16r_h3:begin
			nrblock16_0 = intra4x4_dout[7:0];nrblock16_1 = intra4x4_dout[15:8];
			nrblock16_2 = intra4x4_dout[23:16];nrblock16_3 = intra4x4_dout[31:24];end
		`intra16r_pl:begin
			nrblock16_0 = intra4x4_dout[31:24];nrblock16_1 = 0;nrblock16_2 = 0;nrblock16_3 = 0;end
		default:begin nrblock16_0 = 0;nrblock16_1 = 0;nrblock16_2 = 0;nrblock16_3 = 0;end
		endcase

assign img_wr_n = ~(residual_intra16_state == `intra16_updat && intra16_pred_num != 6'b111111 && 
			intra16_pred_num != 6'd16 && intra16_pred_num != 6'd17);


wire [1:0] addra_num;
wire [1:0] addra_sel;
assign addra_num = intra16_pred_num == 6'd7 || intra16_pred_num == 6'd25 || intra16_pred_num == 6'd41 ? 2'd1 :
						 intra16_pred_num == 6'd13 || intra16_pred_num == 6'd31 || intra16_pred_num == 6'd47 ? 2'd2 :
						 intra16_pred_num == 6'd15 || intra16_pred_num == 6'd33 || intra16_pred_num == 6'd49 ? 2'd3 : 2'd0;
						 
assign addra_sel = intra16_pred_num == 6'd5  || intra16_pred_num == 6'd7 || 
						 intra16_pred_num == 6'd13 || intra16_pred_num == 6'd15 ? 2'd1 :
						 intra16_pred_num == 6'd23 || intra16_pred_num == 6'd25 || 
						 intra16_pred_num == 6'd31 || intra16_pred_num == 6'd33 ? 2'd2 :
						 intra16_pred_num == 6'd39 || intra16_pred_num == 6'd41 || 
						 intra16_pred_num == 6'd47 || intra16_pred_num == 6'd49 ? 2'd3 : 2'd0;
			
always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		img_addra_y0 <= 0;	img_addra_y1 <= 0;	img_addra_y2 <= 0;	img_addra_y3 <= 0;
		img_addra_u0 <= 0;	img_addra_u1 <= 0;	img_addra_u2 <= 0;	img_addra_u3 <= 0;
		img_addra_v0 <= 0;	img_addra_v1 <= 0;	img_addra_v2 <= 0;	img_addra_v3 <= 0;end
	else if(residual_intra16_state == `intra16_updat && addra_sel != 0)
		case({addra_sel,addra_num})
		4'b0100:	img_addra_y0 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b0101:	img_addra_y1 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b0110:	img_addra_y2 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b0111:	img_addra_y3 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1000:	img_addra_u0 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1001:	img_addra_u1 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1010:	img_addra_u2 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1011:	img_addra_u3 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1100:	img_addra_v0 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1101:	img_addra_v1 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1110:	img_addra_v2 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		4'b1111:	img_addra_v3 <= {img_4x4_33,img_4x4_23,img_4x4_13,img_4x4_03};
		default:;
		endcase
		
always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		intra4x4_wr_n <= 1;
		intra4x4_wr_addr <= 0;intra4x4_din <= 0;end
	else if(residual_intra16_state == `intra16_updat)begin
		intra4x4_din <= {img_4x4_33,img_4x4_32,img_4x4_31,img_4x4_30};
		case(intra16_pred_num)
		10:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd0};end
		11:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd1};end
		14:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd2};end
		15:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd3};end
		28:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd4};end
		29:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd5};end
		32:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd6};end
		33:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd7};end
		44:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd8};end
		45:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd9};end
		48:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd10};end
		49:begin
			intra4x4_wr_n <= 0;	intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],4'd11};end
		default:begin
			intra4x4_wr_n <= 1;	intra4x4_wr_addr <= 0;end
		endcase
	end
	else begin
		intra4x4_wr_n <= 1;
		intra4x4_wr_addr <= 0;intra4x4_din <= 0;end
		
			


//tc
always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		 TC_wr_n <= 1;
		 TC_A_wr_addr <= 0;  TC_B_wr_addr <= 0;
		 TC_din <= 0;
		 end
	else if(cavlc_end)begin
		TC_wr_n <= 0;
		TC_A_wr_addr <= intra16_pred_num;
		TC_B_wr_addr <= {mb_num_h[6:0],intra16_pred_num};
		TC_din <= res_0 ? 5'd0 : TotalCoeff;end
	else begin
		 TC_wr_n <= 1;
		 TC_A_wr_addr <= 0;  TC_B_wr_addr <= 0;
		 TC_din <= 0;
		 end



assign chroma_i8x8 = (intra16_pred_num == 18 || intra16_pred_num == 19 || intra16_pred_num == 20 || intra16_pred_num == 21 || 
							 intra16_pred_num == 34 || intra16_pred_num == 35 || intra16_pred_num == 36 || intra16_pred_num == 37 )? 2'd0:
							(intra16_pred_num == 22 || intra16_pred_num == 23 || intra16_pred_num == 24 || intra16_pred_num == 25 || 
							 intra16_pred_num == 38 || intra16_pred_num == 39 || intra16_pred_num == 40 || intra16_pred_num == 41 )? 2'd1:
							(intra16_pred_num == 26 || intra16_pred_num == 27 || intra16_pred_num == 28 || intra16_pred_num == 29 || 
							 intra16_pred_num == 42 || intra16_pred_num == 43 || intra16_pred_num == 44 || intra16_pred_num == 45 )? 2'd2:2'd3;
							 
assign chroma_i4x4 = (intra16_pred_num == 18 || intra16_pred_num == 22 || intra16_pred_num == 26 || intra16_pred_num == 30 || 
							 intra16_pred_num == 34 || intra16_pred_num == 38 || intra16_pred_num == 42 || intra16_pred_num == 46 )? 2'd0:
							(intra16_pred_num == 19 || intra16_pred_num == 23 || intra16_pred_num == 27 || intra16_pred_num == 31 || 
							 intra16_pred_num == 35 || intra16_pred_num == 39 || intra16_pred_num == 43 || intra16_pred_num == 47 )? 2'd1:
							(intra16_pred_num == 20 || intra16_pred_num == 24 || intra16_pred_num == 28 || intra16_pred_num == 32 || 
							 intra16_pred_num == 36 || intra16_pred_num == 40 || intra16_pred_num == 44 || intra16_pred_num == 48 )? 2'd2:2'd3;
		
endmodule
