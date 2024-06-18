// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-05-13 by mza
// based on mza-test042.spi-pollable-memories-and-oserdes-function-generator.althea.v
// last updated 2022-09-23 by mza

`define althea_revB
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
	input rpi_spi_sclk,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	input button,
	output [5:0] coax,
	output [3:0] coax_led,
	output [7:0] led
);
	reg reset1 = 1;
	reg reset2_clock125 = 1;
	reg reset3_word_clock = 1;
	wire clock50;
	IBUFGDS mybuf (.I(clock50_p), .IB(clock50_n), .O(clock50));
	wire pll_locked;
	wire rawclock125;
	wire clock125;
	BUFG mrt (.I(rawclock125), .O(clock125));
	if (0) begin
		simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE0(4), .PHASE0(0.0), .PERIOD(20.0)) kronos (.clockin(clock50), .reset(reset1), .clock0out(rawclock125), .clock1out(), .clock2out(), .clock3out(), .clock4out(), .clock5out(), .locked(pll_locked)); // 50->125
	end else begin
		simpledcm_SP #(.MULTIPLY(10), .DIVIDE(4), .ALT_CLOCKOUT_DIVIDE(2), .PERIOD(20.0)) mydcm (.clockin(clock50), .reset(reset1), .clockout(rawclock125), .clockout180(), .alt_clockout(), .locked(pll_locked)); // 50->125
	end
	// ----------------------------------------------------------------------
	wire word_clock;
	wire [7:0] oserdes_word_out;
	wire pll_oserdes_locked;
	wire clock_ram;
	wire clock_spi;
	assign clock_ram = word_clock;
	assign clock_spi = word_clock;
	reg [7:0] reset_counter = 0;
	always @(posedge clock50) begin
		if (~button) begin
			reset1 <= 1;
			reset_counter <= 0;
		end else if (reset1) begin
			if (reset_counter[7]) begin
				reset1 <= 0;
			end else begin
				reset_counter <= reset_counter + 1'b1;
			end
		end
	end
	always @(posedge clock125) begin
		if (reset2_clock125) begin
			if (pll_locked) begin
				reset2_clock125 <= 0;
			end
		end
	end
	always @(posedge word_clock) begin
		if (reset3_word_clock) begin
			if (pll_oserdes_locked) begin
				reset3_word_clock <= 0;
			end
		end
	end
	// ----------------------------------------------------------------------
	reg sync_read_address = 0;
	reg [15:0] read_address = 0;
	wire [31:0] start_read_address;
	wire [31:0] end_read_address;
	reg [15:0] last_read_address = 16'd4095;
	// ----------------------------------------------------------------------
	wire miso_ce0;
	wire miso_ce1;
	//assign rpi_spi_miso = rpi_spi_ce1 ? miso_ce0 : miso_ce1;
	assign rpi_spi_miso = rpi_spi_ce0 ? miso_ce1 : miso_ce0;
	// ----------------------------------------------------------------------
	wire [7:0] command8_ce0;
	wire [15:0] address16_ce0;
	wire [31:0] data32_ce0;
	wire [31:0] read_data32_ce0;
	wire transaction_valid_ce0;
	SPI_peripheral_command8_address16_data32 spi_ce0 (.clock(clock_spi),
		.SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(miso_ce0), .SSEL(rpi_spi_ce0),
		.transaction_valid(transaction_valid_ce0), .command8(command8_ce0), .address16(address16_ce0), .data32(data32_ce0), .data32_to_controller(read_data32_ce0));
	wire [3:0] address4_ce0 = address16_ce0[3:0];
	RAM_inferred_with_register_outputs #(.ADDR_WIDTH(4), .DATA_WIDTH(32)) myram (.reset(reset3_word_clock),
		.clock(clock_ram), .waddress_a(address4_ce0), .data_in_a(data32_ce0), .write_strobe_a(transaction_valid_ce0),
		.raddress_a(address4_ce0), .data_out_a(read_data32_ce0),
		.data_out_b_0(start_read_address), .data_out_b_1(end_read_address), .data_out_b_2(), .data_out_b_3());
	// ----------------------------------------------------------------------
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
	wire transaction_valid_ce1;
	SPI_peripheral_command8_address16_data32 spi_ce1 (.clock(clock_spi),
		.SCK(rpi_spi_sclk), .MOSI(rpi_spi_mosi), .MISO(miso_ce1), .SSEL(rpi_spi_ce1),
		.transaction_valid(transaction_valid_ce1), .command8(command8), .address16(address16), .data32(data32_3210), .data32_to_controller(read_data32_3210));
`ifdef USE_BRAM_512
	wire [8:0] address9 = address16[8:0];
	wire [10:0] read_address11 = read_address[10:0];
	RAM_s6_512_32bit_8bit mem (.reset(reset3_word_clock),
		.clock_a(clock_ram), .address_a(address9), .data_in_a(data32_0123), .write_enable_a(transaction_valid_ce1), .data_out_a(read_data32_0123),
		.clock_b(clock_ram), .address_b(read_address11), .data_out_b(oserdes_word_out));
