// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 D-FLIPFLOP BEHAVIORAL BASIC
************************************************/

module dffb(q,d,clk);

	input d,clk;
	output reg q;

	always@(posedge clk)
	if(clk)
		q = d;

endmodule