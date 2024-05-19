// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0

module msg_tx(

	input clk_sys,

	output [0:7] uart_data,
	output uart_send,
	input uart_ready,

	input [0:2] trig,
	output [0:2] ena,

	input [0:7] cmd,
	input [0:7] a1,
	input [0:15] a2,
	input [0:15] a3
);

	// --- Transmission ------------------------------------------------------

	localparam IDLE	= 3'd0;
	localparam LOAD	= 3'd1;
	localparam A1	  = 3'd2;
	localparam A2H	= 3'd3;
	localparam A2L	= 3'd4;
	localparam A3H	= 3'd5;
	localparam A3L	= 3'd6;
	localparam WAIT	= 3'd7;

	reg [0:2] state = IDLE;

	reg [1:3] a;
	reg [0:7] ia1;
	reg [0:15] ia2;
	reg [0:15] ia3;

	always @ (posedge clk_sys) begin

		uart_send <= 0;

		case (state)

			IDLE: begin
				if (trig != 3'b0) begin
					ena[0] <= trig[0];
					ena[1] <= trig[1] & ~trig[0];
					ena[2] <= trig[2] & ~trig[1] & ~trig[0];
					state <= LOAD;
				end
			end

			LOAD: begin
				a <= cmd[5:7];
				ia1 <= a1;
				ia2 <= a2;
				ia3 <= a3;
				uart_data <= cmd;
				uart_send <= 1;
				if (cmd[5]) state <= A1;
				else if (cmd[6]) state <= A2H;
				else if (cmd[7]) state <= A3H;
				else state <= WAIT;
			end

			A1: begin
				if (uart_ready) begin
					uart_data <= ia1;
					uart_send <= 1;
					if (a[2]) state <= A2H;
					else if (a[3]) state <= A3H;
					else state <= WAIT;
				end
			end

			A2H: begin
				if (uart_ready) begin
					uart_data <= ia2[0:7];
					uart_send <= 1;
					state <= A2L;
				end
			end

			A2L: begin
				if (uart_ready) begin
					uart_data <= ia2[8:15];
					uart_send <= 1;
					if (a[3]) state <= A3H;
					else state <= WAIT;
				end
			end

			A3H: begin
				if (uart_ready) begin
					uart_data <= ia3[0:7];
					uart_send <= 1;
					state <= A3L;
				end
			end

			A3L: begin
				if (uart_ready) begin
					uart_data <= ia3[8:15];
					uart_send <= 1;
					state <= WAIT;
				end
			end

			WAIT: begin
				if (uart_ready) begin
					ena <= 3'd0;
					state <= IDLE;
				end
			end

		endcase
	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
