`include "timescale.v"
`include "define.v"

module sample_reconstruct(
input clk,reset_n,
input [15:0] intra_pred_16_00,intra_pred_16_01,intra_pred_16_02,intra_pred_16_03,
input [15:0] intra_pred_16_10,intra_pred_16_11,intra_pred_16_12,intra_pred_16_13,
input [15:0] intra_pred_16_20,intra_pred_16_21,intra_pred_16_22,intra_pred_16_23,
input [15:0] intra_pred_16_30,intra_pred_16_31,intra_pred_16_32,intra_pred_16_33,

input [1:0] residual_intra16_state,
input [5:0] intra16_pred_num,
input [1:0] Intra16x16_predmode,
input [15:0] cavlc_coeffLevel_0,cavlc_coeffLevel_1,cavlc_coeffLevel_2,cavlc_coeffLevel_3,
input [15:0] cavlc_coeffLevel_4,cavlc_coeffLevel_5,cavlc_coeffLevel_6,cavlc_coeffLevel_7,
input [15:0] cavlc_coeffLevel_8,cavlc_coeffLevel_9,cavlc_coeffLevel_10,cavlc_coeffLevel_11,
input [15:0] cavlc_coeffLevel_12,cavlc_coeffLevel_13,cavlc_coeffLevel_14,cavlc_coeffLevel_15,



output [15:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
output [15:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33

);

wire [15:0] img_00_reg,img_01_reg,img_02_reg,img_03_reg;
wire [15:0] img_10_reg,img_11_reg,img_12_reg,img_13_reg;
wire [15:0] img_20_reg,img_21_reg,img_22_reg,img_23_reg;
wire [15:0] img_30_reg,img_31_reg,img_32_reg,img_33_reg;

reg [15:0] dc00,dc01,dc02,dc03,dc10,dc11,dc12,dc13;
reg [15:0] dc20,dc21,dc22,dc23,dc30,dc31,dc32,dc33;
reg [15:0] resi00,resi01,resi02,resi03,resi10,resi11,resi12,resi13;
reg [15:0] resi20,resi21,resi22,resi23,resi30,resi31,resi32,resi33;

reg [15:0] dc_res;
wire [5:0] pred_num;

assign pred_num = intra16_pred_num < 6'd16 ? intra16_pred_num :
	     intra16_pred_num < 6'd34 ? intra16_pred_num - 6'd18 : intra16_pred_num - 6'd34;
		  

reg [15:0] res_tmp_h0,res_tmp_h1,res_tmp_h2,res_tmp_h3,res_tmp_h4,res_tmp_h5,res_tmp_h6,res_tmp_h7;
reg [15:0] res_tmp_h8,res_tmp_h9,res_tmp_h10,res_tmp_h11,res_tmp_h12,res_tmp_h13,res_tmp_h14,res_tmp_h15;
reg [15:0] res_tmp_v0,res_tmp_v1,res_tmp_v2,res_tmp_v3,res_tmp_v4,res_tmp_v5,res_tmp_v6,res_tmp_v7;
reg [15:0] res_tmp_v8,res_tmp_v9,res_tmp_v10,res_tmp_v11,res_tmp_v12,res_tmp_v13,res_tmp_v14,res_tmp_v15;
reg [15:0] res_h0,res_h1,res_h2,res_h3,res_v0,res_v1,res_v2,res_v3;

always@(posedge clk or negedge reset_n)
	if(reset_n == 1'b0)begin
		dc00 <= 0;		dc01 <= 0;		dc02 <= 0;		dc03 <= 0;		
		dc10 <= 0;		dc11 <= 0;		dc12 <= 0;		dc13 <= 0;	
		dc20 <= 0;		dc21 <= 0;		dc22 <= 0;		dc23 <= 0;	
		dc30 <= 0;		dc31 <= 0;		dc32 <= 0;		dc33 <= 0;	end
	else if(residual_intra16_state == `intra16_updat &&
			(intra16_pred_num == 6'b111111 || intra16_pred_num == 6'd16 || intra16_pred_num == 6'd17))begin
		dc00 <= cavlc_coeffLevel_0;		dc01 <= cavlc_coeffLevel_1;		
		dc02 <= cavlc_coeffLevel_5;		dc03 <= cavlc_coeffLevel_6;		
		dc10 <= cavlc_coeffLevel_2;		dc11 <= cavlc_coeffLevel_4;		
		dc12 <= cavlc_coeffLevel_7;		dc13 <= cavlc_coeffLevel_12;	
		dc20 <= cavlc_coeffLevel_3;		dc21 <= cavlc_coeffLevel_8;		
		dc22 <= cavlc_coeffLevel_11;		dc23 <= cavlc_coeffLevel_13;	
		dc30 <= cavlc_coeffLevel_9;		dc31 <= cavlc_coeffLevel_10;		
		dc32 <= cavlc_coeffLevel_14;		dc33 <= cavlc_coeffLevel_15;	end
		

always@(pred_num or dc00 or dc01 or dc02 or dc03 or 
		dc10 or dc11 or dc12 or dc13 or 
		dc20 or dc21 or dc22 or dc23 or 
		dc30 or dc31 or dc32 or dc33 or reset_n)		
	if(reset_n == 1'd0)
		dc_res = 0;
	else 
		case(pred_num)
		0:	dc_res = dc00;
		1:	dc_res = dc01;
		2:	dc_res = dc10;
		3:	dc_res = dc11;
		4:	dc_res = dc02;
		5:	dc_res = dc03;
		6:	dc_res = dc12;
		7:	dc_res = dc13;
		8:	dc_res = dc20;
		9:	dc_res = dc21;
		10:	dc_res = dc30;
		11:	dc_res = dc31;
		12:	dc_res = dc22;
		13:	dc_res = dc23;
		14:	dc_res = dc32;
		15:	dc_res = dc33;
		default:dc_res = 0;
		endcase



always@(posedge clk or negedge reset_n)
	if(reset_n == 1'b0)begin
		res_tmp_h0 <= 0;	res_tmp_h1 <= 0;	res_tmp_h2 <= 0;	res_tmp_h3 <= 0;	
		res_tmp_h4 <= 0;	res_tmp_h5 <= 0;	res_tmp_h6 <= 0;	res_tmp_h7 <= 0;	
		res_tmp_h8 <= 0;	res_tmp_h9 <= 0;	res_tmp_h10 <= 0;	res_tmp_h11 <= 0;	
		res_tmp_h12 <= 0;	res_tmp_h13 <= 0;	res_tmp_h14 <= 0;	res_tmp_h15 <= 0;	end
	else if(residual_intra16_state == `intra16_updat &&  Intra16x16_predmode == `Intra16x16_Horizontal)begin
		case(intra16_pred_num)
		0,1,4,18,19,22,34,35,38:begin
			res_tmp_h0 <= dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4 + cavlc_coeffLevel_5;	
			res_tmp_h1 <= cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6 + cavlc_coeffLevel_11;	
			res_tmp_h2 <= cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10 + cavlc_coeffLevel_12;	
			res_tmp_h3 <= cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13 + cavlc_coeffLevel_14;	end	
		5,23,39:begin
			res_tmp_h0 <= 0;	res_tmp_h1 <= 0;	res_tmp_h2 <= 0;	res_tmp_h3 <= 0;	end
		2,3,6,20,21,24,36,37,40:begin
			res_tmp_h4 <= dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4 + cavlc_coeffLevel_5;		
			res_tmp_h5 <= cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6 + cavlc_coeffLevel_11;		
			res_tmp_h6 <= cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10 + cavlc_coeffLevel_12;
			res_tmp_h7 <= cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13 + cavlc_coeffLevel_14;	end	
		7,25,41:begin
			res_tmp_h4 <= 0;	res_tmp_h5 <= 0;	res_tmp_h6 <= 0;	res_tmp_h7 <= 0;	end
		8,9,12,26,27,30,42,43,46:begin
			res_tmp_h8 <= dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4 + cavlc_coeffLevel_5;		
			res_tmp_h9 <= cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6 + cavlc_coeffLevel_11;		
			res_tmp_h10<= cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10 + cavlc_coeffLevel_12;
			res_tmp_h11<= cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13 + cavlc_coeffLevel_14;	end	
		13,31,47:begin
			res_tmp_h8 <= 0;	res_tmp_h9 <= 0;	res_tmp_h10 <= 0;	res_tmp_h11 <= 0;	end
		10,11,14,28,29,32,44,45,48:begin
			res_tmp_h12<= dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4 + cavlc_coeffLevel_5;		
			res_tmp_h13<= cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6 + cavlc_coeffLevel_11;		
			res_tmp_h14<= cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10 + cavlc_coeffLevel_12;
			res_tmp_h15<= cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13 + cavlc_coeffLevel_14;	end	
		15,33,49:begin
			res_tmp_h12 <= 0;	res_tmp_h13 <= 0;	res_tmp_h14 <= 0;	res_tmp_h15 <= 0;	end
		default:begin
			res_tmp_h0 <= 0;	res_tmp_h1 <= 0;	res_tmp_h2 <= 0;	res_tmp_h3 <= 0;	
			res_tmp_h4 <= 0;	res_tmp_h5 <= 0;	res_tmp_h6 <= 0;	res_tmp_h7 <= 0;	
			res_tmp_h8 <= 0;	res_tmp_h9 <= 0;	res_tmp_h10 <= 0;	res_tmp_h11 <= 0;	
			res_tmp_h12 <= 0;	res_tmp_h13 <= 0;	res_tmp_h14 <= 0;	res_tmp_h15 <= 0;	end
		endcase
	end

always@(posedge clk or negedge reset_n)
	if(reset_n == 1'b0)begin
		res_tmp_v0 <= 0;	res_tmp_v1 <= 0;	res_tmp_v2 <= 0;	res_tmp_v3 <= 0;	
		res_tmp_v4 <= 0;	res_tmp_v5 <= 0;	res_tmp_v6 <= 0;	res_tmp_v7 <= 0;	
		res_tmp_v8 <= 0;	res_tmp_v9 <= 0;	res_tmp_v10 <= 0;	res_tmp_v11 <= 0;	
		res_tmp_v12 <= 0;	res_tmp_v13 <= 0;	res_tmp_v14 <= 0;	res_tmp_v15 <= 0;	end
	else if(residual_intra16_state == `intra16_updat && Intra16x16_predmode == `Intra16x16_Vertical)begin
		case(intra16_pred_num)
		0,2,8,18,20,26,34,36,42:begin
			res_tmp_v0 <= dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2 + cavlc_coeffLevel_8;		
			res_tmp_v1 <= cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7 + cavlc_coeffLevel_9;	
			res_tmp_v2 <= cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10 + cavlc_coeffLevel_13;	
			res_tmp_v3 <= cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12 + cavlc_coeffLevel_14;	end
		10,28,44:begin
			res_tmp_v0 <= 0;	res_tmp_v1 <= 0;	res_tmp_v2 <= 0;	res_tmp_v3 <= 0;	end
		1,3,9,19,21,27,35,37,43:begin
			res_tmp_v4 <= dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2 + cavlc_coeffLevel_8;		
			res_tmp_v5 <= cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7 + cavlc_coeffLevel_9;	
			res_tmp_v6 <= cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10 + cavlc_coeffLevel_13;	
			res_tmp_v7 <= cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12 + cavlc_coeffLevel_14;	end
		11,29,45:begin
			res_tmp_v4 <= 0;	res_tmp_v5 <= 0;	res_tmp_v6 <= 0;	res_tmp_v7 <= 0;	end
		4,6,12,22,24,30,38,40,46:begin
			res_tmp_v8 <= dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2 + cavlc_coeffLevel_8;		
			res_tmp_v9 <= cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7 + cavlc_coeffLevel_9;	
			res_tmp_v10<= cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10 + cavlc_coeffLevel_13;	
			res_tmp_v11<= cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12 + cavlc_coeffLevel_14;	end
		14,32,48:begin
			res_tmp_v8 <= 0;	res_tmp_v9 <= 0;	res_tmp_v10 <= 0;	res_tmp_v11 <= 0;	end
		5,7,13,23,25,31,39,41,47:begin
			res_tmp_v12<= dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2 + cavlc_coeffLevel_8;		
			res_tmp_v13<= cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7 + cavlc_coeffLevel_9;	
			res_tmp_v14<= cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10 + cavlc_coeffLevel_13;	
			res_tmp_v15<= cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12 + cavlc_coeffLevel_14;	end
		15,33,49:begin
			res_tmp_v12 <= 0;	res_tmp_v13 <= 0;	res_tmp_v14 <= 0;	res_tmp_v15 <= 0;	end
		default:begin
			res_tmp_v0 <= 0;	res_tmp_v1 <= 0;	res_tmp_v2 <= 0;	res_tmp_v3 <= 0;	
			res_tmp_v4 <= 0;	res_tmp_v5 <= 0;	res_tmp_v6 <= 0;	res_tmp_v7 <= 0;	
			res_tmp_v8 <= 0;	res_tmp_v9 <= 0;	res_tmp_v10 <= 0;	res_tmp_v11 <= 0;	
			res_tmp_v12 <= 0;	res_tmp_v13 <= 0;	res_tmp_v14 <= 0;	res_tmp_v15 <= 0;	end
		endcase
	end


always@(pred_num or res_tmp_h0 or res_tmp_h1 or res_tmp_h2 or res_tmp_h3 or 
		res_tmp_h4 or res_tmp_h5 or res_tmp_h6 or res_tmp_h7 or 
		res_tmp_h8 or res_tmp_h9 or res_tmp_h10 or res_tmp_h11 or 
		res_tmp_h12 or res_tmp_h13 or res_tmp_h14 or res_tmp_h15 or reset_n)
	if(reset_n == 1'd0)begin
		res_h0 = 0;	res_h1 = 0;	res_h2 = 0;	res_h3 = 0;end
	else 
		case(pred_num)
		0,1,4,5:begin
			res_h0 = res_tmp_h0;	res_h1 = res_tmp_h1;	
			res_h2 = res_tmp_h2;	res_h3 = res_tmp_h3;end
		2,3,6,7:begin	
			res_h0 = res_tmp_h4;	res_h1 = res_tmp_h5;	
			res_h2 = res_tmp_h6;	res_h3 = res_tmp_h7;end
		8,9,12,13:begin
			res_h0 = res_tmp_h8;	res_h1 = res_tmp_h9;	
			res_h2 = res_tmp_h10;	res_h3 = res_tmp_h11;end
		10,11,14,15:begin
			res_h0 = res_tmp_h12;	res_h1 = res_tmp_h13;	
			res_h2 = res_tmp_h14;	res_h3 = res_tmp_h15;end
		default:begin
			res_h0 = 0;	res_h1 = 0;	res_h2 = 0;	res_h3 = 0;end
		endcase

always@(pred_num or res_tmp_v0 or res_tmp_v1 or res_tmp_v2 or res_tmp_v3 or 
		res_tmp_v4 or res_tmp_v5 or res_tmp_v6 or res_tmp_v7 or 
		res_tmp_v8 or res_tmp_v9 or res_tmp_v10 or res_tmp_v11 or 
		res_tmp_v12 or res_tmp_v13 or res_tmp_v14 or res_tmp_v15 or reset_n)
	if(reset_n == 1'd0)begin
		res_v0 = 0;	res_v1 = 0;	res_v2 = 0;	res_v3 = 0;end
	else 
		case(pred_num)
		0,2,8,10:begin
			res_v0 = res_tmp_v0;	res_v1 = res_tmp_v1;	
			res_v2 = res_tmp_v2;	res_v3 = res_tmp_v3;end
		1,3,9,11:begin	
			res_v0 = res_tmp_v4;	res_v1 = res_tmp_v5;	
			res_v2 = res_tmp_v6;	res_v3 = res_tmp_v7;end
		4,6,12,14:begin
			res_v0 = res_tmp_v8;	res_v1 = res_tmp_v9;	
			res_v2 = res_tmp_v10;	res_v3 = res_tmp_v11;end
		5,7,13,15:begin
			res_v0 = res_tmp_v12;	res_v1 = res_tmp_v13;	
			res_v2 = res_tmp_v14;	res_v3 = res_tmp_v15;end
		default:begin
			res_v0 = 0;	res_v1 = 0;	res_v2 = 0;	res_v3 = 0;end
		endcase

always@(reset_n or residual_intra16_state or intra16_pred_num or Intra16x16_predmode or dc_res or 
		res_v0 or res_v1 or res_v2 or res_v3 or res_h0 or res_h1 or res_h2 or res_h3 or
		cavlc_coeffLevel_0 or cavlc_coeffLevel_1 or cavlc_coeffLevel_2 or cavlc_coeffLevel_3 or 
		cavlc_coeffLevel_4 or cavlc_coeffLevel_5 or cavlc_coeffLevel_6 or cavlc_coeffLevel_7 or
		cavlc_coeffLevel_8 or cavlc_coeffLevel_9 or cavlc_coeffLevel_10 or cavlc_coeffLevel_11 or
		cavlc_coeffLevel_12 or cavlc_coeffLevel_13 or cavlc_coeffLevel_14 or cavlc_coeffLevel_15 )
	if(reset_n == 1'd0)begin
		resi00 = 0;	resi01 = 0;	resi02 = 0;	resi03 = 0;	
		resi10 = 0;	resi11 = 0;	resi12 = 0;	resi13 = 0;	
		resi20 = 0;	resi21 = 0;	resi22 = 0;	resi23 = 0;	
		resi30 = 0;	resi31 = 0;	resi32 = 0;	resi33 = 0;	end
	else if(residual_intra16_state == `intra16_updat &&
			intra16_pred_num != 6'b111111 && intra16_pred_num != 6'd16 && intra16_pred_num != 6'd17)
		case(Intra16x16_predmode)
		`Intra16x16_Vertical:begin
			resi00 = dc_res + res_v0;		resi01 = cavlc_coeffLevel_0 + res_v1;	
			resi02 = cavlc_coeffLevel_4 + res_v2;	resi03 = cavlc_coeffLevel_5 + res_v3;	
			resi10 = dc_res + res_v0 + cavlc_coeffLevel_1;			
			resi11 = cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3;	
			resi12 = cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6;	
			resi13 = cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11;	
			resi20 = dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2;	
			resi21 = cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7;	
			resi22 = cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10;	
			resi23 = cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12;	
			resi30 = dc_res + res_v0 + cavlc_coeffLevel_1 + cavlc_coeffLevel_2 + cavlc_coeffLevel_8;	
			resi31 = cavlc_coeffLevel_0 + res_v1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_7 + cavlc_coeffLevel_9;	
			resi32 = cavlc_coeffLevel_4 + res_v2 + cavlc_coeffLevel_6 + cavlc_coeffLevel_10 + cavlc_coeffLevel_13;	
			resi33 = cavlc_coeffLevel_5 + res_v3 + cavlc_coeffLevel_11 + cavlc_coeffLevel_12 + cavlc_coeffLevel_14;	end
		`Intra16x16_Horizontal:begin
			resi00 = dc_res + res_h0;		resi01 = dc_res + res_h0 + cavlc_coeffLevel_0;			
			resi02 = dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4;			
			resi03 = dc_res + res_h0 + cavlc_coeffLevel_0 + cavlc_coeffLevel_4 + cavlc_coeffLevel_5;	
			resi10 = cavlc_coeffLevel_1 + res_h1;	resi11 = cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3;	
			resi12 = cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6;	
			resi13 = cavlc_coeffLevel_1 + res_h1 + cavlc_coeffLevel_3 + cavlc_coeffLevel_6 + cavlc_coeffLevel_11;	
			resi20 = cavlc_coeffLevel_2 + res_h2;	resi21 = cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7;	
			resi22 = cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10;	
			resi23 = cavlc_coeffLevel_2 + res_h2 + cavlc_coeffLevel_7 + cavlc_coeffLevel_10 + cavlc_coeffLevel_12;	
			resi30 = cavlc_coeffLevel_8 + res_h3;	resi31 = cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9;	
			resi32 = cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13;	
			resi33 = cavlc_coeffLevel_8 + res_h3 + cavlc_coeffLevel_9 + cavlc_coeffLevel_13 + cavlc_coeffLevel_14;	end
		default:begin
			resi00 = dc_res;		resi01 = cavlc_coeffLevel_0;	resi02 = cavlc_coeffLevel_4;	resi03 = cavlc_coeffLevel_5;	
			resi10 = cavlc_coeffLevel_1;	resi11 = cavlc_coeffLevel_3;	resi12 = cavlc_coeffLevel_6;	resi13 = cavlc_coeffLevel_11;	
			resi20 = cavlc_coeffLevel_2;	resi21 = cavlc_coeffLevel_7;	resi22 = cavlc_coeffLevel_10;	resi23 = cavlc_coeffLevel_12;	
			resi30 = cavlc_coeffLevel_8;	resi31 = cavlc_coeffLevel_9;	resi32 = cavlc_coeffLevel_13;	resi33 = cavlc_coeffLevel_14;	end
		endcase
		else begin
			resi00 = 0;	resi01 = 0;	resi02 = 0;	resi03 = 0;	
			resi10 = 0;	resi11 = 0;	resi12 = 0;	resi13 = 0;	
			resi20 = 0;	resi21 = 0;	resi22 = 0;	resi23 = 0;	
			resi30 = 0;	resi31 = 0;	resi32 = 0;	resi33 = 0;	end


reconstruct reconstruct00(.idct(resi00),.pred(intra_pred_16_00),.img(img_4x4_00));
reconstruct reconstruct01(.idct(resi01),.pred(intra_pred_16_01),.img(img_4x4_01));
reconstruct reconstruct02(.idct(resi02),.pred(intra_pred_16_02),.img(img_4x4_02));
reconstruct reconstruct03(.idct(resi03),.pred(intra_pred_16_03),.img(img_4x4_03));
reconstruct reconstruct10(.idct(resi10),.pred(intra_pred_16_10),.img(img_4x4_10));
reconstruct reconstruct11(.idct(resi11),.pred(intra_pred_16_11),.img(img_4x4_11));
reconstruct reconstruct12(.idct(resi12),.pred(intra_pred_16_12),.img(img_4x4_12));
reconstruct reconstruct13(.idct(resi13),.pred(intra_pred_16_13),.img(img_4x4_13));
reconstruct reconstruct20(.idct(resi20),.pred(intra_pred_16_20),.img(img_4x4_20));
reconstruct reconstruct21(.idct(resi21),.pred(intra_pred_16_21),.img(img_4x4_21));
reconstruct reconstruct22(.idct(resi22),.pred(intra_pred_16_22),.img(img_4x4_22));
reconstruct reconstruct23(.idct(resi23),.pred(intra_pred_16_23),.img(img_4x4_23));
reconstruct reconstruct30(.idct(resi30),.pred(intra_pred_16_30),.img(img_4x4_30));
reconstruct reconstruct31(.idct(resi31),.pred(intra_pred_16_31),.img(img_4x4_31));
reconstruct reconstruct32(.idct(resi32),.pred(intra_pred_16_32),.img(img_4x4_32));
reconstruct reconstruct33(.idct(resi33),.pred(intra_pred_16_33),.img(img_4x4_33));

/*reg [15:0] img_00_r,img_01_r,img_02_r,img_03_r;
reg [15:0] img_10_r,img_11_r,img_12_r,img_13_r;
reg [15:0] img_20_r,img_21_r,img_22_r,img_23_r;
reg [15:0] img_30_r,img_31_r,img_32_r,img_33_r;

always@(posedge clk or negedge reset_n)
	if(reset_n == 1'd0)begin
		img_00_r <= 0;	img_01_r <= 0;	img_02_r <= 0;	img_03_r <= 0;	
		img_10_r <= 0;	img_11_r <= 0;	img_12_r <= 0;	img_13_r <= 0;	
		img_20_r <= 0;	img_21_r <= 0;	img_22_r <= 0;	img_23_r <= 0;	
		img_30_r <= 0;	img_31_r <= 0;	img_32_r <= 0;	img_33_r <= 0;	end
	else if(residual_intra16_state == `intra16_updat)begin
		img_00_r <= img_00_reg;	img_01_r <= img_01_reg;	img_02_r <= img_02_reg;	img_03_r <= img_03_reg;	
		img_10_r <= img_10_reg;	img_11_r <= img_11_reg;	img_12_r <= img_12_reg;	img_13_r <= img_13_reg;	
		img_20_r <= img_20_reg;	img_21_r <= img_21_reg;	img_22_r <= img_22_reg;	img_23_r <= img_23_reg;	
		img_30_r <= img_30_reg;	img_31_r <= img_31_reg;	img_32_r <= img_32_reg;	img_33_r <= img_33_reg;	end

 

always@(residual_intra16_state or reset_n or img_00_reg or img_01_reg or img_02_reg or img_03_reg or
			img_10_reg or img_11_reg or img_12_reg or img_13_reg or
			img_20_reg or img_21_reg or img_22_reg or img_23_reg or
			img_30_reg or img_31_reg or img_32_reg or img_33_reg or
			img_00_r or img_01_r or img_02_r or img_03_r or
			img_10_r or img_11_r or img_12_r or img_13_r or
			img_20_r or img_21_r or img_22_r or img_23_r or
			img_30_r or img_31_r or img_32_r or img_33_r )
  	if (reset_n == 1'b0)begin
    		img_4x4_00 = 0;img_4x4_01 = 0;img_4x4_02 = 0;img_4x4_03 = 0;
    		img_4x4_10 = 0;img_4x4_11 = 0;img_4x4_12 = 0;img_4x4_13 = 0;
    		img_4x4_20 = 0;img_4x4_21 = 0;img_4x4_22 = 0;img_4x4_23 = 0;
    		img_4x4_30 = 0;img_4x4_31 = 0;img_4x4_32 = 0;img_4x4_33 = 0;end
	else if(residual_intra16_state == `intra16_updat)begin
    		img_4x4_00 = img_00_reg;img_4x4_01 = img_01_reg;img_4x4_02 = img_02_reg;img_4x4_03 = img_03_reg;
    		img_4x4_10 = img_10_reg;img_4x4_11 = img_11_reg;img_4x4_12 = img_12_reg;img_4x4_13 = img_13_reg;
    		img_4x4_20 = img_20_reg;img_4x4_21 = img_21_reg;img_4x4_22 = img_22_reg;img_4x4_23 = img_23_reg;
    		img_4x4_30 = img_30_reg;img_4x4_31 = img_31_reg;img_4x4_32 = img_32_reg;img_4x4_33 = img_33_reg;end
	else begin
			img_4x4_00 = img_00_r;img_4x4_01 = img_01_r;img_4x4_02 = img_02_r;img_4x4_03 = img_03_r;
    		img_4x4_10 = img_10_r;img_4x4_11 = img_11_r;img_4x4_12 = img_12_r;img_4x4_13 = img_13_r;
    		img_4x4_20 = img_20_r;img_4x4_21 = img_21_r;img_4x4_22 = img_22_r;img_4x4_23 = img_23_r;
    		img_4x4_30 = img_30_r;img_4x4_31 = img_31_r;img_4x4_32 = img_32_r;img_4x4_33 = img_33_r;end


*/
endmodule


module reconstruct(
input [15:0] idct,
input [15:0] pred,
 
output [15:0] img

);

wire [15:0] a ;
assign a = idct + pred;
assign img = (a[15])?16'd0:(a<16'd255)?a:16'd255;


endmodule
