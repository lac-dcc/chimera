// This program was cloned from: https://github.com/ekb0412/100DaysofRTL
// License: Apache License 2.0

`timescale 1ns / 1ps

module test_bench;
	reg clk;
	reg reset;
	reg [15:0]datain;
	wire spi_cs_l;
	wire spi_sclk;
	wire spi_data;
	wire [4:0]counter;

	spi_state dut(clk, reset, datain, spi_cs_l, spi_sclk, spi_data, counter);

	initial begin
		clk = 0;
		reset = 1;
		datain = 0;
	end

	always #5 clk=~clk;

    initial begin
    
    #10 reset=1'b0;
    
    #10  datain=16'h0412;
    #335 datain=16'h4839;
    #335 datain=16'habeb;

    end
endmodule
