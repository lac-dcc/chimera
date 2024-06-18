// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   int foo;

   initial begin
      foo = 1;
      foo ++;
      ++ foo;
      if (foo !== 3) begin
	 $display("FAILED -- foo=%0d", foo);
	 $finish;
      end

      foo --;
      -- foo;
      if (foo !== 1) begin
	 $display("FAILED -- foo=%0d", foo);
	 $finish;
      end

      $display("PASSED");
      $finish;
   end // initial begin

endmodule // main
