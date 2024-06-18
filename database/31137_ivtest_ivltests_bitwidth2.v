// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module ternary;

   wire [5:0] a;
   wire [6:0] b;
   wire       c;

   wire [5:0] d = c ? a : b;

   initial
     begin
	$display("PASSED");
	$finish;
     end

endmodule
