// This program was cloned from: https://github.com/thewonderidiot/cmod_agc
// License: MIT License

`timescale 1ns / 1ps
`default_nettype none

module usb_interface(
    input wire clk,
    input wire rst_n,
    
    // FT2232H signals
    input wire rxd,
    output wire txd,

    // Incoming command outputs
    output wire [39:0] cmd,
    output wire cmd_ready,
    input wire cmd_read_en,

    // Outgoing message inputs
    input wire [39:0] read_msg,
    input wire read_msg_ready
);

/*******************************************************************************.
* Command Receiver                                                              *
'*******************************************************************************/
wire [7:0] rx_data;
wire rx_data_ready;

// Upon completion of a valid command, the receiver will assert cmd_valid and
// output the command on cmd_in. This will place the command onto the incoming
// command FIFO.
wire cmd_valid;
wire [39:0] cmd_in;

// Command FIFO state flags 
wire cmd_fifo_full;
wire cmd_fifo_empty;

// Command readiness flag for the user of this interface. This is also
// predicated on the read message FIFO not being full, since accepting
// a command could potentially trigger generation of a new read response
// message before that queue can be emptied.
wire read_fifo_full;
assign cmd_ready = (~cmd_fifo_empty) & (~read_fifo_full);

uart_rx #(
    .BIT_RATE(1000000),
    .CLK_HZ(52000000)
) uart_rx0 (
    .clk(clk),
    .resetn(rst_n),
    .uart_rxd(rxd),
    .uart_rx_en(1'b1),
    .uart_rx_data(rx_data),
    .uart_rx_valid(rx_data_ready)
);


// Command receiver
cmd_receiver cmd_rx(
    .clk(clk),
    .rst_n(rst_n),
    .data(rx_data),
    .data_ready(rx_data_ready),
    .cmd_valid(cmd_valid),
    .cmd_msg(cmd_in)
);

// Queue of completed incoming commands
cmd_fifo cmd_queue(
    .srst(~rst_n),
    .clk(clk),
    .din(cmd_in),
    .wr_en(cmd_valid),
    .rd_en(cmd_read_en),
    .dout(cmd),
    .full(cmd_fifo_full), 
    .empty(cmd_fifo_empty)
);

/*******************************************************************************.
* Read Message Sender                                                           *
'*******************************************************************************/
// Read message sending takes place in three stages:
//  1. Read message FIFO -- queue of complete messages that are ready to be
//     sent out, as constructed by the user of this interface.
//  2. Message sender -- a state machine that pops messages off of the read
//     message FIFO as available and SLIPs them into a stream of bytes
//  3. Read byte FIFO -- a byte-by-byte queue of SLIP-encoded messages that is
//     read by the USB interface state machine to transmit bytes

// Signal to read message FIFO that the message sender is ready for data
wire sender_ready;
// Data from read message FIFO to the message sender
wire [39:0] send_msg;

// Read message FIFO status flags
wire read_fifo_empty;
wire read_fifo_ready;
assign read_fifo_ready = ~read_fifo_empty;

// SLIP-encoded byte output from message sender and its validity flag
wire send_byte_ready;
wire [7:0] send_byte;

// Read byte FIFO status flags
wire read_byte_fifo_full;
wire read_byte_fifo_empty;
wire read_byte_fifo_almost_empty;

// Output byte from the read byte FIFO to the USB interface FIXME
wire [7:0] tx_byte;
wire tx_byte_read_en;

// Read message FIFO
read_fifo read_msg_queue(
  .clk(clk),
  .srst(~rst_n),
  .din(read_msg),
  .wr_en(read_msg_ready),
  .rd_en(sender_ready),
  .dout(send_msg),
  .full(read_fifo_full),
  .empty(read_fifo_empty)
);

// Message sender
msg_sender msg_sndr(
    .clk(clk),
    .rst_n(rst_n),
    .msg(send_msg),
    .msg_ready(read_fifo_ready),
    .sender_ready(sender_ready),
    .out_byte(send_byte),
    .out_byte_ready(send_byte_ready),
    .byte_fifo_full(read_byte_fifo_full)
);

wire uart_tx_busy;
wire uart_tx_en;

assign tx_byte_read_en = (~read_byte_fifo_empty) & (~uart_tx_busy);

// Read byte FIFO
read_byte_fifo read_byte_queue(
    .srst(~rst_n),
    .clk(clk),
    .din(send_byte),
    .wr_en(send_byte_ready),
    .rd_en(tx_byte_read_en),
    .dout(tx_byte),
    .full(read_byte_fifo_full),
    .empty(read_byte_fifo_empty),
    .almost_empty(read_byte_fifo_almost_empty)
);

uart_tx #(
    .BIT_RATE(1000000),
    .CLK_HZ(52000000)
) uart_tx0 (
    .clk(clk),
    .resetn(rst_n),
    .uart_txd(txd),
    .uart_tx_en(tx_byte_read_en),
    .uart_tx_busy(uart_tx_busy),
    .uart_tx_data(tx_byte)
);


endmodule
`default_nettype wire
