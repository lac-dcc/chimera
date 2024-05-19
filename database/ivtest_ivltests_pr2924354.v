// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module main;

   assign impl = 1;
   wire expl = 1;

   genvar i;
   for (i = 0; i < 4; i = i+1) begin : scope
      test dut(.foo(impl), .bar(expl));
   end

endmodule // main

module test(input wire foo, bar);

   initial begin
      #1 $display("foo=%b, bar=%b", foo, bar);
   end
endmodule // test
