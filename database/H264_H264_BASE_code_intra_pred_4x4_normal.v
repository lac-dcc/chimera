`include "timescale.v"
`include "define.v"

module intra_pred_4x4_normal(
input clk,
input reset_n,
input [63:0] Intra4x4PredMode_CurrMb,
input [15:0] nrblock_a,nrblock_b,nrblock_c,nrblock_d,
input [15:0] nrblock_e,nrblock_f,nrblock_g,nrblock_h,
input [15:0] nrblock_i,nrblock_j,nrblock_k,nrblock_l,nrblock_m,
input [15:0] nrblockpl_0,nrblockpl_1,nrblockpl_2,nrblockpl_3,
input [2:0] residual_intra4x4_state,residual_intra16_state,
input [4:0] intra4x4_pred_num,intra16_pred_num,
input [2:0] state_chromapl,
input currMB_availA,currMB_availB, 
input constrained_intra_pred_flag,
input [1:0] intra_chroma_pred_mode,

output reg [15:0] intra_pred_4x4_00,intra_pred_4x4_01,intra_pred_4x4_02,intra_pred_4x4_03,
output reg [15:0] intra_pred_4x4_10,intra_pred_4x4_11,intra_pred_4x4_12,intra_pred_4x4_13,
output reg [15:0] intra_pred_4x4_20,intra_pred_4x4_21,intra_pred_4x4_22,intra_pred_4x4_23,
output reg [15:0] intra_pred_4x4_30,intra_pred_4x4_31,intra_pred_4x4_32,intra_pred_4x4_33
);

  
reg [3:0] intra_4x4_predmode;
always@(intra4x4_pred_num or Intra4x4PredMode_CurrMb)
if(intra4x4_pred_num[4] == 0)
case(intra4x4_pred_num)
    0:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[3:0];
    1:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[7:4];
    2:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[11:8];
    3:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[15:12];
    4:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[19:16];
    5:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[23:20];
    6:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[27:24];
    7:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[31:28];
    8:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[35:32];
    9:  intra_4x4_predmode = Intra4x4PredMode_CurrMb[39:36];
    10: intra_4x4_predmode = Intra4x4PredMode_CurrMb[43:40];
    11: intra_4x4_predmode = Intra4x4PredMode_CurrMb[47:44];
    12: intra_4x4_predmode = Intra4x4PredMode_CurrMb[51:48];
    13: intra_4x4_predmode = Intra4x4PredMode_CurrMb[55:52];
    14: intra_4x4_predmode = Intra4x4PredMode_CurrMb[59:56];
    15: intra_4x4_predmode = Intra4x4PredMode_CurrMb[63:60];
    default:;
  endcase



//dc
wire [15:0] dc_add_up,dc_add_left,dc_pred;
assign dc_add_up =  nrblock_a + nrblock_b + nrblock_c + nrblock_d ;
assign dc_add_left = nrblock_i + nrblock_j + nrblock_k + nrblock_l ;

