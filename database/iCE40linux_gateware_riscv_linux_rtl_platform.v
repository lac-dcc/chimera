/*
 * platform.v
 *
 * vim: ts=4 sw=4
 *
 * Copyright (C) 2021  Sylvain Munaut <tnt@246tNt.com>
 * SPDX-License-Identifier: CERN-OHL-P-2.0
 */

`default_nettype none

module platform (
	inout  wire        spi_pad_mosi,
	inout  wire        spi_pad_miso,
	inout  wire        spi_pad_clk,
	output wire        spi_pad_cs_n,

	output wire        irqo_timer,

	input  wire [ 1:0] wb_addr,
	output reg  [31:0] wb_rdata,
	input  wire [31:0] wb_wdata,
	input  wire        wb_we,
	input  wire        wb_cyc,
	output reg         wb_ack,

	input  wire        clk,
	input  wire        rst
);

	// Signals
	// -------

	// Bus
	wire bus_rd_clr;

	(* keep *)
	wire bus_we_pre;
	reg  bus_we_spi_csr;
	reg  bus_we_spi_data;
	reg  bus_we_mtimecmp;

	// Timer
	reg  [31:0] mtime;
	reg  [31:0] mtimecmp;

	reg  [23:0] mtimediff;


	// Bus interface
	// -------------

	// Ack
	always @(posedge clk)
		wb_ack <= wb_cyc & ~wb_ack;

	// Write Enables
	assign bus_we_pre = wb_cyc & wb_we & ~wb_ack;

	always @(posedge clk)
	begin
		bus_we_spi_csr  <= bus_we_pre & (wb_addr[1:0] == 2'b00);
		bus_we_spi_data <= bus_we_pre & (wb_addr[1:0] == 2'b01);
		bus_we_mtimecmp <= bus_we_pre & (wb_addr[1:0] == 2'b10);
	end

	// Read-mux
	assign bus_rd_clr = ~wb_cyc | wb_ack;

	always @(posedge clk)
		if (bus_rd_clr)
			wb_rdata <= 32'h00000000;
		else
			wb_rdata <= wb_addr[1] ? mtime : spi_rdata;


	// SPI
	// ---

	// SPI
		// Control
	reg         spi_ena;
	reg         spi_cs_n;

	reg   [3:0] spi_cnt;

	(* keep *) wire spi_run_shift;
	(* keep *) wire spi_run_clk;

		// Shift reg
	reg   [7:0] spi_data;

		// Bus
	wire [31:0] spi_rdata;

		// IOB
	wire sio_mosi_i,  sio_miso_i;
	wire sio_mosi_o,  sio_miso_o,  sio_clk_o,  sio_csn_o;
	wire sio_mosi_oe, sio_miso_oe, sio_clk_oe, sio_csn_oe;

	// CSR
	always @(posedge clk or posedge rst)
		if (rst) begin
			spi_ena  <= 1'b0;
			spi_cs_n <= 1'b1;
		end else if (bus_we_spi_csr) begin
			spi_ena  <=  wb_wdata[7];
			spi_cs_n <= ~wb_wdata[0];
		end

	// Control
	always @(posedge clk or posedge rst)
		if (rst)
			spi_cnt <= 4'h0;
		else
			spi_cnt <= bus_we_spi_data ? 4'ha : (spi_cnt + {4{spi_run_shift}});

	assign spi_run_shift = (spi_cnt != 4'h0); 
	assign spi_run_clk   = (spi_cnt <= 4'h9) & (spi_cnt >= 4'h2);

	// Shift register
	always @(posedge clk)
		if (bus_we_spi_data)
			spi_data <= wb_wdata[7:0];
		else if (spi_run_shift)
			spi_data <= { spi_data[6:0], sio_miso_i };

	// Bus
	assign spi_rdata = {
		spi_run_shift,
		23'd0,
		spi_data
	};

	// IO control
	assign sio_mosi_oe = spi_ena;
	assign sio_miso_oe = 1'b0;
	assign sio_clk_oe  = spi_ena;
	assign sio_csn_oe  = spi_ena;

	assign sio_mosi_o  = spi_data[7];
	assign sio_miso_o  = 1'b0;
	assign sio_clk_o   = spi_run_clk;
	assign sio_csn_o   = spi_cs_n;

	// IOBs
	SB_IO #(
		.PIN_TYPE(6'b1101_00),
		.PULLUP(1'b1)
	) spi_io_I[1:0] (
		.PACKAGE_PIN       ({spi_pad_mosi, spi_pad_miso}),
		.LATCH_INPUT_VALUE (1'b0),
		.CLOCK_ENABLE      (1'b1),
		.INPUT_CLK         (clk),
		.OUTPUT_CLK        (clk),
		.OUTPUT_ENABLE     ({sio_mosi_oe,  sio_miso_oe }),
		.D_OUT_0           ({sio_mosi_o,   sio_miso_o  }),
		.D_IN_0            ({sio_mosi_i,   sio_miso_i  })
	);

	SB_IO #(
		.PIN_TYPE(6'b1100_01),
		.PULLUP(1'b1)
	) spi_clk_I (
		.PACKAGE_PIN       (spi_pad_clk),
		.LATCH_INPUT_VALUE (1'b0),
		.CLOCK_ENABLE      (1'b1),
		.OUTPUT_CLK        (clk),
		.OUTPUT_ENABLE     (sio_clk_oe),
		.D_OUT_0           (1'b0),
		.D_OUT_1           (sio_clk_o)
	);

	SB_IO #(
		.PIN_TYPE(6'b1010_01),
		.PULLUP(1'b1)
	) spi_csn_I (
		.PACKAGE_PIN   (spi_pad_cs_n),
		.OUTPUT_ENABLE (sio_csn_oe),
		.D_OUT_0       (sio_csn_o)
	);


	// Timer
	// -----

	always @(posedge clk or posedge rst)
		if (rst)
			mtime <= 32'h00000000;
		else
			mtime <= mtime + 1;

	always @(posedge clk or posedge rst)
		if (rst)
			mtimecmp <= 32'h00000000;
		else if (bus_we_mtimecmp)
			mtimecmp <= ~wb_wdata;

	always @(posedge clk)
		mtimediff <= mtime[31:8] + mtimecmp[31:8] + 1;

	assign irqo_timer = ~mtimediff[23] & mtimecmp[0];

endmodule // platform
