// This program was cloned from: https://github.com/haojunliu/OpenFPGA
// License: BSD 2-Clause "Simplified" License

/* pg 393 - logic with DFF */

module bm_DL_logic_w_Dff(x1, x2, x3, Clock, f, g);
	input x1, x2, x3, Clock;
	output f, g;
	reg f, g;
	
	always @(posedge Clock)
	begin
		f <= x1 & x2;
		g <= f | x3;
	end
	
endmodule
