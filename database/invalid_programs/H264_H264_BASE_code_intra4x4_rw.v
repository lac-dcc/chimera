`include "timescale.v"
`include "define.v"

module intra4x4_rw(
input clk,reset_n,res_0,
input [7:0] img_4x4_00,img_4x4_01,img_4x4_02,img_4x4_03,img_4x4_10,img_4x4_11,img_4x4_12,img_4x4_13,
input [7:0] img_4x4_20,img_4x4_21,img_4x4_22,img_4x4_23,img_4x4_30,img_4x4_31,img_4x4_32,img_4x4_33,
input [1:0] Intra16x16_predmode,intra_chroma_pred_mode,
input [4:0] intra4x4_pred_num,intra16_pred_num,TotalCoeff,
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,
input [55:0] intra4x4_dout,
input [7:0] mb_num_h,mb_num_v,pic_width_in_mbs_minus1,pic_height_in_map_units_minus1,
input constrained_intra_pred_flag,
input [1:0] MBTypeGen_mbAddrA,MBTypeGen_mbAddrB,

output reg intra4x4_cs_n,intra4x4_wr_n,
output reg [12:0] intra4x4_rd_addr,intra4x4_wr_addr,
output reg [55:0] intra4x4_din,
output intra4x4_read_end,intra16_read_end,
output reg [7:0] nrblock_a,nrblock_b,nrblock_c,nrblock_d,
output reg [7:0] nrblock_e,nrblock_f,nrblock_g,nrblock_h,
output reg [7:0] nrblock_i,nrblock_j,nrblock_k,nrblock_l,nrblock_m,
output currMB_availA,currMB_availB,
output reg [7:0] nrblock16_0,nrblock16_1,nrblock16_2,nrblock16_3,nrblockpl_0,nrblockpl_1,nrblockpl_2,nrblockpl_3,
output reg [3:0] state16,
output reg [2:0] state_chromapl,
output reg TC_cs_n,TC_wr_n,
output reg [12:0] TC_wr_addr,
output reg [4:0] TC_din
);

parameter intra4x4r_rst  = 3'b000;
parameter intra4x4r_A = 3'b001;
parameter intra4x4r_B = 3'b010;
parameter intra4x4r_C = 3'b011;
parameter intra4x4r_D = 3'b110;

wire currMB_availC,currMB_availD;
wire C_dec_end,is_chroma;
wire [7:0] A_mb_num_h,B_mb_num_v,C_mb_num_h,C_mb_num_v,D_mb_num_h,D_mb_num_v;
wire [7:0] A_mb_num_h_4,A_mb_num_h_16,B_mb_num_v_4,B_mb_num_v_16;
reg  [4:0] Aintra4x4_pred_num,Bintra4x4_pred_num,Cintra4x4_pred_num,Dintra4x4_pred_num;
reg [2:0] state;
wire chroma_pl,pl_ren;
wire currMB_availA_r ,currMB_availB_r;

