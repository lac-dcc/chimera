// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

   reg [11:2] a[0:0];
   initial
     begin
	a[0] = 5;
	if (a[0] !== 5) begin
	   $display("FAILED -- a[0] = %d", a[0]);
	   $finish;
	end
	$display("PASSED");
     end

endmodule
