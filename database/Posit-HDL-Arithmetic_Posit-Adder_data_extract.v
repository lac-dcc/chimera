module data_extract(in, rc, regime, exp, mant, Lshift);

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
output [Bs-1:0] regime, Lshift;
output [es-1:0] exp;
output [N-es-1:0] mant;

wire [N-1:0] xin = in;
assign rc = xin[N-2];
wire [Bs-1:0] k0, k1;
LOD_N #(.N(N)) xinst_k0(.in({xin[N-2:0],1'b0}), .out(k0));
LZD_N #(.N(N)) xinst_k1(.in({xin[N-3:0],2'b0}), .out(k1));

assign regime = xin[N-2] ? k1 : k0;
assign Lshift = xin[N-2] ? k1+1 : k0;

wire [N-1:0] xin_tmp;
DSR_left_N_S #(.N(N), .S(Bs)) ls (.a({xin[N-3:0],2'b0}),.b(Lshift),.c(xin_tmp));

assign exp= xin_tmp[N-1:N-es];
assign mant= xin_tmp[N-es-1:0];

endmodule