assign chroma_pl  = intra_chroma_pred_mode==`Intra_chroma_Plane&&((intra16_pred_num[4]==1&&intra16_pred_num!=31)||intra4x4_pred_num[4]==1);
assign pl_ren = intra16_pred_num==18||intra16_pred_num==22||intra4x4_pred_num==18||intra4x4_pred_num==22;


assign intra4x4_read_end =  residual_intra4x4_state == `intra4x4_read&&
				(state == intra4x4r_D||
				 (chroma_pl&&((pl_ren&&state_chromapl==`chromapl_pl)||(pl_ren==0))));

assign intra16_read_end= (residual_intra16_state == `intra16_read&&intra16_pred_num==0&&
			((mb_num_h == 0 && mb_num_v == 0)
			||(state16 == `intra16r_v3 && mb_num_v == 0)
			||(state16 == `intra16r_h3 && Intra16x16_predmode != `Intra16x16_Plane)
			||state16 == `intra16r_pl))||
			(residual_intra16_state == `intra16_read&&intra16_pred_num[4]==1)&&
			(state == intra4x4r_D||(chroma_pl&&((pl_ren && state_chromapl==`chromapl_pl)||(pl_ren==0))));

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= intra4x4r_rst;
	else if((residual_intra4x4_state == `intra4x4_read||(residual_intra16_state == `intra16_read&&intra16_pred_num[4] == 1))&&chroma_pl==0)
		case(state)
		intra4x4r_rst : state <= currMB_availA_r?intra4x4r_A:(currMB_availB_r?intra4x4r_B:intra4x4r_D);
		intra4x4r_A: state <= currMB_availB_r?intra4x4r_B:intra4x4r_D;
		intra4x4r_B: state <= intra4x4r_C;
		intra4x4r_C: state <= intra4x4r_D;
		intra4x4r_D: state <= intra4x4r_rst;
		default :  state <= intra4x4r_rst ;
		endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state16 <= `intra16r_rst;
	else if(residual_intra16_state == `intra16_read&&intra16_pred_num==0)
		case(state16)
		`intra16r_rst:state16<= mb_num_h == 0 ? (mb_num_v == 0? `intra16r_rst:`intra16r_h0):`intra16r_v0;
		`intra16r_v0:state16 <= `intra16r_v1;
		`intra16r_v1:state16 <= `intra16r_v2;
		`intra16r_v2:state16 <= `intra16r_v3;
		`intra16r_v3:state16 <= mb_num_v == 0? `intra16r_rst:`intra16r_h0;
		`intra16r_h0:state16 <= `intra16r_h1;
		`intra16r_h1:state16 <= `intra16r_h2;
		`intra16r_h2:state16 <= `intra16r_h3;
		`intra16r_h3:state16 <= (Intra16x16_predmode == `Intra16x16_Plane)?`intra16r_pl:`intra16r_rst;
		`intra16r_pl:state16 <= `intra16r_rst;
		default:state16 <= `intra16r_rst;
		endcase


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state_chromapl <=  `chromapl_rst;
	else if(chroma_pl&&pl_ren&&(residual_intra4x4_state == `intra4x4_read||residual_intra16_state == `intra16_read))
		case(state_chromapl)
		`chromapl_rst:state_chromapl<= `chromapl_v1;
		`chromapl_v1:state_chromapl<= `chromapl_v2;
		`chromapl_v2:state_chromapl<= `chromapl_h1;
		`chromapl_h1:state_chromapl<= `chromapl_h2;
		`chromapl_h2:state_chromapl<= `chromapl_pl;
		`chromapl_pl:state_chromapl<= `chromapl_rst;
		default:state_chromapl<= `chromapl_rst;
		endcase


assign is_chroma = intra4x4_pred_num[4]||(intra16_pred_num[4]&&intra16_pred_num!=5'b11111);
assign C_dec_end = ~((intra4x4_pred_num == 3)||(intra4x4_pred_num == 11)||
                   (intra4x4_pred_num == 7)||(intra4x4_pred_num == 13)||(intra4x4_pred_num == 15)); 

                 
assign currMB_availA = ~(
		(mb_num_h == 0&&
              (
		(intra4x4_pred_num == 0&&(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state!=`rst_residual_inter))||
                intra4x4_pred_num == 2||intra4x4_pred_num == 8||intra4x4_pred_num == 10||
		intra16_pred_num == 0||intra16_pred_num == 2||intra16_pred_num == 8||intra16_pred_num == 10||is_chroma||		
		(intra16_pred_num == 31&&residual_intra16_state != `rst_residual_intra16)
	      )
		)||		
		(mb_num_v != 0 && !(constrained_intra_pred_flag == 1&&MBTypeGen_mbAddrB[1]==0)&&
			(intra4x4_pred_num == 19||intra4x4_pred_num == 23||intra16_pred_num == 19||intra16_pred_num == 23)
		)||
		(constrained_intra_pred_flag == 1 && MBTypeGen_mbAddrA[1]==0 && mb_num_h != 0 &&
			(intra4x4_pred_num == 2||intra4x4_pred_num == 8||intra4x4_pred_num == 10||(intra4x4_pred_num == 0&&residual_intra4x4_state != `rst_residual_intra4x4)||is_chroma))
			);



assign currMB_availA_r = currMB_availA ||intra4x4_pred_num == 19||intra4x4_pred_num == 23||intra16_pred_num == 19||intra16_pred_num == 23;
assign currMB_availB_r = currMB_availB ||intra4x4_pred_num == 20||intra4x4_pred_num == 24||intra16_pred_num == 20||intra16_pred_num == 24;                              
assign currMB_availB = ~((mb_num_v == 0&&
                           ((intra4x4_pred_num == 0&&(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state!=`rst_residual_inter))||
                            intra4x4_pred_num == 1||intra4x4_pred_num == 4||intra4x4_pred_num == 5||
			    intra16_pred_num == 0||intra16_pred_num == 1||intra16_pred_num == 4||intra16_pred_num == 5||
			    (intra16_pred_num == 31&&residual_intra16_state != `rst_residual_intra16)||is_chroma))
			||(mb_num_h != 0&&!(constrained_intra_pred_flag == 1 && MBTypeGen_mbAddrA[1]==0)&&
			(intra4x4_pred_num == 20||intra4x4_pred_num == 24||intra16_pred_num == 20||intra16_pred_num == 24))
			||(constrained_intra_pred_flag == 1 && MBTypeGen_mbAddrB[1]==0 && mb_num_v != 0 && 
				(intra4x4_pred_num == 1||intra4x4_pred_num == 4||intra4x4_pred_num == 5||is_chroma||(intra4x4_pred_num == 0&&residual_intra4x4_state != `rst_residual_intra4x4))));     
                                                 
assign currMB_availC = ~(((mb_num_v == 0&&
                           (intra4x4_pred_num == 0||intra4x4_pred_num == 1||intra4x4_pred_num == 4||intra4x4_pred_num == 5))
			||(mb_num_h == pic_width_in_mbs_minus1&&
                           (intra4x4_pred_num == 5||intra4x4_pred_num == 7||intra4x4_pred_num == 13||intra4x4_pred_num == 15)))||is_chroma);

assign currMB_availD = ~(((mb_num_v == 0&&
                           (intra4x4_pred_num == 0||intra4x4_pred_num == 1||intra4x4_pred_num == 4||intra4x4_pred_num == 5))||
                          (mb_num_h == 0&&
                           (intra4x4_pred_num == 0||intra4x4_pred_num == 2||intra4x4_pred_num == 8||intra4x4_pred_num == 10)))||is_chroma);
 

 

  
always @(state or state16 or state_chromapl or mb_num_h or mb_num_v  
	or A_mb_num_h or B_mb_num_v or C_mb_num_h or C_mb_num_v or D_mb_num_h or D_mb_num_v
        or Aintra4x4_pred_num or Bintra4x4_pred_num or Cintra4x4_pred_num or Dintra4x4_pred_num)
	if(state != intra4x4r_rst)  
		case(state)
    		intra4x4r_A:intra4x4_rd_addr = {A_mb_num_h[6:0],mb_num_v[0],Aintra4x4_pred_num};
    		intra4x4r_B:intra4x4_rd_addr = {mb_num_h[6:0],B_mb_num_v[0],Bintra4x4_pred_num};
    		intra4x4r_C:intra4x4_rd_addr = C_dec_end&&currMB_availC?{C_mb_num_h[6:0],C_mb_num_v[0],Cintra4x4_pred_num}:{mb_num_h[6:0],B_mb_num_v[0],Bintra4x4_pred_num};
   		intra4x4r_D:intra4x4_rd_addr = currMB_availD?{D_mb_num_h[6:0],D_mb_num_v[0],Dintra4x4_pred_num}:0;
    		default:;
  		endcase
 	else if(state16 != `intra16r_rst)
		case(state16)
		`intra16r_v0:intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,mb_num_v[0],5'd5};
		`intra16r_v1:intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,mb_num_v[0],5'd7};
		`intra16r_v2:intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,mb_num_v[0],5'd13};
		`intra16r_v3:intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,mb_num_v[0],5'd15};
		`intra16r_h0:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],5'd10};
		`intra16r_h1:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],5'd11};
		`intra16r_h2:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],5'd14};
		`intra16r_h3:intra4x4_rd_addr = {mb_num_h[6:0],~mb_num_v[0],5'd15};
		`intra16r_pl:intra4x4_rd_addr = {mb_num_h[6:0]-7'd1,~mb_num_v[0],5'd15};
		default:;
		endcase
	else if(state_chromapl!= `chromapl_rst)
		case(state_chromapl)
		`chromapl_v1:intra4x4_rd_addr = intra16_pred_num==18||intra4x4_pred_num==18?
			{mb_num_h[6:0]-7'd1,mb_num_v[0],5'd19}:{mb_num_h[6:0]-7'd1,mb_num_v[0],5'd23};
		`chromapl_v2:intra4x4_rd_addr = intra16_pred_num==18||intra4x4_pred_num==18?
			{mb_num_h[6:0]-7'd1,mb_num_v[0],5'd21}:{mb_num_h[6:0]-7'd1,mb_num_v[0],5'd25};
		`chromapl_h1:intra4x4_rd_addr = intra16_pred_num==18||intra4x4_pred_num==18?
			{mb_num_h[6:0],~mb_num_v[0],5'd20}:{mb_num_h[6:0],~mb_num_v[0],5'd24};
		`chromapl_h2:intra4x4_rd_addr = intra16_pred_num==18||intra4x4_pred_num==18?
			{mb_num_h[6:0],~mb_num_v[0],5'd21}:{mb_num_h[6:0],~mb_num_v[0],5'd25};
		`chromapl_pl:intra4x4_rd_addr = intra16_pred_num==18||intra4x4_pred_num==18?
			{mb_num_h[6:0]-7'd1,~mb_num_v[0],5'd21}:{mb_num_h[6:0]-7'd1,~mb_num_v[0],5'd25};
		default:;
		endcase

/*
* * * 0
* * * 1
* * * 2
3 4 5 6

6  55:48
5  47:40
4  39:32
3  31:24
2  23:16
1  15:8
0  7:0
*/ 

always @ (reset_n or state_chromapl or intra4x4_dout)
	if (reset_n == 0)begin
		nrblockpl_0 = 0;nrblockpl_1 = 0;nrblockpl_2 = 0;nrblockpl_3 = 0;end
	else 
		case(state_chromapl)
		`chromapl_v1,`chromapl_v2:begin
			nrblockpl_0 = intra4x4_dout[7:0];nrblockpl_1 = intra4x4_dout[15:8];
			nrblockpl_2 = intra4x4_dout[23:16];nrblockpl_3 = intra4x4_dout[55:48];end
		`chromapl_h1,`chromapl_h2:begin
			nrblockpl_0 = intra4x4_dout[31:24];nrblockpl_1 = intra4x4_dout[39:32];
			nrblockpl_2 = intra4x4_dout[47:40];nrblockpl_3 = intra4x4_dout[55:48];end
		`chromapl_pl:begin
			nrblockpl_0 = intra4x4_dout[55:48];nrblockpl_1 = 0;nrblockpl_2 = 0;nrblockpl_3 = 0;end
		default:;
		endcase

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
    		nrblock_a <= 0;nrblock_b <= 0;nrblock_c <= 0;nrblock_d <= 0;
   		nrblock_e <= 0;nrblock_f <= 0;nrblock_g <= 0;nrblock_h <= 0;
    		nrblock_i <= 0;nrblock_j <= 0;nrblock_k <= 0;nrblock_l <= 0;nrblock_m <= 0;end
  	else 
   		case(state)
    		intra4x4r_A:begin
      			nrblock_i <= intra4x4_dout[7:0];nrblock_j <= intra4x4_dout[15:8];
      			nrblock_k <= intra4x4_dout[23:16];nrblock_l <= intra4x4_dout[55:48];end
    		intra4x4r_B:begin 
      			nrblock_a <= intra4x4_dout[31:24];nrblock_b <= intra4x4_dout[39:32];
      			nrblock_c <= intra4x4_dout[47:40];nrblock_d <= intra4x4_dout[55:48];end
    		intra4x4r_C:begin 
      			nrblock_e <= C_dec_end&&currMB_availC?intra4x4_dout[31:24]:intra4x4_dout[55:48];
      			nrblock_f <= C_dec_end&&currMB_availC?intra4x4_dout[39:32]:intra4x4_dout[55:48];
      			nrblock_g <= C_dec_end&&currMB_availC?intra4x4_dout[47:40]:intra4x4_dout[55:48];
      			nrblock_h <= intra4x4_dout[55:48];end 
    		intra4x4r_D:begin
      			nrblock_m <= currMB_availD?intra4x4_dout[55:48]:0;end
    		default:;
  	endcase

always @ (reset_n or state16 or intra4x4_dout)
	if (reset_n == 0)begin
		nrblock16_0 = 0;nrblock16_1 = 0;nrblock16_2 = 0;nrblock16_3 = 0;end
	else 
		case(state16)
		`intra16r_v0,`intra16r_v1,`intra16r_v2,`intra16r_v3:begin
			nrblock16_0 = intra4x4_dout[7:0];nrblock16_1 = intra4x4_dout[15:8];
			nrblock16_2 = intra4x4_dout[23:16];nrblock16_3 = intra4x4_dout[55:48];end
		`intra16r_h0,`intra16r_h1,`intra16r_h2,`intra16r_h3:begin
			nrblock16_0 = intra4x4_dout[31:24];nrblock16_1 = intra4x4_dout[39:32];
			nrblock16_2 = intra4x4_dout[47:40];nrblock16_3 = intra4x4_dout[55:48];end
		`intra16r_pl:begin
			nrblock16_0 = intra4x4_dout[55:48];nrblock16_1 = 0;nrblock16_2 = 0;nrblock16_3 = 0;end
		default:;
		endcase








always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		  intra4x4_cs_n <= 1;intra4x4_wr_n <= 1;
		  intra4x4_wr_addr <= 0;intra4x4_din <= 0;end
	 else if(residual_intra4x4_state == `intra4x4_updat||residual_inter_state==`inter_updat)begin
		   intra4x4_cs_n <= 0;intra4x4_wr_n <= 0;
		   intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],intra4x4_pred_num};
		   intra4x4_din <={img_4x4_33,img_4x4_32,img_4x4_31,img_4x4_30,
		                   img_4x4_23,img_4x4_13,img_4x4_03};end
	 else if(residual_intra16_state == `intra16_updat)begin
		   intra4x4_cs_n <= 0;intra4x4_wr_n <= 0;
		   intra4x4_wr_addr <= {mb_num_h[6:0],mb_num_v[0],intra16_pred_num};
		   intra4x4_din <={img_4x4_33,img_4x4_32,img_4x4_31,img_4x4_30,
		                   img_4x4_23,img_4x4_13,img_4x4_03};end


//tc

always@(posedge clk or negedge reset_n)
	if (reset_n == 1'b0)begin
		 TC_cs_n <= 1;TC_wr_n <= 1;
		 TC_wr_addr <= 0;TC_din <= 0;
		 end
	else if(residual_intra4x4_state == `intra4x4_updat||residual_inter_state==`inter_updat)begin
		  TC_cs_n <= 0;TC_wr_n <= 0;
		  TC_wr_addr <= {mb_num_h[6:0],mb_num_v[0],intra4x4_pred_num};
		  TC_din <= res_0?0:TotalCoeff;
		 end
	else if(residual_intra16_state == `intra16_updat)begin
		  TC_cs_n <= 0;TC_wr_n <= 0;
		  TC_wr_addr <= {mb_num_h[6:0],mb_num_v[0],intra16_pred_num};
		  TC_din <= res_0?0:TotalCoeff;
		 end
		
		   
