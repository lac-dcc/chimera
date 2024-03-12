`include "timescale.v"
`include "define.v"

module IDCT_4(
input clk,
input reset_n,
input [15:0] coeffLevel_0,coeffLevel_1,coeffLevel_2,coeffLevel_3,
input [15:0] coeffLevel_4,coeffLevel_5,coeffLevel_6,coeffLevel_7,
input [15:0] coeffLevel_8,coeffLevel_9,coeffLevel_10,coeffLevel_11,
input [15:0] coeffLevel_12,coeffLevel_13,coeffLevel_14,coeffLevel_15,
input [5:0] QPy,input [5:0] QPc,
input [4:0] intra4x4_pred_num,intra16_pred_num,
input [2:0] residual_intra4x4_state,residual_intra16_state,residual_inter_state,
output  [15:0] twod_output_00,twod_output_01,twod_output_02,twod_output_03,
output  [15:0] twod_output_10,twod_output_11,twod_output_12,twod_output_13,
output  [15:0] twod_output_20,twod_output_21,twod_output_22,twod_output_23,
output  [15:0] twod_output_30,twod_output_31,twod_output_32,twod_output_33,

output idct_end

);
parameter idct_rst  = 2'b00;
parameter idct_resc = 2'b01;
parameter idct_oned = 2'b10;
parameter idct_twod = 2'b11;

reg [1:0] state;


wire res_luma,resDC,resAC;
wire [20:0] coef_00_reg,coef_01,coef_02,coef_03,coef_10,coef_11,coef_12,coef_13;
wire [20:0] coef_20,coef_21,coef_22,coef_23,coef_30,coef_31,coef_32,coef_33;
reg [20:0] coef_00;
reg [20:0] shift_in00,shift_in01,shift_in02,shift_in03,shift_in10,shift_in11,shift_in12,shift_in13;
reg [20:0] shift_in20,shift_in21,shift_in22,shift_in23,shift_in30,shift_in31,shift_in32,shift_in33;
reg [20:0] idct_in00,idct_in01,idct_in02,idct_in03,idct_in10,idct_in11,idct_in12,idct_in13;
reg [20:0] idct_in20,idct_in21,idct_in22,idct_in23,idct_in30,idct_in31,idct_in32,idct_in33;
wire [20:0] idct_out00,idct_out01,idct_out02,idct_out03,idct_out10,idct_out11,idct_out12,idct_out13;
wire [20:0] idct_out20,idct_out21,idct_out22,idct_out23,idct_out30,idct_out31,idct_out32,idct_out33;
wire [20:0] product00,product01,product02,product03,product10,product11,product12,product13;
wire [20:0] product20,product21,product22,product23,product30,product31,product32,product33;
wire [20:0] product_0,product_1,product_2,product_3;
wire [5:0] QP ;

//reg [4:0] LevelScale_AC_02 [3:0];
reg [19:0] LevelScale_AC_02;
//reg [4:0] LevelScale_AC_13 [3:0];
reg [19:0] LevelScale_AC_13;
reg [4:0] LevelScale_DC;
wire [2:0] QPmod6;
wire [3:0] QPdiv6;
wire IsLeftShift;
reg [3:0] shift_len;
reg [20:0] cb_dc0,cb_dc1,cb_dc2,cb_dc3,cr_dc0,cr_dc1,cr_dc2,cr_dc3;
reg [20:0] intra16_dc00,intra16_dc01,intra16_dc02,intra16_dc03,intra16_dc10,intra16_dc11,intra16_dc12,intra16_dc13;
reg [20:0] intra16_dc20,intra16_dc21,intra16_dc22,intra16_dc23,intra16_dc30,intra16_dc31,intra16_dc32,intra16_dc33;

