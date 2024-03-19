`timescale 1ns / 1ps
module FP_to_posit(in, out);

function [31:0] log2;
input reg [31:0] value;
	begin
	value = value-1;
	for (log2=0; value>0; log2=log2+1)
        	value = value>>1;
      	end
endfunction

parameter N = 16;
parameter E = 5;
parameter es = 2;	//ES_max = E-1
parameter M = N-E-1;
parameter BIAS = (2**(E-1))-1;

parameter Bs = log2(N);

input [N-1:0] in;
output [N-1:0] out;

wire s_in = in[N-1];
wire [E-1:0] exp_in = in[N-2:N-1-E];
wire [M-1:0] mant_in = in[M-1:0];
wire zero_in = ~|{exp_in,mant_in};
wire inf_in = &exp_in;

wire [M:0] mant = {|exp_in, mant_in};

wire [N-1:0] LOD_in = {mant,{E{1'b0}}};
wire[Bs-1:0] Lshift;
LOD_N #(.N(N)) uut (.in(LOD_in), .out(Lshift));

wire[N-1:0] mant_tmp;
DSR_left_N_S #(.N(N), .S(Bs)) ls (.a(LOD_in),.b(Lshift),.c(mant_tmp));

wire [E:0] exp = {exp_in[E-1:1], exp_in[0] | (~|exp_in)} - BIAS - Lshift;

//Exponent and Regime Computation
wire [E:0] exp_N = exp[E] ? -exp : exp;
wire [es-1:0] e_o = (exp[E] & |exp_N[es-1:0]) ? exp[es-1:0] : exp_N[es-1:0];
wire [E-es-1:0] r_o = (~exp[E] || (exp[E] & |exp_N[es-1:0])) ? {{Bs{1'b0}},exp_N[E-1:es]} + 1'b1 : {{Bs{1'b0}},exp_N[E-1:es]};

//Exponent and Mantissa Packing
wire [2*N-1:0]tmp_o = { {N{~exp[E]}}, exp[E], e_o, mant_tmp[N-2:es]};

//Including Regime bits in Exponent-Mantissa Packing
wire [2*N-1:0] tmp1_o;
wire [Bs-1:0] diff_b;
generate
	if(E-es > Bs) 	assign diff_b = |r_o[E-es-1:Bs] ? {{(Bs-2){1'b1}},2'b01} : r_o[Bs-1:0];
	else 		assign diff_b = r_o;
endgenerate
DSR_right_N_S #(.N(2*N), .S(Bs)) dsr2 (.a(tmp_o), .b(diff_b), .c(tmp1_o));

//Final Output
wire [N-1:0] tmp1_oN = s_in ? -tmp1_o[N-1:0] : tmp1_o[N-1:0];
assign out = inf_in|zero_in|(~mant_tmp[N-1]) ? {inf_in,{N-1{1'b0}}} : {s_in, tmp1_oN[N-1:1]};

endmodule

