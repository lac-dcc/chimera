// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

   parameter [39:0] foo = 5;

   initial begin
      if ($bits(foo) != 40) begin
	 $display("FAILED -- $bits(foo) == %d", $bits(foo));
	 $finish;
      end

      $display("PASSED");
   end

endmodule // test
