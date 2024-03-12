/*
 * Logarithmic response curve for an LED.
 * Turns an 8-bit value into something that
 * looks linear for the LEDs.
 */
`ifndef _pwm_v_
`define _pwm_v_

module pwm_map8(
	input clk,
	input [7:0] in,
	output [10:0] out
);
	reg [10:0] out;

	always @(posedge clk)
	if (in[7:7] == 7'b1111111) out <= 11'h7FF; else
	if (in[7:6] == 6'b111111)  out <= 11'h5c0 + (in[1:0] << 7); else
	if (in[7:5] == 5'b11111)   out <= 11'h4c0 + (in[2:0] << 6); else
	if (in[7:4] == 4'b1111)    out <= 11'h3C0 + (in[3:0] << 5); else
	if (in[7:5] == 3'b111)     out <= 11'h2C0 + (in[4:0] << 4); else
	if (in[7:6] == 2'b11)      out <= 11'h1C0 + (in[5:0] << 3); else
	if (in[7:7] == 1'b1)       out <= 11'h0C0 + (in[6:0] << 2); else
	if (in[7:6] == 1'b01)      out <= 11'h040 + (in[5:0] << 1); else
	out <= in[5:0];
endmodule

module breath(
	input clk,
	input [7:0] rate,
	output [7:0] bright
);
	parameter INVERT = 0;

	reg [20:0] counter = 0;
	reg [8:0] tick = 0;
	reg [7:0] bright = 0;

	always @(posedge clk)
	begin
		if (counter[20:13] > rate)
		begin
			counter <= 0;
			tick <= tick + 1;
		end else
			counter <= counter + 1;

		// bright up from 0-255 and down from 256-511
		if (tick < 256)
			bright <= tick;
		else
			bright <= 511 - tick;
	end
endmodule


/*
 * Use this instead of driving the RGB led directly
 * to avoid over-volting the red LED.
 *
 * The 8-bit input is expanded to a 11-bit exponential scale
 * so that the LED feels more linear across the range.
 */
module rgb_drv(
	input clk,
	input enable,
	input [7:0] bright_r,
	input [7:0] bright_g,
	input [7:0] bright_b,
	output [2:0] out
);
	wire [10:0] exp_r;
	wire [10:0] exp_g;
	wire [10:0] exp_b;
	pwm_map8 map_r(clk, bright_r, exp_r);
	pwm_map8 map_b(clk, bright_b, exp_b);
	pwm_map8 map_g(clk, bright_g, exp_g);

	reg [2:0] out;
	reg [2:0] pwm;
	reg [10:0] counter = 0;

	always @(posedge clk)
	begin
		counter <= counter + 1;
		pwm[0] <= counter < exp_r;
		pwm[1] <= counter < exp_g;
		pwm[2] <= counter < exp_b;
	end

/* ice40up5k doesn't have SB_LED_DRV_CUR?
	wire ledpu;
	SB_LED_DRV_CUR ledpu_drv(
		.EN(enable),
		.LEDPU(ledpu)
	);
*/
	SB_RGBA_DRV #(
// upduino board has the pins in the order GRB
		.RGB1_CURRENT("0b000011"), // 8mA: red needs barely any
		.RGB0_CURRENT("0b001111"), // 16mA: green needs some
		.RGB2_CURRENT("0b111111") // 24mA: blue is a thirsty boy
	) RGB_DRV(
		.RGBLEDEN(enable),
		.CURREN(1'b1),
		.RGB0PWM(pwm[1]), // g
		.RGB1PWM(pwm[2]), // r
		.RGB2PWM(pwm[0]), // b
// these are ignored? the connections are hard wired
		.RGB0(out[0]),
		.RGB1(out[1]),
		.RGB2(out[2])
	);
endmodule

`endif
