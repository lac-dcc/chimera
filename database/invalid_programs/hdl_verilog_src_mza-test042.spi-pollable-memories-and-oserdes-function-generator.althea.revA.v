// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

// written 2020-05-13 by mza
// based on mza-test041.spi-pollable-memory.althea.v
// last updated 2021-07-02 by mza

`define althea_revA
`include "lib/spi.v"
`include "lib/RAM8.v"
`include "lib/serdes_pll.v"
`include "lib/plldcm.v"
`include "lib/reset.v"
`include "lib/frequency_counter.v"
//`include "lib/axi4lite.v"
//`include "lib/generic.v"
//`include "lib/segmented_display_driver.v"
//`include "lib/synchronizer.v"

//`define USE_INFERRED_RAM_16
//`define USE_BRAM_512
`define USE_BRAM_4K

module top (
	input clock50_p, clock50_n,
	output lemo,
	output other0,
	output other1,
	input rpi_spi_sclk,
	input rpi_spi_mosi,
	output rpi_spi_miso,
	input rpi_spi_ce0,
	input rpi_spi_ce1,
	output rpi_gpio5, // ready
	input rpi_gpio6_gpclk2,
	input rpi_gpio13, // clock select
	input rpi_gpio19, // reset
	output led_0, led_1, led_2, led_3,
	output led_4, led_5, led_6, led_7
);
	localparam COUNTER_RO_PICKOFF = 23;
	wire [31:0] frequency_counter0;
	reg [31:0] frequency_counter1;
	wire global_reset = rpi_gpio19;
	wire clock_alt;
	IBUFG mybuf_alt (.I(rpi_gpio6_gpclk2), .O(clock_alt));
	wire reset1_clock_alt;
	wire pll_locked_alt;
	reset #(.FREQUENCY(10000000)) reset1 (.upstream_clock(clock_alt), .upstream_reset(global_reset), .downstream_pll_locked(pll_locked_alt), .downstream_reset(reset1_clock_alt));
	// ----------------------------------------------------------------------
	wire clock_ro_raw, clock_ro_raw_a, clock_ro_raw_b, clock_ro, clock_ro_b, clock_ro_locked;
	wire [31:0] ring_oscillator_select;
	wire [31:0] ring_oscillator_enable;
	ring_oscillator #(.number_of_bits_for_coarse_stages(4), .number_of_bits_for_medium_stages(4), .number_of_bits_for_fine_stages(4)) ro (.enable(ring_oscillator_enable[0]), .select(ring_oscillator_select[11:0]), .clock_out(clock_ro_raw));
//	BUFG mybuf_ro (.I(clock_ro_raw), .O(clock_ro_raw1));
	simpledcm_CLKGEN #(.MULTIPLY(50), .DIVIDE(50), .PERIOD(100.0)) mydcm_ro (.clockin(clock_ro_raw), .reset(global_reset || (~ring_oscillator_enable[0])), .clockout(clock_ro_raw_a), .clockout180(clock_ro_raw_b), .locked(clock_ro_locked)); // 10->10
	BUFG mybuf_roa (.I(clock_ro_raw_a), .O(clock_ro));
	BUFG mybuf_rob (.I(clock_ro_raw_b), .O(clock_ro_b));
	reg [COUNTER_RO_PICKOFF:0] counter_ro = 0;
	always @(posedge clock_ro) begin
		counter_ro <= counter_ro + 1'b1;
	end
//	assign lemo = clock_ro;
	ODDR2 ro_out (.C0(clock_ro), .C1(clock_ro_b), .CE(1'b1), .D0(1'b0), .D1(1'b1), .R(global_reset), .S(1'b0), .Q(lemo));
	// ----------------------------------------------------------------------
	wire clock50_0, clock50_1, clock50_12;
//	wire clock50_2, pll_locked_ro;
	IBUFGDS mybuf0 (.I(clock50_p), .IB(clock50_n), .O(clock50_0));
	wire clock50_raw1;
//	wire clock50_raw2;
	simpledcm_CLKGEN #(.MULTIPLY(50), .DIVIDE(10), .PERIOD(100.0)) mydcm_alt50 (.clockin(clock_alt), .reset(reset1_clock_alt), .clockout(clock50_raw1), .clockout180(), .locked(pll_locked_alt)); // 10->50
//	simpledcm_CLKGEN #(.MULTIPLY(50), .DIVIDE(10), .PERIOD(100.0)) mydcm_ro50 (.clockin(clock_ro), .reset(global_reset), .clockout(clock50_raw2), .clockout180(), .locked(pll_locked_ro)); // 10->50
	BUFG mybuf1 (.I(clock50_raw1), .O(clock50_1));
//	BUFG mybuf2 (.I(clock50_raw2), .O(clock50_2));
	//BUFGMUX sam12 (.I0(clock50_1), .I1(clock50_2), .S(ring_oscillator_enable[0]), .O(clock50_12));
//	BUFGMUX sam12 (.I0(clock50_1), .I1(clock50_2), .S(1'b1), .O(clock50_12));
	assign clock50_12 = clock50_1;
	wire clock_select = rpi_gpio13;
	wire clock50;
	BUFGMUX sam0s (.I0(clock50_0), .I1(clock50_12), .S(clock_select), .O(clock50));
	wire reset2_clock50;
	wire pll_locked;
	reset #(.FREQUENCY(50000000)) reset2 (.upstream_clock(clock50), .upstream_reset(global_reset||reset1_clock_alt), .downstream_pll_locked(pll_locked), .downstream_reset(reset2_clock50));
	// ----------------------------------------------------------------------
	wire rawclock125;
	wire clock125;
	BUFG mrt (.I(rawclock125), .O(clock125));
	if (0) begin
		simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(10), .DIVIDE0(4), .PHASE0(0.0), .PERIOD(20.0)) kronos (.clockin(clock50), .reset(reset2_clock50), .clock0out(rawclock125), .clock1out(), .clock2out(), .clock3out(), .clock4out(), .clock5out(), .locked(pll_locked)); // 50->125
	end else if (0) begin
		simpledcm_SP #(.MULTIPLY(10), .DIVIDE(4), .ALT_CLOCKOUT_DIVIDE(2), .PERIOD(20.0)) mydcm (.clockin(clock50), .reset(reset2_clock50), .clockout(rawclock125), .clockout180(), .alt_clockout(), .locked(pll_locked)); // 50->125
	end else begin
		simpledcm_CLKGEN #(.MULTIPLY(10), .DIVIDE(4), .PERIOD(20.0)) mydcm_125 (.clockin(clock50), .reset(reset2_clock50), .clockout(rawclock125), .clockout180(), .locked(pll_locked)); // 50->125
	end
	// ----------------------------------------------------------------------
	wire reset3_clock125;
	wire pll_oserdes_locked;
	reset #(.FREQUENCY(125000000)) reset3 (.upstream_clock(clock125), .upstream_reset(global_reset||reset2_clock50), .downstream_pll_locked(pll_oserdes_locked), .downstream_reset(reset3_clock125));
	wire word_clock;
	wire clock_spi;
	assign clock_spi = word_clock;
	wire reset4_word_clock;
	reset #(.FREQUENCY(125000000)) reset4 (.upstream_clock(word_clock), .upstream_reset(global_reset||reset3_clock125), .downstream_pll_locked(pll_oserdes_locked), .downstream_reset(reset4_word_clock));
	// ----------------------------------------------------------------------
	reg sync_read_address = 0;
	reg [15:0] read_address = 0;
	wire [31:0] start_read_address;
	wire [31:0] end_read_address;
	reg [15:0] last_read_address = 16'd4095;
	// ----------------------------------------------------------------------
//	wire [31:0] idelay_up_amount;
//	wire [31:0] idelay_down_amount;
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
	RAM_inferred_with_register_outputs_and_inputs #(.addr_width(4), .data_width(32)) myram (.reset(reset4_word_clock),
		.wclk(clock_spi), .waddr(address4_ce0), .din(data32_ce0), .write_en(transaction_valid_ce0),
		.rclk(word_clock), .raddr(address4_ce0), .dout(read_data32_ce0),
		.register0(start_read_address), .register1(end_read_address), .register2(ring_oscillator_enable), .register3(ring_oscillator_select),
		.registerC(32'd0), .registerD(32'd0), .registerE(32'd0), .registerF(frequency_counter1));
	always @(posedge word_clock) begin
		frequency_counter1 <= frequency_counter0;
	end
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
	wire [7:0] oserdes_word_out;
`ifdef USE_BRAM_512
	wire [8:0] address9 = address16[8:0];
	wire [10:0] read_address11 = read_address[10:0];
	RAM_s6_512_32bit_8bit mem (.reset(reset4_word_clock),
		.clock_a(clock_spi), .address_a(address9), .data_in_a(data32_0123), .write_enable_a(transaction_valid_ce1), .data_out_a(read_data32_0123),
		.clock_b(word_clock), .address_b(read_address11), .data_out_b(oserdes_word_out));
