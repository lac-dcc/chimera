/*
 * platform_tb.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`timescale 1 ns / 100 ps
`default_nettype none

module platform_tb;

	// Signals
	// -------

	wire spi_mosi;
	wire spi_miso;
	wire spi_flash_cs_n;
	wire spi_clk;

	reg  [ 1:0] wb_addr;
	wire [31:0] wb_rdata;
	reg  [31:0] wb_wdata;
	reg         wb_we;
	reg         wb_cyc;
	wire        wb_ack;

	reg rst = 1;
	reg clk = 0;


	task wb_write;
		input [ 1:0] addr;
		input [31:0] data;
		begin
			wb_addr  <= addr;
			wb_wdata <= data;
			wb_we    <= 1'b1;
			wb_cyc   <= 1'b1;

			while (~wb_ack)
				@(posedge clk);

			wb_addr  <= 4'hx;
			wb_wdata <= 32'hxxxxxxxx;
			wb_we    <= 1'bx;
			wb_cyc   <= 1'b0;

			@(posedge clk);
		end
	endtask


	// Setup recording
	// ---------------

	initial begin
		$dumpfile("platform_tb.vcd");
		$dumpvars(0,platform_tb);
		# 2000000 $finish;
	end


	// Clock & Stimulus
	// ----------------

	// Reset pulse
	initial begin
		# 101 rst = 0;

		# 650000 $finish;
	end

	// Clock
	always #5 clk = !clk;

	// Stimulus
	initial begin
		// Defaults
		wb_addr  <= 2'bxx;
		wb_wdata <= 32'hxxxxxxxx;
		wb_we    <= 1'bx;
		wb_cyc   <= 1'b0;

		@(negedge rst);
		@(posedge clk);

		// Enable SPI
		wb_write(2'b00, 32'h00000080);
		#200 @(posedge clk);

		// Pull CS_n low
		wb_write(2'b00, 32'h00000081);
		#50 @(posedge clk);

		// Write data
		wb_write(2'b01, 32'h00000003);

		#100 wb_write(2'b01, 32'h00000000);
		#100 wb_write(2'b01, 32'h00000010);
		#100 wb_write(2'b01, 32'h00000080);
		#100 wb_write(2'b01, 32'h00000000);
		#100 wb_write(2'b01, 32'h00000000);

		#150 @(posedge clk);

		// Pull CS_n high
		wb_write(2'b00, 32'h00000080);
		#50 @(posedge clk);

	end


	// DUT
	// ---

	platform dut_I (
		.spi_pad_mosi (spi_mosi),
		.spi_pad_miso (spi_miso),
		.spi_pad_clk  (spi_clk),
		.spi_pad_cs_n (spi_flash_cs_n),
		.irqo_timer   (),
		.wb_addr      (wb_addr),
		.wb_rdata     (wb_rdata),
		.wb_wdata     (wb_wdata),
		.wb_we        (wb_we),
		.wb_cyc       (wb_cyc),
		.wb_ack       (wb_ack),
		.clk          (clk),
		.rst          (rst)
	);


	// Support
	// -------

	spiflash flash_I (
		.csb(spi_flash_cs_n),
		.clk(spi_clk),
		.io0(spi_mosi),
		.io1(spi_miso),
		.io2(),
		.io3()
	);

endmodule // platform_tb
