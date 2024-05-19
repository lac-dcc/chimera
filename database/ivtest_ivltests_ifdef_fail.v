// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module if_fail_test();

`ifdef
`ifndef
`elsif
`else
`endif

  initial $display("FAILED");

endmodule
