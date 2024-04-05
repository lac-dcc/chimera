`include "timescale.v"
`include "define.v"

module Inter_average(
input clk,reset_n,
input enable_L0,enable_L1,
input [2:0] residual_inter_state,

input Inter_L0_end,Inter_L1_end,
input weighted_pred_en,

input [2:0] logWD,
input [7:0] pred_weight_table_w0,pred_weight_table_w1,
input [7:0] pred_weight_table_o0,pred_weight_table_o1,


input [7:0] inter_pred_output_00_L0,inter_pred_output_01_L0,inter_pred_output_02_L0,inter_pred_output_03_L0,
input [7:0] inter_pred_output_10_L0,inter_pred_output_11_L0,inter_pred_output_12_L0,inter_pred_output_13_L0,
input [7:0] inter_pred_output_20_L0,inter_pred_output_21_L0,inter_pred_output_22_L0,inter_pred_output_23_L0,
input [7:0] inter_pred_output_30_L0,inter_pred_output_31_L0,inter_pred_output_32_L0,inter_pred_output_33_L0,
input [7:0] inter_pred_output_00_L1,inter_pred_output_01_L1,inter_pred_output_02_L1,inter_pred_output_03_L1,
input [7:0] inter_pred_output_10_L1,inter_pred_output_11_L1,inter_pred_output_12_L1,inter_pred_output_13_L1,
input [7:0] inter_pred_output_20_L1,inter_pred_output_21_L1,inter_pred_output_22_L1,inter_pred_output_23_L1,
input [7:0] inter_pred_output_30_L1,inter_pred_output_31_L1,inter_pred_output_32_L1,inter_pred_output_33_L1,


output Inter_end,
output reg [7:0] inter_pred_output_00,inter_pred_output_01,inter_pred_output_02,inter_pred_output_03,
output reg [7:0] inter_pred_output_10,inter_pred_output_11,inter_pred_output_12,inter_pred_output_13,
output reg [7:0] inter_pred_output_20,inter_pred_output_21,inter_pred_output_22,inter_pred_output_23,
output reg [7:0] inter_pred_output_30,inter_pred_output_31,inter_pred_output_32,inter_pred_output_33



);

assign Inter_end = Inter_L0_end && Inter_L1_end ;

wire [7:0] inter_00,inter_01,inter_02,inter_03,inter_10,inter_11,inter_12,inter_13;
wire [7:0] inter_20,inter_21,inter_22,inter_23,inter_30,inter_31,inter_32,inter_33;

average average00(
	.L0(inter_pred_output_00_L0),.L1(inter_pred_output_00_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_00));

average average01(
	.L0(inter_pred_output_01_L0),.L1(inter_pred_output_01_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_01));

average average02(
	.L0(inter_pred_output_02_L0),.L1(inter_pred_output_02_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_02));

average average03(
	.L0(inter_pred_output_03_L0),.L1(inter_pred_output_03_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_03));

average average10(
	.L0(inter_pred_output_10_L0),.L1(inter_pred_output_10_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_10));

average average11(
	.L0(inter_pred_output_11_L0),.L1(inter_pred_output_11_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_11));

average average12(
	.L0(inter_pred_output_12_L0),.L1(inter_pred_output_12_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_12));

average average13(
	.L0(inter_pred_output_13_L0),.L1(inter_pred_output_13_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_13));

average average20(
	.L0(inter_pred_output_20_L0),.L1(inter_pred_output_20_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_20));

average average21(
	.L0(inter_pred_output_21_L0),.L1(inter_pred_output_21_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_21));

average average22(
	.L0(inter_pred_output_22_L0),.L1(inter_pred_output_22_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_22));

average average23(
	.L0(inter_pred_output_23_L0),.L1(inter_pred_output_23_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_23));

average average30(
	.L0(inter_pred_output_30_L0),.L1(inter_pred_output_30_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_30));

average average31(
	.L0(inter_pred_output_31_L0),.L1(inter_pred_output_31_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_31));

