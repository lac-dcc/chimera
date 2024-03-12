module top(
	output led_r,
	output led_b,
	output gpio_2, // cs
	output gpio_46, // clk
	output gpio_47  // do
);
	wire reset = 0;
	wire clk_48mhz, clk = clk_48mhz;
	SB_HFOSC osc(1,1,clk_48mhz);

	reg [11:0] value_x;
	reg [11:0] value_y;
	reg axis;
	reg dac_strobe;
	wire dac_ready;

	mpc4922 dac(
		.clk(clk),
		.reset(reset),
		.cs_pin(gpio_2),
		.clk_pin(gpio_46),
		.data_pin(gpio_47),
		.value(axis ? value_x : value_y),
		.axis(axis),
		.strobe(dac_strobe),
		.ready(dac_ready)
	);

	reg [15:0] counter;
	always @(posedge clk) begin
		counter <= counter + 1;
		led_r = !(counter < value_x);
		led_b = 1; //!dac_strobe; //!(counter < value_y);
	end

	always @(posedge clk)
	begin
		dac_strobe <= 0;

		if (!dac_ready || dac_strobe)
		begin
			// do nothing
		end else //if (counter == 0)
		begin
			if (axis)
				value_x <= value_x - 3;
			else
				value_y <= value_y + 7;

			dac_strobe <= 1;
			axis <= !axis;
		end
	end
endmodule


/*
 * SPI input timing:
 * CS is active low
 * CLK is rising edge
 */
module mpc4922(
	input clk,
	input reset,

	// physical interface
	output cs_pin,
	output clk_pin,
	output data_pin,

	// logical interface
	input [11:0] value,
	input axis,
	input strobe,
	output ready
);
	parameter GAIN = 1'b1; // Normal gain
	parameter BUFFERED = 1'b1; // buffered
	parameter SHUTDOWN = 1'b1; // not shutdown

	reg [15:0] cmd;
	reg [4:0] bits;
	assign ready = !reset && bits == 0;
	assign cs_pin = ready; // negative logic
	assign data_pin = cmd[15];

	always @(posedge clk)
	begin
		if (reset) begin
			bits <= 0;
			clk_pin <= 0;
		end else
		if (strobe) begin
			cmd <= { axis, BUFFERED, GAIN, SHUTDOWN, value };
			bits <= 16;
			clk_pin <= 0;
		end else
		if (bits != 0) begin
			if (clk_pin) begin
				// change when it is currently high
				cmd <= { cmd[14:0], 1'b0 };
				clk_pin <= 0;
				bits <= bits - 1;
			end else begin
				// rising edge clocks the data
				clk_pin <= 1;
			end
		end else begin
			clk_pin <= 0;
		end
	end

endmodule
