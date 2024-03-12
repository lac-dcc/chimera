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
	inout i2c_sda,
    output spi_sclk,
	output spi_mosi,
	input  spi_miso,
    output spi_cs,
    output LED,   // User/boot LED next to power LED
    output USBPU  // USB pull-up resistor
);

	wire[7:0] P1_out;
	wire[7:0] P2_out;

	wire i2c_scl;
	wire i2c_sda_out;
	wire i2c_sda_in;
	wire i2c_sda_oen;

	assign D1 = P1_out[0];
	assign D2 = P1_out[1];
	assign D3 = P1_out[2];
	assign D4 = P1_out[3];
	assign D5 = P1_out[4];
	assign D6 = P1_out[5];
	assign D7 = P1_out[6];
	assign D8 = P1_out[7];

	SB_IO #(
		.PIN_TYPE(6'b 1010_01),
		.PULLUP(1'b 0)
	) i2c_sda_pin (
		.PACKAGE_PIN(i2c_sda),
		.OUTPUT_ENABLE(i2c_sda_oen),
		.D_OUT_0(i2c_sda_out),
		.D_IN_0(i2c_sda_in)
	);

	iceZ0mb1e core (
		.clk		(clk),
		.uart_txd	(uart_txd),
		.uart_rxd	(uart_rxd),
		.i2c_scl	(i2c_scl),
		.i2c_sda_in	(i2c_sda_in),
		.i2c_sda_out	(i2c_sda_out),
		.i2c_sda_oen	(i2c_sda_oen),
    	.spi_sclk	(spi_sclk),
		.spi_mosi	(spi_mosi),
		.spi_miso	(spi_miso),
    	.spi_cs		(spi_cs),
		.P1_out		(P1_out),
		.P1_in		(8'h55),
		.P1_oen		(),
		.P2_out		(P2_out),
		.P2_in		(8'hAA),
		.P2_oen		(),
		.debug		()
	);
	


	
    // ================================================================
    // ================================================================
    // ================================================================

    wire CLK = clk;
    // drive USB pull-up resistor to '0' to disable USB
    assign USBPU = 0;

    // look in pins.pcf for all the pin names on the TinyFPGA BX board
    ////////
    // make a simple blink circuit
    ////////

    // keep track of time and location in blink_pattern
    reg [25:0] blink_counter;

    // pattern that will be flashed over the LED over time
    wire [31:0] blink_pattern = 32'b101010001110111011100010101;

    // increment the blink_counter every clock
    always @(posedge CLK) begin
        blink_counter <= blink_counter + 1;
    end
    
    // light up the LED according to the pattern
//    assign LED = blink_pattern[blink_counter[25:21]];
    assign LED = P1_out[0]; // blink_pattern[blink_counter[25:21]];
endmodule




