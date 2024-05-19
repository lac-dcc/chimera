// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// I-SK unit (system interface)

module isk(
	input clk_sys,
	input [0:`BUS_MAX] cpu0d,
	output [0:`BUS_MAX] cpu0r,
	input [0:`BUS_MAX] cpu1d,
	output [0:`BUS_MAX] cpu1r,
	input [0:`BUS_MAX] iobd,
	output [0:`BUS_MAX] iobr,
	input [0:`BUS_MAX] memd,
	output [0:`BUS_MAX] memr,
	input [1:4] zg,
	input [1:4] zz,
	output [1:4] zw
);

	always @ (posedge clk_sys) begin
		if (zg[1] & ~zw[2] & ~zw[3] & ~zw[4]) zw[1] <= 1;
		else begin
			zw[1] <= 0;
			if (zg[2] & ~zw[1] & ~zw[3] & ~zw[4]) zw[2] <= 1;
			else begin
				zw[2] <= 0;
				if (zg[3] & ~zw[1] & ~zw[2] & ~zw[4]) zw[3] <= 1;
				else begin
					zw[3] <= 0;
					if (zg[4] & ~zw[1] & ~zw[2] & ~zw[3]) zw[4] <= 1;
					else begin
						zw[4] <= 0;
					end
				end
			end
		end
	end

	assign cpu0r =	0			| cpu1d	|	iobd	| memd;
	assign cpu1r =	cpu0d	|	0			| iobd	| memd;
	assign iobr =		cpu0d	| cpu1d	| 0			| memd;
	assign memr =		cpu0d	| cpu1d	| iobd	| 0;

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
