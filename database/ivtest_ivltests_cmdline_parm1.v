// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

/*
 * This program tests the simple parameter override from the command
 * line. This program should be compiled with the -Pmain.foo=2 argument.
 */
module main;

   parameter foo = 1;

   initial begin
      if (foo != 2) begin
	 $display("FAILED: %m.foo = %d", foo);
	 $finish;
      end

      $display("PASSED");
   end

endmodule