average average32(
	.L0(inter_pred_output_32_L0),.L1(inter_pred_output_32_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_32));

average average33(
	.L0(inter_pred_output_33_L0),.L1(inter_pred_output_33_L1),
	.logWD(logWD),.en(weighted_pred_en),
	.w0(pred_weight_table_w0),.w1(pred_weight_table_w1),
	.o0(pred_weight_table_o0),.o1(pred_weight_table_o1),
	.enable_L0(enable_L0),.enable_L1(enable_L1),
	.out(inter_33));


always@(posedge clk or negedge reset_n)
	if(reset_n == 1'b0)begin
		inter_pred_output_00 <= 0;inter_pred_output_01 <= 0;inter_pred_output_02 <= 0;inter_pred_output_03 <= 0;
		inter_pred_output_10 <= 0;inter_pred_output_11 <= 0;inter_pred_output_12 <= 0;inter_pred_output_13 <= 0;
		inter_pred_output_20 <= 0;inter_pred_output_21 <= 0;inter_pred_output_22 <= 0;inter_pred_output_23 <= 0;
		inter_pred_output_30 <= 0;inter_pred_output_31 <= 0;inter_pred_output_32 <= 0;inter_pred_output_33 <= 0;end
	else if(residual_inter_state == `inter_idct)begin
		inter_pred_output_00 <= inter_00;inter_pred_output_01 <= inter_01;
		inter_pred_output_02 <= inter_02;inter_pred_output_03 <= inter_03;
		inter_pred_output_10 <= inter_10;inter_pred_output_11 <= inter_11;
		inter_pred_output_12 <= inter_12;inter_pred_output_13 <= inter_13;
		inter_pred_output_20 <= inter_20;inter_pred_output_21 <= inter_21;
		inter_pred_output_22 <= inter_22;inter_pred_output_23 <= inter_23;
		inter_pred_output_30 <= inter_30;inter_pred_output_31 <= inter_31;
		inter_pred_output_32 <= inter_32;inter_pred_output_33 <= inter_33;end




endmodule

module average(
input [7:0] L0,L1,
input [2:0] logWD,
input [7:0] w0,w1,o0,o1,
input enable_L0,enable_L1,
input en,
output [7:0] out
);

reg signed [15:0] out_16;

wire signed [15:0] L0_s,L1_s,w0_s,w1_s,o0_s,o1_s;


assign L0_s = {8'b0,L0};
assign L1_s = {8'b0,L1};
assign w0_s = {{8{w0[7]}},w0};
assign w1_s = {{8{w1[7]}},w1};
assign o0_s = {{8{o0[7]}},o0};
assign o1_s = {{8{o1[7]}},o1};



always@(L0_s or L1_s or logWD or w0_s or w1_s or o0_s or o1_s or enable_L0 or enable_L1 or en)
	if(en == 0)
		case({enable_L0,enable_L1})
		2'b11: out_16 = (L0_s + L1_s + 16'b1) >> 1;
		2'b10: out_16 = L0_s;
		2'b01: out_16 = L1_s;
		default: out_16 = 0;
		endcase
	else
		case({enable_L0,enable_L1})
		2'b11: out_16 = ((L0_s*w0_s + L1_s*w1_s + 16'b1 << logWD) >> (logWD + 3'b1)) + 
			(o0_s + o1_s + 16'b1 ) >> 1;
		2'b10: out_16 = logWD == 0 ? L0_s*w0_s + o0_s:
			((L0_s * w0_s + 16'b1 << (logWD - 3'b1)) >> logWD) + o0_s;
		2'b01: out_16 = logWD == 0 ? L1_s*w1_s + o1_s:
			((L1_s * w1_s + 16'b1 << (logWD - 3'b1)) >> logWD) + o1_s;
		default: out_16 = 0;
		endcase
				

assign out = out_16[15] ? 0 : out_16 > 255 ? 8'd255 : out_16[7:0];

endmodule