`elsif USE_BRAM_4K
	wire [11:0] address12 = address16[11:0];
	wire [13:0] read_address14 = read_address[13:0];
	RAM_s6_4k_32bit_8bit mem (.reset(reset3_word_clock),
		.clock_a(clock_ram), .address_a(address12), .data_in_a(data32_0123), .write_enable_a(transaction_valid_ce1), .data_out_a(read_data32_0123),
		.clock_b(clock_ram), .address_b(read_address14), .data_out_b(oserdes_word_out));
`endif
	// ----------------------------------------------------------------------
	reg sync_out_raw = 0;
	reg [3:0] sync_out_stream = 0;
	always @(posedge word_clock) begin
		sync_out_raw <= 0;
		if (reset3_word_clock) begin
			read_address <= start_read_address[17:2];
			last_read_address <= end_read_address[17:2] - 1'b1;
		end else begin
			if (read_address==last_read_address || sync_read_address) begin
				read_address <= start_read_address[17:2];
				last_read_address <= end_read_address[17:2] - 1'b1;
				sync_out_raw <= 1;
			end else begin
				read_address <= read_address + 1'b1;
			end
		end
		sync_out_stream <= { sync_out_stream[2:0], sync_out_raw };
	end
	assign coax[4] = sync_out_stream[2];
	if (0) begin
		ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock), .word_in(oserdes_word_out), .D_out(coax[0]), .locked(pll_oserdes_locked));
		assign coax[1] = 0;
		assign coax[2] = 0;
		assign coax[3] = 0;
		assign coax[4] = 0;
		assign coax[5] = 0;
	end else if (0) begin
		assign coax_led = 4'b0011;
		ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock),
			.word0_in(oserdes_word_out), .D0_out(coax[0]),
			.word1_in(oserdes_word_out), .D1_out(coax[1]),
			.locked(pll_oserdes_locked));
		assign coax[2] = 0;
		assign coax[3] = 0;
		assign coax[4] = 0;
		assign coax[5] = 0;
	end else if (1) begin
		assign coax_led = 4'b1111;
		ocyrus_quad8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (
			.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock), .locked(pll_oserdes_locked),
			.word0_in(oserdes_word_out), .word1_in(oserdes_word_out), .word2_in(oserdes_word_out), .word3_in(oserdes_word_out),
			.D0_out(coax[0]), .D1_out(coax[1]), .D2_out(coax[2]), .D3_out(coax[3]));
		//assign coax[4] = 0;
		assign coax[5] = 0;
	end else if (0) begin
		// hex8 won't work because each bufpll only covers a single bank
//		ocyrus_hex8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (
//			.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock), .locked(pll_oserdes_locked),
//			.word0_in(oserdes_word_out), .word1_in(oserdes_word_out), .word2_in(oserdes_word_out), .word3_in(oserdes_word_out), .word4_in(oserdes_word_out), .word5_in(oserdes_word_out),
//			.D0_out(coax[0]), .D1_out(coax[1]), .D2_out(coax[2]), .D3_out(coax[3]), .D4_out(coax[4]), .D5_out(coax[5]));
		assign coax_led = 4'b1111;
		wire pll_oserdes_locked_1;
		wire pll_oserdes_locked_2;
		ocyrus_quad8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei4 (
			.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock), .locked(pll_oserdes_locked_1),
			.word0_in(oserdes_word_out), .word1_in(oserdes_word_out), .word2_in(oserdes_word_out), .word3_in(oserdes_word_out),
			//.D0_out(coax[0]), .D1_out(coax[1]), .D2_out(coax[2]), .D3_out(coax[3]));
			.D0_out(coax[0]), .D1_out(coax[1]), .D2_out(coax[2]), .D3_out());
		assign coax[3] = sync_out_stream[2]; // scope trigger
		ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL"), .PINTYPE1("n")) mylei2 (.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(),
			.word0_in(oserdes_word_out), .D0_out(coax[4]),
			.word1_in(oserdes_word_out), .D1_out(coax[5]),
			.locked(pll_oserdes_locked_2));
		assign pll_oserdes_locked = pll_oserdes_locked_1 && pll_oserdes_locked_2;
	end else begin
		assign pll_oserdes_locked_1 = 1;
		assign coax[0] = 0;
		assign coax[1] = 0;
		assign coax[2] = 0;
		assign coax[3] = 0;
		ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL"), .PINTYPE1("n")) mylei2 (.clock_in(clock125), .reset(reset2_clock125), .word_clock_out(word_clock),
			.word0_in(oserdes_word_out), .D0_out(coax[4]),
			.word1_in(oserdes_word_out), .D1_out(coax[5]),
			.locked(pll_oserdes_locked_2));
		assign pll_oserdes_locked = pll_oserdes_locked_1 && pll_oserdes_locked_2;
	end
	// ----------------------------------------------------------------------
	if (0) begin
		assign led = oserdes_word_out;
	end else begin
		assign led[7] = ~pll_oserdes_locked;
		assign led[6] = 0;//~pll_oserdes_locked_2;
		assign led[5] = reset1;
		assign led[4] = reset2_clock125;
		assign led[3] = reset3_word_clock;
		assign led[2] = ~rpi_spi_ce0;
		assign led[1] = ~rpi_spi_ce1;
		assign led[0] = 0;
		//assign led_2 = data32_ce0[2];
		//assign led_1 = data32_ce0[1];
		//assign led_0 = data32_ce0[0];
	end
endmodule

module mza_test043_spi_pollable_memories_and_multiple_oserdes_function_generator_outputs_althea_top (
	input clock50_p, clock50_n,
	input rpi_spi_sclk,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input button,
	output [5:0] coax,
	output [3:0] coax_led,
	output [7:0] led
);
	top mytop (
		.clock50_p(clock50_p), .clock50_n(clock50_n),
		.rpi_spi_mosi(rpi_spi_mosi), .rpi_spi_miso(rpi_spi_miso), .rpi_spi_sclk(rpi_spi_sclk), .rpi_spi_ce0(rpi_spi_ce0), .rpi_spi_ce1(rpi_spi_ce1),
		.button(button),
		.coax(coax),
		.coax_led(coax_led),
		.led(led)
	);
endmodule

