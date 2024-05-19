// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Control panel - system timer

module timer(
	input clk_sys,
	input enable,
	output zegar
);

	parameter TIMER_CYCLE_MS;
	parameter CLK_SYS_HZ;

	// a: 6-1 : 2 ms = 500 Hz = 100_000 cycles @ 50MHz
	// a: 6-2 : 4 ms = 250 Hz = 200_000 cycles @ 50MHz
	// a: 6-3 : 8 ms = 125 Hz = 400_000 cycles @ 50MHz
	// a: 6-4 : 10 ms = 100 Hz = 500_000 cycles @ 50MHz
	// a: 6-5 : 20 ms = 50 Hz = 1_000_000 cycles @ 50MHz

	localparam prescale = TIMER_CYCLE_MS * (CLK_SYS_HZ / 1_000);
	localparam width = $clog2(prescale+1);
	localparam [width-1:0] period = prescale[width-1:0] - 1'b1;

	reg [width-1:0] timer_cnt = period;
	always @ (posedge clk_sys) begin
		if (timer_cnt == 0) timer_cnt <= period;
		else timer_cnt <= timer_cnt - 1'b1;
	end

	assign zegar = enable & (timer_cnt == 0);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab

