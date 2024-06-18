// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test(input wire foo);
   initial $display("FAILED", foo);
   final $display(foo);
endmodule // test

program main;

   reg foo = 1;

   // It is not legal to instantiate modules in program blocks
   test dut(foo);

endprogram // main
