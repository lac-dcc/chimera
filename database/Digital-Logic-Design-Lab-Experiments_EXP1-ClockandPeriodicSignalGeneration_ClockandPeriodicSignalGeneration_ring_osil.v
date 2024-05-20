// This program was cloned from: https://github.com/sep-81/Digital-Logic-Design-Lab-Experiments
// License: MIT License

`timescale 1ps/1ps
module ring_osil(en,clk);
	input en;
	output clk;
	parameter N = 3;
	parameter D = 1;
	wire [0 : 2*N-1]w ;
	genvar i;
	generate
		for (i = 0; i < 2*N-1; i = i + 1) begin 
			 not#(D)X(w[i+1],w[i]);
		end
	endgenerate
	assign w[0] = en & w[2*N-1];
	assign clk = w[2*N-1];

endmodule
