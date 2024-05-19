// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();

task t(integer a, b);
  $display(a,,b);
endtask

initial t(0, 1);

endmodule
