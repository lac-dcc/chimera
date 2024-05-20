// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          UART Transmitter
// File:            uart_transmitter.v
// Date created:    2021-06-06
// Author:          Aleksandar Lilic
// Description:     UART Transmitter module
//
// SPDX-License-Identifier: GPL-3.0-or-later
//
// Version history:
//      2021-06-06  AL  0.1.0 - Initial
//      2021-06-06  AL  1.0.0 - Release
//
//-----------------------------------------------------------------------------

module uart_transmitter #(
    parameter CLOCK_FREQ = 125_000_000,
    parameter BAUD_RATE  =     115_200)
(
    input   wire        clk,
    input   wire        rst,
    
    // ready/valid
    input   wire        data_in_valid,
    output  wire        data_in_ready,
    
    // data path
    input   wire  [7:0] data_in,
    output  reg         serial_out
);

//-----------------------------------------------------------------------------
// Parameters
localparam  SYMBOL_EDGE_TIME    = CLOCK_FREQ / BAUD_RATE;
localparam  CLOCK_COUNTER_WIDTH = $clog2(SYMBOL_EDGE_TIME);

localparam  START_BIT = 1'b0;
localparam  STOP_BIT  = 1'b1;
localparam  IDLE_BIT  = 1'b1;

//-----------------------------------------------------------------------------
// Signals
wire        symbol_edge;
wire        start;

wire        tx_running;
reg   [8:0] buffer;

reg   [3:0] bit_counter;
reg   [CLOCK_COUNTER_WIDTH-1:0] clock_counter;

//-----------------------------------------------------------------------------

// Goes high (pulse) when it is time to start receiving a new character
assign start = data_in_valid && !tx_running;

// Counts down from 10 bits for every character
// START_BIT sent immediately in buffer always block
always @ (posedge clk) begin
    if (rst)
        bit_counter <= 0;
    else if (start)
        bit_counter <= 10;
    else if (symbol_edge && tx_running)
        bit_counter <= bit_counter - 1;
end

// Goes high while transmitting a character
assign tx_running = bit_counter != 4'd0;

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

// Buffer
always @ (posedge clk) begin
    if (rst) begin
        buffer      <= {9{IDLE_BIT}};
        serial_out  <= IDLE_BIT;
    end 
    else if (start) begin
        buffer      <= {STOP_BIT, data_in};
        serial_out  <=  START_BIT;
    end 
    else if (symbol_edge && tx_running) begin
        buffer      <= {IDLE_BIT, buffer[8:1]};
        serial_out  <= buffer[0];
    end
end

// ready/valid
assign data_in_ready = !tx_running;
 
endmodule
