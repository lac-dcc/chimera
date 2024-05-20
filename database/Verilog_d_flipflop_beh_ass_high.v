// This program was cloned from: https://github.com/paollacq/Verilog
// License: MIT License

/**************************************************
P1.1 BEHAVIORAL POSITIVE EDGE TRIGGERED D-FLIPFLOP   
ASYNCHRONOUS ACTIVE HIGH RESET
************************************************/


module dffb(q,d,clk,rst);

	input d,clk,rst;
	output reg q;

	always@(posedge clk or posedge rst)
		if(rst)
			q <= 1'b0;
					else
			q <= d;

endmodule