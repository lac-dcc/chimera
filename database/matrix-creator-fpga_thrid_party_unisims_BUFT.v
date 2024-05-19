// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

module BUFT (
	input I,
	output O,
	input T
);
	assign O =  ~T ? I: 1'bz;

endmodule