assign QP = (res_luma == 1'b1 || intra16_pred_num[4] == 0)? QPy:QPc;
mod6 mod6 (
		.qp(QP),
		.mod(QPmod6)
		);

div6 div6 (
		.qp(QP),
		.div(QPdiv6)
		);
	
always @ (resDC or QPdiv6 or res_luma)
	if (res_luma && resDC) //Intra16x16DC
		case (QPdiv6)
			4'b0000:shift_len = 2;	
			4'b0001:shift_len = 1;	
			default:shift_len = QPdiv6 - 2;
		endcase
   	 else if (resDC)						//ChromaDC
		case (QPdiv6)
			4'b0000:shift_len = 1;
			default:shift_len = QPdiv6 - 1;
		endcase
	else                             //AC
		shift_len = QPdiv6;

always@(QPmod6)
  case(QPmod6)
    3'b000:begin	
            LevelScale_AC_02[4:0] = 10; LevelScale_AC_02[9:5] = 13;
            LevelScale_AC_02[14:10] = 10; LevelScale_AC_02[19:15] = 13;
            LevelScale_AC_13[4:0] = 13; LevelScale_AC_13[9:5] = 16;
            LevelScale_AC_13[14:10] = 13; LevelScale_AC_13[19:15] = 16;	
          end	
		3'b001:begin	
            LevelScale_AC_02[4:0] = 11; LevelScale_AC_02[9:5] = 14;
            LevelScale_AC_02[14:10] = 11; LevelScale_AC_02[19:15] = 14;
            LevelScale_AC_13[4:0] = 14; LevelScale_AC_13[9:5] = 18;
            LevelScale_AC_13[14:10] = 14; LevelScale_AC_13[19:15] = 18;	
          end
  		3'b010:begin	
            LevelScale_AC_02[4:0] = 13; LevelScale_AC_02[9:5] = 16;
            LevelScale_AC_02[14:10] = 13; LevelScale_AC_02[19:15] = 16;
            LevelScale_AC_13[4:0] = 16; LevelScale_AC_13[9:5] = 20;
            LevelScale_AC_13[14:10] = 16; LevelScale_AC_13[19:15] = 20;	
          end
		3'b011:begin	
            LevelScale_AC_02[4:0] = 14; LevelScale_AC_02[9:5] = 18;
            LevelScale_AC_02[14:10] = 14; LevelScale_AC_02[19:15] = 18;
            LevelScale_AC_13[4:0] = 18; LevelScale_AC_13[9:5] = 23;
            LevelScale_AC_13[14:10] = 18; LevelScale_AC_13[19:15] = 23;	
          end
		3'b100:begin	
            LevelScale_AC_02[4:0] = 16; LevelScale_AC_02[9:5] = 20;
            LevelScale_AC_02[14:10] = 16; LevelScale_AC_02[19:15] = 20;
            LevelScale_AC_13[4:0] = 20; LevelScale_AC_13[9:5] = 25;
            LevelScale_AC_13[14:10] = 20; LevelScale_AC_13[19:15] = 25;	
          end
		3'b101:begin	
            LevelScale_AC_02[4:0] = 18; LevelScale_AC_02[9:5] = 23;
            LevelScale_AC_02[14:10] = 18; LevelScale_AC_02[19:15] = 23;
            LevelScale_AC_13[4:0] = 23; LevelScale_AC_13[9:5] = 29;
            LevelScale_AC_13[14:10] = 23; LevelScale_AC_13[19:15] = 29;	
          end
		default:begin	
            LevelScale_AC_02[4:0] = 0; LevelScale_AC_02[9:5] = 0;
            LevelScale_AC_02[14:10] = 0; LevelScale_AC_02[19:15] = 0;
            LevelScale_AC_13[4:0] = 0; LevelScale_AC_13[9:5] = 0;
            LevelScale_AC_13[14:10] = 0; LevelScale_AC_13[19:15] = 0;	
          end
	endcase
	
always @ (resDC or QPmod6)
	if (resDC == 1'b1)
		case (QPmod6)
		0:LevelScale_DC = 10;    
		1:LevelScale_DC = 11;
		2:LevelScale_DC = 13;
		3:LevelScale_DC = 14;
		4:LevelScale_DC = 16;
		5:LevelScale_DC = 18;
		default:LevelScale_DC = 0;
		endcase
	else
		LevelScale_DC = 0;
			


			

assign res_luma = (intra4x4_pred_num[4]==0&&
	(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state != `rst_residual_inter))
	||(intra16_pred_num == 5'b11111)&&
			residual_intra16_state != `rst_residual_intra16;

assign resDC = intra4x4_pred_num == 5'd16||intra4x4_pred_num == 5'd17||
	       intra16_pred_num == 5'd16||intra16_pred_num == 5'd17||
	       (intra16_pred_num == 5'b11111&&residual_intra16_state != `rst_residual_intra16);
assign resAC = (res_luma == 0)&&(resDC == 0);
assign idct_end = (resDC&&state == idct_resc)||(resDC==0&&state == idct_twod);
assign IsLeftShift = resDC?(res_luma?(QPy < 12? 1'b0:1'b1):(QPc < 6? 1'b0:1'b1)):1'b1;


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)
		state <= idct_rst;
	else if(residual_intra4x4_state == `intra4x4_idct||residual_intra16_state == `intra16_idct
		||residual_inter_state == `inter_idct)begin
	if(resDC)
		case(state)
		idct_rst : state <= idct_oned;
		idct_oned: state <= res_luma?idct_twod:idct_resc;
		idct_twod: state <= idct_resc;
		idct_resc: state <= idct_rst; 
		default :  state <= idct_rst;
		endcase
	else
		case(state)
		idct_rst : state <= idct_resc;
		idct_resc: state <= idct_oned;
		idct_oned: state <= idct_twod;
		idct_twod: state <= idct_rst; 
		default :  state <= idct_rst;
		endcase
	end

always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
		shift_in00<=0;shift_in01<=0;shift_in02<=0;shift_in03<=0;
		shift_in10<=0;shift_in11<=0;shift_in12<=0;shift_in13<=0;
		shift_in20<=0;shift_in21<=0;shift_in22<=0;shift_in23<=0;
		shift_in30<=0;shift_in31<=0;shift_in32<=0;shift_in33<=0;end
	else if(resDC&&state == idct_resc)
		if(res_luma)begin
		shift_in00<=product_0;shift_in01<=idct_out10*{1'b0,LevelScale_DC};
		shift_in02<=idct_out20*{1'b0,LevelScale_DC};shift_in03<=idct_out30*{1'b0,LevelScale_DC};
		shift_in10<=product_1;shift_in11<=idct_out11*{1'b0,LevelScale_DC};
		shift_in12<=idct_out21*{1'b0,LevelScale_DC};shift_in13<=idct_out31*{1'b0,LevelScale_DC};
		shift_in20<=product_2;shift_in21<=idct_out12*{1'b0,LevelScale_DC};
		shift_in22<=idct_out22*{1'b0,LevelScale_DC};shift_in23<=idct_out32*{1'b0,LevelScale_DC};
		shift_in30<=product_3;shift_in31<=idct_out13*{1'b0,LevelScale_DC};
		shift_in32<=idct_out23*{1'b0,LevelScale_DC};shift_in33<=idct_out33*{1'b0,LevelScale_DC};end
		else begin 
		shift_in00<=product_0;shift_in01<=product_1;shift_in02<=product_2;shift_in03<=product_3;
		shift_in10<=0;shift_in11<=0;shift_in12<=0;shift_in13<=0;
		shift_in20<=0;shift_in21<=0;shift_in22<=0;shift_in23<=0;
		shift_in30<=0;shift_in31<=0;shift_in32<=0;shift_in33<=0;end

	else if(resDC==0&&state == idct_resc)begin
	shift_in00<=product00;shift_in01<=product01;shift_in02<=product02;shift_in03<=product03;
	shift_in10<=product10;shift_in11<=product11;shift_in12<=product12;shift_in13<=product13;
	shift_in20<=product20;shift_in21<=product21;shift_in22<=product22;shift_in23<=product23;
	shift_in30<=product30;shift_in31<=product31;shift_in32<=product32;shift_in33<=product33;end


always @ (posedge clk or negedge reset_n)
	if (reset_n == 0)begin
	idct_in00<=0;idct_in01<=0;idct_in02<=0;idct_in03<=0;
	idct_in10<=0;idct_in11<=0;idct_in12<=0;idct_in13<=0;
	idct_in20<=0;idct_in21<=0;idct_in22<=0;idct_in23<=0;
	idct_in30<=0;idct_in31<=0;idct_in32<=0;idct_in33<=0;end
	else if(resDC)begin
		if(res_luma)begin
		case(state)
		idct_oned:begin
		idct_in00<={{5{coeffLevel_0[15]}},coeffLevel_0};idct_in01<={{5{coeffLevel_1[15]}},coeffLevel_1};
		idct_in02<={{5{coeffLevel_5[15]}},coeffLevel_5};idct_in03<={{5{coeffLevel_6[15]}},coeffLevel_6};
		idct_in10<={{5{coeffLevel_2[15]}},coeffLevel_2};idct_in11<={{5{coeffLevel_4[15]}},coeffLevel_4};
		idct_in12<={{5{coeffLevel_7[15]}},coeffLevel_7};idct_in13<={{5{coeffLevel_12[15]}},coeffLevel_12};
		idct_in20<={{5{coeffLevel_3[15]}},coeffLevel_3};idct_in21<={{5{coeffLevel_8[15]}},coeffLevel_8};
		idct_in22<={{5{coeffLevel_11[15]}},coeffLevel_11};idct_in23<={{5{coeffLevel_13[15]}},coeffLevel_13};
		idct_in30<={{5{coeffLevel_9[15]}},coeffLevel_9};idct_in31<={{5{coeffLevel_10[15]}},coeffLevel_10};
		idct_in32<={{5{coeffLevel_14[15]}},coeffLevel_14};idct_in33<={{5{coeffLevel_15[15]}},coeffLevel_15};end
		idct_twod:begin
		idct_in00<=idct_out00;idct_in01<=idct_out10;idct_in02<=idct_out20;idct_in03<=idct_out30;
		idct_in10<=idct_out01;idct_in11<=idct_out11;idct_in12<=idct_out21;idct_in13<=idct_out31;
		idct_in20<=idct_out02;idct_in21<=idct_out12;idct_in22<=idct_out22;idct_in23<=idct_out32;
		idct_in30<=idct_out03;idct_in31<=idct_out13;idct_in32<=idct_out23;idct_in33<=idct_out33;end
		default:;
		endcase
		end
		else 
		if(state == idct_oned)begin
		idct_in00<={{5{coeffLevel_0[15]}},coeffLevel_0};idct_in01<={{5{coeffLevel_1[15]}},coeffLevel_1};
		idct_in02<={{5{coeffLevel_2[15]}},coeffLevel_2};idct_in03<={{5{coeffLevel_3[15]}},coeffLevel_3};
		idct_in10<=0;idct_in11<=0;idct_in12<=0;idct_in13<=0;
		idct_in20<=0;idct_in21<=0;idct_in22<=0;idct_in23<=0;
		idct_in30<=0;idct_in31<=0;idct_in32<=0;idct_in33<=0;end
	end
	else if(resDC==0)
	case(state)
	idct_oned:begin
		idct_in00<=coef_00;idct_in01<=coef_01;idct_in02<=coef_02;idct_in03<=coef_03;
		idct_in10<=coef_10;idct_in11<=coef_11;idct_in12<=coef_12;idct_in13<=coef_13;
		idct_in20<=coef_20;idct_in21<=coef_21;idct_in22<=coef_22;idct_in23<=coef_23;
		idct_in30<=coef_30;idct_in31<=coef_31;idct_in32<=coef_32;idct_in33<=coef_33;end
	idct_twod:begin
		idct_in00<=idct_out00;idct_in01<=idct_out10;idct_in02<=idct_out20;idct_in03<=idct_out30;
		idct_in10<=idct_out01;idct_in11<=idct_out11;idct_in12<=idct_out21;idct_in13<=idct_out31;
		idct_in20<=idct_out02;idct_in21<=idct_out12;idct_in22<=idct_out22;idct_in23<=idct_out32;
		idct_in30<=idct_out03;idct_in31<=idct_out13;idct_in32<=idct_out23;idct_in33<=idct_out33;end
	default:;
	endcase

always@(coef_00_reg or coef_01 or coef_02 or coef_03 or intra4x4_pred_num or intra16_pred_num)
	if(intra4x4_pred_num == 16||intra16_pred_num == 16)begin
		cb_dc0 = coef_00_reg;cb_dc1 = coef_03;
		cb_dc2 = coef_01;cb_dc3 = coef_02;end
	else if(intra4x4_pred_num == 17||intra16_pred_num == 17)begin
    		cr_dc0 = coef_00_reg;cr_dc1 = coef_03;
    		cr_dc2 = coef_01;cr_dc3 = coef_02;end			
			
wire [20:0] twod_output_00_c,twod_output_01_c,twod_output_02_c,twod_output_03_c;
wire [20:0] twod_output_10_c,twod_output_11_c,twod_output_12_c,twod_output_13_c;
wire [20:0] twod_output_20_c,twod_output_21_c,twod_output_22_c,twod_output_23_c;
wire [20:0] twod_output_30_c,twod_output_31_c,twod_output_32_c,twod_output_33_c;

assign twod_output_00_c = (idct_out00+21'd32);
assign twod_output_01_c = (idct_out10+21'd32);
assign twod_output_02_c = (idct_out20+21'd32);
assign twod_output_03_c = (idct_out30+21'd32);
assign twod_output_10_c = (idct_out01+21'd32);
assign twod_output_11_c = (idct_out11+21'd32);
assign twod_output_12_c = (idct_out21+21'd32);
assign twod_output_13_c = (idct_out31+21'd32);
assign twod_output_20_c = (idct_out02+21'd32);
assign twod_output_21_c = (idct_out12+21'd32);
assign twod_output_22_c = (idct_out22+21'd32);
assign twod_output_23_c = (idct_out32+21'd32);
assign twod_output_30_c = (idct_out03+21'd32);
assign twod_output_31_c = (idct_out13+21'd32);
assign twod_output_32_c = (idct_out23+21'd32);
assign twod_output_33_c = (idct_out33+21'd32);

assign twod_output_00 = {twod_output_00_c[20],twod_output_00_c[20:6]};
assign twod_output_01 = {twod_output_01_c[20],twod_output_01_c[20:6]};
assign twod_output_02 = {twod_output_02_c[20],twod_output_02_c[20:6]};
assign twod_output_03 = {twod_output_03_c[20],twod_output_03_c[20:6]};
assign twod_output_10 = {twod_output_10_c[20],twod_output_10_c[20:6]};
assign twod_output_11 = {twod_output_11_c[20],twod_output_11_c[20:6]};
assign twod_output_12 = {twod_output_12_c[20],twod_output_12_c[20:6]};
assign twod_output_13 = {twod_output_13_c[20],twod_output_13_c[20:6]};
assign twod_output_20 = {twod_output_20_c[20],twod_output_20_c[20:6]};
assign twod_output_21 = {twod_output_21_c[20],twod_output_21_c[20:6]};
assign twod_output_22 = {twod_output_22_c[20],twod_output_22_c[20:6]};
assign twod_output_23 = {twod_output_23_c[20],twod_output_23_c[20:6]};
assign twod_output_30 = {twod_output_30_c[20],twod_output_30_c[20:6]};
assign twod_output_31 = {twod_output_31_c[20],twod_output_31_c[20:6]};
assign twod_output_32 = {twod_output_32_c[20],twod_output_32_c[20:6]};
assign twod_output_33 = {twod_output_33_c[20],twod_output_33_c[20:6]};
	
assign product00 = resAC?0:{{5{coeffLevel_0[15]}},coeffLevel_0} * {1'b0,LevelScale_AC_02[4:0]};
assign product01 = resAC?{{5{coeffLevel_0[15]}},coeffLevel_0} * {1'b0,LevelScale_AC_13[4:0]}:{{5{coeffLevel_1[15]}},coeffLevel_1} * {1'b0,LevelScale_AC_13[4:0]};
assign product02 = resAC?{{5{coeffLevel_4[15]}},coeffLevel_4} * {1'b0,LevelScale_AC_02[4:0]}:{{5{coeffLevel_5[15]}},coeffLevel_5} * {1'b0,LevelScale_AC_02[4:0]};
assign product03 = resAC?{{5{coeffLevel_5[15]}},coeffLevel_5} * {1'b0,LevelScale_AC_13[4:0]}:{{5{coeffLevel_6[15]}},coeffLevel_6} * {1'b0,LevelScale_AC_13[4:0]};
assign product10 = resAC?{{5{coeffLevel_1[15]}},coeffLevel_1} * {1'b0,LevelScale_AC_02[9:5]}:{{5{coeffLevel_2[15]}},coeffLevel_2} * {1'b0,LevelScale_AC_02[9:5]};
assign product11 = resAC?{{5{coeffLevel_3[15]}},coeffLevel_3} * {1'b0,LevelScale_AC_13[9:5]}:{{5{coeffLevel_4[15]}},coeffLevel_4} * {1'b0,LevelScale_AC_13[9:5]};
assign product12 = resAC?{{5{coeffLevel_6[15]}},coeffLevel_6} * {1'b0,LevelScale_AC_02[9:5]}:{{5{coeffLevel_7[15]}},coeffLevel_7} * {1'b0,LevelScale_AC_02[9:5]};
assign product13 = resAC?{{5{coeffLevel_11[15]}},coeffLevel_11} * {1'b0,LevelScale_AC_13[9:5]}:{{5{coeffLevel_12[15]}},coeffLevel_12} * {1'b0,LevelScale_AC_13[9:5]};
assign product20 = resAC?{{5{coeffLevel_2[15]}},coeffLevel_2} * {1'b0,LevelScale_AC_02[14:10]}:{{5{coeffLevel_3[15]}},coeffLevel_3} * {1'b0,LevelScale_AC_02[14:10]};
assign product21 = resAC?{{5{coeffLevel_7[15]}},coeffLevel_7} * {1'b0,LevelScale_AC_13[14:10]}:{{5{coeffLevel_8[15]}},coeffLevel_8} * {1'b0,LevelScale_AC_13[14:10]};
assign product22 = resAC?{{5{coeffLevel_10[15]}},coeffLevel_10} * {1'b0,LevelScale_AC_02[14:10]}:{{5{coeffLevel_11[15]}},coeffLevel_11} * {1'b0,LevelScale_AC_02[14:10]};
assign product23 = resAC?{{5{coeffLevel_12[15]}},coeffLevel_12} * {1'b0,LevelScale_AC_13[14:10]}:{{5{coeffLevel_13[15]}},coeffLevel_13} * {1'b0,LevelScale_AC_13[14:10]};
assign product30 = resAC?{{5{coeffLevel_8[15]}},coeffLevel_8} * {1'b0,LevelScale_AC_02[19:15]}:{{5{coeffLevel_9[15]}},coeffLevel_9} * {1'b0,LevelScale_AC_02[19:15]};
assign product31 = resAC?{{5{coeffLevel_9[15]}},coeffLevel_9} * {1'b0,LevelScale_AC_13[19:15]}:{{5{coeffLevel_10[15]}},coeffLevel_10} * {1'b0,LevelScale_AC_13[19:15]};
assign product32 = resAC?{{5{coeffLevel_13[15]}},coeffLevel_13} * {1'b0,LevelScale_AC_02[19:15]}:{{5{coeffLevel_14[15]}},coeffLevel_14} * {1'b0,LevelScale_AC_02[19:15]};
assign product33 = resAC?{{5{coeffLevel_14[15]}},coeffLevel_14} * {1'b0,LevelScale_AC_13[19:15]}:{{5{coeffLevel_15[15]}},coeffLevel_15} * {1'b0,LevelScale_AC_13[19:15]};	

assign product_0 = idct_out00*{1'b0,LevelScale_DC};
assign product_1 = idct_out01*{1'b0,LevelScale_DC};
assign product_2 = idct_out02*{1'b0,LevelScale_DC};
assign product_3 = idct_out03*{1'b0,LevelScale_DC};
always@(intra4x4_pred_num or cb_dc0 or cb_dc1 or cb_dc2 or cb_dc3 or 
        cr_dc0 or cr_dc1 or cr_dc2 or cr_dc3 or coef_00_reg or intra16_pred_num or intra16_dc00 or intra16_dc01 or intra16_dc02 or intra16_dc03 or intra16_dc10 or intra16_dc11
	 or intra16_dc12 or intra16_dc13 or intra16_dc20 or intra16_dc21 or intra16_dc22 or intra16_dc23 or intra16_dc30
	 or intra16_dc31 or intra16_dc32 or intra16_dc33 or residual_intra4x4_state or residual_inter_state or residual_intra16_state)
	if(residual_intra4x4_state != `rst_residual_intra4x4||residual_inter_state != `rst_residual_inter)
        case(intra4x4_pred_num)
          18: coef_00 = cb_dc0;
          19: coef_00 = cb_dc1;
          20: coef_00 = cb_dc2;
          21: coef_00 = cb_dc3;
          22: coef_00 = cr_dc0;
          23: coef_00 = cr_dc1;
          24: coef_00 = cr_dc2;
          25: coef_00 = cr_dc3;
          default:coef_00 = coef_00_reg;
        endcase
	else if(residual_intra16_state != `rst_residual_intra16)
	case(intra16_pred_num)
	0:coef_00 = intra16_dc00;
	1:coef_00 = intra16_dc01;
	2:coef_00 = intra16_dc10;
	3:coef_00 = intra16_dc11;
	4:coef_00 = intra16_dc02;
	5:coef_00 = intra16_dc03;
	6:coef_00 = intra16_dc12;
	7:coef_00 = intra16_dc13;
	8:coef_00 = intra16_dc20;
	9:coef_00 = intra16_dc21;
	10:coef_00 = intra16_dc30;
	11:coef_00 = intra16_dc31;
	12:coef_00 = intra16_dc22;
	13:coef_00 = intra16_dc23;
	14:coef_00 = intra16_dc32;
	15:coef_00 = intra16_dc33;
        18: coef_00 = cb_dc0;
        19: coef_00 = cb_dc1;
        20: coef_00 = cb_dc2;
        21: coef_00 = cb_dc3;
        22: coef_00 = cr_dc0;
        23: coef_00 = cr_dc1;
        24: coef_00 = cr_dc2;
        25: coef_00 = cr_dc3;
        default:coef_00 = coef_00_reg;
	endcase




always@(intra16_pred_num or coef_00_reg or coef_01 or coef_02 or coef_03
		 or coef_10 or coef_11 or coef_12 or coef_13 or coef_20 or coef_21 or coef_22
		 or coef_23 or coef_30 or coef_31 or coef_32 or coef_33)
	if(intra16_pred_num==5'b11111)begin
	intra16_dc00=coef_00_reg;intra16_dc01=coef_01;intra16_dc02=coef_02;intra16_dc03=coef_03;
	intra16_dc10=coef_10;intra16_dc11=coef_11;intra16_dc12=coef_12;intra16_dc13=coef_13;
	intra16_dc20=coef_20;intra16_dc21=coef_21;intra16_dc22=coef_22;intra16_dc23=coef_23;
	intra16_dc30=coef_30;intra16_dc31=coef_31;intra16_dc32=coef_32;intra16_dc33=coef_33;end


rescale_shift rescale_shift00 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in00),
		.shift_len(shift_len),
		.shift_output(coef_00_reg)
		);	
rescale_shift rescale_shift01 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in01),
		.shift_len(shift_len),
		.shift_output(coef_01)
		);
rescale_shift rescale_shift02 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in02),
		.shift_len(shift_len),
		.shift_output(coef_02)
		);
