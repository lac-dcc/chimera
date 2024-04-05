`timescale 1ns / 1ps
`include "DSR_right_N_S.v" 
`include "LOD_N.v" 
`include "LZD_N.v" 
`include "DSR_left_N_S.v"
`include "add_N.v"
`include "sub_N.v"
`include "data_extract.v"
`include "add_mantovf.v"

module posit_adder (in1, in2, start, out, inf, zero, done);

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N = 16;	//Posit Word Size
parameter Bs = log2(N); 
parameter es = 2;	//Posit Exponent Size

input [N-1:0] in1, in2;
input start; 
output [N-1:0] out;
output inf, zero;
output done;

wire start0= start;
wire s1 = in1[N-1];
wire s2 = in2[N-1];
wire zero_tmp1 = |in1[N-2:0];
wire zero_tmp2 = |in2[N-2:0];
wire inf1 = in1[N-1] & (~zero_tmp1),
	inf2 = in2[N-1] & (~zero_tmp2);
wire zero1 = ~(in1[N-1] | zero_tmp1),
	zero2 = ~(in2[N-1] | zero_tmp2);
assign inf = inf1 | inf2,
	zero = zero1 & zero2;

//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2, Lshift1, Lshift2;
wire [es-1:0] e1, e2;
wire [N-es-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
data_extract #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1), .Lshift(Lshift1));
data_extract #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2), .Lshift(Lshift2));

wire [N-es:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

//Large Checking and Assignment
wire in1_gt_in2 = xin1[N-2:0] >= xin2[N-2:0] ? 1'b1 : 1'b0;

wire ls = in1_gt_in2 ? s1 : s2;
wire op = s1 ~^ s2;

wire lrc = in1_gt_in2 ? rc1 : rc2;
wire src = in1_gt_in2 ? rc2 : rc1;

wire [Bs-1:0] lr = in1_gt_in2 ? regime1 : regime2;
wire [Bs-1:0] sr = in1_gt_in2 ? regime2 : regime1;

wire [es-1:0] le = in1_gt_in2 ? e1 : e2;
wire [es-1:0] se = in1_gt_in2 ? e2 : e1;

wire [N-es:0] lm = in1_gt_in2 ? m1 : m2;
wire [N-es:0] sm = in1_gt_in2 ? m2 : m1;

//Exponent Difference: Lower Mantissa Right Shift Amount
wire [Bs:0] r_diff11, r_diff12, r_diff2;
sub_N #(.N(Bs)) uut_sub1 (lr, sr, r_diff11); 
add_N #(.N(Bs)) uut_add1 (lr, sr, r_diff12); 
sub_N #(.N(Bs)) uut_sub2 (sr, lr, r_diff2);  
wire [Bs:0] r_diff =  lrc ? (src ? r_diff11 : r_diff12) : r_diff2;

wire [es+Bs+1:0] diff;
sub_N #(.N(es+Bs+1)) uut_sub_diff ({r_diff,le}, {{Bs+1{1'b0}},se}, diff);
wire [Bs-1:0] exp_diff = (|diff[es+Bs:Bs]) ? {Bs{1'b1}} : diff[Bs-1:0];

//DSR Right Shifting of Small Mantissa
wire [N-1:0] DSR_right_in;
generate
	if (es >= 2) 
	assign DSR_right_in = {sm,{es-1{1'b0}}};
	else 
	assign DSR_right_in = sm;
endgenerate

wire [N-1:0] DSR_right_out;
wire [Bs-1:0] DSR_e_diff  = exp_diff;
DSR_right_N_S #(.N(N), .S(Bs))  dsr1(.a(DSR_right_in), .b(DSR_e_diff), .c(DSR_right_out)); 

//Mantissa Addition
wire [N-1:0] add_m_in1;
generate
	if (es >= 2) 
	assign add_m_in1 = {lm,{es-1{1'b0}}};
	else 
	assign add_m_in1 = lm;
endgenerate

wire [N:0] add_m1, add_m2;
add_N #(.N(N)) uut_add_m1 (add_m_in1, DSR_right_out, add_m1);
sub_N #(.N(N)) uut_sub_m2 (add_m_in1, DSR_right_out, add_m2);
wire [N:0] add_m = op ? add_m1 : add_m2;
wire [1:0] mant_ovf = add_m[N:N-1];

//LOD of mantissa addition result
wire [N-1:0] LOD_in = {(add_m[N] | add_m[N-1]), add_m[N-2:0]};
wire [Bs-1:0] left_shift;
LOD_N #(.N(N)) l2(.in(LOD_in), .out(left_shift));

//DSR Left Shifting of mantissa result
wire [N-1:0] DSR_left_out_t;
DSR_left_N_S #(.N(N), .S(Bs)) dsl1(.a(add_m[N:1]), .b(left_shift), .c(DSR_left_out_t));
wire [N-1:0] DSR_left_out = DSR_left_out_t[N-1] ? DSR_left_out_t[N-1:0] : {DSR_left_out_t[N-2:0],1'b0}; 


//Exponent and Regime Computation
wire [Bs:0] lr_N = lrc ? {1'b0,lr} : -{1'b0,lr};
wire [es+Bs+1:0] le_o_tmp, le_o;
sub_N #(.N(es+Bs+1)) sub3 ({lr_N,le}, {{es+1{1'b0}},left_shift}, le_o_tmp);
add_mantovf #(es+Bs+1) uut_add_mantovf (le_o_tmp, mant_ovf[1], le_o);

wire [es+Bs:0] le_oN = le_o[es+Bs] ? -le_o : le_o;
wire [es-1:0] e_o = (le_o[es+Bs] & |le_oN[es-1:0]) ? le_o[es-1:0] : le_oN[es-1:0];
wire [Bs-1:0] r_o = (~le_o[es+Bs] || (le_o[es+Bs] & |le_oN[es-1:0])) ? le_oN[es+Bs-1:es] + 1'b1 : le_oN[es+Bs-1:es];

//Exponent and Mantissa Packing
wire [2*N-1:0]tmp_o = { {N{~le_o[es+Bs]}}, le_o[es+Bs], e_o, DSR_left_out[N-2:es]};
wire [2*N-1:0] tmp1_o;
DSR_right_N_S #(.N(2*N), .S(Bs)) dsr2 (.a(tmp_o), .b(r_o), .c(tmp1_o));

//Final Output
wire [2*N-1:0] tmp1_oN = ls ? -tmp1_o : tmp1_o;
assign out = inf|zero|(~DSR_left_out[N-1]) ? {inf,{N-1{1'b0}}} : {ls, tmp1_oN[N-1:1]},
	done = start0;

endmodule



