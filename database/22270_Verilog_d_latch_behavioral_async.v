// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 D-LATCH BEHAVIORAL WITH ASYNC RESET
************************************************/

module dlatch_bh(q,d,en,rst);

	input en,d,rst;
	output reg q;

	always@(en,q,rst)
	if(rst)
		q = 1'b0;
	else if(en) q=d;

endmodule