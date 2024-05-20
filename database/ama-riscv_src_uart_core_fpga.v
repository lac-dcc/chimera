// This program was cloned from: https://github.com/AleksandarLilic/ama-riscv
// License: GNU General Public License v3.0

//-----------------------------------------------------------------------------
// Project:         AMA-RISCV
// Module:          UART Core RTL for FPGA implementation
// File:            uart_core_fpga.v
// Date created:    2021-06-06
// Author:          Aleksandar Lilic
// Description:     UART Core with loopback logic for FPGA implementation
//
// Version history:
//      2021-06-06  AL  0.1.0 - Initial
//      2021-06-06  AL  1.0.0 - Release
//-----------------------------------------------------------------------------

module uart_core_fpga #(
    parameter CLOCK_FREQ = 125_000_000,
    parameter BAUD_RATE  =     115_200
    ) (
    input         CLK_125MHZ_FPGA,
    input   [3:0] BUTTONS,
    input   [1:0] SWITCHES,
    output  [5:0] LEDS,
    input         FPGA_SERIAL_RX,
    output        FPGA_SERIAL_TX
);
//-----------------------------------------------------------------------------
// Signals
// UART
wire        rst;
reg   [7:0] data_in;
wire  [7:0] data_out;
wire        data_in_valid;
wire        data_in_ready;
wire        data_out_valid;
wire        data_out_ready;

// Loopback
reg         has_char;
reg   [7:0] char;

//-----------------------------------------------------------------------------
// Default assignments
assign LEDS[4:0]    = 5'b0_0001;
assign rst          = BUTTONS[0];

//-----------------------------------------------------------------------------
// FPGA UART module
uart_core # (
    .CLOCK_FREQ     (CLOCK_FREQ),
    .BAUD_RATE      (BAUD_RATE)
) on_chip_uart (
    .clk            (CLK_125MHZ_FPGA),
    .rst            (rst),
    // tx side
    .data_in        (data_in),
    .data_in_valid  (data_in_valid),
    .data_in_ready  (data_in_ready),
    // rx side
    .data_out       (data_out),
    .data_out_valid (data_out_valid),
    .data_out_ready (data_out_ready),
    // PHY
    .serial_in      (FPGA_SERIAL_RX),
    .serial_out     (FPGA_SERIAL_TX)
);

//-----------------------------------------------------------------------------
// Loopback
// Logic below will pull a character from the uart_receiver over the 
// ready/valid interface, modify that character, and send the character to the 
// uart_transmitter, which will send it over the serial line.

// If a ASCII letter is received, its case will be reversed and sent back. Any other
// ASCII characters will be echoed back without any modification.

always @(posedge CLK_125MHZ_FPGA) begin
    if (rst) 
        has_char <= 1'b0;
    else 
        has_char <= has_char ? !data_in_ready : data_out_valid;
end

always @(posedge CLK_125MHZ_FPGA) begin
    if (!has_char) 
        char <= data_out;
end

always @ (*) begin
    if (char >= 8'd65 && char <= 8'd90)
        data_in = char + 8'd32;
    else if (char >= 8'd97 && char <= 8'd122) 
        data_in = char - 8'd32;
    else 
        data_in = char;
end

// Light up LED when ASCII 'A' arrives
assign LEDS[5] = char == 8'd65;

assign data_in_valid    = has_char;
assign data_out_ready   = !has_char;

endmodule
