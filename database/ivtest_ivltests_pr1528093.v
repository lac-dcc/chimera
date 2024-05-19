// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   real x;
   real y;

   real bar;

   initial begin
      x = 5.0;
      y = 10.0;
      bar = x % y;
      $display("bar=%f", bar);

      if (bar != 5.0) begin
	 $display("FAILED -- x %% y --> %f (s.b. 5.0)", bar);
	 $finish;
      end

      $display("PASSED");
   end
endmodule // main
