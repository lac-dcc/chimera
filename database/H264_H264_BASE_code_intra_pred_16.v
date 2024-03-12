`include "timescale.v"
`include "define.v"

module intra_pred_16(
input clk,reset_n,
input [1:0] Intra16x16_predmode,
input [3:0] state16,
input [15:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3,
input [4:0] intra16_pred_num,
input [2:0] residual_intra16_state,
input [7:0] mb_num_h,mb_num_v,
input constrained_intra_pred_flag,
input [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,
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


assign dc_pred = mb_num_h == 0&&mb_num_v == 0?16'd128:
		 mb_num_h == 0&&mb_num_v != 0?(constrained_intra_pred_flag&&MBTypeGen_mbAddrB[1]==0?16'd128:H):
		 mb_num_h != 0&&mb_num_v == 0?(constrained_intra_pred_flag&&MBTypeGen_mbAddrA[1]==0?16'd128:V):
		 (constrained_intra_pred_flag==0 ? (V_x16+H_x16)>>5 :
			MBTypeGen_mbAddrB[1]==0 & &MBTypeGen_mbAddrA[1]==0 ? 16'd128 :
			MBTypeGen_mbAddrB[1]==0 ? V : MBTypeGen_mbAddrA[1]==0 ? H : (V_x16+H_x16)>>5);



always@(posedge clk or negedge reset_n)//
	if(reset_n == 0)begin
		v_0<=0;v_1<=0;v_2<=0;v_3<=0;v_4<=0;v_5<=0;v_6<=0;v_7<=0;
		v_8<=0;v_9<=0;v_10<=0;v_11<=0;v_12<=0;v_13<=0;v_14<=0;v_15<=0;
		h_0<=0;h_1<=0;h_2<=0;h_3<=0;h_4<=0;h_5<=0;h_6<=0;h_7<=0;
		h_8<=0;h_9<=0;h_10<=0;h_11<=0;h_12<=0;h_13<=0;h_14<=0;h_15<=0;pl<=0;end
	else if(state16 != `intra16r_rst)
		case(state16)
		`intra16r_v0:begin
			v_0<=nrblock16_0;v_1<=nrblock16_1;v_2<=nrblock16_2;v_3<=nrblock16_3;end
		`intra16r_v1:begin
			v_4<=nrblock16_0;v_5<=nrblock16_1;v_6<=nrblock16_2;v_7<=nrblock16_3;end
		`intra16r_v2:begin
			v_8<=nrblock16_0;v_9<=nrblock16_1;v_10<=nrblock16_2;v_11<=nrblock16_3;end
		`intra16r_v3:begin
			v_12<=nrblock16_0;v_13<=nrblock16_1;v_14<=nrblock16_2;v_15<=nrblock16_3;end
		`intra16r_h0:begin
			h_0<=nrblock16_0;h_1<=nrblock16_1;h_2<=nrblock16_2;h_3<=nrblock16_3;end
		`intra16r_h1:begin
			h_4<=nrblock16_0;h_5<=nrblock16_1;h_6<=nrblock16_2;h_7<=nrblock16_3;end
		`intra16r_h2:begin
			h_8<=nrblock16_0;h_9<=nrblock16_1;h_10<=nrblock16_2;h_11<=nrblock16_3;end
		`intra16r_h3:begin
			h_12<=nrblock16_0;h_13<=nrblock16_1;h_14<=nrblock16_2;h_15<=nrblock16_3;end
		`intra16r_pl:begin
			pl <= nrblock16_0;end
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
	0,2,8,10:begin	
		v00=h_0;v01=h_1;v02=h_2;v03=h_3;v10=h_0;v11=h_1;v12=h_2;v13=h_3;
		v20=h_0;v21=h_1;v22=h_2;v23=h_3;v30=h_0;v31=h_1;v32=h_2;v33=h_3;end
	1,3,9,11:begin
		v00=h_4;v01=h_5;v02=h_6;v03=h_7;v10=h_4;v11=h_5;v12=h_6;v13=h_7;
		v20=h_4;v21=h_5;v22=h_6;v23=h_7;v30=h_4;v31=h_5;v32=h_6;v33=h_7;end
	4,6,12,14:begin
		v00=h_8;v01=h_9;v02=h_10;v03=h_11;v10=h_8;v11=h_9;v12=h_10;v13=h_11;
		v20=h_8;v21=h_9;v22=h_10;v23=h_11;v30=h_8;v31=h_9;v32=h_10;v33=h_11;end
	5,7,13,15:begin
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
	0,1,4,5:begin	
		h00=v_0;h01=v_0;h02=v_0;h03=v_0;h10=v_1;h11=v_1;h12=v_1;h13=v_1;
		h20=v_2;h21=v_2;h22=v_2;h23=v_2;h30=v_3;h31=v_3;h32=v_3;h33=v_3;end
	2,3,6,7:begin
		h00=v_4;h01=v_4;h02=v_4;h03=v_4;h10=v_5;h11=v_5;h12=v_5;h13=v_5;
		h20=v_6;h21=v_6;h22=v_6;h23=v_6;h30=v_7;h31=v_7;h32=v_7;h33=v_7;end
	8,9,12,13:begin
		h00=v_8;h01=v_8;h02=v_8;h03=v_8;h10=v_9;h11=v_9;h12=v_9;h13=v_9;
		h20=v_10;h21=v_10;h22=v_10;h23=v_10;h30=v_11;h31=v_11;h32=v_11;h33=v_11;end
	10,11,14,15:begin
		h00=v_12;h01=v_12;h02=v_12;h03=v_12;h10=v_13;h11=v_13;h12=v_13;h13=v_13;
		h20=v_14;h21=v_14;h22=v_14;h23=v_14;h30=v_15;h31=v_15;h32=v_15;h33=v_15;end
	default:begin
		h00=0;h01=0;h02=0;h03=0;h10=0;h11=0;h12=0;h13=0;
		h20=0;h21=0;h22=0;h23=0;h30=0;h31=0;h32=0;h33=0;end
	endcase
wire [15:0] a,b,c,plane_H,plane_V;
wire [20:0] b_64,c_64;
reg[15:0] p00,p01,p02,p03,p10,p11,p12,p13,p20,p21,p22,p23,p30,p31,p32,p33;
assign a = (v_15+h_15)<<4;
assign plane_H = (h_8-h_6)+2*(h_9-h_5)+3*(h_10-h_4)+4*(h_11-h_3)+5*(h_12-h_2)+6*(h_13-h_1)+7*(h_14-h_0)+8*(h_15-pl);
assign plane_V = (v_8-v_6)+2*(v_9-v_5)+3*(v_10-v_4)+4*(v_11-v_3)+5*(v_12-v_2)+6*(v_13-v_1)+7*(v_14-v_0)+8*(v_15-pl);
assign b_64 = {{3{plane_H[15]}},plane_H,2'b0}+{{5{plane_H[15]}},plane_H}+21'd32;
assign c_64 = {{3{plane_V[15]}},plane_V,2'b0}+{{5{plane_V[15]}},plane_V}+21'd32;
assign b = {b_64[20],b_64[20:6]};
assign c = {c_64[20],c_64[20:6]};
wire [15:0] plane_16_00,plane_16_01,plane_16_02,plane_16_03;
wire [15:0] plane_16_10,plane_16_11,plane_16_12,plane_16_13;
wire [15:0] plane_16_20,plane_16_21,plane_16_22,plane_16_23;
wire [15:0] plane_16_30,plane_16_31,plane_16_32,plane_16_33;
assign plane_16_00 =  p00[15]?0:({{5{p00[15]}},p00[15:5]}>255?16'd255:{{5{p00[15]}},p00[15:5]});
assign plane_16_01 =  p01[15]?0:({{5{p01[15]}},p01[15:5]}>255?16'd255:{{5{p01[15]}},p01[15:5]});
assign plane_16_02 =  p02[15]?0:({{5{p02[15]}},p02[15:5]}>255?16'd255:{{5{p02[15]}},p02[15:5]});
assign plane_16_03 =  p03[15]?0:({{5{p03[15]}},p03[15:5]}>255?16'd255:{{5{p03[15]}},p03[15:5]});
assign plane_16_10 =  p10[15]?0:({{5{p10[15]}},p10[15:5]}>255?16'd255:{{5{p10[15]}},p10[15:5]});
assign plane_16_11 =  p11[15]?0:({{5{p11[15]}},p11[15:5]}>255?16'd255:{{5{p11[15]}},p11[15:5]});
assign plane_16_12 =  p12[15]?0:({{5{p12[15]}},p12[15:5]}>255?16'd255:{{5{p12[15]}},p12[15:5]});
assign plane_16_13 =  p13[15]?0:({{5{p13[15]}},p13[15:5]}>255?16'd255:{{5{p13[15]}},p13[15:5]});
assign plane_16_20 =  p20[15]?0:({{5{p20[15]}},p20[15:5]}>255?16'd255:{{5{p20[15]}},p20[15:5]});
assign plane_16_21 =  p21[15]?0:({{5{p21[15]}},p21[15:5]}>255?16'd255:{{5{p21[15]}},p21[15:5]});
assign plane_16_22 =  p22[15]?0:({{5{p22[15]}},p22[15:5]}>255?16'd255:{{5{p22[15]}},p22[15:5]});
assign plane_16_23 =  p23[15]?0:({{5{p23[15]}},p23[15:5]}>255?16'd255:{{5{p23[15]}},p23[15:5]});
assign plane_16_30 =  p30[15]?0:({{5{p30[15]}},p30[15:5]}>255?16'd255:{{5{p30[15]}},p30[15:5]});
assign plane_16_31 =  p31[15]?0:({{5{p31[15]}},p31[15:5]}>255?16'd255:{{5{p31[15]}},p31[15:5]});
assign plane_16_32 =  p32[15]?0:({{5{p32[15]}},p32[15:5]}>255?16'd255:{{5{p32[15]}},p32[15:5]});
assign plane_16_33 =  p33[15]?0:({{5{p33[15]}},p33[15:5]}>255?16'd255:{{5{p33[15]}},p33[15:5]});

always@(intra16_pred_num or reset_n or a or b or c)
	if(reset_n == 0)begin
	p00=0;p01=0;p02=0;p03=0;p10=0;p11=0;p12=0;p13=0;
	p20=0;p21=0;p22=0;p23=0;p30=0;p31=0;p32=0;p33=0;end
	else
	case(intra16_pred_num)
	0:begin 
		p00=a-7*b-7*c+16;p01=a-6*b-7*c+16;p02=a-5*b-7*c+16;p03=a-4*b-7*c+16;
		p10=a-7*b-6*c+16;p11=a-6*b-6*c+16;p12=a-5*b-6*c+16;p13=a-4*b-6*c+16;
		p20=a-7*b-5*c+16;p21=a-6*b-5*c+16;p22=a-5*b-5*c+16;p23=a-4*b-5*c+16;
		p30=a-7*b-4*c+16;p31=a-6*b-4*c+16;p32=a-5*b-4*c+16;p33=a-4*b-4*c+16;end
	1:begin 
		p00=a-3*b-7*c+16;p01=a-2*b-7*c+16;p02=a-b-7*c+16;p03=a-7*c+16;
		p10=a-3*b-6*c+16;p11=a-2*b-6*c+16;p12=a-b-6*c+16;p13=a-6*c+16;
		p20=a-3*b-5*c+16;p21=a-2*b-5*c+16;p22=a-b-5*c+16;p23=a-5*c+16;
		p30=a-3*b-4*c+16;p31=a-2*b-4*c+16;p32=a-b-4*c+16;p33=a-4*c+16;end
	2:begin 
		p00=a-7*b-3*c+16;p01=a-6*b-3*c+16;p02=a-5*b-3*c+16;p03=a-4*b-3*c+16;
		p10=a-7*b-2*c+16;p11=a-6*b-2*c+16;p12=a-5*b-2*c+16;p13=a-4*b-2*c+16;
		p20=a-7*b-c+16;p21=a-6*b-c+16;p22=a-5*b-c+16;p23=a-4*b-c+16;
		p30=a-7*b+16;p31=a-6*b+16;p32=a-5*b+16;p33=a-4*b+16;end
	3:begin 
		p00=a-3*b-3*c+16;p01=a-2*b-3*c+16;p02=a-b-3*c+16;p03=a-3*c+16;
		p10=a-3*b-2*c+16;p11=a-2*b-2*c+16;p12=a-b-2*c+16;p13=a-2*c+16;
		p20=a-3*b-c+16;p21=a-2*b-c+16;p22=a-b-c+16;p23=a-c+16;
		p30=a-3*b+16;p31=a-2*b+16;p32=a-1*b+16;p33=a+16;end
	4:begin 
		p00=a+b-7*c+16;p01=a+2*b-7*c+16;p02=a+3*b-7*c+16;p03=a+4*b-7*c+16;
		p10=a+b-6*c+16;p11=a+2*b-6*c+16;p12=a+3*b-6*c+16;p13=a+4*b-6*c+16;
		p20=a+b-5*c+16;p21=a+2*b-5*c+16;p22=a+3*b-5*c+16;p23=a+4*b-5*c+16;
		p30=a+b-4*c+16;p31=a+2*b-4*c+16;p32=a+3*b-4*c+16;p33=a+4*b-4*c+16;end
	5:begin 
		p00=a+5*b-7*c+16;p01=a+6*b-7*c+16;p02=a+7*b-7*c+16;p03=a+8*b-7*c+16;
		p10=a+5*b-6*c+16;p11=a+6*b-6*c+16;p12=a+7*b-6*c+16;p13=a+8*b-6*c+16;
		p20=a+5*b-5*c+16;p21=a+6*b-5*c+16;p22=a+7*b-5*c+16;p23=a+8*b-5*c+16;
		p30=a+5*b-4*c+16;p31=a+6*b-4*c+16;p32=a+7*b-4*c+16;p33=a+8*b-4*c+16;end
	6:begin 
		p00=a+b-3*c+16;p01=a+2*b-3*c+16;p02=a+3*b-3*c+16;p03=a+4*b-3*c+16;
		p10=a+b-2*c+16;p11=a+2*b-2*c+16;p12=a+3*b-2*c+16;p13=a+4*b-2*c+16;
		p20=a+b-c+16;p21=a+2*b-c+16;p22=a+3*b-c+16;p23=a+4*b-c+16;
		p30=a+b+16;p31=a+2*b+16;p32=a+3*b+16;p33=a+4*b+16;end
	7:begin 
		p00=a+5*b-3*c+16;p01=a+6*b-3*c+16;p02=a+7*b-3*c+16;p03=a+8*b-3*c+16;
		p10=a+5*b-2*c+16;p11=a+6*b-2*c+16;p12=a+7*b-2*c+16;p13=a+8*b-2*c+16;
		p20=a+5*b-c+16;p21=a+6*b-c+16;p22=a+7*b-c+16;p23=a+8*b-c+16;
		p30=a+5*b+16;p31=a+6*b+16;p32=a+7*b+16;p33=a+8*b+16;end
	8:begin 
		p00=a-7*b+c+16;p01=a-6*b+c+16;p02=(a-5*b+c+16);p03=(a-4*b+c+16);
		p10=a-7*b+2*c+16;p11=a-6*b+2*c+16;p12=(a-5*b+2*c+16);p13=(a-4*b+2*c+16);
		p20=a-7*b+3*c+16;p21=a-6*b+3*c+16;p22=(a-5*b+3*c+16);p23=(a-4*b+3*c+16);
		p30=a-7*b+4*c+16;p31=a-6*b+4*c+16;p32=(a-5*b+4*c+16);p33=(a-4*b+4*c+16);end
	9:begin 
		p00=(a-3*b+c+16);p01=(a-2*b+c+16);p02=(a-b+c+16);p03=(a+c+16);
		p10=(a-3*b+2*c+16);p11=(a-2*b+2*c+16);p12=(a-b+2*c+16);p13=(a+2*c+16);
		p20=(a-3*b+3*c+16);p21=(a-2*b+3*c+16);p22=(a-b+3*c+16);p23=(a+3*c+16);
		p30=(a-3*b+4*c+16);p31=(a-2*b+4*c+16);p32=(a-b+4*c+16);p33=(a+4*c+16);end
	10:begin 
		p00=(a-7*b+5*c+16);p01=(a-6*b+5*c+16);p02=(a-5*b+5*c+16);p03=(a-4*b+5*c+16);
		p10=(a-7*b+6*c+16);p11=(a-6*b+6*c+16);p12=(a-5*b+6*c+16);p13=(a-4*b+6*c+16);
		p20=(a-7*b+7*c+16);p21=(a-6*b+7*c+16);p22=(a-5*b+7*c+16);p23=(a-4*b+7*c+16);
		p30=(a-7*b+8*c+16);p31=(a-6*b+8*c+16);p32=(a-5*b+8*c+16);p33=(a-4*b+8*c+16);end
	11:begin 
		p00=(a-3*b+5*c+16);p01=(a-2*b+5*c+16);p02=(a-b+5*c+16);p03=(a+5*c+16);
		p10=(a-3*b+6*c+16);p11=(a-2*b+6*c+16);p12=(a-b+6*c+16);p13=(a+6*c+16);
		p20=(a-3*b+7*c+16);p21=(a-2*b+7*c+16);p22=(a-b+7*c+16);p23=(a+7*c+16);
		p30=(a-3*b+8*c+16);p31=(a-2*b+8*c+16);p32=(a-b+8*c+16);p33=(a+8*c+16);end
	12:begin 
		p00=(a+b+c+16);p01=(a+2*b+c+16);p02=(a+3*b+c+16);p03=(a+4*b+c+16);
		p10=(a+b+2*c+16);p11=(a+2*b+2*c+16);p12=(a+3*b+2*c+16);p13=(a+4*b+2*c+16);
		p20=(a+b+3*c+16);p21=(a+2*b+3*c+16);p22=(a+3*b+3*c+16);p23=(a+4*b+3*c+16);
		p30=(a+b+4*c+16);p31=(a+2*b+4*c+16);p32=(a+3*b+4*c+16);p33=(a+4*b+4*c+16);end
	13:begin 
		p00=(a+5*b+c+16);p01=(a+6*b+c+16);p02=(a+7*b+c+16);p03=(a+8*b+c+16);
		p10=(a+5*b+2*c+16);p11=(a+6*b+2*c+16);p12=(a+7*b+2*c+16);p13=(a+8*b+2*c+16);
		p20=(a+5*b+3*c+16);p21=(a+6*b+3*c+16);p22=(a+7*b+3*c+16);p23=(a+8*b+3*c+16);
		p30=(a+5*b+4*c+16);p31=(a+6*b+4*c+16);p32=(a+7*b+4*c+16);p33=(a+8*b+4*c+16);end
	14:begin 
		p00=(a+b+5*c+16);p01=(a+2*b+5*c+16);p02=(a+3*b+5*c+16);p03=(a+4*b+5*c+16);
		p10=(a+b+6*c+16);p11=(a+2*b+6*c+16);p12=(a+3*b+6*c+16);p13=(a+4*b+6*c+16);
		p20=(a+b+7*c+16);p21=(a+2*b+7*c+16);p22=(a+3*b+7*c+16);p23=(a+4*b+7*c+16);
		p30=(a+b+8*c+16);p31=(a+2*b+8*c+16);p32=(a+3*b+8*c+16);p33=(a+4*b+8*c+16);end
	15:begin 
		p00=(a+5*b+5*c+16);p01=(a+6*b+5*c+16);p02=(a+7*b+5*c+16);p03=(a+8*b+5*c+16);
		p10=(a+5*b+6*c+16);p11=(a+6*b+6*c+16);p12=(a+7*b+6*c+16);p13=(a+8*b+6*c+16);
		p20=(a+5*b+7*c+16);p21=(a+6*b+7*c+16);p22=(a+7*b+7*c+16);p23=(a+8*b+7*c+16);
		p30=(a+5*b+8*c+16);p31=(a+6*b+8*c+16);p32=(a+7*b+8*c+16);p33=(a+8*b+8*c+16);end

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
	else if(residual_intra16_state == `intra16_pred)
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





























