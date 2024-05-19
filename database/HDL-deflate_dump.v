// This program was cloned from: https://github.com/tomtor/HDL-deflate
// License: GNU General Public License v3.0

module init();
initial begin
	$dumpfile("test.vcd");
	$dumpvars(0, test_fast_bench);
end
endmodule
