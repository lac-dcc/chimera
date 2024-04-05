/** \file
 * Demo the pulsing LED on the upduino v2
 *
 * Note that the LED pins are inverted, so 0 is on
 */
`include "util.v"

module top(
	output led_r,
	output led_g,
	output led_b
);
	wire clk_48;
	SB_HFOSC u_hfosc (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_48)
	);

	reg [31:0] counter;

	always @(posedge clk_48)
		counter <= counter + 1;

	wire [7:0] bright_r;
	wire [7:0] bright_b;
	always @(*)
		if (counter[28]) begin
			bright_r = counter[27:20];
			bright_b = 255 - counter[27:20];
		end else begin
			bright_r = 255 - counter[27:20];
			bright_b = counter[27:20];
		end

	assign led_g = 1;

	pwm pwm_r(
		.clk(clk_48),
		.bright(bright_r),
		.out(led_r)
	);

	pwm pwm_b(
		.clk(clk_48),
		.bright(bright_b),
		.out(led_b)
	);

endmodule
