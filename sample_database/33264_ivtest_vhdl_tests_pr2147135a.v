// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module test();
  wire	 d;
  wire [5:0]	 f;
  b u1 (.c({d, f}));
endmodule

module b (c);

output [6:0] c;

endmodule
