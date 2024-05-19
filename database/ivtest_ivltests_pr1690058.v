// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test;

   parameter bar = 8;
   localparam foo = 2**bar;

   initial begin
      if (foo != 'h100) begin
	 $display("FAILED -- foo = %h", foo);
	 $finish;
      end

      $display("PASSED");
   end

endmodule
