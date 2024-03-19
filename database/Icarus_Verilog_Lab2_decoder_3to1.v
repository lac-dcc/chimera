`ifndef DECODER_3TO1
`define DECODE_3TO1
	module decoder_3to1(
		output [7:0] outp,
		input a,
		input b,
		input c
	);
		
		wire abar,bbar,cbar;
		
		not(abar,a);
		not(bbar,b);
		not(cbar,c);
		
		and(outp[0], abar,bbar,cbar);
		and(outp[1], abar,bbar,c);
		and(outp[2], abar,b,cbar);
		and(outp[3], abar,b,c);

		and(outp[4], a,bbar,cbar);
		and(outp[5], a,bbar,c);
		and(outp[6], a,b,cbar);
		and(outp[7], a,b,c);
		
	endmodule
`endif