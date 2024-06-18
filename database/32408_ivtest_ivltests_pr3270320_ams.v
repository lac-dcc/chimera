// This program was cloned from: https://github.com/steveicarus/ivtest
// License: GNU General Public License v2.0

module bug();

wire [7:0] b;

assign b = $abs(missing);

endmodule
