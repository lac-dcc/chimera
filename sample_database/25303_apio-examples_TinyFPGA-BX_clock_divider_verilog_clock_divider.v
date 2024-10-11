// This program was cloned from: https://github.com/FPGAwars/apio-examples
// License: GNU General Public License v2.0

module clock_divider
(
	input clock_in,
	output clock_div4_0,
	output clock_div4_90
);

reg clock_div2 = 0;
reg clock_div4_0 = 0;
reg clock_div4_90 = 0;

always @(posedge clock_in) begin
	clock_div2 <= ~clock_div2;
end

always @(posedge clock_div2) begin
	clock_div4_0 <= ~clock_div4_0;
end

always @(negedge clock_div2) begin
	clock_div4_90 <= ~clock_div4_90;
end

endmodule
