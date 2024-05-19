// This program was cloned from: https://github.com/jakubfi/mera400f
// License: GNU General Public License v2.0


// -----------------------------------------------------------------------
module uart(
	input clk,
	input send,
	input [7:0] tx_byte,
	output [7:0] rx_byte,
	output tx_ready,
	output rx_ready,
	output txd,
	input rxd
);

	parameter baud;
	parameter clk_speed;

	localparam prescale = clk_speed/baud;
	localparam width = $clog2(prescale+1);
	localparam [width-1:0] period = prescale[width-1:0] - 1'b1;

	uart_tx #(
		.width(width),
		.period(period)
	) tx(
		.clk(clk),
		.d(tx_byte),
		.txd(txd),
		.send(send),
		.ready(tx_ready)
	);

	uart_rx #(
		.width(width),
		.period(period)
	) rx(
		.clk(clk),
		.d(rx_byte),
		.rxd(rxd),
		.ready(rx_ready)
	);

endmodule

// -----------------------------------------------------------------------
module uart_tx(
	input clk,
	input [7:0] d,
	input send,
	output ready,
	output txd
);

	parameter width;
	parameter period;

	localparam TX_IDLE	= 2'd0;
	localparam TX_SEND	= 2'd1;
	localparam TX_WAIT	= 2'd2;
	reg [1:0] txstate = TX_IDLE;

	reg [width-1:0] divcnt;
	reg [3:0] bitcnt;
	reg [0:10] txbuf = {11'b11111111111};

	always @ (posedge clk) begin

		ready <= 0;

		case (txstate)
			TX_IDLE:
				if (send) begin
					bitcnt <= 4'd10;
					txbuf <= {1'b1, 1'b1, d, 1'b0};
					divcnt <= period;
					txstate <= TX_WAIT;
				end

			TX_SEND: begin
				txbuf <= {1'b1, txbuf[0:9]};
				divcnt <= period;
				txstate <= TX_WAIT;
			end

			TX_WAIT:
				if (divcnt != 0) begin
					divcnt <= divcnt - 1'd1;
				end else begin
					if (bitcnt == 1) begin
						ready <= 1;
						txstate <= TX_IDLE;
					end else begin
						bitcnt <= bitcnt - 1'd1;
						txstate <= TX_SEND;
					end
				end

		endcase

	end

	assign txd = txbuf[10];

endmodule

// -----------------------------------------------------------------------
module uart_rx(
	input clk,
	output reg [7:0] d,
	output ready,
	input rxd
);

	parameter width;
	parameter period;
	localparam halfperiod = period / 2;

	localparam RX_IDLE	= 2'd0;
	localparam RX_START	= 2'd1;
	localparam RX_DATA	= 2'd3;
	reg [1:0] rxstate = RX_IDLE;

	reg [width-1:0] divcnt;
	reg [3:0] bitcnt;
	reg [8:0] rxbuf;

	always @ (posedge clk) begin

		ready <= 0;

		case (rxstate)
			RX_IDLE:
				if (!rxd) begin
					divcnt <= period;
					rxstate <= RX_START;
				end

			RX_START:
				if (rxd) begin // RXD gone high during the first half of start bit
					rxstate <= RX_IDLE;
				end else if (divcnt > halfperiod) begin
					divcnt <= divcnt - 1'd1;
				end else begin
					divcnt <= period;
					bitcnt <= 4'd9;
					rxstate <= RX_DATA;
				end

			RX_DATA:
				if (bitcnt == 0) begin
					rxstate <= RX_IDLE;
					if (rxd) begin // RXD needs to be high @ stop bit for the frame to be OK
						d <= rxbuf[7:0];
						ready <= 1;
					end
				end else if (divcnt != 0) begin
					divcnt <= divcnt - 1'd1;
				end else begin
					divcnt <= period;
					bitcnt <= bitcnt - 1'd1;
					rxbuf <= {rxd, rxbuf[8:1]};
				end

		endcase

	end

endmodule

// vim: tabstop=2 shiftwidth=2 autoindent noexpandtab
