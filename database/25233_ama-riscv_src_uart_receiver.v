// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          UART Receiver
// File:            uart_receiver.v
// Date created:    2021-06-06
// Author:          Aleksandar Lilic
// Description:     UART Receiver module
//
// SPDX-License-Identifier: GPL-3.0-or-later
//
// Version history:
//      2021-06-06  AL  0.1.0 - Initial
//      2021-06-06  AL  1.0.0 - Release
//
//-----------------------------------------------------------------------------

module uart_receiver #(
    parameter CLOCK_FREQ = 125_000_000,
    parameter BAUD_RATE  =     115_200)
(
    input   wire        clk,
    input   wire        rst,
    
    // ready/valid
    input   wire        data_out_ready,
    output  wire        data_out_valid,
    
    // data path
    input   wire        serial_in,
    output  wire  [7:0] data_out
);

//-----------------------------------------------------------------------------
// Parameters
// FPGA OFFSET
// Used 125MHz oscillator from the Ethernet does not have the best stability
// Added offset of -5 seems to perfectly align the edges as no drift was observed
// at >200 UART back-to-back characters, measured with logic analyzer @ 20MS/s

localparam FPGA_OFFSET          = 5;
// localparam FPGA_OFFSET          = 0;

localparam SYMBOL_EDGE_TIME     = (CLOCK_FREQ / BAUD_RATE) - FPGA_OFFSET;
localparam SAMPLE_TIME          = SYMBOL_EDGE_TIME / 2;
localparam CLOCK_COUNTER_WIDTH  = $clog2(SYMBOL_EDGE_TIME);

//-----------------------------------------------------------------------------
// Signals
wire        symbol_edge;
wire        sample;
wire        start;
wire        rx_running;

reg         has_byte;
reg   [9:0] rx_shift;
reg   [3:0] bit_counter;
reg   [CLOCK_COUNTER_WIDTH-1:0] clock_counter;

//-----------------------------------------------------------------------------

// Goes high when it is time to start receiving a new character
assign start = !serial_in && !rx_running;

// Counts down from 10 bits for every character
always @ (posedge clk) begin
    if (rst)
        bit_counter <= 0;
    else if (start)
        bit_counter <= 10;
    else if (symbol_edge && rx_running)
        bit_counter <= bit_counter - 1;
end

// Goes high while receiving a character
assign rx_running = bit_counter != 4'd0;

// Counts cycles until a single symbol is done
always @ (posedge clk) begin
    if (rst)                        // system reset
        clock_counter <= 1'b0;
    else if (start || symbol_edge)  // soft reset
        clock_counter <= 1'b0;
    else
        clock_counter <= clock_counter + 1;
end

// Goes high at every symbol edge
assign symbol_edge = (clock_counter == (SYMBOL_EDGE_TIME - 1));

// Goes high halfway through each symbol to sample the serial line
assign sample = (clock_counter == SAMPLE_TIME);

// Shift register
always @ (posedge clk) begin
    if (rst)                        // system reset
        rx_shift <= 9'h0;
    else if (sample && rx_running)
        rx_shift <= {serial_in, rx_shift[9:1]};
end

// Outputs
assign data_out = rx_shift[8:1];

// ready/valid
always @ (posedge clk) begin
    if (rst)                        // system reset
        has_byte <= 1'b0;
    else if (bit_counter == 1 && symbol_edge) 
        has_byte <= 1'b1;
    else if (data_out_ready) 
        has_byte <= 1'b0;
end

assign data_out_valid = has_byte && !rx_running;

endmodule