assign A_mb_num_h_4 = (intra4x4_pred_num == 0||intra4x4_pred_num == 2||intra4x4_pred_num == 8||intra4x4_pred_num == 10||intra4x4_pred_num[4] == 1)?
			(mb_num_h-1):mb_num_h;
assign A_mb_num_h_16 = (intra16_pred_num == 0||intra16_pred_num == 2||intra16_pred_num == 8||intra16_pred_num == 10||intra16_pred_num[4] == 1)?
			(mb_num_h-1):mb_num_h;
assign A_mb_num_h = (residual_intra16_state != `rst_residual_intra16)?A_mb_num_h_16:A_mb_num_h_4;
                  
always@(intra4x4_pred_num or intra16_pred_num or residual_intra16_state or residual_intra4x4_state)
	if(residual_intra4x4_state != `rst_residual_intra4x4)
		case(intra4x4_pred_num)
			0:Aintra4x4_pred_num=5;
			2:Aintra4x4_pred_num=7;
			8:Aintra4x4_pred_num=13;
			10:Aintra4x4_pred_num=15;
			4:Aintra4x4_pred_num=1;
			6:Aintra4x4_pred_num=3;
			12:Aintra4x4_pred_num=9;
			14:Aintra4x4_pred_num=11;
			18,19:Aintra4x4_pred_num=19;
			20,21:Aintra4x4_pred_num=21;
			22,23:Aintra4x4_pred_num=23;
			24,25:Aintra4x4_pred_num=25;
			default:Aintra4x4_pred_num=intra4x4_pred_num-1;
		endcase
	else if(residual_intra16_state != `rst_residual_intra16)
		case(intra16_pred_num)
			0:Aintra4x4_pred_num=5;
			2:Aintra4x4_pred_num=7;
			8:Aintra4x4_pred_num=13;
			10:Aintra4x4_pred_num=15;
			4:Aintra4x4_pred_num=1;
			6:Aintra4x4_pred_num=3;
			12:Aintra4x4_pred_num=9;
			14:Aintra4x4_pred_num=11;
			18,19:Aintra4x4_pred_num=19;
			20,21:Aintra4x4_pred_num=21;
			22,23:Aintra4x4_pred_num=23;
			24,25:Aintra4x4_pred_num=25;
			5'b11111:Aintra4x4_pred_num=5;
			default:Aintra4x4_pred_num=intra16_pred_num-1;
 		endcase
    
assign B_mb_num_v_4 = intra4x4_pred_num == 0||intra4x4_pred_num == 1||
                    intra4x4_pred_num == 4||intra4x4_pred_num == 5||
                    intra4x4_pred_num[4] == 1?(mb_num_v-1):mb_num_v;

assign B_mb_num_v_16 = intra16_pred_num == 0||intra16_pred_num == 1||
                     intra16_pred_num == 4||intra16_pred_num == 5||
                    (intra16_pred_num[4] == 1)?(mb_num_v-1):mb_num_v; 

assign B_mb_num_v = (residual_intra16_state != `rst_residual_intra16)?B_mb_num_v_16:B_mb_num_v_4;
                  
