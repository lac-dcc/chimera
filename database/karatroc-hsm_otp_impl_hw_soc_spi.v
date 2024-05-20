// This program was cloned from: https://github.com/katherinezhao02/karatroc-hsm
// License: MIT License

`timescale 1 ns / 1 ps

module spi #(
    parameter [31:0] ADDR = 32'hffff_ffff
) (
    input clk,
    input resetn,
    output spi_clk,
    input spi_miso,
    output spi_mosi,
    input mem_valid,
    input [31:0] mem_addr,
    input [31:0] mem_wdata,
    input [3:0] mem_wstrb,
    output spi_ready,
    output spi_sel,
    output [31:0] spi_rdata
);

// layout:
// ADDR -- SPI transmit/receive data

wire mem_sel = mem_valid && (mem_addr == ADDR);
wire mem_read = mem_sel && (mem_wstrb == 4'b0000);
wire mem_write = mem_sel && mem_wstrb[0];

wire [7:0] tx_byte;
wire tx_dv;
wire tx_ready;
wire rx_dv;
wire [7:0] rx_byte;

reg rx_has_data;
reg [7:0] rx_data;
wire read_ready;

// rx logic
always @(posedge clk) begin
    if (~resetn) begin
        rx_has_data <= 0;
        rx_data <= 8'h0;
    end else begin
        if (read_ready && ~rx_dv) begin
            rx_has_data <= 0;
        end else if (rx_dv) begin
            rx_data <= rx_byte;
            rx_has_data <= 1;
        end
    end
end
assign spi_rdata = {24'h0, rx_data};
assign read_ready = rx_has_data && mem_read;

// tx logic
assign tx_byte = mem_wdata[7:0];
assign tx_dv = tx_ready && mem_write;
wire write_ready = tx_dv;

SPI_Master spi_master(
    .i_Rst_L (resetn),
    .i_Clk (clk),
    .i_TX_Byte (tx_byte),
    .i_TX_DV (tx_dv),
    .o_TX_Ready (tx_ready),
    .o_RX_DV (rx_dv),
    .o_RX_Byte (rx_byte),
    .o_SPI_Clk (spi_clk),
    .i_SPI_MISO (spi_miso),
    .o_SPI_MOSI (spi_mosi)
);

assign spi_ready = read_ready || write_ready;
assign spi_sel = mem_sel;

endmodule
