// This program was cloned from: https://github.com/anishathalye/notary
// License: MIT License

module soc #(
    parameter FIRMWARE_FILE = "firmware.mem",
    parameter ROM_ADDR_BITS = 10,
    parameter RAM_ADDR_BITS = 17
) (
    input clk,
    input resetn,
    input [7:0] gpio_pin_in,
    output [7:0] gpio_pin_out,
    output [3:0] uart_tx,
    input [3:0] uart_rx,
    output spi_clk,
    input spi_miso,
    output spi_mosi
);

wire mem_valid;
wire mem_instr;
wire mem_ready;
wire [31:0] mem_addr;
wire [31:0] mem_wdata;
wire [3:0] mem_wstrb;
wire [31:0] mem_rdata;

// CPU
picorv32 cpu(
    .clk (clk),
    .resetn (resetn),
    .mem_valid (mem_valid),
    .mem_instr (mem_instr),
    .mem_ready (mem_ready),
    .mem_addr (mem_addr),
    .mem_wdata (mem_wdata),
    .mem_wstrb (mem_wstrb),
    .mem_rdata (mem_rdata)
);

// ROM
wire rom_valid = mem_valid && mem_addr[31:24] == 8'h00;
wire [31:0] rom_rdata;
wire rom_ready;
rom #(
    .ADDR_BITS (ROM_ADDR_BITS),
    .FILENAME (FIRMWARE_FILE)
) rom (
    .clk (clk),
    .valid (rom_valid),
    .addr (mem_addr),
    .dout (rom_rdata),
    .ready (rom_ready)
);

// RAM
wire ram_valid = mem_valid && mem_addr[31:24] == 8'h20;
wire [31:0] ram_rdata;
wire ram_ready;
ram #(
    .ADDR_BITS (RAM_ADDR_BITS)
) ram (
    .clk (clk),
    .valid (ram_valid),
    .addr (mem_addr),
    .din (mem_wdata),
    .wstrb (mem_wstrb),
    .dout (ram_rdata),
    .ready (ram_ready)
);

// GPIO
wire gpio_ready;
wire gpio_sel;
wire [31:0] gpio_rdata;
gpio #(
    .ADDR(32'h4000_0000)
) gpio (
    .clk (clk),
    .resetn (resetn),
    .mem_valid (mem_valid),
    .mem_addr (mem_addr),
    .mem_wdata (mem_wdata),
    .mem_wstrb (mem_wstrb),
    .gpio_ready (gpio_ready),
    .gpio_sel (gpio_sel),
    .gpio_rdata (gpio_rdata),
    .gpio_pin_in (gpio_pin_in),
    .gpio_pin_out (gpio_pin_out)
);

// UARTs
wire uart_ready [3:0];
wire uart_sel [3:0];
wire [31:0] uart_rdata [3:0];
genvar i;
for (i = 0; i < 4; i = i + 1) begin : uarts
    uart #(
        .ADDR(32'h4000_1000 + (32'h1000 * i))
    ) uart1 (
        .clk (clk),
        .resetn (resetn),
        .ser_tx (uart_tx[i]),
        .ser_rx (uart_rx[i]),
        .mem_valid (mem_valid),
        .mem_addr (mem_addr),
        .mem_wdata (mem_wdata),
        .mem_wstrb (mem_wstrb),
        .uart_ready (uart_ready[i]),
        .uart_sel (uart_sel[i]),
        .uart_rdata (uart_rdata[i])
    );
end

// SPI
wire spi_ready;
wire spi_sel;
wire [31:0] spi_rdata;
spi #(
    .ADDR(32'h4000_5000)
) spi (
    .clk (clk),
    .resetn (resetn),
    .spi_clk (spi_clk),
    .spi_miso (spi_miso),
    .spi_mosi (spi_mosi),
    .mem_valid (mem_valid),
    .mem_addr (mem_addr),
    .mem_wdata (mem_wdata),
    .mem_wstrb (mem_wstrb),
    .spi_ready (spi_ready),
    .spi_sel (spi_sel),
    .spi_rdata (spi_rdata)
);

// memory inputs
assign mem_ready = (rom_valid && rom_ready) ||
    (ram_valid && ram_ready) ||
    (gpio_sel && gpio_ready) ||
    (uart_sel[0] && uart_ready[0]) ||
    (uart_sel[1] && uart_ready[1]) ||
    (uart_sel[2] && uart_ready[2]) ||
    (uart_sel[3] && uart_ready[3]) ||
    (spi_sel && spi_ready);
assign mem_rdata = (rom_valid && rom_ready) ? rom_rdata :
    (ram_valid && ram_ready) ? ram_rdata :
    (gpio_sel) ? gpio_rdata :
    (uart_sel[0]) ? uart_rdata[0] :
    (uart_sel[1]) ? uart_rdata[1] :
    (uart_sel[2]) ? uart_rdata[2] :
    (uart_sel[3]) ? uart_rdata[3] :
    (spi_sel) ? spi_rdata :
    32'h 0000_0000;

endmodule
