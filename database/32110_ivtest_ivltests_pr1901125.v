// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// pr1901125

module test();
   function integer hallo (input integer x);
      hallo = x - 1;
   endfunction // hallo

   integer  foo;
   initial begin
      foo = hallo(10);
      if (foo !== 9) begin
	 $display("FAILED -- foo=%d", foo);
	 $finish;
      end
      $display("PASSED");
   end

endmodule
