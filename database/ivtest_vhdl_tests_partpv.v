// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// This test is intended to generate a IVL_LPM_SELECT_PV
// in the `b' port map

module top;

  wire [7:0] foo;

  bot b( .q(foo[3:0]) );

endmodule // top

module bot(q);
  output [3:0] q;

endmodule
