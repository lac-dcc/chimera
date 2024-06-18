// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 D-LATCH BEHAVIORAL
************************************************/

module dlatch_bh(q,d,en);

	input en,d;
	output reg q;

	always@(en,q)
		if(en) q=d;

endmodule