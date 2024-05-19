// This program was cloned from: https://github.com/manish-kj/PACoGen
// License: BSD 3-Clause "New" or "Revised" License

`timescale 1ns / 1ps
module add_N32_ES6_PIPE(clk, in1, in2, start, out, inf, zero, done);

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N = 32;
parameter Bs = log2(N); 
parameter es = 6;


input clk;
input [N-1:0] in1, in2;
input start; 
output reg [N-1:0] out;
output reg inf, zero;
output reg done;

wire start0= start;
wire s1 = in1[N-1];
wire s2 = in2[N-1];
wire zero_tmp1 = |in1[N-2:0];
wire zero_tmp2 = |in2[N-2:0];
wire inf1 = in1[N-1] & (~zero_tmp1),
	inf2 = in2[N-1] & (~zero_tmp2);
wire zero1 = ~(in1[N-1] | zero_tmp1),
	zero2 = ~(in2[N-1] | zero_tmp2);
wire inf_t = inf1 | inf2,
	zero_t = zero1 & zero2;


//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2;
wire [es-1:0] e1, e2;
wire [N-es-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
wire in1_gt_in2 = (xin1[N-2:0] >= xin2[N-2:0]) ? 1'b1 : 1'b0;
data_extract_N32_ES6 #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1));
data_extract_N32_ES6 #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2));

wire [N-es:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

reg start_r0; 
reg in1_gt_in2_r0, s1_r0, s2_r0, inf_r0, zero_r0, rc1_r0, rc2_r0;
reg [Bs-1:0] regime1_r0, regime2_r0;
reg [es-1:0] e1_r0, e2_r0;
reg [N-es:0] m1_r0, m2_r0;

always @(posedge clk) begin
start_r0 <= start0; in1_gt_in2_r0 <= in1_gt_in2; s1_r0 <= s1; s2_r0 <= s2; 
inf_r0 <= inf_t; zero_r0 <= zero_t; rc1_r0 <= rc1; rc2_r0 <= rc2;
regime1_r0 <= regime1; regime2_r0 <= regime2; 
e1_r0 <= e1; e2_r0 <= e2;
m1_r0 <= m1; m2_r0 <= m2;
end

//Large Checking and Assignment
wire ls = in1_gt_in2_r0 ? s1_r0 : s2_r0;
wire op = s1_r0 ~^ s2_r0;

wire lrc = in1_gt_in2_r0 ? rc1_r0 : rc2_r0;
wire src = in1_gt_in2_r0 ? rc2_r0 : rc1_r0;

wire [Bs-1:0] lr = in1_gt_in2_r0 ? regime1_r0 : regime2_r0;
wire [Bs-1:0] sr = in1_gt_in2_r0 ? regime2_r0 : regime1_r0;

wire [es-1:0] le = in1_gt_in2_r0 ? e1_r0 : e2_r0;
wire [es-1:0] se = in1_gt_in2_r0 ? e2_r0 : e1_r0;

wire [N-es:0] lm = in1_gt_in2_r0 ? m1_r0 : m2_r0;
wire [N-es:0] sm = in1_gt_in2_r0 ? m2_r0 : m1_r0;

//Exponent Difference: Lower Mantissa Right Shift Amount
wire [es+Bs+1:0] diff;
assign diff = {lrc ? {2'b0,lr} : -lr,le} - {src ? {2'b0,sr} : -sr, se};
wire [Bs-1:0] exp_diff = (|diff[es+Bs:Bs]) ? {Bs{1'b1}} : diff[Bs-1:0];

//DSR Right Shifting
wire [N-1:0] DSR_right_in = {sm,5'b0};
wire [N-1:0] DSR_right_out;
wire [Bs-1:0] DSR_e_diff  = exp_diff;
DSR_right_N_S #(.N(N), .S(Bs))  dsr1(.a(DSR_right_in), .b(DSR_e_diff), .c(DSR_right_out));

reg start_r1;
reg ls_r1, op_r1, lrc_r1, inf_r1, zero_r1;
reg [Bs-1:0] lr_r1;
reg [es-1:0] le_r1;
reg [N-es:0] lm_r1;
reg [N-1:0] DSR_right_out_r1;
always @(posedge clk) begin
start_r1 <= start_r0; ls_r1 <= ls; op_r1 <= op; inf_r1 <= inf_r0; zero_r1 <= zero_r0;
lrc_r1 <= lrc;
le_r1 <= le;
lr_r1 <= lr;
lm_r1 <= lm;
DSR_right_out_r1 <= DSR_right_out;
end

//Mantissa Addition
wire [N-1:0] add_m_in1 = {lm_r1,5'b0};
wire [N:0] add_m;
add_sub_N #(.N(N)) uut_add_sub_N (op_r1, add_m_in1, DSR_right_out_r1, add_m);
wire [1:0] mant_ovf = add_m[N:N-1];

//LOD
wire [N-1:0] LOD_in = {(add_m[N] | add_m[N-1]), add_m[N-2:0]};
wire [Bs-1:0] left_shift;
LOD_32 l2(.in(LOD_in), .out(left_shift));


reg start_r2;
reg ls_r2, lrc_r2, inf_r2, zero_r2;
reg [Bs-1:0] lr_r2, left_shift_r2;
reg [es-1:0] le_r2;
reg [N:0] add_m_r2;
reg [1:0] mant_ovf_r2;
always @(posedge clk) begin
start_r2 <= start_r1; ls_r2 <= ls_r1; inf_r2 <= inf_r1; zero_r2 <= zero_r1;
lrc_r2 <= lrc_r1; lr_r2 <= lr_r1; le_r2 <= le_r1;
left_shift_r2 <= left_shift;
add_m_r2 <= add_m;
mant_ovf_r2 <= mant_ovf;
end

//DSR Left Shifting
wire [N-1:0] DSR_left_out_t;
DSR_left_N_S #(.N(N), .S(Bs)) dsl1(.a(add_m_r2[N:1]), .b(left_shift_r2), .c(DSR_left_out_t));
wire [N-1:0] DSR_left_out = DSR_left_out_t[N-1] ? DSR_left_out_t[N-1:0] : {DSR_left_out_t[N-2:0],1'b0}; 


//Exponent and Regime Computation
wire [Bs:0] lr_N = lrc_r2 ? {1'b0,lr_r2} : -{1'b0,lr_r2};
wire [es+Bs+1:0] le_o_tmp, le_o;
sub_N #(.N(es+Bs+1)) sub3 ({lr_N,le_r2}, {{es+1{1'b0}},left_shift_r2}, le_o_tmp);
add_mantovf #(es+Bs+1) uut_add_mantovf (le_o_tmp, mant_ovf_r2[1], le_o);

wire [es+Bs:0] le_oN = le_o[es+Bs] ? -le_o : le_o;
wire [es-1:0] e_o = le_o[es-1:0];
wire [Bs-1:0] r_o = (~le_o[es+Bs] || (|le_o[es-1:0])) + le_oN[es+Bs-1:es];

//Exponent and Mantissa Packing
wire [2*N-1+3:0] tmp_o;
assign tmp_o = { {N{~le_o[es+Bs]}}, le_o[es+Bs], e_o, DSR_left_out[N-2:4], |DSR_left_out[3:0]};

reg start_r3, ls_r3, inf_r3, zero_r3;
reg [2*N-1+3:0] tmp_o_r3;
reg [Bs-1:0] r_o_r3;
reg [N-1:0] DSR_left_out_r3;
always @(posedge clk) begin
start_r3 <= start_r2; ls_r3 <= ls_r2; inf_r3 <= inf_r2; zero_r3 <= zero_r2;
r_o_r3 <= r_o;
tmp_o_r3 <= tmp_o;
DSR_left_out_r3 <= DSR_left_out;
end

//Including/Pushing Regime bits in Exponent-Mantissa Packing
wire [3*N-1+3:0] tmp1_o;
DSR_right_N_S #(.N(3*N+3), .S(Bs)) dsr2 (.a({tmp_o_r3,{N{1'b0}}}), .b(r_o_r3), .c(tmp1_o));


//Rounding RNE : ulp_add = G.(R + S) + L.G.(~(R+S))
wire L = tmp1_o[N+4], G = tmp1_o[N+3], R = tmp1_o[N+2], St = |tmp1_o[N+1:0],
     ulp = ((G & (R | St)) | (L & G & ~(R | St)));
wire [N-1:0] rnd_ulp = {{N-1{1'b0}},ulp};
wire [N-1:0] tmp1_o_rnd = (r_o_r3 < N-es-2) ? tmp1_o[2*N-1+3:N+3] + rnd_ulp : tmp1_o[2*N-1+3:N+3];


//Final Output
wire [N-1:0] tmp1_oN = ls_r3 ? -tmp1_o_rnd : tmp1_o_rnd;
wire [N-1:0] out_tmp = inf_r3|zero_r3|(~DSR_left_out_r3[N-1]) ? {inf_r3,{N-1{1'b0}}} : {ls_r3, tmp1_oN[N-1:1]};  

always @(posedge clk) begin
out <= out_tmp;
done <= start_r3;
inf <= inf_r3;
zero <= zero_r3;
end
endmodule

/////////////////////////
module data_extract_N32_ES6(in, rc, regime, exp, mant);

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction


parameter N=32;
parameter Bs=log2(N);
parameter es = 5;


input [N-1:0] in;
output rc;
output [Bs-1:0] regime;
output [es-1:0] exp;
output [N-es-1:0] mant;

//Data Extraction

wire [N-1:0] xin = in;
assign rc = xin[N-2];

wire [N-1:0] xin_r = rc ? ~xin : xin;

wire [Bs-1:0] k;
LOD_32 uut_lod32_5 (.in({xin_r[N-2:0],rc^1'b0}), .out(k));

assign regime = rc ? k-1 : k;

wire [N-1:0] xin_tmp;
DSR_left_N_S #(.N(N), .S(Bs)) ls (.a({xin[N-3:0],2'b0}),.b(k),.c(xin_tmp));

assign exp= xin_tmp[N-1:N-es];
assign mant= xin_tmp[N-es-1:0];

endmodule

/////////////////
module sub_N (a,b,c);
parameter N=10;
input [N-1:0] a,b;
output [N:0] c;
assign c = {1'b0,a} - {1'b0,b};
endmodule

/////////////////////////
module add_N (a,b,c);
parameter N=10;
input [N-1:0] a,b;
output [N:0] c;
assign c = {1'b0,a} + {1'b0,b};
endmodule

/////////////////////////
module add_sub_N (op,a,b,c);
parameter N=10;
input op;
input [N-1:0] a,b;
output [N:0] c;
assign c = op ? {1'b0,a} + {1'b0,b} : {1'b0,a} - {1'b0,b};
endmodule

/////////////////////////
module add_mantovf (a,mant_ovf,c);
parameter N=10;
input [N:0] a;
input mant_ovf;
output [N:0] c;
assign c = a + mant_ovf;
endmodule

/////////////////////////
module DSR_left_N_S(a,b,c);
        parameter N=16;
        parameter S=4;
        input [N-1:0] a;
        input [S-1:0] b;
        output [N-1:0] c;

wire [N-1:0] tmp [S-1:0];
assign tmp[0]  = b[0] ? a << 7'd1  : a; 
genvar i;
generate
	for (i=1; i<S; i=i+1)begin:loop_blk
		assign tmp[i] = b[i] ? tmp[i-1] << 2**i : tmp[i-1];
	end
endgenerate
assign c = tmp[S-1];

endmodule


/////////////////////////
module DSR_right_N_S(a,b,c);
        parameter N=16;
        parameter S=4;
        input [N-1:0] a;
        input [S-1:0] b;
        output [N-1:0] c;

wire [N-1:0] tmp [S-1:0];
assign tmp[0]  = b[0] ? a >> 7'd1  : a; 
genvar i;
generate
	for (i=1; i<S; i=i+1)begin:loop_blk
		assign tmp[i] = b[i] ? tmp[i-1] >> 2**i : tmp[i-1];
	end
endgenerate
assign c = tmp[S-1];

endmodule

///////////////////////
module LOD_32(in, out);
input [31:0] in;
output [4:0] out;
wire [3:0] out_l, out_h;
wire out_vl, out_vh;
LOD16_4 pl(.in(in[15:0]), .out(out_l), .out_v(out_vl));
LOD16_4 ph(.in(in[31:16]), .out(out_h), .out_v(out_vh));
assign out = out_vh ? {1'b0,out_h} : {out_vl,out_l};
endmodule

////////////////////
module LOD16_4(in, out, out_v);
input [15:0] in;
output [3:0] out;
output out_v;
wire [2:0] out_l, out_h;
wire out_vl, out_vh;
LOD8_3 pl(.in(in[7:0]), .out(out_l), .out_v(out_vl));
LOD8_3 ph(.in(in[15:8]), .out(out_h), .out_v(out_vh));
assign out = out_vh ? {1'b0,out_h} : {out_vl,out_l};
assign out_v = out_vl | out_vh;
endmodule


////////////////////
module LOD8_3(in, out, out_v);
input [7:0] in;
output [2:0] out;
output out_v;

wire [1:0] out_l, out_h;
wire out_vl, out_vh;
LOD4_2 pl(.in(in[3:0]), .out(out_l), .out_v(out_vl));
LOD4_2 ph(.in(in[7:4]), .out(out_h), .out_v(out_vh));
assign out = out_vh ? {1'b0,out_h} : {out_vl,out_l};
assign out_v = out_vl | out_vh;

endmodule


////////////////////
module LOD4_2(in, out, out_v);
input [3:0] in;
output [1:0] out;
output out_v;

wire out_l, out_h;
wire out_vl, out_vh;
LOD2_1 pl(.in(in[1:0]), .out(out_l), .out_v(out_vl));
LOD2_1 ph(.in(in[3:2]), .out(out_h), .out_v(out_vh));
assign out = out_vh ? {1'b0,out_h} : {out_vl,out_l};
assign out_v = out_vl | out_vh;

endmodule


module LOD2_1(in, out, out_v);
input [1:0] in;
output out;
output out_v;

assign out = ~in[1] & in[0];
assign out_v = |in;
endmodule