rescale_shift rescale_shift03 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in03),
		.shift_len(shift_len),
		.shift_output(coef_03)
		);
rescale_shift rescale_shift10 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in10),
		.shift_len(shift_len),
		.shift_output(coef_10)
		);
rescale_shift rescale_shift11 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in11),
		.shift_len(shift_len),
		.shift_output(coef_11)
		);
rescale_shift rescale_shift12 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in12),
		.shift_len(shift_len),
		.shift_output(coef_12)
		);	
rescale_shift rescale_shift13 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in13),
		.shift_len(shift_len),
		.shift_output(coef_13)
		);
rescale_shift rescale_shift20 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in20),
		.shift_len(shift_len),
		.shift_output(coef_20)
		);
rescale_shift rescale_shift21 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in21),
		.shift_len(shift_len),
		.shift_output(coef_21)
		);
rescale_shift rescale_shift22 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in22),
		.shift_len(shift_len),
		.shift_output(coef_22)
		);
rescale_shift rescale_shift23 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in23),
		.shift_len(shift_len),
		.shift_output(coef_23)
		);
rescale_shift rescale_shift30 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in30),
		.shift_len(shift_len),
		.shift_output(coef_30)
		);
rescale_shift rescale_shift31 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in31),
		.shift_len(shift_len),
		.shift_output(coef_31)
		);
