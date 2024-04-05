/** \file
 * Demo the RGB LED on the upduino v2
 *
 * Note that the LED pins are inverted, so 0 is on
 */

module top(
	output led_r,
	output led_g,
	output led_b
);
	// turn off the green and blue (drive the lines high)
	assign led_g = 1;
	assign led_b = 1;


	// enable the high frequency oscillator,
	// which generates a 48 MHz clock
	wire clk_48;
	SB_HFOSC u_hfosc (
		.CLKHFPU(1'b1),
		.CLKHFEN(1'b1),
		.CLKHF(clk_48)
	);

	// increment the global counter at 48 MHz
	reg [31:0] counter;
	always @(posedge clk_48)
		counter <= counter + 1;


	// flash the LED in a pulse, pulse, pause, pulse, pulse pattern
	reg [7:0] pulse = 8'b10010000;

	always @(posedge counter[22])
	begin
		led_r <= !pulse[0];
		pulse <= { pulse[0], pulse[7:1] };
	end

endmodule
