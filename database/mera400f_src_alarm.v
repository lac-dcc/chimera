// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

// Alarm signal generator (fires when there was no answer on the interface)

module alarm(
	input clk_sys,
	input engage,
	output talarm
);

	parameter ALARM_DLY_TICKS;
	parameter ALARM_TICKS;

	localparam width = $clog2(ALARM_DLY_TICKS+1);

	localparam S_IDLE	= 'd0;
	localparam S_WAIT	= 'd1;
	localparam S_ALARM = 'd2;

	reg [0:width-1] alarm_cnt;
	reg [0:1] state = S_IDLE;

	always @ (posedge clk_sys) begin
		case (state)

			S_IDLE:
				if (engage) begin
					alarm_cnt <= ALARM_DLY_TICKS;
					state <= S_WAIT;
				end

			S_WAIT:
				if (~engage) state <= S_IDLE;
				else if (alarm_cnt == 0) begin
					state <= S_ALARM;
					alarm_cnt <= ALARM_TICKS;
				end else alarm_cnt <= alarm_cnt - 1'b1;

			S_ALARM:
				if (alarm_cnt == 0) state <= S_IDLE;
				else alarm_cnt <= alarm_cnt - 1'b1;

		endcase
	end

	assign talarm = (state == S_ALARM);

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
