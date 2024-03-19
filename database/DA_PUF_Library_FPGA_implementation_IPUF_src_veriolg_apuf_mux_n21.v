
module mux_n21 #(parameter nCTRL = 8)(ins,ctrls,out);

	localparam nIN = 2**nCTRL;
	
	input [nIN-1:0] ins;
	input [nCTRL-1:0] ctrls;
	output out;

	assign out = ins[ctrls];

endmodule
