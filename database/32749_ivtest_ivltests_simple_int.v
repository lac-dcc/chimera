// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   int foo, bar = 10;

   int wire_res;
   int var_res;

   assign wire_res = foo*bar;
   initial begin
      foo = 9;
      var_res = foo * bar;
      $display("%0d * %0d = %0d %0d", foo, bar, foo * bar, var_res);

      if ((foo * bar) !== 90) begin
	 $display("FAILED");
	 $finish;
      end

      if (var_res !== 90) begin
	 $display("FAILED");
	 $finish;
      end

      #0; // allow CA to propagate
      $display("%0d * %0d = %0d", foo, bar, wire_res);
      if (wire_res !== 90) begin
	 $display("FAILED");
	 $finish;
      end

      $display("PASSED");
   end

endmodule // main