`elsif USE_BRAM_4K
	wire [11:0] address12 = address16[11:0];
	wire [13:0] read_address14 = read_address[13:0];
	RAM_s6_4k_32bit_8bit mem (.reset(reset4_word_clock),
		.clock_a(clock_spi), .address_a(address12), .data_in_a(data32_0123), .write_enable_a(transaction_valid_ce1), .data_out_a(read_data32_0123),
		.clock_b(word_clock), .address_b(read_address14), .data_out_b(oserdes_word_out));
`endif
	// ----------------------------------------------------------------------
	reg sync_out_raw = 0;
	reg [3:0] sync_out_stream = 0;
	always @(posedge word_clock) begin
		sync_out_raw <= 0;
		if (reset4_word_clock) begin
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
	// ----------------------------------------------------------------------
	wire bit_clock;
	wire bit_strobe;
	wire other1_raw;
	if (0) begin
		ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei (.clock_in(clock125), .reset(reset3_clock125), .word_clock_out(word_clock), .word_in(oserdes_word_out), .D_out(lemo), .locked(pll_oserdes_locked));
		assign other0 = 0;
		assign other1 = sync_out_stream[2];
	end else if (0) begin
		wire pll_oserdes_locked_1;
		wire pll_oserdes_locked_2;
		ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei0 (.clock_in(clock125), .reset(reset3_clock125), .word_clock_out(word_clock), .word_in(oserdes_word_out), .D_out(lemo), .locked(pll_oserdes_locked_1));
		wire word_clock_1;
		reg [7:0] oserdes_word_out_1 = 0;
		reg [7:0] oserdes_word_out_2 = 0;
		ocyrus_single8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei1 (.clock_in(clock125), .reset(reset3_clock125), .word_clock_out(word_clock_1), .word_in(oserdes_word_out_2), .D_out(other0), .locked(pll_oserdes_locked_2));
		always @(posedge word_clock_1) begin
			oserdes_word_out_1 <= oserdes_word_out;
			oserdes_word_out_2 <= oserdes_word_out_1;
		end
		assign other1 = sync_out_stream[2];
		assign pll_oserdes_locked = pll_oserdes_locked_1 && pll_oserdes_locked_2;
	end else begin
		ocyrus_double8 #(.BIT_DEPTH(8), .PERIOD(8.0), .DIVIDE(1), .MULTIPLY(8), .SCOPE("BUFPLL")) mylei2 (.clock_in(clock125), .reset(reset3_clock125), .word_clock_out(word_clock), .word0_in(oserdes_word_out), .word1_in(oserdes_word_out), .D0_out(other0), .D1_out(other1_raw), .locked(pll_oserdes_locked), .bit_clock(bit_clock), .bit_strobe(bit_strobe));
