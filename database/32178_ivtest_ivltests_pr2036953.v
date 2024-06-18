// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

reg [1:0] width1[1:0];
reg [2:0] width2[1:0];

reg [1:0] width1_2;

initial
begin
	width1[0] = 1;
	width2[0] = 2;

	width1_2 = width1[0] | width2[0];

	if(width1_2 !== 3)
		$display("FAILED");
	else
		$display("PASSED");
end

endmodule
