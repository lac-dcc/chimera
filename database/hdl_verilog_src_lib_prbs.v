// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-08-22 by mza
// idea stolen from http://fpgasrus.com/prbs.html
// last updated 2020-05-29 by mza

module prbs #(
	parameter WIDTH = 128,
	parameter TAP1 = 27,
	parameter TAP2 = 30
) (
	input clock,
	input reset,
	output reg [WIDTH-1:0] word = 0
);
	always @(posedge clock) begin
		if (reset) begin
			word <= 1;
		end else begin
			word <= { word[WIDTH-2:0], word[TAP1]^word[TAP2] };
		end
	end
endmodule // prbs

