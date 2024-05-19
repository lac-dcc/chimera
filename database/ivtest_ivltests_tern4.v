// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   reg out, c, a, b;

   initial begin
      c = 0;
      a = 0;
      b = 1;
      out = c ? (a & b) : b;

      $display("%b = %b ? (%b & %b) : %b;", out, c, a, b, b);
      if (out !== 1) begin
	 $display("FAILED -- out=%b result is incorrect!", out);
	 $finish;
      end

      $display("PASSED");
      $finish;
   end

endmodule // main
