// This program was cloned from: https://github.com/matrix-io/matrix-creator-fpga
// License: GNU General Public License v3.0

module IOBUF (
	input T,
	input I,
	output O,
	inout IO
);
	assign IO = ~T ? I : 1'bz;
	assign O =  T ? IO : 1'bz;

endmodule