rescale_shift rescale_shift32 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in32),
		.shift_len(shift_len),
		.shift_output(coef_32)
		);
rescale_shift rescale_shift33 (
		.IsLeftShift(IsLeftShift),
		.shift_input(shift_in33),
		.shift_len(shift_len),
		.shift_output(coef_33)
		);
 

butterfly butterfly_1d0(
		.D0(idct_in00),
		.D1(idct_in01),
		.D2(idct_in02),
		.D3(idct_in03),
		.F0(idct_out00),
		.F1(idct_out01),
		.F2(idct_out02),
		.F3(idct_out03),
		.IsHadamard(resDC)
		);
butterfly butterfly_1d1(
		.D0(idct_in10),
		.D1(idct_in11),
		.D2(idct_in12),
		.D3(idct_in13),
		.F0(idct_out10),
		.F1(idct_out11),
		.F2(idct_out12),
		.F3(idct_out13),
		.IsHadamard(resDC)
		);
butterfly butterfly_1d2(
		.D0(idct_in20),
		.D1(idct_in21),
		.D2(idct_in22),
		.D3(idct_in23),
		.F0(idct_out20),
		.F1(idct_out21),
		.F2(idct_out22),
		.F3(idct_out23),
		.IsHadamard(resDC)
		);
butterfly butterfly_1d3(
		.D0(idct_in30),
		.D1(idct_in31),
		.D2(idct_in32),
		.D3(idct_in33),
		.F0(idct_out30),
		.F1(idct_out31),
		.F2(idct_out32),
		.F3(idct_out33),
		.IsHadamard(resDC)
		);

