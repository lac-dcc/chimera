// This program was cloned from: https://github.com/jobitaki/bobATC_tapeout
// License: Apache License 2.0

`default_nettype none
// Latest version
module BobTop (
	clock,
	reset,
	rx,
	runway_override,
	emergency_override,
	tx,
	framing_error,
	runway_active,
	emergency,
	receiving,
	sending
);
	input wire clock;
	input wire reset;
	input wire rx;
	input wire [1:0] runway_override;
	input wire emergency_override;
	output wire tx;
	output wire framing_error;
	output wire [1:0] runway_active;
	output wire emergency;
	output wire receiving;
	output wire sending;
	wire [7:0] uart_rx_data;
	wire [7:0] uart_tx_data;
	wire uart_rx_valid;
	wire uart_tx_ready;
	wire uart_tx_send;
	UartRX #(
		.CLK_HZ(25000000),
		.BAUD_RATE(115200)
	) receiver(
		.clock(clock),
		.reset(reset),
		.rx(rx),
		.data(uart_rx_data),
		.done(uart_rx_valid),
		.framing_error(framing_error),
		.receiving(receiving)
	);
	UartTX #(
		.CLK_HZ(25000000),
		.BAUD_RATE(115200)
	) transmitter(
		.clock(clock),
		.reset(reset),
		.send(uart_tx_send),
		.data(uart_tx_data),
		.tx(tx),
		.ready(uart_tx_ready),
		.sending(sending)
	);
	reg [1:0] ro_temp;
	reg [1:0] ro_sync;
	reg eo_temp;
	reg eo_sync;
	always @(posedge clock) begin
		ro_temp <= runway_override;
		eo_temp <= emergency_override;
		ro_sync <= ro_temp;
		eo_sync <= eo_temp;
	end
	Bob bobby(
		.clock(clock),
		.reset(reset),
		.uart_rx_data(uart_rx_data),
		.uart_rx_valid(uart_rx_valid),
		.uart_tx_data(uart_tx_data),
		.uart_tx_ready(uart_tx_ready),
		.uart_tx_send(uart_tx_send),
		.runway_active(runway_active),
		.runway_override(ro_sync),
		.emergency_out(emergency),
		.emergency_override(eo_sync)
	);
endmodule
module Bob (
	clock,
	reset,
	uart_rx_data,
	uart_rx_valid,
	runway_override,
	emergency_override,
	uart_tx_data,
	uart_tx_ready,
	uart_tx_send,
	runway_active,
	emergency_out
);
	input wire clock;
	input wire reset;
	input wire [7:0] uart_rx_data;
	input wire uart_rx_valid;
	input wire [1:0] runway_override;
	input wire emergency_override;
	output wire [7:0] uart_tx_data;
	input wire uart_tx_ready;
	output wire uart_tx_send;
	output wire [1:0] runway_active;
	output wire emergency_out;
	wire [7:0] uart_request;
	wire uart_rd_request;
	wire uart_empty;
	wire runway_id;
	wire lock;
	wire unlock;
	reg [3:0] cleared_id_to_lock;
	wire sel_takeoff_id_lock;
	wire [9:0] runway;
	wire queue_takeoff_plane;
	wire unqueue_takeoff_plane;
	wire [3:0] cleared_takeoff_id;
	wire takeoff_fifo_full;
	wire takeoff_fifo_empty;
	wire queue_landing_plane;
	wire unqueue_landing_plane;
	wire [3:0] cleared_landing_id;
	wire landing_fifo_full;
	wire landing_fifo_empty;
	wire send_hold;
	wire send_say_ag;
	wire send_divert;
	wire send_divert_landing;
	wire send_valid_id;
	wire send_invalid_id;
	wire [1:0] send_clear;
	reg [7:0] reply_to_send;
	wire send_reply;
	wire queue_reply;
	wire reply_fifo_full;
	wire reply_fifo_empty;
	reg emergency;
	wire set_emergency;
	wire unset_emergency;
	reg [3:0] emergency_id;
	FIFO #(
		.WIDTH(8),
		.DEPTH(4)
	) uart_requests(
		.clock(clock),
		.reset(reset),
		.data_in(uart_rx_data),
		.we(uart_rx_valid),
		.re(uart_rd_request),
		.data_out({uart_request[7-:4], uart_request[3-:3], uart_request[0]}),
		.full(),
		.empty(uart_empty)
	);
	FIFO #(
		.WIDTH(4),
		.DEPTH(8)
	) takeoff_fifo(
		.clock(clock),
		.reset(reset),
		.data_in(uart_request[7-:4]),
		.we(queue_takeoff_plane),
		.re(unqueue_takeoff_plane),
		.data_out(cleared_takeoff_id),
		.full(takeoff_fifo_full),
		.empty(takeoff_fifo_empty)
	);
	FIFO #(
		.WIDTH(4),
		.DEPTH(8)
	) landing_fifo(
		.clock(clock),
		.reset(reset),
		.data_in(uart_request[7-:4]),
		.we(queue_landing_plane),
		.re(unqueue_landing_plane),
		.data_out(cleared_landing_id),
		.full(landing_fifo_full),
		.empty(landing_fifo_empty)
	);
	wire [3:0] new_id;
	reg [3:0] id_in;
	wire sel_diverted_id;
	wire take_id;
	wire release_id;
	wire id_full;
	wire [15:0] all_id;
	always @(*)
		if (sel_diverted_id)
			id_in = cleared_landing_id;
		else
			id_in = uart_request[7-:4];
	AircraftIDManager id_manager(
		.clock(clock),
		.reset(reset),
		.id_in(id_in),
		.release_id(release_id),
		.take_id(take_id),
		.id_out(new_id),
		.all_id(all_id),
		.full(id_full)
	);
	ReadRequestFsm fsm(
		.emergency(emergency_out),
		.clock(clock),
		.reset(reset),
		.uart_empty(uart_empty),
		.uart_request(uart_request),
		.takeoff_fifo_full(takeoff_fifo_full),
		.landing_fifo_full(landing_fifo_full),
		.takeoff_fifo_empty(takeoff_fifo_empty),
		.landing_fifo_empty(landing_fifo_empty),
		.reply_fifo_full(reply_fifo_full),
		.runway_active(runway_active),
		.all_id(all_id),
		.id_full(id_full),
		.emergency_id(emergency_id),
		.runway(runway),
		.uart_rd_request(uart_rd_request),
		.queue_takeoff_plane(queue_takeoff_plane),
		.queue_landing_plane(queue_landing_plane),
		.unqueue_takeoff_plane(unqueue_takeoff_plane),
		.unqueue_landing_plane(unqueue_landing_plane),
		.send_clear(send_clear),
		.send_hold(send_hold),
		.send_say_ag(send_say_ag),
		.send_divert(send_divert),
		.send_divert_landing(send_divert_landing),
		.send_invalid_id(send_invalid_id),
		.send_valid_id(send_valid_id),
		.queue_reply(queue_reply),
		.lock(lock),
		.unlock(unlock),
		.runway_id(runway_id),
		.set_emergency(set_emergency),
		.unset_emergency(unset_emergency),
		.take_id(take_id),
		.release_id(release_id),
		.sel_takeoff_id_lock(sel_takeoff_id_lock),
		.sel_diverted_id(sel_diverted_id)
	);
	always @(posedge clock)
		if (reset)
			reply_to_send <= 0;
		else if (send_clear[0] ^ send_clear[1]) begin
			if (send_clear[0]) begin
				reply_to_send[7-:4] <= cleared_takeoff_id;
				reply_to_send[3-:3] <= 3'b011;
				reply_to_send[0] <= runway_id;
			end
			else if (send_clear[1]) begin
				reply_to_send[7-:4] <= cleared_landing_id;
				reply_to_send[3-:3] <= 3'b011;
				reply_to_send[0] <= runway_id;
			end
		end
		else if (send_hold) begin
			reply_to_send[7-:4] <= uart_request[7-:4];
			reply_to_send[3-:3] <= 3'b100;
			reply_to_send[0] <= 1'b0;
		end
		else if (send_say_ag) begin
			reply_to_send[7-:4] <= uart_request[7-:4];
			reply_to_send[3-:3] <= 3'b101;
			reply_to_send[0] <= 1'b0;
		end
		else if (send_divert) begin
			reply_to_send[7-:4] <= uart_request[7-:4];
			reply_to_send[3-:3] <= 3'b110;
			reply_to_send[0] <= 1'b0;
		end
		else if (send_divert_landing) begin
			reply_to_send[7-:4] <= cleared_landing_id;
			reply_to_send[3-:3] <= 3'b110;
			reply_to_send[0] <= 1'b0;
		end
		else if (send_invalid_id) begin
			reply_to_send[7-:4] <= 4'd0;
			reply_to_send[3-:3] <= 3'b111;
			reply_to_send[0] <= 1'b1;
		end
		else if (send_valid_id) begin
			reply_to_send[7-:4] <= new_id;
			reply_to_send[3-:3] <= 3'b111;
			reply_to_send[0] <= 1'b0;
		end
	FIFO #(
		.WIDTH(8),
		.DEPTH(4)
	) uart_replies(
		.clock(clock),
		.reset(reset),
		.data_in(reply_to_send),
		.we(queue_reply),
		.re(send_reply),
		.data_out(uart_tx_data),
		.full(reply_fifo_full),
		.empty(reply_fifo_empty)
	);
	SendReplyFsm reply_fsm(
		.clock(clock),
		.reset(reset),
		.uart_tx_ready(uart_tx_ready),
		.reply_fifo_empty(reply_fifo_empty),
		.send_reply(send_reply),
		.uart_tx_send(uart_tx_send)
	);
	always @(*)
		if (sel_takeoff_id_lock)
			cleared_id_to_lock = cleared_takeoff_id;
		else
			cleared_id_to_lock = cleared_landing_id;
	RunwayManager runway_manager(
		.clock(clock),
		.reset(reset),
		.plane_id_unlock(uart_request[7-:4]),
		.plane_id_lock(cleared_id_to_lock),
		.runway_id(runway_id),
		.lock(lock),
		.unlock(unlock),
		.runway_active(runway_active),
		.runway_override(runway_override),
		.runway(runway)
	);
	always @(posedge clock)
		if (reset) begin
			emergency_id <= 4'd0;
			emergency <= 1'b0;
		end
		else if (set_emergency) begin
			emergency_id <= uart_request[7-:4];
			emergency <= 1'b1;
		end
		else if (unset_emergency)
			emergency <= 1'b0;
	assign emergency_out = emergency | emergency_override;
endmodule
module ReadRequestFsm (
	clock,
	reset,
	uart_empty,
	uart_request,
	takeoff_fifo_full,
	landing_fifo_full,
	takeoff_fifo_empty,
	landing_fifo_empty,
	reply_fifo_full,
	runway_active,
	emergency,
	all_id,
	id_full,
	emergency_id,
	runway,
	uart_rd_request,
	queue_takeoff_plane,
	queue_landing_plane,
	unqueue_takeoff_plane,
	unqueue_landing_plane,
	send_clear,
	send_hold,
	send_say_ag,
	send_divert,
	send_divert_landing,
	send_invalid_id,
	send_valid_id,
	queue_reply,
	lock,
	unlock,
	runway_id,
	set_emergency,
	unset_emergency,
	take_id,
	release_id,
	sel_takeoff_id_lock,
	sel_diverted_id
);
	input wire clock;
	input wire reset;
	input wire uart_empty;
	input wire [7:0] uart_request;
	input wire takeoff_fifo_full;
	input wire landing_fifo_full;
	input wire takeoff_fifo_empty;
	input wire landing_fifo_empty;
	input wire reply_fifo_full;
	input wire [1:0] runway_active;
	input wire emergency;
	input wire [15:0] all_id;
	input wire id_full;
	input wire [3:0] emergency_id;
	input wire [9:0] runway;
	output reg uart_rd_request;
	output reg queue_takeoff_plane;
	output reg queue_landing_plane;
	output reg unqueue_takeoff_plane;
	output reg unqueue_landing_plane;
	output reg [1:0] send_clear;
	output reg send_hold;
	output reg send_say_ag;
	output reg send_divert;
	output reg send_divert_landing;
	output reg send_invalid_id;
	output reg send_valid_id;
	output reg queue_reply;
	output reg lock;
	output reg unlock;
	output reg runway_id;
	output reg set_emergency;
	output reg unset_emergency;
	output reg take_id;
	output reg release_id;
	output reg sel_takeoff_id_lock;
	output reg sel_diverted_id;
	wire [3:0] plane_id;
	wire [2:0] msg_type;
	wire [1:0] msg_action;
	reg takeoff_first;
	reg reverse_takeoff_first;
	assign plane_id = uart_request[7-:4];
	assign msg_type = uart_request[3-:3];
	assign msg_action = uart_request[0];
	reg [2:0] state;
	reg [2:0] next_state;
	always @(*) begin
		uart_rd_request = 1'b0;
		queue_takeoff_plane = 1'b0;
		queue_landing_plane = 1'b0;
		unqueue_takeoff_plane = 1'b0;
		unqueue_landing_plane = 1'b0;
		send_clear = 2'b00;
		send_hold = 1'b0;
		send_say_ag = 1'b0;
		send_divert = 1'b0;
		send_divert_landing = 1'b0;
		send_invalid_id = 1'b0;
		send_valid_id = 1'b0;
		queue_reply = 1'b0;
		lock = 1'b0;
		unlock = 1'b0;
		runway_id = 1'b0;
		set_emergency = 1'b0;
		unset_emergency = 1'b0;
		take_id = 1'b0;
		release_id = 1'b0;
		sel_takeoff_id_lock = 1'b0;
		sel_diverted_id = 1'b0;
		reverse_takeoff_first = 1'b0;
		next_state = 3'b000;
		case (state)
			3'b000:
				if (uart_empty) begin
					if (emergency) begin
						if (!landing_fifo_empty) begin
							next_state = 3'b110;
							unqueue_landing_plane = 1'b1;
						end
						else
							next_state = 3'b000;
					end
					else if (runway_active != 2'b11) begin
						if (!takeoff_fifo_empty && !landing_fifo_empty) begin
							if (takeoff_first) begin
								next_state = 3'b100;
								unqueue_takeoff_plane = 1'b1;
							end
							else begin
								next_state = 3'b101;
								unqueue_landing_plane = 1'b1;
							end
						end
						else if (!takeoff_fifo_empty) begin
							next_state = 3'b100;
							unqueue_takeoff_plane = 1'b1;
						end
						else if (!landing_fifo_empty) begin
							next_state = 3'b101;
							unqueue_landing_plane = 1'b1;
						end
						else
							next_state = 3'b000;
					end
					else
						next_state = 3'b000;
				end
				else begin
					next_state = 3'b001;
					uart_rd_request = 1'b1;
				end
			3'b001:
				if (msg_type == 3'b000) begin
					if (all_id[plane_id]) begin
						next_state = 3'b010;
						if (msg_action == 1'b0) begin
							if (takeoff_fifo_full) begin
								send_divert = 1'b1;
								release_id = 1'b1;
							end
							else begin
								queue_takeoff_plane = 1'b1;
								send_hold = 1'b1;
							end
						end
						else if (msg_action == 1'b1) begin
							if (landing_fifo_full || emergency) begin
								send_divert = 1'b1;
								release_id = 1'b1;
							end
							else begin
								queue_landing_plane = 1'b1;
								send_hold = 1'b1;
							end
						end
					end
					else
						next_state = 3'b011;
				end
				else if (msg_type == 3'b001) begin
					if (all_id[plane_id]) begin
						next_state = 3'b011;
						if (!msg_action) begin
							if ((runway[4-:4] == plane_id) && runway[0])
								release_id = 1'b1;
							unlock = 1'b1;
							runway_id = 1'b0;
						end
						else if (msg_action) begin
							if ((runway[9-:4] == plane_id) && runway[5])
								release_id = 1'b1;
							unlock = 1'b1;
							runway_id = 1'b1;
						end
					end
					else
						next_state = 3'b011;
				end
				else if (msg_type == 3'b010) begin
					if (msg_action == 1'b1) begin
						if (!landing_fifo_empty) begin
							next_state = 3'b110;
							unqueue_landing_plane = 1'b1;
						end
						else
							next_state = 3'b000;
						set_emergency = 1'b1;
					end
					else if (msg_action == 1'b0) begin
						next_state = 3'b011;
						if (emergency_id == plane_id)
							unset_emergency = 1'b1;
						release_id = 1'b1;
					end
				end
				else if (msg_type == 3'b111) begin
					next_state = 3'b010;
					if (id_full)
						send_invalid_id = 1'b1;
					else begin
						send_valid_id = 1'b1;
						take_id = 1'b1;
					end
				end
				else begin
					next_state = 3'b010;
					send_say_ag = 1'b1;
				end
			3'b010:
				if (reply_fifo_full)
					next_state = 3'b010;
				else begin
					next_state = 3'b011;
					queue_reply = 1'b1;
				end
			3'b011:
				if (emergency) begin
					if (!landing_fifo_empty) begin
						next_state = 3'b110;
						unqueue_landing_plane = 1'b1;
					end
					else
						next_state = 3'b000;
				end
				else if (runway_active != 2'b11) begin
					if (!takeoff_fifo_empty && !landing_fifo_empty) begin
						if (takeoff_first) begin
							next_state = 3'b100;
							unqueue_takeoff_plane = 1'b1;
							reverse_takeoff_first = 1'b1;
						end
						else begin
							next_state = 3'b101;
							unqueue_landing_plane = 1'b1;
							reverse_takeoff_first = 1'b1;
						end
					end
					else if (!takeoff_fifo_empty) begin
						next_state = 3'b100;
						unqueue_takeoff_plane = 1'b1;
					end
					else if (!landing_fifo_empty) begin
						next_state = 3'b101;
						unqueue_landing_plane = 1'b1;
					end
					else
						next_state = 3'b000;
				end
				else
					next_state = 3'b000;
			3'b100: begin
				next_state = 3'b111;
				sel_takeoff_id_lock = 1'b1;
				if (!runway_active[0]) begin
					runway_id = 1'b0;
					lock = 1'b1;
					send_clear = 2'b01;
				end
				else if (!runway_active[1]) begin
					runway_id = 1'b1;
					lock = 1'b1;
					send_clear = 2'b01;
				end
			end
			3'b101: begin
				next_state = 3'b111;
				if (!runway_active[0]) begin
					runway_id = 1'b0;
					lock = 1'b1;
					send_clear = 2'b10;
				end
				else if (!runway_active[1]) begin
					runway_id = 1'b1;
					lock = 1'b1;
					send_clear = 2'b10;
				end
			end
			3'b110: begin
				next_state = 3'b111;
				send_divert_landing = 1'b1;
				sel_diverted_id = 1'b1;
				release_id = 1'b1;
			end
			3'b111: begin
				next_state = 3'b000;
				queue_reply = 1'b1;
			end
			default: next_state = 3'b000;
		endcase
	end
	always @(posedge clock)
		if (reset)
			state <= 3'b000;
		else
			state <= next_state;
	always @(posedge clock)
		if (reset)
			takeoff_first <= 1'b0;
		else if (reverse_takeoff_first)
			takeoff_first <= ~takeoff_first;
endmodule
module SendReplyFsm (
	clock,
	reset,
	uart_tx_ready,
	reply_fifo_empty,
	send_reply,
	uart_tx_send
);
	input wire clock;
	input wire reset;
	input wire uart_tx_ready;
	input wire reply_fifo_empty;
	output reg send_reply;
	output reg uart_tx_send;
	reg state;
	reg next_state;
	always @(*) begin
		send_reply = 1'b0;
		uart_tx_send = 1'b0;
		case (state)
			1'd0:
				if (reply_fifo_empty || !uart_tx_ready)
					next_state = 1'd0;
				else begin
					next_state = 1'd1;
					send_reply = 1'b1;
				end
			1'd1: begin
				next_state = 1'd0;
				uart_tx_send = 1'b1;
			end
			default: next_state = 1'd0;
		endcase
	end
	always @(posedge clock)
		if (reset)
			state <= 1'd0;
		else
			state <= next_state;
endmodule
module FIFO (
	clock,
	reset,
	data_in,
	we,
	re,
	data_out,
	full,
	empty
);
	parameter signed [31:0] WIDTH = 8;
	parameter signed [31:0] DEPTH = 4;
	input wire clock;
	input wire reset;
	input wire [WIDTH - 1:0] data_in;
	input wire we;
	input wire re;
	output reg [WIDTH - 1:0] data_out;
	output wire full;
	output wire empty;
	reg [(DEPTH * WIDTH) - 1:0] queue;
	reg [$clog2(DEPTH):0] count;
	reg [$clog2(DEPTH) - 1:0] put_ptr;
	reg [$clog2(DEPTH) - 1:0] get_ptr;
	assign empty = count == 0;
	assign full = count == DEPTH;
	always @(posedge clock)
		if (reset) begin
			count <= 0;
			get_ptr <= 0;
			put_ptr <= 0;
			data_out <= 0;
		end
		else if ((re && !empty) && we) begin
			data_out <= queue[get_ptr * WIDTH+:WIDTH];
			get_ptr <= get_ptr + 1;
			queue[put_ptr * WIDTH+:WIDTH] <= data_in;
			put_ptr <= put_ptr + 1;
		end
		else if (re && !empty) begin
			data_out <= queue[get_ptr * WIDTH+:WIDTH];
			get_ptr <= get_ptr + 1;
			count <= count - 1;
		end
		else if (we && !full) begin
			queue[put_ptr * WIDTH+:WIDTH] <= data_in;
			put_ptr <= put_ptr + 1;
			count <= count + 1;
		end
endmodule
module RunwayManager (
	clock,
	reset,
	plane_id_unlock,
	plane_id_lock,
	runway_id,
	lock,
	unlock,
	runway_override,
	runway_active,
	runway
);
	input wire clock;
	input wire reset;
	input wire [3:0] plane_id_unlock;
	input wire [3:0] plane_id_lock;
	input wire runway_id;
	input wire lock;
	input wire unlock;
	input wire [1:0] runway_override;
	output wire [1:0] runway_active;
	output reg [9:0] runway;
	assign runway_active[0] = runway[0] | runway_override[0];
	assign runway_active[1] = runway[5] | runway_override[1];
	always @(posedge clock)
		if (reset)
			runway <= 1'sb0;
		else if (lock && !unlock) begin
			if (runway_id) begin
				runway[9-:4] <= plane_id_lock;
				runway[5] <= 1'b1;
			end
			else begin
				runway[4-:4] <= plane_id_lock;
				runway[0] <= 1'b1;
			end
		end
		else if (!lock && unlock) begin
			if (runway_id) begin
				if (plane_id_unlock == runway[9-:4])
					runway[5] <= 1'b0;
			end
			else if (plane_id_unlock == runway[4-:4])
				runway[0] <= 1'b0;
		end
endmodule
module AircraftIDManager (
	clock,
	reset,
	id_in,
	release_id,
	take_id,
	id_out,
	all_id,
	full
);
	input wire clock;
	input wire reset;
	input wire [3:0] id_in;
	input wire release_id;
	input wire take_id;
	output wire [3:0] id_out;
	output wire [15:0] all_id;
	output wire full;
	reg [15:0] taken_id;
	reg [3:0] id_avail;
	assign all_id = taken_id;
	assign id_out = id_avail;
	assign full = taken_id == 16'hffff;
	always @(*) begin
		id_avail = 4'd0;
		case (1'b0)
			taken_id[0]: id_avail = 4'd0;
			taken_id[1]: id_avail = 4'd1;
			taken_id[2]: id_avail = 4'd2;
			taken_id[3]: id_avail = 4'd3;
			taken_id[4]: id_avail = 4'd4;
			taken_id[5]: id_avail = 4'd5;
			taken_id[6]: id_avail = 4'd6;
			taken_id[7]: id_avail = 4'd7;
			taken_id[8]: id_avail = 4'd8;
			taken_id[9]: id_avail = 4'd9;
			taken_id[10]: id_avail = 4'd10;
			taken_id[11]: id_avail = 4'd11;
			taken_id[12]: id_avail = 4'd12;
			taken_id[13]: id_avail = 4'd13;
			taken_id[14]: id_avail = 4'd14;
			taken_id[15]: id_avail = 4'd15;
			default: id_avail = 4'd0;
		endcase
	end
	always @(posedge clock)
		if (reset)
			taken_id <= 1'sb0;
		else if (release_id)
			taken_id[id_in] <= 1'b0;
		else if (take_id && !full)
			taken_id[id_avail] <= 1'b1;
endmodule
`default_nettype none
module UartRX (
	clock,
	reset,
	rx,
	data,
	done,
	framing_error,
	receiving
);
	parameter signed [31:0] CLK_HZ = 25000000;
	parameter signed [31:0] BAUD_RATE = 115200;
	input wire clock;
	input wire reset;
	input wire rx;
	output reg [7:0] data;
	output wire done;
	output wire framing_error;
	output wire receiving;
	wire start;
	wire tick;
	BaudRateGenerator #(
		.CLK_HZ(CLK_HZ),
		.BAUD_RATE(BAUD_RATE)
	) conductor(
		.clock(clock),
		.reset(reset),
		.start_rx(start),
		.start_tx(1'b0),
		.tick(tick)
	);
	wire collect_data;
	wire en_data_counter;
	wire clear_data_counter;
	reg [3:0] data_counter;
	wire done_data;
	always @(posedge clock)
		if (reset)
			data <= 1'sb0;
		else if (collect_data && tick) begin
			data <= data >> 1;
			data[7] <= rx;
		end
	assign done_data = data_counter == 4'd8;
	always @(posedge clock)
		if (reset || clear_data_counter)
			data_counter <= 1'sb0;
		else if (en_data_counter && tick)
			data_counter <= data_counter + 1'b1;
	UartRXFsm fsm(
		.clock(clock),
		.reset(reset),
		.tick(tick),
		.rx(rx),
		.done_data(done_data),
		.start(start),
		.collect_data(collect_data),
		.en_data_counter(en_data_counter),
		.clear_data_counter(clear_data_counter),
		.framing_error(framing_error),
		.done(done),
		.receiving(receiving)
	);
endmodule
module UartRXFsm (
	clock,
	reset,
	tick,
	rx,
	done_data,
	start,
	collect_data,
	en_data_counter,
	clear_data_counter,
	framing_error,
	done,
	receiving
);
	input wire clock;
	input wire reset;
	input wire tick;
	input wire rx;
	input wire done_data;
	output reg start;
	output reg collect_data;
	output reg en_data_counter;
	output reg clear_data_counter;
	output reg framing_error;
	output reg done;
	output reg receiving;
	reg [1:0] state;
	reg [1:0] next_state;
	always @(*) begin
		start = 1'b0;
		collect_data = 1'b0;
		en_data_counter = 1'b0;
		clear_data_counter = 1'b0;
		framing_error = 1'b0;
		done = 1'b0;
		receiving = 1'b0;
		next_state = 2'd0;
		case (state)
			2'd0:
				if (!rx) begin
					next_state = 2'd1;
					start = 1'b1;
				end
				else
					next_state = 2'd0;
			2'd1:
				if (tick && rx)
					next_state = 2'd0;
				else if (tick && !rx)
					next_state = 2'd2;
				else
					next_state = 2'd1;
			2'd2: begin
				if (tick && !done_data) begin
					next_state = 2'd2;
					collect_data = 1'b1;
					en_data_counter = 1'b1;
				end
				else if (tick && done_data) begin
					if (!rx) begin
						next_state = 2'd3;
						framing_error = 1'b1;
					end
					else begin
						next_state = 2'd0;
						clear_data_counter = 1'b1;
						done = 1'b1;
					end
				end
				else
					next_state = 2'd2;
				receiving = 1'b1;
			end
			2'd3: begin
				if (tick && rx) begin
					next_state = 2'd0;
					clear_data_counter = 1'b1;
				end
				else if (tick && !rx)
					next_state = 2'd3;
				framing_error = 1'b1;
			end
			default: next_state = 2'd0;
		endcase
	end
	always @(posedge clock)
		if (reset)
			state <= 2'd0;
		else
			state <= next_state;
endmodule
`default_nettype none
module UartTX (
	clock,
	reset,
	send,
	data,
	tx,
	ready,
	sending
);
	parameter signed [31:0] CLK_HZ = 25000000;
	parameter signed [31:0] BAUD_RATE = 115200;
	input wire clock;
	input wire reset;
	input wire send;
	input wire [7:0] data;
	output reg tx;
	output wire ready;
	output wire sending;
	wire start;
	wire tick;
	BaudRateGenerator #(
		.CLK_HZ(CLK_HZ),
		.BAUD_RATE(BAUD_RATE)
	) conductor(
		.clock(clock),
		.reset(reset),
		.start_rx(1'b0),
		.start_tx(start),
		.tick(tick)
	);
	wire en_data_counter;
	reg [3:0] data_counter;
	wire done_data;
	wire clear_data_counter;
	assign done_data = data_counter == 4'd8;
	always @(posedge clock)
		if (reset || clear_data_counter)
			data_counter <= 1'sb0;
		else if (en_data_counter && tick)
			data_counter <= data_counter + 1;
	reg [7:0] saved_data;
	reg data_bit;
	wire send_data;
	always @(posedge clock)
		if (reset)
			saved_data <= 1'sb0;
		else if (start)
			saved_data <= data;
		else if (send_data && tick)
			saved_data <= saved_data >> 1;
	always @(posedge clock)
		if (reset || start)
			data_bit <= 1'b0;
		else if (send_data && tick)
			data_bit <= saved_data[0];
	wire send_start_bit;
	wire send_stop_bit;
	always @(posedge clock)
		if (reset)
			tx <= 1'b1;
		else if (send_start_bit)
			tx <= 1'b0;
		else if (send_data)
			tx <= data_bit;
		else if (send_stop_bit)
			tx <= 1'b1;
		else
			tx <= 1'b1;
	UartTXFsm fsm(
		.clock(clock),
		.reset(reset),
		.send(send),
		.tick(tick),
		.done_data(done_data),
		.start(start),
		.send_start_bit(send_start_bit),
		.send_data(send_data),
		.send_stop_bit(send_stop_bit),
		.en_data_counter(en_data_counter),
		.clear_data_counter(clear_data_counter),
		.ready(ready),
		.sending(sending)
	);
endmodule
module UartTXFsm (
	clock,
	reset,
	send,
	tick,
	done_data,
	start,
	send_start_bit,
	send_data,
	send_stop_bit,
	en_data_counter,
	clear_data_counter,
	ready,
	sending
);
	input wire clock;
	input wire reset;
	input wire send;
	input wire tick;
	input wire done_data;
	output reg start;
	output reg send_start_bit;
	output reg send_data;
	output reg send_stop_bit;
	output reg en_data_counter;
	output reg clear_data_counter;
	output reg ready;
	output reg sending;
	reg [1:0] state;
	reg [1:0] next_state;
	always @(*) begin
		start = 1'b0;
		send_start_bit = 1'b0;
		send_data = 1'b0;
		send_stop_bit = 1'b0;
		en_data_counter = 1'b0;
		clear_data_counter = 1'b0;
		ready = 1'b0;
		sending = 1'b0;
		next_state = 2'd0;
		case (state)
			2'd0:
				if (send) begin
					next_state = 2'd1;
					start = 1'b1;
					send_start_bit = 1'b1;
				end
				else begin
					next_state = 2'd0;
					ready = 1'b1;
				end
			2'd1: begin
				if (tick) begin
					next_state = 2'd2;
					send_data = 1'b1;
					en_data_counter = 1'b1;
				end
				else begin
					next_state = 2'd1;
					send_start_bit = 1'b1;
				end
				sending = 1'b1;
			end
			2'd2: begin
				if (tick && done_data) begin
					next_state = 2'd3;
					send_stop_bit = 1'b1;
					clear_data_counter = 1'b1;
				end
				else begin
					next_state = 2'd2;
					send_data = 1'b1;
					en_data_counter = 1'b1;
				end
				sending = 1'b1;
			end
			2'd3: begin
				if (tick) begin
					next_state = 2'd0;
					ready = 1'b1;
				end
				else begin
					next_state = 2'd3;
					send_stop_bit = 1'b1;
				end
				sending = 1'b1;
			end
			default: next_state = 2'd0;
		endcase
	end
	always @(posedge clock)
		if (reset)
			state <= 2'd0;
		else
			state <= next_state;
endmodule
`default_nettype none
module BaudRateGenerator (
	clock,
	reset,
	start_rx,
	start_tx,
	tick
);
	parameter signed [31:0] CLK_HZ = 25000000;
	parameter signed [31:0] BAUD_RATE = 115200;
	input wire clock;
	input wire reset;
	input wire start_rx;
	input wire start_tx;
	output wire tick;
	parameter signed [31:0] DIVISOR = CLK_HZ / BAUD_RATE;
	reg [$clog2(DIVISOR) + 1:0] clockCount;
	assign tick = clockCount == DIVISOR;
	always @(posedge clock)
		if (reset | tick)
			clockCount <= 1'sb0;
		else if (start_rx)
			clockCount <= DIVISOR / 2;
		else if (start_tx)
			clockCount <= 1'sb0;
		else
			clockCount <= clockCount + 1'b1;
endmodule