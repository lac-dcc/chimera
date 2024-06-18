// This program was cloned from: https://github.com/RustamSubkhankulov/verilog-labs
// License: MIT License

`timescale 1 ns / 100 ps

module testbench();

/* Clock frequency */
parameter CLK_FREQ = 76800;

/* UART baudrate */
parameter BAUDRATE = 9600;

/* ROM address width in bits */
parameter ADDR_WIDTH = 5;

/* ROM data element size ib bits */
parameter DATA_WIDTH = 8;

/* Stop bit size */
parameter STOP_BIT_SIZE = 1.5;

/* Represents clock, initial value is 0 */
reg clk = 1'b0;

always begin

    /* Toggle clock every 1ns */
    #1 clk = ~clk;
end

/* Current data address */
wire [ADDR_WIDTH - 1:0]addr;

/* Data fetched from rom */
wire [DATA_WIDTH - 1:0]transmit_data;

/* Data received via UART Receiver */
wire [DATA_WIDTH - 1:0]receive_data;

/* Read-Only Memory fetcher */
rom_fetcher #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) rom_fetcher(
    .clk(clk),
    .next(uart_tx_ready), 
    .addr(addr)
);

/* Read-Only Memory */
rom #(.ADDR_WIDTH(ADDR_WIDTH), .DATA_WIDTH(DATA_WIDTH)) rom(
    .clk(clk), 
    .addr(addr),
    .data(transmit_data)
);

/* UART transmitter tx line */
wire uart_tx_line;

/* UART transmitter is ready */
wire uart_tx_ready;

/* UART receiver is ready */
wire uart_rx_ready;

/* UART transmitter */
uart_tx #(
    .CLK_FREQ(CLK_FREQ), 
    .BAUDRATE(BAUDRATE), 
    .DATA_WIDTH(DATA_WIDTH), 
    .STOP_BIT_SIZE(STOP_BIT_SIZE)) 
uart_tx(
    .clk(clk), 
    .start(uart_tx_ready && transmit_data != 0), 
    .transmit_data(transmit_data),
    .line(uart_tx_line),
    .ready(uart_tx_ready)
);

/* UART receiver */
uart_rx #(
    .CLK_FREQ(CLK_FREQ), 
    .BAUDRATE(BAUDRATE), 
    .DATA_WIDTH(DATA_WIDTH), 
    .STOP_BIT_SIZE(STOP_BIT_SIZE))
uart_rx(
    .clk(clk), 
    .line(uart_tx_line),
    .receive_data(receive_data),
    .ready(uart_rx_ready)
);

/* Counter of received bytes of data and copy of received data  */
reg [2**ADDR_WIDTH - 1: 0] recv_ct = 0;
reg [DATA_WIDTH - 1:0]recv_data = 0;

always @(posedge clk) begin
    
    /* Increment counter of received data whenever rx is ready */
    recv_ct <= recv_ct + (uart_rx_ready);

    /* Copy received data to reg */
    recv_data <= receive_data;
end

initial begin
    
    $monitor("[$monitor] recv_data[%02d]=0x%0h (%0c)", recv_ct, recv_data, recv_data);

    /* Open for dump of signals */
    $dumpvars;
    
    /* Write to console */
    $display("Test started...");
    
    /* Stop simulation when all ROM contents are fetched*/
    #4096 $finish;
end

endmodule
