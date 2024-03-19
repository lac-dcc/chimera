`include "decoder_3to1.v"
module fadder_dec(
	output sum,
	output cout,
	input a,
	input b,
	input cin
);
		
	wire [7:0] dec_out;
	
	decoder_3to1 dec(.outp(dec_out), .a(a), .b(b), .c(cin) );
	
	assign sum = dec_out[1] | dec_out[2] | dec_out[4] | dec_out[7] ; 
	assign cout = dec_out[3] | dec_out[5] | dec_out[6] | dec_out[7] ; 
	
endmodule