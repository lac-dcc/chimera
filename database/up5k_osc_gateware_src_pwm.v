// This program was cloned from: https://github.com/emeb/up5k_osc
// License: MIT License

// pwm.v - pulse-width modulation
// 03-18-21 E. Brombaugh

`default_nettype none

module pwm(
    input clk,
	input [7:0] val,
	output reg pwm
);
	reg [7:0] cnt;
	initial
		cnt = 0;
		
	always @(posedge clk)
	begin
		cnt <= cnt + 1;
		pwm <= val > cnt;
	end
endmodule