assign dc_pred = (currMB_availA && currMB_availB )?(dc_add_up+dc_add_left+16'd4)>>3:
		 (currMB_availA && !currMB_availB )?(dc_add_left+16'd2)>>2:
		 (!currMB_availA && currMB_availB)?(dc_add_up+16'd2)>>2:16'd128;
//down_left
wire [15:0] down_left_00,down_left_01,down_left_02,down_left_03;
wire [15:0] down_left_10,down_left_11,down_left_12,down_left_13;
wire [15:0] down_left_20,down_left_21,down_left_22,down_left_23;
wire [15:0] down_left_30,down_left_31,down_left_32,down_left_33;
wire [15:0] xy_0,xy_1,xy_2,xy_3,xy_4,xy_5,xy_6;
assign xy_0 = nrblock_a + nrblock_b + nrblock_b + nrblock_c + 16'd2; 
assign xy_1 = nrblock_b + nrblock_c + nrblock_c + nrblock_d + 16'd2;
assign xy_2 = nrblock_c + nrblock_d + nrblock_d + nrblock_e + 16'd2;
assign xy_3 = nrblock_d + nrblock_e + nrblock_e + nrblock_f + 16'd2;
assign xy_4 = nrblock_e + nrblock_f + nrblock_f + nrblock_g + 16'd2;
assign xy_5 = nrblock_f + nrblock_g + nrblock_g + nrblock_h + 16'd2;
assign xy_6 = nrblock_g + nrblock_h + nrblock_h + nrblock_h + 16'd2;

assign down_left_00 = {xy_0[15],xy_0[15],xy_0[15:2]};
assign down_left_01 = {xy_1[15],xy_1[15],xy_1[15:2]};
assign down_left_02 = {xy_2[15],xy_2[15],xy_2[15:2]};
assign down_left_03 = {xy_3[15],xy_3[15],xy_3[15:2]};
assign down_left_10 = {xy_1[15],xy_1[15],xy_1[15:2]};
assign down_left_11 = {xy_2[15],xy_2[15],xy_2[15:2]};
assign down_left_12 = {xy_3[15],xy_3[15],xy_3[15:2]};
assign down_left_13 = {xy_4[15],xy_4[15],xy_4[15:2]};
assign down_left_20 = {xy_2[15],xy_2[15],xy_2[15:2]};
assign down_left_21 = {xy_3[15],xy_3[15],xy_3[15:2]};
assign down_left_22 = {xy_4[15],xy_4[15],xy_4[15:2]};
assign down_left_23 = {xy_5[15],xy_5[15],xy_5[15:2]};
assign down_left_30 = {xy_3[15],xy_3[15],xy_3[15:2]};
assign down_left_31 = {xy_4[15],xy_4[15],xy_4[15:2]};
assign down_left_32 = {xy_5[15],xy_5[15],xy_5[15:2]};
assign down_left_33 = {xy_6[15],xy_6[15],xy_6[15:2]};


//down_right 
wire [15:0] down_right_00,down_right_01,down_right_02,down_right_03;
wire [15:0] down_right_10,down_right_11,down_right_12,down_right_13;
wire [15:0] down_right_20,down_right_21,down_right_22,down_right_23;
wire [15:0] down_right_30,down_right_31,down_right_32,down_right_33;
wire [15:0] downright0,downright1,downright2,downright3,downright4,downright5,downright6;
assign downright0 = nrblock_l+(nrblock_k<<1)+nrblock_j+16'd2;
assign downright1 = nrblock_k+(nrblock_j<<1)+nrblock_i+16'd2;
assign downright2 = nrblock_j+(nrblock_i<<1)+nrblock_m+16'd2;
assign downright3 = nrblock_i+(nrblock_m<<1)+nrblock_a+16'd2;
assign downright4 = nrblock_m+(nrblock_a<<1)+nrblock_b+16'd2;
assign downright5 = nrblock_a+(nrblock_b<<1)+nrblock_c+16'd2;
assign downright6 = nrblock_b+(nrblock_c<<1)+nrblock_d+16'd2;
assign down_right_00 = {{2{downright3[15]}},downright3[15:2]};
assign down_right_01 = {{2{downright4[15]}},downright4[15:2]};
assign down_right_02 = {{2{downright5[15]}},downright5[15:2]};
assign down_right_03 = {{2{downright6[15]}},downright6[15:2]};
assign down_right_10 = {{2{downright2[15]}},downright2[15:2]};
assign down_right_11 = {{2{downright3[15]}},downright3[15:2]};
assign down_right_12 = {{2{downright4[15]}},downright4[15:2]};
assign down_right_13 = {{2{downright5[15]}},downright5[15:2]};
assign down_right_20 = {{2{downright1[15]}},downright1[15:2]};
assign down_right_21 = {{2{downright2[15]}},downright2[15:2]};
assign down_right_22 = {{2{downright3[15]}},downright3[15:2]};
assign down_right_23 = {{2{downright4[15]}},downright4[15:2]};
assign down_right_30 = {{2{downright0[15]}},downright0[15:2]};
assign down_right_31 = {{2{downright1[15]}},downright1[15:2]};
assign down_right_32 = {{2{downright2[15]}},downright2[15:2]};
assign down_right_33 = {{2{downright3[15]}},downright3[15:2]};

//vright
wire [15:0] v_right_00,v_right_01,v_right_02,v_right_03;
wire [15:0] v_right_10,v_right_11,v_right_12,v_right_13;
wire [15:0] v_right_20,v_right_21,v_right_22,v_right_23;
wire [15:0] v_right_30,v_right_31,v_right_32,v_right_33;
wire [15:0] vright0,vright1,vright2,vright3,vright4,vright5,vright6,vright7,vright8,vright9;
assign vright0 = nrblock_m+(nrblock_i<<1)+nrblock_j+16'd2;
assign vright1 = nrblock_m+nrblock_a+16'd1;
assign vright2 = nrblock_a+nrblock_b+16'd1;
assign vright3 = nrblock_b+nrblock_c+16'd1;
assign vright4 = nrblock_c+nrblock_d+16'd1;
assign vright5 = nrblock_i+(nrblock_j<<1)+nrblock_k+16'd2;
assign vright6 = nrblock_i+(nrblock_m<<1)+nrblock_a+16'd2;
assign vright7 = nrblock_m+(nrblock_a<<1)+nrblock_b+16'd2;
assign vright8 = nrblock_a+(nrblock_b<<1)+nrblock_c+16'd2;
assign vright9 = nrblock_b+(nrblock_c<<1)+nrblock_d+16'd2;
assign v_right_00 = {vright1[15],vright1[15:1]};
assign v_right_01 = {vright2[15],vright2[15:1]};
assign v_right_02 = {vright3[15],vright3[15:1]};
assign v_right_03 = {vright4[15],vright4[15:1]};
assign v_right_10 = {{2{vright6[15]}},vright6[15:2]};
assign v_right_11 = {{2{vright7[15]}},vright7[15:2]};
assign v_right_12 = {{2{vright8[15]}},vright8[15:2]};
assign v_right_13 = {{2{vright9[15]}},vright9[15:2]};
assign v_right_20 = {{2{vright0[15]}},vright0[15:2]};
assign v_right_21 = {vright1[15],vright1[15:1]};
assign v_right_22 = {vright2[15],vright2[15:1]};
assign v_right_23 = {vright3[15],vright3[15:1]};
assign v_right_30 = {{2{vright5[15]}},vright5[15:2]};
assign v_right_31 = {{2{vright6[15]}},vright6[15:2]};
assign v_right_32 = {{2{vright7[15]}},vright7[15:2]};
assign v_right_33 = {{2{vright8[15]}},vright8[15:2]};


//hdown
wire [15:0] h_down_00,h_down_01,h_down_02,h_down_03;
wire [15:0] h_down_10,h_down_11,h_down_12,h_down_13;
wire [15:0] h_down_20,h_down_21,h_down_22,h_down_23;
wire [15:0] h_down_30,h_down_31,h_down_32,h_down_33;
wire [15:0] hdown0,hdown1,hdown2,hdown3,hdown4,hdown5,hdown6,hdown7,hdown8,hdown9;
assign hdown0 = nrblock_k+nrblock_l+16'd1;
assign hdown1 = nrblock_j+(nrblock_k<<1)+nrblock_l+16'd2;
assign hdown2 = nrblock_j+nrblock_k+16'd1;
assign hdown3 = nrblock_i+(nrblock_j<<1)+nrblock_k+16'd2;
assign hdown4 = nrblock_i+nrblock_j+16'd1;
assign hdown5 = nrblock_m+(nrblock_i<<1)+nrblock_j+16'd2;
assign hdown6 = nrblock_m+nrblock_i+16'd1;
assign hdown7 = nrblock_i+(nrblock_m<<1)+nrblock_a+16'd2;
assign hdown8 = nrblock_m+(nrblock_a<<1)+nrblock_b+16'd2;
assign hdown9 = nrblock_a+(nrblock_b<<1)+nrblock_c+16'd2;
assign h_down_00 = {hdown6[15],hdown6[15:1]};
assign h_down_01 = {{2{hdown7[15]}},hdown7[15:2]};
assign h_down_02 = {{2{hdown8[15]}},hdown8[15:2]};
assign h_down_03 = {{2{hdown9[15]}},hdown9[15:2]};
assign h_down_10 = {hdown4[15],hdown4[15:1]};
assign h_down_11 = {{2{hdown5[15]}},hdown5[15:2]};
assign h_down_12 = {hdown6[15],hdown6[15:1]};
assign h_down_13 = {{2{hdown7[15]}},hdown7[15:2]};
assign h_down_20 = {hdown2[15],hdown2[15:1]};
assign h_down_21 = {{2{hdown3[15]}},hdown3[15:2]};
assign h_down_22 = {hdown4[15],hdown4[15:1]};
assign h_down_23 = {{2{hdown5[15]}},hdown5[15:2]};
assign h_down_30 = {hdown0[15],hdown0[15:1]};
assign h_down_31 = {{2{hdown1[15]}},hdown1[15:2]};
assign h_down_32 = {hdown2[15],hdown2[15:1]};
assign h_down_33 = {{2{hdown3[15]}},hdown3[15:2]};


//vleft
wire [15:0] v_left_00,v_left_01,v_left_02,v_left_03;
wire [15:0] v_left_10,v_left_11,v_left_12,v_left_13;
wire [15:0] v_left_20,v_left_21,v_left_22,v_left_23;
wire [15:0] v_left_30,v_left_31,v_left_32,v_left_33;
wire [15:0] vleft0,vleft1,vleft2,vleft3,vleft4,vleft5,vleft6,vleft7,vleft8,vleft9;
assign vleft0 = nrblock_a+nrblock_b+16'd1;
assign vleft1 = nrblock_b+nrblock_c+16'd1;
assign vleft2 = nrblock_c+nrblock_d+16'd1;
assign vleft3 = nrblock_d+nrblock_e+16'd1;
assign vleft4 = nrblock_e+nrblock_f+16'd1;
assign vleft5 = nrblock_a+(nrblock_b<<1)+nrblock_c+16'd2;
assign vleft6 = nrblock_b+(nrblock_c<<1)+nrblock_d+16'd2;
assign vleft7 = nrblock_c+(nrblock_d<<1)+nrblock_e+16'd2;
assign vleft8 = nrblock_d+(nrblock_e<<1)+nrblock_f+16'd2;
assign vleft9 = nrblock_e+(nrblock_f<<1)+nrblock_g+16'd2;
assign v_left_00 = {vleft0[15],vleft0[15:1]};
assign v_left_01 = {vleft1[15],vleft1[15:1]};
assign v_left_02 = {vleft2[15],vleft2[15:1]};
assign v_left_03 = {vleft3[15],vleft3[15:1]};
assign v_left_10 = {{2{vleft5[15]}},vleft5[15:2]};
assign v_left_11 = {{2{vleft6[15]}},vleft6[15:2]};
assign v_left_12 = {{2{vleft7[15]}},vleft7[15:2]};
assign v_left_13 = {{2{vleft8[15]}},vleft8[15:2]};
assign v_left_20 = {vleft1[15],vleft1[15:1]};
assign v_left_21 = {vleft2[15],vleft2[15:1]};
assign v_left_22 = {vleft3[15],vleft3[15:1]};
assign v_left_23 = {vleft4[15],vleft4[15:1]};
assign v_left_30 = {{2{vleft6[15]}},vleft6[15:2]};
assign v_left_31 = {{2{vleft7[15]}},vleft7[15:2]};
assign v_left_32 = {{2{vleft8[15]}},vleft8[15:2]};
assign v_left_33 = {{2{vleft9[15]}},vleft9[15:2]};

//hup
wire [15:0] h_up_00,h_up_01,h_up_02,h_up_03;
wire [15:0] h_up_10,h_up_11,h_up_12,h_up_13;
wire [15:0] h_up_20,h_up_21,h_up_22,h_up_23;
wire [15:0] h_up_30,h_up_31,h_up_32,h_up_33;
wire [15:0] hup0,hup1,hup2,hup3,hup4,hup5;
assign hup0 = nrblock_i+nrblock_j+16'd1;
assign hup1 = nrblock_i+(nrblock_j<<1)+nrblock_k+16'd2;
assign hup2 = nrblock_j+nrblock_k+16'd1;
assign hup3 = nrblock_j+(nrblock_k<<1)+nrblock_l+16'd2;
assign hup4 = nrblock_k+nrblock_l+16'd1;
assign hup5 = nrblock_k+(nrblock_l<<1)+nrblock_l+16'd2;
assign h_up_00 = {hup0[15],hup0[15:1]};
assign h_up_01 = {{2{hup1[15]}},hup1[15:2]};
assign h_up_02 = {hup2[15],hup2[15:1]};
assign h_up_03 = {{2{hup3[15]}},hup3[15:2]};
assign h_up_10 = {hup2[15],hup2[15:1]};
assign h_up_11 = {{2{hup3[15]}},hup3[15:2]};
assign h_up_12 = {hup4[15],hup4[15:1]};
assign h_up_13 = {{2{hup5[15]}},hup5[15:2]};
assign h_up_20 = {hup4[15],hup4[15:1]};
assign h_up_21 = {{2{hup5[15]}},hup5[15:2]};
assign h_up_22 = nrblock_l;
assign h_up_23 = nrblock_l;
assign h_up_30 = nrblock_l;
assign h_up_31 = nrblock_l;
assign h_up_32 = nrblock_l;
assign h_up_33 = nrblock_l;

//chroma_plane

reg [15:0] v_0,v_1,v_2,v_3,v_4,v_5,v_6,v_7,h_0,h_1,h_2,h_3,h_4,h_5,h_6,h_7,pl;	
  
always@(posedge clk or negedge reset_n)//
	if(reset_n == 0)begin
		v_0<=0;v_1<=0;v_2<=0;v_3<=0;v_4<=0;v_5<=0;v_6<=0;v_7<=0;
		h_0<=0;h_1<=0;h_2<=0;h_3<=0;h_4<=0;h_5<=0;h_6<=0;h_7<=0;pl<=0;end
	else case(state_chromapl)
	  	`chromapl_v1:begin v_0<=nrblockpl_0;v_1<=nrblockpl_1;v_2<=nrblockpl_2;v_3<=nrblockpl_3;end
		`chromapl_v2:begin v_4<=nrblockpl_0;v_5<=nrblockpl_1;v_6<=nrblockpl_2;v_7<=nrblockpl_3;end
		`chromapl_h1:begin h_0<=nrblockpl_0;h_1<=nrblockpl_1;h_2<=nrblockpl_2;h_3<=nrblockpl_3;end
		`chromapl_h2:begin h_4<=nrblockpl_0;h_5<=nrblockpl_1;h_6<=nrblockpl_2;h_7<=nrblockpl_3;end
		`chromapl_pl:begin pl<= nrblockpl_0;end
		default:;
		endcase

wire [15:0] a,b,c,plane_H,plane_V;
wire [20:0] b_64,c_64;
reg[15:0] p00,p01,p02,p03,p10,p11,p12,p13,p20,p21,p22,p23,p30,p31,p32,p33;

assign a = (v_7+h_7)<<4;
assign plane_H = (h_4-h_2)+2*(h_5-h_1)+3*(h_6-h_0)+4*(h_7-pl);
assign plane_V = (v_4-v_2)+2*(v_5-v_1)+3*(v_6-v_0)+4*(v_7-pl);
assign b_64 = {plane_H,5'b0}+{{4{plane_H[15]}},plane_H,1'b0}+21'd32;
assign c_64 = {plane_V,5'b0}+{{4{plane_V[15]}},plane_V,1'b0}+21'd32;
assign b = {b_64[20],b_64[20:6]};
assign c = {c_64[20],c_64[20:6]};
always@(intra16_pred_num or intra4x4_pred_num or reset_n or a or b or c)
	if(reset_n == 0)begin
	p00=0;p01=0;p02=0;p03=0;p10=0;p11=0;p12=0;p13=0;
	p20=0;p21=0;p22=0;p23=0;p30=0;p31=0;p32=0;p33=0;end
	else if(intra16_pred_num==18||intra4x4_pred_num==18||intra16_pred_num==22||intra4x4_pred_num==22)begin
		p00=a-3*b-3*c+16;p01=a-2*b-3*c+16;p02=a-b-3*c+16;p03=a-3*c+16;
		p10=a-3*b-2*c+16;p11=a-2*b-2*c+16;p12=a-b-2*c+16;p13=a-2*c+16;
		p20=a-3*b-c+16;p21=a-2*b-c+16;p22=a-b-c+16;p23=a-c+16;
		p30=a-3*b+16;p31=a-2*b+16;p32=a-b+16;p33=a+16;end
	else if(intra16_pred_num==19||intra4x4_pred_num==19||intra16_pred_num==23||intra4x4_pred_num==23)begin
		p00=a+b-3*c+16;p01=a+2*b-3*c+16;p02=a+3*b-3*c+16;p03=a+4*b-3*c+16;
		p10=a+b-2*c+16;p11=a+2*b-2*c+16;p12=a+3*b-2*c+16;p13=a+4*b-2*c+16;
		p20=a+b-c+16;p21=a+2*b-c+16;p22=a+3*b-c+16;p23=a+4*b-c+16;
		p30=a+b+16;p31=a+2*b+16;p32=a+3*b+16;p33=a+4*b+16;end
	else if(intra16_pred_num==20||intra4x4_pred_num==20||intra16_pred_num==24||intra4x4_pred_num==24)begin
		p00=a-3*b+c+16;p01=a-2*b+c+16;p02=a-b+c+16;p03=a+c+16;
		p10=a-3*b+2*c+16;p11=a-2*b+2*c+16;p12=a-b+2*c+16;p13=a+2*c+16;
		p20=a-3*b+3*c+16;p21=a-2*b+3*c+16;p22=a-b+3*c+16;p23=a+3*c+16;
		p30=a-3*b+4*c+16;p31=a-2*b+4*c+16;p32=a-b+4*c+16;p33=a+4*c+16;end
	else if(intra16_pred_num==21||intra4x4_pred_num==21||intra16_pred_num==25||intra4x4_pred_num==25)begin
		p00=a+b+c+16;p01=a+2*b+c+16;p02=a+3*b+c+16;p03=a+4*b+c+16;
		p10=a+b+2*c+16;p11=a+2*b+2*c+16;p12=a+3*b+2*c+16;p13=a+4*b+2*c+16;
		p20=a+b+3*c+16;p21=a+2*b+3*c+16;p22=a+3*b+3*c+16;p23=a+4*b+3*c+16;
		p30=a+b+4*c+16;p31=a+2*b+4*c+16;p32=a+3*b+4*c+16;p33=a+4*b+4*c+16;end

wire [15:0] plane_4_00,plane_4_01,plane_4_02,plane_4_03;
wire [15:0] plane_4_10,plane_4_11,plane_4_12,plane_4_13;
wire [15:0] plane_4_20,plane_4_21,plane_4_22,plane_4_23;
wire [15:0] plane_4_30,plane_4_31,plane_4_32,plane_4_33;
assign plane_4_00 =  p00[15]?0:({{5{p00[15]}},p00[15:5]}>255?16'd255:{{5{p00[15]}},p00[15:5]});
assign plane_4_01 =  p01[15]?0:({{5{p01[15]}},p01[15:5]}>255?16'd255:{{5{p01[15]}},p01[15:5]});
assign plane_4_02 =  p02[15]?0:({{5{p02[15]}},p02[15:5]}>255?16'd255:{{5{p02[15]}},p02[15:5]});
assign plane_4_03 =  p03[15]?0:({{5{p03[15]}},p03[15:5]}>255?16'd255:{{5{p03[15]}},p03[15:5]});
assign plane_4_10 =  p10[15]?0:({{5{p10[15]}},p10[15:5]}>255?16'd255:{{5{p10[15]}},p10[15:5]});
assign plane_4_11 =  p11[15]?0:({{5{p11[15]}},p11[15:5]}>255?16'd255:{{5{p11[15]}},p11[15:5]});
assign plane_4_12 =  p12[15]?0:({{5{p12[15]}},p12[15:5]}>255?16'd255:{{5{p12[15]}},p12[15:5]});
assign plane_4_13 =  p13[15]?0:({{5{p13[15]}},p13[15:5]}>255?16'd255:{{5{p13[15]}},p13[15:5]});
assign plane_4_20 =  p20[15]?0:({{5{p20[15]}},p20[15:5]}>255?16'd255:{{5{p20[15]}},p20[15:5]});
assign plane_4_21 =  p21[15]?0:({{5{p21[15]}},p21[15:5]}>255?16'd255:{{5{p21[15]}},p21[15:5]});
assign plane_4_22 =  p22[15]?0:({{5{p22[15]}},p22[15:5]}>255?16'd255:{{5{p22[15]}},p22[15:5]});
assign plane_4_23 =  p23[15]?0:({{5{p23[15]}},p23[15:5]}>255?16'd255:{{5{p23[15]}},p23[15:5]});
assign plane_4_30 =  p30[15]?0:({{5{p30[15]}},p30[15:5]}>255?16'd255:{{5{p30[15]}},p30[15:5]});
assign plane_4_31 =  p31[15]?0:({{5{p31[15]}},p31[15:5]}>255?16'd255:{{5{p31[15]}},p31[15:5]});
assign plane_4_32 =  p32[15]?0:({{5{p32[15]}},p32[15:5]}>255?16'd255:{{5{p32[15]}},p32[15:5]});
assign plane_4_33 =  p33[15]?0:({{5{p33[15]}},p33[15:5]}>255?16'd255:{{5{p33[15]}},p33[15:5]});


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		intra_pred_4x4_00 <= 16'b0;intra_pred_4x4_01 <= 16'b0;
		intra_pred_4x4_02 <= 16'b0;intra_pred_4x4_03 <= 16'b0;
		intra_pred_4x4_10 <= 16'b0;intra_pred_4x4_11 <= 16'b0;
		intra_pred_4x4_12 <= 16'b0;intra_pred_4x4_13 <= 16'b0;
		intra_pred_4x4_20 <= 16'b0;intra_pred_4x4_21 <= 16'b0;
		intra_pred_4x4_22 <= 16'b0;intra_pred_4x4_23 <= 16'b0;
		intra_pred_4x4_30 <= 16'b0;intra_pred_4x4_31 <= 16'b0;
		intra_pred_4x4_32 <= 16'b0;intra_pred_4x4_33 <= 16'b0;
		end
	else if(residual_intra4x4_state == `intra4x4_pred&&intra4x4_pred_num[4] == 0)begin
	   case(intra_4x4_predmode)
	   `Intra4x4_DC:begin
		    intra_pred_4x4_00 <= dc_pred;intra_pred_4x4_01 <= dc_pred;
		    intra_pred_4x4_02 <= dc_pred;intra_pred_4x4_03 <= dc_pred;
		    intra_pred_4x4_10 <= dc_pred;intra_pred_4x4_11 <= dc_pred;
		    intra_pred_4x4_12 <= dc_pred;intra_pred_4x4_13 <= dc_pred;
		    intra_pred_4x4_20 <= dc_pred;intra_pred_4x4_21 <= dc_pred;
		    intra_pred_4x4_22 <= dc_pred;intra_pred_4x4_23 <= dc_pred;
		    intra_pred_4x4_30 <= dc_pred;intra_pred_4x4_31 <= dc_pred;
	     	intra_pred_4x4_32 <= dc_pred;intra_pred_4x4_33 <= dc_pred;
		  end
	   `Intra4x4_Vertical:begin
	     	intra_pred_4x4_00 <= nrblock_a;intra_pred_4x4_01 <= nrblock_b;
		    intra_pred_4x4_02 <= nrblock_c;intra_pred_4x4_03 <= nrblock_d;
		    intra_pred_4x4_10 <= nrblock_a;intra_pred_4x4_11 <= nrblock_b;
		    intra_pred_4x4_12 <= nrblock_c;intra_pred_4x4_13 <= nrblock_d;
		    intra_pred_4x4_20 <= nrblock_a;intra_pred_4x4_21 <= nrblock_b;
		    intra_pred_4x4_22 <= nrblock_c;intra_pred_4x4_23 <= nrblock_d;
		    intra_pred_4x4_30 <= nrblock_a;intra_pred_4x4_31 <= nrblock_b;
		    intra_pred_4x4_32 <= nrblock_c;intra_pred_4x4_33 <= nrblock_d;
		    end
	`Intra4x4_Horizontal:begin
		intra_pred_4x4_00 <= nrblock_i;intra_pred_4x4_01 <= nrblock_i;
		intra_pred_4x4_02 <= nrblock_i;intra_pred_4x4_03 <= nrblock_i;
		intra_pred_4x4_10 <= nrblock_j;intra_pred_4x4_11 <= nrblock_j;
		intra_pred_4x4_12 <= nrblock_j;intra_pred_4x4_13 <= nrblock_j;
		intra_pred_4x4_20 <= nrblock_k;intra_pred_4x4_21 <= nrblock_k;
		intra_pred_4x4_22 <= nrblock_k;intra_pred_4x4_23 <= nrblock_k;
		intra_pred_4x4_30 <= nrblock_l;intra_pred_4x4_31 <= nrblock_l;
		intra_pred_4x4_32 <= nrblock_l;intra_pred_4x4_33 <= nrblock_l;
		end
	`Intra4x4_Diagonal_Down_Left:begin
		intra_pred_4x4_00 <= down_left_00;intra_pred_4x4_01 <= down_left_01;
		intra_pred_4x4_02 <= down_left_02;intra_pred_4x4_03 <= down_left_03;
		intra_pred_4x4_10 <= down_left_10;intra_pred_4x4_11 <= down_left_11;
		intra_pred_4x4_12 <= down_left_12;intra_pred_4x4_13 <= down_left_13;
		intra_pred_4x4_20 <= down_left_20;intra_pred_4x4_21 <= down_left_21;
		intra_pred_4x4_22 <= down_left_22;intra_pred_4x4_23 <= down_left_23;
		intra_pred_4x4_30 <= down_left_30;intra_pred_4x4_31 <= down_left_31;
		intra_pred_4x4_32 <= down_left_32;intra_pred_4x4_33 <= down_left_33;
		end
	`Intra4x4_Diagonal_Down_Right:begin
		intra_pred_4x4_00 <= down_right_00;intra_pred_4x4_01 <= down_right_01;
		intra_pred_4x4_02 <= down_right_02;intra_pred_4x4_03 <= down_right_03;
		intra_pred_4x4_10 <= down_right_10;intra_pred_4x4_11 <= down_right_11;
		intra_pred_4x4_12 <= down_right_12;intra_pred_4x4_13 <= down_right_13;
		intra_pred_4x4_20 <= down_right_20;intra_pred_4x4_21 <= down_right_21;
		intra_pred_4x4_22 <= down_right_22;intra_pred_4x4_23 <= down_right_23;
		intra_pred_4x4_30 <= down_right_30;intra_pred_4x4_31 <= down_right_31;
		intra_pred_4x4_32 <= down_right_32;intra_pred_4x4_33 <= down_right_33;
		end
	`Intra4x4_Vertical_Right:begin
		intra_pred_4x4_00 <= v_right_00;intra_pred_4x4_01 <= v_right_01;
		intra_pred_4x4_02 <= v_right_02;intra_pred_4x4_03 <= v_right_03;
		intra_pred_4x4_10 <= v_right_10;intra_pred_4x4_11 <= v_right_11;
		intra_pred_4x4_12 <= v_right_12;intra_pred_4x4_13 <= v_right_13;
		intra_pred_4x4_20 <= v_right_20;intra_pred_4x4_21 <= v_right_21;
		intra_pred_4x4_22 <= v_right_22;intra_pred_4x4_23 <= v_right_23;
		intra_pred_4x4_30 <= v_right_30;intra_pred_4x4_31 <= v_right_31;
		intra_pred_4x4_32 <= v_right_32;intra_pred_4x4_33 <= v_right_33;
		end
	`Intra4x4_Horizontal_Down:begin
		intra_pred_4x4_00 <= h_down_00;intra_pred_4x4_01 <= h_down_01;
		intra_pred_4x4_02 <= h_down_02;intra_pred_4x4_03 <= h_down_03;
		intra_pred_4x4_10 <= h_down_10;intra_pred_4x4_11 <= h_down_11;
		intra_pred_4x4_12 <= h_down_12;intra_pred_4x4_13 <= h_down_13;
		intra_pred_4x4_20 <= h_down_20;intra_pred_4x4_21 <= h_down_21;
		intra_pred_4x4_22 <= h_down_22;intra_pred_4x4_23 <= h_down_23;
		intra_pred_4x4_30 <= h_down_30;intra_pred_4x4_31 <= h_down_31;
		intra_pred_4x4_32 <= h_down_32;intra_pred_4x4_33 <= h_down_33;
		end
	`Intra4x4_Vertical_Left:begin
		intra_pred_4x4_00 <= v_left_00;intra_pred_4x4_01 <= v_left_01;
		intra_pred_4x4_02 <= v_left_02;intra_pred_4x4_03 <= v_left_03;
		intra_pred_4x4_10 <= v_left_10;intra_pred_4x4_11 <= v_left_11;
		intra_pred_4x4_12 <= v_left_12;intra_pred_4x4_13 <= v_left_13;
		intra_pred_4x4_20 <= v_left_20;intra_pred_4x4_21 <= v_left_21;
		intra_pred_4x4_22 <= v_left_22;intra_pred_4x4_23 <= v_left_23;
		intra_pred_4x4_30 <= v_left_30;intra_pred_4x4_31 <= v_left_31;
		intra_pred_4x4_32 <= v_left_32;intra_pred_4x4_33 <= v_left_33;
		end
	`Intra4x4_Horizontal_Up:begin
		intra_pred_4x4_00 <= h_up_00;intra_pred_4x4_01 <= h_up_01;
		intra_pred_4x4_02 <= h_up_02;intra_pred_4x4_03 <= h_up_03;
		intra_pred_4x4_10 <= h_up_10;intra_pred_4x4_11 <= h_up_11;
		intra_pred_4x4_12 <= h_up_12;intra_pred_4x4_13 <= h_up_13;
		intra_pred_4x4_20 <= h_up_20;intra_pred_4x4_21 <= h_up_21;
		intra_pred_4x4_22 <= h_up_22;intra_pred_4x4_23 <= h_up_23;
		intra_pred_4x4_30 <= h_up_30;intra_pred_4x4_31 <= h_up_31;
		intra_pred_4x4_32 <= h_up_32;intra_pred_4x4_33 <= h_up_33;
		end
	default:;	  
	endcase
	end
	else if((residual_intra16_state == `intra16_pred&&intra16_pred_num[4] == 1)||
		(residual_intra4x4_state == `intra4x4_pred&&intra4x4_pred_num[4] == 1))
	  case(intra_chroma_pred_mode)
	    `Intra_chroma_DC:begin
	      	      intra_pred_4x4_00 <= dc_pred;intra_pred_4x4_01 <= dc_pred;
		      intra_pred_4x4_02 <= dc_pred;intra_pred_4x4_03 <= dc_pred;
		      intra_pred_4x4_10 <= dc_pred;intra_pred_4x4_11 <= dc_pred;
		      intra_pred_4x4_12 <= dc_pred;intra_pred_4x4_13 <= dc_pred;
		      intra_pred_4x4_20 <= dc_pred;intra_pred_4x4_21 <= dc_pred;
		      intra_pred_4x4_22 <= dc_pred;intra_pred_4x4_23 <= dc_pred;
		      intra_pred_4x4_30 <= dc_pred;intra_pred_4x4_31 <= dc_pred;
		      intra_pred_4x4_32 <= dc_pred;intra_pred_4x4_33 <= dc_pred;end
	    `Intra_chroma_Horizontal:begin
		      intra_pred_4x4_00 <= nrblock_i;intra_pred_4x4_01 <= nrblock_i;
		      intra_pred_4x4_02 <= nrblock_i;intra_pred_4x4_03 <= nrblock_i;
		      intra_pred_4x4_10 <= nrblock_j;intra_pred_4x4_11 <= nrblock_j;
		      intra_pred_4x4_12 <= nrblock_j;intra_pred_4x4_13 <= nrblock_j;
		      intra_pred_4x4_20 <= nrblock_k;intra_pred_4x4_21 <= nrblock_k;
		      intra_pred_4x4_22 <= nrblock_k;intra_pred_4x4_23 <= nrblock_k;
		      intra_pred_4x4_30 <= nrblock_l;intra_pred_4x4_31 <= nrblock_l;
		      intra_pred_4x4_32 <= nrblock_l;intra_pred_4x4_33 <= nrblock_l;
	      end
	    `Intra_chroma_Vertical:begin
	     	 intra_pred_4x4_00 <= nrblock_a;intra_pred_4x4_01 <= nrblock_b;
		     intra_pred_4x4_02 <= nrblock_c;intra_pred_4x4_03 <= nrblock_d;
		     intra_pred_4x4_10 <= nrblock_a;intra_pred_4x4_11 <= nrblock_b;
		     intra_pred_4x4_12 <= nrblock_c;intra_pred_4x4_13 <= nrblock_d;
		     intra_pred_4x4_20 <= nrblock_a;intra_pred_4x4_21 <= nrblock_b;
		     intra_pred_4x4_22 <= nrblock_c;intra_pred_4x4_23 <= nrblock_d;
		     intra_pred_4x4_30 <= nrblock_a;intra_pred_4x4_31 <= nrblock_b;
		     intra_pred_4x4_32 <= nrblock_c;intra_pred_4x4_33 <= nrblock_d;
	      end
	    `Intra_chroma_Plane:begin
	      	      intra_pred_4x4_00 <= plane_4_00;intra_pred_4x4_01 <= plane_4_01;
		      intra_pred_4x4_02 <= plane_4_02;intra_pred_4x4_03 <= plane_4_03;
		      intra_pred_4x4_10 <= plane_4_10;intra_pred_4x4_11 <= plane_4_11;
		      intra_pred_4x4_12 <= plane_4_12;intra_pred_4x4_13 <= plane_4_13;
		      intra_pred_4x4_20 <= plane_4_20;intra_pred_4x4_21 <= plane_4_21;
		      intra_pred_4x4_22 <= plane_4_22;intra_pred_4x4_23 <= plane_4_23;
		      intra_pred_4x4_30 <= plane_4_30;intra_pred_4x4_31 <= plane_4_31;
		      intra_pred_4x4_32 <= plane_4_32;intra_pred_4x4_33 <= plane_4_33;
	      end
	    endcase
	
	  


endmodule
