// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
	parameter x = "String with escaped backslash at end \\";
	initial
`ifdef __ICARUS__
		$display("PASSED");
`else
		$display("Not Icarus\nPASSED");
`endif
endmodule
