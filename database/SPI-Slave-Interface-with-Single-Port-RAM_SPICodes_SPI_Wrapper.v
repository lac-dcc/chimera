// This program was cloned from: https://github.com/3b3al-MV/SPI-Slave-Interface-with-Single-Port-RAM
// License: MIT License

module SPI_Wrapper(clk, rst_n, SS_n, MOSI, MISO);

    input clk, rst_n, SS_n, MOSI;
    output MISO;

    wire [9:0] din;
    wire [7:0] dout;
    wire tx_valid, rx_valid;

    spi_slave spi_slave0(clk, rst_n, SS_n, MOSI, MISO, din, rx_valid, dout, tx_valid);
    RAM RAM0(.din(din), .clk(clk), .rst_n(rst_n), .rx_valid(rx_valid), .dout(dout), .tx_valid(tx_valid));

endmodule