//		assign lemo = sync_out_stream[2];
	end
	// ----------------------------------------------------------------------
//	reg [31:0] idelay_counter = 0;
//	reg inc_not_dec = 0;
//	reg strobe = 0;
//	reg [2:0] cnt = 0 ;
//	always @(posedge word_clock) begin
//		strobe <= 0;
//		if (reset4_word_clock) begin
//			idelay_counter <= 0;
//		end else begin
//			if (idelay_counter==32'h12345678) begin
//				inc_not_dec <= 1;
//				if (0!=idelay_up_amount) begin
//					strobe <= 1;
//					cnt <= cnt + 1'b1;
//				//idelay_counter <= idelay_up_amount;
//					end
//			end else if (idelay_counter==32'h56781234) begin
//				inc_not_dec <= 0;
//				if (0!=idelay_down_amount) begin
//					strobe <= 1;
//					end
//				//idelay_counter <= idelay_down_amount;
//			end
//			idelay_counter <= idelay_counter + 1'b1;
//		end
//	end
//	idelay nirvana (.clock(word_clock), .reset(reset4_word_clock), .inc_not_dec(inc_not_dec), .strobe(strobe), .bit_clock(bit_clock), .bit_in(), .bit_out(), .initiate_cal(1'b0), .busy());
	// ----------------------------------------------------------------------
	if (0) begin
		odelay_fixed #(.AMOUNT(0)) twoturntables (.bit_in(other1_raw), .bit_out(other1)); // 1264 ps
	end else if (0) begin
		odelay_fixed #(.AMOUNT(255)) andamicrophone (.bit_in(other1_raw), .bit_out(other1)); // 3303 ps
	end else begin
		assign other1 = other1_raw; // 330 ps
	end
	// ----------------------------------------------------------------------
	wire not_ready = global_reset || reset1_clock_alt || reset2_clock50 || reset3_clock125 || reset4_word_clock;
	assign rpi_gpio5 = ~not_ready;
	if (0) begin
		wire [7:0] leds;
		assign { led_7, led_6, led_5, led_4, led_3, led_2, led_1, led_0 } = leds;
		assign leds = oserdes_word_out;
	end else begin
		assign led_7 = reset1_clock_alt;
		assign led_6 = reset2_clock50;
		assign led_5 = reset3_clock125;
		assign led_4 = reset4_word_clock;
		assign led_3 = ~clock_ro_locked;
		assign led_2 = counter_ro[COUNTER_RO_PICKOFF];
		assign led_1 = ~rpi_spi_ce0 || ~rpi_spi_ce1;
		assign led_0 = not_ready;
	end
	localparam N = 10; // N for N_Hz calculations
	wire fc_valid;
	frequency_counter #(.FREQUENCY_OF_REFERENCE_CLOCK(125000000), .LOG2_OF_DIVIDE_RATIO(24), .N(N)) fc (.reference_clock(word_clock), .unknown_clock(clock_ro), .frequency_of_unknown_clock(frequency_counter0), .valid(fc_valid));
