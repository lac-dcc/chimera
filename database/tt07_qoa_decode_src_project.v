// This program was cloned from: https://github.com/28add11/tt07_qoa_decode
// License: Apache License 2.0

/*
 * Copyright (c) 2024 Nicholas Alan West
 * SPDX-License-Identifier: Apache-2.0
 */

`default_nettype none

module tt_um_28add11_QOAdecode (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

	// All output pins must be assigned. If not used, assign to 0.
	assign uo_out  = 0;
	assign uio_out [7:3] = 0;
	assign uio_out [1:0] = 0;
	assign uio_oe  = 8'b0100; // MISO is pin 2, thus we use it as output

	/*
	* This file mostly contains the SPI interface and controlling logic
	*/

	wire sclk;
	assign sclk = uio_in[3];
	wire chipsel;
	assign chipsel = uio_in[0];

	reg [15:0] decoded_sample;

	// Interface for the chip, modified SPI slave supporting mode 0
	reg [7:0] RX_temp_in;
	reg [7:0] RX_data;
	reg [7:0] RX_output_data; // For clock domain sync
	reg [2:0] RX_bit; // What bit of reciving we are on
	reg RX_done;
	reg data_rdy;
	reg RX_sync1, RX_sync2;
	
	reg [7:0] TX_data;
	reg [2:0] TX_bit;
	reg TX_output_bit;

	// RX, in the SPI clock domain
	always @(posedge sclk) begin
		if (chipsel) begin // CS high (i.e. unselected)
			// Set control signals to starting value
			RX_bit <= 3'b0;
			RX_done <= 0;
		end
		else begin // CS low (i.e. selected)
			// Get our data, shifting up (highest first)
			RX_temp_in <= {RX_temp_in[6:0], uio_in[1]};

			RX_bit <= RX_bit + 1;

			if (RX_bit == 3'b111) begin // If we have entered a whole byte
				RX_done <= 1;
				RX_data <= {RX_temp_in[6:0], uio_in[1]}; // at this point rx_temp_in still has an unknown value at [7]
				// So we get rid of that
			end
			else if (RX_bit == 3'b001) begin // If we continue transmitting reset control
				RX_done <= 1'b0;
			end
		end
	end

	// Cross over into chip clock domain
	always @(posedge clk) begin
		if (~rst_n) begin // If we have a reset
			// Set all signals to initial
			RX_sync1 <= 1'b0; 
			RX_sync2 <= 1'b0;
		end
		else begin // No reset
			// Cross clock domains
			RX_sync1 <= RX_done;
			RX_sync2 <= RX_sync1;
		
			// Rising edge (TODO: look into why this works, I'm a noob!)
			if (RX_sync2 == 1'b0 && RX_sync1 == 1'b1) begin
				// Data is valid here
				RX_output_data <= RX_data;
				data_rdy <= 1'b1;
			end else data_rdy <= 1'b0;
		end
	end

	// Data TX, in SPI clock domain
	// Mode 0, so data is shifted out on the clock's negative edge
	always @(negedge sclk) begin
		if (chipsel) begin // Reset values for cs
			TX_bit <= 3'b110; // MSB - 1, thus highest value
			TX_output_bit <= TX_data[7]; // msb, preload to immediately set once cs goes low
		end
		else begin
			TX_bit <= TX_bit - 1;

			// Set actual value
			TX_output_bit <= TX_data[TX_bit];
		end
	end

	// Sample *2 program
	always @(posedge clk) begin
		if (~rst_n) begin
			TX_data <= 8'b0;
		end

		if (RX_sync2) begin
			TX_data <= RX_output_data + RX_output_data;
		end
	end

	assign uio_out[2] = TX_output_bit;

	// Create our decoder
	wire [7:0] decoder_input_wire;
	assign decoder_input_wire = RX_output_data;
	qoa_decoder decode(
		.sys_rst_n(rst_n),
		.sys_clk(clk),
		.data_rdy(data_rdy),
		.spi_in(decoder_input_wire),
		.sample(decoded_sample)
	);

endmodule
