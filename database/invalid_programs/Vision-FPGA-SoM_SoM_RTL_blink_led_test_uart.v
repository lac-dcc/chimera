`include "../common/ice40_resetn.v"
`include "../common/uart.v"

module uart_top(
    input host_sck_uart_rx,
    output host_mosi_uart_tx,
    output [2:0] gpio
);

parameter CLOCK_SEL = 24; // 24MHz or 12MHz

wire [7:0] rx_byte, tx_byte;
wire received, transmit;
reg is_tansmitting;

wire clk;
wire reset_n, reset;

// Select the right clock divider
`UP_HSOSC #( .CLKHF_DIV ((CLOCK_SEL==12) ? "0b10" : "0b01") ) u_osc (.CLKHFPU(1'b1), .CLKHFEN(1'b1), .CLKHF(clk));
	
// Reset
ice40_resetn u_reset_n (.clk(clk), .resetn(reset_n));

uart #(.CLOCK_DIVIDE( 625 )) // clock rate (24Mhz) / (baud rate (9600) * 4)
my_uart (
    .clk(clk),          //  master clock for this component
    .rst(reset),               // synchronous reset line (resets if high)
    .rx(host_sck_uart_rx),     // receive data on this line
    .tx(host_mosi_uart_tx),     // transmit data on this line
    .transmit(transmit),       // signal o indicate that the UART should start a transmission
    .tx_byte(tx_byte),        // 8-bit bus with byte to be transmitted when transmit is raised high
    .received(received),       // output flag raised high for one cycle of clk when a byte is received
    .rx_byte(rx_byte),        // byte which has just been received when received is raise
    .is_transmitting(),               // indicates that we are currently receiving data on the rx lin
    .recv_error() 		// indicates that we are currently sending data on the tx line
    );


// Loopback
assign transmit = received;
assign tx_byte = rx_byte;

// Debug LED's
assign gpio[2:0] = rx_byte[2:0];

endmodule // uart_top