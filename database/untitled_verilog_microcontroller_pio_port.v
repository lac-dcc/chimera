// This program was cloned from: https://github.com/glacc/untitled_verilog_microcontroller
// License: CERN Open Hardware Licence Version 2 - Strongly Reciprocal

module pio_port (
	inout		[7:0]		gpio,
	
	input		rs,
	input		rden,
	input		wren,
	input		en,

	input		[7:0]		data_in,
	output	[7:0]		data_out,
	output	[7:0]		data_out_direct,

	input		clk,

	input		rst
);

	reg	[7:0]		io_control = 8'b00000000;
	reg	[7:0]		gpio_output_latch = 8'b11111111;
	reg	[7:0]		gpio_read_latch = 8'b00000000;

	reg	[7:0]		data_out_latch = 8'b00000000;
	assign	data_out = (en & rden & !wren) ? data_out_latch : 8'bzzzzzzzz;
	assign	data_out_direct = (en & rden & !wren) ?
										rs ? io_control : gpio
										: 8'bzzzzzzzz;

	// IO_CONTROL
	//		0 - OUTPUT
	//		1 - INPUT / HIGH IMPEDANCE
	assign	gpio[0] = io_control[0] ? 1'bz : gpio_output_latch[0];
	assign	gpio[1] = io_control[1] ? 1'bz : gpio_output_latch[1];
	assign	gpio[2] = io_control[2] ? 1'bz : gpio_output_latch[2];
	assign	gpio[3] = io_control[3] ? 1'bz : gpio_output_latch[3];
	assign	gpio[4] = io_control[4] ? 1'bz : gpio_output_latch[4];
	assign	gpio[5] = io_control[5] ? 1'bz : gpio_output_latch[5];
	assign	gpio[6] = io_control[6] ? 1'bz : gpio_output_latch[6];
	assign	gpio[7] = io_control[7] ? 1'bz : gpio_output_latch[7];

	always @(posedge clk) begin
		if (!rst) begin
			io_control = 8'b00000000;
			gpio_output_latch = 8'b11111111;
			gpio_read_latch = 8'b00000000;
		end else if (en) begin
			if (wren) begin
				if (rs) begin
					io_control = data_in;
				end else begin
					gpio_output_latch = data_in;
				end
			end else if (rden) begin
				if (rs) begin
					data_out_latch = io_control;
				end else begin
					//data_out_latch[0] = io_control[0] ? gpio[0] : gpio_output_latch[0];
					data_out_latch = gpio;
				end
			end
		end
	end

endmodule