// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

module OBUFT (
	input T,
	input I,
	output O
);
	assign O = ~T ? I : 1'bz;

endmodule
