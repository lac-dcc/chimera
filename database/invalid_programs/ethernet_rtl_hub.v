// SPDX-License-Identifier: AGPL-3.0-Only OR CERN-OHL-S-2.0
/*
 * Copyright (C) 2023 Sean Anderson <seanga2@gmail.com>
 */

`include "common.vh"

module hub (
	input clk_125,
	input clk_250,

	input [PORT_COUNT - 1:0] indicate_data,
	input [PORT_COUNT - 1:0] signal_detect,
	output [PORT_COUNT - 1:0] request_data,

	/* Wishbone management */
	input wb_rst,
	output wb_ack, wb_err,
	input wb_cyc, wb_stb, wb_we,
	input [PORT_COUNT + 5 - 1:0] wb_addr,
	input [15:0] wb_data_write,
	output [15:0] wb_data_read,

	/* Other status (for LEDs) */
	output reg collision, transmitting,
	output [PORT_COUNT - 1:0] link_status,
	output [PORT_COUNT - 1:0] receiving
);

	parameter WISHBONE		= 1;
	parameter REGISTER_WB		= 1;
	parameter PORT_COUNT		= 4;
	parameter ELASTIC_BUF_SIZE	= 5;
	parameter ENABLE_COUNTERS	= 1;
	parameter COUNTER_WIDTH		= 15;
	parameter [23:0] OUI		= 0;
	parameter [5:0] MODEL		= 0;
	parameter [3:0] REVISION	= 0;

	localparam MII_100_RATIO	= 5;

	reg buf_ce, tx_ce;
	wire collision_next, transmitting_next;
	wire [PORT_COUNT - 1:0] rx_ce, rx_dv, rx_er, tx_en, tx_er, buf_dv, buf_er, col, crs;
	wire [PORT_COUNT * 4 - 1:0] rxd, txd, buf_data;

	hub_core #(
		.PORT_COUNT(PORT_COUNT)
	) hub (
		.clk(clk_125),
		.rx_dv(buf_dv),
		.rx_er(buf_er),
		.rxd(buf_data),
		.tx_en(tx_en),
		.tx_er(tx_er),
		.txd(txd),
		.jam(collision_next),
		.activity(transmitting_next)
	);

	wire [PORT_COUNT - 1:0] bus_ack, bus_err, bus_cyc, bus_stb, bus_we;
	wire [5 * PORT_COUNT - 1:0] bus_addr;
	wire [16 * PORT_COUNT - 1:0] bus_data_write, bus_data_read;

	generate if (WISHBONE) begin
		wb_mux #(
			.ADDR_WIDTH(5),
			.DATA_WIDTH(16),
			.SLAVES(PORT_COUNT)
		) mux (
			.m_ack(wb_ack),
			.m_err(wb_err),
			.m_cyc(wb_cyc),
			.m_stb(wb_stb),
			.m_we(wb_we),
			.m_addr(wb_addr),
			.m_data_write(wb_data_write),
			.m_data_read(wb_data_read),
			.s_ack(bus_ack),
			.s_err(bus_err),
			.s_cyc(bus_cyc),
			.s_stb(bus_stb),
			.s_we(bus_we),
			.s_addr(bus_addr),
			.s_data_write(bus_data_write),
			.s_data_read(bus_data_read)
		);
	end else begin
		assign wb_ack = 0;
		assign wb_err = wb_cyc && wb_stb;
		assign bus_cyc = {PORT_COUNT{1'b0}};
		assign bus_stb = {PORT_COUNT{1'b0}};
	end endgenerate

	genvar i;
	generate for (i = 0; i < PORT_COUNT; i = i + 1) begin : port
		wire reg_ack, reg_err, reg_cyc, reg_stb, reg_we;
		wire [4:0] reg_addr;
		wire [15:0] reg_data_write, reg_data_read;

		if (REGISTER_WB) begin
			wb_reg #(
				.ADDR_WIDTH(5)
			) wb_reg (
				.clk(clk_125),
				.rst(wb_rst),
				.s_ack(bus_ack[i]),
				.s_err(bus_err[i]),
				.s_cyc(bus_cyc[i]),
				.s_stb(bus_stb[i]),
				.s_we(bus_we[i]),
				.s_addr(bus_addr[i * 5 +: 5]),
				.s_data_write(bus_data_write[i * 16 +: 16]),
				.s_data_read(bus_data_read[i * 16 +: 16]),
				.m_cyc(reg_cyc),
				.m_stb(reg_stb),
				.m_ack(reg_ack),
				.m_err(reg_err),
				.m_we(reg_we),
				.m_addr(reg_addr),
				.m_data_write(reg_data_write),
				.m_data_read(reg_data_read)
			);
		end else begin
			assign bus_ack[i] = reg_ack;
			assign bus_err[i] = reg_err;
			assign reg_cyc = bus_cyc[i];
			assign reg_stb = bus_stb[i];
			assign reg_we = bus_we[i];
			assign reg_addr = bus_addr[i * 5 +: 5];
			assign reg_data_write = bus_data_write[i * 16 +: 16];
			assign bus_data_read[i * 16 +: 16] = reg_data_read;
		end

		phy_internal #(
			.WISHBONE(WISHBONE),
			.ENABLE_COUNTERS(ENABLE_COUNTERS),
			.COUNTER_WIDTH(COUNTER_WIDTH),
			.OUI(OUI),
			.MODEL(MODEL),
			.REVISION(REVISION)
		) phy (
			.clk_125(clk_125),
			.clk_250(clk_250),
			.indicate_data(indicate_data[i]),
			.signal_detect(signal_detect[i]),
			.request_data(request_data[i]),
			.mii_tx_ce(tx_ce),
			.mii_tx_en(tx_en[i]),
			.mii_tx_er(tx_er[i]),
			.mii_txd(txd[i * 4 +: 4]),
			.mii_rx_ce(rx_ce[i]),
			.mii_rx_dv(rx_dv[i]),
			.mii_rx_er(rx_er[i]),
			.mii_rxd(rxd[i * 4 +: 4]),
			.wb_ack(reg_ack),
			.wb_err(reg_err),
			.wb_cyc(reg_cyc),
			.wb_stb(reg_stb),
			.wb_we(reg_we),
			.wb_addr(reg_addr),
			.wb_data_write(reg_data_write),
			.wb_data_read(reg_data_read),
			.link_status(link_status[i]),
			.receiving(receiving[i])
		);

		mii_elastic_buffer #(
			.BUF_SIZE(ELASTIC_BUF_SIZE)
		) buffer (
			.clk(clk_125),
			.tx_ce(rx_ce[i]),
			.tx_en(rx_dv[i]),
			.tx_er(rx_er[i]),
			.txd(rxd[i * 4 +: 4]),
			.rx_ce(buf_ce),
			.rx_dv(buf_dv[i]),
			.rx_er(buf_er[i]),
			.rxd(buf_data[i * 4 +: 4])
		);
	end endgenerate

	reg buf_ce_next;
	reg [3:0] tx_counter, tx_counter_next;

	initial begin
		buf_ce = 0;
		tx_ce = 0;
		tx_counter = MII_100_RATIO - 1;
	end

	always @(*) begin
		buf_ce_next = 0;
		tx_counter_next = tx_counter - 1;
		if (!tx_counter) begin
			tx_counter_next = MII_100_RATIO - 1;
			buf_ce_next = 1;
		end
	end

	always @(posedge clk_125) begin
		buf_ce <= buf_ce_next;
		tx_ce <= buf_ce;
		tx_counter <= tx_counter_next;
		if (tx_ce) begin
			collision <= collision_next;
			transmitting <= transmitting_next;
		end
	end

endmodule