always@(intra4x4_pred_num or intra16_pred_num or residual_intra16_state or residual_intra4x4_state)
	if(residual_intra4x4_state != `rst_residual_intra4x4)
  		case(intra4x4_pred_num)
    		0:Bintra4x4_pred_num=10;
    		1:Bintra4x4_pred_num=11;
    		4:Bintra4x4_pred_num=14;
    		5:Bintra4x4_pred_num=15;
    		8:Bintra4x4_pred_num=2;
    		9:Bintra4x4_pred_num=3;
    		12:Bintra4x4_pred_num=6;
   		13:Bintra4x4_pred_num=7;
    		18,20:Bintra4x4_pred_num=20;
    		19,21:Bintra4x4_pred_num=21;
    		22,24:Bintra4x4_pred_num=24;
    		23,25:Bintra4x4_pred_num=25;
    		default:Bintra4x4_pred_num=intra4x4_pred_num-2;
  		endcase
	else if(residual_intra16_state != `rst_residual_intra16)
  		case(intra16_pred_num)
    		0:Bintra4x4_pred_num=10;
    		1:Bintra4x4_pred_num=11;
    		4:Bintra4x4_pred_num=14;
    		5:Bintra4x4_pred_num=15;
    		8:Bintra4x4_pred_num=2;
    		9:Bintra4x4_pred_num=3;
    		12:Bintra4x4_pred_num=6;
    		13:Bintra4x4_pred_num=7;
    		18,20:Bintra4x4_pred_num=20;
    		19,21:Bintra4x4_pred_num=21;
    		22,24:Bintra4x4_pred_num=24;
    		23,25:Bintra4x4_pred_num=25;
    		5'b11111:Bintra4x4_pred_num=10;
    		default:Bintra4x4_pred_num=intra16_pred_num-2;
  		endcase
  

