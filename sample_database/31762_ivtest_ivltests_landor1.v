// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;
    reg [1:0] r1, r2;

    initial begin
	r1 = 2'd2;
	r2 = 2'd0;

	if (r1 || r2)
	    $display("PASSED");
	else
	    $display("FAILED");

	r1 = 2'd2;
	r2 = 2'd1;
	if (r1 && r2)
	    $display("PASSED");
	else
	    $display("FAILED");

    end
endmodule
