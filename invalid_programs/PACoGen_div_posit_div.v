`timescale 1ns / 1ps

//(* use_dsp = "no" *)
module posit_div(in1, in2, start, out, inf, zero, done);
function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N = 16;
parameter Bs = log2(N); 
parameter es = 3;
parameter NR_Iter = 1;							// 2 for 32 bits, 1 for 16 bits, 0 for 8bits
parameter NRB = 2**NR_Iter;
parameter M = N-es;
parameter IW_MAX = 8;							//Max intial approximation storage bit-width
parameter IW = (NRB == 1 ) ? M : (M/NRB + ((M%NRB > 0) ? 1 : 0));	//(must be <= IW_MAX) 1/4th width of Mantissa: inverse width to be used in NR iterations multiplication 
parameter AW_MAX = 8;							//Max Address width of the intial approximation storage
parameter AW = (NRB == 1) ? M : (M/NRB + ((M%NRB > 0) ? 1 : 0));	//Actual address width used for initial approximation (AW must be <= AW_MAX)


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
assign inf = inf1 | zero2,
	zero = zero1 | inf2;

//Data Extraction
wire rc1, rc2;
wire [Bs-1:0] regime1, regime2;
wire [es-1:0] e1, e2;
wire [M-1:0] mant1, mant2;
wire [N-1:0] xin1 = s1 ? -in1 : in1;
wire [N-1:0] xin2 = s2 ? -in2 : in2;
data_extract_v1 #(.N(N),.es(es)) uut_de1(.in(xin1), .rc(rc1), .regime(regime1), .exp(e1), .mant(mant1));
data_extract_v1 #(.N(N),.es(es)) uut_de2(.in(xin2), .rc(rc2), .regime(regime2), .exp(e2), .mant(mant2));

wire [M:0] m1 = {zero_tmp1,mant1}, 
	m2 = {zero_tmp2,mant2};

//Sign, Exponent and Mantissa Computation
wire div_s = s1 ^ s2;

wire [Bs+1:0] r1 = rc1 ? {2'b0,regime1} : -regime1;
wire [Bs+1:0] r2 = rc2 ? {2'b0,regime2} : -regime2;

wire [IW_MAX:0] m2_inv0_tmp;
generate
	if (M >= AW_MAX) //for 2 NR iteration
		if (AW == AW_MAX)
			a1_inv_8bit9_lat0 i_uut (.clk(),.addr(m2[M-1:M-AW_MAX]),.dout(m2_inv0_tmp));
		else
			a1_inv_8bit9_lat0 i_uut (.clk(),.addr({m2[M-1:M-AW],{AW_MAX-AW{1'b0}}}),.dout(m2_inv0_tmp));
	else
		a1_inv_8bit9_lat0 i_uut (.clk(),.addr({m2[M-1:0],{AW_MAX-M{1'b0}}}),.dout(m2_inv0_tmp));//M =< AW_MAX, to use only a look-up table with 0-NR iteration.
endgenerate

wire [IW:0] m2_inv0;
assign m2_inv0 = m2_inv0_tmp[IW_MAX:IW_MAX-IW];

wire [2*M+1:0] div_m;
genvar i;
generate 
	wire [2*M+1:0] m2_inv [NR_Iter:0];

	if (NR_Iter > 0) begin
		assign m2_inv[0] = {1'b0,m2_inv0,{M-IW{1'b0}},{M{1'b0}}};
		wire [2*M+1:0] m2_inv_X_m2 [NR_Iter-1:0];
		wire [M+1:0] two_m2_inv_X_m2 [NR_Iter-1:0];
		for (i = 0; i < NR_Iter; i=i+1)begin : NR_Iteration
			assign m2_inv_X_m2[i] = {m2_inv[i][2*M:2*M-IW*(i+1)],{2*M-IW*(i+1)-M{1'b0}}} * m2;
			sub_N #(.N(M+1)) uut_sub_m2 ({1'b1,{M{1'b0}}}, {1'b0,m2_inv_X_m2[i][2*M+1:M+3],|m2_inv_X_m2[i][M+2:0]}, two_m2_inv_X_m2[i]);
			assign m2_inv[i+1] = {m2_inv[i][2*M:2*M-IW*(i+1)],{M-IW*(i+1){1'b0}}} * {two_m2_inv_X_m2[i][M-1:0],1'b0};
		end
	end
	else begin
		assign m2_inv[0] = {1'b0,m2_inv0,{M{1'b0}}};
	end
	assign div_m = ~|mant2 ? {1'b0,m1,{M{1'b0}}} : m1 * m2_inv[NR_Iter][2*M:M];

endgenerate

wire div_m_udf = div_m[2*M+1];
wire [2*M+1:0] div_mN = ~div_m_udf ? div_m << 1'b1 : div_m;

//Exponent and Regime Computation
wire bin = (~|mant2 | div_m_udf) ? 0 : 1;
wire [Bs+es+1:0] div_e;// = {r1, e1} - {r2, e2} - bin;// 1 + ~|mant2 + div_m_udf;
sub_N_Bin #(.N(Bs+es+1)) uut_div_e ({r1,e1}, {r2,e2}, bin, div_e);

wire [es-1:0] e_o;
wire [Bs:0] r_o;
reg_exp_op #(.es(es), .Bs(Bs)) uut_reg_ro (div_e[es+Bs+1:0], e_o, r_o);

//Exponent and Mantissa Packing
wire [2*N-1+3:0]tmp_o = {{N{~div_e[es+Bs+1]}},div_e[es+Bs+1],e_o,div_mN[2*M:2*M-(N-es-1)+1], div_mN[2*M-(N-es-1):2*M-(N-es-1)-1],|div_mN[2*M-(N-es-1)-2:0] };


//Including Regime bits in Exponent-Mantissa Packing
wire [3*N-1+3:0] tmp1_o;
DSR_right_N_S #(.N(3*N+3), .S(Bs+1)) dsr2 (.a({tmp_o,{N{1'b0}}}), .b(r_o[Bs] ? {Bs{1'b1}} : r_o), .c(tmp1_o));


//Rounding RNE : ulp_add = G.(R + S) + L.G.(~(R+S))
wire L = tmp1_o[N+4], G = tmp1_o[N+3], R = tmp1_o[N+2], St = |tmp1_o[N+1:0],
     ulp = ((G & (R | St)) | (L & G & ~(R | St)));
wire [N-1:0] rnd_ulp = {{N-1{1'b0}},ulp};

wire [N:0] tmp1_o_rnd_ulp;
add_N #(.N(N)) uut_add_ulp (tmp1_o[2*N-1+3:N+3], rnd_ulp, tmp1_o_rnd_ulp);
wire [N-1:0] tmp1_o_rnd = (r_o < M-2) ? tmp1_o_rnd_ulp[N-1:0] : tmp1_o[2*N-1+3:N+3];


//Final Output
wire [N-1:0] tmp1_oN = div_s ? -tmp1_o_rnd : tmp1_o_rnd;
assign out = inf|zero|(~div_mN[2*M+1]) ? {inf,{N-1{1'b0}}} : {div_s, tmp1_oN[N-1:1]},
	done = start0;

endmodule

/////////////////////////
module data_extract_v1(in, rc, regime, exp, mant);
function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N=16;
parameter Bs=log2(N);
parameter es = 2;

input [N-1:0] in;
output rc;
output [Bs-1:0] regime;
output [es-1:0] exp;
output [N-es-1:0] mant;

wire [N-1:0] xin = in;
assign rc = xin[N-2];

wire [N-1:0] xin_r = rc ? ~xin : xin;

wire [Bs-1:0] k;
LOD_N #(.N(N)) xinst_k(.in({xin_r[N-2:0],rc^1'b0}), .out(k));

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
module sub_N_Bin (a,b,bin,c);
parameter N=10;
input [N:0] a,b;
input bin;
output [N:0] c;
assign c = a - b - bin;
endmodule


/////////////////////////
module add_N (a,b,c);
parameter N=10;
input [N-1:0] a,b;
output [N:0] c;
assign c = {1'b0,a} + {1'b0,b};
endmodule

/////////////////////////
module add_1 (a,mant_ovf,c);
parameter N=10;
input [N:0] a;
input mant_ovf;
output [N:0] c;
assign c = a + mant_ovf;
endmodule

/////////////////////////
module conv_2c (a,c);
parameter N=10;
input [N:0] a;
output [N:0] c;
assign c = a + 1'b1;
endmodule

/////////////////////////
module reg_exp_op (exp_o, e_o, r_o);
parameter es=3;
parameter Bs=5;
input [es+Bs+1:0] exp_o;
output [es-1:0] e_o;
output [Bs:0] r_o;

assign e_o = exp_o[es-1:0];

wire [es+Bs:0] exp_oN_tmp;
conv_2c #(.N(es+Bs)) uut_conv_2c1 (~exp_o[es+Bs:0],exp_oN_tmp);
wire [es+Bs:0] exp_oN = exp_o[es+Bs+1] ? exp_oN_tmp[es+Bs:0] : exp_o[es+Bs:0];

assign r_o = (~exp_o[es+Bs+1] || |(exp_oN[es-1:0])) ? exp_oN[es+Bs:es] + 1 : exp_oN[es+Bs:es];
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

/////////////////////////
module LOD_N (in, out);

  function [31:0] log2;
    input reg [31:0] value;
    begin
      value = value-1;
      for (log2=0; value>0; log2=log2+1)
	value = value>>1;
    end
  endfunction

parameter N = 64;
parameter S = log2(N); 
input [N-1:0] in;
output [S-1:0] out;

wire vld;
LOD #(.N(N)) l1 (in, out, vld);
endmodule


/////////////////////////
module LOD (in, out, vld);

  function [31:0] log2;
    input reg [31:0] value;
    begin
      value = value-1;
      for (log2=0; value>0; log2=log2+1)
	value = value>>1;
    end
  endfunction


parameter N = 64;
parameter S = log2(N);

   input [N-1:0] in;
   output [S-1:0] out;
   output vld;

  generate
    if (N == 2)
      begin
	assign vld = |in;
	assign out = ~in[1] & in[0];
      end
    else if (N & (N-1))
      //LOD #(1<<S) LOD ({1<<S {1'b0}} | in,out,vld);
      LOD #(1<<S) LOD ({in,{((1<<S) - N) {1'b0}}},out,vld);
    else
      begin
	wire [S-2:0] out_l, out_h;
	wire out_vl, out_vh;
	LOD #(N>>1) l(in[(N>>1)-1:0],out_l,out_vl);
	LOD #(N>>1) h(in[N-1:N>>1],out_h,out_vh);
	assign vld = out_vl | out_vh;
	assign out = out_vh ? {1'b0,out_h} : {out_vl,out_l};
      end
  endgenerate
endmodule

/////////////////////////
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

