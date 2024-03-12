//
// iceZ0mb1e - FPGA 8-Bit TV80 SoC for Lattice iCE40
// with complete open-source toolchain flow using yosys and SDCC
//
// Copyright (c) 2018 Franz Neumann (netinside2000@gmx.de)
//
// Permission is hereby granted, free of charge, to any person obtaining a 
// copy of this software and associated documentation files (the "Software"), 
// to deal in the Software without restriction, including without limitation 
// the rights to use, copy, modify, merge, publish, distribute, sublicense, 
// and/or sell copies of the Software, and to permit persons to whom the 
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included 
// in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, 
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF 
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. 
// IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY 
// CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, 
// TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE 
// SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

module top(
	input clk,
	output D1,
	output D2,
	output D3,
	output D4,
	output D5,
	output D6,
	output D7,
	output D8,
	output uart_txd,
	input uart_rxd,
	output i2c_scl,
	inout  i2c_sda,
    output spi_sclk,
	output spi_mosi,
	output spi_miso,
    output spi_cs
);

	wire[7:0] port_a;
	wire[7:0] port_b;

	assign D1 = port_a[0];
	assign D2 = port_a[1];
	assign D3 = port_a[2];
	assign D4 = port_a[3];
	assign D5 = port_a[4];
	assign D6 = port_a[5];
	assign D7 = port_a[6];
	assign D8 = port_a[7];

	iceZ0mb1e core (
		.clk		(clk),
		.uart_txd	(uart_txd),
		.uart_rxd	(uart_rxd),
		.i2c_scl	(i2c_scl),
		.i2c_sda	(i2c_sda),
    	.spi_sclk	(spi_sclk),
		.spi_mosi	(spi_mosi),
		.spi_miso	(spi_miso),
    	.spi_cs		(spi_cs),
		.port_a		(port_a),
		.port_b		(port_b),
		.debug		()
	);

endmodule
