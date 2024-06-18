// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

`timescale 1us / 1ns

module usns;
    initial begin
	#123;
	$mytest;
    end
endmodule

`timescale 1ns / 1ns

module nsns;
    initial begin
	#456;
	$mytest;
    end
endmodule
