`timescale 1ns / 1ps
module Posit_to_FP (in, out);

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
parameter es = 2;

parameter M = N-E-1;
parameter BIAS = (2**(E-1))-1;
parameter Bs = log2(N); 
parameter EO = E > es+Bs ? E : es+Bs;

input [N-1:0] in;
output [N-1:0] out;

wire s = in[N-1];
wire zero_tmp = |in[N-2:0];
wire inf_in = in[N-1] & (~zero_tmp);
wire zero_in = ~(in[N-1] | zero_tmp);

//Data Extraction
wire rc;
wire [Bs-1:0] rgm, Lshift;
wire [es-1:0] e;
wire [N-es-1:0] mant;
wire [N-1:0] xin = s ? -in : in;
data_extract #(.N(N),.es(es)) uut_de1(.in(xin), .rc(rc), .regime(rgm), .exp(e), .mant(mant), .Lshift(Lshift));

wire [N-1:0] m = {zero_tmp,mant,{es-1{1'b0}}};

//Exponent and Regime Computation
wire [EO+1:0] e_o;
assign e_o = {(rc ? {{EO-es-Bs+1{1'b0}},rgm} : -{{EO-es-Bs+1{1'b0}},rgm}),e} + BIAS;
//Final Output
assign out = inf_in|e_o[EO:E]|&e_o[E-1:0] ? {s,{E-1{1'b1}},{M{1'b0}}} : (zero_in|(~m[N-1]) ? {s,{E-1{1'b0}},m[N-2:E]} : { s, e_o[E-1:0], m[N-2:E]} );


endmodule