endmodule

//module mza_test042_spi_pollable_memories_and_oserdes_function_generator_althea_top (
module myalthea (
	input clock50_p, clock50_n,
	output lemo, // oserdes/trig output
	input b_n, // rpi_spi_mosi
	output b_p, // oserdes/trig output other0
	output a_n, // rpi_spi_miso
	input a_p, // rpi_spi_cs1
	input c_n, // rpi_spi_cs0
	input c_p, // rpi_spi_sclk
	output d_n, // rpi_gpio5
	input d_p, // rpi_gpio6_gpclk2
	input e_n, // rpi_gpio13
	input e_p, // rpi_gpio19
	output f_p, // oserdes/trig output other1
	output led_0, led_1, led_2, led_3, led_4, led_5, led_6, led_7
);
	top althea (
		.clock50_p(clock50_p), .clock50_n(clock50_n),
		.lemo(lemo),
		.other0(b_p),
		.other1(f_p),
		.rpi_spi_mosi(b_n), .rpi_spi_miso(a_n), .rpi_spi_sclk(c_p), .rpi_spi_ce0(c_n), .rpi_spi_ce1(a_p),
		.rpi_gpio5(d_n), .rpi_gpio6_gpclk2(d_p), .rpi_gpio13(e_n), .rpi_gpio19(e_p),
		.led_0(led_0), .led_1(led_1), .led_2(led_2), .led_3(led_3),
		.led_4(led_4), .led_5(led_5), .led_6(led_6), .led_7(led_7)
	);
endmodule

