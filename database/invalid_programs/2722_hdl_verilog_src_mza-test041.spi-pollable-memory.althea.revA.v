// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-05-07 by mza
// based on mza-test040.spi-pollable-memory.v and modified to work on an althea
// last updated 2021-07-02 by mza

`include "lib/spi.v"
`include "lib/RAM8.v"
`include "lib/serdes_pll.v"
`include "lib/plldcm.v"

//`define USE_SLOW_CLOCK
//`define USE_INFERRED_RAM_16
//`define USE_BRAM_512
`define USE_BRAM_4K

//`ifdef xilinx
//`else
//`endif

module top (
	input clock50_p, clock50_n,
	output lemo,
	input rpi_spi_sclk,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	output led_0, led_1, led_2, led_3,
	output led_4, led_5, led_6, led_7
);
	reg reset1 = 1;
	reg reset2 = 1;
	reg reset3 = 1;
	wire clock50;
	IBUFGDS mybuf (.I(clock50_p), .IB(clock50_n), .O(clock50));
	wire rawclock125;
	wire pll_locked;
	simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE0(4), .PHASE0(0.0), .PERIOD(20.0)) kronos (.clockin(clock50), .reset(reset1), .clock0out(rawclock125), .clock1out(), .clock2out(), .clock3out(), .clock4out(), .clock5out(), .locked(pll_locked)); // 50->125
	wire clock125;
	BUFG mrt (.I(rawclock125), .O(clock125));
	wire word_clock;
	wire [7:0] oserdes_word_out;
	wire pll_oserdes_locked;
	wire clock_ram;
	wire clock_spi;
	assign clock_ram = word_clock;
	assign clock_spi = word_clock;
	reg [7:0] reset_counter = 0;
	always @(posedge clock50) begin
		if (reset1) begin
			if (reset_counter[7]) begin
				reset1 <= 0;
			end else begin
				reset_counter <= reset_counter + 1'b1;
			end
		end else if (reset2) begin
			if (pll_locked) begin
				reset2 <= 0;
			end
		end else if (reset3) begin
			if (pll_oserdes_locked) begin
				reset3 <= 0;
			end
		end
	end
	wire [7:0] command8;
	wire [15:0] address16;
	wire [31:0] data32_0123;
	wire [31:0] data32_3210;
	assign data32_0123[7:0]   = data32_3210[31:24];
	assign data32_0123[15:8]  = data32_3210[23:16];
	assign data32_0123[23:16] = data32_3210[15:8];
	assign data32_0123[31:24] = data32_3210[7:0];
	wire [31:0] read_data32_0123;
	wire [31:0] read_data32_3210;
	assign read_data32_3210[7:0]   = read_data32_0123[31:24];
	assign read_data32_3210[15:8]  = read_data32_0123[23:16];
	assign read_data32_3210[23:16] = read_data32_0123[15:8];
	assign read_data32_3210[31:24] = read_data32_0123[7:0];
	wire transaction_valid;
	SPI_peripheral_command8_address16_data32 spi_c8_a16_d32 (.clock(clock_spi),
		.SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(rpi_spi_miso), .SSEL(rpi_spi_ce1),
		.transaction_valid(transaction_valid), .command8(command8), .address16(address16), .data32(data32_3210), .data32_to_controller(read_data32_3210));
`ifdef USE_INFERRED_RAM_16
	wire [3:0] address4 = address16[3:0];
	RAM_inferred #(.addr_width(4), .data_width(32)) myram (.reset(reset3),
		.wclk(clock_ram), .waddr(address4), .din(data32_0123), .write_en(transaction_valid),
		.rclk(clock_ram), .raddr(address4), .dout(read_data32_0123));
`elsif USE_BRAM_512
	wire [8:0] address9 = address16[8:0];
	wire [10:0] read_address11 = read_address[10:0];
	RAM_s6_512_32bit_8bit mem (.reset(reset3),
		.clock_a(clock_ram), .address_a(address9), .data_in_a(data32_0123), .write_enable_a(transaction_valid), .data_out_a(read_data32_0123),
		.clock_b(clock_ram), .address_b(read_address11), .data_out_b(oserdes_word_out));
`elsif USE_BRAM_4K
	wire [11:0] address12 = address16[11:0];
	wire [13:0] read_address14 = read_address[13:0];
	RAM_s6_4k_32bit_8bit mem (.reset(reset3),
		.clock_a(clock_ram), .address_a(address12), .data_in_a(data32_0123), .write_enable_a(transaction_valid), .data_out_a(read_data32_0123),
		.clock_b(clock_ram), .address_b(read_address14), .data_out_b(oserdes_word_out));
`endif
	reg [15:0] read_address = 0;
	wire [7:0] leds;
	assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = leds;
	assign leds = oserdes_word_out;
	ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (.clock_in(clock125), .reset(reset2), .word_clock_out(word_clock), .word_in(oserdes_word_out), .D_out(lemo), .locked(pll_oserdes_locked));
	always @(posedge word_clock) begin
		if (reset3) begin
			read_address <= 0;
		end else begin
			read_address <= read_address + 1'b1;
		end
	end
endmodule

module mza_test041_spi_pollable_memory_althea_top (
	input clock50_p, clock50_n,
	output lemo,
	input a_p,
	input c_n,
	input c_p,
	output d_n,
	input d_p,
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	top mytop (
		.clock50_p(clock50_p), .clock50_n(clock50_n),
		.lemo(lemo),
		.rpi_spi_mosi(d_p), .rpi_spi_miso(d_n), .rpi_spi_sclk(c_p), .rpi_spi_ce0(c_n), .rpi_spi_ce1(a_p),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

