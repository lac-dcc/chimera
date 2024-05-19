// This program was cloned from: https://github.com/emeb/up5k_basic
// License: MIT License

// led_pwm.v - wrapper for LED PWM and driver IP cores
// 03-24-19 E. Brombaugh

`default_nettype none

module led_pwm(
	input clk,				// system clock
	input rst,				// system reset
	input cs,				// chip select
	input we,				// write enable
	input [3:0] addr,		// register select
	input [7:0] din,		// data bus input
	output reg [7:0] dout,	// data bus output
	output rgb0,			// rgb0 pin
	output rgb1,			// rgb1 pin
	output rgb2				// rgb2 pin
);
	// local control regs
	reg [7:0] mycr;
	always @(posedge clk)
		if(rst)
			mycr <= 8'h00;
		else if(cs & we & (addr==4'hF))
			mycr <= din;
	
	// data output
	always @(posedge clk)
		if(cs & !we)
			if(addr == 4'hF)
				dout <= mycr;	// read back mycr
			else
				dout <= {7'h00,led_on};	// read back status

	// LED PWM IP core
	wire LED0, LED1, LED2;
	wire led_on;
	SB_LEDDA_IP PWMgen_inst (
		//.LEDDRST(rst),	// "doesn't really exist"
		.LEDDCS(cs),
		.LEDDCLK(clk),
		.LEDDDAT7(din[7]),
		.LEDDDAT6(din[6]),
		.LEDDDAT5(din[5]),
		.LEDDDAT4(din[4]),
		.LEDDDAT3(din[3]),
		.LEDDDAT2(din[2]),
		.LEDDDAT1(din[1]),
		.LEDDDAT0(din[0]),
		.LEDDADDR3(addr[3]),
		.LEDDADDR2(addr[2]),
		.LEDDADDR1(addr[1]),
		.LEDDADDR0(addr[0]),
		.LEDDDEN(we),
		.LEDDEXE(mycr[6]),
		.PWMOUT0(LED0),
		.PWMOUT1(LED1),
		.PWMOUT2(LED2),
		.LEDDON(led_on)
	);
	
	// RGB LED Driver IP core
	SB_RGBA_DRV #(
		.CURRENT_MODE("0b1"),
		.RGB0_CURRENT("0b000001"),
		.RGB1_CURRENT("0b000001"),
		.RGB2_CURRENT("0b000011")
	) RGBA_DRIVER (
		.CURREN(mycr[4]),
		.RGBLEDEN(mycr[5]),
		.RGB0PWM(mycr[7] ? LED0 : mycr[0]),
		.RGB1PWM(mycr[7] ? LED1 : mycr[1]),
		.RGB2PWM(mycr[7] ? LED2 : mycr[2]),
		.RGB0(rgb0),
		.RGB1(rgb1),
		.RGB2(rgb2)
	);
endmodule
