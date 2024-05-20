// This program was cloned from: https://github.com/TripleJ160/FPGA-Audio-Recorder
// License: MIT License

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    
// Design Name: 
// Module Name:    rs232_uart 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
// * Expects ACTIVE HIGH reset; reset is asynch
// * tx_data_in is DATA to be TRANSMITTED
// * rx_data_out is DATA that has been RECEIVED
// * clk is 100MHz
//////////////////////////////////////////////////////////////////////////////////
module rs232_uart(
	tx_data_in, write_tx_data, rs232_tx, tx_buffer_full,
	rx_data_out, read_rx_data_ack, rs232_rx, rx_data_present,
	reset, clk
    );

	// Data I/O
	input 	[7:0]	tx_data_in;
	output	[7:0]	rx_data_out;
	// Control I/O
	input			write_tx_data;
	output			tx_buffer_full;
	input 			read_rx_data_ack;
	output			rx_data_present;
	// RS232 I/O
	output			rs232_tx;
	input			rs232_rx;
	// Global I/O
	input			reset;
	input			clk;

	// Baud Clock Declarations
	//
	// Implement the 16x bit rate counter for the uart transmit and receive.
	// The system clock is 100MHz, and the desired baud rate is 9600. Use the
	// following formula to calculate the max count value.
	// 
	// maximum_baud_count = (frequency/(16*baud_rate))
	//
	// Note that when baud_count reaches the max, we need to reset the count
	// and generate a en_16_x_baud pulse.
	//
	// Baud Clock registers/parameters.
	reg 	[9:0] 	baud_count;
	reg				en_16_x_baud;
	parameter		MAX_BAUD_COUNT = 651;

	// Baud Clock Process
	always @(posedge clk)
	begin
		if(reset) begin
			baud_count <= 0;
			en_16_x_baud <= 0;
		end else begin
			if(baud_count == MAX_BAUD_COUNT) begin
				baud_count <= 0;
				en_16_x_baud <= 1;
			end else begin
				baud_count <= baud_count + 1;
				en_16_x_baud <= 0;
			end
		end
	end

	// UART Transmitter
	uart_tx6 transmitter (
		.data_in(tx_data_in),
		.buffer_write(write_tx_data),
		.buffer_reset(reset),
		.en_16_x_baud(en_16_x_baud),
		.serial_out(rs232_tx),
		.buffer_data_present(),
		.buffer_half_full(),
		.buffer_full(tx_buffer_full),
		.clk(clk)
	);

	// UART Receiver
	uart_rx6 receiver (
		.serial_in(rs232_rx),
		.en_16_x_baud(en_16_x_baud),
		.data_out(rx_data_out),
		.buffer_read(read_rx_data_ack),
		.buffer_data_present(rx_data_present),
		.buffer_half_full(),
		.buffer_full(),
		.buffer_reset(reset),
		.clk(clk)
	);

endmodule
