// This program was cloned from: https://github.com/abnoname/iceZ0mb1e
// License: MIT License

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

`timescale 1us/1us

module tb_iceZ0mb1e;

    initial begin
        $dumpfile(`__def_vcd_file);
        $dumpvars(0, tb_iceZ0mb1e);

        //# 15E3 $finish;
        # 250E3 $finish;
        //# 1E6 $finish;
    end

    reg clk = 0;
    always #1 clk = !clk;

    inout [7:0] P1_out;
    inout [7:0] P2_out;
	wire i2c_scl;
	wire i2c_sda_out;
	wire i2c_sda_in;
	wire i2c_sda_oen;
    output sclk, cs, mosi;
    input miso;
    wire rx = 0;
    wire tx;

    iceZ0mb1e t1 (
        .clk        (clk),
        .uart_txd   (tx),
        .uart_rxd   (rx),
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

endmodule