assign C_mb_num_h = intra4x4_pred_num == 5?(mb_num_h+1):mb_num_h;
assign C_mb_num_v = intra4x4_pred_num == 5||intra4x4_pred_num == 1||
                    intra4x4_pred_num == 4||intra4x4_pred_num == 0?mb_num_v-1:mb_num_v;
             
always@(intra4x4_pred_num)
  	case(intra4x4_pred_num)
    	0:Cintra4x4_pred_num=11;
    	1:Cintra4x4_pred_num=14;
   	4:Cintra4x4_pred_num=15;
    	5:Cintra4x4_pred_num=10;
    	2:Cintra4x4_pred_num=1;
    	3:Cintra4x4_pred_num=4;
    	6:Cintra4x4_pred_num=5;
    	8:Cintra4x4_pred_num=3;
    	9:Cintra4x4_pred_num=6;
    	12:Cintra4x4_pred_num=7;
    	10:Cintra4x4_pred_num=9;
    	11:Cintra4x4_pred_num=12;
    	14:Cintra4x4_pred_num=13;
    	default:Cintra4x4_pred_num=0;
  	endcase
  

assign D_mb_num_h =  intra4x4_pred_num == 0||intra4x4_pred_num == 2||
                     intra4x4_pred_num == 8||intra4x4_pred_num == 10?(mb_num_h-1):mb_num_h; 
assign D_mb_num_v = intra4x4_pred_num == 5||intra4x4_pred_num == 1||
                    intra4x4_pred_num == 4||intra4x4_pred_num == 0?(mb_num_v-1):mb_num_v;
         
 always@(intra4x4_pred_num)
  	case(intra4x4_pred_num)
    	0:Dintra4x4_pred_num=16;
    	1:Dintra4x4_pred_num=10;
    	4:Dintra4x4_pred_num=11;
    	5:Dintra4x4_pred_num=14;
    	2:Dintra4x4_pred_num=5;
    	6:Dintra4x4_pred_num=1;
    	8:Dintra4x4_pred_num=7;
    	9:Dintra4x4_pred_num=2;
    	12:Dintra4x4_pred_num=3;
    	13:Dintra4x4_pred_num=6;
    	10:Dintra4x4_pred_num=13;
    	14:Dintra4x4_pred_num=9;
    	default:Dintra4x4_pred_num=intra4x4_pred_num-3;
  	endcase		  
  
endmodule
