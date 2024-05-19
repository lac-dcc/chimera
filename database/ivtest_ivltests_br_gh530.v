// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module dut(a,);

  input wire a;

endmodule

module top;

  wire a;

  dut i(.*);

endmodule
