// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// to run on an icezero

// written 2020-05-05 by mza
// last updated 2020-06-01 by mza

`define icezero
//`include "lib/synchronizer.v"
//`include "lib/easypll.v"
`include "lib/spi.v"

module top (
	input clock100,
	input rpi_spi_sclk,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	output pmod4_5,
	output pmod4_6,
	output pmod4_7,
	output pmod4_8,
	output led1,
	output led2,
	output led3
);
	reg reset = 1;
	reg [7:0] reset_counter = 0;
	always @(posedge clock100) begin
		if (reset) begin
			if (reset_counter[7]) begin
				reset <= 0;
			end else begin
				reset_counter <= reset_counter + 1'b1;
			end
		end
	end
	wire [7:0] data_from_controller;
	wire [7:0] data_to_controller;
	wire data_valid;
	wire [7:0] command8;
	wire [15:0] address16;
	wire [31:0] data32;
	wire transaction_valid;
	SPI_peripheral_simple8 spi_s8 (.clock(clock100), .SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(rpi_spi_miso), .SSEL(rpi_spi_ce0), .data_to_controller(data_to_controller), .data_from_controller(data_from_controller), .data_valid(data_valid));
	SPI_peripheral_command8_address16_data32 spi_c8_a16_d32 (.clock(clock100), .SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(), .SSEL(rpi_spi_ce1), .transaction_valid(transaction_valid), .command8(command8), .address16(address16), .data32(data32));
	reg [7:0] previous_data_from_controller = 0;
	always @(posedge clock100) begin
		if (data_valid) begin
			previous_data_from_controller <= data_from_controller;
		end
	end
	assign data_to_controller = previous_data_from_controller;
//	assign led1 = reset;
//	assign led2 = ~rpi_spi_ce0;
	wire [2:0] leds = { led1, led2, led3 };
	//assign leds = data_from_controller[2:0];
	assign leds = data32[2:0];
	assign pmod4_5 = rpi_spi_sclk;
	assign pmod4_6 = rpi_spi_mosi;
	assign pmod4_7 = rpi_spi_ce0;
	assign pmod4_8 = rpi_spi_ce1;
//	assign rpi_spi_miso = 0;
endmodule

