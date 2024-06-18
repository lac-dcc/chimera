// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test1();		// bad
	initial begin
		reg a;
		for (int i=0;i<1;i++) a=1;
	end
endmodule


module test2();		// bad
	initial begin : block_name
		for (int i=0;i<1;i++) ;
	end
endmodule

module test3();		// bad
	reg a [1:0];
	initial begin : block_name
		foreach (a[i]) ;
	end
endmodule


module test4();		// ok
	initial begin
		for (int i=0;i<1;i++) ;
	end
endmodule

module stub;
   initial #100 $display("PASSED");
endmodule // stub
