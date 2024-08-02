// This program was cloned from: https://github.com/sinkswim/veriloglib
// License: MIT License

module and2(input x, input y, output z);
	and(z, x, y);
	// assign z = (x == 1 and y == 1 ?) 1 : 0;
	// assign z = x ? y? 1 : 0;
	// always @* if(x == 1 and y == 1) z = 1 else z = 0
endmodule;
