`timescale 1ns / 1ps
(* use_dsp = "no" *)
module div_N32_ES6_PIPE12(clk, in1, in2, start, out, inf, zero, done);
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
parameter M = N-es;
parameter NR_Iter = 2;


input clk;
input [N-1:0] in1, in2;
input start; 
output reg [N-1:0] out;
output reg inf, zero, done;

wire start0= start;
wire s1 = in1[N-1];
wire s2 = in2[N-1];
wire zero_tmp1 = |in1[N-2:0];
wire zero_tmp2 = |in2[N-2:0];
wire inf1 = in1[N-1] & (~zero_tmp1),
	inf2 = in2[N-1] & (~zero_tmp2);
wire zero1 = ~(in1[N-1] | zero_tmp1),
	zero2 = ~(in2[N-1] | zero_tmp2);
wire inf_t = inf1 | zero2,
	zero_t = zero1 | inf2;

//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2;
wire [es-1:0] e1, e2;
wire [M-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
data_extract_N32_ES6 #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1));
data_extract_N32_ES6 #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2));

wire [M:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

reg start_r00; 
reg s1_r00, s2_r00, inf_r00, zero_r00, rc1_r00, rc2_r00;
reg [Bs-1:0] regime1_r00, regime2_r00;
reg [es-1:0] e1_r00, e2_r00;
reg [M:0] m1_r00, m2_r00;
reg start_r0; 
reg s1_r0, s2_r0, inf_r0, zero_r0, rc1_r0, rc2_r0;
reg [Bs-1:0] regime1_r0, regime2_r0;
reg [es-1:0] e1_r0, e2_r0;
reg [M:0] m1_r0, m2_r0;
always @(posedge clk) begin
start_r0 <= start0; s1_r0 <= s1; s2_r0 <= s2; 
inf_r0 <= inf_t; zero_r0 <= zero_t; rc1_r0 <= rc1; rc2_r0 <= rc2;
regime1_r0 <= regime1; regime2_r0 <= regime2; 
e1_r0 <= e1; e2_r0 <= e2;
m1_r0 <= m1; m2_r0 <= m2;
end


//Mantissa Computation
wire [8:0] m2_inv0_tmp;
a1_inv_8bit9_lat0 i_uut (.clk(),.addr(m2_r0[M-1:M-8]),.dout(m2_inv0_tmp));
wire [2*M+1:0] m2_inv0_r0 = {1'b0, m2_inv0_tmp[8:0], {M-8{1'b0}} , {M{1'b0}}};

//First NR Iteration
wire [2*M+1:0] m2_inv0_X_m2_r1;
wire [33:0] mult_P1;
mult25x9bit_lat1 m24_1 (.clk(clk), .b({m2_inv0_r0[2*M:2*M-8]}), .a(m2_r0[M:2]), .c(mult_P1));
assign m2_inv0_X_m2_r1 = {mult_P1,14'b0,6'b0};
reg [M:0] two_m2_inv0_X_m2_r2, m2_r1, m2_r2;
reg[2*M+1:0] m2_inv0_r1, m2_inv0_r2;
always @(posedge clk)begin
two_m2_inv0_X_m2_r2 <= {1'b1,{M{1'b0}}} - {1'b0,m2_inv0_X_m2_r1[2*M+1:M+3],|m2_inv0_X_m2_r1[M+2:0]};
m2_inv0_r1 <= m2_inv0_r0; m2_inv0_r2 <= m2_inv0_r1;
m2_r1 <= m2_r0; m2_r2 <= m2_r1;
end

wire [2*M+1:0] m2_inv1_r3;
wire [33:0] mult_P3;
mult25x9bit_lat1 m24_2 (.clk(clk), .b({m2_inv0_r2[2*M:2*M-8]}), .a({two_m2_inv0_X_m2_r2[M-1:2],|two_m2_inv0_X_m2_r2[1:0]}), .c(mult_P3));
assign m2_inv1_r3 = {mult_P3,14'b0,6'b0};

reg start_r1, start_r2, start_r3; 
reg s1_r1, s2_r1, inf_r1, zero_r1, rc1_r1, rc2_r1,
s1_r2, s2_r2, inf_r2, zero_r2, rc1_r2, rc2_r2,
s1_r3, s2_r3, inf_r3, zero_r3, rc1_r3, rc2_r3;
reg [Bs-1:0] regime1_r1, regime2_r1, regime1_r2, regime2_r2, regime1_r3, regime2_r3;
reg [es-1:0] e1_r1, e2_r1, e1_r2, e2_r2, e1_r3, e2_r3;
reg [M:0] m1_r1, m1_r2, m1_r3;
reg [M:0] m2_r3;
always @(posedge clk) begin
start_r1 <= start_r0; s1_r1 <= s1_r0; s2_r1 <= s2_r0; 
start_r2 <= start_r1; s1_r2 <= s1_r1; s2_r2 <= s2_r1; 
start_r3 <= start_r2; s1_r3 <= s1_r2; s2_r3 <= s2_r2; 
inf_r1 <= inf_r0; zero_r1 <= zero_r0; rc1_r1 <= rc1_r0; rc2_r1 <= rc2_r0;
inf_r2 <= inf_r1; zero_r2 <= zero_r1; rc1_r2 <= rc1_r1; rc2_r2 <= rc2_r1;
inf_r3 <= inf_r2; zero_r3 <= zero_r2; rc1_r3 <= rc1_r2; rc2_r3 <= rc2_r2;
regime1_r1 <= regime1_r0; regime2_r1 <= regime2_r0; 
regime1_r2 <= regime1_r1; regime2_r2 <= regime2_r1; 
regime1_r3 <= regime1_r2; regime2_r3 <= regime2_r2; 
e1_r1 <= e1_r0; e2_r1 <= e2_r0;
e1_r2 <= e1_r1; e2_r2 <= e2_r1;
e1_r3 <= e1_r2; e2_r3 <= e2_r2;
m1_r1 <= m1_r0; m1_r2 <= m1_r1; m1_r3 <= m1_r2;
m2_r3 <= m2_r2; 
end





//Second NR Iteration
wire [2*M+1:0] m2_inv1_X_m2_r4;
wire [41:0] mult_P4;
mult25x17bit_lat1 m24_3 (.clk(clk), .b({m2_inv1_r3[2*M:2*M-2*8]}), .a(m2_r3[M:2]), .c(mult_P4));
assign m2_inv1_X_m2_r4 = {mult_P4,6'b0,6'b0};
reg [M:0] two_m2_inv1_X_m2_r5, m2_r4, m2_r5;
reg [2*M+1:0] m2_inv1_r4, m2_inv1_r5;
always @(posedge clk)begin
two_m2_inv1_X_m2_r5 <= {1'b1,{M{1'b0}}} - {1'b0,m2_inv1_X_m2_r4[2*M+1:M+3],|m2_inv1_X_m2_r4[M+2:0]};
m2_inv1_r4 <= m2_inv1_r3; m2_inv1_r5 <= m2_inv1_r4;
m2_r4 <= m2_r3; m2_r5 <= m2_r4;
end
wire [2*M+1:0] m2_inv2_r6;
wire [41:0] mult_P6;
mult25x17bit_lat1 m24_4 (.clk(clk), .b({m2_inv1_r5[2*M:2*M-2*8]}), .a({two_m2_inv1_X_m2_r5[M-1:2],|two_m2_inv1_X_m2_r5[1:0]}), .c(mult_P6));
assign m2_inv2_r6 = {mult_P6,6'b0,6'b0};

reg start_r4, start_r5, start_r6; 
reg s1_r4, s2_r4, inf_r4, zero_r4, rc1_r4, rc2_r4,
s1_r5, s2_r5, inf_r5, zero_r5, rc1_r5, rc2_r5,
s1_r6, s2_r6, inf_r6, zero_r6, rc1_r6, rc2_r6;
reg [Bs-1:0] regime1_r4, regime2_r4, regime1_r5, regime2_r5, regime1_r6, regime2_r6;
reg [es-1:0] e1_r4, e2_r4, e1_r5, e2_r5, e1_r6, e2_r6;
reg [M:0] m1_r4, m1_r5, m1_r6;
reg [M:0] m2_r6;
always @(posedge clk) begin
start_r4 <= start_r3; s1_r4 <= s1_r3; s2_r4 <= s2_r3; 
start_r5 <= start_r4; s1_r5 <= s1_r4; s2_r5 <= s2_r4; 
start_r6 <= start_r5; s1_r6 <= s1_r5; s2_r6 <= s2_r5; 
inf_r4 <= inf_r3; zero_r4 <= zero_r3; rc1_r4 <= rc1_r3; rc2_r4 <= rc2_r3;
inf_r5 <= inf_r4; zero_r5 <= zero_r4; rc1_r5 <= rc1_r4; rc2_r5 <= rc2_r4;
inf_r6 <= inf_r5; zero_r6 <= zero_r5; rc1_r6 <= rc1_r5; rc2_r6 <= rc2_r5;
regime1_r4 <= regime1_r3; regime2_r4 <= regime2_r3; 
regime1_r5 <= regime1_r4; regime2_r5 <= regime2_r4; 
regime1_r6 <= regime1_r5; regime2_r6 <= regime2_r5; 
e1_r4 <= e1_r3; e2_r4 <= e2_r3;
e1_r5 <= e1_r4; e2_r5 <= e2_r4;
e1_r6 <= e1_r5; e2_r6 <= e2_r5;
m1_r4 <= m1_r3; m1_r5 <= m1_r4; m1_r6 <= m1_r5;
m2_r6 <= m2_r5;
end

wire [2*M+1:0] div_m;
wire [49:0] mult_P9;
mult25x25bit_lat3 m24_5 (.clk(clk), .a(m1_r6[M:2]), .b({m2_inv2_r6[2*M:M+2]}), .c(mult_P9));

reg start_r7, start_r8, start_r9; 
reg s1_r7, s2_r7, inf_r7, zero_r7, rc1_r7, rc2_r7;
reg s1_r8, s2_r8, inf_r8, zero_r8, rc1_r8, rc2_r8;
reg s1_r9, s2_r9, inf_r9, zero_r9, rc1_r9, rc2_r9;
reg [Bs-1:0] regime1_r7, regime2_r7, regime1_r8, regime2_r8, regime1_r9, regime2_r9;
reg [es-1:0] e1_r7, e2_r7, e1_r8, e2_r8, e1_r9, e2_r9;
reg [M:0] m1_r7, m2_r7, m1_r8, m2_r8, m1_r9, m2_r9;
always @(posedge clk) begin
start_r7 <= start_r6; s1_r7 <= s1_r6; s2_r7 <= s2_r6; 
start_r8 <= start_r7; s1_r8 <= s1_r7; s2_r8 <= s2_r7; 
start_r9 <= start_r8; s1_r9 <= s1_r8; s2_r9 <= s2_r8; 
inf_r7 <= inf_r6; zero_r7 <= zero_r6; rc1_r7 <= rc1_r6; rc2_r7 <= rc2_r6;
inf_r8 <= inf_r7; zero_r8 <= zero_r7; rc1_r8 <= rc1_r7; rc2_r8 <= rc2_r7;
inf_r9 <= inf_r8; zero_r9 <= zero_r8; rc1_r9 <= rc1_r8; rc2_r9 <= rc2_r8;
regime1_r7 <= regime1_r6; regime2_r7 <= regime2_r6; 
regime1_r8 <= regime1_r7; regime2_r8 <= regime2_r7; 
regime1_r9 <= regime1_r8; regime2_r9 <= regime2_r8; 
e1_r7 <= e1_r6; e2_r7 <= e2_r6; e1_r8 <= e1_r7; e2_r8 <= e2_r7; e1_r9 <= e1_r8; e2_r9 <= e2_r8;
m1_r7 <= m1_r6; m2_r7 <= m2_r6; m1_r8 <= m1_r7; m2_r8 <= m2_r7; m1_r9 <= m1_r8; m2_r9 <= m2_r8;
end

wire mant2_zero = ~|m2_r9[M-1:0];
assign div_m = mant2_zero ? {1'b0,m1_r9,{M{1'b0}}} : {mult_P9,4'b0};

wire div_m_udf = div_m[2*M+1];
wire [2*M+1:0] div_mN = ~div_m_udf ? div_m << 1'b1 : div_m;

//Sign, Exponent Computation
wire div_s = s1_r9 ^ s2_r9;
wire [Bs+1:0] r1 = rc1_r9 ? {2'b0,regime1_r9} : -regime1_r9;
wire [Bs+1:0] r2 = rc2_r9 ? {2'b0,regime2_r9} : -regime2_r9;

//Exponent and Regime Computation
wire [Bs+es+1:0] div_e = {r1, e1_r9} - {r2, e2_r9} - 1 + mant2_zero + div_m_udf;
wire [es+Bs:0] div_eN = div_e[es+Bs+1] ? -div_e : div_e;
wire [es-1:0] e_o = div_e[es-1:0];
wire [Bs:0] r_o = (~div_e[es+Bs+1] || (|div_e[es-1:0])) + div_eN[es+Bs:es];

//Exponent and Mantissa Packing
wire [2*N-1+3:0]tmp_o = {{N{~div_e[es+Bs+1]}},div_e[es+Bs+1],e_o,div_mN[2*M:2*M-(N-es-1)+1], div_mN[2*M-(N-es-1):2*M-(N-es-1)-1],|div_mN[2*M-(N-es-1)-2:0] };	//Rounding GRS included

reg start_r10, div_s_r10, inf_r10, zero_r10;
reg [2*N-1+3:0] tmp_o_r10;
reg [Bs:0] r_o_r10;
reg [2*M+1:0] div_mN_r10;
always @(posedge clk) begin
start_r10 <= start_r9; div_s_r10 <= div_s; inf_r10 <= inf_r9; zero_r10 <= zero_r9;
r_o_r10 <= r_o;
tmp_o_r10 <= tmp_o;
div_mN_r10 <= div_mN;
end

//Including Regime bits in Exponent-Mantissa Packing
wire [3*N-1+3:0] tmp1_o;
DSR_right_64_lat1 #(.N(3*N+3)) dsr2 (.clk(clk), .a({tmp_o,{N{1'b0}}}), .b(r_o[Bs] ? {Bs{1'b1}} : r_o), .c(tmp1_o));


//Rounding RNE : ulp_add = G.(R + S) + L.G.(~(R+S))
wire L = tmp1_o[N+4], G = tmp1_o[N+3], R = tmp1_o[N+2], St = |tmp1_o[N+1:0],
     ulp = ((G & (R | St)) | (L & G & ~(R | St)));
wire [N-1:0] rnd_ulp = {{N-1{1'b0}},ulp};
wire [N-1:0] tmp1_o_rnd = (r_o_r10 < M-2) ? tmp1_o[2*N-1+3:N+3] + rnd_ulp : tmp1_o[2*N-1+3:N+3];	//with M = N-es


//Final Output
wire [N-1:0] tmp1_oN = div_s_r10 ? -tmp1_o_rnd : tmp1_o_rnd;
wire[N-1:0] out_tmp = inf_r10|zero_r10|(~div_mN_r10[2*M+1]) ? {inf_r10,{N-1{1'b0}}} : {div_s_r10, tmp1_oN[N-1:1]};

always @(posedge clk) begin
out <= out_tmp;
done <= start_r10;
inf <= inf_r10;
zero <= zero_r10;
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



//////////////////////////////////
module DSR_right_64_lat1(clk,a,b,c);
        parameter N=32;
	input clk;
        input [N-1:0] a;
        input [5:0] b;
        output [N-1:0] c;

        wire [N-1:0] tmp32, tmp16, tmp8,  tmp4, tmp2, tmp1;


assign tmp32 = b[5] ? a >> 7'd32 : a;
assign tmp16 = b[4] ? tmp32 >> 7'd16 : tmp32;
assign tmp8  = b[3] ? tmp16 >> 7'd8  : tmp16;

reg[N-1:0] tmp8_r;
reg [5:0] b_r;
always @(posedge clk)begin
	tmp8_r <= tmp8;
	b_r <= b;
end

assign tmp4  = b_r[2] ? tmp8_r  >> 7'd4  : tmp8_r;
assign tmp2  = b_r[1] ? tmp4  >> 7'd2  : tmp4;
assign tmp1  = b_r[0] ? tmp2  >> 7'd1  : tmp2; 

assign c = tmp1;

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


////////////////////////////
module a1_inv_8bit9_lat0 (clk, addr, dout);
  input clk;
  output reg [8 : 0] dout;
  input  [7 : 0] addr;

   reg [8:0] a1_inv_rom [(2**8-1):0];

always @(*) begin 
	case (addr) 
		8'd000	:       dout <= 9'h1ff;
		8'd001  :       dout <= 9'h1fe;
		8'd002  :       dout <= 9'h1fc;
                8'd003  :       dout <= 9'h1fa;
	        8'd004  :       dout <= 9'h1f8;
                8'd005  :       dout <= 9'h1f6;
                8'd006  :       dout <= 9'h1f4;
                8'd007  :       dout <= 9'h1f2;
                8'd008	:       dout <= 9'h1f0;
                8'd009  :       dout <= 9'h1ee;
                8'd010  :       dout <= 9'h1ec;
                8'd011  :       dout <= 9'h1ea;
                8'd012  :       dout <= 9'h1e9;
                8'd013  :       dout <= 9'h1e7;
                8'd014  :       dout <= 9'h1e5;
                8'd015  :       dout <= 9'h1e3;
                8'd016  :       dout <= 9'h1e1;
                8'd017  :       dout <= 9'h1e0;
                8'd018	:       dout <= 9'h1de;
                8'd019  :       dout <= 9'h1dc;
                8'd020  :       dout <= 9'h1da;
                8'd021  :       dout <= 9'h1d9;
                8'd022  :       dout <= 9'h1d7;
                8'd023  :       dout <= 9'h1d5;
                8'd024  :       dout <= 9'h1d4;
                8'd025  :       dout <= 9'h1d2;
                8'd026  :       dout <= 9'h1d0;
                8'd027  :       dout <= 9'h1cf;
                8'd028	:       dout <= 9'h1cd;
                8'd029  :       dout <= 9'h1cb;
                8'd030  :       dout <= 9'h1ca;
                8'd031  :       dout <= 9'h1c8;
                8'd032  :       dout <= 9'h1c7;
                8'd033  :       dout <= 9'h1c5;
                8'd034  :       dout <= 9'h1c3;
                8'd035  :       dout <= 9'h1c2;
                8'd036  :       dout <= 9'h1c0;
                8'd037  :       dout <= 9'h1bf;
                8'd038	:       dout <= 9'h1bd;
                8'd039  :       dout <= 9'h1bc;
                8'd040  :       dout <= 9'h1ba;
                8'd041  :       dout <= 9'h1b9;
                8'd042  :       dout <= 9'h1b7;
                8'd043  :       dout <= 9'h1b6;
                8'd044  :       dout <= 9'h1b4;
                8'd045  :       dout <= 9'h1b3;
                8'd046  :       dout <= 9'h1b2;
                8'd047  :       dout <= 9'h1b0;
                8'd048	:       dout <= 9'h1af;
                8'd049  :       dout <= 9'h1ad;
                8'd050  :       dout <= 9'h1ac;
                8'd051  :       dout <= 9'h1aa;
                8'd052  :       dout <= 9'h1a9;
                8'd053  :       dout <= 9'h1a8;
                8'd054  :       dout <= 9'h1a6;
                8'd055  :       dout <= 9'h1a5;
                8'd056  :       dout <= 9'h1a4;
                8'd057  :       dout <= 9'h1a2;
                8'd058	:       dout <= 9'h1a1;
                8'd059  :       dout <= 9'h1a0;
                8'd060  :       dout <= 9'h19e;
                8'd061  :       dout <= 9'h19d;
                8'd062  :       dout <= 9'h19c;
                8'd063  :       dout <= 9'h19a;
                8'd064  :       dout <= 9'h199;
                8'd065  :       dout <= 9'h198;
                8'd066  :       dout <= 9'h197;
                8'd067  :       dout <= 9'h195;
                8'd068	:       dout <= 9'h194;
                8'd069  :       dout <= 9'h193;
                8'd070  :       dout <= 9'h192;
                8'd071  :       dout <= 9'h190;
                8'd072  :       dout <= 9'h18f;
                8'd073  :       dout <= 9'h18e;
                8'd074  :       dout <= 9'h18d;
                8'd075  :       dout <= 9'h18b;
                8'd076  :       dout <= 9'h18a;
                8'd077  :       dout <= 9'h189;
                8'd078	:       dout <= 9'h188;
                8'd079  :       dout <= 9'h187;
                8'd080  :       dout <= 9'h186;
                8'd081  :       dout <= 9'h184;
                8'd082  :       dout <= 9'h183;
                8'd083  :       dout <= 9'h182;
                8'd084  :       dout <= 9'h181;
                8'd085  :       dout <= 9'h180;
                8'd086  :       dout <= 9'h17f;
                8'd087  :       dout <= 9'h17e;
                8'd088	:       dout <= 9'h17d;
                8'd089  :       dout <= 9'h17b;
                8'd090  :       dout <= 9'h17a;
                8'd091  :       dout <= 9'h179;
                8'd092  :       dout <= 9'h178;
                8'd093  :       dout <= 9'h177;
                8'd094  :       dout <= 9'h176;
                8'd095  :       dout <= 9'h175;
                8'd096  :       dout <= 9'h174;
                8'd097  :       dout <= 9'h173;
                8'd098	:       dout <= 9'h172;
                8'd099  :       dout <= 9'h171;
                8'd100  :       dout <= 9'h170;
                8'd101  :       dout <= 9'h16f;
                8'd102  :       dout <= 9'h16e;
                8'd103  :       dout <= 9'h16d;
                8'd104  :       dout <= 9'h16c;
                8'd105  :       dout <= 9'h16b;
                8'd106  :       dout <= 9'h16a;
                8'd107  :       dout <= 9'h169;
                8'd108	:       dout <= 9'h168;
                8'd109  :       dout <= 9'h167;
                8'd110  :       dout <= 9'h166;
                8'd111  :       dout <= 9'h165;
                8'd112  :       dout <= 9'h164;
                8'd113  :       dout <= 9'h163;
                8'd114  :       dout <= 9'h162;
                8'd115  :       dout <= 9'h161;
                8'd116  :       dout <= 9'h160;
                8'd117  :       dout <= 9'h15f;
                8'd118	:       dout <= 9'h15e;
                8'd119  :       dout <= 9'h15d;
                8'd120  :       dout <= 9'h15c;
                8'd121  :       dout <= 9'h15b;
                8'd122  :       dout <= 9'h15a;
                8'd123  :       dout <= 9'h159;
                8'd124  :       dout <= 9'h158;
                8'd125  :       dout <= 9'h158;
                8'd126  :       dout <= 9'h157;
                8'd127  :       dout <= 9'h156;
                8'd128	:       dout <= 9'h155;
                8'd129  :       dout <= 9'h154;
                8'd130  :       dout <= 9'h153;
                8'd131  :       dout <= 9'h152;
                8'd132  :       dout <= 9'h151;
                8'd133  :       dout <= 9'h150;
                8'd134  :       dout <= 9'h150;
                8'd135  :       dout <= 9'h14f;
                8'd136  :       dout <= 9'h14e;
                8'd137  :       dout <= 9'h14d;
                8'd138	:       dout <= 9'h14c;
                8'd139  :       dout <= 9'h14b;
                8'd140  :       dout <= 9'h14a;
                8'd141  :       dout <= 9'h14a;
                8'd142  :       dout <= 9'h149;
                8'd143  :       dout <= 9'h148;
                8'd144  :       dout <= 9'h147;
                8'd145  :       dout <= 9'h146;
                8'd146  :       dout <= 9'h146;
                8'd147  :       dout <= 9'h145;
                8'd148	:       dout <= 9'h144;
                8'd149  :       dout <= 9'h143;
                8'd150  :       dout <= 9'h142;
                8'd151  :       dout <= 9'h142;
                8'd152  :       dout <= 9'h141;
                8'd153  :       dout <= 9'h140;
                8'd154  :       dout <= 9'h13f;
                8'd155  :       dout <= 9'h13e;
                8'd156  :       dout <= 9'h13e;
                8'd157  :       dout <= 9'h13d;
                8'd158	:       dout <= 9'h13c;
                8'd159  :       dout <= 9'h13b;
                8'd160  :       dout <= 9'h13b;
                8'd161  :       dout <= 9'h13a;
                8'd162  :       dout <= 9'h139;
                8'd163  :       dout <= 9'h138;
                8'd164  :       dout <= 9'h138;
                8'd165  :       dout <= 9'h137;
                8'd166  :       dout <= 9'h136;
                8'd167  :       dout <= 9'h135;
                8'd168	:       dout <= 9'h135;
                8'd169  :       dout <= 9'h134;
                8'd170  :       dout <= 9'h133;
                8'd171  :       dout <= 9'h132;
                8'd172  :       dout <= 9'h132;
                8'd173  :       dout <= 9'h131;
                8'd174  :       dout <= 9'h130;
                8'd175  :       dout <= 9'h130;
                8'd176  :       dout <= 9'h12f;
                8'd177  :       dout <= 9'h12e;
                8'd178	:       dout <= 9'h12e;
                8'd179  :       dout <= 9'h12d;
                8'd180  :       dout <= 9'h12c;
                8'd181  :       dout <= 9'h12b;
                8'd182  :       dout <= 9'h12b;
                8'd183  :       dout <= 9'h12a;
                8'd184  :       dout <= 9'h129;
                8'd185  :       dout <= 9'h129;
                8'd186  :       dout <= 9'h128;
                8'd187  :       dout <= 9'h127;
                8'd188	:       dout <= 9'h127;
                8'd189  :       dout <= 9'h126;
                8'd190  :       dout <= 9'h125;
                8'd191  :       dout <= 9'h125;
                8'd192  :       dout <= 9'h124;
                8'd193  :       dout <= 9'h123;
                8'd194  :       dout <= 9'h123;
                8'd195  :       dout <= 9'h122;
                8'd196  :       dout <= 9'h121;
                8'd197  :       dout <= 9'h121;
                8'd198	:       dout <= 9'h120;
                8'd199  :       dout <= 9'h120;
                8'd200  :       dout <= 9'h11f;
                8'd201  :       dout <= 9'h11e;
                8'd202  :       dout <= 9'h11e;
                8'd203  :       dout <= 9'h11d;
                8'd204  :       dout <= 9'h11c;
                8'd205  :       dout <= 9'h11c;
                8'd206  :       dout <= 9'h11b;
                8'd207  :       dout <= 9'h11b;
                8'd208	:       dout <= 9'h11a;
                8'd209  :       dout <= 9'h119;
                8'd210  :       dout <= 9'h119;
                8'd211  :       dout <= 9'h118;
                8'd212  :       dout <= 9'h118;
                8'd213  :       dout <= 9'h117;
                8'd214  :       dout <= 9'h116;
                8'd215  :       dout <= 9'h116;
                8'd216  :       dout <= 9'h115;
                8'd217  :       dout <= 9'h115;
                8'd218	:       dout <= 9'h114;
                8'd219  :       dout <= 9'h113;
                8'd220  :       dout <= 9'h113;
                8'd221  :       dout <= 9'h112;
                8'd222  :       dout <= 9'h112;
                8'd223  :       dout <= 9'h111;
                8'd224  :       dout <= 9'h111;
                8'd225  :       dout <= 9'h110;
                8'd226  :       dout <= 9'h10f;
                8'd227  :       dout <= 9'h10f;
                8'd228	:       dout <= 9'h10e;
                8'd229  :       dout <= 9'h10e;
                8'd230  :       dout <= 9'h10d;
                8'd231  :       dout <= 9'h10d;
                8'd232  :       dout <= 9'h10c;
                8'd233  :       dout <= 9'h10c;
                8'd234  :       dout <= 9'h10b;
                8'd235  :       dout <= 9'h10a;
                8'd236  :       dout <= 9'h10a;
                8'd237  :       dout <= 9'h109;
                8'd238	:       dout <= 9'h109;
                8'd239  :       dout <= 9'h108;
                8'd240  :       dout <= 9'h108;
                8'd241  :       dout <= 9'h107;
                8'd242  :       dout <= 9'h107;
                8'd243  :       dout <= 9'h106;
                8'd244  :       dout <= 9'h106;
                8'd245  :       dout <= 9'h105;
                8'd246  :       dout <= 9'h105;
                8'd247  :       dout <= 9'h104;
                8'd248	:       dout <= 9'h104;
                8'd249  :       dout <= 9'h103;
                8'd250  :       dout <= 9'h103;
                8'd251  :       dout <= 9'h102;
                8'd252  :       dout <= 9'h102;
                8'd253  :       dout <= 9'h101;
                8'd254  :       dout <= 9'h101;
                8'd255  :       dout <= 9'h100;
		default : 	dout <= 9'h0;
	endcase
end

endmodule


///////////////////////////////////////////
module mult25x9bit_lat1 (clk, a, b, c);
parameter PR = 0;
parameter MR = 0;


   input clk;
   input [24:0] a;
   input [8:0] b;
   output [33:0] c;

   wire [47:0] P;
   dsp48_24x17 #(.PR(1), .MR(0)) dsp48_24x24_inst1(.CLK(clk), .A(a[23:0]), .B({8'b0,b}), .C({15'b0,{a[24] * b},24'b0}), .P(P));

   assign c = P[33:0];  
endmodule



///////////////////////////////////////////
module dsp48_24x17(CLK, A, B, C, P);
parameter Na=24;
parameter X=30-Na;
parameter PR = 0;
parameter MR = 0;
parameter ALUMODEREG = MR; 	//(1),  // Number of pipeline registers on ALUMODE input, 0 or 1
parameter CARRYINSELREG = MR; 	//(1),  // Number of pipeline registers for the CARRYINSEL input, 0 or 1
parameter CARRYINREG = MR;	//(0),     // Number of pipeline registers for the CARRYIN input, 0 or 1
parameter CREG = MR;		//(1),  // Number of pipeline registers on the C input, 0 or 1
parameter MREG = MR;		//(1),  // Number of multiplier pipeline registers, 0 or 1
parameter MULTCARRYINREG = MR;	//(1),  // Number of pipeline registers for multiplier carry in bit, 0 or 1
parameter OPMODEREG = MR;	//(1),  // Number of pipeline registers on OPMODE input, 0 or 1
parameter PREG = PR;		//(1),  // Number of pipeline registers on the P output, 0 or 1
parameter USE_MULT = (MR==0) ? "MULT" : "MULT_S";	//("MULT_S"), // Select multiplier usage, "MULT" (MREG => 0), "MULT_S" (MREG => 1), "NONE" (no multiplier)

    input CLK;
    input [Na-1:0] A;
    input [16:0] B;
    input [47:0] C;
    output [47:0] P;

   DSP48E #(
      .SIM_MODE("SAFE"),  // Simulation: "SAFE" vs. "FAST", see "Synthesis and Simulation Design Guide" for details
      .ACASCREG(0),       // Number of pipeline registers between A/ACIN input and ACOUT output, 0, 1, or 2
      .ALUMODEREG(ALUMODEREG),     // Number of pipeline registers on ALUMODE input, 0 or 1
      .AREG(0),           // Number of pipeline registers on the A input, 0, 1 or 2
      .AUTORESET_PATTERN_DETECT("FALSE"), // Auto-reset upon pattern detect, "TRUE" or "FALSE" 
      .AUTORESET_PATTERN_DETECT_OPTINV("MATCH"), // Reset if "MATCH" or "NOMATCH" 
      .A_INPUT("DIRECT"), // Selects A input used, "DIRECT" (A port) or "CASCADE" (ACIN port)
      .BCASCREG(0),       // Number of pipeline registers between B/BCIN input and BCOUT output, 0, 1, or 2
      .BREG(0),           // Number of pipeline registers on the B input, 0, 1 or 2
      .B_INPUT("DIRECT"), // Selects B input used, "DIRECT" (B port) or "CASCADE" (BCIN port)
      .CARRYINREG(CARRYINREG),     // Number of pipeline registers for the CARRYIN input, 0 or 1
      .CARRYINSELREG(CARRYINSELREG),  // Number of pipeline registers for the CARRYINSEL input, 0 or 1
      .CREG(CREG),           // Number of pipeline registers on the C input, 0 or 1
      .MASK(48'h3fffffffffff), // 48-bit Mask value for pattern detect
      .MREG(MREG),           // Number of multiplier pipeline registers, 0 or 1
      .MULTCARRYINREG(MULTCARRYINREG), // Number of pipeline registers for multiplier carry in bit, 0 or 1
      .OPMODEREG(OPMODEREG),      // Number of pipeline registers on OPMODE input, 0 or 1
      .PATTERN(48'h000000000000), // 48-bit Pattern match for pattern detect
      .PREG(PREG),           // Number of pipeline registers on the P output, 0 or 1
      .SEL_MASK("MASK"),  // Select mask value between the "MASK" value or the value on the "C" port
      .SEL_PATTERN("PATTERN"), // Select pattern value between the "PATTERN" value or the value on the "C" port
      .SEL_ROUNDING_MASK("SEL_MASK"), // "SEL_MASK", "MODE1", "MODE2" 
      .USE_MULT(USE_MULT), // Select multiplier usage, "MULT" (MREG => 0), "MULT_S" (MREG => 1), "NONE" (no multiplier)
      .USE_PATTERN_DETECT("NO_PATDET"), // Enable pattern detect, "PATDET", "NO_PATDET" 
      .USE_SIMD("ONE48")  // SIMD selection, "ONE48", "TWO24", "FOUR12" 
   ) DSP48E_inst (
      .ACOUT(),  // 30-bit A port cascade output 
      .BCOUT(),  // 18-bit B port cascade output
      .CARRYCASCOUT(), // 1-bit cascade carry output
      .CARRYOUT(), // 4-bit carry output
      .MULTSIGNOUT(), // 1-bit multiplier sign cascade output
      .OVERFLOW(), // 1-bit overflow in add/acc output
      .P(P),               // 48-bit output
      .PATTERNBDETECT(), // 1-bit active high pattern bar detect output
      .PATTERNDETECT(),   //  1-bit active high pattern detect output
      .PCOUT(),  // 48-bit cascade output
      .UNDERFLOW(), // 1-bit active high underflow in add/acc output
      .A({{X{1'b0}},A}),          // 30-bit A data input
      .ACIN(),    // 30-bit A cascade data input
      .ALUMODE(4'h0), // 4-bit ALU control input   (For C + A*B) 
      .OPMODE(7'h35), // 7-bit operation mode input
      //.ALUMODE(4'h3), // 4-bit ALU control input  (For C - A*B)
      //.OPMODE(7'h35), // 7-bit operation mode input
      .B({1'b0,B}),          // 18-bit B data input
      .BCIN(),    // 18-bit B cascade input
      .C(C),          // 48-bit C data input
      .CARRYCASCIN(1'b0), // 1-bit cascade carry input
      .CARRYIN(1'b0),         // 1-bit carry input signal
      .CARRYINSEL(3'h0),   // 3-bit carry select input
      .CEA1(1'b1), // 1-bit active high clock enable input for 1st stage A registers
      .CEA2(1'b1), // 1-bit active high clock enable input for 2nd stage A registers
      .CEALUMODE(1'b1), // 1-bit active high clock enable input for ALUMODE registers
      .CEB1(1'b1), // 1-bit active high clock enable input for 1st stage B registers
      .CEB2(1'b1), // 1-bit active high clock enable input for 2nd stage B registers
      .CEC(1'b1),   // 1-bit active high clock enable input for C registers
      .CECARRYIN(1'b1), // 1-bit active high clock enable input for CARRYIN register
      .CECTRL(1'b1), // 1-bit active high clock enable input for OPMODE and carry registers
      .CEM(1'b1),   // 1-bit active high clock enable input for multiplier registers
      .CEMULTCARRYIN(1'b1), // 1-bit active high clock enable for multiplier carry in register
      .CEP(1'b1),   // 1-bit active high clock enable input for P registers
      .CLK(CLK),   // Clock input
      .MULTSIGNIN(1'b0), // 1-bit multiplier sign input
      .PCIN(48'b0),     // 48-bit P cascade input 
      .RSTA(1'b0),     // 1-bit reset input for A pipeline registers
      .RSTALLCARRYIN(1'b0), // 1-bit reset input for carry pipeline registers
      .RSTALUMODE(1'b0), // 1-bit reset input for ALUMODE pipeline registers
      .RSTB(1'b0), // 1-bit reset input for B pipeline registers
      .RSTC(1'b0),  // 1-bit reset input for C pipeline registers
      .RSTCTRL(1'b0), // 1-bit reset input for OPMODE pipeline registers
      .RSTM(1'b0), // 1-bit reset input for multiplier registers
      .RSTP(1'b0)  // 1-bit reset input for P pipeline registers
   );
  				
endmodule

///////////////////////////////////////////
module mult25x17bit_lat1 (clk, a, b, c);
parameter PR = 0;
parameter MR = 0;


   input clk;
   input [24:0] a;
   input [16:0] b;
   output [41:0] c;

   wire [47:0] P;
   dsp48_24x17 #(.PR(1), .MR(0)) dsp48_24x24_inst1(.CLK(clk), .A(a[23:0]), .B({b}), .C({7'b0,{a[24] * b},24'b0}), .P(P));

   assign c = P[41:0];
endmodule

///////////////////////////////////////////
module mult25x25bit_lat3 (clk, a, b, c);
   input clk;
   input [24:0] a,b;
   output reg [49:0] c;

   reg [24:0] a_r, b_r;
   reg [16:0] tmp11;
   reg [32:0] tmp10;
   always @(posedge clk) begin
	a_r <= a; b_r <= b;
	tmp11 <= a[24]*b[16:0];
    	tmp10 <= a[24:0]*b[24:17];
   end

   reg [24:0] a_r1, b_r1;
   reg [33:0] tmp11_10;
   reg [33:0] tmp11_10_r;
   always @(posedge clk) begin
	a_r1 <= a_r; b_r1 <= b_r;
	tmp11_10 <= {tmp11,7'b0} + {1'b0,tmp10};
	tmp11_10_r <= tmp11_10;
   end
   wire [47:0] P;
   dsp48_24x17 #(.PR(1), .MR(0)) dsp48_24x24_inst1(.CLK(clk), .A(a_r1[23:0]), .B(b_r1[16:0]), .C({1'b0, tmp11_10[29:0],17'b0}), .P(P));

   //always @(posedge clk)
   always @(*)
	c <= {tmp11_10_r[33:30] + P[47], P[46:0]};
endmodule



