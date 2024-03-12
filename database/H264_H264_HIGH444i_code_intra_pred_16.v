`include "timescale.v"
`include "define.v"

module intra_pred_16(
input clk,reset_n,
input [1:0] Intra16x16_predmode,
input [2:0] state16,
input [15:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3,
input [5:0] intra16_pred_num,
input [2:0] intra_pred_state,
input [7:0] mb_num_h,mb_num_v,
input [31:0] img_addra_y0,img_addra_y1,img_addra_y2,img_addra_y3,
input [31:0] img_addra_u0,img_addra_u1,img_addra_u2,img_addra_u3,
input [31:0] img_addra_v0,img_addra_v1,img_addra_v2,img_addra_v3,

output reg [15:0] intra_pred_16_00,intra_pred_16_01,intra_pred_16_02,intra_pred_16_03,
output reg [15:0] intra_pred_16_10,intra_pred_16_11,intra_pred_16_12,intra_pred_16_13,
output reg [15:0] intra_pred_16_20,intra_pred_16_21,intra_pred_16_22,intra_pred_16_23,
output reg [15:0] intra_pred_16_30,intra_pred_16_31,intra_pred_16_32,intra_pred_16_33

);


reg [15:0] v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,v_8,v_9,v_10,v_11,v_12,v_13,v_14,v_15;
reg [15:0] h_0,h_1,h_2,h_3,h_4,h_5,h_6,h_7,h_8,h_9,h_10,h_11,h_12,h_13,h_14,h_15,pl;
wire [15:0] dc_pred;
wire [15:0]H_x16,V_x16,H,V;
assign H_x16 = h_0+h_1+h_2+h_3+h_4+h_5+h_6+h_7+h_8+h_9+h_10+h_11+h_12+h_13+h_14+h_15+15'd8;
assign V_x16 = v_0+v_1+v_2+v_3+v_4+v_5+v_6+v_7+v_8+v_9+v_10+v_11+v_12+v_13+v_14+v_15+15'd8; 
assign H = {{4{H_x16[15]}},H_x16[15:4]};
assign V = {{4{V_x16[15]}},V_x16[15:4]};


assign dc_pred = mb_num_h == 0 && mb_num_v == 0 ? 16'd128:
		 mb_num_h == 0 && mb_num_v != 0 ? H :
		 mb_num_h != 0 && mb_num_v == 0 ? V : (V_x16+H_x16)>>5 ;
		 
reg [15:0] v_8sub6,v_9sub5,v_10sub4_mu3,v_11sub3_mu4,v_12sub2_mu5,v_13sub1_mu6,v_14sub0_mu7;

always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		v_0<=0;	v_1<=0;	v_2<=0;	v_3<=0;	v_4<=0;	v_5<=0;	v_6<=0;	v_7<=0;
		v_8<=0;	v_9<=0;	v_10<=0; v_11<=0; v_12<=0; v_13<=0; v_14<=0; v_15<=0;
		v_8sub6 <= 0; v_9sub5 <= 0; v_10sub4_mu3 <= 0; v_11sub3_mu4 <= 0;
		v_12sub2_mu5 <= 0; v_13sub1_mu6 <= 0; v_14sub0_mu7 <= 0; end
	else if(intra16_pred_num == 0)begin
		v_0  <= {8'd0,img_addra_y0[7:0]};	v_1  <= {8'd0,img_addra_y0[15:8]};	
		v_2  <= {8'd0,img_addra_y0[23:16]};	v_3  <= {8'd0,img_addra_y0[31:24]};	
		v_4  <= {8'd0,img_addra_y1[7:0]};	v_5  <= {8'd0,img_addra_y1[15:8]};	
		v_6  <= {8'd0,img_addra_y1[23:16]};	v_7  <= {8'd0,img_addra_y1[31:24]};	
		v_8  <= {8'd0,img_addra_y2[7:0]};	v_9  <= {8'd0,img_addra_y2[15:8]};	
		v_10 <= {8'd0,img_addra_y2[23:16]};	v_11 <= {8'd0,img_addra_y2[31:24]};	
		v_12 <= {8'd0,img_addra_y3[7:0]};	v_13 <= {8'd0,img_addra_y3[15:8]};	
		v_14 <= {8'd0,img_addra_y3[23:16]};	v_15 <= {8'd0,img_addra_y3[31:24]}; 
		v_8sub6  <= {8'd0,img_addra_y2[7:0]}  - {8'd0,img_addra_y1[23:16]}; 
		v_9sub5  <= {8'd0,img_addra_y2[15:8]} - {8'd0,img_addra_y1[15:8]}; 
		v_10sub4_mu3 <= (({8'd0,img_addra_y2[23:16]}- {8'd0,img_addra_y1[7:0]}) << 1) + 
									{8'd0,img_addra_y2[23:16]}- {8'd0,img_addra_y1[7:0]}; 
		v_11sub3_mu4 <= ({8'd0,img_addra_y2[31:24]}- {8'd0,img_addra_y0[31:24]}) << 2;
		v_12sub2_mu5 <= (({8'd0,img_addra_y3[7:0]}  - {8'd0,img_addra_y0[23:16]}) << 2) + 
									({8'd0,img_addra_y3[7:0]}  - {8'd0,img_addra_y0[23:16]}); 
		v_13sub1_mu6 <= (({8'd0,img_addra_y3[15:8]} - {8'd0,img_addra_y0[15:8]}) << 2) + 
							(({8'd0,img_addra_y3[15:8]} - {8'd0,img_addra_y0[15:8]}) << 1); 
		v_14sub0_mu7 <= (({8'd0,img_addra_y3[23:16]}- {8'd0,img_addra_y0[7:0]}) << 2) + 
							(({8'd0,img_addra_y3[23:16]}- {8'd0,img_addra_y0[7:0]}) << 1) + 
							({8'd0,img_addra_y3[23:16]}- {8'd0,img_addra_y0[7:0]}); end
	else if(intra16_pred_num == 16)begin
		v_0  <= {8'd0,img_addra_u0[7:0]};	v_1  <= {8'd0,img_addra_u0[15:8]};	
		v_2  <= {8'd0,img_addra_u0[23:16]};	v_3  <= {8'd0,img_addra_u0[31:24]};	
		v_4  <= {8'd0,img_addra_u1[7:0]};	v_5  <= {8'd0,img_addra_u1[15:8]};	
		v_6  <= {8'd0,img_addra_u1[23:16]};	v_7  <= {8'd0,img_addra_u1[31:24]};	
		v_8  <= {8'd0,img_addra_u2[7:0]};	v_9  <= {8'd0,img_addra_u2[15:8]};	
		v_10 <= {8'd0,img_addra_u2[23:16]};	v_11 <= {8'd0,img_addra_u2[31:24]};	
		v_12 <= {8'd0,img_addra_u3[7:0]};	v_13 <= {8'd0,img_addra_u3[15:8]};	
		v_14 <= {8'd0,img_addra_u3[23:16]};	v_15 <= {8'd0,img_addra_u3[31:24]}; 
		v_8sub6  <= {8'd0,img_addra_u2[7:0]}  - {8'd0,img_addra_u1[23:16]}; 
		v_9sub5  <= {8'd0,img_addra_u2[15:8]} - {8'd0,img_addra_u1[15:8]}; 
		v_10sub4_mu3 <= (({8'd0,img_addra_u2[23:16]}- {8'd0,img_addra_u1[7:0]}) << 1) + 
									{8'd0,img_addra_u2[23:16]}- {8'd0,img_addra_u1[7:0]}; 
		v_11sub3_mu4 <= ({8'd0,img_addra_u2[31:24]}- {8'd0,img_addra_u0[31:24]}) << 2;
		v_12sub2_mu5 <= (({8'd0,img_addra_u3[7:0]}  - {8'd0,img_addra_u0[23:16]}) << 2) + 
									({8'd0,img_addra_u3[7:0]}  - {8'd0,img_addra_u0[23:16]}); 
		v_13sub1_mu6 <= (({8'd0,img_addra_u3[15:8]} - {8'd0,img_addra_u0[15:8]}) << 2) + 
							(({8'd0,img_addra_u3[15:8]} - {8'd0,img_addra_u0[15:8]}) << 1) ; 
		v_14sub0_mu7 <= (({8'd0,img_addra_u3[23:16]}- {8'd0,img_addra_u0[7:0]}) << 2) + 
							(({8'd0,img_addra_u3[23:16]}- {8'd0,img_addra_u0[7:0]}) << 1) + 
							({8'd0,img_addra_u3[23:16]}- {8'd0,img_addra_u0[7:0]}); end
	else if(intra16_pred_num == 17)begin
		v_0  <= {8'd0,img_addra_v0[7:0]};	v_1  <= {8'd0,img_addra_v0[15:8]};	
		v_2  <= {8'd0,img_addra_v0[23:16]};	v_3  <= {8'd0,img_addra_v0[31:24]};	
		v_4  <= {8'd0,img_addra_v1[7:0]};	v_5  <= {8'd0,img_addra_v1[15:8]};	
		v_6  <= {8'd0,img_addra_v1[23:16]};	v_7  <= {8'd0,img_addra_v1[31:24]};	
		v_8  <= {8'd0,img_addra_v2[7:0]};	v_9  <= {8'd0,img_addra_v2[15:8]};	
		v_10 <= {8'd0,img_addra_v2[23:16]};	v_11 <= {8'd0,img_addra_v2[31:24]};	
		v_12 <= {8'd0,img_addra_v3[7:0]};	v_13 <= {8'd0,img_addra_v3[15:8]};	
		v_14 <= {8'd0,img_addra_v3[23:16]};	v_15 <= {8'd0,img_addra_v3[31:24]}; 
		v_8sub6  <= {8'd0,img_addra_v2[7:0]}  - {8'd0,img_addra_v1[23:16]}; 
		v_9sub5  <= {8'd0,img_addra_v2[15:8]} - {8'd0,img_addra_v1[15:8]}; 
		v_10sub4_mu3 <= (({8'd0,img_addra_v2[23:16]}- {8'd0,img_addra_v1[7:0]}) << 1) + 
									{8'd0,img_addra_v2[23:16]}- {8'd0,img_addra_v1[7:0]};  
		v_11sub3_mu4 <= ({8'd0,img_addra_v2[31:24]}- {8'd0,img_addra_v0[31:24]}) << 2;
		v_12sub2_mu5 <= (({8'd0,img_addra_v3[7:0]}  - {8'd0,img_addra_v0[23:16]}) << 2) + 
									({8'd0,img_addra_v3[7:0]}  - {8'd0,img_addra_v0[23:16]});  
		v_13sub1_mu6 <= (({8'd0,img_addra_v3[15:8]} - {8'd0,img_addra_v0[15:8]}) << 2) + 
							(({8'd0,img_addra_v3[15:8]} - {8'd0,img_addra_v0[15:8]}) << 1); 
		v_14sub0_mu7 <= (({8'd0,img_addra_v3[23:16]}- {8'd0,img_addra_v0[7:0]}) << 2) + 
							(({8'd0,img_addra_v3[23:16]}- {8'd0,img_addra_v0[7:0]}) << 1) + 
							({8'd0,img_addra_v3[23:16]}- {8'd0,img_addra_v0[7:0]});  end
		

reg [15:0] h_8sub6,h_9sub5,h_10sub4_mu3,h_11sub3_mu4,h_12sub2_mu5,h_13sub1_mu6,h_14sub0_mu7,h_15subpl;

always@(posedge clk or negedge reset_n)//
	if(reset_n == 0)begin
		h_0<=0;h_1<=0;h_2<=0;h_3<=0;h_4<=0;h_5<=0;h_6<=0;h_7<=0;
		h_8<=0;h_9<=0;h_10<=0;h_11<=0;h_12<=0;h_13<=0;h_14<=0;h_15<=0;pl<=0;
		h_8sub6 <= 0;	h_9sub5 <= 0;
		h_10sub4_mu3 <= 0;	h_11sub3_mu4 <= 0;
		h_12sub2_mu5 <= 0;   h_13sub1_mu6 <= 0;
		h_14sub0_mu7 <= 0;   h_15subpl <= 0;end
	else if(state16 != `intra16r_rst)
		case(state16)
		`intra16r_h0:begin
			h_0 <= nrblock16_0; h_1 <= nrblock16_1; h_2 <= nrblock16_2; h_3 <= nrblock16_3;end
		`intra16r_h1:begin
			h_4 <= nrblock16_0; h_5 <= nrblock16_1; h_6 <= nrblock16_2; h_7 <= nrblock16_3;end
		`intra16r_h2:begin
			h_8 <= nrblock16_0; h_9 <= nrblock16_1; h_10 <=nrblock16_2; h_11 <=nrblock16_3;
			h_8sub6 <= nrblock16_0 - h_6;	h_9sub5 <= nrblock16_1 - h_5;
			h_10sub4_mu3 <= ((nrblock16_2 - h_4) << 1) + (nrblock16_2 - h_4);	
			h_11sub3_mu4 <= (nrblock16_3 - h_3) << 2;
			end
		`intra16r_h3:begin
			h_12<= nrblock16_0; h_13<= nrblock16_1; h_14 <=nrblock16_2; h_15 <=nrblock16_3;
			h_12sub2_mu5 <= ((nrblock16_0 - h_2) << 2) + (nrblock16_0 - h_2);	
			h_13sub1_mu6 <= ((nrblock16_1 - h_1) << 2) + ((nrblock16_1 - h_1) << 1);
			h_14sub0_mu7 <= ((nrblock16_2 - h_0) << 2) + ((nrblock16_2 - h_0) << 1) + (nrblock16_2 - h_0);end
		`intra16r_pl:begin
			pl  <= nrblock16_0;
			h_15subpl <= h_15 - nrblock16_0;end
		default:;
		endcase

reg[15:0] v00,v01,v02,v03,v10,v11,v12,v13,v20,v21,v22,v23,v30,v31,v32,v33;
reg[15:0] h00,h01,h02,h03,h10,h11,h12,h13,h20,h21,h22,h23,h30,h31,h32,h33;
always@(intra16_pred_num or h_0 or h_1 or h_2 or h_3 or h_4 or h_5 or h_6 or h_7 
			or h_8 or h_9 or h_10 or h_11 or h_12 or h_13 or h_14 or h_15 or reset_n)
	if(reset_n == 0)begin
		v00=0;v01=0;v02=0;v03=0;v10=0;v11=0;v12=0;v13=0;
		v20=0;v21=0;v22=0;v23=0;v30=0;v31=0;v32=0;v33=0;end
	else
	case(intra16_pred_num)
	0,2,8,10,18,20,26,28,34,36,42,44:begin	
		v00=h_0;v01=h_1;v02=h_2;v03=h_3;v10=h_0;v11=h_1;v12=h_2;v13=h_3;
		v20=h_0;v21=h_1;v22=h_2;v23=h_3;v30=h_0;v31=h_1;v32=h_2;v33=h_3;end
	1,3,9,11,19,21,27,29,35,37,43,45:begin
		v00=h_4;v01=h_5;v02=h_6;v03=h_7;v10=h_4;v11=h_5;v12=h_6;v13=h_7;
		v20=h_4;v21=h_5;v22=h_6;v23=h_7;v30=h_4;v31=h_5;v32=h_6;v33=h_7;end
	4,6,12,14,22,24,30,32,38,40,46,48:begin
		v00=h_8;v01=h_9;v02=h_10;v03=h_11;v10=h_8;v11=h_9;v12=h_10;v13=h_11;
		v20=h_8;v21=h_9;v22=h_10;v23=h_11;v30=h_8;v31=h_9;v32=h_10;v33=h_11;end
	5,7,13,15,23,25,31,33,39,41,47,49:begin
		v00=h_12;v01=h_13;v02=h_14;v03=h_15;v10=h_12;v11=h_13;v12=h_14;v13=h_15;
		v20=h_12;v21=h_13;v22=h_14;v23=h_15;v30=h_12;v31=h_13;v32=h_14;v33=h_15;end
	default:begin
		v00=0;v01=0;v02=0;v03=0;v10=0;v11=0;v12=0;v13=0;
		v20=0;v21=0;v22=0;v23=0;v30=0;v31=0;v32=0;v33=0;end
	endcase

always@(intra16_pred_num or v_0 or v_1 or v_2 or v_3 or v_4 or v_5 or v_6 or v_7 
		or v_8 or v_9 or v_10 or v_11 or v_12 or v_13 or v_14 or v_15 or reset_n)
	if(reset_n == 0)begin
		h00=0;h01=0;h02=0;h03=0;h10=0;h11=0;h12=0;h13=0;
		h20=0;h21=0;h22=0;h23=0;h30=0;h31=0;h32=0;h33=0;end
	else
		case(intra16_pred_num)
		0,1,4,5,18,19,22,23,34,35,38,39:begin	
			h00=v_0;h01=v_0;h02=v_0;h03=v_0;h10=v_1;h11=v_1;h12=v_1;h13=v_1;
			h20=v_2;h21=v_2;h22=v_2;h23=v_2;h30=v_3;h31=v_3;h32=v_3;h33=v_3;end
		2,3,6,7,20,21,24,25,36,37,40,41:begin
			h00=v_4;h01=v_4;h02=v_4;h03=v_4;h10=v_5;h11=v_5;h12=v_5;h13=v_5;
			h20=v_6;h21=v_6;h22=v_6;h23=v_6;h30=v_7;h31=v_7;h32=v_7;h33=v_7;end
		8,9,12,13,26,27,30,31,42,43,46,47:begin
			h00=v_8;h01=v_8;h02=v_8;h03=v_8;h10=v_9;h11=v_9;h12=v_9;h13=v_9;
			h20=v_10;h21=v_10;h22=v_10;h23=v_10;h30=v_11;h31=v_11;h32=v_11;h33=v_11;end
		10,11,14,15,28,29,32,33,44,45,48,49:begin
			h00=v_12;h01=v_12;h02=v_12;h03=v_12;h10=v_13;h11=v_13;h12=v_13;h13=v_13;
			h20=v_14;h21=v_14;h22=v_14;h23=v_14;h30=v_15;h31=v_15;h32=v_15;h33=v_15;end
		default:begin
			h00=0;h01=0;h02=0;h03=0;h10=0;h11=0;h12=0;h13=0;
			h20=0;h21=0;h22=0;h23=0;h30=0;h31=0;h32=0;h33=0;end
		endcase
wire [15:0] a,b,c,plane_H,plane_V;
wire [20:0] b_64,c_64;
reg[15:0] p00,p01,p02,p03,p10,p11,p12,p13,p20,p21,p22,p23,p30,p31,p32,p33;
wire [15:0] v_15subpl;


assign v_15subpl = v_15-pl;


assign a = (v_15+h_15)<<4;
wire [15:0] h_xsuby_add456;
assign h_xsuby_add456 = h_11sub3_mu4 + h_12sub2_mu5 + h_13sub1_mu6;

wire [15:0] v_xsuby_add456;
assign v_xsuby_add456 = v_11sub3_mu4 + v_12sub2_mu5 + v_13sub1_mu6;

assign plane_H = h_8sub6 + (h_9sub5 << 1) + h_10sub4_mu3 + 
		h_xsuby_add456 + h_14sub0_mu7 + (h_15subpl << 3);
	
assign plane_V = v_8sub6 + (v_9sub5 << 1) + v_10sub4_mu3 + 
		v_xsuby_add456 + v_14sub0_mu7 + (v_15subpl << 3);
		
		

assign b_64 = {{3{plane_H[15]}},plane_H,2'b0}+{{5{plane_H[15]}},plane_H}+21'd32;
assign c_64 = {{3{plane_V[15]}},plane_V,2'b0}+{{5{plane_V[15]}},plane_V}+21'd32;
assign b = {b_64[20],b_64[20:6]};
assign c = {c_64[20],c_64[20:6]};

reg [15:0] a_r,b_r,c_r;
always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		a_r <= 0;	b_r <= 0; c_r <= 0;end
	else if(intra_pred_state == `intra_pred_pred)begin
		a_r <= a;	b_r <= b; c_r <= c;end


wire [15:0] plane_16_00,plane_16_01,plane_16_02,plane_16_03;
wire [15:0] plane_16_10,plane_16_11,plane_16_12,plane_16_13;
wire [15:0] plane_16_20,plane_16_21,plane_16_22,plane_16_23;
wire [15:0] plane_16_30,plane_16_31,plane_16_32,plane_16_33;

assign plane_16_00 =  p00[15]?16'd0:({{5{p00[15]}},p00[15:5]}>255?16'd255:{{5{p00[15]}},p00[15:5]});
assign plane_16_01 =  p01[15]?16'd0:({{5{p01[15]}},p01[15:5]}>255?16'd255:{{5{p01[15]}},p01[15:5]});
assign plane_16_02 =  p02[15]?16'd0:({{5{p02[15]}},p02[15:5]}>255?16'd255:{{5{p02[15]}},p02[15:5]});
assign plane_16_03 =  p03[15]?16'd0:({{5{p03[15]}},p03[15:5]}>255?16'd255:{{5{p03[15]}},p03[15:5]});
assign plane_16_10 =  p10[15]?16'd0:({{5{p10[15]}},p10[15:5]}>255?16'd255:{{5{p10[15]}},p10[15:5]});
assign plane_16_11 =  p11[15]?16'd0:({{5{p11[15]}},p11[15:5]}>255?16'd255:{{5{p11[15]}},p11[15:5]});
assign plane_16_12 =  p12[15]?16'd0:({{5{p12[15]}},p12[15:5]}>255?16'd255:{{5{p12[15]}},p12[15:5]});
assign plane_16_13 =  p13[15]?16'd0:({{5{p13[15]}},p13[15:5]}>255?16'd255:{{5{p13[15]}},p13[15:5]});
assign plane_16_20 =  p20[15]?16'd0:({{5{p20[15]}},p20[15:5]}>255?16'd255:{{5{p20[15]}},p20[15:5]});
assign plane_16_21 =  p21[15]?16'd0:({{5{p21[15]}},p21[15:5]}>255?16'd255:{{5{p21[15]}},p21[15:5]});
assign plane_16_22 =  p22[15]?16'd0:({{5{p22[15]}},p22[15:5]}>255?16'd255:{{5{p22[15]}},p22[15:5]});
assign plane_16_23 =  p23[15]?16'd0:({{5{p23[15]}},p23[15:5]}>255?16'd255:{{5{p23[15]}},p23[15:5]});
assign plane_16_30 =  p30[15]?16'd0:({{5{p30[15]}},p30[15:5]}>255?16'd255:{{5{p30[15]}},p30[15:5]});
assign plane_16_31 =  p31[15]?16'd0:({{5{p31[15]}},p31[15:5]}>255?16'd255:{{5{p31[15]}},p31[15:5]});
assign plane_16_32 =  p32[15]?16'd0:({{5{p32[15]}},p32[15:5]}>255?16'd255:{{5{p32[15]}},p32[15:5]});
assign plane_16_33 =  p33[15]?16'd0:({{5{p33[15]}},p33[15:5]}>255?16'd255:{{5{p33[15]}},p33[15:5]});


wire [15:0] b_x2,b_x3,b_x4,b_x5,b_x6,b_x7,b_x8;
wire [15:0] c_x2,c_x3,c_x4,c_x5,c_x6,c_x7,c_x8;

mult mult_b(
	.in(b_r),.in_x2(b_x2),.in_x3(b_x3),
	.in_x4(b_x4),.in_x5(b_x5),.in_x6(b_x6),.in_x7(b_x7),.in_x8(b_x8)
);
mult mult_c(
	.in(c_r),.in_x2(c_x2),.in_x3(c_x3),
	.in_x4(c_x4),.in_x5(c_x5),.in_x6(c_x6),.in_x7(c_x7),.in_x8(c_x8)
);


always@(posedge clk or negedge reset_n)
	if(reset_n == 0)begin
		p00 <= 0; p01 <= 0; p02 <= 0; p03 <= 0;
		p10 <= 0; p11 <= 0; p12 <= 0; p13 <= 0;
		p20 <= 0; p21 <= 0; p22 <= 0; p23 <= 0;
		p30 <= 0; p31 <= 0; p32 <= 0; p33 <= 0;end
	else if(intra_pred_state == `intra_pred_pred_pl)
		case(intra16_pred_num)
		0,18,34:begin 
			p00 <= a_r-b_x7-c_x7+16'd16;p01 <= a_r-b_x6-c_x7+16'd16;p02 <= a_r-b_x5-c_x7+16'd16;p03 <= a_r-b_x4-c_x7+16'd16;
			p10 <= a_r-b_x7-c_x6+16'd16;p11 <= a_r-b_x6-c_x6+16'd16;p12 <= a_r-b_x5-c_x6+16'd16;p13 <= a_r-b_x4-c_x6+16'd16;
			p20 <= a_r-b_x7-c_x5+16'd16;p21 <= a_r-b_x6-c_x5+16'd16;p22 <= a_r-b_x5-c_x5+16'd16;p23 <= a_r-b_x4-c_x5+16'd16;
			p30 <= a_r-b_x7-c_x4+16'd16;p31 <= a_r-b_x6-c_x4+16'd16;p32 <= a_r-b_x5-c_x4+16'd16;p33 <= a_r-b_x4-c_x4+16'd16;end
		1,19,35:begin 
			p00 <= a_r-b_x3-c_x7+16'd16;p01 <= a_r-b_x2-c_x7+16'd16;p02 <= a_r-b_r-c_x7+16'd16;p03 <= a_r-c_x7+16'd16;
			p10 <= a_r-b_x3-c_x6+16'd16;p11 <= a_r-b_x2-c_x6+16'd16;p12 <= a_r-b_r-c_x6+16'd16;p13 <= a_r-c_x6+16'd16;
			p20 <= a_r-b_x3-c_x5+16'd16;p21 <= a_r-b_x2-c_x5+16'd16;p22 <= a_r-b_r-c_x5+16'd16;p23 <= a_r-c_x5+16'd16;
			p30 <= a_r-b_x3-c_x4+16'd16;p31 <= a_r-b_x2-c_x4+16'd16;p32 <= a_r-b_r-c_x4+16'd16;p33 <= a_r-c_x4+16'd16;end
		2,20,36:begin 
			p00 <= a_r-b_x7-c_x3+16'd16;p01 <= a_r-b_x6-c_x3+16'd16;p02 <= a_r-b_x5-c_x3+16'd16;p03 <= a_r-b_x4-c_x3+16'd16;
			p10 <= a_r-b_x7-c_x2+16'd16;p11 <= a_r-b_x6-c_x2+16'd16;p12 <= a_r-b_x5-c_x2+16'd16;p13 <= a_r-b_x4-c_x2+16'd16;
			p20 <= a_r-b_x7-c_r +16'd16;p21 <= a_r-b_x6-c_r +16'd16;p22 <= a_r-b_x5-c_r +16'd16;p23 <= a_r-b_x4-c_r+16'd16;
			p30 <= a_r-b_x7+16'd16;     p31 <= a_r-b_x6+16'd16;     p32 <= a_r-b_x5+16'd16;     p33 <= a_r-b_x4+16'd16;end
		3,21,37:begin 
			p00 <= a_r-b_x3-c_x3+16'd16;p01 <= a_r-b_x2-c_x3+16'd16;p02 <= a_r-b_r-c_x3+16'd16;p03 <= a_r-c_x3+16'd16;
			p10 <= a_r-b_x3-c_x2+16'd16;p11 <= a_r-b_x2-c_x2+16'd16;p12 <= a_r-b_r-c_x2+16'd16;p13 <= a_r-c_x2+16'd16;
			p20 <= a_r-b_x3-c_r +16'd16;p21 <= a_r-b_x2-c_r +16'd16;p22 <= a_r-b_r-c_r +16'd16;p23 <= a_r-c_r+16'd16;
			p30 <= a_r-b_x3+16'd16;     p31 <= a_r-b_x2+16'd16;     p32 <= a_r-b_r+16'd16;     p33 <= a_r+16'd16;end
		4,22,38:begin 
			p00 <= a_r+b_r-c_x7+16'd16;p01 <= a_r+b_x2-c_x7+16'd16;p02 <= a_r+b_x3-c_x7+16'd16;p03 <= a_r+b_x4-c_x7+16'd16;
			p10 <= a_r+b_r-c_x6+16'd16;p11 <= a_r+b_x2-c_x6+16'd16;p12 <= a_r+b_x3-c_x6+16'd16;p13 <= a_r+b_x4-c_x6+16'd16;
			p20 <= a_r+b_r-c_x5+16'd16;p21 <= a_r+b_x2-c_x5+16'd16;p22 <= a_r+b_x3-c_x5+16'd16;p23 <= a_r+b_x4-c_x5+16'd16;
			p30 <= a_r+b_r-c_x4+16'd16;p31 <= a_r+b_x2-c_x4+16'd16;p32 <= a_r+b_x3-c_x4+16'd16;p33 <= a_r+b_x4-c_x4+16'd16;end
		5,23,39:begin 
			p00 <= a_r+b_x5-c_x7+16'd16;p01 <= a_r+b_x6-c_x7+16'd16;p02 <= a_r+b_x7-c_x7+16'd16;p03 <= a_r+b_x8-c_x7+16'd16;
			p10 <= a_r+b_x5-c_x6+16'd16;p11 <= a_r+b_x6-c_x6+16'd16;p12 <= a_r+b_x7-c_x6+16'd16;p13 <= a_r+b_x8-c_x6+16'd16;
			p20 <= a_r+b_x5-c_x5+16'd16;p21 <= a_r+b_x6-c_x5+16'd16;p22 <= a_r+b_x7-c_x5+16'd16;p23 <= a_r+b_x8-c_x5+16'd16;
			p30 <= a_r+b_x5-c_x4+16'd16;p31 <= a_r+b_x6-c_x4+16'd16;p32 <= a_r+b_x7-c_x4+16'd16;p33 <= a_r+b_x8-c_x4+16'd16;end
		6,24,40:begin 
			p00 <= a_r+b_r-c_x3+16'd16;p01 <= a_r+b_x2-c_x3+16'd16;p02 <= a_r+b_x3-c_x3+16'd16;p03 <= a_r+b_x4-c_x3+16'd16;
			p10 <= a_r+b_r-c_x2+16'd16;p11 <= a_r+b_x2-c_x2+16'd16;p12 <= a_r+b_x3-c_x2+16'd16;p13 <= a_r+b_x4-c_x2+16'd16;
			p20 <= a_r+b_r-c_r +16'd16;p21 <= a_r+b_x2-c_r +16'd16;p22 <= a_r+b_x3-c_r +16'd16;p23 <= a_r+b_x4-c_r +16'd16;
			p30 <= a_r+b_r+16'd16;p31 <= a_r+b_x2+16'd16;p32 <= a_r+b_x3+16'd16;p33 <= a_r+b_x4+16'd16;end
		7,25,41:begin 
			p00 <= a_r+b_x5-c_x3+16'd16;p01 <= a_r+b_x6-c_x3+16'd16;p02 <= a_r+b_x7-c_x3+16'd16;p03 <= a_r+b_x8-c_x3+16'd16;
			p10 <= a_r+b_x5-c_x2+16'd16;p11 <= a_r+b_x6-c_x2+16'd16;p12 <= a_r+b_x7-c_x2+16'd16;p13 <= a_r+b_x8-c_x2+16'd16;
			p20 <= a_r+b_x5-c_r +16'd16;p21 <= a_r+b_x6-c_r +16'd16;p22 <= a_r+b_x7-c_r +16'd16;p23 <= a_r+b_x8-c_r +16'd16;
			p30 <= a_r+b_x5+16'd16;p31 <= a_r+b_x6+16'd16;p32 <= a_r+b_x7+16'd16;p33 <= a_r+b_x8+16'd16;end
		8,26,42:begin 
			p00 <= a_r-b_x7+c_r +16'd16;p01 <= a_r-b_x6+c_r +16'd16;p02 <= (a_r-b_x5+c_r +16'd16);p03 <= (a_r-b_x4+c_r +16'd16);
			p10 <= a_r-b_x7+c_x2+16'd16;p11 <= a_r-b_x6+c_x2+16'd16;p12 <= (a_r-b_x5+c_x2+16'd16);p13 <= (a_r-b_x4+c_x2+16'd16);
			p20 <= a_r-b_x7+c_x3+16'd16;p21 <= a_r-b_x6+c_x3+16'd16;p22 <= (a_r-b_x5+c_x3+16'd16);p23 <= (a_r-b_x4+c_x3+16'd16);
			p30 <= a_r-b_x7+c_x4+16'd16;p31 <= a_r-b_x6+c_x4+16'd16;p32 <= (a_r-b_x5+c_x4+16'd16);p33 <= (a_r-b_x4+c_x4+16'd16);end
		9,27,43:begin 
			p00 <= (a_r-b_x3+c_r +16'd16);p01 <= (a_r-b_x2+c_r +16'd16);p02 <= (a_r-b_r+c_r +16'd16);p03 <= (a_r+c_r +16'd16);
			p10 <= (a_r-b_x3+c_x2+16'd16);p11 <= (a_r-b_x2+c_x2+16'd16);p12 <= (a_r-b_r+c_x2+16'd16);p13 <= (a_r+c_x2+16'd16);
			p20 <= (a_r-b_x3+c_x3+16'd16);p21 <= (a_r-b_x2+c_x3+16'd16);p22 <= (a_r-b_r+c_x3+16'd16);p23 <= (a_r+c_x3+16'd16);
			p30 <= (a_r-b_x3+c_x4+16'd16);p31 <= (a_r-b_x2+c_x4+16'd16);p32 <= (a_r-b_r+c_x4+16'd16);p33 <= (a_r+c_x4+16'd16);end
		10,28,44:begin 
			p00 <= (a_r-b_x7+c_x5+16'd16);p01 <= (a_r-b_x6+c_x5+16'd16);p02 <= (a_r-b_x5+c_x5+16'd16);p03 <= (a_r-b_x4+c_x5+16'd16);
			p10 <= (a_r-b_x7+c_x6+16'd16);p11 <= (a_r-b_x6+c_x6+16'd16);p12 <= (a_r-b_x5+c_x6+16'd16);p13 <= (a_r-b_x4+c_x6+16'd16);
			p20 <= (a_r-b_x7+c_x7+16'd16);p21 <= (a_r-b_x6+c_x7+16'd16);p22 <= (a_r-b_x5+c_x7+16'd16);p23 <= (a_r-b_x4+c_x7+16'd16);
			p30 <= (a_r-b_x7+c_x8+16'd16);p31 <= (a_r-b_x6+c_x8+16'd16);p32 <= (a_r-b_x5+c_x8+16'd16);p33 <= (a_r-b_x4+c_x8+16'd16);end
		11,29,45:begin 
			p00 <= (a_r-b_x3+c_x5+16'd16);p01 <= (a_r-b_x2+c_x5+16'd16);p02 <= (a_r-b_r+c_x5+16'd16);p03 <= (a_r+c_x5+16'd16);
			p10 <= (a_r-b_x3+c_x6+16'd16);p11 <= (a_r-b_x2+c_x6+16'd16);p12 <= (a_r-b_r+c_x6+16'd16);p13 <= (a_r+c_x6+16'd16);
			p20 <= (a_r-b_x3+c_x7+16'd16);p21 <= (a_r-b_x2+c_x7+16'd16);p22 <= (a_r-b_r+c_x7+16'd16);p23 <= (a_r+c_x7+16'd16);
			p30 <= (a_r-b_x3+c_x8+16'd16);p31 <= (a_r-b_x2+c_x8+16'd16);p32 <= (a_r-b_r+c_x8+16'd16);p33 <= (a_r+c_x8+16'd16);end
		12,30,46:begin 
			p00 <= (a_r+b_r+c_r +16'd16);p01 <= (a_r+b_x2+c_r +16'd16);p02 <= (a_r+b_x3+c_r +16'd16);p03 <= (a_r+b_x4+c_r +16'd16);
			p10 <= (a_r+b_r+c_x2+16'd16);p11 <= (a_r+b_x2+c_x2+16'd16);p12 <= (a_r+b_x3+c_x2+16'd16);p13 <= (a_r+b_x4+c_x2+16'd16);
			p20 <= (a_r+b_r+c_x3+16'd16);p21 <= (a_r+b_x2+c_x3+16'd16);p22 <= (a_r+b_x3+c_x3+16'd16);p23 <= (a_r+b_x4+c_x3+16'd16);
			p30 <= (a_r+b_r+c_x4+16'd16);p31 <= (a_r+b_x2+c_x4+16'd16);p32 <= (a_r+b_x3+c_x4+16'd16);p33 <= (a_r+b_x4+c_x4+16'd16);end
		13,31,47:begin 
			p00 <= (a_r+b_x5+c_r +16'd16);p01 <= (a_r+b_x6+c_r +16'd16);p02 <= (a_r+b_x7+c_r +16'd16);p03 <= (a_r+b_x8+c_r +16'd16);
			p10 <= (a_r+b_x5+c_x2+16'd16);p11 <= (a_r+b_x6+c_x2+16'd16);p12 <= (a_r+b_x7+c_x2+16'd16);p13 <= (a_r+b_x8+c_x2+16'd16);
			p20 <= (a_r+b_x5+c_x3+16'd16);p21 <= (a_r+b_x6+c_x3+16'd16);p22 <= (a_r+b_x7+c_x3+16'd16);p23 <= (a_r+b_x8+c_x3+16'd16);
			p30 <= (a_r+b_x5+c_x4+16'd16);p31 <= (a_r+b_x6+c_x4+16'd16);p32 <= (a_r+b_x7+c_x4+16'd16);p33 <= (a_r+b_x8+c_x4+16'd16);end
		14,32,48:begin 
			p00 <= (a_r+b_r+c_x5+16'd16);p01 <= (a_r+b_x2+c_x5+16'd16);p02 <= (a_r+b_x3+c_x5+16'd16);p03 <= (a_r+b_x4+c_x5+16'd16);
			p10 <= (a_r+b_r+c_x6+16'd16);p11 <= (a_r+b_x2+c_x6+16'd16);p12 <= (a_r+b_x3+c_x6+16'd16);p13 <= (a_r+b_x4+c_x6+16'd16);
			p20 <= (a_r+b_r+c_x7+16'd16);p21 <= (a_r+b_x2+c_x7+16'd16);p22 <= (a_r+b_x3+c_x7+16'd16);p23 <= (a_r+b_x4+c_x7+16'd16);
			p30 <= (a_r+b_r+c_x8+16'd16);p31 <= (a_r+b_x2+c_x8+16'd16);p32 <= (a_r+b_x3+c_x8+16'd16);p33 <= (a_r+b_x4+c_x8+16'd16);end
		15,33,49:begin 
			p00 <= (a_r+b_x5+c_x5+16'd16);p01 <= (a_r+b_x6+c_x5+16'd16);p02 <= (a_r+b_x7+c_x5+16'd16);p03 <= (a_r+b_x8+c_x5+16'd16);
			p10 <= (a_r+b_x5+c_x6+16'd16);p11 <= (a_r+b_x6+c_x6+16'd16);p12 <= (a_r+b_x7+c_x6+16'd16);p13 <= (a_r+b_x8+c_x6+16'd16);
			p20 <= (a_r+b_x5+c_x7+16'd16);p21 <= (a_r+b_x6+c_x7+16'd16);p22 <= (a_r+b_x7+c_x7+16'd16);p23 <= (a_r+b_x8+c_x7+16'd16);
			p30 <= (a_r+b_x5+c_x8+16'd16);p31 <= (a_r+b_x6+c_x8+16'd16);p32 <= (a_r+b_x7+c_x8+16'd16);p33 <= (a_r+b_x8+c_x8+16'd16);end
	default:begin
			p00 <= 0;p01 <= 0;p02 <= 0;p03 <= 0;p10 <= 0;p11 <= 0;p12 <= 0;p13 <= 0;
			p20 <= 0;p21 <= 0;p22 <= 0;p23 <= 0;p30 <= 0;p31 <= 0;p32 <= 0;p33 <= 0;end
	endcase


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		intra_pred_16_00 <= 16'b0;intra_pred_16_01 <= 16'b0;
		intra_pred_16_02 <= 16'b0;intra_pred_16_03 <= 16'b0;
		intra_pred_16_10 <= 16'b0;intra_pred_16_11 <= 16'b0;
		intra_pred_16_12 <= 16'b0;intra_pred_16_13 <= 16'b0;
		intra_pred_16_20 <= 16'b0;intra_pred_16_21 <= 16'b0;
		intra_pred_16_22 <= 16'b0;intra_pred_16_23 <= 16'b0;
		intra_pred_16_30 <= 16'b0;intra_pred_16_31 <= 16'b0;
		intra_pred_16_32 <= 16'b0;intra_pred_16_33 <= 16'b0;
		end
	else if(intra_pred_state == `intra_pred_end)
	   case(Intra16x16_predmode)
		`Intra16x16_Vertical:begin 
		intra_pred_16_00 <= v00;intra_pred_16_01 <= v01;intra_pred_16_02 <= v02;intra_pred_16_03 <= v03;
		intra_pred_16_10 <= v10;intra_pred_16_11 <= v11;intra_pred_16_12 <= v12;intra_pred_16_13 <= v13;
		intra_pred_16_20 <= v20;intra_pred_16_21 <= v21;intra_pred_16_22 <= v22;intra_pred_16_23 <= v23;
		intra_pred_16_30 <= v30;intra_pred_16_31 <= v31;intra_pred_16_32 <= v32;intra_pred_16_33 <= v33;
		end
		`Intra16x16_Horizontal:begin
		intra_pred_16_00 <= h00;intra_pred_16_01 <= h01;intra_pred_16_02 <= h02;intra_pred_16_03 <= h03;
		intra_pred_16_10 <= h10;intra_pred_16_11 <= h11;intra_pred_16_12 <= h12;intra_pred_16_13 <= h13;
		intra_pred_16_20 <= h20;intra_pred_16_21 <= h21;intra_pred_16_22 <= h22;intra_pred_16_23 <= h23;
		intra_pred_16_30 <= h30;intra_pred_16_31 <= h31;intra_pred_16_32 <= h32;intra_pred_16_33 <= h33;
		end
		`Intra16x16_DC:begin
		intra_pred_16_00 <= dc_pred;intra_pred_16_01 <= dc_pred;intra_pred_16_02 <= dc_pred;intra_pred_16_03 <= dc_pred;
		intra_pred_16_10 <= dc_pred;intra_pred_16_11 <= dc_pred;intra_pred_16_12 <= dc_pred;intra_pred_16_13 <= dc_pred;
		intra_pred_16_20 <= dc_pred;intra_pred_16_21 <= dc_pred;intra_pred_16_22 <= dc_pred;intra_pred_16_23 <= dc_pred;
		intra_pred_16_30 <= dc_pred;intra_pred_16_31 <= dc_pred;intra_pred_16_32 <= dc_pred;intra_pred_16_33 <= dc_pred;	
		end
		`Intra16x16_Plane:begin
		intra_pred_16_00 <= plane_16_00;intra_pred_16_01 <= plane_16_01;
		intra_pred_16_02 <= plane_16_02;intra_pred_16_03 <= plane_16_03;
		intra_pred_16_10 <= plane_16_10;intra_pred_16_11 <= plane_16_11;
		intra_pred_16_12 <= plane_16_12;intra_pred_16_13 <= plane_16_13;
		intra_pred_16_20 <= plane_16_20;intra_pred_16_21 <= plane_16_21;
		intra_pred_16_22 <= plane_16_22;intra_pred_16_23 <= plane_16_23;
		intra_pred_16_30 <= plane_16_30;intra_pred_16_31 <= plane_16_31;
		intra_pred_16_32 <= plane_16_32;intra_pred_16_33 <= plane_16_33;end
		endcase




endmodule


module mult(
input [15:0] in,

output [15:0] in_x2,in_x3,in_x4,in_x5,in_x6,in_x7,in_x8

);

assign in_x2 = in << 1 ;
assign in_x3 = (in << 1) + in ;
assign in_x4 = in << 2 ;
assign in_x5 = (in << 2) + in ;
assign in_x6 = (in << 2) + (in << 1) ;
assign in_x7 = (in << 2) + (in << 1) + in;
assign in_x8 = in << 3 ;


endmodule























