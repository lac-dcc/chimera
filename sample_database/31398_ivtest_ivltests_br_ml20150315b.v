// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

// Regression test for bug reported by Niels Moeller on
// 15-Mar-2015 via the iverilog-devel mailing list.
// Unpacked structs are not supported yet, but should
// be handled gracefully.
module test();

typedef struct {
  logic value;
} data_t;

data_t d;

endmodule
