// This program was cloned from: https://github.com/JN513/Risco-5
// License: CERN Open Hardware Licence Version 2 - Permissive

module UART #(
    parameter CLOCK_FREQ = 25000000,
    parameter BIT_RATE =   9600,
    parameter PAYLOAD_BITS = 8,
    parameter DEVICE_START_ADDRESS = 32'h00002007,
    parameter DEVICE_FINAL_ADDRESS = 32'h000023BA,
    parameter BUFFER_SIZE = 8
) (
    input wire clk,
    input wire reset,
    input wire rx,
    output wire tx,
    input wire read,
    input wire write,
    input wire [31:0] address,
    input wire [31:0] write_data,
    output wire response,
    output reg [31:0] read_data
);

assign response = read | write;

wire [PAYLOAD_BITS-1:0]  uart_rx_data, tx_fifo_read_data, 
    rx_fifo_read_data;
wire uart_rx_valid, uart_rx_break, uart_tx_busy, tx_fifo_empty,
    rx_fifo_empty, tx_fifo_full, rx_fifo_full;
reg uart_tx_en, tx_fifo_read, tx_fifo_write, rx_fifo_read, 
    rx_fifo_write, buffer_full;
reg [PAYLOAD_BITS-1:0] uart_tx_data, tx_fifo_write_data, 
    rx_fifo_write_data;

initial begin
    buffer_full = 1'b0;
    uart_tx_en = 1'b0;
    tx_fifo_read = 1'b0;
    tx_fifo_write = 1'b0;
    rx_fifo_read = 1'b0;
    rx_fifo_write = 1'b0;
    uart_tx_data = 8'h00;
    tx_fifo_write_data = 8'h00;
    rx_fifo_write_data = 8'h00;
end

always @(posedge clk ) begin
    uart_tx_en <= 1'b0;
    tx_fifo_read <= 1'b0;
    tx_fifo_write <= 1'b0;
    rx_fifo_read <= 1'b0;
    rx_fifo_write <= 1'b0;

    if(reset == 1'b1) begin
        buffer_full <= 1'b0;
        uart_tx_data <= 8'h00;
        tx_fifo_write_data <= 8'h00;
        rx_fifo_write_data <= 8'h00;
    end else begin
        if(write == 1'b1 && tx_fifo_full == 1'b0) begin
            tx_fifo_write_data <= write_data[7:0];
            tx_fifo_write <= 1'b1;
        end

        if(uart_tx_busy == 1'b0 && tx_fifo_empty == 1'b0) begin
            uart_tx_en <= 1'b1;
            uart_tx_data <= tx_fifo_read_data;
            tx_fifo_read <= 1'b1;
        end

        if(rx_fifo_full == 1'b0 && uart_rx_valid == 1'b1) begin
            rx_fifo_write_data <= uart_rx_data;
            rx_fifo_write <= 1'b1;
        end

        if(read == 1'b1 && rx_fifo_empty == 1'b0) begin
            rx_fifo_read <= 1'b1;
        end
    end
end

always @(*) begin
    case (address[4:2])
        3'b100: begin
            read_data = {31'h00000000, rx_fifo_full};
        end
        3'b101: begin
            read_data = {31'h00000000, tx_fifo_empty};
        end
        3'b110: begin
            read_data = {24'h000000, rx_fifo_read_data};
        end
        3'b011: begin
            read_data = {31'h00000000, rx_fifo_empty};
        end
        default: begin
            read_data = {24'h000000, rx_fifo_read_data};
        end
    endcase
end

FIFO #(
    .DEPTH(BUFFER_SIZE),
    .WIDTH(PAYLOAD_BITS)
) TX_FIFO (
    .clk(clk),
    .reset(reset),
    .write(tx_fifo_write),
    .read(tx_fifo_read),
    .write_data(tx_fifo_write_data),
    .full(tx_fifo_full),
    .empty(tx_fifo_empty),
    .read_data(tx_fifo_read_data)
);

FIFO #(
    .DEPTH(BUFFER_SIZE),
    .WIDTH(PAYLOAD_BITS)
) RX_FIFO (
    .clk(clk),
    .reset(reset),
    .write(rx_fifo_write),
    .read(rx_fifo_read),
    .write_data(rx_fifo_write_data),
    .full(rx_fifo_full),
    .empty(rx_fifo_empty),
    .read_data(rx_fifo_read_data)
);

// UART RX
uart_tool_rx #(
    .BIT_RATE(BIT_RATE),
    .PAYLOAD_BITS(PAYLOAD_BITS),
    .CLK_HZ  (CLOCK_FREQ  )
) i_uart_rx(
    .clk          (clk          ), // Top level system clock input.
    .resetn       (~reset           ), // Asynchronous active low reset.
    .uart_rxd     (rx    ), // UART Recieve pin.
    .uart_rx_en   (1'b1         ), // Recieve enable
    .uart_rx_break(uart_rx_break), // Did we get a BREAK message?
    .uart_rx_valid(uart_rx_valid), // Valid data recieved and available.
    .uart_rx_data (uart_rx_data )  // The recieved data.
);

//
// UART Transmitter module.
//
uart_tool_tx #(
    .BIT_RATE(BIT_RATE),
    .PAYLOAD_BITS(PAYLOAD_BITS),
    .CLK_HZ  (CLOCK_FREQ  )
) i_uart_tx(
    .clk          (clk          ),
    .resetn       (~reset             ),
    .uart_txd     (tx    ), // serial_tx
    .uart_tx_en   (uart_tx_en   ),
    .uart_tx_busy (uart_tx_busy ),
    .uart_tx_data (uart_tx_data ) 
);

endmodule