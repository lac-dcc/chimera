// This program was cloned from: https://github.com/X-Illuminati/verilog-playground
// License: Apache License 2.0

module top (
	input        clki,
	input  [7:0] dip,
	output [7:0] disp,
	output       led1,
	output       led2,
	output       led3,
	output       led4,
	output       led5
);


	//nextpnr would probably infer a global buffer for the clk input
	//but better not to leave it to chance
	SB_GB clk_gb (
		.USER_SIGNAL_TO_GLOBAL_BUFFER(clki),
		.GLOBAL_BUFFER_OUTPUT(sysclk)
	);

	localparam BCDSIZE = $clog2(16);
	localparam DELAYSIZE = 23; //approx .7 seconds at 12 MHz
	localparam COUNTERSIZE = BCDSIZE+DELAYSIZE;

	reg [COUNTERSIZE-1:0] counter = 0;
	reg [BCDSIZE-1:0] outcnt;

	always @(posedge sysclk) begin
		counter <= counter + 1;
		outcnt <= counter >> DELAYSIZE;
	end
	assign slowclock = outcnt[0];

	reg [7:0] lfsrout;

	lfsr mylfsr
	(
		.clk(slowclock),
		.taps(dip),
		.out(lfsrout)
	);

	seven_seg #(.INVERT(1)) decode_out
	(
		.bcd(lfsrout[3:0]),
		.seg_a(disp[4]),
		.seg_b(disp[0]),
		.seg_c(disp[2]),
		.seg_d(disp[3]),
		.seg_e(disp[6]),
		.seg_f(disp[5]),
		.seg_g(disp[1]),
	);
	assign disp[7] = ~slowclock; //decimal point
endmodule
