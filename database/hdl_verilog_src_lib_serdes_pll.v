// This program was cloned from: https://github.com/mzandrew/hdl
// License: GNU General Public License v3.0

`timescale 1ns / 1ps
// written 2018-09-17 by mza
// last updated 2024-03-14 by mza

// the following message:
//Place:1073 - Placer was unable to create RPM[OLOGIC_SHIFT_RPMS] for the
//   component mytop/mylei/mylei0/osirus_m*****_D of type OLOGIC for the following
//   reason.
//   The reason for this issue:
//   Some of the logic associated with this structure is locked. This should cause
//   the rest of the logic to be locked.A problem was found at site OLOGIC_X11Y2
//   where we must place OLOGIC mytop/mylei/mylei0/osirus_secondary_D in order to
//   satisfy the relative placement requirements of this logic.  OLOGIC
//   mytop/mylei/mylei1/osirus_primary_D appears to already be placed there which
//   makes this design unplaceable.  The following components are part of this
//   structure:
//      OLOGIC   mytop/mylei/mylei0/osirus_primary_D
//      OLOGIC   mytop/mylei/mylei0/osirus_secondary_D
// means that you have an p/n (primary/secondary) output connected to a oserdes n/p (secondary/primary) primitive, so change it to an oserdes p/n (primary/secondary) primitive, like so:
// either set .PINTYPE("n") or .PINTYPE("p") as appropriate

module iserdes_single4 #(
	parameter WIDTH = 4
) (
	input sample_clock,
	input data_in,
	input reset,
	output word_clock,
	output [WIDTH-1:0] word_out
);
	wire fast_clock;
	wire ioce;
	wire raw_word_clock;
	BUFIO2 #(.DIVIDE(WIDTH), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")) buffy (.I(sample_clock), .DIVCLK(raw_word_clock), .IOCLK(fast_clock), .SERDESSTROBE(ioce));
	BUFG fabbuf (.I(raw_word_clock), .O(word_clock));
	ISERDES2 #(
		.BITSLIP_ENABLE("FALSE"), // Enable Bitslip Functionality (TRUE/FALSE)
		.DATA_RATE("SDR"), // Data-rate ("SDR" or "DDR")
		.DATA_WIDTH(WIDTH), // Parallel data width selection (2-8)
		.INTERFACE_TYPE("RETIMED"),// "NETWORKING", "NETWORKING_PIPELINED" or "RETIMED"
		.SERDES_MODE("NONE") // "NONE", "M*****" or "S****"
	) ISERDES2_inst (
		.CFB0(), // 1-bit output: Clock feed-through route output
		.CFB1(), // 1-bit output: Clock feed-through route output
		.DFB(), // 1-bit output: Feed-through clock output
		.FABRICOUT(), // 1-bit output: Unsynchrnonized data output
		.INCDEC(), // 1-bit output: Phase detector output
		// Q1 - Q4: 1-bit (each) output: Registered outputs to FPGA logic
		.Q4(word_out[3]), // see ug381 page 80
		.Q3(word_out[2]),
		.Q2(word_out[1]),
		.Q1(word_out[0]),
		.SHIFTOUT(), // 1-bit output: Cascade output signal for primary/secondary I/O
		.VALID(), // 1-bit output: Output status of the phase detector
		.BITSLIP(1'b0), // 1-bit input: Bitslip enable input
		.CE0(1'b1), // 1-bit input: Clock enable input
		.CLK0(fast_clock), // 1-bit input: I/O clock network input
		.CLK1(1'b0), // 1-bit input: Secondary I/O clock network input
		.CLKDIV(word_clock), // 1-bit input: FPGA logic domain clock input
		.D(data_in), // 1-bit input: Input data
		.IOCE(ioce), // 1-bit input: Data strobe input
		.RST(reset), // 1-bit input: Asynchronous reset input
		.SHIFTIN(1'b0) // 1-bit input: Cascade input signal for primary/secondary I/O
	);
//	wire pll_is_locked;
//	wire buffered_pll_is_locked_and_strobe_is_aligned;
//	BUFPLL #(
//		.DIVIDE(WIDTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
//		) rx_bufpll_inst (
//		.PLLIN(sample_clock), // PLL Clock input
//		.GCLK(raw_fabric_clock), // Global Clock input
//		.LOCKED(pll_is_locked), // Clock0 locked input
//		.IOCLK(fast_clock), // Output PLL Clock
//		.LOCK(buffered_pll_is_locked_and_strobe_is_aligned), // BUFPLL Clock and strobe locked
//		.SERDESSTROBE(ioce) // Output SERDES strobe
//		);
endmodule

module iserdes_single8_inner #(
	parameter BIT_RATIO = 8,
	parameter PINTYPE = "p"
) (
	//input sample_clock_in,
	//input pll_is_locked,
	input reset,
	input bit_clock,
	input bit_strobe,
	input word_clock,
	input data_in,
	output [BIT_RATIO-1:0] word_out
);
//	wire bit_clock;
//	wire ioce;
//	wire raw_word_clock;
	//BUFIO2 #(.DIVIDE(BIT_RATIO), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")) buffy (.I(sample_clock), .DIVCLK(raw_word_clock), .IOCLK(bit_clock), .SERDESSTROBE(ioce));
//	wire buffered_pll_is_locked_and_strobe_is_aligned;
//	BUFPLL #(
//		.DIVIDE(BIT_RATIO) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
//	) rx_bufpll_inst (
//		.PLLIN(sample_clock), // PLL Clock input
//		.GCLK(raw_word_clock), // Global Clock input
//		.LOCKED(pll_is_locked), // Clock0 locked input
//		.IOCLK(bit_clock), // Output PLL Clock
//		.LOCK(buffered_pll_is_locked_and_strobe_is_aligned), // BUFPLL Clock and strobe locked
//		.SERDESSTROBE(ioce) // Output SERDES strobe
//	);
//	BUFG fabbuf (.I(raw_word_clock), .O(word_clock));
	wire cascade;
	// want first bit in to be the MSB of output word (Q1 contains first bit; secondary iserdes outputs first nybble)
	if (PINTYPE=="p") begin
		ISERDES2 #(
			.BITSLIP_ENABLE("FALSE"), // Enable Bitslip Functionality (TRUE/FALSE)
			.DATA_RATE("SDR"), // Data-rate ("SDR" or "DDR")
			.DATA_WIDTH(BIT_RATIO), // Parallel data width selection (2-8)
			.INTERFACE_TYPE("RETIMED"),// "NETWORKING", "NETWORKING_PIPELINED" or "RETIMED"
			.SERDES_MODE("MASTER") // "NONE", "M*****" or "S****"
		) ISERDES2_inst_0 (
			.CFB0(), // 1-bit output: Clock feed-through route output
			.CFB1(), // 1-bit output: Clock feed-through route output
			.DFB(), // 1-bit output: Feed-through clock output
			.FABRICOUT(), // 1-bit output: Unsynchrnonized data output
			.INCDEC(), // 1-bit output: Phase detector output
			// Q1 - Q4: 1-bit (each) output: Registered outputs to FPGA logic
			.Q4(word_out[0]), // see ug381 page 80
			.Q3(word_out[1]),
			.Q2(word_out[2]),
			.Q1(word_out[3]),
			.SHIFTOUT(cascade), // 1-bit output: Cascade output signal for primary/secondary I/O
			.VALID(), // 1-bit output: Output status of the phase detector
			.BITSLIP(1'b0), // 1-bit input: Bitslip enable input
			.CE0(1'b1), // 1-bit input: Clock enable input
			.CLK0(bit_clock), // 1-bit input: I/O clock network input
			.CLK1(1'b0), // 1-bit input: Secondary I/O clock network input
			.CLKDIV(word_clock), // 1-bit input: FPGA logic domain clock input
			.D(data_in), // 1-bit input: Input data
			.IOCE(bit_strobe), // 1-bit input: Data strobe input
			.RST(reset), // 1-bit input: Asynchronous reset input
			.SHIFTIN(1'b0) // 1-bit input: Cascade input signal for primary/secondary I/O
		);
		ISERDES2 #(
			.BITSLIP_ENABLE("FALSE"), // Enable Bitslip Functionality (TRUE/FALSE)
			.DATA_RATE("SDR"), // Data-rate ("SDR" or "DDR")
			.DATA_WIDTH(BIT_RATIO), // Parallel data width selection (2-8)
			.INTERFACE_TYPE("RETIMED"),// "NETWORKING", "NETWORKING_PIPELINED" or "RETIMED"
			.SERDES_MODE("SLAVE") // "NONE", "M*****" or "S****"
		) ISERDES2_inst_1 (
			.CFB0(), // 1-bit output: Clock feed-through route output
			.CFB1(), // 1-bit output: Clock feed-through route output
			.DFB(), // 1-bit output: Feed-through clock output
			.FABRICOUT(), // 1-bit output: Unsynchrnonized data output
			.INCDEC(), // 1-bit output: Phase detector output
			// Q1 - Q4: 1-bit (each) output: Registered outputs to FPGA logic
			.Q4(word_out[4]), // see ug381 page 80
			.Q3(word_out[5]),
			.Q2(word_out[6]),
			.Q1(word_out[7]),
			.SHIFTOUT(), // 1-bit output: Cascade output signal for primary/secondary I/O
			.VALID(), // 1-bit output: Output status of the phase detector
			.BITSLIP(1'b0), // 1-bit input: Bitslip enable input
			.CE0(1'b1), // 1-bit input: Clock enable input
			.CLK0(bit_clock), // 1-bit input: I/O clock network input
			.CLK1(1'b0), // 1-bit input: Secondary I/O clock network input
			.CLKDIV(word_clock), // 1-bit input: FPGA logic domain clock input
			.D(data_in), // 1-bit input: Input data
			.IOCE(bit_strobe), // 1-bit input: Data strobe input
			.RST(reset), // 1-bit input: Asynchronous reset input
			.SHIFTIN(cascade) // 1-bit input: Cascade input signal for primary/secondary I/O
		);
	end else begin // not sure what needs to change here (if anything) for the "n" type...
		ISERDES2 #(
			.BITSLIP_ENABLE("FALSE"), // Enable Bitslip Functionality (TRUE/FALSE)
			.DATA_RATE("SDR"), // Data-rate ("SDR" or "DDR")
			.DATA_WIDTH(BIT_RATIO), // Parallel data width selection (2-8)
			.INTERFACE_TYPE("RETIMED"),// "NETWORKING", "NETWORKING_PIPELINED" or "RETIMED"
			.SERDES_MODE("MASTER") // "NONE", "M*****" or "S****"
		) ISERDES2_inst_0 (
			.CFB0(), // 1-bit output: Clock feed-through route output
			.CFB1(), // 1-bit output: Clock feed-through route output
			.DFB(), // 1-bit output: Feed-through clock output
			.FABRICOUT(), // 1-bit output: Unsynchrnonized data output
			.INCDEC(), // 1-bit output: Phase detector output
			// Q1 - Q4: 1-bit (each) output: Registered outputs to FPGA logic
			.Q4(word_out[0]), // see ug381 page 80
			.Q3(word_out[1]),
			.Q2(word_out[2]),
			.Q1(word_out[3]),
			.SHIFTOUT(cascade), // 1-bit output: Cascade output signal for primary/secondary I/O
			.VALID(), // 1-bit output: Output status of the phase detector
			.BITSLIP(1'b0), // 1-bit input: Bitslip enable input
			.CE0(1'b1), // 1-bit input: Clock enable input
			.CLK0(bit_clock), // 1-bit input: I/O clock network input
			.CLK1(1'b0), // 1-bit input: Secondary I/O clock network input
			.CLKDIV(word_clock), // 1-bit input: FPGA logic domain clock input
			.D(data_in), // 1-bit input: Input data
			.IOCE(bit_strobe), // 1-bit input: Data strobe input
			.RST(reset), // 1-bit input: Asynchronous reset input
			.SHIFTIN(1'b0) // 1-bit input: Cascade input signal for primary/secondary I/O
		);
		ISERDES2 #(
			.BITSLIP_ENABLE("FALSE"), // Enable Bitslip Functionality (TRUE/FALSE)
			.DATA_RATE("SDR"), // Data-rate ("SDR" or "DDR")
			.DATA_WIDTH(BIT_RATIO), // Parallel data width selection (2-8)
			.INTERFACE_TYPE("RETIMED"),// "NETWORKING", "NETWORKING_PIPELINED" or "RETIMED"
			.SERDES_MODE("SLAVE") // "NONE", "M*****" or "S****"
		) ISERDES2_inst_1 (
			.CFB0(), // 1-bit output: Clock feed-through route output
			.CFB1(), // 1-bit output: Clock feed-through route output
			.DFB(), // 1-bit output: Feed-through clock output
			.FABRICOUT(), // 1-bit output: Unsynchrnonized data output
			.INCDEC(), // 1-bit output: Phase detector output
			// Q1 - Q4: 1-bit (each) output: Registered outputs to FPGA logic
			.Q4(word_out[4]), // see ug381 page 80
			.Q3(word_out[5]),
			.Q2(word_out[6]),
			.Q1(word_out[7]),
			.SHIFTOUT(), // 1-bit output: Cascade output signal for primary/secondary I/O
			.VALID(), // 1-bit output: Output status of the phase detector
			.BITSLIP(1'b0), // 1-bit input: Bitslip enable input
			.CE0(1'b1), // 1-bit input: Clock enable input
			.CLK0(bit_clock), // 1-bit input: I/O clock network input
			.CLK1(1'b0), // 1-bit input: Secondary I/O clock network input
			.CLKDIV(word_clock), // 1-bit input: FPGA logic domain clock input
			.D(data_in), // 1-bit input: Input data
			.IOCE(bit_strobe), // 1-bit input: Data strobe input
			.RST(reset), // 1-bit input: Asynchronous reset input
			.SHIFTIN(cascade) // 1-bit input: Cascade input signal for primary/secondary I/O
		);
	end
endmodule

module iserdes_single8 #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE = "p",
	parameter PHASE = 0.0,
	parameter PERIOD = 20.0,
	parameter DIVIDE = 2,
	parameter MULTIPLY = 40,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in,
	input reset,
	input data_in,
	output word_clock_out,
	output [BIT_DEPTH-1:0] word_out,
	output locked
);
	wire bit_clock;
	wire bit_strobe;
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE)) is8i (.bit_clock(bit_clock), .bit_strobe(bit_strobe), .word_clock(word_clock_out), .reset(reset), .data_in(data_in), .word_out(word_out));
	oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE), .CLK_FEEDBACK(CLK_FEEDBACK), .PHASE(PHASE)) difficult_pll (
		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	);
endmodule

module iserdes_dodecahedron_input #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter SPLIT_BANKS = 0, // note: SCOPE is effectively global when SPLIT_BANKS is 1
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PERIOD = 10.0, // 100 MHz
	parameter MULTIPLY = 8, // 800 MHz
	parameter DIVIDE = 2, // 400 MHz
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	output word_clock_out,
	input reset,
	output [BIT_DEPTH-1:0] word_out_1, word_out_2, word_out_3, word_out_4, word_out_5, word_out_6, word_out_7, word_out_8, word_out_9, word_out_10, word_out_11, word_out_12,
	input [12:1] bit_in,
	output locked
);
	wire bit_clockA, bit_clockB;
	wire bit_strobeA, bit_strobeB;
	wire word_clockA, word_clockB;
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[1]),  .word_out(word_out_1));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[2]),  .word_out(word_out_2));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[3]),  .word_out(word_out_3));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[4]),  .word_out(word_out_4));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[5]),  .word_out(word_out_5));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6  (.word_clock(word_clockA), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset), .data_in(bit_in[6]),  .word_out(word_out_6));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7  (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[7]),  .word_out(word_out_7));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8  (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[8]),  .word_out(word_out_8));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9  (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[9]),  .word_out(word_out_9));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10 (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[10]), .word_out(word_out_10));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11 (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[11]), .word_out(word_out_11));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12 (.word_clock(word_clockB), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset), .data_in(bit_in[12]), .word_out(word_out_12));
	if (SPLIT_BANKS) begin
		wire clock_1x, clock_nx;
		wire pll_is_locked;
		simpll #(
			.BIT_DEPTH(BIT_DEPTH),
			.CLKIN_PERIOD(PERIOD),
			.PHASE(0.0),
			.PHASE2345(0.0),
			.PLLD(DIVIDE),
			.PLLX(MULTIPLY),
			.EXTRA_DIVIDE(EXTRA_DIVIDE)
//			.CLK_FEEDBACK("CLKFBOUT")
		) siphon (
			.clock_in(clock_in),
			.reset(reset),
//			.clock_nx_fb(bit_clockA),
			.pll_is_locked(pll_is_locked),
			.clock_1x(clock_1x),
			.clock_1x_1(),
			.clock_1x_2(),
			.clock_1x_3(),
			.clock_1x_4(),
			.clock_nx(clock_nx)
		);
		BUFG bufg_txA (.I(clock_1x), .O(word_clockA));
		BUFG bufg_txB (.I(clock_1x), .O(word_clockB));
		wire strobe_is_alignedA, strobe_is_alignedB;
		BUFPLL #(
			.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
			.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
		) tx_bufpll_inst_A (
			.PLLIN(clock_nx), // PLL Clock input
			.GCLK(word_clockA), // Global Clock input
			.LOCKED(pll_is_locked), // Clock0 locked input
			.IOCLK(bit_clockA), // Output PLL Clock
			.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
			.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
		);
		BUFPLL #(
			.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
			.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
		) tx_bufpll_inst_B (
			.PLLIN(clock_nx), // PLL Clock input
			.GCLK(word_clockB), // Global Clock input
			.LOCKED(pll_is_locked), // Clock0 locked input
			.IOCLK(bit_clockB), // Output PLL Clock
			.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
			.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
		);
		assign word_clock_out = word_clockA;
		assign locked = pll_is_locked && strobe_is_alignedA && strobe_is_alignedB;
	end else begin
		wire bit_strobe;
		assign bit_strobeA = bit_strobe;
		assign bit_strobeB = bit_strobe;
		assign word_clockA = word_clock_out;
		assign word_clockB = word_clock_out;
		wire bit_clock;
		assign bit_clockA = bit_clock;
		assign bit_clockB = bit_clock;
		oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE)) difficult_pll_TR (
			.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
			.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
		);
	end
endmodule

module iserdes_icositetrahedron_input #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PERIOD = 10.0, // 100 MHz
	parameter MULTIPLY = 8, // 800 MHz
	parameter DIVIDE = 2, // 400 MHz
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	output word_clock_out,
	input reset,
	output [BIT_DEPTH-1:0] word_out_1a, word_out_2a, word_out_3a, word_out_4a, word_out_5a, word_out_6a, word_out_7a, word_out_8a, word_out_9a, word_out_10a, word_out_11a, word_out_12a,
	                       word_out_1b, word_out_2b, word_out_3b, word_out_4b, word_out_5b, word_out_6b, word_out_7b, word_out_8b, word_out_9b, word_out_10b, word_out_11b, word_out_12b,
	input [12:1] bit_in_a, bit_in_b,
	output locked
);
	wire bit_clock;
	wire bit_strobe;
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[1]),  .word_out(word_out_1a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[2]),  .word_out(word_out_2a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[3]),  .word_out(word_out_3a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[4]),  .word_out(word_out_4a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[5]),  .word_out(word_out_5a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[6]),  .word_out(word_out_6a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[7]),  .word_out(word_out_7a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[8]),  .word_out(word_out_8a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9a  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[9]),  .word_out(word_out_9a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10a (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[10]), .word_out(word_out_10a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11a (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[11]), .word_out(word_out_11a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12a (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_a[12]), .word_out(word_out_12a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[1]),  .word_out(word_out_1b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[2]),  .word_out(word_out_2b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[3]),  .word_out(word_out_3b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[4]),  .word_out(word_out_4b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[5]),  .word_out(word_out_5b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[6]),  .word_out(word_out_6b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[7]),  .word_out(word_out_7b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[8]),  .word_out(word_out_8b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9b  (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[9]),  .word_out(word_out_9b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10b (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[10]), .word_out(word_out_10b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11b (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[11]), .word_out(word_out_11b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12b (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .data_in(bit_in_b[12]), .word_out(word_out_12b));
//	if (SCOPE=="GLOBAL") begin
		oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE), .EXTRA_DIVIDE(EXTRA_DIVIDE)) difficult_pll_TR (
			.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
			.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
		);
//	end else begin
//	end
endmodule

module iserdes_tetracontaoctagon_input #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_DEPTH = 8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
//	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PERIOD = 10.0, // 100 MHz
	parameter MULTIPLY = 8, // 800 MHz
	parameter DIVIDE = 2, // 400 MHz
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	output word_clock_out,
	input reset,
	output [BIT_DEPTH-1:0] word_out_1a, word_out_2a, word_out_3a, word_out_4a, word_out_5a, word_out_6a, word_out_7a, word_out_8a, word_out_9a, word_out_10a, word_out_11a, word_out_12a,
	                       word_out_1b, word_out_2b, word_out_3b, word_out_4b, word_out_5b, word_out_6b, word_out_7b, word_out_8b, word_out_9b, word_out_10b, word_out_11b, word_out_12b,
	                       word_out_1c, word_out_2c, word_out_3c, word_out_4c, word_out_5c, word_out_6c, word_out_7c, word_out_8c, word_out_9c, word_out_10c, word_out_11c, word_out_12c,
	                       word_out_1d, word_out_2d, word_out_3d, word_out_4d, word_out_5d, word_out_6d, word_out_7d, word_out_8d, word_out_9d, word_out_10d, word_out_11d, word_out_12d,
	input [12:1] bit_in_a, bit_in_b, bit_in_c, bit_in_d,
	output locked
);
	wire bit_clockAB, bit_clockCD;
	wire bit_strobeAB, bit_strobeCD;
	wire word_clockAB, word_clockCD;
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[1]),  .word_out(word_out_1a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[2]),  .word_out(word_out_2a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[3]),  .word_out(word_out_3a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[4]),  .word_out(word_out_4a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[5]),  .word_out(word_out_5a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[6]),  .word_out(word_out_6a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[7]),  .word_out(word_out_7a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[8]),  .word_out(word_out_8a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9a  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[9]),  .word_out(word_out_9a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10a (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[10]), .word_out(word_out_10a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11a (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[11]), .word_out(word_out_11a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12a (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_a[12]), .word_out(word_out_12a));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[1]),  .word_out(word_out_1b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[2]),  .word_out(word_out_2b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[3]),  .word_out(word_out_3b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[4]),  .word_out(word_out_4b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[5]),  .word_out(word_out_5b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[6]),  .word_out(word_out_6b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[7]),  .word_out(word_out_7b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[8]),  .word_out(word_out_8b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9b  (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[9]),  .word_out(word_out_9b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10b (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[10]), .word_out(word_out_10b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11b (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[11]), .word_out(word_out_11b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12b (.word_clock(word_clockAB), .bit_clock(bit_clockAB), .bit_strobe(bit_strobeAB), .reset(reset), .data_in(bit_in_b[12]), .word_out(word_out_12b));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[1]),  .word_out(word_out_1c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[2]),  .word_out(word_out_2c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[3]),  .word_out(word_out_3c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[4]),  .word_out(word_out_4c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[5]),  .word_out(word_out_5c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[6]),  .word_out(word_out_6c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[7]),  .word_out(word_out_7c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[8]),  .word_out(word_out_8c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9c  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[9]),  .word_out(word_out_9c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10c (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[10]), .word_out(word_out_10c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11c (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[11]), .word_out(word_out_11c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12c (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_c[12]), .word_out(word_out_12c));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_1d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[1]),  .word_out(word_out_1d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_2d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[2]),  .word_out(word_out_2d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_3d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[3]),  .word_out(word_out_3d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_4d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[4]),  .word_out(word_out_4d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_5d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[5]),  .word_out(word_out_5d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_6d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[6]),  .word_out(word_out_6d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_7d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[7]),  .word_out(word_out_7d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_8d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[8]),  .word_out(word_out_8d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_9d  (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[9]),  .word_out(word_out_9d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_10d (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[10]), .word_out(word_out_10d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_11d (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[11]), .word_out(word_out_11d));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH)) is8i_12d (.word_clock(word_clockCD), .bit_clock(bit_clockCD), .bit_strobe(bit_strobeCD), .reset(reset), .data_in(bit_in_d[12]), .word_out(word_out_12d));
	wire clock_1x, clock_nx;
	wire pll_is_locked;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x),
		.clock_1x_1(),
		.clock_1x_2(),
		.clock_1x_3(),
		.clock_1x_4(),
		.clock_nx(clock_nx)
	);
	BUFG bufg_txAB (.I(clock_1x), .O(word_clockAB));
	BUFG bufg_txCD (.I(clock_1x), .O(word_clockCD));
	wire strobe_is_alignedAB, strobe_is_alignedCD;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_AB (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockAB), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockAB), // Output PLL Clock
		.LOCK(strobe_is_alignedAB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeAB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_CD (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockCD), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockCD), // Output PLL Clock
		.LOCK(strobe_is_alignedCD), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeCD) // Output SERDES strobe
	);
	assign word_clock_out = word_clockAB;
	assign locked = pll_is_locked && strobe_is_alignedAB && strobe_is_alignedCD;
endmodule

//	ocyrus_single8_inner #(.BIT_RATIO(8)) mylei (.word_clock(), .bit_clock(), .bit_strobe(), .reset(), .word_in(), .bit_out());
module ocyrus_single8_inner #(
	parameter PINTYPE = "p", // "p" (primary) or "n" (secondary)
	parameter BIT_RATIO=8 // how many fast_clock cycles per word_clock
) (
	input word_clock,
	input bit_clock,
	input bit_strobe,
	input reset,
	input [BIT_RATIO-1:0] word_in,
	output bit_out
);
	wire cascade_do2, cascade_to2, cascade_di2, cascade_ti2;
	// with some help from https://vjordan.info/log/fpga/high-speed-serial-bus-generation-using-spartan-6.html and/or XAPP1064 source code
	// want MSB of word to come out first (D1 comes out first; secondary oserdes goes first)
	if (PINTYPE=="p") begin
		OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(BIT_RATIO),
		           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
		         osirus_primary_D
		         (.OQ(bit_out), .TQ(), .CLK0(bit_clock), .CLK1(1'b0), .CLKDIV(word_clock),
		         .D1(word_in[3]), .D2(word_in[2]), .D3(word_in[1]), .D4(word_in[0]),
		         .IOCE(bit_strobe), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
		         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do2), .SHIFTIN4(cascade_to2), 
		         .SHIFTOUT1(cascade_di2), .SHIFTOUT2(cascade_ti2), .SHIFTOUT3(), .SHIFTOUT4(), 
		         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
		OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(BIT_RATIO),
		           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
		         osirus_secondary_D
		         (.OQ(), .TQ(), .CLK0(bit_clock), .CLK1(1'b0), .CLKDIV(word_clock),
		         .D1(word_in[7]), .D2(word_in[6]), .D3(word_in[5]), .D4(word_in[4]),
		         .IOCE(bit_strobe), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
		         .SHIFTIN1(cascade_di2), .SHIFTIN2(cascade_ti2), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
		         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do2), .SHIFTOUT4(cascade_to2),
		         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	end else begin
		OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(BIT_RATIO),
		           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("MASTER"))
		         osirus_primary_D
		         (.OQ(), .TQ(), .CLK0(bit_clock), .CLK1(1'b0), .CLKDIV(word_clock),
		         .D1(word_in[3]), .D2(word_in[2]), .D3(word_in[1]), .D4(word_in[0]),
		         .IOCE(bit_strobe), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
		         .SHIFTIN1(1'b1), .SHIFTIN2(1'b1), .SHIFTIN3(cascade_do2), .SHIFTIN4(cascade_to2), 
		         .SHIFTOUT1(cascade_di2), .SHIFTOUT2(cascade_ti2), .SHIFTOUT3(), .SHIFTOUT4(), 
		         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
		OSERDES2 #(.DATA_RATE_OQ("SDR"), .DATA_RATE_OT("SDR"), .DATA_WIDTH(BIT_RATIO),
		           .OUTPUT_MODE("SINGLE_ENDED"), .SERDES_MODE("SLAVE"))
		         osirus_secondary_D
		         (.OQ(bit_out), .TQ(), .CLK0(bit_clock), .CLK1(1'b0), .CLKDIV(word_clock),
		         .D1(word_in[7]), .D2(word_in[6]), .D3(word_in[5]), .D4(word_in[4]),
		         .IOCE(bit_strobe), .OCE(1'b1), .RST(reset), .TRAIN(1'b0),
		         .SHIFTIN1(cascade_di2), .SHIFTIN2(cascade_ti2), .SHIFTIN3(1'b1), .SHIFTIN4(1'b1),
		         .SHIFTOUT1(), .SHIFTOUT2(), .SHIFTOUT3(cascade_do2), .SHIFTOUT4(cascade_to2),
		         .TCE(1'b1), .T1(1'b0), .T2(1'b0), .T3(1'b0), .T4(1'b0));
	end
endmodule

module ocyrus_single8 #(
	parameter SCOPE = "BUFIO2", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE = "p",
	parameter PHASE = 0.0,
	parameter PERIOD = 20.0,
	parameter DIVIDE = 2,
	parameter MULTIPLY = 40,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in,
	output word_clock_out,
	input reset,
	input [BIT_DEPTH-1:0] word_in,
	output D_out,
	output locked
);
	wire bit_clock;
	wire bit_strobe;
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE)) mylei (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word_in), .bit_out(D_out));
	oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE), .CLK_FEEDBACK(CLK_FEEDBACK), .PHASE(PHASE)) difficult_pll_TR (
		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	);
endmodule

module ocyrus_double8 #(
	parameter SCOPE = "BUFIO2", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE0 = "p",
	parameter PINTYPE1 = "p",
	parameter PERIOD = 20.0,
	parameter DIVIDE = 2,
	parameter MULTIPLY = 40,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in,
	output word_clock_out,
	input reset,
	input [BIT_DEPTH-1:0] word0_in, word1_in,
	output D0_out, D1_out,
	output bit_clock,
	output bit_strobe,
	output locked
);
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE0)) mylei0 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE1)) mylei1 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word1_in), .bit_out(D1_out));
	oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE), .CLK_FEEDBACK(CLK_FEEDBACK)) difficult_pll_TR (
		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	);
endmodule

module ocyrus_quad8 #(
	parameter SCOPE = "BUFIO2", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE0 = "p",
	parameter PINTYPE1 = "p",
	parameter PINTYPE2 = "p",
	parameter PINTYPE3 = "p",
	parameter PERIOD = 20.0,
	parameter DIVIDE = 2,
	parameter MULTIPLY = 40,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in,
	output word_clock_out,
	input reset,
	input [BIT_DEPTH-1:0] word0_in, word1_in, word2_in, word3_in,
	output D0_out, D1_out, D2_out, D3_out,
	output locked
);
	wire bit_clock;
	wire bit_strobe;
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE0)) mylei0 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE1)) mylei1 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE2)) mylei2 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE3)) mylei3 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word3_in), .bit_out(D3_out));
	oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE), .CLK_FEEDBACK(CLK_FEEDBACK)) difficult_pll_TR (
		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	);
endmodule

module ocyrus_hex8 #(
	parameter SCOPE = "BUFIO2", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE0 = "p",
	parameter PINTYPE1 = "p",
	parameter PINTYPE2 = "p",
	parameter PINTYPE3 = "p",
	parameter PINTYPE4 = "p",
	parameter PINTYPE5 = "p",
	parameter PERIOD = 20.0,
	parameter DIVIDE = 2,
	parameter MULTIPLY = 40
) (
	input clock_in,
	output word_clock_out,
	input reset,
	input [BIT_DEPTH-1:0] word0_in, word1_in, word2_in, word3_in, word4_in, word5_in,
	output D0_out, D1_out, D2_out, D3_out, D4_out, D5_out,
	output locked
);
	wire bit_clock;
	wire bit_strobe;
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE0)) mylei0 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE1)) mylei1 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE2)) mylei2 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE3)) mylei3 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word3_in), .bit_out(D3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE4)) mylei4 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word4_in), .bit_out(D4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE5)) mylei5 (.word_clock(word_clock_out), .bit_clock(bit_clock), .bit_strobe(bit_strobe), .reset(reset), .word_in(word5_in), .bit_out(D5_out));
	oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE)) difficult_pll_TR (
		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	);
endmodule

//	wire rawclock125;
//	wire clock125;
//	if (1) begin
//		simpledcm_CLKGEN #(.MULTIPLY(20), .DIVIDE(8), .PERIOD(20.0)) dcm_clkgen (.clockin(clock50), .reset(reset50), .clockout(rawclock125), .clockout180(), .locked(pll_locked)); // 50->125
//	end else if (0) begin
//		simpledcm_SP #(.MULTIPLY(20), .DIVIDE(8), .ALT_CLOCKOUT_DIVIDE(2), .PERIOD(20.0)) dcm_sp (.clockin(clock50), .reset(reset50), .clockout(rawclock125), .clockout180(), .alt_clockout(), .locked(pll_locked)); // 50->125
//	end else if (0) begin
//		simplepll_ADV #(.OVERALL_DIVIDE(1), .MULTIPLY(20), .DIVIDE(8), .PERIOD(20.0)) pll_adv (.clockin(clock50), .reset(reset50), .clockout(rawclock125), .locked(pll_locked)); // 50->125
//	end else begin
//		simplepll_BASE #(.OVERALL_DIVIDE(1), .MULTIPLY(20), .DIVIDE0(8), .PHASE0(0.0), .PERIOD(20.0)) pll_base (.clockin(clock50), .reset(reset50), .clock0out(rawclock125), .clock1out(), .clock2out(), .clock3out(), .clock4out(), .clock5out(), .locked(pll_locked)); // 50->125
//	end
//	BUFG mrt (.I(rawclock125), .O(clock125));

module ocyrus_hex8_split_4_2 #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE0 = "p",
	parameter PINTYPE1 = "p",
	parameter PINTYPE2 = "p",
	parameter PINTYPE3 = "p",
	parameter PINTYPE4 = "p",
	parameter PINTYPE5 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1,
	parameter PHASE45 = 0.0,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0] word0_in, word1_in, word2_in, word3_in, word4_in, word5_in,
	input [1:0] word_clock45_sel,
	input iserdes_bit_input,
	output [7:0] iserdes_word_out,
	output word_clock0123_out,
	output word_clock45_out,
	output D0_out, D1_out, D2_out, D3_out, D4_out, D5_out,
	output locked
);
	wire bit_clock0123, bit_clock45;
	wire bit_strobe0123, bit_strobe45;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clock0123;
	wire reset_clock45;
	reset_wait4pll reset0123_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clock0123_out), .reset_output(reset_clock0123));
	reset_wait4pll reset45_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clock45_out), .reset_output(reset_clock45));
//	reset3_wait4plls #(.CLOCK1_BIT_PICKOFF(20), .CLOCK2_BIT_PICKOFF(20), .CLOCK3_BIT_PICKOFF(20)) r3 (.reset_input(reset), .pll_locked1_input(1'b1), .pll_locked2_input(pll_is_locked),  .pll_locked3_input(pll_is_locked), .clock1_input(clock_in), .clock2_input(word_clock0123_out), .clock3_input(word_clock45_out), .reset1_output(), .reset2_output(reset_clock0123), .reset3_output(reset_clock45));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE0)) mylei0 (.word_clock(word_clock0123_out), .bit_clock(bit_clock0123), .bit_strobe(bit_strobe0123), .reset(reset_clock0123), .word_in(word0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE1)) mylei1 (.word_clock(word_clock0123_out), .bit_clock(bit_clock0123), .bit_strobe(bit_strobe0123), .reset(reset_clock0123), .word_in(word1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE2)) mylei2 (.word_clock(word_clock0123_out), .bit_clock(bit_clock0123), .bit_strobe(bit_strobe0123), .reset(reset_clock0123), .word_in(word2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE3)) mylei3 (.word_clock(word_clock0123_out), .bit_clock(bit_clock0123), .bit_strobe(bit_strobe0123), .reset(reset_clock0123), .word_in(word3_in), .bit_out(D3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE4)) mylei4 (.word_clock(word_clock45_out), .bit_clock(bit_clock45), .bit_strobe(bit_strobe45), .reset(reset_clock45), .word_in(word4_in), .bit_out(D4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE5)) mylei5 (.word_clock(word_clock45_out), .bit_clock(bit_clock45), .bit_strobe(bit_strobe45), .reset(reset_clock45), .word_in(word5_in), .bit_out(D5_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE0)) is8i (.bit_clock(bit_clock0123), .bit_strobe(bit_strobe0123), .word_clock(word_clock0123_out), .reset(reset_clock0123), .data_in(iserdes_bit_input), .word_out(iserdes_word_out));
//oserdes_pll #(.BIT_DEPTH(BIT_DEPTH), .CLKIN_PERIOD(PERIOD), .PLLD(DIVIDE), .PLLX(MULTIPLY), .SCOPE(SCOPE), .MODE(MODE)) difficult_pll_TR (
//		.reset(reset), .clock_in(clock_in), .word_clock_out(word_clock_out),
//		.serializer_clock_out(bit_clock), .serializer_strobe_out(bit_strobe), .locked(locked)
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(PHASE45),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK(CLK_FEEDBACK)
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clock0123),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]),
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx)
	);
	BUFG bufg_tx (.I(clock_1x[0]), .O(word_clock0123_out));
	clock_select cs (.clock(clock_1x[4:1]), .select(word_clock45_sel), .clock_out(word_clock45_out));
	wire strobe_is_aligned0123, strobe_is_aligned45;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_0123 (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clock0123_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clock0123), // Output PLL Clock
		.LOCK(strobe_is_aligned0123), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobe0123) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_45 (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clock45_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clock45), // Output PLL Clock
		.LOCK(strobe_is_aligned45), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobe45) // Output SERDES strobe
	);
	assign locked = pll_is_locked & strobe_is_aligned0123 & strobe_is_aligned45;
endmodule

//	ocyrus_gyrobicupola8_split_12_6_6 #(.BIT_DEPTH(8), .PERIOD(10.0), .MULTIPLY(10), .DIVIDE(1)) orama (
//		.clock_in(), .reset(),
//		.word_A11_in(), .word_A10_in(), .word_A09_in(), .word_A08_in(), .word_A07_in(), .word_A06_in(),
//		.word_A05_in(), .word_A04_in(), .word_A03_in(), .word_A02_in(), .word_A01_in(), .word_A00_in(),
//		.word_B5_in(), .word_B4_in(), .word_B3_in(), .word_B2_in(), .word_B1_in(), .word_B0_in(),
//		.word_C5_in(), .word_C4_in(), .word_C3_in(), .word_C2_in(), .word_C1_in(), .word_C0_in(),
//		.word_clockA_out(), .word_clockB_out(), .word_clockC_out(),
//		.A11_out(), .A10_out(), .A09_out(), .A08_out(), .A07_out(), .A06_out(),
//		.A05_out(), .A04_out(), .A03_out(), .A02_out(), .A01_out(), .A00_out(),
//		.B5_out(), .B4_out(), .B3_out(), .B2_out(), .B1_out(), .B0_out(),
//		.C5_out(), .C4_out(), .C3_out(), .C2_out(), .C1_out(), .C0_out(),
//		.locked()
//	);
module ocyrus_gyrobicupola8_split_12_6_6 #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE_A00 = "p",
	parameter PINTYPE_A01 = "p",
	parameter PINTYPE_A02 = "p",
	parameter PINTYPE_A03 = "p",
	parameter PINTYPE_A04 = "p",
	parameter PINTYPE_A05 = "p",
	parameter PINTYPE_A06 = "p",
	parameter PINTYPE_A07 = "p",
	parameter PINTYPE_A08 = "p",
	parameter PINTYPE_A09 = "p",
	parameter PINTYPE_A10 = "p",
	parameter PINTYPE_A11 = "p",
	parameter PINTYPE_B0 = "p",
	parameter PINTYPE_B1 = "p",
	parameter PINTYPE_B2 = "p",
	parameter PINTYPE_B3 = "p",
	parameter PINTYPE_B4 = "p",
	parameter PINTYPE_B5 = "p",
	parameter PINTYPE_C0 = "p",
	parameter PINTYPE_C1 = "p",
	parameter PINTYPE_C2 = "p",
	parameter PINTYPE_C3 = "p",
	parameter PINTYPE_C4 = "p",
	parameter PINTYPE_C5 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0]
		word_A00_in, word_A01_in, word_A02_in, word_A03_in, word_A04_in, word_A05_in,
		word_A06_in, word_A07_in, word_A08_in, word_A09_in, word_A10_in, word_A11_in,
		word_B0_in, word_B1_in, word_B2_in, word_B3_in, word_B4_in, word_B5_in,
		word_C0_in, word_C1_in, word_C2_in, word_C3_in, word_C4_in, word_C5_in,
	output word_clockA_out, word_clockB_out, word_clockC_out,
	output
		A00_out, A01_out, A02_out, A03_out, A04_out, A05_out,
		A06_out, A07_out, A08_out, A09_out, A10_out, A11_out,
		B0_out, B1_out, B2_out, B3_out, B4_out, B5_out,
		C0_out, C1_out, C2_out, C3_out, C4_out, C5_out,
	output locked
);
	wire bit_clockA, bit_clockB, bit_clockC;
	wire bit_strobeA, bit_strobeB, bit_strobeC;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clockA, reset_clockB, reset_clockC;
	reset_wait4pll resetA_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockA_out), .reset_output(reset_clockA));
	reset_wait4pll resetB_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockB_out), .reset_output(reset_clockB));
	reset_wait4pll resetC_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockC_out), .reset_output(reset_clockC));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A00_in), .bit_out(A00_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A01)) mylei_A01 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A01_in), .bit_out(A01_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A02)) mylei_A02 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A02_in), .bit_out(A02_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A03)) mylei_A03 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A03_in), .bit_out(A03_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A04)) mylei_A04 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A04_in), .bit_out(A04_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A05_in), .bit_out(A05_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A06_in), .bit_out(A06_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A07)) mylei_A07 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A07_in), .bit_out(A07_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A08)) mylei_A08 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A08_in), .bit_out(A08_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A09)) mylei_A09 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A09_in), .bit_out(A09_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A10)) mylei_A10 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A10_in), .bit_out(A10_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A11_in), .bit_out(A11_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) mylei_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B0_in), .bit_out(B0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) mylei_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B1_in), .bit_out(B1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) mylei_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B2_in), .bit_out(B2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) mylei_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B3_in), .bit_out(B3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) mylei_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B4_in), .bit_out(B4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) mylei_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B5_in), .bit_out(B5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) mylei_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C0_in), .bit_out(C0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) mylei_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C1_in), .bit_out(C1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) mylei_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C2_in), .bit_out(C2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) mylei_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C3_in), .bit_out(C3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) mylei_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C4_in), .bit_out(C4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) mylei_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C5_in), .bit_out(C5_out));
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK("CLKFBOUT")
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clockA),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]),
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx)
	);
	BUFG bufg_txA (.I(clock_1x[0]), .O(word_clockA_out));
	BUFG bufg_txB (.I(clock_1x[0]), .O(word_clockB_out));
	BUFG bufg_txC (.I(clock_1x[0]), .O(word_clockC_out));
	wire strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_A (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockA_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockA), // Output PLL Clock
		.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_B (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockB_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockB), // Output PLL Clock
		.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_C (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockC_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockC), // Output PLL Clock
		.LOCK(strobe_is_alignedC), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeC) // Output SERDES strobe
	);
	assign locked = pll_is_locked & strobe_is_alignedA & strobe_is_alignedB & strobe_is_alignedC;
endmodule

//	ocyrus_triacontahedron8_split_12_6_6_4_2 #(.BIT_DEPTH(8), .PERIOD(10.0), .MULTIPLY(10), .DIVIDE(1)) orama (
//		.clock_in(), .reset(),
//		.word_A11_in(), .word_A10_in(), .word_A09_in(), .word_A08_in(), .word_A07_in(), .word_A06_in(),
//		.word_A05_in(), .word_A04_in(), .word_A03_in(), .word_A02_in(), .word_A01_in(), .word_A00_in(),
//		.word_B5_in(), .word_B4_in(), .word_B3_in(), .word_B2_in(), .word_B1_in(), .word_B0_in(),
//		.word_C5_in(), .word_C4_in(), .word_C3_in(), .word_C2_in(), .word_C1_in(), .word_C0_in(),
//		.word_D3_in(), .word_D2_in(), .word_D1_in(), .word_D0_in(),
//		.word_E1_in(), .word_E0_in(),
//		.word_clockA_out(), .word_clockB_out(), .word_clockC_out(), .word_clockD_out(), .word_clockE_out(),
//		.A11_out(), .A10_out(), .A09_out(), .A08_out(), .A07_out(), .A06_out(),
//		.A05_out(), .A04_out(), .A03_out(), .A02_out(), .A01_out(), .A00_out(),
//		.B5_out(), .B4_out(), .B3_out(), .B2_out(), .B1_out(), .B0_out(),
//		.C5_out(), .C4_out(), .C3_out(), .C2_out(), .C1_out(), .C0_out(),
//		.D3_out(), .D2_out(), .D1_out(), .D0_out(),
//		.E1_out(), .E0_out(),
//		.locked()
//	);
module ocyrus_triacontahedron8_split_12_6_6_4_2 #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE_A00 = "p",
	parameter PINTYPE_A01 = "p",
	parameter PINTYPE_A02 = "p",
	parameter PINTYPE_A03 = "p",
	parameter PINTYPE_A04 = "p",
	parameter PINTYPE_A05 = "p",
	parameter PINTYPE_A06 = "p",
	parameter SPECIAL_A06 = "A",
	parameter PINTYPE_A07 = "p",
	parameter PINTYPE_A08 = "p",
	parameter PINTYPE_A09 = "p",
	parameter PINTYPE_A10 = "p",
	parameter PINTYPE_A11 = "p",
	parameter PINTYPE_B0 = "p",
	parameter PINTYPE_B1 = "p",
	parameter PINTYPE_B2 = "p",
	parameter PINTYPE_B3 = "p",
	parameter PINTYPE_B4 = "p",
	parameter PINTYPE_B5 = "p",
	parameter PINTYPE_C0 = "p",
	parameter PINTYPE_C1 = "p",
	parameter PINTYPE_C2 = "p",
	parameter PINTYPE_C3 = "p",
	parameter PINTYPE_C4 = "p",
	parameter PINTYPE_C5 = "p",
	parameter PINTYPE_D0 = "p",
	parameter PINTYPE_D1 = "p",
	parameter PINTYPE_D2 = "p",
	parameter PINTYPE_D3 = "p",
	parameter PINTYPE_E0 = "p",
	parameter PINTYPE_E1 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0]
		word_A00_in, word_A01_in, word_A02_in, word_A03_in, word_A04_in, word_A05_in,
		word_A06_in, word_A07_in, word_A08_in, word_A09_in, word_A10_in, word_A11_in,
		word_B0_in, word_B1_in, word_B2_in, word_B3_in, word_B4_in, word_B5_in,
		word_C0_in, word_C1_in, word_C2_in, word_C3_in, word_C4_in, word_C5_in,
		word_D0_in, word_D1_in, word_D2_in, word_D3_in,
		word_E0_in, word_E1_in,
	output word_clockA_out, word_clockB_out, word_clockC_out, word_clockD_out, word_clockE_out,
	output
		A00_out, A01_out, A02_out, A03_out, A04_out, A05_out,
		A06_out, A07_out, A08_out, A09_out, A10_out, A11_out,
		B0_out, B1_out, B2_out, B3_out, B4_out, B5_out,
		C0_out, C1_out, C2_out, C3_out, C4_out, C5_out,
		D0_out, D1_out, D2_out, D3_out,
		E0_out, E1_out,
	output locked
);
	wire bit_clockA, bit_clockB, bit_clockC, bit_clockD, bit_clockE;
	wire bit_strobeA, bit_strobeB, bit_strobeC, bit_strobeD, bit_strobeE;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clockA, reset_clockB, reset_clockC, reset_clockD, reset_clockE;
	reset_wait4pll resetA_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockA_out), .reset_output(reset_clockA));
	reset_wait4pll resetB_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockB_out), .reset_output(reset_clockB));
	reset_wait4pll resetC_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockC_out), .reset_output(reset_clockC));
	reset_wait4pll resetD_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockD_out), .reset_output(reset_clockD));
	reset_wait4pll resetE_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockE_out), .reset_output(reset_clockE));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A00_in), .bit_out(A00_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A01)) mylei_A01 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A01_in), .bit_out(A01_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A02)) mylei_A02 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A02_in), .bit_out(A02_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A03)) mylei_A03 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A03_in), .bit_out(A03_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A04)) mylei_A04 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A04_in), .bit_out(A04_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A05_in), .bit_out(A05_out));
	if ("A"==SPECIAL_A06) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A06_in), .bit_out(A06_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A06_in), .bit_out(A06_out)); // special case for a06 being on a different bank from a11-a07
	end
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A07)) mylei_A07 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A07_in), .bit_out(A07_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A08)) mylei_A08 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A08_in), .bit_out(A08_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A09)) mylei_A09 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A09_in), .bit_out(A09_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A10)) mylei_A10 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A10_in), .bit_out(A10_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A11_in), .bit_out(A11_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) mylei_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B0_in), .bit_out(B0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) mylei_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B1_in), .bit_out(B1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) mylei_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B2_in), .bit_out(B2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) mylei_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B3_in), .bit_out(B3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) mylei_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B4_in), .bit_out(B4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) mylei_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B5_in), .bit_out(B5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) mylei_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C0_in), .bit_out(C0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) mylei_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C1_in), .bit_out(C1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) mylei_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C2_in), .bit_out(C2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) mylei_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C3_in), .bit_out(C3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) mylei_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C4_in), .bit_out(C4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) mylei_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C5_in), .bit_out(C5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D0)) mylei_D0 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D1)) mylei_D1 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D2)) mylei_D2 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D3)) mylei_D3 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D3_in), .bit_out(D3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E0)) mylei_E0 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E0_in), .bit_out(E0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E1)) mylei_E1 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E1_in), .bit_out(E1_out));
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK("CLKFBOUT")
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clockA),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]),
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx)
	);
	BUFG bufg_txA (.I(clock_1x[0]), .O(word_clockA_out));
	BUFG bufg_txB (.I(clock_1x[0]), .O(word_clockB_out));
	BUFG bufg_txC (.I(clock_1x[0]), .O(word_clockC_out));
	BUFG bufg_txD (.I(clock_1x[0]), .O(word_clockD_out));
//	BUFG bufg_txE (.I(clock_1x[0]), .O(word_clockE_out));
	wire strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_A (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockA_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockA), // Output PLL Clock
		.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_B (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockB_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockB), // Output PLL Clock
		.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_C (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockC_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockC), // Output PLL Clock
		.LOCK(strobe_is_alignedC), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeC) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_D (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockD_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockD), // Output PLL Clock
		.LOCK(strobe_is_alignedD), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeD) // Output SERDES strobe
	);
	assign word_clockE_out = word_clockA_out;
	assign bit_clockE = bit_clockA;
	assign bit_strobeE = bit_strobeA;
	assign locked = pll_is_locked & strobe_is_alignedA & strobe_is_alignedB & strobe_is_alignedC & strobe_is_alignedD;
endmodule

module ocyrus_triacontahedron8_split_12_6_6_4_2_D0input #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE_A00 = "p",
	parameter PINTYPE_A01 = "p",
	parameter PINTYPE_A02 = "p",
	parameter PINTYPE_A03 = "p",
	parameter PINTYPE_A04 = "p",
	parameter PINTYPE_A05 = "p",
	parameter PINTYPE_A06 = "p",
	parameter SPECIAL_A06 = "A",
	parameter PINTYPE_A07 = "p",
	parameter PINTYPE_A08 = "p",
	parameter PINTYPE_A09 = "p",
	parameter PINTYPE_A10 = "p",
	parameter PINTYPE_A11 = "p",
	parameter PINTYPE_B0 = "p",
	parameter PINTYPE_B1 = "p",
	parameter PINTYPE_B2 = "p",
	parameter PINTYPE_B3 = "p",
	parameter PINTYPE_B4 = "p",
	parameter PINTYPE_B5 = "p",
	parameter PINTYPE_C0 = "p",
	parameter PINTYPE_C1 = "p",
	parameter PINTYPE_C2 = "p",
	parameter PINTYPE_C3 = "p",
	parameter PINTYPE_C4 = "p",
	parameter PINTYPE_C5 = "p",
	parameter PINTYPE_D0 = "p",
	parameter PINTYPE_D1 = "p",
	parameter PINTYPE_D2 = "p",
	parameter PINTYPE_D3 = "p",
	parameter PINTYPE_E0 = "p",
	parameter PINTYPE_E1 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0]
		word_A00_in, word_A01_in, word_A02_in, word_A03_in, word_A04_in, word_A05_in,
		word_A06_in, word_A07_in, word_A08_in, word_A09_in, word_A10_in, word_A11_in,
		word_B0_in, word_B1_in, word_B2_in, word_B3_in, word_B4_in, word_B5_in,
		word_C0_in, word_C1_in, word_C2_in, word_C3_in, word_C4_in, word_C5_in,
		word_D1_in, word_D2_in, word_D3_in,
		word_E0_in, word_E1_in,
	output word_clockA_out, word_clockB_out, word_clockC_out, word_clockD_out, word_clockE_out,
	input D0_in,
	output [BIT_DEPTH-1:0] word_D0_out,
	output
		A00_out, A01_out, A02_out, A03_out, A04_out, A05_out,
		A06_out, A07_out, A08_out, A09_out, A10_out, A11_out,
		B0_out, B1_out, B2_out, B3_out, B4_out, B5_out,
		C0_out, C1_out, C2_out, C3_out, C4_out, C5_out,
		D1_out, D2_out, D3_out,
		E0_out, E1_out,
	output strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD,
	output locked
);
	wire bit_clockA, bit_clockB, bit_clockC, bit_clockD, bit_clockE;
	wire bit_strobeA, bit_strobeB, bit_strobeC, bit_strobeD, bit_strobeE;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clockA, reset_clockB, reset_clockC, reset_clockD, reset_clockE;
	reset_wait4pll resetA_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockA_out), .reset_output(reset_clockA));
	reset_wait4pll resetB_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockB_out), .reset_output(reset_clockB));
	reset_wait4pll resetC_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockC_out), .reset_output(reset_clockC));
	reset_wait4pll resetD_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockD_out), .reset_output(reset_clockD));
	reset_wait4pll resetE_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockE_out), .reset_output(reset_clockE));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A00_in), .bit_out(A00_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A01)) mylei_A01 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A01_in), .bit_out(A01_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A02)) mylei_A02 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A02_in), .bit_out(A02_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A03)) mylei_A03 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A03_in), .bit_out(A03_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A04)) mylei_A04 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A04_in), .bit_out(A04_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A05_in), .bit_out(A05_out));
	if ("A"==SPECIAL_A06) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A06_in), .bit_out(A06_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A06_in), .bit_out(A06_out)); // special case for a06 being on a different bank from a11-a07
	end
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A07)) mylei_A07 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A07_in), .bit_out(A07_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A08)) mylei_A08 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A08_in), .bit_out(A08_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A09)) mylei_A09 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A09_in), .bit_out(A09_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A10)) mylei_A10 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A10_in), .bit_out(A10_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A11_in), .bit_out(A11_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) mylei_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B0_in), .bit_out(B0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) mylei_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B1_in), .bit_out(B1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) mylei_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B2_in), .bit_out(B2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) mylei_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B3_in), .bit_out(B3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) mylei_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B4_in), .bit_out(B4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) mylei_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B5_in), .bit_out(B5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) mylei_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C0_in), .bit_out(C0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) mylei_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C1_in), .bit_out(C1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) mylei_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C2_in), .bit_out(C2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) mylei_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C3_in), .bit_out(C3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) mylei_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C4_in), .bit_out(C4_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) mylei_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C5_in), .bit_out(C5_out));
//	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D0)) mylei_D0 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D0_in), .bit_out(D0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D0)) is8i (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .data_in(D0_in), .word_out(word_D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D1)) mylei_D1 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D2)) mylei_D2 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D3)) mylei_D3 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D3_in), .bit_out(D3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E0)) mylei_E0 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E0_in), .bit_out(E0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E1)) mylei_E1 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E1_in), .bit_out(E1_out));
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK("CLKFBOUT")
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clockA),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]), // word_clock for BUFG
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx) // bit clock for IOSERDES
	);
	BUFG bufg_txA (.I(clock_1x[0]), .O(word_clockA_out));
	BUFG bufg_txB (.I(clock_1x[0]), .O(word_clockB_out));
	BUFG bufg_txC (.I(clock_1x[0]), .O(word_clockC_out));
	BUFG bufg_txD (.I(clock_1x[0]), .O(word_clockD_out));
//	BUFG bufg_txE (.I(clock_1x[0]), .O(word_clockE_out));
	//wire strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_A (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockA_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockA), // Output PLL Clock
		.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_B (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockB_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockB), // Output PLL Clock
		.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_C (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockC_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockC), // Output PLL Clock
		.LOCK(strobe_is_alignedC), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeC) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_D (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockD_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockD), // Output PLL Clock
		.LOCK(strobe_is_alignedD), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeD) // Output SERDES strobe
	);
	assign word_clockE_out = word_clockA_out;
	assign bit_clockE = bit_clockA;
	assign bit_strobeE = bit_strobeA;
	//assign locked = pll_is_locked & strobe_is_alignedA & strobe_is_alignedB & strobe_is_alignedC & strobe_is_alignedD;
	assign locked = pll_is_locked;
endmodule

module ocyrus_triacontahedron8_split_12_6_6_4_2_BCinput #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE_A00 = "p",
	parameter PINTYPE_A01 = "p",
	parameter PINTYPE_A02 = "p",
	parameter PINTYPE_A03 = "p",
	parameter PINTYPE_A04 = "p",
	parameter PINTYPE_A05 = "p",
	parameter PINTYPE_A06 = "p",
	parameter SPECIAL_A06 = "A",
	parameter PINTYPE_A07 = "p",
	parameter PINTYPE_A08 = "p",
	parameter PINTYPE_A09 = "p",
	parameter PINTYPE_A10 = "p",
	parameter PINTYPE_A11 = "p",
	parameter SPECIAL_A11 = "A",
	parameter PINTYPE_B0 = "p",
	parameter PINTYPE_B1 = "p",
	parameter PINTYPE_B2 = "p",
	parameter PINTYPE_B3 = "p",
	parameter PINTYPE_B4 = "p",
	parameter PINTYPE_B5 = "p",
	parameter PINTYPE_C0 = "p",
	parameter PINTYPE_C1 = "p",
	parameter PINTYPE_C2 = "p",
	parameter PINTYPE_C3 = "p",
	parameter PINTYPE_C4 = "p",
	parameter PINTYPE_C5 = "p",
	parameter PINTYPE_D0 = "p",
	parameter PINTYPE_D1 = "p",
	parameter PINTYPE_D2 = "p",
	parameter PINTYPE_D3 = "p",
	parameter PINTYPE_E0 = "p",
	parameter PINTYPE_E1 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0]
		word_A00_in, word_A01_in, word_A02_in, word_A03_in, word_A04_in, word_A05_in,
		word_A06_in, word_A07_in, word_A08_in, word_A09_in, word_A10_in, word_A11_in,
		word_D0_in, word_D1_in, word_D2_in, word_D3_in,
		word_E0_in, word_E1_in,
	output word_clockA_out, word_clockB_out, word_clockC_out, word_clockD_out, word_clockE_out,
	output [BIT_DEPTH-1:0]
		word_B0_out, word_B1_out, word_B2_out, word_B3_out, word_B4_out, word_B5_out,
		word_C0_out, word_C1_out, word_C2_out, word_C3_out, word_C4_out, word_C5_out,
	input
		B0_in, B1_in, B2_in, B3_in, B4_in, B5_in,
		C0_in, C1_in, C2_in, C3_in, C4_in, C5_in,
	output
		A00_out, A01_out, A02_out, A03_out, A04_out, A05_out,
		A06_out, A07_out, A08_out, A09_out, A10_out, A11_out,
		D0_out, D1_out, D2_out, D3_out,
		E0_out, E1_out,
	output strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD,
	output locked
);
	wire bit_clockA, bit_clockB, bit_clockC, bit_clockD, bit_clockE;
	wire bit_strobeA, bit_strobeB, bit_strobeC, bit_strobeD, bit_strobeE;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clockA, reset_clockB, reset_clockC, reset_clockD, reset_clockE;
	reset_wait4pll resetA_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockA_out), .reset_output(reset_clockA));
	reset_wait4pll resetB_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockB_out), .reset_output(reset_clockB));
	reset_wait4pll resetC_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockC_out), .reset_output(reset_clockC));
	reset_wait4pll resetD_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockD_out), .reset_output(reset_clockD));
	reset_wait4pll resetE_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockE_out), .reset_output(reset_clockE));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A00_in), .bit_out(A00_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A01)) mylei_A01 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A01_in), .bit_out(A01_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A02)) mylei_A02 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A02_in), .bit_out(A02_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A03)) mylei_A03 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A03_in), .bit_out(A03_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A04)) mylei_A04 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A04_in), .bit_out(A04_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A05_in), .bit_out(A05_out));
	if ("A"==SPECIAL_A06) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A06_in), .bit_out(A06_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A06_in), .bit_out(A06_out)); // special case for a06 being on a different bank from a11-a07
	end
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A07)) mylei_A07 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A07_in), .bit_out(A07_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A08)) mylei_A08 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A08_in), .bit_out(A08_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A09)) mylei_A09 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A09_in), .bit_out(A09_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A10)) mylei_A10 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A10_in), .bit_out(A10_out));
	if ("A"==SPECIAL_A11) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A11_in), .bit_out(A11_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_A11_in), .bit_out(A11_out)); // special case for a11 (t/p51 on althea revBLM) being on a different bank from a10-a00
	end
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) mylei_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B0_in), .bit_out(B0_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) mylei_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B1_in), .bit_out(B1_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) mylei_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B2_in), .bit_out(B2_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) mylei_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B3_in), .bit_out(B3_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) mylei_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B4_in), .bit_out(B4_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) mylei_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B5_in), .bit_out(B5_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) is8i_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B0_in), .word_out(word_B0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) is8i_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B1_in), .word_out(word_B1_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) is8i_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B2_in), .word_out(word_B2_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) is8i_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B3_in), .word_out(word_B3_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) is8i_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B4_in), .word_out(word_B4_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) is8i_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B5_in), .word_out(word_B5_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) mylei_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C0_in), .bit_out(C0_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) mylei_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C1_in), .bit_out(C1_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) mylei_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C2_in), .bit_out(C2_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) mylei_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C3_in), .bit_out(C3_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) mylei_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C4_in), .bit_out(C4_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) mylei_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C5_in), .bit_out(C5_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) is8i_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C0_in), .word_out(word_C0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) is8i_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C1_in), .word_out(word_C1_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) is8i_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C2_in), .word_out(word_C2_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) is8i_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C3_in), .word_out(word_C3_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) is8i_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C4_in), .word_out(word_C4_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) is8i_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C5_in), .word_out(word_C5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D0)) mylei_D0 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D1)) mylei_D1 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D2)) mylei_D2 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D3)) mylei_D3 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D3_in), .bit_out(D3_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E0)) mylei_E0 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E0_in), .bit_out(E0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E1)) mylei_E1 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .word_in(word_E1_in), .bit_out(E1_out));
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK("CLKFBOUT")
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clockA),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]), // word_clock for BUFG
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx) // bit clock for IOSERDES
	);
	BUFG bufg_txA (.I(clock_1x[0]), .O(word_clockA_out));
	BUFG bufg_txB (.I(clock_1x[0]), .O(word_clockB_out));
	BUFG bufg_txC (.I(clock_1x[0]), .O(word_clockC_out));
	BUFG bufg_txD (.I(clock_1x[0]), .O(word_clockD_out));
//	BUFG bufg_txE (.I(clock_1x[0]), .O(word_clockE_out));
	//wire strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_A (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockA_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockA), // Output PLL Clock
		.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_B (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockB_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockB), // Output PLL Clock
		.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_C (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockC_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockC), // Output PLL Clock
		.LOCK(strobe_is_alignedC), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeC) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_D (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockD_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockD), // Output PLL Clock
		.LOCK(strobe_is_alignedD), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeD) // Output SERDES strobe
	);
	assign word_clockE_out = word_clockA_out;
	assign bit_clockE = bit_clockA;
	assign bit_strobeE = bit_strobeA;
	//assign locked = pll_is_locked & strobe_is_alignedA & strobe_is_alignedB & strobe_is_alignedC & strobe_is_alignedD;
	assign locked = pll_is_locked;
endmodule

module ocyrus_triacontahedron8_split_12_6_6_4_2_BCEinput #(
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_WIDTH=1, // how many bits come out in parallel
	parameter BIT_DEPTH=8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter PINTYPE_A00 = "p",
	parameter SPECIAL_A00 = "A", // A=bank3/N-Z (except for T which is B/bank2/M-G); when rotated, T is C/bank2/A-F
	parameter PINTYPE_A01 = "p",
	parameter PINTYPE_A02 = "p",
	parameter PINTYPE_A03 = "p",
	parameter PINTYPE_A04 = "p",
	parameter PINTYPE_A05 = "p",
	parameter SPECIAL_A05 = "A",
	parameter PINTYPE_A06 = "p",
	parameter SPECIAL_A06 = "A",
	parameter PINTYPE_A07 = "p",
	parameter PINTYPE_A08 = "p",
	parameter PINTYPE_A09 = "p",
	parameter PINTYPE_A10 = "p",
	parameter PINTYPE_A11 = "p",
	parameter SPECIAL_A11 = "A",
	parameter PINTYPE_B0 = "p",
	parameter PINTYPE_B1 = "p",
	parameter PINTYPE_B2 = "p",
	parameter PINTYPE_B3 = "p",
	parameter PINTYPE_B4 = "p",
	parameter PINTYPE_B5 = "p",
	parameter PINTYPE_C0 = "p",
	parameter PINTYPE_C1 = "p",
	parameter PINTYPE_C2 = "p",
	parameter PINTYPE_C3 = "p",
	parameter PINTYPE_C4 = "p",
	parameter PINTYPE_C5 = "p",
	parameter PINTYPE_D0 = "p",
	parameter PINTYPE_D1 = "p",
	parameter PINTYPE_D2 = "p",
	parameter PINTYPE_D3 = "p",
	parameter PINTYPE_E0 = "p",
	parameter PINTYPE_E1 = "p",
	parameter PERIOD = 20.0,
	parameter MULTIPLY = 40,
	parameter DIVIDE = 2,
	parameter EXTRA_DIVIDE = 1
) (
	input clock_in,
	input reset,
	input [BIT_DEPTH-1:0]
		word_A00_in, word_A01_in, word_A02_in, word_A03_in, word_A04_in, word_A05_in,
		word_A06_in, word_A07_in, word_A08_in, word_A09_in, word_A10_in, word_A11_in,
		word_D0_in, word_D1_in, word_D2_in, word_D3_in,
	output word_clockA_out, word_clockB_out, word_clockC_out, word_clockD_out, word_clockE_out,
	output [BIT_DEPTH-1:0]
		word_B0_out, word_B1_out, word_B2_out, word_B3_out, word_B4_out, word_B5_out,
		word_C0_out, word_C1_out, word_C2_out, word_C3_out, word_C4_out, word_C5_out,
		word_E0_out, word_E1_out,
	input
		B0_in, B1_in, B2_in, B3_in, B4_in, B5_in,
		C0_in, C1_in, C2_in, C3_in, C4_in, C5_in,
		E0_in, E1_in,
	output
		A00_out, A01_out, A02_out, A03_out, A04_out, A05_out,
		A06_out, A07_out, A08_out, A09_out, A10_out, A11_out,
		D0_out, D1_out, D2_out, D3_out,
	output strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD,
	output locked
);
	wire bit_clockA, bit_clockB, bit_clockC, bit_clockD, bit_clockE;
	wire bit_strobeA, bit_strobeB, bit_strobeC, bit_strobeD, bit_strobeE;
	wire pll_is_locked; // Locked output from PLL
	wire reset_clockA, reset_clockB, reset_clockC, reset_clockD, reset_clockE;
	reset_wait4pll resetA_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockA_out), .reset_output(reset_clockA));
	reset_wait4pll resetB_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockB_out), .reset_output(reset_clockB));
	reset_wait4pll resetC_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockC_out), .reset_output(reset_clockC));
	reset_wait4pll resetD_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockD_out), .reset_output(reset_clockD));
	reset_wait4pll resetE_wait4pll (.reset_input(reset), .pll_locked_input(locked), .clock_input(word_clockE_out), .reset_output(reset_clockE));
	if ("A"==SPECIAL_A00) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A00_in), .bit_out(A00_out));
	end else if ("B"==SPECIAL_A00) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A00_in), .bit_out(A00_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A00)) mylei_A00 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_A00_in), .bit_out(A00_out));
	end
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A01)) mylei_A01 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A01_in), .bit_out(A01_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A02)) mylei_A02 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A02_in), .bit_out(A02_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A03)) mylei_A03 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A03_in), .bit_out(A03_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A04)) mylei_A04 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A04_in), .bit_out(A04_out));
	if ("A"==SPECIAL_A05) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A05_in), .bit_out(A05_out));
	end else if ("B"==SPECIAL_A05) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A05_in), .bit_out(A05_out));
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A05)) mylei_A05 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_A05_in), .bit_out(A05_out));
	end
	if ("A"==SPECIAL_A06) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A06_in), .bit_out(A06_out));
	end else if ("B"==SPECIAL_A06) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A06_in), .bit_out(A06_out)); // special case for a06 being on a different bank from a11-a07
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A06)) mylei_A06 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_A06_in), .bit_out(A06_out)); // special case for a06 being on a different bank from a11-a07
	end
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A07)) mylei_A07 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A07_in), .bit_out(A07_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A08)) mylei_A08 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A08_in), .bit_out(A08_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A09)) mylei_A09 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A09_in), .bit_out(A09_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A10)) mylei_A10 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A10_in), .bit_out(A10_out));
	if ("A"==SPECIAL_A11) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockA_out), .bit_clock(bit_clockA), .bit_strobe(bit_strobeA), .reset(reset_clockA), .word_in(word_A11_in), .bit_out(A11_out));
	end else if ("B"==SPECIAL_A11) begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_A11_in), .bit_out(A11_out)); // special case for a11 (t/p51 on althea revBLM) being on a different bank from a10-a00
	end else begin
		ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_A11)) mylei_A11 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_A11_in), .bit_out(A11_out)); // special case for a11 (t/p51 on althea revBLM) being on a different bank from a10-a00
	end
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) mylei_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B0_in), .bit_out(B0_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) mylei_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B1_in), .bit_out(B1_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) mylei_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B2_in), .bit_out(B2_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) mylei_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B3_in), .bit_out(B3_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) mylei_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B4_in), .bit_out(B4_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) mylei_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .word_in(word_B5_in), .bit_out(B5_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B0)) is8i_B0 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B0_in), .word_out(word_B0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B1)) is8i_B1 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B1_in), .word_out(word_B1_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B2)) is8i_B2 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B2_in), .word_out(word_B2_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B3)) is8i_B3 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B3_in), .word_out(word_B3_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B4)) is8i_B4 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B4_in), .word_out(word_B4_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_B5)) is8i_B5 (.word_clock(word_clockB_out), .bit_clock(bit_clockB), .bit_strobe(bit_strobeB), .reset(reset_clockB), .data_in(B5_in), .word_out(word_B5_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) mylei_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C0_in), .bit_out(C0_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) mylei_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C1_in), .bit_out(C1_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) mylei_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C2_in), .bit_out(C2_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) mylei_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C3_in), .bit_out(C3_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) mylei_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C4_in), .bit_out(C4_out));
	//ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) mylei_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .word_in(word_C5_in), .bit_out(C5_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C0)) is8i_C0 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C0_in), .word_out(word_C0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C1)) is8i_C1 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C1_in), .word_out(word_C1_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C2)) is8i_C2 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C2_in), .word_out(word_C2_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C3)) is8i_C3 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C3_in), .word_out(word_C3_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C4)) is8i_C4 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C4_in), .word_out(word_C4_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_C5)) is8i_C5 (.word_clock(word_clockC_out), .bit_clock(bit_clockC), .bit_strobe(bit_strobeC), .reset(reset_clockC), .data_in(C5_in), .word_out(word_C5_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D0)) mylei_D0 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D0_in), .bit_out(D0_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D1)) mylei_D1 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D1_in), .bit_out(D1_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D2)) mylei_D2 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D2_in), .bit_out(D2_out));
	ocyrus_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_D3)) mylei_D3 (.word_clock(word_clockD_out), .bit_clock(bit_clockD), .bit_strobe(bit_strobeD), .reset(reset_clockD), .word_in(word_D3_in), .bit_out(D3_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E0)) is8i_E0 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .data_in(E0_in), .word_out(word_E0_out));
	iserdes_single8_inner #(.BIT_RATIO(BIT_DEPTH), .PINTYPE(PINTYPE_E1)) is8i_E1 (.word_clock(word_clockE_out), .bit_clock(bit_clockE), .bit_strobe(bit_strobeE), .reset(reset_clockE), .data_in(E1_in), .word_out(word_E1_out));
	wire [4:0] clock_1x;
	wire clock_nx;
	simpll #(
		.BIT_DEPTH(BIT_DEPTH),
		.CLKIN_PERIOD(PERIOD),
		.PHASE(0.0),
		.PHASE2345(0.0),
		.PLLD(DIVIDE),
		.PLLX(MULTIPLY),
		.EXTRA_DIVIDE(EXTRA_DIVIDE)
//		.CLK_FEEDBACK("CLKFBOUT")
	) siphon (
		.clock_in(clock_in),
		.reset(reset),
//		.clock_nx_fb(bit_clockA),
		.pll_is_locked(pll_is_locked),
		.clock_1x(clock_1x[0]), // word_clock for BUFG
		.clock_1x_1(clock_1x[1]),
		.clock_1x_2(clock_1x[2]),
		.clock_1x_3(clock_1x[3]),
		.clock_1x_4(clock_1x[4]),
		.clock_nx(clock_nx) // bit clock for IOSERDES
	);
	BUFG bufg_txA (.I(clock_1x[0]), .O(word_clockA_out));
	BUFG bufg_txB (.I(clock_1x[0]), .O(word_clockB_out));
	BUFG bufg_txC (.I(clock_1x[0]), .O(word_clockC_out));
	BUFG bufg_txD (.I(clock_1x[0]), .O(word_clockD_out));
//	BUFG bufg_txE (.I(clock_1x[0]), .O(word_clockE_out));
	//wire strobe_is_alignedA, strobe_is_alignedB, strobe_is_alignedC, strobe_is_alignedD;
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_A (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockA_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockA), // Output PLL Clock
		.LOCK(strobe_is_alignedA), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeA) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_B (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockB_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockB), // Output PLL Clock
		.LOCK(strobe_is_alignedB), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeB) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_C (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockC_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockC), // Output PLL Clock
		.LOCK(strobe_is_alignedC), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeC) // Output SERDES strobe
	);
	BUFPLL #(
		.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
		.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
	) tx_bufpll_inst_D (
		.PLLIN(clock_nx), // PLL Clock input
		.GCLK(word_clockD_out), // Global Clock input
		.LOCKED(pll_is_locked), // Clock0 locked input
		.IOCLK(bit_clockD), // Output PLL Clock
		.LOCK(strobe_is_alignedD), // BUFPLL Clock and strobe locked
		.SERDESSTROBE(bit_strobeD) // Output SERDES strobe
	);
	assign word_clockE_out = word_clockA_out;
	assign bit_clockE = bit_clockA;
	assign bit_strobeE = bit_strobeA;
	//assign locked = pll_is_locked & strobe_is_alignedA & strobe_is_alignedB & strobe_is_alignedC & strobe_is_alignedD;
	assign locked = pll_is_locked;
endmodule

// 156.25 / 8.0 * 61.875 / 2.375 = 508.840461 for scrod revA3 on-board oscillator
// 156.25 / 5 * 32 = 1000 for scrod revA3 on-board oscillator
// 50.0 / 2 * 40 = 1000 for althea on-board oscillator
// 127.221875 / 2 * 16 = 1017.775 MHz
// 508.8875 / 2 * 4 = 1017.775 MHz
module simpll #(
	parameter BIT_DEPTH = 8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter CLKIN_PERIOD = 6.4,
	parameter PHASE = 0.0,
	parameter PHASE2345 = 0.0,
	parameter PLLD = 5,
	parameter PLLX = 32,
	parameter EXTRA_DIVIDE = 1
//	parameter CLK_FEEDBACK = "CLKFBOUT",
//	parameter COMPENSATION = CLK_FEEDBACK=="CLKFBOUT" ? "INTERNAL" : "EXTERNAL"
	//parameter COMPENSATION = "SOURCE_SYNCHRONOUS"
) (
	input clock_in,
	input reset,
//	input clock_nx_fb, // bit clock feedback input
	output pll_is_locked,
	output clock_1x, // word clock output, phase shifted by PHASE
	output clock_1x_1, // word clock output, phase shifted by PHASE2345+1*360/BIT_DEPTH
	output clock_1x_2, // word clock output, phase shifted by PHASE2345+2*360/BIT_DEPTH
	output clock_1x_3, // word clock output, phase shifted by PHASE2345+3*360/BIT_DEPTH
	output clock_1x_4, // word clock output, phase shifted by PHASE2345+4*360/BIT_DEPTH
	output clock_nx // bit clock output
);
	localparam COMPENSATION = "INTERNAL";
	localparam CLK_FEEDBACK = "CLKFBOUT";
	// from clock_generator_pll_s8_diff.v from XAPP1064 example code, ug615 and ug382
	// frequency of VCO after div and mult must be in range [400,1050] MHz for speed grade 3
	// frequency of PFD (right after first DIVCLK_DIVIDE) stage must be in range [19, 500] MHz for speed grade 3
	// frequency of BUFG can't be higher than 400 MHz
	wire fb_in; // incoming feedback net
	wire fb_out; // outgoing feedback net
//	wire clock_in_copy;
//	if (CLK_FEEDBACK=="CLKFBOUT") begin
	assign fb_in = fb_out;
//	assign clock_in_copy = clock_in;
		//localparam COMPENSATION = "INTERNAL";
//	end else begin // "CLKOUT0"
//		BUFIO2 #(.DIVIDE(1), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("TRUE")) boopy (.I(clock_in), .DIVCLK(clock_in_copy), .IOCLK(), .SERDESSTROBE());
//		BUFIO2FB #(.DIVIDE_BYPASS("TRUE")) schmoopy (.I(clock_nx_fb), .O(fb_in));
//		//assign fb_in = clock_nx;
//		//localparam COMPENSATION = "EXTERNAL";
//	end
	PLL_ADV #(
		.SIM_DEVICE("SPARTAN6"),
		.CLK_FEEDBACK(CLK_FEEDBACK), // "CLKFBOUT" or "CLKOUT0"
		.BANDWIDTH("OPTIMIZED"), // "high", "low" or "optimized"
		.CLKFBOUT_PHASE(0.0), // phase shift (degrees) of all output clocks
		.CLKIN1_PERIOD(CLKIN_PERIOD), // clock period (ns) of input clock on clkin1
		.CLKIN2_PERIOD(CLKIN_PERIOD), // clock period (ns) of input clock on clkin2
		.DIVCLK_DIVIDE(PLLD), // division factor for all clocks (1 to 52)
		.CLKFBOUT_MULT(PLLX), // multiplication factor for all output clocks
		.CLKOUT0_DIVIDE(EXTRA_DIVIDE), // division factor for clkout0 (1 to 128)
		.CLKOUT1_DIVIDE(EXTRA_DIVIDE*BIT_DEPTH), // division factor for clkout1 (1 to 128)
		.CLKOUT2_DIVIDE(EXTRA_DIVIDE*BIT_DEPTH), // division factor for clkout2 (1 to 128)
		.CLKOUT3_DIVIDE(EXTRA_DIVIDE*BIT_DEPTH), // division factor for clkout3 (1 to 128)
		.CLKOUT4_DIVIDE(EXTRA_DIVIDE*BIT_DEPTH), // division factor for clkout4 (1 to 128)
		.CLKOUT5_DIVIDE(EXTRA_DIVIDE*BIT_DEPTH), // division factor for clkout5 (1 to 128)
		.CLKOUT0_PHASE(0.0), // phase shift (degrees) for clkout0 (0.0 to 360.0)
		.CLKOUT1_PHASE(PHASE), // phase shift (degrees) for clkout1 (0.0 to 360.0)
		.CLKOUT2_PHASE(PHASE2345+1*360/BIT_DEPTH), // phase shift (degrees) for clkout2 (0.0 to 360.0)
		.CLKOUT3_PHASE(PHASE2345+2*360/BIT_DEPTH), // phase shift (degrees) for clkout3 (0.0 to 360.0)
		.CLKOUT4_PHASE(PHASE2345+3*360/BIT_DEPTH), // phase shift (degrees) for clkout4 (0.0 to 360.0)
		.CLKOUT5_PHASE(PHASE2345+4*360/BIT_DEPTH), // phase shift (degrees) for clkout5 (0.0 to 360.0)
		.CLKOUT0_DUTY_CYCLE(0.5), // duty cycle for clkout0 (0.01 to 0.99)
		.CLKOUT1_DUTY_CYCLE(0.5), // duty cycle for clkout1 (0.01 to 0.99)
		.CLKOUT2_DUTY_CYCLE(0.5), // duty cycle for clkout2 (0.01 to 0.99)
		.CLKOUT3_DUTY_CYCLE(0.5), // duty cycle for clkout3 (0.01 to 0.99)
		.CLKOUT4_DUTY_CYCLE(0.5), // duty cycle for clkout4 (0.01 to 0.99)
		.CLKOUT5_DUTY_CYCLE(0.5), // duty cycle for clkout5 (0.01 to 0.99)
		.COMPENSATION(COMPENSATION), // "SYSTEM_SYNCHRONOUS", "SOURCE_SYNCHRONOUS", "INTERNAL", "EXTERNAL", "DCM2PLL", "PLL2DCM"
		.REF_JITTER(0.200) // input reference jitter (0.000 to 0.999 ui%)
	) pll_adv_inst (
		.RST(reset), // asynchronous pll reset
		.LOCKED(pll_is_locked), // active high pll lock signal
		.CLKFBIN(fb_in), // clock feedback input
		.CLKFBOUT(fb_out), // clock feedback output
		.CLKIN1(clock_in), // primary clock input
		.CLKOUT0(clock_nx), // *n clock for transmitter
		.CLKOUT1(clock_1x), // *1 clock for BUFG
		.CLKOUT2(clock_1x_1), //
		.CLKOUT3(clock_1x_2), //
		.CLKOUT4(clock_1x_3), //
		.CLKOUT5(clock_1x_4), //
		.CLKFBDCM(), // output feedback signal used when pll feeds a dcm
		.CLKOUTDCM0(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM1(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM2(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM3(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM4(), // one of six clock outputs to connect to the dcm
		.CLKOUTDCM5(), // one of six clock outputs to connect to the dcm
		.DO(), // dynamic reconfig data output (16-bits)
		.DRDY(), // dynamic reconfig ready output
		.CLKIN2(1'b0), // secondary clock input
		.CLKINSEL(1'b1), // selects '1' = clkin1, '0' = clkin2
		.DADDR(5'b00000), // dynamic reconfig address input (5-bits)
		.DCLK(1'b0), // dynamic reconfig clock input
		.DEN(1'b0), // dynamic reconfig enable input
		.DI(16'h0000), // dynamic reconfig data input (16-bits)
		.DWE(1'b0), // dynamic reconfig write enable input
		.REL(1'b0) // used to force the state of the PFD outputs (test only)
	);
endmodule

module oserdes_pll #(
	// seems global mode is only possible for bit clocks that fit on the gbuf network (max 400 MHz)
	parameter SCOPE = "BUFPLL", // can be "BUFIO2" (525 MHz max), "BUFPLL" (1050 MHz max) or "GLOBAL" (400 MHz max) for speed grade 3
	parameter BIT_DEPTH = 8, // how many fast_clock cycles per word_clock (same as previous definition of WIDTH parameter)
	parameter MODE = "WORD_CLOCK_IN", // can be "WORD_CLOCK_IN" or "BIT_CLOCK_IN"
	parameter CLKIN_PERIOD = 6.4,
	parameter PHASE = 0.0,
	parameter PLLD=5,
	parameter PLLX=32,
	parameter EXTRA_DIVIDE = 1,
	parameter CLK_FEEDBACK = "CLKFBOUT"
) (
	input clock_in, input reset, output word_clock_out,
	output serializer_clock_out, output serializer_strobe_out, output locked
);
	wire clock_1x, clock_nx;
	wire pll_is_locked; // Locked output from PLL
	//if (SCOPE == "BUFPLL" | SCOPE == "GLOBAL" | MODE == "WORD_CLOCK_IN") begin
	wire buffered_pll_is_locked_and_strobe_is_aligned;
	if (MODE == "WORD_CLOCK_IN") begin
		wire rawclock_1x_plladv;
		wire rawclock_nx_plladv;
		simpll #(
			.BIT_DEPTH(BIT_DEPTH),
			.CLKIN_PERIOD(CLKIN_PERIOD),
			.PHASE(PHASE),
			.PLLD(PLLD),
			.PLLX(PLLX),
			.EXTRA_DIVIDE(EXTRA_DIVIDE)
//			.CLK_FEEDBACK(CLK_FEEDBACK)
		) simon (
			.clock_in(clock_in),
			.reset(reset),
//			.clock_nx_fb(serializer_clock_out),
			.pll_is_locked(pll_is_locked),
			.clock_1x(rawclock_1x_plladv),
			.clock_1x_1(),
			.clock_1x_2(),
			.clock_1x_3(),
			.clock_1x_4(),
			.clock_nx(rawclock_nx_plladv)
		);
		if (SCOPE == "BUFIO2") begin
			BUFIO2 #(
				.DIVIDE(BIT_DEPTH), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")
			) simon1 (
				.I(rawclock_nx_plladv), .DIVCLK(clock_1x), .IOCLK(clock_nx), .SERDESSTROBE(serializer_strobe_out)
			);
			assign buffered_pll_is_locked_and_strobe_is_aligned = 1;
			assign serializer_clock_out = clock_nx;
		end else if (SCOPE == "BUFPLL") begin
			assign clock_1x = rawclock_1x_plladv;
			BUFPLL #(
				.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
				.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
			) tx_bufpll_inst_1 (
				.PLLIN(rawclock_nx_plladv), // PLL Clock input
				.GCLK(word_clock_out), // Global Clock input
				.LOCKED(pll_is_locked), // Clock0 locked input
				.IOCLK(serializer_clock_out), // Output PLL Clock
				.LOCK(buffered_pll_is_locked_and_strobe_is_aligned), // BUFPLL Clock and strobe locked
				.SERDESSTROBE(serializer_strobe_out) // Output SERDES strobe
			);
		end
	end else if (MODE == "BIT_CLOCK_IN") begin
		wire serializer_strobe_out_bufio2;
		BUFIO2 #(
			.DIVIDE(BIT_DEPTH), .USE_DOUBLER("FALSE"), .I_INVERT("FALSE"), .DIVIDE_BYPASS("FALSE")
		) simon2 (
			.I(clock_in), .DIVCLK(clock_1x), .IOCLK(clock_nx), .SERDESSTROBE(serializer_strobe_out_bufio2)
		);
		if (SCOPE == "BUFPLL") begin
			wire serializer_strobe_out_bufpll;
			BUFPLL #(
				.ENABLE_SYNC("TRUE"), // synchronizes strobe to gclk input
				//.ENABLE_SYNC("FALSE"), // does *not* try to synchronize strobe to gclk input
				.DIVIDE(BIT_DEPTH) // PLLIN divide-by value to produce SERDESSTROBE (1 to 8); default 1
			) tx_bufpll_inst_2 (
				.PLLIN(clock_nx), // PLL Clock input
				.GCLK(word_clock_out), // Global Clock input
				.LOCKED(pll_is_locked), // Clock0 locked input
				.IOCLK(serializer_clock_out), // Output PLL Clock
				.LOCK(buffered_pll_is_locked_and_strobe_is_aligned), // BUFPLL Clock and strobe locked
				.SERDESSTROBE(serializer_strobe_out_bufpll) // Output SERDES strobe
			);
			assign serializer_strobe_out = serializer_strobe_out_bufpll;
		end else begin
			assign serializer_clock_out = clock_nx;
			assign serializer_strobe_out = serializer_strobe_out_bufio2;
			assign buffered_pll_is_locked_and_strobe_is_aligned = 1;
		end
	end
	assign locked = pll_is_locked & buffered_pll_is_locked_and_strobe_is_aligned;
	BUFG bufg_tx (.I(clock_1x), .O(word_clock_out));
endmodule

//	odelay_fixed #(.AMOUNT()) beckham (.bit_in(), .bit_out());
// ug381 says should limit fixed odelays to 3/4 of a bit period
// spartan6 errata (EN148) says not to go above a delay tap value of 6 when used in ODELAY mode to get full performance (1080 MHz)
// otherwise, limit the data rate to 800 MHz for the commercial grade -3 part
	// when 50->125 MHz is from a dcm_clkgen:
	// without an odelay present, the measured delay between coax[0] and coax[4] rising edges is -1995 ps (sigma 12 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -1139 ps (sigma 36 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd1})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -1121 ps (sigma 39 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd2})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -1070 ps (sigma 42 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd3})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -1032 ps (sigma 42 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd4})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -1001 ps (sigma 44 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd5})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); //  -963 ps (sigma 45 ps)
	//odelay_fixed #(.AMOUNT({5'd0, 3'd6})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); //  -913 ps
	// range is 20-50 ps per tap, linear fit is 38 ps per tap
	// when 50->125 MHz is from a pll_adv:
	//odelay_fixed #(.AMOUNT({5'd0, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // ps (sigma ps)
	//odelay_fixed #(.AMOUNT({5'd1, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // 221 ps (sigma 55 ps) 9.png
	//odelay_fixed #(.AMOUNT({5'd2, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // 468 ps (sigma 69 ps) 10.png
	//odelay_fixed #(.AMOUNT({5'd4, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // 109 ps (sigma 100 ps) 13.png
	//odelay_fixed #(.AMOUNT({5'd8, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -168 ps (sigma 44 ps) 12.png
	//odelay_fixed #(.AMOUNT({5'd16, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -173 ps (sigma 45 ps) 11.png (distorted)
	// when 50->125 MHz is from a dcm_clkgen:
	//odelay_fixed #(.AMOUNT({5'd0, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // -78 ps (sigma 43 ps) 14.png
	//odelay_fixed #(.AMOUNT({5'd1, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // 163 ps (sigma 57 ps) 16.png
	//odelay_fixed #(.AMOUNT({5'd2, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // 519 ps (sigma 67 ps) 17.png
	//odelay_fixed #(.AMOUNT({5'd4, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // ps (sigma ps)
	//odelay_fixed #(.AMOUNT({5'd8, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // ps (sigma ps)
	//odelay_fixed #(.AMOUNT({5'd16, 3'd0})) twoturntables (.bit_in(pre_coax_4), .bit_out(coax[4])); // ps (sigma ps)
module odelay_fixed #(
	parameter AMOUNT = 0
) (
	// "With IDELAY_TYPE programming FIXED or DEFAULT any active input pins INC, RST, CE and C are not used and will be ignored"
	// "The use IDELAY_TYPE of FIXED or DEFAULT means that pins CLK, IOCLK0 and IOCLK1 are ignored"
	input bit_in,
	output bit_out
);
// from Xilinx HDL Libraries Guide, version 14.5 (ug615)
	IODELAY2 #(
		.COUNTER_WRAPAROUND("WRAPAROUND"), // "STAY_AT_LIMIT" or "WRAPAROUND"
		.DATA_RATE("SDR"), // "SDR" or "DDR"
		.DELAY_SRC("ODATAIN"), // "IO", "ODATAIN" or "IDATAIN"
		.IDELAY2_VALUE(0), // Delay value when IDELAY_MODE="PCI" (0-255)
		.IDELAY_MODE("NORMAL"), // "NORMAL" or "PCI"
		.IDELAY_TYPE("FIXED"), // "FIXED", "DEFAULT", "VARIABLE_FROM_ZERO", "VARIABLE_FROM_HALF_MAX" or "DIFF_PHASE_DETECTOR"
		.IDELAY_VALUE(0), // Amount of taps for fixed input delay (0-255)
		.ODELAY_VALUE(AMOUNT), // Amount of taps for fixed output delay (0-255)
		.SERDES_MODE("NONE"), // "NONE", "M*****" or "S****" (idelay only according to ug381)
		.SIM_TAPDELAY_VALUE(75) // Per tap delay used for simulation in ps
	) beck (
		.CLK(1'b0), // 1-bit input: Clock input
		.RST(1'b0), // 1-bit input: Reset to zero or 1/2 of total delay period
		.INC(1'b0), // 1-bit input: Increment / decrement input - "INC should only be asserted High when CE is also asserted High" (ug381)
		.CE(1'b0), // 1-bit input: Enable INC input
		.IOCLK0(1'b0), // 1-bit input: Input from the I/O clock network
		.IOCLK1(1'b0), // 1-bit input: Input from the I/O clock network
		.ODATAIN(bit_in), // 1-bit input: Output data input from output register or OSERDES2.
		.DOUT(bit_out), // 1-bit output: Delayed data output
		.CAL(1'b0), // 1-bit input: Initiate calibration input
		.BUSY(), // 1-bit output: Busy output after CAL
		.T(1'b0), // 1-bit input: 3-state input signal
		.TOUT(), // 1-bit output: Delayed 3-state output
		.IDATAIN(1'b0), // 1-bit input: Data input (connect to top-level port or I/O buffer)
		.DATAOUT(), // 1-bit output: Delayed data output to ISERDES/input register
		.DATAOUT2() // 1-bit output: Delayed data output to general FPGA fabric
	);
endmodule

//	idelay nirvana (.clock(), .reset(), .inc_not_dec(), .strobe(), .bit_clock(), .bit_in(), .bit_out(), .initiate_cal(), .busy());
// spartan6 errata (EN148) says not to go above a delay tap value of 6 when used in ODELAY mode to get full performance (1080 MHz)
// otherwise, limit the data rate to 800 MHz for the commercial grade -3 part
module idelay #(
	parameter MODE = "MASTER" // "NONE", "M*****" or "S****"
) (
	// "The output delay path is only available in a fixed delay"
	input clock,
	input reset,
	input inc_not_dec,
	input strobe,
	input bit_clock,
	input bit_in,
	output bit_out,
	input initiate_cal, // must issue reset after first cal
	output busy
);
// from Xilinx HDL Libraries Guide, version 14.5 (ug615)
	IODELAY2 #(
		.COUNTER_WRAPAROUND("WRAPAROUND"), // "STAY_AT_LIMIT" or "WRAPAROUND"
		.DATA_RATE("SDR"), // "SDR" or "DDR"
		.DELAY_SRC("IDATAIN"), // "IO", "ODATAIN" or "IDATAIN"
		.IDELAY2_VALUE(0), // Delay value when IDELAY_MODE="PCI" (0-255)
		.IDELAY_MODE("NORMAL"), // "NORMAL" or "PCI"
		.IDELAY_TYPE("VARIABLE_FROM_ZERO"), // "FIXED", "DEFAULT", "VARIABLE_FROM_ZERO", "VARIABLE_FROM_HALF_MAX" or "DIFF_PHASE_DETECTOR"
		.IDELAY_VALUE(0), // Amount of taps for fixed input delay (0-255)
		.ODELAY_VALUE(0), // Amount of taps for fixed output delay (0-255)
		.SERDES_MODE(MODE), // "NONE", "M*****" or "S****" (idelay only according to ug381)
		.SIM_TAPDELAY_VALUE(75) // Per tap delay used for simulation in ps
	) stp (
		.CLK(clock), // 1-bit input: Clock input
		.RST(reset), // 1-bit input: Reset to zero or 1/2 of total delay period
		.INC(inc_not_dec && strobe), // 1-bit input: Increment / decrement input - "INC should only be asserted High when CE is also asserted High" (ug381)
		.CE(strobe), // 1-bit input: Enable INC input
		.IOCLK0(bit_clock), // 1-bit input: Input from the I/O clock network
		.IOCLK1(1'b0), // 1-bit input: Input from the I/O clock network
		.ODATAIN(1'b0), // 1-bit input: Output data input from output register or OSERDES2.
		.DOUT(), // 1-bit output: Delayed data output
		.CAL(initiate_cal), // 1-bit input: Initiate calibration input
		.BUSY(busy), // 1-bit output: Busy output after CAL
		.T(1'b0), // 1-bit input: 3-state input signal
		.TOUT(), // 1-bit output: Delayed 3-state output
		.IDATAIN(bit_in), // 1-bit input: Data input (connect to top-level port or I/O buffer)
		.DATAOUT(bit_out), // 1-bit output: Delayed data output to ISERDES/input register
		.DATAOUT2() // 1-bit output: Delayed data output to general FPGA fabric
	);
endmodule