endmodule


module rescale_shift (IsLeftShift,shift_input,shift_len,shift_output);
	input IsLeftShift;
	input signed [20:0] shift_input;
	input [3:0] shift_len;
	output signed [20:0] shift_output;
	
	assign shift_output = (IsLeftShift == 1'b1)? (shift_input <<< shift_len):(shift_input >>> shift_len);
endmodule


module mod6 (qp,mod);
	input [5:0] qp;
	output [2:0] mod;
	reg [2:0] mod;
	always @ (qp)
		case (qp)
			0, 6,12,18,24,30,36,42,48:mod = 3'b000;
			1, 7,13,19,25,31,37,43,49:mod = 3'b001;
			2, 8,14,20,26,32,38,44,50:mod = 3'b010;
			3, 9,15,21,27,33,39,45,51:mod = 3'b011;
			4,10,16,22,28,34,40,46   :mod = 3'b100;
			5,11,17,23,29,35,41,47   :mod = 3'b101;
			default                  :mod = 3'b000;
		endcase
endmodule

module div6 (qp,div);
	input [5:0] qp;
	output [3:0] div;
	reg [3:0] div;
	always @ (qp)
		case (qp)
			0, 1, 2, 3, 4, 5 :div = 4'b0000;
			6, 7, 8, 9, 10,11:div = 4'b0001;
			12,13,14,15,16,17:div = 4'b0010;
			18,19,20,21,22,23:div = 4'b0011;
			24,25,26,27,28,29:div = 4'b0100;
			30,31,32,33,34,35:div = 4'b0101;
			36,37,38,39,40,41:div = 4'b0110;
			42,43,44,45,46,47:div = 4'b0111;
			48,49,50,51      :div = 4'b1000;
			default          :div = 0;
		endcase
endmodule

module butterfly (D0,D1,D2,D3,F0,F1,F2,F3,IsHadamard);
	input [20:0] D0,D1,D2,D3;
	input IsHadamard;
	output [20:0] F0,F1,F2,F3;
	
	wire [20:0] T0,T1,T2,T3;
	wire [20:0] D1_scale,D3_scale;
	
	assign D1_scale = (IsHadamard == 1'b1)? D1:{D1[20],D1[20:1]};
	assign D3_scale = (IsHadamard == 1'b1)? D3:{D3[20],D3[20:1]};
	
	assign T0 = D0 + D2;
	assign T1 = D0 - D2; 
	assign T2 = D1_scale - D3;
	assign T3 = D1 + D3_scale;
	
	assign F0 = T0 + T3;
	assign F1 = T1 + T2;
	assign F2 = T1 - T2;
	assign F3 = T0 - T3;
endmodule
