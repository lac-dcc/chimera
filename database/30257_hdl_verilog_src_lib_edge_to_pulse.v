// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2018-07-30 by mza
// originally from file mza-test008.16-segment-driver.button-debounce-duration-counter.v
// last updated 2020-05-29 by mza

module edge_to_pulse #(
	parameter polarity = 1
) (
	input clock,
	input i,
	output reg o = 0
);
// .polarity(1) means use positive logic (detect rising edge)
	reg state = 0;
	always @(posedge clock) begin
		o <= ~polarity;
		if (i==polarity) begin
			if (state!=polarity) begin
				o <= polarity;
				state <= polarity;
			end
		end else begin
			state <= ~polarity;
		end
	end
endmodule // edge_to_pulse

